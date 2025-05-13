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
 ******************************************************************************/
package org.amerp.process;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.logging.Level;

import org.amerp.amnmodel.MAMN_Employee;
import org.amerp.amnmodel.MAMN_Payroll;
import org.amerp.amnmodel.MAMN_Payroll_Historic;
import org.amerp.amnmodel.MAMN_Period;
import org.amerp.amnmodel.MAMN_Process;
import org.compiere.model.MClient;
import org.compiere.model.MInvoice;
import org.compiere.model.MOrg;
import org.compiere.process.DocAction;
import org.compiere.process.ProcessInfoParameter;
import org.compiere.process.SvrProcess;
import org.compiere.util.*;

/**
 * Description: Procedure called from iDempiere AD
 * 			Process and Accounts Payroll Receipts for One Period
 * 			For One Process, One Contract and One Period
 * 			For All Employees on Contract and Period.
 * Result:	Update Payroll Receipts on AMN_Payroll records 
 * 			From DR Draft Mode to CO Completed.
 * 
 * @author luisamesty
 *
 */

public class AMNPayrollProcessCompleteDocs extends SvrProcess{

	static CLogger log = CLogger.getCLogger(AMNPayrollProcessCompleteDocs.class);

	private int p_AMN_Process_ID = 0;
	private int p_AMN_Contract_ID = 0;
	private int p_AMN_Period_ID = 0;
	String Employee_Name,AMN_Process_Value="";
	String sql="";

	String Msg_Value="";
	// Receipt List
	AMNReceipts Receipt = null;
	List<AMNReceipts> ReceiptsGenList = new ArrayList<AMNReceipts>();
	// Receipt Lines List
	AMNReceiptLines ReceiptLines = null;
	List<AMNReceiptLines> ReceiptConcepts = new ArrayList<AMNReceiptLines>();
	
	/* (non-Javadoc)
	 * @see org.compiere.process.SvrProcess#prepare()
	 */
    @Override
    protected void prepare() {
	    // log.warning("...........Toma de Parámetros...................");
    	ProcessInfoParameter[] paras = getParameter();
		for (ProcessInfoParameter para : paras)
		{
			String paraName = para.getParameterName();
			// SPECIAL CASE BECAUSE FIRST TWO PARAMETERS DOESN'T COME FROM TABLE
			// THEY COME FROM AMN_PROCESS_CONTRACT_V  (VIEW)
			// THIRD PARAMETER COMES FROM AMN_PERIOD TABLE
			if (paraName.equals("AMN_Process_ID"))
				p_AMN_Process_ID =  para.getParameterAsInt();
			else if (paraName.equals("AMN_Contract_ID"))
				p_AMN_Contract_ID =  para.getParameterAsInt();
			else if (paraName.equals("AMN_Period_ID"))
				p_AMN_Period_ID = para.getParameterAsInt();
			else
				log.log(Level.SEVERE, "Unknown Parameter: " + paraName);
		}	 
    }

