/******************************************************************************
 * Copyright (C) 2015 Luis Amesty                                             *
 * Copyright (C) 2015 AMERP Consulting                                        *
 * This program is free software; you can redistribute it and/or modify it    *
 * under the terms version 2 of the GNU General Public License as published   *
 * by the Free Software Foundation. This program is distributed in the hope   *
 * that it will be useful, but WITHOUT ANY WARRANTY; without even the implied *
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.           *
 * See the GNU General Public License for more details.                       *
 * You should have received a copy of the GNU General Public License along    *
 * with this program; if not, write to the Free Software Foundation, Inc.,    *
  *****************************************************************************/
package org.amerp.process;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.*;
import java.util.*;

import org.amerp.amnmodel.*;
import org.amerp.amnutilities.AttendanceHours;
import org.compiere.util.*;

/** AMNPayrollProcessPayrollAssistProc
 * Description: Generic Class AMNPayrollCreatePayrollAssistProc
 * Called from: AMNPayrollProcessPayrollAssistOneEmployee
 * 				AMNPayrollProcessPayrollAssistOnePeriod
 * 				AMNPayrollProcessPayrollAssistOneAttendanceDay
 * Procedures:
 * CreatePayrollDocumentsAssistProcforEmployeeOneDay
 * getTimestampShifdetailEventTime
 * calcAttendanceValuesofPayrollVars
 * secondsOfTime
 * 
 * @author luisamesty
 *
 */
public class AMNPayrollProcessPayrollAssistProc {
	// PUBLIC VARS

