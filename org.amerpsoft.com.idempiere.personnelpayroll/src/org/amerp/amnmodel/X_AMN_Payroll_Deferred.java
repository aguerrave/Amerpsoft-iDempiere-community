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
/** Generated Model - DO NOT CHANGE */
package org.amerp.amnmodel;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.Properties;
import org.compiere.model.*;
import org.compiere.util.Env;
import org.compiere.util.KeyNamePair;

/** Generated Model for AMN_Payroll_Deferred
 *  @author iDempiere (generated)
 *  @version Release 11 - $Id$ */
@org.adempiere.base.Model(table="AMN_Payroll_Deferred")
public class X_AMN_Payroll_Deferred extends PO implements I_AMN_Payroll_Deferred, I_Persistent
{

	/**
	 *
	 */
	private static final long serialVersionUID = 20250218L;

    /** Standard Constructor */
    public X_AMN_Payroll_Deferred (Properties ctx, int AMN_Payroll_Deferred_ID, String trxName)
    {
      super (ctx, AMN_Payroll_Deferred_ID, trxName);
      /** if (AMN_Payroll_Deferred_ID == 0)
        {
			setAMN_Concept_Types_Proc_ID (0);
			setAMN_Employee_ID (0);
// @AMN_Employee_ID@
			setAMN_Payroll_Deferred_ID (0);
			setAMN_Payroll_Deferred_UU (null);
			setAMN_Payroll_ID (0);
// @AMN_Payroll_ID@
			setAMN_Process_ID (0);
// @SQL=SELECT AMN_Process_ID FROM AMN_Process WHERE AMN_Process_VAlue='NN'
			setDescription (null);
			setIsPaid (false);
// N
			setLine (0);
			setQtyValue (Env.ZERO);
        } */
    }

    /** Standard Constructor */
    public X_AMN_Payroll_Deferred (Properties ctx, int AMN_Payroll_Deferred_ID, String trxName, String ... virtualColumns)
    {
      super (ctx, AMN_Payroll_Deferred_ID, trxName, virtualColumns);
      /** if (AMN_Payroll_Deferred_ID == 0)
        {
			setAMN_Concept_Types_Proc_ID (0);
			setAMN_Employee_ID (0);
// @AMN_Employee_ID@
			setAMN_Payroll_Deferred_ID (0);
			setAMN_Payroll_Deferred_UU (null);
			setAMN_Payroll_ID (0);
// @AMN_Payroll_ID@
			setAMN_Process_ID (0);
// @SQL=SELECT AMN_Process_ID FROM AMN_Process WHERE AMN_Process_VAlue='NN'
			setDescription (null);
			setIsPaid (false);
// N
			setLine (0);
			setQtyValue (Env.ZERO);
        } */
    }

    /** Standard Constructor */
    public X_AMN_Payroll_Deferred (Properties ctx, String AMN_Payroll_Deferred_UU, String trxName)
    {
      super (ctx, AMN_Payroll_Deferred_UU, trxName);
      /** if (AMN_Payroll_Deferred_UU == null)
        {
			setAMN_Concept_Types_Proc_ID (0);
			setAMN_Employee_ID (0);
// @AMN_Employee_ID@
			setAMN_Payroll_Deferred_ID (0);
			setAMN_Payroll_Deferred_UU (null);
			setAMN_Payroll_ID (0);
// @AMN_Payroll_ID@
			setAMN_Process_ID (0);
// @SQL=SELECT AMN_Process_ID FROM AMN_Process WHERE AMN_Process_VAlue='NN'
			setDescription (null);
			setIsPaid (false);
// N
			setLine (0);
			setQtyValue (Env.ZERO);
        } */
    }

    /** Standard Constructor */
    public X_AMN_Payroll_Deferred (Properties ctx, String AMN_Payroll_Deferred_UU, String trxName, String ... virtualColumns)
    {
      super (ctx, AMN_Payroll_Deferred_UU, trxName, virtualColumns);
      /** if (AMN_Payroll_Deferred_UU == null)
        {
			setAMN_Concept_Types_Proc_ID (0);
			setAMN_Employee_ID (0);
// @AMN_Employee_ID@
			setAMN_Payroll_Deferred_ID (0);
			setAMN_Payroll_Deferred_UU (null);
			setAMN_Payroll_ID (0);
// @AMN_Payroll_ID@
			setAMN_Process_ID (0);
// @SQL=SELECT AMN_Process_ID FROM AMN_Process WHERE AMN_Process_VAlue='NN'
			setDescription (null);
			setIsPaid (false);
// N
			setLine (0);
			setQtyValue (Env.ZERO);
        } */
    }

