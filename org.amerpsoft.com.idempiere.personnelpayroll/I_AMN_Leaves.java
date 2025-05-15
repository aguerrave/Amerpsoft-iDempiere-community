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

/** Generated Interface for AMN_Leaves
 *  @author iDempiere (generated) 
 *  @version Release 11
 */
@SuppressWarnings("all")
public interface I_AMN_Leaves 
{

    /** TableName=AMN_Leaves */
    public static final String Table_Name = "AMN_Leaves";

    /** AD_Table_ID=1000107 */
    public static final int Table_ID = MTable.getTable_ID(Table_Name);

    KeyNamePair Model = new KeyNamePair(Table_ID, Table_Name);

    /** AccessLevel = 3 - Client - Org 
     */
    BigDecimal accessLevel = BigDecimal.valueOf(3);

    /** Load Meta Data */

    /** Column name AD_Client_ID */
    public static final String COLUMNNAME_AD_Client_ID = "AD_Client_ID";

	/** Get Tenant.
	  * Tenant for this installation.
	  */
	public int getAD_Client_ID();

    /** Column name AD_Org_ID */
    public static final String COLUMNNAME_AD_Org_ID = "AD_Org_ID";

	/** Set Organization.
	  * Organizational entity within tenant
	  */
	public void setAD_Org_ID (int AD_Org_ID);

	/** Get Organization.
	  * Organizational entity within tenant
	  */
	public int getAD_Org_ID();

    /** Column name AMN_Employee_ID */
    public static final String COLUMNNAME_AMN_Employee_ID = "AMN_Employee_ID";

	/** Set Payroll employee	  */
	public void setAMN_Employee_ID (int AMN_Employee_ID);

	/** Get Payroll employee	  */
	public int getAMN_Employee_ID();

	public I_AMN_Employee getAMN_Employee() throws RuntimeException;

    /** Column name AMN_Leaves_ID */
    public static final String COLUMNNAME_AMN_Leaves_ID = "AMN_Leaves_ID";

	/** Set Leaves and Licences.
	  * Leaves and Licences
	  */
	public void setAMN_Leaves_ID (int AMN_Leaves_ID);

	/** Get Leaves and Licences.
	  * Leaves and Licences
	  */
	public int getAMN_Leaves_ID();

    /** Column name AMN_Leaves_Process */
    public static final String COLUMNNAME_AMN_Leaves_Process = "AMN_Leaves_Process";

	/** Set Leaves Process.
	  * Leaves Process to next valid step
	  */
	public void setAMN_Leaves_Process (String AMN_Leaves_Process);

	/** Get Leaves Process.
	  * Leaves Process to next valid step
	  */
	public String getAMN_Leaves_Process();

    /** Column name AMN_Leaves_Status */
    public static final String COLUMNNAME_AMN_Leaves_Status = "AMN_Leaves_Status";

	/** Set Leaves Status	  */
	public void setAMN_Leaves_Status (String AMN_Leaves_Status);

	/** Get Leaves Status	  */
	public String getAMN_Leaves_Status();

    /** Column name AMN_Leaves_Types_ID */
    public static final String COLUMNNAME_AMN_Leaves_Types_ID = "AMN_Leaves_Types_ID";

	/** Set Leaves Types	  */
	public void setAMN_Leaves_Types_ID (int AMN_Leaves_Types_ID);

	/** Get Leaves Types	  */
	public int getAMN_Leaves_Types_ID();

    /** Column name AMN_Leaves_UU */
    public static final String COLUMNNAME_AMN_Leaves_UU = "AMN_Leaves_UU";

	/** Set AMN_Leaves_UU	  */
	public void setAMN_Leaves_UU (String AMN_Leaves_UU);

	/** Get AMN_Leaves_UU	  */
	public String getAMN_Leaves_UU();

    /** Column name AMN_Payroll_ID */
    public static final String COLUMNNAME_AMN_Payroll_ID = "AMN_Payroll_ID";

	/** Set Payroll Invoice	  */
	public void setAMN_Payroll_ID (int AMN_Payroll_ID);

	/** Get Payroll Invoice	  */
	public int getAMN_Payroll_ID();

	public I_AMN_Payroll getAMN_Payroll() throws RuntimeException;

    /** Column name AMW_WorkFlow_ID */
    public static final String COLUMNNAME_AMW_WorkFlow_ID = "AMW_WorkFlow_ID";

	/** Set AMW Work Flows.
	  * Plugin AMW Work Flows defined by User
	  */
	public void setAMW_WorkFlow_ID (int AMW_WorkFlow_ID);

	/** Get AMW Work Flows.
	  * Plugin AMW Work Flows defined by User
	  */
	public int getAMW_WorkFlow_ID();

    /** Column name C_DocType_ID */
    public static final String COLUMNNAME_C_DocType_ID = "C_DocType_ID";

	/** Set Document Type.
	  * Document type or rules
	  */
	public void setC_DocType_ID (int C_DocType_ID);

	/** Get Document Type.
	  * Document type or rules
	  */
	public int getC_DocType_ID();