	static CLogger log = CLogger.getCLogger(AMNPayrollProcessPayrollAssistProc.class);
	/**
	 * CreatePayrollDocumentsAssistProcforEmployeeOneDay
	 * @param p_AMN_Contract_ID
	 * @param p_currentDate
	 * @param p_AMN_Period_ID removed
	 * @param p_AMN_Employee_ID
	 * @param p_AMN_Assist_Process_Mode  
	 * 	"0": Clean Records on AMN_Payroll_Assist_Proc 
	 *  "1": Create or Update Records Only from  AMN_Payroll_Assist
	 *  "2": Create or Update Records from  AMN_Payroll_Assist and Fill Default Values from AMN_Shift_Detail
	 *  "3: Create or Update Records from Only from  AMN_Shift_Detail
	 * @return locMsg_Value
	 */
	public static String CreatePayrollDocumentsAssistProcforEmployeeOneDay (int p_AMN_Contract_ID, 
		Timestamp p_Event_Date,  int p_AMN_Employee_ID, String p_AMN_Assist_Process_Mode) {
		
		// LOCAL VARS
		BigDecimal BDZero = BigDecimal.valueOf(0);
		AttendanceHours atthours = new AttendanceHours(BDZero, BDZero, BDZero, BDZero, BDZero, BDZero, "");
		Timestamp Shift_In1=null;
		Timestamp Shift_In2=null;
		Timestamp Shift_Out1=null;
		Timestamp Shift_Out2=null;
		Timestamp defShift_In1 = null;
		Timestamp defShift_In2 = null;
		Timestamp defShift_Out1 = null;
		Timestamp defShift_Out2 = null;
		Boolean amnpayrollassistproc = false;
		Boolean isError=false;
		BigDecimal Shift_HED, Shift_HEN, Shift_HND, Shift_HNN;
		BigDecimal Shift_Attendance,Shift_AttendanceBonus;
		String locMsg_Value="";	
		String locMsg_Value_Events="";
		int AMN_Shift_ID=0;
	    Boolean Descanso= false;
	    Boolean	Excused = false;
	    Timestamp Event_Time; 
	    int p_AD_Client_ID=0;
	    int p_AD_Org_ID=0;
	    int defAMN_Shift_ID=0;
	    int AssistCounter =0;
	    // Get p_AD_Client_ID,p_AD_Org_ID from Employee
	    MAMN_Employee amnemployee = new MAMN_Employee(Env.getCtx(), p_AMN_Employee_ID, null);
	    p_AD_Org_ID=amnemployee.getAD_Org_ID();
	    p_AD_Client_ID=amnemployee.getAD_Client_ID();
	    // Get Employee AMN_Shift_ID by default
	    defAMN_Shift_ID = amnemployee.getAMN_Shift_ID();
	    Shift_HED = BDZero;
		Shift_HEN = BDZero;
		Shift_HND = BDZero;
		Shift_HNN = BDZero;
		Shift_Attendance = BDZero;
		Shift_AttendanceBonus = BDZero;
	    // LOOK FOR Default Shift if exists
	    if (defAMN_Shift_ID == 0) defAMN_Shift_ID =  MAMN_Shift.sqlGetDefaultAMN_Shift_ID(p_AD_Client_ID);
	    // Verify if defAMN_Shift_ID == 0 
	    if (defAMN_Shift_ID == 0) {
		    // Get Default Asisst Input - Output Times referenced to p_Event_date
			locMsg_Value="***** "+Msg.getMsg(Env.getCtx(), "found.none")+" "+
			Msg.getElement(Env.getCtx(), "AMN_Shift_ID")+" "+
		    Msg.getMsg(Env.getCtx(), "default")+ " *******";
	    } else {
		    MAMN_Shift_Detail amnshiftdetail = MAMN_Shift_Detail.findByEventDate(Env.getCtx(), defAMN_Shift_ID, p_Event_Date);
		    //	log.warning("Shift_In1:"+amnshiftdetail.getShift_In1().toString());
		    // Verify p_Event_Date - amnshiftdetail - amnshiftdetail.isActive() == false
		    if (p_Event_Date==null ) {
		    	locMsg_Value=locMsg_Value+Msg.getMsg(Env.getCtx(), "Error")+" "+locMsg_Value+Msg.getMsg(Env.getCtx(), "Date")+":"+p_Event_Date+" ";
		    	isError=true;
		    }
		    if ( p_Event_Date!=null && amnshiftdetail == null) {
		    	locMsg_Value=locMsg_Value+Msg.getMsg(Env.getCtx(), "Error")+Msg.getElement(Env.getCtx(), "AMN_Shift_Detail_ID")+":"+null+" ";
		    	isError=true;
		    } 
		    if ( p_Event_Date!=null && amnshiftdetail != null && amnshiftdetail.isActive() == false) {		
		    	locMsg_Value=locMsg_Value+Msg.getMsg(Env.getCtx(), "Error")+Msg.getElement(Env.getCtx(), "AMN_Shift_Detail_ID")+": "+
		    		Msg.getElement(Env.getCtx(),"isActive")+"=N";
		    	isError=true;
		    }
		    if (isError) {
		    	return locMsg_Value;
		    }
		    // Get Default Assist Input - Output Times referenced to p_Event_date
			defShift_In1 = getTimestampShifdetailEventTime(p_Event_Date,amnshiftdetail.getShift_In1());
			defShift_In2 = getTimestampShifdetailEventTime(p_Event_Date,amnshiftdetail.getShift_In2());
			defShift_Out1 = getTimestampShifdetailEventTime(p_Event_Date,amnshiftdetail.getShift_Out1());
			defShift_Out2 = getTimestampShifdetailEventTime(p_Event_Date,amnshiftdetail.getShift_Out2());
		    // Get Descanso from AMN_Shift_Detail
			Descanso= amnshiftdetail.isDescanso();	    
			//
		    String sql = "SELECT " + 
					"amn_shift_id, " + 
					"dayofweek, " + 
					"event_time, " + 
					"event_type " + 
					"FROM amn_payroll_assist " + 
					"WHERE amn_employee_id=? " + 
					"AND event_date =  '" + p_Event_Date +"' "+
					"AND isactive ='Y' "+
					"ORDER BY event_time "
					 ;        		
			PreparedStatement pstmt1 = null;
			ResultSet rs = null;
			try
			{
				pstmt1 = DB.prepareStatement(sql, null);
	            pstmt1.setInt (1, p_AMN_Employee_ID);
	    		//locMsg_Value=locMsg_Value+sql+" \n";
				rs = pstmt1.executeQuery();
				while (rs.next())
				{
					AMN_Shift_ID = rs.getInt(1);
					Event_Time 	 = rs.getTimestamp(3);
		            if (Event_Time != null) {
		            	locMsg_Value_Events = locMsg_Value_Events + Event_Time.toString().substring(11,16)+"  ";
		            } else {
		            	locMsg_Value_Events = locMsg_Value_Events + Event_Time+"  ";
		            }
					AssistCounter = AssistCounter + 1;
					switch (AssistCounter) {
						case 1:
							// Set Asisst Input - Output Times referenced to p_Event_date
							Shift_In1 = getTimestampShifdetailEventTime(p_Event_Date,Event_Time);
							break;
						case 2:
							// Set Asisst Input - Output Times referenced to p_Event_date
							Shift_Out1 = getTimestampShifdetailEventTime(p_Event_Date,Event_Time);
							break;
						case 3:
							// Set Asisst Input - Output Times referenced to p_Event_date
							Shift_In2 = getTimestampShifdetailEventTime(p_Event_Date,Event_Time);
							break;
						case 4:
							// Set Asisst Input - Output Times referenced to p_Event_date
							Shift_Out2 = getTimestampShifdetailEventTime(p_Event_Date,Event_Time);
							break;		
					}
				}	
				// Verify for AssistCounter AND AMN_Shift_ID
				if (AssistCounter == 0 ) {
					AMN_Shift_ID = MAMN_Shift.sqlGetDefaultAMN_Shift_ID(p_AD_Client_ID);
				}
				if (AMN_Shift_ID ==0) {
					locMsg_Value="***** "+Msg.getMsg(Env.getCtx(), "found.none")+" "+
					Msg.getElement(Env.getCtx(), "AMN_Shift_ID")+" "+
					Msg.getMsg(Env.getCtx(), "default")+ " *******";
				} else {
					// Process MODE: p_AMN_Assist_Process_Mode
					// *   "0": Clean Records on AMN_Payroll_Assist_Proc 
					// *   "1": Create or Update Records Only from  AMN_Payroll_Assist
					// *   "2": Create or Update Records from  AMN_Payroll_Assist and Fill Default Values from AMN_Shift_Detail
					// *   "3: Create or Update Records from Only from  AMN_Shift_Detail
					switch (p_AMN_Assist_Process_Mode) {
						//  "0": Clean Records on AMN_Payroll_Assist_Proc 
						case "0":
							//  "0": Clean Records on AMN_Payroll_Assist_Proc 
							locMsg_Value=locMsg_Value+Msg.getElement(Env.getCtx(), "AMN_Shift_ID")+":"+AMN_Shift_ID+" "+
									Msg.getMsg(Env.getCtx(),"Date")+":"+p_Event_Date.toString().substring(0,10);
							amnpayrollassistproc = MAMN_Payroll_Assist_Proc.createAmnPayrollAssistProc(
									Env.getCtx(), Env.getLanguage(Env.getCtx()).getLocale(), 
									p_AD_Client_ID, p_AD_Org_ID,
									p_AMN_Employee_ID, p_Event_Date, AMN_Shift_ID,
									Descanso, Excused ,
									null, null, 
									null, null,
									BDZero, BDZero, 
									BDZero, BDZero,
									BDZero, BDZero,
									"Clean") ;
							break;
						//   "1": Create or Update Records Only from  AMN_Payroll_Assist
						case "1":
							//   "1": Create or Update Records Only from  AMN_Payroll_Assist
							locMsg_Value=locMsg_Value+Msg.getElement(Env.getCtx(), "AMN_Shift_ID")+":"+AMN_Shift_ID+" "+
									Msg.getMsg(Env.getCtx(),"Date")+":"+p_Event_Date.toString().substring(0,10)+" "+
									Msg.getMsg(Env.getCtx(),"Event")+":"+locMsg_Value_Events;
							// Calculate Hours
							atthours= calcAttendanceValuesofPayrollVars(
									p_Event_Date, AMN_Shift_ID, 
									Shift_In1, Shift_Out1, Shift_In2, Shift_Out2);
							Shift_HED = atthours.getHR_HED();
							Shift_HEN = atthours.getHR_HEN();
							Shift_HND = atthours.getHR_HND();
							Shift_HNN = atthours.getHR_HNN();
							Shift_Attendance = atthours.getDAY_ATT();  
							Shift_AttendanceBonus = atthours.getDAY_ATTB(); 
							locMsg_Value=locMsg_Value+" "+atthours.getHR_Message().trim();
							// Create or Update MAMN_Payroll_Assist_Proc Record
							amnpayrollassistproc = MAMN_Payroll_Assist_Proc.createAmnPayrollAssistProc(
									Env.getCtx(), Env.getLanguage(Env.getCtx()).getLocale(), 
									p_AD_Client_ID, p_AD_Org_ID,
									p_AMN_Employee_ID, p_Event_Date, AMN_Shift_ID,
									Descanso, Excused ,
									Shift_In1, Shift_Out1, 
									Shift_In2, Shift_Out2,
									Shift_HED, Shift_HEN, 
									Shift_HND, Shift_HNN,
									Shift_Attendance, Shift_AttendanceBonus, 
									atthours.getHR_Message()) ;
							break;
						//  "2": Create or Update Records from  AMN_Payroll_Assist and Fill Default Values from AMN_Shift_Detail
						case "2":
							//  "2": Create or Update Records from  AMN_Payroll_Assist and Fill Default Values from AMN_Shift_Detail
							if (Shift_In1==null) Shift_In1=defShift_In1;
							if (Shift_In2==null) Shift_In2=defShift_In2;
							if (Shift_Out1==null) Shift_Out1=defShift_Out1;
							if (Shift_Out2==null) Shift_Out2=defShift_Out2;
							locMsg_Value=locMsg_Value+Msg.getElement(Env.getCtx(), "AMN_Shift_ID")+":"+AMN_Shift_ID+" "+
									Msg.getMsg(Env.getCtx(),"Date")+":"+p_Event_Date.toString().substring(0,10)+" "+
									Msg.getMsg(Env.getCtx(),"Event")+":"+locMsg_Value_Events;
							// Calculate Hours
							atthours= calcAttendanceValuesofPayrollVars(
									p_Event_Date, AMN_Shift_ID, 
									Shift_In1, Shift_Out1, Shift_In2, Shift_Out2);
							Shift_HED = atthours.getHR_HED();
							Shift_HEN = atthours.getHR_HEN();
							Shift_HND = atthours.getHR_HND();
							Shift_HNN = atthours.getHR_HNN();
							Shift_Attendance = atthours.getDAY_ATT();  
							Shift_AttendanceBonus = atthours.getDAY_ATTB(); 
							locMsg_Value=locMsg_Value+" "+atthours.getHR_Message().trim();
							// Create or Update MAMN_Payroll_Assist_Proc Record
							amnpayrollassistproc = MAMN_Payroll_Assist_Proc.createAmnPayrollAssistProc(
									Env.getCtx(), Env.getLanguage(Env.getCtx()).getLocale(), 
									p_AD_Client_ID, p_AD_Org_ID,
									p_AMN_Employee_ID, p_Event_Date, AMN_Shift_ID ,
									Descanso, Excused ,
									Shift_In1, Shift_Out1, 
									Shift_In2, Shift_Out2,
									Shift_HED, Shift_HEN, 
									Shift_HND, Shift_HNN,
									Shift_Attendance, Shift_AttendanceBonus, 
									atthours.getHR_Message()) ;
							break;
						//  "3: Create or Update Records from Only from  AMN_Shift_Detail
						case "3":
							//  "3: Create or Update Records from Only from  AMN_Shift_Detail
							if ( defShift_In1 != null && defShift_Out1 != null && defShift_In2 != null && defShift_Out2 != null) { 
								locMsg_Value=locMsg_Value+Msg.getElement(Env.getCtx(), "AMN_Shift_ID")+":"+defAMN_Shift_ID+" "+
									Msg.getMsg(Env.getCtx(),"Date")+":"+p_Event_Date.toString().substring(0,10)+" "+
									Msg.getMsg(Env.getCtx(),"Event")+":"+
									defShift_In1.toString().substring(11,16)+"  "+defShift_Out1.toString().substring(11,16)+"  "+
									defShift_In2.toString().substring(11,16)+"  "+defShift_Out2.toString().substring(11,16); 
							} else {
								locMsg_Value=locMsg_Value+Msg.getElement(Env.getCtx(), "AMN_Shift_ID")+":"+defAMN_Shift_ID+" "+
										Msg.getMsg(Env.getCtx(),"Date")+":"+p_Event_Date.toString().substring(0,10)+" "+
										Msg.getMsg(Env.getCtx(),"Event")+":"+
										defShift_In1+"  "+defShift_Out1+"  "+defShift_In2+"  "+defShift_Out2; 		
							}
							// Calculate Hours
							atthours= calcAttendanceValuesofPayrollVars(
									p_Event_Date, defAMN_Shift_ID, 
									defShift_In1, defShift_Out1, defShift_In2, defShift_Out2);
							Shift_HED = atthours.getHR_HED();
							Shift_HEN = atthours.getHR_HEN();
							Shift_HND = atthours.getHR_HND();
							Shift_HNN = atthours.getHR_HNN();
							Shift_Attendance = atthours.getDAY_ATT();  
							Shift_AttendanceBonus = atthours.getDAY_ATTB(); 
							locMsg_Value=locMsg_Value+" "+atthours.getHR_Message().trim();
							// log.warning("Horas HND:"+Shift_HND+"  HED:"+Shift_HED+"Horas HNN:"+Shift_HNN+"  HED:"+Shift_HEN);
							// Create or Update MAMN_Payroll_Assist_Proc Record
							amnpayrollassistproc = MAMN_Payroll_Assist_Proc.createAmnPayrollAssistProc(
									Env.getCtx(), Env.getLanguage(Env.getCtx()).getLocale(), 
									p_AD_Client_ID, p_AD_Org_ID,
									p_AMN_Employee_ID, p_Event_Date, defAMN_Shift_ID ,
									Descanso, Excused ,
									defShift_In1, defShift_Out1, 
									defShift_In2, defShift_Out2,
									Shift_HED, Shift_HEN, 
									Shift_HND, Shift_HNN,
									Shift_Attendance, Shift_AttendanceBonus, 
//									"test") ;					
//									atthours.getHR_HED(), atthours.getHR_HEN(), 
//									atthours.getHR_HND(), atthours.getHR_HNN(),
									atthours.getHR_Message()) ;	
							break;	
						//  "4: Update Records (Only HND,HNN,HED,HEN,Attendance,AttendanceBonus
						//        from  AMN_Shift_Detail_Proc
						case "4":
							// ** OJO ** NOT IMPLEMENTED YET 
							// "4: Update Records (Only HND,HNN,HED,HEN,Attendance,AttendanceBonus
							//        from  AMN_Shift_Detail_Proc
							if ( defShift_In1 != null && defShift_Out1 != null && defShift_In2 != null && defShift_Out2 != null) { 
								locMsg_Value=locMsg_Value+Msg.getElement(Env.getCtx(), "AMN_Shift_ID")+":"+defAMN_Shift_ID+" "+
									Msg.getMsg(Env.getCtx(),"Date")+":"+p_Event_Date.toString().substring(0,10)+" "+
									Msg.getMsg(Env.getCtx(),"Event")+":"+
									defShift_In1.toString().substring(11,16)+"  "+defShift_Out1.toString().substring(11,16)+"  "+
									defShift_In2.toString().substring(11,16)+"  "+defShift_Out2.toString().substring(11,16); 
							} else {
								locMsg_Value=locMsg_Value+Msg.getElement(Env.getCtx(), "AMN_Shift_ID")+":"+defAMN_Shift_ID+" "+
										Msg.getMsg(Env.getCtx(),"Date")+":"+p_Event_Date.toString().substring(0,10)+" "+
										Msg.getMsg(Env.getCtx(),"Event")+":"+
										defShift_In1+"  "+defShift_Out1+"  "+defShift_In2+"  "+defShift_Out2; 		
							}
							// Look for 
							// Calculate Hours
							atthours= calcAttendanceValuesofPayrollVars(
									p_Event_Date, defAMN_Shift_ID, 
									defShift_In1, defShift_Out1, defShift_In2, defShift_Out2);
							Shift_HED = atthours.getHR_HED();
							Shift_HEN = atthours.getHR_HEN();
							Shift_HND = atthours.getHR_HND();
							Shift_HNN = atthours.getHR_HNN();
							Shift_Attendance = atthours.getDAY_ATT();  
							Shift_AttendanceBonus = atthours.getDAY_ATTB(); 
							locMsg_Value=locMsg_Value+" "+atthours.getHR_Message().trim();
							// log.warning("Horas HND:"+Shift_HND+"  HED:"+Shift_HED+"Horas HNN:"+Shift_HNN+"  HED:"+Shift_HEN);
							// Create or Update MAMN_Payroll_Assist_Proc Record
							amnpayrollassistproc = MAMN_Payroll_Assist_Proc.createAmnPayrollAssistProc(
									Env.getCtx(), Env.getLanguage(Env.getCtx()).getLocale(), 
									p_AD_Client_ID, p_AD_Org_ID,
									p_AMN_Employee_ID, p_Event_Date, defAMN_Shift_ID ,
									Descanso, Excused ,
									defShift_In1, defShift_Out1, 
									defShift_In2, defShift_Out2,
									Shift_HED, Shift_HEN, 
									Shift_HND, Shift_HNN,
									Shift_Attendance, Shift_AttendanceBonus, 
//									"test") ;					
//									atthours.getHR_HED(), atthours.getHR_HEN(), 
//									atthours.getHR_HND(), atthours.getHR_HNN(),
									atthours.getHR_Message()) ;	
							break;	
					}				
					if (amnpayrollassistproc) {
						locMsg_Value=locMsg_Value+"  OK";
					} else {
						locMsg_Value=locMsg_Value+"  **ERROR**";
					}
				}
			}
		    catch (SQLException e)
		    {
		    }
			finally
			{
				DB.close(rs, pstmt1);
				rs = null; pstmt1 = null;
			}
	    }
		return locMsg_Value;
	}
	
