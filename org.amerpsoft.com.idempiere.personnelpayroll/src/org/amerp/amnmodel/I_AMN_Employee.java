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

/** Generated Interface for AMN_Employee
 *  @author iDempiere (generated) 
 *  @version Release 2.1
 */
@SuppressWarnings("all")
public interface I_AMN_Employee 
{

    /** TableName=AMN_Employee */
    public static final String Table_Name = "AMN_Employee";

    /** AD_Table_ID=1000033 */
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

    /** Column name AMN_Contract_ID */
    public static final String COLUMNNAME_AMN_Contract_ID = "AMN_Contract_ID";

	/** Set Payroll Contract	  */
	public void setAMN_Contract_ID (int AMN_Contract_ID);

	/** Get Payroll Contract	  */
	public int getAMN_Contract_ID();

    /** Column name AMN_Department_ID */
    public static final String COLUMNNAME_AMN_Department_ID = "AMN_Department_ID";

	/** Set Payroll Department	  */
	public void setAMN_Department_ID (int AMN_Department_ID);

	/** Get Payroll Department	  */
	public int getAMN_Department_ID();

    /** Column name AMN_Employee_ID */
    public static final String COLUMNNAME_AMN_Employee_ID = "AMN_Employee_ID";

	/** Set Payroll employee	  */
	public void setAMN_Employee_ID (int AMN_Employee_ID);

	/** Get Payroll employee	  */
	public int getAMN_Employee_ID();

    /** Column name AMN_Employee_UU */
    public static final String COLUMNNAME_AMN_Employee_UU = "AMN_Employee_UU";

	/** Set AMN_Employee_UU	  */
	public void setAMN_Employee_UU (String AMN_Employee_UU);

	/** Get AMN_Employee_UU	  */
	public String getAMN_Employee_UU();

    /** Column name AMN_Jobstation_ID */
    public static final String COLUMNNAME_AMN_Jobstation_ID = "AMN_Jobstation_ID";

	/** Set Payroll Job Station	  */
	public void setAMN_Jobstation_ID (int AMN_Jobstation_ID);

	/** Get Payroll Job Station	  */
	public int getAMN_Jobstation_ID();

	public I_AMN_Jobstation getAMN_Jobstation() throws RuntimeException;

    /** Column name AMN_Jobtitle_ID */
    public static final String COLUMNNAME_AMN_Jobtitle_ID = "AMN_Jobtitle_ID";

	/** Set Payroll Job Title	  */
	public void setAMN_Jobtitle_ID (int AMN_Jobtitle_ID);

	/** Get Payroll Job Title	  */
	public int getAMN_Jobtitle_ID();

	public I_AMN_Jobtitle getAMN_Jobtitle() throws RuntimeException;

    /** Column name AMN_Location_ID */
    public static final String COLUMNNAME_AMN_Location_ID = "AMN_Location_ID";

	/** Set Payroll Location	  */
	public void setAMN_Location_ID (int AMN_Location_ID);

	/** Get Payroll Location	  */
	public int getAMN_Location_ID();

    /** Column name AMN_Position_ID */
    public static final String COLUMNNAME_AMN_Position_ID = "AMN_Position_ID";

	/** Set Payroll Position	  */
	public void setAMN_Position_ID (int AMN_Position_ID);

	/** Get Payroll Position	  */
	public int getAMN_Position_ID();

    /** Column name AMN_Shift_ID */
    public static final String COLUMNNAME_AMN_Shift_ID = "AMN_Shift_ID";

	/** Set Shift	  */
	public void setAMN_Shift_ID (int AMN_Shift_ID);

	/** Get Shift	  */
	public int getAMN_Shift_ID();

    /** Column name Alergic */
    public static final String COLUMNNAME_Alergic = "Alergic";

	/** Set Alergic.
	  * Alergic to chemicals ór Medicament
	  */
	public void setAlergic (String Alergic);

	/** Get Alergic.
	  * Alergic to chemicals ór Medicament
	  */
	public String getAlergic();

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

    /** Column name Birthday */
    public static final String COLUMNNAME_Birthday = "Birthday";

	/** Set Birthday.
	  * Birthday or Anniversary day
	  */
	public void setBirthday (Timestamp Birthday);

	/** Get Birthday.
	  * Birthday or Anniversary day
	  */
	public Timestamp getBirthday();