    /** Load Constructor */
    public X_AMN_Payroll_Deferred (Properties ctx, ResultSet rs, String trxName)
    {
      super (ctx, rs, trxName);
    }

    /** AccessLevel
      * @return 3 - Client - Org
      */
    protected int get_AccessLevel()
    {
      return accessLevel.intValue();
    }

    /** Load Meta Data */
    protected POInfo initPO (Properties ctx)
    {
      POInfo poi = POInfo.getPOInfo (ctx, Table_ID, get_TrxName());
      return poi;
    }

    public String toString()
    {
      StringBuilder sb = new StringBuilder ("X_AMN_Payroll_Deferred[")
        .append(get_ID()).append(",Name=").append(getName()).append("]");
      return sb.toString();
    }

	/** Set Payroll Concept Types Process.
		@param AMN_Concept_Types_Proc_ID Payroll Concept Types Process
	*/
	public void setAMN_Concept_Types_Proc_ID (int AMN_Concept_Types_Proc_ID)
	{
		if (AMN_Concept_Types_Proc_ID < 1)
			set_Value (COLUMNNAME_AMN_Concept_Types_Proc_ID, null);
		else
			set_Value (COLUMNNAME_AMN_Concept_Types_Proc_ID, Integer.valueOf(AMN_Concept_Types_Proc_ID));
	}

	/** Get Payroll Concept Types Process.
		@return Payroll Concept Types Process	  */
	public int getAMN_Concept_Types_Proc_ID()
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_AMN_Concept_Types_Proc_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	public I_AMN_Employee getAMN_Employee() throws RuntimeException
	{
		return (I_AMN_Employee)MTable.get(getCtx(), I_AMN_Employee.Table_ID)
			.getPO(getAMN_Employee_ID(), get_TrxName());
	}

	/** Set Payroll employee.
		@param AMN_Employee_ID Payroll employee
	*/
	public void setAMN_Employee_ID (int AMN_Employee_ID)
	{
		if (AMN_Employee_ID < 1)
			set_ValueNoCheck (COLUMNNAME_AMN_Employee_ID, null);
		else
			set_ValueNoCheck (COLUMNNAME_AMN_Employee_ID, Integer.valueOf(AMN_Employee_ID));
	}

	/** Get Payroll employee.
		@return Payroll employee	  */
	public int getAMN_Employee_ID()
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_AMN_Employee_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	/** Set Payroll Invoices Detail Deferred .
		@param AMN_Payroll_Deferred_ID Payroll Invoices Detail Deferred 
	*/
	public void setAMN_Payroll_Deferred_ID (int AMN_Payroll_Deferred_ID)
	{
		if (AMN_Payroll_Deferred_ID < 1)
			set_ValueNoCheck (COLUMNNAME_AMN_Payroll_Deferred_ID, null);
		else
			set_ValueNoCheck (COLUMNNAME_AMN_Payroll_Deferred_ID, Integer.valueOf(AMN_Payroll_Deferred_ID));
	}

	/** Get Payroll Invoices Detail Deferred .
		@return Payroll Invoices Detail Deferred 
	  */
	public int getAMN_Payroll_Deferred_ID()
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_AMN_Payroll_Deferred_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	/** Set AMN_Payroll_Deferred_UU.
		@param AMN_Payroll_Deferred_UU AMN_Payroll_Deferred_UU
	*/
	public void setAMN_Payroll_Deferred_UU (String AMN_Payroll_Deferred_UU)
	{
		set_ValueNoCheck (COLUMNNAME_AMN_Payroll_Deferred_UU, AMN_Payroll_Deferred_UU);
	}