	/**
	 * Procedure: getTimestampShifdetailEventTime
	 * Return Timestamp Concatenated from Event_date + Event_time 
	 * @param p_Event_Date (Timestamp event Date)
	 * @param p_Event_Time (Timestamp event Time)
	 * @return Timestamp
	 */
	public static  Timestamp getTimestampShifdetailEventTime(Timestamp p_Event_Date, Timestamp p_Event_Time)
	{
		
		// Set AssistDate Var
		GregorianCalendar dCal = new GregorianCalendar();
		Timestamp retValue=null;
		if (p_Event_Date == null) {
			retValue=null;
			return retValue;
		}
		dCal.setTime(p_Event_Date);
		// Set AssistTime Var
		Calendar tCal = Calendar.getInstance();
		// Verify if p_Event_Time is null
		if (p_Event_Time == null) {
			tCal.setTime(p_Event_Date);
			dCal.set(Calendar.HOUR_OF_DAY, 0);
			dCal.set(Calendar.MINUTE, 0);
			dCal.set(Calendar.SECOND, 0);
			dCal.set(Calendar.MILLISECOND, 0);
			retValue=null;
		} else {
			tCal.setTime(p_Event_Time);
			// Set AssistTime Values to AssistDate Var
			dCal.set(Calendar.HOUR_OF_DAY, tCal.get(Calendar.HOUR_OF_DAY));
			dCal.set(Calendar.MINUTE, tCal.get(Calendar.MINUTE));
			dCal.set(Calendar.SECOND, tCal.get(Calendar.SECOND));
			dCal.set(Calendar.MILLISECOND, tCal.get(Calendar.MILLISECOND));
			retValue=new Timestamp(dCal.getTimeInMillis());
		}		 
		return retValue;
		
	}


