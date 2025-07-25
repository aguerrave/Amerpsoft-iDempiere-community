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

/** Generated Interface for AMN_Payroll_Assist_Row
 *  @author iDempiere (generated) 
 *  @version Release 11
 */
@SuppressWarnings("all")
public interface I_AMN_Payroll_Assist_Row 
{

    /** TableName=AMN_Payroll_Assist_Row */
    public static final String Table_Name = "AMN_Payroll_Assist_Row";

    /** AD_Table_ID=1000109 */
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

    /** Column name AMN_DateTime */
    public static final String COLUMNNAME_AMN_DateTime = "AMN_DateTime";

	/** Set DateTime	  */
	public void setAMN_DateTime (Timestamp AMN_DateTime);

	/** Get DateTime	  */
	public Timestamp getAMN_DateTime();

    /** Column name AMN_Payroll_Assist_Row_ID */
    public static final String COLUMNNAME_AMN_Payroll_Assist_Row_ID = "AMN_Payroll_Assist_Row_ID";

	/** Set Payroll Assist Row.
	  * Payroll Attendance Row data
	  */
	public void setAMN_Payroll_Assist_Row_ID (int AMN_Payroll_Assist_Row_ID);

	/** Get Payroll Assist Row.
	  * Payroll Attendance Row data
	  */
	public int getAMN_Payroll_Assist_Row_ID();

    /** Column name AMN_Payroll_Assist_Row_UU */
    public static final String COLUMNNAME_AMN_Payroll_Assist_Row_UU = "AMN_Payroll_Assist_Row_UU";

	/** Set AMN_Payroll_Assist_Row_UU	  */
	public void setAMN_Payroll_Assist_Row_UU (String AMN_Payroll_Assist_Row_UU);

	/** Get AMN_Payroll_Assist_Row_UU	  */
	public String getAMN_Payroll_Assist_Row_UU();

    /** Column name AMN_Payroll_Assist_Unit_ID */
    public static final String COLUMNNAME_AMN_Payroll_Assist_Unit_ID = "AMN_Payroll_Assist_Unit_ID";

	/** Set Payroll Assist Unit.
	  * Payroll Attendance Unit data
	  */
	public void setAMN_Payroll_Assist_Unit_ID (int AMN_Payroll_Assist_Unit_ID);

	/** Get Payroll Assist Unit.
	  * Payroll Attendance Unit data
	  */
	public int getAMN_Payroll_Assist_Unit_ID();

	public I_AMN_Payroll_Assist_Unit getAMN_Payroll_Assist_Unit() throws RuntimeException;

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

    /** Column name DateTrx */
    public static final String COLUMNNAME_DateTrx = "DateTrx";

	/** Set Transaction Date.
	  * Transaction Date
	  */
	public void setDateTrx (Timestamp DateTrx);

	/** Get Transaction Date.
	  * Transaction Date
	  */
	public Timestamp getDateTrx();

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

    /** Column name IsVerified */
    public static final String COLUMNNAME_IsVerified = "IsVerified";

	/** Set Verified.
	  * The BOM configuration has been verified
	  */
	public void setIsVerified (boolean IsVerified);

	/** Get Verified.
	  * The BOM configuration has been verified
	  */
	public boolean isVerified();

    /** Column name PIN */
    public static final String COLUMNNAME_PIN = "PIN";

	/** Set PIN.
	  * Personal Identification Number
	  */
	public void setPIN (String PIN);

	/** Get PIN.
	  * Personal Identification Number
	  */
	public String getPIN();

    /** Column name Status */
    public static final String COLUMNNAME_Status = "Status";

	/** Set Status.
	  * Status of the currently running check
	  */
	public void setStatus (int Status);

	/** Get Status.
	  * Status of the currently running check
	  */
	public int getStatus();

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

    /** Column name WorkCode */
    public static final String COLUMNNAME_WorkCode = "WorkCode";

	/** Set WorkCode.
	  * Work Code
	  */
	public void setWorkCode (String WorkCode);

	/** Get WorkCode.
	  * Work Code
	  */
	public String getWorkCode();
}
