/******************************************************************************
 * Product: iDempiere ERP & CRM Smart Business Solution                       *
 * Copyright (C) 1999-2012 ComPiere, Inc. All Rights Reserved.                *
 * This program is free software, you can redistribute it and/or modify it    *
 * under the terms version 2 of the GNU General Public License as published   *
 * by the Free Software Foundation. This program is distributed in the hope   *
 * that it will be useful, but WITHOUT ANY WARRANTY, without even the implied *
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.           *
 * See the GNU General Public License for more details.                       *
 * You should have received a copy of the GNU General Public License along    *
 * with this program, if not, write to the Free Software Foundation, Inc.,    *
 * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.                     *
 * For the text or an alternative of this public license, you may reach us    *
 * ComPiere, Inc., 2620 Augustine Dr. #245, Santa Clara, CA 95054, USA        *
 * or via info@compiere.org or http://www.compiere.org/license.html           *
 *****************************************************************************/
package org.amerp.amnmodel;

import java.math.BigDecimal;
import java.sql.Timestamp;
import org.compiere.model.*;
import org.compiere.util.KeyNamePair;

/** Generated Interface for AMN_Payroll_Assist
 *  @author iDempiere (generated) 
 *  @version Release 11
 */
@SuppressWarnings("all")
public interface I_AMN_Payroll_Assist 
{

    /** TableName=AMN_Payroll_Assist */
    public static final String Table_Name = "AMN_Payroll_Assist";

    /** AD_Table_ID=1000030 */
    public static final int Table_ID = MTable.getTable_ID(Table_Name);

    KeyNamePair Model = new KeyNamePair(Table_ID, Table_Name);

    /** AccessLevel = 3 - Client - Org 
     */
    BigDecimal accessLevel = BigDecimal.valueOf(3);

    /** Load Meta Data */

    /** Column name AD_Client_ID */
    public static final String COLUMNNAME_AD_Client_ID = "AD_Client_ID";

	/** Get Client.
	  * Client/Tenant for this installation.
	  */
	public int getAD_Client_ID();

    /** Column name AD_Org_ID */
    public static final String COLUMNNAME_AD_Org_ID = "AD_Org_ID";

	/** Set Organization.
	  * Organizational entity within client
	  */
	public void setAD_Org_ID (int AD_Org_ID);

	/** Get Organization.
	  * Organizational entity within client
	  */
	public int getAD_Org_ID();

    /** Column name AMN_AssistRecord */
    public static final String COLUMNNAME_AMN_AssistRecord = "AMN_AssistRecord";

	/** Set AMN_AssistRecord	  */
	public void setAMN_AssistRecord (String AMN_AssistRecord);

	/** Get AMN_AssistRecord	  */
	public String getAMN_AssistRecord();

    /** Column name AMN_Employee_ID */
    public static final String COLUMNNAME_AMN_Employee_ID = "AMN_Employee_ID";

	/** Set Payroll employee	  */
	public void setAMN_Employee_ID (int AMN_Employee_ID);

	/** Get Payroll employee	  */
	public int getAMN_Employee_ID();

    /** Column name AMN_Payroll_Assist_ID */
    public static final String COLUMNNAME_AMN_Payroll_Assist_ID = "AMN_Payroll_Assist_ID";

	/** Set Payroll Assist .
	  * Payroll Attendance 
	  */
	public void setAMN_Payroll_Assist_ID (int AMN_Payroll_Assist_ID);

	/** Get Payroll Assist .
	  * Payroll Attendance 
	  */
	public int getAMN_Payroll_Assist_ID();

    /** Column name AMN_Payroll_Assist_UU */
    public static final String COLUMNNAME_AMN_Payroll_Assist_UU = "AMN_Payroll_Assist_UU";

	/** Set AMN_Payroll_Assist_UU.
	  * Payroll Attendance UU
	  */
	public void setAMN_Payroll_Assist_UU (String AMN_Payroll_Assist_UU);

	/** Get AMN_Payroll_Assist_UU.
	  * Payroll Attendance UU
	  */
	public String getAMN_Payroll_Assist_UU();

    /** Column name AMN_Shift_ID */
    public static final String COLUMNNAME_AMN_Shift_ID = "AMN_Shift_ID";

	/** Set Shift	  */
	public void setAMN_Shift_ID (int AMN_Shift_ID);

	/** Get Shift	  */
	public int getAMN_Shift_ID();

    /** Column name BioCode */
    public static final String COLUMNNAME_BioCode = "BioCode";

	/** Set BioCode.
	  * Biometric Code from Attendance Control Scanners
	  */
	public void setBioCode (String BioCode);

	/** Get BioCode.
	  * Biometric Code from Attendance Control Scanners
	  */
	public String getBioCode();

    /** Column name Created */
    public static final String COLUMNNAME_Created = "Created";

	/** Get Created.
	  * Date this record was created
	  */
	public Timestamp getCreated();

    /** Column name CreatedBy */
    public static final String COLUMNNAME_CreatedBy = "CreatedBy";

	/** Get Created By.
	  * User who created this records
	  */
	public int getCreatedBy();

    /** Column name dayofweek */
    public static final String COLUMNNAME_dayofweek = "dayofweek";

	/** Set dayofweek	  */
	public void setdayofweek (String dayofweek);

	/** Get dayofweek	  */
	public String getdayofweek();

    /** Column name Descanso */
    public static final String COLUMNNAME_Descanso = "Descanso";

	/** Set Descanso.
	  * Indicate if Day is a Non-Working Day for rest
	  */
	public void setDescanso (boolean Descanso);

	/** Get Descanso.
	  * Indicate if Day is a Non-Working Day for rest
	  */
	public boolean isDescanso();

    /** Column name Description */
    public static final String COLUMNNAME_Description = "Description";

	/** Set Description.
	  * Optional short description of the record
	  */
	public void setDescription (String Description);

	/** Get Description.
	  * Optional short description of the record
	  */
	public String getDescription();

    /** Column name Event_Date */
    public static final String COLUMNNAME_Event_Date = "Event_Date";

	/** Set Event_Date	  */
	public void setEvent_Date (Timestamp Event_Date);

	/** Get Event_Date	  */
	public Timestamp getEvent_Date();

    /** Column name Event_Time */
    public static final String COLUMNNAME_Event_Time = "Event_Time";

	/** Set Event Time	  */
	public void setEvent_Time (Timestamp Event_Time);

	/** Get Event Time	  */
	public Timestamp getEvent_Time();

    /** Column name Event_Type */
    public static final String COLUMNNAME_Event_Type = "Event_Type";

	/** Set Event Type	  */
	public void setEvent_Type (String Event_Type);

	/** Get Event Type	  */
	public String getEvent_Type();

    /** Column name IsActive */
    public static final String COLUMNNAME_IsActive = "IsActive";

	/** Set Active.
	  * The record is active in the system
	  */
	public void setIsActive (boolean IsActive);

	/** Get Active.
	  * The record is active in the system
	  */
	public boolean isActive();

    /** Column name Updated */
    public static final String COLUMNNAME_Updated = "Updated";

	/** Get Updated.
	  * Date this record was updated
	  */
	public Timestamp getUpdated();

    /** Column name UpdatedBy */
    public static final String COLUMNNAME_UpdatedBy = "UpdatedBy";

	/** Get Updated By.
	  * User who updated this records
	  */
	public int getUpdatedBy();
}