	/**
	 * Procedure: calcAttendanceValuesofPayrollVars
	 * Description: Calculates Values of HND,HNN,HED,HEN,Attendance,AttendanceBonus
	 * 				From AMN_Payroll_Assist  Values 
	 * 				( p_Event_Date, p_AMN_Shift_ID, p_Shift_In1, p_Shift_Out1, p_Shift_In2, p_Shift_Out2)
	 * @param Timestamp Event_Date
	 * @param Integer p_AMN_Shift_ID
	 * @param Timestamp p_Shift_In1
	 * @param Timestamp p_Shift_Out1
	 * @param Timestamp p_Shift_In2
	 * @param Timestamp p_Shift_Out2
	 * @return AttendanceHours Array
	 * All event Times are Normalized to Event_Date
	 */
	public static AttendanceHours calcAttendanceValuesofPayrollVars(
			Timestamp p_Event_Date, Integer p_AMN_Shift_ID, 
			Timestamp p_Shift_In1, Timestamp p_Shift_Out1, 
			Timestamp p_Shift_In2, Timestamp p_Shift_Out2)
	{
		Boolean bParamEmpty=false;
		Boolean bParamEmpty1=false;
		Boolean bParamEmpty2=false;
		Boolean bDescanso=false;
		String sParamEmpty="";
		String sParamEmpty1="";
		String sParamEmpty2="";
		BigDecimal BDZero = BigDecimal.valueOf(0);
		Long lHalfDay = (Long.valueOf(1));
		//long lHalfDaymin = (long) 3*3600;
		long lHalfDaymin = (long) 1;
		long lErrorAttendance= (long) 120;		// 120 Seconds (2 Minutes)
		//long Vars
		long lShift_HED = (long) 0;
		long lShift_HEN = (long) 0;
		long lShift_HND = (long) 0;
		long lShift_HNN = (long) 0;
		long lShift_Attendance = (long) 0;
		long lShift_AttendanceBonus = (long) 0;
		long lShift_In1=(long) 0;
		long lShift_Out1=(long) 0;
		long lShift_In2=(long) 0;
		long lShift_Out2=(long) 0;
		// Calendar Vars
		Calendar calShift_In1 = Calendar.getInstance();
		Calendar calShift_Out1 = Calendar.getInstance();
		Calendar calShift_In2 = Calendar.getInstance();
		Calendar calShift_Out2 = Calendar.getInstance();
		// Attendance Values Structure 
		AttendanceHours attendancehours = new AttendanceHours(BDZero, BDZero, BDZero, BDZero, BDZero, BDZero, "");
		// defaul Attendance Values Structure 
		AttendanceHours defattendancehours = new AttendanceHours(BDZero, BDZero, BDZero, BDZero, BDZero, BDZero, "");
		// Determines Default Shift Times Values
	    MAMN_Shift_Detail amnshiftdetail = MAMN_Shift_Detail.findByEventDate(Env.getCtx(), p_AMN_Shift_ID, p_Event_Date);
	    // Determines Default Attendance Values HND,HNN,HED,HEN,Attendance,AttendanceBonus from AMN_Shift_Detail
		defattendancehours = calcDefaultAttendanceValuesofPayrollVars(p_Event_Date, p_AMN_Shift_ID, amnshiftdetail);
	    //log.warning("Shift_In1:"+amnshiftdetail.getShift_In1().toString());
	    // Get Default Asisst Input-Output Times referenced to p_Event_date
		Timestamp defShift_In1 = getTimestampShifdetailEventTime(p_Event_Date,amnshiftdetail.getShift_In1());;
		Timestamp defShift_In2 = getTimestampShifdetailEventTime(p_Event_Date,amnshiftdetail.getShift_In2());;
		Timestamp defShift_Out1 = getTimestampShifdetailEventTime(p_Event_Date,amnshiftdetail.getShift_Out1());
		Timestamp defShift_Out2 = getTimestampShifdetailEventTime(p_Event_Date,amnshiftdetail.getShift_Out2());
		bDescanso=amnshiftdetail.isDescanso();
		// Verify if Any Shift Time is null 1st Half Time
		if ( p_Shift_In1 == null || p_Shift_Out1 == null ) {
			bParamEmpty1=true;
			if (!bDescanso) {
				sParamEmpty1=sParamEmpty1+Msg.getMsg(Env.getCtx(), "Error")+" "+
					Msg.getElement(Env.getCtx(),"AMN_Shift_ID")+" 1:"+
					Msg.getMsg(Env.getCtx(), "found.none")+"\n";
			} else { 
				sParamEmpty1=sParamEmpty1+Msg.getElement(Env.getCtx(),"Descanso")+" ";
			}
		}
		// Verify if Any Shift Time is null  2nd Half Time
		if ( p_Shift_In2 == null || p_Shift_Out2 == null) {
			bParamEmpty2=true;
			if (!bDescanso) {
				sParamEmpty2=sParamEmpty2+Msg.getMsg(Env.getCtx(), "Error")+" "+
					Msg.getElement(Env.getCtx(),"AMN_Shift_ID")+" 2:"+
					Msg.getMsg(Env.getCtx(), "found.none")+"\n";
			} else { 
				sParamEmpty2=sParamEmpty2+Msg.getElement(Env.getCtx(),"Descanso")+" ";
			}
		}
		// Verify if Any Shift Time is null (Both Half Shift)
		if ( bParamEmpty1 && bParamEmpty2 ) {
			bParamEmpty=true;
			if (!bDescanso) {
				sParamEmpty=sParamEmpty+Msg.getMsg(Env.getCtx(), "Error")+" "+
					Msg.getElement(Env.getCtx(),"AMN_Shift_ID")+" "+
					Msg.getMsg(Env.getCtx(), "found.none")+"\n";
			} else { 
				sParamEmpty=sParamEmpty+Msg.getElement(Env.getCtx(),"Descanso")+" ";
			}
		}
		// Verify if Any Associated Shift Time is null
		if ( defShift_In1 == null || defShift_Out1 == null || defShift_In2 == null || defShift_Out2 == null) {
			bParamEmpty=true;
			if (!bDescanso) {
				sParamEmpty=sParamEmpty+Msg.getMsg(Env.getCtx(), "Error")+" "+
				Msg.getElement(Env.getCtx(),"AMN_Shift_ID")+" "+
				Msg.getMsg(Env.getCtx(), "default")+" "+Msg.getMsg(Env.getCtx(), "found.none")+"\n";
			} else { 
				sParamEmpty=sParamEmpty+Msg.getElement(Env.getCtx(),"Descanso")+" ";
			}
		}
		if (bParamEmpty) {
			attendancehours.setHR_Message(sParamEmpty.trim());
			attendancehours.setHR_HND(BDZero);
			attendancehours.setHR_HED(BDZero);
			attendancehours.setHR_HNN(BDZero);
			attendancehours.setHR_HEN(BDZero);	
			attendancehours.setDAY_ATT(BDZero);
			attendancehours.setDAY_ATTB(BDZero);
			return attendancehours;
		}
		// Local Variables Constants
		GregorianCalendar dCal = new GregorianCalendar();
		dCal.setTime(p_Event_Date);
		// Zero 00:00
		Calendar zeroCal = Calendar.getInstance();
		zeroCal.setTime(p_Event_Date);
		zeroCal.set(Calendar.HOUR_OF_DAY,0);
		zeroCal.set(Calendar.MINUTE, 0);
		zeroCal.set(Calendar.SECOND, 0);
		zeroCal.set(Calendar.MILLISECOND, 0);
		// Day Start al 05:00 
		Calendar dayCal = Calendar.getInstance();
		dayCal.setTime(p_Event_Date);
		dayCal.set(Calendar.HOUR_OF_DAY, 5);
		dayCal.set(Calendar.MINUTE, 0);
		dayCal.set(Calendar.SECOND, 0);
		dayCal.set(Calendar.MILLISECOND, 0);
		long ldayHr = secondsOfTime(dayCal, zeroCal);
		// Night Start at 19:00
		Calendar nightCal = Calendar.getInstance();
		nightCal.setTime(p_Event_Date);
		nightCal.set(Calendar.HOUR_OF_DAY, 19);
		nightCal.set(Calendar.MINUTE, 0);
		nightCal.set(Calendar.SECOND, 0);
		nightCal.set(Calendar.MILLISECOND, 0);
		long lnightHr = secondsOfTime(nightCal, zeroCal);
		//
		BigDecimal Shift_HED = BigDecimal.valueOf(0.00);
		BigDecimal Shift_HEN = BigDecimal.valueOf(0.00);
		BigDecimal Shift_HND = BigDecimal.valueOf(0.00);
		BigDecimal Shift_HNN = BigDecimal.valueOf(0.00); 
		BigDecimal Shift_Attendance = BDZero;
		BigDecimal Shift_AttendanceBonus = BDZero;
		if ( !bParamEmpty1 ) {
			// Shift_In1
			calShift_In1.setTime(p_Shift_In1);
			lShift_In1=secondsOfTime(calShift_In1, zeroCal);
			// Shift_Out1
			calShift_Out1.setTime(p_Shift_Out1);
			lShift_Out1=secondsOfTime(calShift_Out1, zeroCal);
		}
		if ( !bParamEmpty2 ) {
			// Shift_In2
			calShift_In2.setTime(p_Shift_In2);
			lShift_In2=secondsOfTime(calShift_In2, zeroCal);
			// Shift_Out2
			calShift_Out2.setTime(p_Shift_Out2);
			lShift_Out2=secondsOfTime(calShift_Out2, zeroCal);
		}
		// DEFAULT SHIFT Asisst Input-Output Times VALUES
		// defShift_In1
		Calendar caldefShift_In1 = Calendar.getInstance();
		caldefShift_In1.setTime(defShift_In1);
		long ldefShift_In1=secondsOfTime(caldefShift_In1, zeroCal);
		// defShift_Out1
		Calendar caldefShift_Out1 = Calendar.getInstance();
		caldefShift_Out1.setTime(defShift_Out1);
		long ldefShift_Out1=secondsOfTime(caldefShift_Out1, zeroCal);
		// defShift_In2
		Calendar caldefShift_In2 = Calendar.getInstance();
		caldefShift_In2.setTime(defShift_In2);
		long ldefShift_In2=secondsOfTime(caldefShift_In2, zeroCal);
		// defShift_Out2
		Calendar caldefShift_Out2 = Calendar.getInstance();
		caldefShift_Out2.setTime(defShift_Out2);
		long ldefShift_Out2=secondsOfTime(caldefShift_Out2, zeroCal);
		// VERIFY REPEATED VALUES ATTENDANCE
		// Verify Bad Attendance (Repeated Value Whithin 2 Minutes
		if (!bParamEmpty1 && ((lShift_Out1 -lShift_In1 ) <= lErrorAttendance)) {
			bParamEmpty1=true;
			sParamEmpty1=sParamEmpty1+Msg.getMsg(Env.getCtx(), "Error")+" "+
			Msg.getElement(Env.getCtx(),"AMN_Shift_ID")+" 1: ** CHECK **"+"\n";		
		}
		if (!bParamEmpty2 && ((lShift_Out2 - lShift_In2 ) <= lErrorAttendance)) {
			bParamEmpty2=true;
			sParamEmpty2=sParamEmpty1+Msg.getMsg(Env.getCtx(), "Error")+" "+
			Msg.getElement(Env.getCtx(),"AMN_Shift_ID")+" 2: ** CHECK **"+"\n";		
		}
		
		// FIRST SHIFT Shift_In1 to Shift_Out1
		if (!bParamEmpty1) {
			// Normalize IN1 and IN2 to Shift Defaults
			if (lShift_In1 > 0 && lShift_In1 < ldefShift_In1) {
				lShift_In1 = ldefShift_In1;
			}
			if ((lShift_Out1 -lShift_In1 ) > 0 ) {
				// Verify Shift Start Before DayStart
				if (( lShift_In1 - ldayHr) < 0) {
					lShift_HNN = lShift_HNN + (ldayHr - lShift_In1 );	
					lShift_HND = lShift_HND + (lShift_Out1 - ldayHr );			
				} else {
					// Verify if Out After Night Start
					if (( lShift_Out1 - lnightHr) < 0) {	
						lShift_HND = lShift_HND + (lShift_Out1 - lShift_In1 );
					} else {
						lShift_HND = lShift_HND + (lnightHr - lShift_In1 );
						lShift_HNN = lShift_HNN + (lShift_Out1 - lnightHr);
					}
				}
				// Verify Attendance
				if ((lShift_Out1 -lShift_In1 ) > lHalfDaymin) {
					lShift_Attendance=lShift_Attendance+lHalfDay;
					//lHalfDaymin
				}
				// Verify AttendanceBonus
				if ((lShift_In1 - ldefShift_In1) <= 0  && (lShift_Out1 - ldefShift_Out1) >= 0) {
					lShift_AttendanceBonus=lShift_AttendanceBonus+lHalfDay;
					//lHalfDaymin
				}
				//log.warning("1......p_Event_Date:"+p_Event_Date+"  lShift_In1:"+lShift_In1+"  ldefShift_In1:"+ldefShift_In1+"  lShift_Out1:"+lShift_Out1+"  ldefShift_Out1:"+ldefShift_Out1);
				//log.warning("1......lShift_Attendance:"+lShift_Attendance+"  lShift_AttendanceBonus:"+lShift_AttendanceBonus+"  lHalfDay:"+lHalfDay);
			}
		}
		//log.warning("1......p_Event_Date:"+p_Event_Date+"  lShift_In1:"+lShift_In1+"  lShift_Out1:"+lShift_Out1);
		//log.warning("1......ldayHr:"+ldayHr+"  lnightHr:"+lnightHr+"  HND:"+lShift_HND+"  HED:"+lShift_HED+"Horas HNN:"+lShift_HNN+"  HED:"+lShift_HEN);
		// SECOND SHIFT Shift_In2 to Shift_Out2
		if (!bParamEmpty2) {
			if (lShift_In2 > 0 && lShift_In2 < ldefShift_In2 && lShift_In2 > lShift_Out2) {
				lShift_In2 = ldefShift_In2;
			}
			if ((lShift_Out2 - lShift_In2 ) > 0 ) {
				// Verify Shift Start Before DayStart
				if (( lShift_In2 - ldayHr) < 0) {
					// Verifiy if Out After Night Start
					if (( lShift_Out2 - lnightHr) < 0) {	
						lShift_HND = lShift_HND + (lShift_Out2 - lShift_In2 );
					} else {
						lShift_HND = lShift_HND + (lnightHr - lShift_In2 );
						lShift_HNN = lShift_HNN + (lShift_Out2 - lnightHr );
					}			
				} else {
					// Verifiy if Out After Night Start
					if (( lShift_Out2 - lnightHr) < 0) {	
						lShift_HND = lShift_HND + (lShift_Out2 - lShift_In2 );
					} else {
						lShift_HND = lShift_HND + (lnightHr - lShift_In2 );
						lShift_HNN = lShift_HNN + (lShift_Out2 - lnightHr );
					}				
				}
				// Verify Attendance
				if ((lShift_Out2 -lShift_In2 ) > lHalfDaymin) {
					lShift_Attendance=lShift_Attendance+lHalfDay;
					//lHalfDaymin
				}
				// Verify AttendanceBonus
				if ((lShift_In2 - ldefShift_In2) <= 0  && (lShift_Out2 - ldefShift_Out2) >= 0) {
					lShift_AttendanceBonus=lShift_AttendanceBonus+lHalfDay;
					//lHalfDaymin
				}
				//log.warning("2......p_Event_Date:"+p_Event_Date+"  lShift_In2:"+lShift_In2+"  ldefShift_In2:"+ldefShift_In2+"  lShift_Out2:"+lShift_Out2+"  ldefShift_Out2:"+ldefShift_Out2);
				//log.warning("2......lShift_Attendance:"+lShift_Attendance+"  lShift_AttendanceBonus:"+lShift_AttendanceBonus+"  lHalfDay:"+lHalfDay);
			}	
			//log.warning("2......p_Event_Date:"+p_Event_Date+"  lShift_In1:"+lShift_In2+"  lShift_Out1:"+lShift_Out2);
			//log.warning("2......ldayHr:"+ldayHr+"  lnightHr:"+lnightHr+"  HND:"+lShift_HND+"  HED:"+lShift_HED+"Horas HNN:"+lShift_HNN+"  HED:"+lShift_HEN);
			// EXTRA HOURS
			if ((lShift_Out2 - ldefShift_Out2 ) > 0 ) {
				// Verify Shift Start Before DayStart
				if (( lShift_Out2 - lnightHr) > 0) {
					// Verifiy if Out After Night Start
					if (( ldefShift_Out2 - lnightHr) > 0) {	
						lShift_HEN = lShift_HEN + (lShift_Out2 - ldefShift_Out2 );
					} else {
						lShift_HEN = lShift_HEN + (lShift_Out2 - ldefShift_Out2 );
						lShift_HED = lShift_HED + (lnightHr - ldefShift_Out2 );	
					}			
				} else {
					lShift_HED = lShift_HED + (lShift_Out2 - ldefShift_Out2 );		
				}
			}
		}
		//log.warning("E......ldayHr:"+ldayHr+"  lnightHr:"+lnightHr+"  HND:"+lShift_HND+"  HED:"+lShift_HED+"Horas HNN:"+lShift_HNN+"  HED:"+lShift_HEN);
		// Subtract Extra HOURS FROM CALC
		lShift_HNN = lShift_HNN - lShift_HEN;
		lShift_HND = lShift_HND - lShift_HED;
		// Convert to BigDecimal
		Shift_HED = BigDecimal.valueOf((long) (lShift_HED));
		Shift_HEN = BigDecimal.valueOf((long) (lShift_HEN));
		Shift_HND = BigDecimal.valueOf((long) (lShift_HND));
		Shift_HNN = BigDecimal.valueOf((long) (lShift_HNN));
		Shift_Attendance =  BigDecimal.valueOf((long) (lShift_Attendance));
		Shift_AttendanceBonus =  BigDecimal.valueOf((long) (lShift_AttendanceBonus));	
		
		//log.warning("Calculated Hours in Seconds long HND:"+lShift_HND +"  HED:"+lShift_HED+"  HNN:"+lShift_HNN+"  HEN:"+lShift_HEN);
		// DIVIDE : 3600 to GET SECONDS
		// Convert to HOURS
		BigDecimal BD3600=BigDecimal.valueOf((long)3600);
		Shift_HED =  Shift_HED.divide(BD3600,2, RoundingMode.CEILING);
		Shift_HEN =  Shift_HEN.divide(BD3600,2, RoundingMode.CEILING);
		Shift_HND =  Shift_HND.divide(BD3600,2, RoundingMode.CEILING);
		Shift_HNN =  Shift_HNN.divide(BD3600,2, RoundingMode.CEILING);
		Shift_Attendance = Shift_Attendance.divide(BigDecimal.valueOf((long)2),2, RoundingMode.CEILING);
		Shift_AttendanceBonus = Shift_AttendanceBonus.divide(BigDecimal.valueOf((long)2),2, RoundingMode.CEILING);
		// *********************************************************
		// Normalize Values According to Organization Policies
		// *********************************************************
		// Maximum Values

		BigDecimal maxShift_HND = defattendancehours.getHR_HND();
		BigDecimal maxShift_HNN = defattendancehours.getHR_HNN(); 
		//log.warning("maxShift_HND:"+maxShift_HND+"  maxShift_HNN:"+maxShift_HNN+"  Shift_HND:"+Shift_HND+"  Shift_HNN:"+Shift_HNN);
		// HND
		if ((maxShift_HND.compareTo(BDZero) > 0) && Shift_HND.compareTo(maxShift_HND) > 0) {
			Shift_HND = maxShift_HND; // set to Max Value
		}
		// HNN
		if ((maxShift_HNN.compareTo(BDZero) > 0) && Shift_HNN.compareTo(maxShift_HNN) > 0) {
			Shift_HNN = maxShift_HNN; // set to Max Value
		}
		// HED set to Zero
		Shift_HED = BDZero;
		// HEN set to Zero
		Shift_HEN = BDZero;
		
		// Return Structure with Values
		attendancehours.setHR_HND(Shift_HND);
		attendancehours.setHR_HED(Shift_HED);
		attendancehours.setHR_HNN(Shift_HNN);
		attendancehours.setHR_HEN(Shift_HEN);	
		attendancehours.setDAY_ATT(Shift_Attendance);	
		attendancehours.setDAY_ATTB(Shift_AttendanceBonus);
		if (sParamEmpty.isEmpty()) {
			//attendancehours.setHR_Message(sParamEmpty1+" "+sParamEmpty2+" HND:"+Shift_HND+" HED:"+Shift_HED+" HNN:"+Shift_HNN+" HED:"+Shift_HEN);
			attendancehours.setHR_Message((sParamEmpty1+" "+sParamEmpty2).trim());
		} else {
			//attendancehours.setHR_Message(sParamEmpty+" HND:"+Shift_HND+" HED:"+Shift_HED+" HNN:"+Shift_HNN+" HED:"+Shift_HEN);
			attendancehours.setHR_Message(sParamEmpty.trim());
		}
		
		//log.warning("Hours Calculated BigDecimal HND:"+attendancehours.getHR_HND() +"  HED:"+attendancehours.getHR_HED()+
		//"  HNN:"+attendancehours.getHR_HNN()+"  HEN:"+attendancehours.getHR_HEN());
		return attendancehours;
	}
	