    /** Column name C_Activity_ID */
    public static final String COLUMNNAME_C_Activity_ID = "C_Activity_ID";

	/** Set Activity.
	  * Business Activity
	  */
	public void setC_Activity_ID (int C_Activity_ID);

	/** Get Activity.
	  * Business Activity
	  */
	public int getC_Activity_ID();

	public org.compiere.model.I_C_Activity getC_Activity() throws RuntimeException;

    /** Column name C_BPartner_ID */
    public static final String COLUMNNAME_C_BPartner_ID = "C_BPartner_ID";

	/** Set Business Partner .
	  * Identifies a Business Partner
	  */
	public void setC_BPartner_ID (int C_BPartner_ID);

	/** Get Business Partner .
	  * Identifies a Business Partner
	  */
	public int getC_BPartner_ID();

	public org.compiere.model.I_C_BPartner getC_BPartner() throws RuntimeException;

    /** Column name C_Campaign_ID */
    public static final String COLUMNNAME_C_Campaign_ID = "C_Campaign_ID";

	/** Set Campaign.
	  * Marketing Campaign
	  */
	public void setC_Campaign_ID (int C_Campaign_ID);

	/** Get Campaign.
	  * Marketing Campaign
	  */
	public int getC_Campaign_ID();

	public org.compiere.model.I_C_Campaign getC_Campaign() throws RuntimeException;

    /** Column name C_Country_ID */
    public static final String COLUMNNAME_C_Country_ID = "C_Country_ID";

	/** Set Country.
	  * Country 
	  */
	public void setC_Country_ID (int C_Country_ID);

	/** Get Country.
	  * Country 
	  */
	public int getC_Country_ID();

	public org.compiere.model.I_C_Country getC_Country() throws RuntimeException;

    /** Column name C_Project_ID */
    public static final String COLUMNNAME_C_Project_ID = "C_Project_ID";

	/** Set Project.
	  * Financial Project
	  */
	public void setC_Project_ID (int C_Project_ID);

	/** Get Project.
	  * Financial Project
	  */
	public int getC_Project_ID();

	public org.compiere.model.I_C_Project getC_Project() throws RuntimeException;

    /** Column name C_SalesRegion_ID */
    public static final String COLUMNNAME_C_SalesRegion_ID = "C_SalesRegion_ID";

	/** Set Sales Region.
	  * Sales coverage region
	  */
	public void setC_SalesRegion_ID (int C_SalesRegion_ID);

	/** Get Sales Region.
	  * Sales coverage region
	  */
	public int getC_SalesRegion_ID();

	public org.compiere.model.I_C_SalesRegion getC_SalesRegion() throws RuntimeException;

    /** Column name CountryofNacionality_ID */
    public static final String COLUMNNAME_CountryofNacionality_ID = "CountryofNacionality_ID";

	/** Set Nacionality	  */
	public void setCountryofNacionality_ID (int CountryofNacionality_ID);

	/** Get Nacionality	  */
	public int getCountryofNacionality_ID();

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

    /** Column name Deseases */
    public static final String COLUMNNAME_Deseases = "Deseases";

	/** Set Deseases.
	  * Deseases affected for person
	  */
	public void setDeseases (String Deseases);

	/** Get Deseases.
	  * Deseases affected for person
	  */
	public String getDeseases();

    /** Column name EMail */
    public static final String COLUMNNAME_EMail = "EMail";

	/** Set EMail Address.
	  * Electronic Mail Address
	  */
	public void setEMail (String EMail);

	/** Get EMail Address.
	  * Electronic Mail Address
	  */
	public String getEMail();

    /** Column name HandUse */
    public static final String COLUMNNAME_HandUse = "HandUse";

	/** Set HandUse.
	  * Indicates if person uses Left hand, right hand or both 
	  */
	public void setHandUse (String HandUse);

	/** Get HandUse.
	  * Indicates if person uses Left hand, right hand or both 
	  */
	public String getHandUse();

    /** Column name Height */
    public static final String COLUMNNAME_Height = "Height";

	/** Set Height	  */
	public void setHeight (BigDecimal Height);

	/** Get Height	  */
	public BigDecimal getHeight();

    /** Column name Hobbyes */
    public static final String COLUMNNAME_Hobbyes = "Hobbyes";

	/** Set Hobbyes.
	  * Hobbyes practicated 
	  */
	public void setHobbyes (String Hobbyes);

	/** Get Hobbyes.
	  * Hobbyes practicated 
	  */
	public String getHobbyes();

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