	public org.compiere.model.I_C_DocType getC_DocType() throws RuntimeException;

    /** Column name C_DocTypeTarget_ID */
    public static final String COLUMNNAME_C_DocTypeTarget_ID = "C_DocTypeTarget_ID";

	/** Set Target Document Type.
	  * Target document type for conversing documents
	  */
	public void setC_DocTypeTarget_ID (int C_DocTypeTarget_ID);

	/** Get Target Document Type.
	  * Target document type for conversing documents
	  */
	public int getC_DocTypeTarget_ID();

	public org.compiere.model.I_C_DocType getC_DocTypeTarget() throws RuntimeException;

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

    /** Column name DateDoc */
    public static final String COLUMNNAME_DateDoc = "DateDoc";

	/** Set Document Date.
	  * Date of the Document
	  */
	public void setDateDoc (Timestamp DateDoc);

	/** Get Document Date.
	  * Date of the Document
	  */
	public Timestamp getDateDoc();

    /** Column name DateFrom */
    public static final String COLUMNNAME_DateFrom = "DateFrom";

	/** Set Date From.
	  * Starting date for a range
	  */
	public void setDateFrom (Timestamp DateFrom);

	/** Get Date From.
	  * Starting date for a range
	  */
	public Timestamp getDateFrom();

    /** Column name DateTo */
    public static final String COLUMNNAME_DateTo = "DateTo";

	/** Set Date To.
	  * End date of a date range
	  */
	public void setDateTo (Timestamp DateTo);

	/** Get Date To.
	  * End date of a date range
	  */
	public Timestamp getDateTo();

    /** Column name DaysTo */
    public static final String COLUMNNAME_DaysTo = "DaysTo";

	/** Set Days To.
	  * Number of days To 
	  */
	public void setDaysTo (BigDecimal DaysTo);

	/** Get Days To.
	  * Number of days To 
	  */
	public BigDecimal getDaysTo();

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

    /** Column name DocStatus */
    public static final String COLUMNNAME_DocStatus = "DocStatus";

	/** Set Document Status.
	  * The current status of the document
	  */
	public void setDocStatus (String DocStatus);

	/** Get Document Status.
	  * The current status of the document
	  */
	public String getDocStatus();

    /** Column name DocumentNo */
    public static final String COLUMNNAME_DocumentNo = "DocumentNo";

	/** Set Document No.
	  * Document sequence number of the document
	  */
	public void setDocumentNo (String DocumentNo);

	/** Get Document No.
	  * Document sequence number of the document
	  */
	public String getDocumentNo();

    /** Column name HoursDay */
    public static final String COLUMNNAME_HoursDay = "HoursDay";

	/** Set Hours per day in a Shift	  */
	public void setHoursDay (BigDecimal HoursDay);

	/** Get Hours per day in a Shift	  */
	public BigDecimal getHoursDay();

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

    /** Column name IsApproved */
    public static final String COLUMNNAME_IsApproved = "IsApproved";

	/** Set Approved.
	  * Indicates if this document requires approval
	  */
	public void setIsApproved (boolean IsApproved);

	/** Get Approved.
	  * Indicates if this document requires approval
	  */
	public boolean isApproved();

    /** Column name IsOverrideCalc */
    public static final String COLUMNNAME_IsOverrideCalc = "IsOverrideCalc";

	/** Set Override Calculations.
	  * Override Calculations on Dates
	  */
	public void setIsOverrideCalc (boolean IsOverrideCalc);

	/** Get Override Calculations.
	  * Override Calculations on Dates
	  */
	public boolean isOverrideCalc();

    /** Column name Name */
    public static final String COLUMNNAME_Name = "Name";

	/** Set Name.
	  * Alphanumeric identifier of the entity
	  */
	public void setName (String Name);

	/** Get Name.
	  * Alphanumeric identifier of the entity
	  */
	public String getName();

    /** Column name Note */
    public static final String COLUMNNAME_Note = "Note";

	/** Set Note.
	  * Optional additional user defined information
	  */
	public void setNote (String Note);

	/** Get Note.
	  * Optional additional user defined information
	  */
	public String getNote();

    /** Column name Processed */
    public static final String COLUMNNAME_Processed = "Processed";

	/** Set Processed.
	  * The document has been processed
	  */
	public void setProcessed (boolean Processed);

	/** Get Processed.
	  * The document has been processed
	  */
	public boolean isProcessed();

    /** Column name ProcessedOn */
    public static final String COLUMNNAME_ProcessedOn = "ProcessedOn";

	/** Set Processed On.
	  * The date+time (expressed in decimal format) when the document has been processed
	  */
	public void setProcessedOn (BigDecimal ProcessedOn);

	/** Get Processed On.
	  * The date+time (expressed in decimal format) when the document has been processed
	  */
	public BigDecimal getProcessedOn();

    /** Column name Processing */
    public static final String COLUMNNAME_Processing = "Processing";

	/** Set Process Now	  */
	public void setProcessing (boolean Processing);

	/** Get Process Now	  */
	public boolean isProcessing();

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