	/**
	 * Procedure: calcDefaultAttendanceValuesofPayrollVars
	 * Description: Calculates Values of HND,HNN,HED,HEN,Attendance,AttendanceBonus
	 * 				From AMN_Shift_detail  Values 
	 * 				( p_amnshiftdetail ---> p_Shift_In1, p_Shift_Out1, p_Shift_In2, p_Shift_Out2)
	 * @param Timestamp Event_Date
	 * @param Integer p_AMN_Shift_ID
	 * @param MAMN_Shift_Detail p_amnshiftdetail
	 * @return AttendanceHours Array
	 * All event Times are Normalized to Event_Date
	 */
	public static AttendanceHours calcDefaultAttendanceValuesofPayrollVars(
			Timestamp p_Event_Date, Integer p_AMN_Shift_ID, MAMN_Shift_Detail p_amnshiftdetail)
	{
		Boolean bParamEmpty=false;
		Boolean bDescanso=false;
		String sParamEmpty="";
		BigDecimal BDZero = BigDecimal.valueOf(0);
		AttendanceHours defattendancehours = new AttendanceHours(BDZero, BDZero, BDZero, BDZero, BDZero, BDZero, "");
		// Determines Default Shift Times Values
	    //log.warning("Shift_In1:"+amnshiftdetail.getShift_In1().toString());
	    // Get Default Asisst Input-Output Times referenced to p_Event_date
		Timestamp defShift_In1 = getTimestampShifdetailEventTime(p_Event_Date,p_amnshiftdetail.getShift_In1());;
		Timestamp defShift_In2 = getTimestampShifdetailEventTime(p_Event_Date,p_amnshiftdetail.getShift_In2());;
		Timestamp defShift_Out1 = getTimestampShifdetailEventTime(p_Event_Date,p_amnshiftdetail.getShift_Out1());
		Timestamp defShift_Out2 = getTimestampShifdetailEventTime(p_Event_Date,p_amnshiftdetail.getShift_Out2());		
		bDescanso=p_amnshiftdetail.isDescanso();
		// Verify if Any Associated Shift Time is null
		if ( defShift_In1 == null || defShift_Out1 == null || defShift_In2 == null || defShift_Out2 == null) {
			bParamEmpty=true;
			if (!bDescanso) {
				sParamEmpty=sParamEmpty+Msg.getMsg(Env.getCtx(), "Error")+" "+
						Msg.getElement(Env.getCtx(), "AMN_Shift_ID")+" "+
						Msg.getMsg(Env.getCtx(), "default")+" "+Msg.getMsg(Env.getCtx(), "found.none")+"\n";
			} else { 
				sParamEmpty=sParamEmpty+Msg.getElement(Env.getCtx(),"Descanso"+" ");
			}
		}
		if (bParamEmpty) {
			defattendancehours.setHR_Message(sParamEmpty.trim());
			defattendancehours.setHR_HND(BDZero);
			defattendancehours.setHR_HED(BDZero);
			defattendancehours.setHR_HNN(BDZero);
			defattendancehours.setHR_HEN(BDZero);	
			defattendancehours.setDAY_ATT(BDZero);
			defattendancehours.setDAY_ATTB(BDZero);
			return defattendancehours;
		}
		// Local Variables Constants
		GregorianCalendar dCal = new GregorianCalendar();
		dCal.setTime(p_Event_Date);
		// Zero 00:00
		Calendar zeroCal = Calendar.getInstance();
		zeroCal.setTime(p_Event_Date);
		zeroCal.set(Calendar.HOUR_OF_DAY,0);
		zeroCal.set(Calendar.MINUTE, 0);
		zeroCal.set(Calendar.SECOND, 0);
		zeroCal.set(Calendar.MILLISECOND, 0);
		// Day Start al 05:00 
		Calendar dayCal = Calendar.getInstance();
		dayCal.setTime(p_Event_Date);
		dayCal.set(Calendar.HOUR_OF_DAY, 5);
		dayCal.set(Calendar.MINUTE, 0);
		dayCal.set(Calendar.SECOND, 0);
		dayCal.set(Calendar.MILLISECOND, 0);
		long ldayHr = secondsOfTime(dayCal, zeroCal);
		// Night Start at 19:00
		Calendar nightCal = Calendar.getInstance();
		nightCal.setTime(p_Event_Date);
		nightCal.set(Calendar.HOUR_OF_DAY, 19);
		nightCal.set(Calendar.MINUTE, 0);
		nightCal.set(Calendar.SECOND, 0);
		nightCal.set(Calendar.MILLISECOND, 0);
		long lnightHr = secondsOfTime(nightCal, zeroCal);
		//
		BigDecimal defShift_HED = BigDecimal.valueOf(0.00);
		BigDecimal defShift_HEN = BigDecimal.valueOf(0.00);
		BigDecimal defShift_HND = BigDecimal.valueOf(0.00);
		BigDecimal defShift_HNN = BigDecimal.valueOf(0.00); 
		BigDecimal defShift_Attendance = BDZero;
		BigDecimal defShift_AttendanceBonus = BDZero;
		long ldefShift_HED = (long) 0;
		long ldefShift_HEN = (long) 0;
		long ldefShift_HND = (long) 0;
		long ldefShift_HNN = (long) 0;
		long ldefShift_Attendance = (long) 0;
		long ldefShift_AttendanceBonus = (long) 0;
		// DEFAULT SHIFT Asisst Input-Output Times VALUES
		// defShift_In1
		Calendar caldefShift_In1 = Calendar.getInstance();
		caldefShift_In1.setTime(defShift_In1);
		long ldefShift_In1=secondsOfTime(caldefShift_In1, zeroCal);
		// defShift_Out1
		Calendar caldefShift_Out1 = Calendar.getInstance();
		caldefShift_Out1.setTime(defShift_Out1);
		long ldefShift_Out1=secondsOfTime(caldefShift_Out1, zeroCal);
		// defShift_In2
		Calendar caldefShift_In2 = Calendar.getInstance();
		caldefShift_In2.setTime(defShift_In2);
		long ldefShift_In2=secondsOfTime(caldefShift_In2, zeroCal);
		// defShift_Out2
		Calendar caldefShift_Out2 = Calendar.getInstance();
		caldefShift_Out2.setTime(defShift_Out2);
		long ldefShift_Out2=secondsOfTime(caldefShift_Out2, zeroCal);
		// FIRST SHIFT Shift_In1 to Shift_Out1
		if ((ldefShift_Out1 -ldefShift_In1 ) > 0 ) {
			// Verify Shift Start Before DayStart
			if (( ldefShift_In1 - ldayHr) < 0) {
				ldefShift_HNN = ldefShift_HNN + (ldayHr - ldefShift_In1 );	
				ldefShift_HND = ldefShift_HND + (ldefShift_Out1 - ldayHr );			
			} else {
				// Verify if Out After Night Start
				if (( ldefShift_Out1 - lnightHr) < 0) {	
					ldefShift_HND = ldefShift_HND + (ldefShift_Out1 - ldefShift_In1 );
				} else {
					ldefShift_HND = ldefShift_HND + (lnightHr - ldefShift_In1 );
					ldefShift_HNN = ldefShift_HNN + (ldefShift_Out1 - lnightHr);
				}
			}
		}
		// SECOND SHIFT Shift_In2 to Shift_Out2
		if ((ldefShift_Out2 - ldefShift_In2 ) > 0 ) {
			// Verify Shift Start Before DayStart
			if (( ldefShift_In2 - ldayHr) < 0) {
				// Verifiy if Out After Night Start
				if (( ldefShift_Out2 - lnightHr) < 0) {	
					ldefShift_HND = ldefShift_HND + (ldefShift_Out2 - ldefShift_In2 );
				} else {
					ldefShift_HND = ldefShift_HND + (lnightHr - ldefShift_In2 );
					ldefShift_HNN = ldefShift_HNN + (ldefShift_Out2 - lnightHr );
				}			
			} else {
				// Verifiy if Out After Night Start
				if (( ldefShift_Out2 - lnightHr) < 0) {	
					ldefShift_HND = ldefShift_HND + (ldefShift_Out2 - ldefShift_In2 );
				} else {
					ldefShift_HND = ldefShift_HND + (lnightHr - ldefShift_In2 );
					ldefShift_HNN = ldefShift_HNN + (ldefShift_Out2 - lnightHr );
				}				
			}
		}	
		// Convert to BigDecimal
		defShift_HED = BigDecimal.valueOf((long) (ldefShift_HED));
		defShift_HEN = BigDecimal.valueOf((long) (ldefShift_HEN));
		defShift_HND = BigDecimal.valueOf((long) (ldefShift_HND));
		defShift_HNN = BigDecimal.valueOf((long) (ldefShift_HNN));
		defShift_Attendance =  BigDecimal.valueOf((long) (ldefShift_Attendance));
		defShift_AttendanceBonus =  BigDecimal.valueOf((long) (ldefShift_AttendanceBonus));	
		
		//log.warning("Calculated Hours in Seconds long HND:"+ldefShift_HND +"  HED:"+ldefShift_HED+"  HNN:"+ldefShift_HNN+"  HEN:"+ldefShift_HEN);
		// DIVIDE : 3600 to GET SECONDS
		// Convert to HOURS
		BigDecimal BD3600=BigDecimal.valueOf((long)3600);
		defShift_HED =  defShift_HED.divide(BD3600,2, RoundingMode.CEILING);
		defShift_HEN =  defShift_HEN.divide(BD3600,2, RoundingMode.CEILING);
		defShift_HND =  defShift_HND.divide(BD3600,2, RoundingMode.CEILING);
		defShift_HNN =  defShift_HNN.divide(BD3600,2, RoundingMode.CEILING);
		defShift_Attendance = defShift_Attendance.divide(BigDecimal.valueOf((long)2),2, RoundingMode.CEILING);
		defShift_AttendanceBonus = defShift_AttendanceBonus.divide(BigDecimal.valueOf((long)2),2, RoundingMode.CEILING);
		// Normalize Values According to Organization Policies
		
		// Return Structure with Maximum Values
		defattendancehours.setHR_HND(defShift_HND);
		defattendancehours.setHR_HED(defShift_HED);
		defattendancehours.setHR_HNN(defShift_HNN);
		defattendancehours.setHR_HEN(defShift_HEN);	
		defattendancehours.setDAY_ATT(defShift_Attendance);	
		defattendancehours.setDAY_ATTB(defShift_AttendanceBonus);
		defattendancehours.setHR_Message("HND:"+defShift_HND+" HED:"+defShift_HED+" HNN:"+defShift_HNN+" HED:"+defShift_HEN);
		//log.warning("Default Hours Calculated By SHIFT BigDecimal HND:"+defattendancehours.getHR_HND() +"  HED:"+defattendancehours.getHR_HED()+
		//"  HNN:"+defattendancehours.getHR_HNN()+"  HEN:"+defattendancehours.getHR_HEN());
		return defattendancehours;
	}

	
	/**
	 * Procedure: minutesOfTime
	 * @param Calendar p_cal
	 * @param Calendar p_zero
	 * @return long
	 * Return Seconds of Day
	 */
	public static long secondsOfTime( Calendar p_cal, Calendar p_zero)
	{
		long lretValue=0;
		lretValue = (p_cal.getTimeInMillis()-p_zero.getTimeInMillis())/1000;
		return lretValue;
		
	}

}