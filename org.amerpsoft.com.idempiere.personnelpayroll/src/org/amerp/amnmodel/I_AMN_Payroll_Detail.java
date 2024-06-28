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

/** Generated Interface for AMN_Payroll_Detail
 *  @author iDempiere (generated) 
 *  @version Release 5.1
 */
@SuppressWarnings("all")
public interface I_AMN_Payroll_Detail 
{

    /** TableName=AMN_Payroll_Detail */
    public static final String Table_Name = "AMN_Payroll_Detail";

    /** AD_Table_ID=1000128 */
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

    /** Column name AMN_Concept_Types_Proc_ID */
    public static final String COLUMNNAME_AMN_Concept_Types_Proc_ID = "AMN_Concept_Types_Proc_ID";

	/** Set Payroll Concept Types Process	  */
	public void setAMN_Concept_Types_Proc_ID (int AMN_Concept_Types_Proc_ID);

	/** Get Payroll Concept Types Process	  */
	public int getAMN_Concept_Types_Proc_ID();

	public I_AMN_Concept_Types_Proc getAMN_Concept_Types_Proc() throws RuntimeException;

    /** Column name AMN_Concept_Uom_ID */
    public static final String COLUMNNAME_AMN_Concept_Uom_ID = "AMN_Concept_Uom_ID";

	/** Set Payroll Concepts UOM	  */
	public void setAMN_Concept_Uom_ID (int AMN_Concept_Uom_ID);

	/** Get Payroll Concepts UOM	  */
	public int getAMN_Concept_Uom_ID();

    /** Column name AMN_Payroll_Detail_ID */
    public static final String COLUMNNAME_AMN_Payroll_Detail_ID = "AMN_Payroll_Detail_ID";

	/** Set Payroll Invoices Detail	  */
	public void setAMN_Payroll_Detail_ID (int AMN_Payroll_Detail_ID);

	/** Get Payroll Invoices Detail	  */
	public int getAMN_Payroll_Detail_ID();

    /** Column name AMN_Payroll_Detail_Parent_ID */
    public static final String COLUMNNAME_AMN_Payroll_Detail_Parent_ID = "AMN_Payroll_Detail_Parent_ID";

	/** Set AMN_Payroll_Detail_Parent_ID.
	  * Link to Payroll Detail Transaction for Balances on LOAN type Concepts
	  */
	public void setAMN_Payroll_Detail_Parent_ID (int AMN_Payroll_Detail_Parent_ID);

	/** Get AMN_Payroll_Detail_Parent_ID.
	  * Link to Payroll Detail Transaction for Balances on LOAN type Concepts
	  */
	public int getAMN_Payroll_Detail_Parent_ID();

    /** Column name AMN_Payroll_Detail_UU */
    public static final String COLUMNNAME_AMN_Payroll_Detail_UU = "AMN_Payroll_Detail_UU";

	/** Set AMN_Payroll_Detail_UU	  */
	public void setAMN_Payroll_Detail_UU (String AMN_Payroll_Detail_UU);

	/** Get AMN_Payroll_Detail_UU	  */
	public String getAMN_Payroll_Detail_UU();

    /** Column name AMN_Payroll_ID */
    public static final String COLUMNNAME_AMN_Payroll_ID = "AMN_Payroll_ID";

	/** Set Payroll Invoice	  */
	public void setAMN_Payroll_ID (int AMN_Payroll_ID);

	/** Get Payroll Invoice	  */
	public int getAMN_Payroll_ID();

	public I_AMN_Payroll getAMN_Payroll() throws RuntimeException;

    /** Column name AmountAllocated */
    public static final String COLUMNNAME_AmountAllocated = "AmountAllocated";

	/** Set AmountAllocated.
	  * Payroll Allocation
	  */
	public void setAmountAllocated (BigDecimal AmountAllocated);

	/** Get AmountAllocated.
	  * Payroll Allocation
	  */
	public BigDecimal getAmountAllocated();

    /** Column name AmountBalance */
    public static final String COLUMNNAME_AmountBalance = "AmountBalance";

	/** Set Amount Balance.
	  * AmountBalance for LOAN Type Concepts
	  */
	public void setAmountBalance (BigDecimal AmountBalance);

	/** Get Amount Balance.
	  * AmountBalance for LOAN Type Concepts
	  */
	public BigDecimal getAmountBalance();

    /** Column name AmountCalculated */
    public static final String COLUMNNAME_AmountCalculated = "AmountCalculated";

	/** Set AmountCalculated	  */
	public void setAmountCalculated (BigDecimal AmountCalculated);

	/** Get AmountCalculated	  */
	public BigDecimal getAmountCalculated();

    /** Column name AmountDeducted */
    public static final String COLUMNNAME_AmountDeducted = "AmountDeducted";

	/** Set AmountDeducted.
	  * Payroll Deduction
	  */
	public void setAmountDeducted (BigDecimal AmountDeducted);

	/** Get AmountDeducted.
	  * Payroll Deduction
	  */
	public BigDecimal getAmountDeducted();

    /** Column name AmountQuota */
    public static final String COLUMNNAME_AmountQuota = "AmountQuota";

	/** Set Loan Quota.
	  * Loan Quota 
	  */
	public void setAmountQuota (BigDecimal AmountQuota);

	/** Get Loan Quota.
	  * Loan Quota 
	  */
	public BigDecimal getAmountQuota();

    /** Column name C_Invoice_ID */
    public static final String COLUMNNAME_C_Invoice_ID = "C_Invoice_ID";

	/** Set Invoice.
	  * Invoice Identifier
	  */
	public void setC_Invoice_ID (int C_Invoice_ID);

	/** Get Invoice.
	  * Invoice Identifier
	  */
	public int getC_Invoice_ID();

	public org.compiere.model.I_C_Invoice getC_Invoice() throws RuntimeException;

    /** Column name C_Payment_ID */
    public static final String COLUMNNAME_C_Payment_ID = "C_Payment_ID";

	/** Set Payment.
	  * Payment identifier
	  */
	public void setC_Payment_ID (int C_Payment_ID);

	/** Get Payment.
	  * Payment identifier
	  */
	public int getC_Payment_ID();

	public org.compiere.model.I_C_Payment getC_Payment() throws RuntimeException;

    /** Column name CalcOrder */
    public static final String COLUMNNAME_CalcOrder = "CalcOrder";

	/** Set CalcOrder	  */
	public void setCalcOrder (int CalcOrder);

	/** Get CalcOrder	  */
	public int getCalcOrder();

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

    /** Column name Line */
    public static final String COLUMNNAME_Line = "Line";

	/** Set Line No.
	  * Unique line for this document
	  */
	public void setLine (int Line);

	/** Get Line No.
	  * Unique line for this document
	  */
	public int getLine();

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

    /** Column name QtyValue */
    public static final String COLUMNNAME_QtyValue = "QtyValue";

	/** Set QtyValue	  */
	public void setQtyValue (BigDecimal QtyValue);

	/** Get QtyValue	  */
	public BigDecimal getQtyValue();

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

    /** Column name Value */
    public static final String COLUMNNAME_Value = "Value";

	/** Set Search Key.
	  * Search key for the record in the format required - must be unique
	  */
	public void setValue (String Value);

	/** Get Search Key.
	  * Search key for the record in the format required - must be unique
	  */
	public String getValue();
}