	/** Get AMN_Payroll_Deferred_UU.
		@return AMN_Payroll_Deferred_UU	  */
	public String getAMN_Payroll_Deferred_UU()
	{
		return (String)get_Value(COLUMNNAME_AMN_Payroll_Deferred_UU);
	}

	/** Set AMN_Payroll_Detail_Parent_ID.
		@param AMN_Payroll_Detail_Parent_ID Link to Payroll Detail Transaction for Balances on LOAN type Concepts
	*/
	public void setAMN_Payroll_Detail_Parent_ID (int AMN_Payroll_Detail_Parent_ID)
	{
		if (AMN_Payroll_Detail_Parent_ID < 1)
			set_Value (COLUMNNAME_AMN_Payroll_Detail_Parent_ID, null);
		else
			set_Value (COLUMNNAME_AMN_Payroll_Detail_Parent_ID, Integer.valueOf(AMN_Payroll_Detail_Parent_ID));
	}

	/** Get AMN_Payroll_Detail_Parent_ID.
		@return Link to Payroll Detail Transaction for Balances on LOAN type Concepts
	  */
	public int getAMN_Payroll_Detail_Parent_ID()
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_AMN_Payroll_Detail_Parent_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	public I_AMN_Payroll getAMN_Payroll() throws RuntimeException
	{
		return (I_AMN_Payroll)MTable.get(getCtx(), I_AMN_Payroll.Table_ID)
			.getPO(getAMN_Payroll_ID(), get_TrxName());
	}

	/** Set Payroll Invoice.
		@param AMN_Payroll_ID Payroll Invoice
	*/
	public void setAMN_Payroll_ID (int AMN_Payroll_ID)
	{
		if (AMN_Payroll_ID < 1)
			set_ValueNoCheck (COLUMNNAME_AMN_Payroll_ID, null);
		else
			set_ValueNoCheck (COLUMNNAME_AMN_Payroll_ID, Integer.valueOf(AMN_Payroll_ID));
	}

	/** Get Payroll Invoice.
		@return Payroll Invoice	  */
	public int getAMN_Payroll_ID()
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_AMN_Payroll_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	/** Set Payroll Period.
		@param AMN_Period_ID Payroll Period
	*/
	public void setAMN_Period_ID (int AMN_Period_ID)
	{
		if (AMN_Period_ID < 1)
			set_Value (COLUMNNAME_AMN_Period_ID, null);
		else
			set_Value (COLUMNNAME_AMN_Period_ID, Integer.valueOf(AMN_Period_ID));
	}

	/** Get Payroll Period.
		@return Payroll Period	  */
	public int getAMN_Period_ID()
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_AMN_Period_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	public I_AMN_Process getAMN_Process() throws RuntimeException
	{
		return (I_AMN_Process)MTable.get(getCtx(), I_AMN_Process.Table_ID)
			.getPO(getAMN_Process_ID(), get_TrxName());
	}

	/** Set Payroll Process.
		@param AMN_Process_ID Payroll Process
	*/
	public void setAMN_Process_ID (int AMN_Process_ID)
	{
		if (AMN_Process_ID < 1)
			set_Value (COLUMNNAME_AMN_Process_ID, null);
		else
			set_Value (COLUMNNAME_AMN_Process_ID, Integer.valueOf(AMN_Process_ID));
	}

	/** Get Payroll Process.
		@return Payroll Process	  */
	public int getAMN_Process_ID()
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_AMN_Process_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	/** Set AmountAllocated.
		@param AmountAllocated Payroll Allocation
	*/
	public void setAmountAllocated (BigDecimal AmountAllocated)
	{
		set_Value (COLUMNNAME_AmountAllocated, AmountAllocated);
	}

	/** Get AmountAllocated.
		@return Payroll Allocation
	  */
	public BigDecimal getAmountAllocated()
	{
		BigDecimal bd = (BigDecimal)get_Value(COLUMNNAME_AmountAllocated);
		if (bd == null)
			 return Env.ZERO;
		return bd;
	}

	/** Set Amount Balance.
		@param AmountBalance AmountBalance for LOAN Type Concepts
	*/
	public void setAmountBalance (BigDecimal AmountBalance)
	{
		set_Value (COLUMNNAME_AmountBalance, AmountBalance);
	}