	/* (non-Javadoc)
	 * @see org.compiere.process.SvrProcess#doIt()
	 */
    @Override
    protected String doIt() throws Exception {
	    // TODO Auto-generated method stub
	    String sql="";
	    String AMN_Process_Value="NN";
	    String Payroll_Name="";
	    String Msg_Value="";
	    String Msg_Value0="";
	    String trxName =get_TrxName();
	    int AMN_Payroll_ID=0;
	    MAMN_Payroll amnpayroll = new MAMN_Payroll(getCtx(), AMN_Payroll_ID, trxName);
		MAMN_Employee amnemployee =  new MAMN_Employee(getCtx(), amnpayroll.getAMN_Employee_ID(), trxName);
		MAMN_Process amnprocess = new MAMN_Process(getCtx(), p_AMN_Process_ID, get_TrxName());
	    // ARRAY DOCS FOR EMPLOYEE - CONTRACT
		sql = "SELECT \n" + 
				"amnpr.amn_payroll_id, \n" + 
				"amnpr.amn_employee_id, \n" + 
				"amnpr.name as payroll_name  \n" + 
				"FROM  amn_payroll as amnpr \n" + 
				"WHERE amnpr.amn_period_id=? \n" + 
				"ORDER BY amnpr.value"
				;        		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try
		{
			pstmt = DB.prepareStatement(sql, get_TrxName());
            pstmt.setInt (1, p_AMN_Period_ID);
			rs = pstmt.executeQuery();
			while (rs.next())
			{
				AMN_Payroll_ID= rs.getInt(1);
				rs.getInt(2);
				Payroll_Name = rs.getString(3).trim();
				trxName =  get_TrxName();
				amnpayroll = new MAMN_Payroll(getCtx(), AMN_Payroll_ID, trxName);
				amnemployee =  new MAMN_Employee(getCtx(), amnpayroll.getAMN_Employee_ID(), trxName);
				//  PROCESS MAMN_Payroll (DOCUMENT HEADER)
				Receipt = new AMNReceipts();
				Receipt.setAMN_Employee_ID(amnemployee.getAMN_Employee_ID());
				Receipt.setEmployee_Value(amnemployee.getValue());
				Receipt.setEmployee_Name(amnemployee.getName());
				Receipt.setAMN_Payroll_ID(amnpayroll.getAMN_Payroll_ID());
				Receipt.setDocumentNo(amnpayroll.getDocumentNo().trim());
				Receipt.setDescription(amnpayroll.getValue().trim()+" "+amnpayroll.getName().trim());
				Receipt.setC_Invoice_ID(amnpayroll.getC_Invoice_ID());
				Receipt.setNoLines(0);
				Msg_Value = "";
				if (amnpayroll.getDocStatus().equalsIgnoreCase(MAMN_Payroll.STATUS_Completed))
				{
					// Process document
				    Receipt.setRecIsPosted(true);
				    Msg_Value=" *** ADVERTENCIA "+Msg.getMsg(Env.getCtx(),"completed")+" *** \r\n";
				    Receipt.setError(Msg_Value);
				} else if (!amnpayroll.getDocStatus().equalsIgnoreCase(MAMN_Payroll.STATUS_Completed)
						&& MAMN_Payroll.sqlGetAMNPayrollDetailNoLines(AMN_Payroll_ID, trxName) > 0){
				    Msg_Value="";
					Receipt.setRecIsPosted(false);
					Receipt.setError(Msg_Value);
				} else {
					 Msg_Value="";
						Receipt.setRecIsPosted(false);
						Msg_Value=" *** ADVERTENCIA "+Msg.getMsg(Env.getCtx(),"NoLines")+" *** \r\n";
						Receipt.setError(Msg_Value);
				}
				
				ReceiptsGenList.add(Receipt);
			}				
		}
	    catch (SQLException e)
	    {
	    }
		finally
		{
			DB.close(rs, pstmt);
			rs = null; pstmt = null;
		}
		// Process Receipts
	    if ( ReceiptsGenList.size() > 0 ) {
			for (int i=0 ; i < ReceiptsGenList.size() ; i++) {
				Receipt = ReceiptsGenList.get(i);
				trxName = get_TrxName();
				amnpayroll = new MAMN_Payroll(getCtx(), Receipt.getAMN_Payroll_ID(), trxName);
				// 
				if (!Receipt.getRecIsPosted()) {
					Msg_Value = amnpayroll.processAMN_Payroll(getCtx(), amnpayroll, amnprocess, trxName);
					Receipt.setError(Msg_Value);
					ReceiptsGenList.get(i).setError(Msg_Value);
				}
			}
	    }
		// Final Messages
    	Msg_Value = Msg.getElement(getCtx(), "AMN_Process_ID")+":"+amnprocess.getName().trim();
	    addLog(Msg_Value);
	    Msg_Value = Msg.getElement(getCtx(), "AMN_Payroll_ID")+	Msg.getElement(getCtx(), "Qty")+" ("+ReceiptsGenList.size()+") :";
	    addLog(Msg_Value);		
	    // Detail Messages
	    if ( ReceiptsGenList.size() > 0 ) {
			for (int i=0 ; i < ReceiptsGenList.size() ; i++) {
				Msg_Value = Msg.getElement(getCtx(), "AMN_Payroll_ID")+":"+
			    		Msg.getElement(getCtx(), "AMN_Employee_ID")+":"+ReceiptsGenList.get(i).getEmployee_Value()+"-"+ReceiptsGenList.get(i).getEmployee_Name();
			    addLog(Msg_Value);
			    Msg_Value = Msg.getElement(getCtx(), " ")+":"+
			    		ReceiptsGenList.get(i).getDocumentNo()+"-"+ReceiptsGenList.get(i).getError();
			    addLog(Msg_Value);
			}
	    	return "OK";
	    } else {	    	
	    	return null;
	    }
    }

}