    /** Column name Salary */
    public static final String COLUMNNAME_Salary = "Salary";

	/** Set Salary	  */
	public void setSalary (BigDecimal Salary);

	/** Get Salary	  */
	public BigDecimal getSalary();

    /** Column name SizePant */
    public static final String COLUMNNAME_SizePant = "SizePant";

	/** Set Size Pant.
	  * Pant size for Person
	  */
	public void setSizePant (String SizePant);

	/** Get Size Pant.
	  * Pant size for Person
	  */
	public String getSizePant();

    /** Column name SizeShirt */
    public static final String COLUMNNAME_SizeShirt = "SizeShirt";

	/** Set Size Shirt.
	  * Size Shirt for Person
	  */
	public void setSizeShirt (String SizeShirt);

	/** Get Size Shirt.
	  * Size Shirt for Person
	  */
	public String getSizeShirt();

    /** Column name SizeShoe */
    public static final String COLUMNNAME_SizeShoe = "SizeShoe";

	/** Set SizeShoe.
	  * Shoe size for Person
	  */
	public void setSizeShoe (String SizeShoe);

	/** Get SizeShoe.
	  * Shoe size for Person
	  */
	public String getSizeShoe();

    /** Column name Sports */
    public static final String COLUMNNAME_Sports = "Sports";

	/** Set Sports.
	  * Sports practicated
	  */
	public void setSports (String Sports);

	/** Get Sports.
	  * Sports practicated
	  */
	public String getSports();

    /** Column name Status */
    public static final String COLUMNNAME_Status = "Status";

	/** Set Status.
	  * Status of the currently running check
	  */
	public void setStatus (String Status);

	/** Get Status.
	  * Status of the currently running check
	  */
	public String getStatus();

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

    /** Column name UseLenses */
    public static final String COLUMNNAME_UseLenses = "UseLenses";

	/** Set Use Lenses.
	  * Indicates if person uses lenses
	  */
	public void setUseLenses (boolean UseLenses);

	/** Get Use Lenses.
	  * Indicates if person uses lenses
	  */
	public boolean isUseLenses();

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

    /** Column name Weight */
    public static final String COLUMNNAME_Weight = "Weight";

	/** Set Weight.
	  * Weight of a product
	  */
	public void setWeight (BigDecimal Weight);

	/** Get Weight.
	  * Weight of a product
	  */
	public BigDecimal getWeight();

    /** Column name birthplace */
    public static final String COLUMNNAME_birthplace = "birthplace";

	/** Set birthplace	  */
	public void setbirthplace (String birthplace);

	/** Get birthplace	  */
	public String getbirthplace();

    /** Column name bloodrh */
    public static final String COLUMNNAME_bloodrh = "bloodrh";

	/** Set bloodrh	  */
	public void setbloodrh (String bloodrh);

	/** Get bloodrh	  */
	public String getbloodrh();

    /** Column name bloodtype */
    public static final String COLUMNNAME_bloodtype = "bloodtype";

	/** Set bloodtype	  */
	public void setbloodtype (String bloodtype);

	/** Get bloodtype	  */
	public String getbloodtype();

    /** Column name civilstatus */
    public static final String COLUMNNAME_civilstatus = "civilstatus";

	/** Set civilstatus	  */
	public void setcivilstatus (String civilstatus);

	/** Get civilstatus	  */
	public String getcivilstatus();

    /** Column name downwardloads */
    public static final String COLUMNNAME_downwardloads = "downwardloads";

	/** Set downwardloads	  */
	public void setdownwardloads (BigDecimal downwardloads);

	/** Get downwardloads	  */
	public BigDecimal getdownwardloads();

    /** Column name educationgrade */
    public static final String COLUMNNAME_educationgrade = "educationgrade";

	/** Set educationgrade	  */
	public void seteducationgrade (String educationgrade);

	/** Get educationgrade	  */
	public String geteducationgrade();

    /** Column name educationlevel */
    public static final String COLUMNNAME_educationlevel = "educationlevel";

	/** Set educationlevel	  */
	public void seteducationlevel (String educationlevel);

	/** Get educationlevel	  */
	public String geteducationlevel();

    /** Column name egresscondition */
    public static final String COLUMNNAME_egresscondition = "egresscondition";

	/** Set egresscondition	  */
	public void setegresscondition (String egresscondition);