	/** Get Amount Balance.
		@return AmountBalance for LOAN Type Concepts
	  */
	public BigDecimal getAmountBalance()
	{
		BigDecimal bd = (BigDecimal)get_Value(COLUMNNAME_AmountBalance);
		if (bd == null)
			 return Env.ZERO;
		return bd;
	}

	/** Set AmountCalculated.
		@param AmountCalculated AmountCalculated
	*/
	public void setAmountCalculated (BigDecimal AmountCalculated)
	{
		set_Value (COLUMNNAME_AmountCalculated, AmountCalculated);
	}

	/** Get AmountCalculated.
		@return AmountCalculated	  */
	public BigDecimal getAmountCalculated()
	{
		BigDecimal bd = (BigDecimal)get_Value(COLUMNNAME_AmountCalculated);
		if (bd == null)
			 return Env.ZERO;
		return bd;
	}

	/** Set AmountDeducted.
		@param AmountDeducted Payroll Deduction
	*/
	public void setAmountDeducted (BigDecimal AmountDeducted)
	{
		set_Value (COLUMNNAME_AmountDeducted, AmountDeducted);
	}

	/** Get AmountDeducted.
		@return Payroll Deduction
	  */
	public BigDecimal getAmountDeducted()
	{
		BigDecimal bd = (BigDecimal)get_Value(COLUMNNAME_AmountDeducted);
		if (bd == null)
			 return Env.ZERO;
		return bd;
	}

	/** Set Loan Quota.
		@param AmountQuota Loan Quota 
	*/
	public void setAmountQuota (BigDecimal AmountQuota)
	{
		set_Value (COLUMNNAME_AmountQuota, AmountQuota);
	}

	/** Get Loan Quota.
		@return Loan Quota 
	  */
	public BigDecimal getAmountQuota()
	{
		BigDecimal bd = (BigDecimal)get_Value(COLUMNNAME_AmountQuota);
		if (bd == null)
			 return Env.ZERO;
		return bd;
	}

	public org.compiere.model.I_C_ConversionType getC_ConversionType() throws RuntimeException
	{
		return (org.compiere.model.I_C_ConversionType)MTable.get(getCtx(), org.compiere.model.I_C_ConversionType.Table_ID)
			.getPO(getC_ConversionType_ID(), get_TrxName());
	}

	/** Set Currency Type.
		@param C_ConversionType_ID Currency Conversion Rate Type
	*/
	public void setC_ConversionType_ID (int C_ConversionType_ID)
	{
		if (C_ConversionType_ID < 1)
			set_Value (COLUMNNAME_C_ConversionType_ID, null);
		else
			set_Value (COLUMNNAME_C_ConversionType_ID, Integer.valueOf(C_ConversionType_ID));
	}

	/** Get Currency Type.
		@return Currency Conversion Rate Type
	  */
	public int getC_ConversionType_ID()
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_C_ConversionType_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	public org.compiere.model.I_C_Currency getC_Currency() throws RuntimeException
	{
		return (org.compiere.model.I_C_Currency)MTable.get(getCtx(), org.compiere.model.I_C_Currency.Table_ID)
			.getPO(getC_Currency_ID(), get_TrxName());
	}

	/** Set Currency.
		@param C_Currency_ID The Currency for this record
	*/
	public void setC_Currency_ID (int C_Currency_ID)
	{
		if (C_Currency_ID < 1)
			set_Value (COLUMNNAME_C_Currency_ID, null);
		else
			set_Value (COLUMNNAME_C_Currency_ID, Integer.valueOf(C_Currency_ID));
	}

	/** Get Currency.
		@return The Currency for this record
	  */
	public int getC_Currency_ID()
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_C_Currency_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	public org.compiere.model.I_C_Invoice getC_Invoice() throws RuntimeException
	{
		return (org.compiere.model.I_C_Invoice)MTable.get(getCtx(), org.compiere.model.I_C_Invoice.Table_ID)
			.getPO(getC_Invoice_ID(), get_TrxName());
	}

	/** Set Invoice.
		@param C_Invoice_ID Invoice Identifier
	*/
	public void setC_Invoice_ID (int C_Invoice_ID)
	{
		if (C_Invoice_ID < 1)
			set_ValueNoCheck (COLUMNNAME_C_Invoice_ID, null);
		else
			set_ValueNoCheck (COLUMNNAME_C_Invoice_ID, Integer.valueOf(C_Invoice_ID));
	}

