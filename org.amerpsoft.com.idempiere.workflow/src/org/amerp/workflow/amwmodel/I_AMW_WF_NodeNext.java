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
package org.amerp.workflow.amwmodel;

import java.math.BigDecimal;
import java.sql.Timestamp;
import org.compiere.model.*;
import org.compiere.util.KeyNamePair;

/** Generated Interface for AMW_WF_NodeNext
 *  @author iDempiere (generated) 
 *  @version Release 11
 */
@SuppressWarnings("all")
public interface I_AMW_WF_NodeNext 
{

    /** TableName=AMW_WF_NodeNext */
    public static final String Table_Name = "AMW_WF_NodeNext";

    /** AD_Table_ID=1000197 */
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

    /** Column name AMW_WF_Next_ID */
    public static final String COLUMNNAME_AMW_WF_Next_ID = "AMW_WF_Next_ID";

	/** Set AMW Work Flow Next ID.
	  * AMW Work Flow Next ID
	  */
	public void setAMW_WF_Next_ID (int AMW_WF_Next_ID);

	/** Get AMW Work Flow Next ID.
	  * AMW Work Flow Next ID
	  */
	public int getAMW_WF_Next_ID();

    /** Column name AMW_WF_Node_ID */
    public static final String COLUMNNAME_AMW_WF_Node_ID = "AMW_WF_Node_ID";

	/** Set AMW Work Flow Nodes.
	  * AMW Work Flow Nodes
	  */
	public void setAMW_WF_Node_ID (int AMW_WF_Node_ID);

	/** Get AMW Work Flow Nodes.
	  * AMW Work Flow Nodes
	  */
	public int getAMW_WF_Node_ID();

	public I_AMW_WF_Node getAMW_WF_Node() throws RuntimeException;

    /** Column name AMW_WF_NodeNext_ID */
    public static final String COLUMNNAME_AMW_WF_NodeNext_ID = "AMW_WF_NodeNext_ID";

	/** Set AMW Work Flow Node Next ID.
	  * AMW Work Flow Node Next ID
	  */
	public void setAMW_WF_NodeNext_ID (int AMW_WF_NodeNext_ID);

	/** Get AMW Work Flow Node Next ID.
	  * AMW Work Flow Node Next ID
	  */
	public int getAMW_WF_NodeNext_ID();

    /** Column name AMW_WF_NodeNext_UU */
    public static final String COLUMNNAME_AMW_WF_NodeNext_UU = "AMW_WF_NodeNext_UU";

	/** Set AMW_WF_NodeNext_UU	  */
	public void setAMW_WF_NodeNext_UU (String AMW_WF_NodeNext_UU);

	/** Get AMW_WF_NodeNext_UU	  */
	public String getAMW_WF_NodeNext_UU();

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

    /** Column name SeqNo */
    public static final String COLUMNNAME_SeqNo = "SeqNo";

	/** Set Sequence.
	  * Method of ordering records;
 lowest number comes first
	  */
	public void setSeqNo (int SeqNo);

	/** Get Sequence.
	  * Method of ordering records;
 lowest number comes first
	  */
	public int getSeqNo();

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