	/** Get egresscondition	  */
	public String getegresscondition();

    /** Column name egressdate */
    public static final String COLUMNNAME_egressdate = "egressdate";

	/** Set egressdate	  */
	public void setegressdate (Timestamp egressdate);

	/** Get egressdate	  */
	public Timestamp getegressdate();

    /** Column name empimg1_ID */
    public static final String COLUMNNAME_empimg1_ID = "empimg1_ID";

	/** Set Employee Image 1.
	  * Employee Image 1
	  */
	public void setempimg1_ID (int empimg1_ID);

	/** Get Employee Image 1.
	  * Employee Image 1
	  */
	public int getempimg1_ID();

    /** Column name empimg2_ID */
    public static final String COLUMNNAME_empimg2_ID = "empimg2_ID";

	/** Set Employee Image 2.
	  * Employee Image 2
	  */
	public void setempimg2_ID (int empimg2_ID);

	/** Get Employee Image 2.
	  * Employee Image 2
	  */
	public int getempimg2_ID();

    /** Column name incomedate */
    public static final String COLUMNNAME_incomedate = "incomedate";

	/** Set incomedate	  */
	public void setincomedate (Timestamp incomedate);

	/** Get incomedate	  */
	public Timestamp getincomedate();

    /** Column name increasingloads */
    public static final String COLUMNNAME_increasingloads = "increasingloads";

	/** Set increasingloads	  */
	public void setincreasingloads (BigDecimal increasingloads);

	/** Get increasingloads	  */
	public BigDecimal getincreasingloads();

    /** Column name isMedicated */
    public static final String COLUMNNAME_isMedicated = "isMedicated";

	/** Set Is Medicated.
	  * Indicates if person is Medicated
	  */
	public void setisMedicated (boolean isMedicated);

	/** Get Is Medicated.
	  * Indicates if person is Medicated
	  */
	public boolean isMedicated();

    /** Column name isPensioned */
    public static final String COLUMNNAME_isPensioned = "isPensioned";

	/** Set Is Pensioned.
	  * Indicates if employee is Pensioned by Social Security
	  */
	public void setisPensioned (boolean isPensioned);

	/** Get Is Pensioned.
	  * Indicates if employee is Pensioned by Social Security
	  */
	public boolean isPensioned();

    /** Column name isStudying */
    public static final String COLUMNNAME_isStudying = "isStudying";

	/** Set isStudying.
	  * Indicates if is studying
	  */
	public void setisStudying (boolean isStudying);

	/** Get isStudying.
	  * Indicates if is studying
	  */
	public boolean isStudying();

    /** Column name jobcondition */
    public static final String COLUMNNAME_jobcondition = "jobcondition";

	/** Set jobcondition	  */
	public void setjobcondition (String jobcondition);

	/** Get jobcondition	  */
	public String getjobcondition();

    /** Column name paymenttype */
    public static final String COLUMNNAME_paymenttype = "paymenttype";

	/** Set paymenttype	  */
	public void setpaymenttype (String paymenttype);

	/** Get paymenttype	  */
	public String getpaymenttype();

    /** Column name payrollmode */
    public static final String COLUMNNAME_payrollmode = "payrollmode";

	/** Set payrollmode	  */
	public void setpayrollmode (String payrollmode);

	/** Get payrollmode	  */
	public String getpayrollmode();

    /** Column name privateassist */
    public static final String COLUMNNAME_privateassist = "privateassist";

	/** Set privateassist	  */
	public void setprivateassist (String privateassist);

	/** Get privateassist	  */
	public String getprivateassist();

    /** Column name profession */
    public static final String COLUMNNAME_profession = "profession";

	/** Set profession	  */
	public void setprofession (String profession);

	/** Get profession	  */
	public String getprofession();

    /** Column name sex */
    public static final String COLUMNNAME_sex = "sex";

	/** Set sex	  */
	public void setsex (String sex);

	/** Get sex	  */
	public String getsex();

    /** Column name spouse */
    public static final String COLUMNNAME_spouse = "spouse";

	/** Set spouse	  */
	public void setspouse (String spouse);

	/** Get spouse	  */
	public String getspouse();

    /** Column name zodiacsign */
    public static final String COLUMNNAME_zodiacsign = "zodiacsign";

	/** Set zodiacsign	  */
	public void setzodiacsign (String zodiacsign);

	/** Get zodiacsign	  */
	public String getzodiacsign();
}