	/** Get Invoice.
		@return Invoice Identifier
	  */
	public int getC_Invoice_ID()
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_C_Invoice_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	public org.compiere.model.I_C_Payment getC_Payment() throws RuntimeException
	{
		return (org.compiere.model.I_C_Payment)MTable.get(getCtx(), org.compiere.model.I_C_Payment.Table_ID)
			.getPO(getC_Payment_ID(), get_TrxName());
	}

	/** Set Payment.
		@param C_Payment_ID Payment identifier
	*/
	public void setC_Payment_ID (int C_Payment_ID)
	{
		if (C_Payment_ID < 1)
			set_ValueNoCheck (COLUMNNAME_C_Payment_ID, null);
		else
			set_ValueNoCheck (COLUMNNAME_C_Payment_ID, Integer.valueOf(C_Payment_ID));
	}

	/** Get Payment.
		@return Payment identifier
	  */
	public int getC_Payment_ID()
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_C_Payment_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	/** Set Description.
		@param Description Optional short description of the record
	*/
	public void setDescription (String Description)
	{
		set_Value (COLUMNNAME_Description, Description);
	}

	/** Get Description.
		@return Optional short description of the record
	  */
	public String getDescription()
	{
		return (String)get_Value(COLUMNNAME_Description);
	}

	/** Set Due Date.
		@param DueDate Date when the payment is due
	*/
	public void setDueDate (Timestamp DueDate)
	{
		set_Value (COLUMNNAME_DueDate, DueDate);
	}

	/** Get Due Date.
		@return Date when the payment is due
	  */
	public Timestamp getDueDate()
	{
		return (Timestamp)get_Value(COLUMNNAME_DueDate);
	}

	/** Set Paid.
		@param IsPaid The document is fully paid
	*/
	public void setIsPaid (boolean IsPaid)
	{
		set_Value (COLUMNNAME_IsPaid, Boolean.valueOf(IsPaid));
	}

	/** Get Paid.
		@return The document is fully paid
	  */
	public boolean isPaid()
	{
		Object oo = get_Value(COLUMNNAME_IsPaid);
		if (oo != null)
		{
			 if (oo instanceof Boolean)
				 return ((Boolean)oo).booleanValue();
			return "Y".equals(oo);
		}
		return false;
	}

	/** Set Line No.
		@param Line Unique line for this document
	*/
	public void setLine (int Line)
	{
		set_Value (COLUMNNAME_Line, Integer.valueOf(Line));
	}

	/** Get Line No.
		@return Unique line for this document
	  */
	public int getLine()
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_Line);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	/** Set Name.
		@param Name Alphanumeric identifier of the entity
	*/
	public void setName (String Name)
	{
		set_Value (COLUMNNAME_Name, Name);
	}

	/** Get Name.
		@return Alphanumeric identifier of the entity
	  */
	public String getName()
	{
		return (String)get_Value(COLUMNNAME_Name);
	}

    /** Get Record ID/ColumnName
        @return ID/ColumnName pair
      */
    public KeyNamePair getKeyNamePair()
    {
        return new KeyNamePair(get_ID(), getName());
    }

	/** Set QtyValue.
		@param QtyValue QtyValue
	*/
	public void setQtyValue (BigDecimal QtyValue)
	{
		set_Value (COLUMNNAME_QtyValue, QtyValue);
	}

	/** Get QtyValue.
		@return QtyValue	  */
	public BigDecimal getQtyValue()
	{
		BigDecimal bd = (BigDecimal)get_Value(COLUMNNAME_QtyValue);
		if (bd == null)
			 return Env.ZERO;
		return bd;
	}

	/** Set Search Key.
		@param Value Search key for the record in the format required - must be unique
	*/
	public void setValue (String Value)
	{
		set_Value (COLUMNNAME_Value, Value);
	}

	/** Get Search Key.
		@return Search key for the record in the format required - must be unique
	  */
	public String getValue()
	{
		return (String)get_Value(COLUMNNAME_Value);
	}
}