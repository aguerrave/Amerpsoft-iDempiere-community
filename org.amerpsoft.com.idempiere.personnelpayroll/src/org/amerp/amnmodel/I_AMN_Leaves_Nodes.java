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

/** Generated Interface for AMN_Leaves_Nodes
 *  @author iDempiere (generated) 
 *  @version Release 11
 */
@SuppressWarnings("all")
public interface I_AMN_Leaves_Nodes 
{

    /** TableName=AMN_Leaves_Nodes */
    public static final String Table_Name = "AMN_Leaves_Nodes";

    /** AD_Table_ID=1000192 */
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

    /** Column name AMN_Leaves_Flow_ID */
    public static final String COLUMNNAME_AMN_Leaves_Flow_ID = "AMN_Leaves_Flow_ID";

	/** Set Leaves and Licences Work Flow.
	  * Leaves and Licences Work Flow
	  */
	public void setAMN_Leaves_Flow_ID (int AMN_Leaves_Flow_ID);

	/** Get Leaves and Licences Work Flow.
	  * Leaves and Licences Work Flow
	  */
	public int getAMN_Leaves_Flow_ID();

	public I_AMN_Leaves_Flow getAMN_Leaves_Flow() throws RuntimeException;

    /** Column name AMN_Leaves_Nodes_ID */
    public static final String COLUMNNAME_AMN_Leaves_Nodes_ID = "AMN_Leaves_Nodes_ID";

	/** Set Leaves and Licences Work Flow Nodes.
	  * Leaves and Licences Work Flow Nodes
	  */
	public void setAMN_Leaves_Nodes_ID (int AMN_Leaves_Nodes_ID);

	/** Get Leaves and Licences Work Flow Nodes.
	  * Leaves and Licences Work Flow Nodes
	  */
	public int getAMN_Leaves_Nodes_ID();

    /** Column name AMN_Leaves_NodesNext_ID */
    public static final String COLUMNNAME_AMN_Leaves_NodesNext_ID = "AMN_Leaves_NodesNext_ID";

	/** Set Leaves and Licences Work Flow Nodes Next.
	  * Leaves and Licences Work Flow Nodes Next
	  */
	public void setAMN_Leaves_NodesNext_ID (int AMN_Leaves_NodesNext_ID);

	/** Get Leaves and Licences Work Flow Nodes Next.
	  * Leaves and Licences Work Flow Nodes Next
	  */
	public int getAMN_Leaves_NodesNext_ID();

	public I_AMN_Leaves_Flow getAMN_Leaves_NodesNext() throws RuntimeException;

    /** Column name AMN_Leaves_Nodes_UU */
    public static final String COLUMNNAME_AMN_Leaves_Nodes_UU = "AMN_Leaves_Nodes_UU";

	/** Set AMN_Leaves_Nodes_UU	  */
	public void setAMN_Leaves_Nodes_UU (String AMN_Leaves_Nodes_UU);

	/** Get AMN_Leaves_Nodes_UU	  */
	public String getAMN_Leaves_Nodes_UU();

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
