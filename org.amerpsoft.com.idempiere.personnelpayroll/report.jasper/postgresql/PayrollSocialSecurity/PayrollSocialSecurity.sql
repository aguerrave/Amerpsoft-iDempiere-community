-- Payroll Social Security
-- Amounts Allocated Valid for SSO (IRP)
--
SELECT * FROM
(
	-- REPORT HEADER
	SELECT DISTINCT ON (cli.ad_client_id)
		-- Client
		cli.ad_client_id as rep_client_id,
		-- Organization
		CASE WHEN ($P{AD_Org_ID} IS NULL OR $P{AD_Org_ID} = 0) THEN 0 ELSE $P{AD_Org_ID} END as rep_org_id,
		CASE WHEN ($P{AD_Org_ID} IS NULL OR $P{AD_Org_ID} = 0) THEN concat(COALESCE(cli.name,cli.value),' - Consolidado') ELSE coalesce(org.name,org.value,'') END as rep_name,
		CASE WHEN ($P{AD_Org_ID} IS NULL OR $P{AD_Org_ID} = 0) THEN concat(COALESCE(cli.description,cli.name),' - Consolidado') ELSE COALESCE(org.description,org.name,org.value,'') END as rep_description, 
		CASE WHEN ($P{AD_Org_ID} IS NULL OR $P{AD_Org_ID} = 0) THEN '' ELSE COALESCE(orginfo.taxid,'') END as rep_taxid,
		CASE WHEN ($P{AD_Org_ID} IS NULL OR $P{AD_Org_ID} = 0) THEN img1.binarydata ELSE img2.binarydata END as rep_logo,
	    CASE WHEN  org.ad_client_id = $P{AD_Client_ID}   AND ($P{AD_Org_ID} IS NULL OR $P{AD_Org_ID} = 0) THEN 1
	             WHEN  org.ad_client_id = $P{AD_Client_ID}  AND org.ad_org_id= $P{AD_Org_ID}  THEN 1
	             ELSE 0 END as imp_header
	FROM adempiere.ad_client as cli
		 INNER JOIN adempiere.ad_org as org ON (org.ad_client_id = cli.ad_client_id)
		 INNER JOIN adempiere.ad_clientinfo as cliinfo ON (cli.ad_client_id = cliinfo.ad_client_id)
		  LEFT JOIN adempiere.ad_image as img1 ON (cliinfo.logoreport_id = img1.ad_image_id)
		 INNER JOIN adempiere.ad_orginfo as orginfo ON (org.ad_org_id = orginfo.ad_org_id)
		  LEFT JOIN adempiere.ad_image as img2 ON (orginfo.logo_id = img2.ad_image_id)
	WHERE cli.ad_client_id = $P{AD_Client_ID} AND CASE WHEN ($P{AD_Org_ID} IS NULL OR $P{AD_Org_ID} = 0 OR org.ad_org_id = $P{AD_Org_ID} ) THEN 1 = 1 ELSE 1 = 0 END
) as header_info
FULL JOIN
(
	SELECT  
		client_id, org_id,
		amn_process_id, prc_value, amn_contract_id, c_value,
		amn_period_id,
		socialsecurityid, 
		amn_employee_id, emp_value, cedula, emplastname, empfirstname,  TO_CHAR(amndateend, 'MMYYYY') AS fechaformateada, 
		TO_CHAR(SUM(diastrabajados), 'FM00') AS diastrabajados, 
		SUM(amountallocated) AS amountallocated
	FROM (
		SELECT
	    -- ORGANIZATION
	       pyr.ad_client_id as client_id, pyr.ad_org_id as org_id,
	    -- LOCATION
		   lct.amn_location_id, lct.value as loc_value, lct.socialsecurityid,
	    -- CONTRACT
	       amc.amn_contract_id,
	       COALESCE(amc.value,'') AS  c_value,
	    -- PROCESS
		   prc.value as prc_value, prc.amn_process_id,
        -- AMN_PERIOD
	       prd.amn_period_id, prd.name as periodo, prd.amndateini, prd.amndateend, prd.amn_period_status,
	    -- TIPO DE CONCEPTO
	       cty.amn_concept_types_id,
	       cty.sso,	       
		-- EMPLOYEE
		   emp.amn_employee_id, 
		   emp.value as emp_value, 
		   emp.idnumber AS cedula,
		   CONCAT(COALESCE(emp.lastname1,''),' ',COALESCE(emp.lastname2,'')) AS emplastname,
		   CONCAT(COALESCE(emp.firstname1,''),' ',COALESCE(emp.firstname2,'')) AS empfirstname,
		   emp.name as emp_name, 
	    -- CURRENCY      
		   curr1.iso_code as iso_code1,
		   currt1.cursymbol as cursymbol1,
		   COALESCE(currt1.description,curr1.iso_code,curr1.cursymbol,'') as currname1,
	       curr2.iso_code as iso_code2,
		   currt2.cursymbol as cursymbol2,
		   COALESCE(currt2.description,curr2.iso_code,curr2.cursymbol,'') as currname2, 
	    -- PAYROLL
		   pyr.amn_payroll_id, 
		   pyr.invdateini, pyr.invdateend,
	    -- PAYROLL DETAIL
		   pyr_d.value as detail_value, pyr_d.qtyvalue as cantidad, 
		   CASE WHEN pyr_d.value = 'SALARIO' THEN pyr_d.qtyvalue ELSE 0 END AS diastrabajados,
		   currencyConvert(pyr_d.amountallocated, pyr.c_currency_id,$P{C_Currency_ID},pyr.dateacct,pyr.C_ConversionType_ID,pyr.ad_client_id,pyr.ad_org_id) as amountallocated
		FROM adempiere.amn_payroll as pyr
		LEFT JOIN adempiere.amn_payroll_detail as pyr_d ON (pyr_d.amn_payroll_id= pyr.amn_payroll_id)
		LEFT JOIN adempiere.amn_concept_types_proc as ctp ON (ctp.amn_concept_types_proc_id= pyr_d.amn_concept_types_proc_id)
		LEFT JOIN adempiere.amn_concept_types	as cty ON ((cty.amn_concept_types_id= ctp.amn_concept_types_id))
		LEFT JOIN adempiere.amn_process as prc ON (prc.amn_process_id= ctp.amn_process_id)
		INNER JOIN adempiere.amn_employee as emp ON (emp.amn_employee_id= pyr.amn_employee_id)
		 LEFT JOIN adempiere.amn_department as dep ON (emp.amn_department_id = dep.amn_department_id)
		 LEFT JOIN adempiere.amn_jobtitle as jtt ON (emp.amn_jobtitle_id= jtt.amn_jobtitle_id)
		 LEFT JOIN adempiere.c_bpartner 	as cbp	 ON (emp.c_bpartner_id= cbp.c_bpartner_id)
		 LEFT JOIN adempiere.amn_period as prd ON (prd.amn_period_id= pyr.amn_period_id)
		 LEFT JOIN adempiere.c_period as c_prd ON (c_prd.c_period_id= prd.c_period_id)
		 LEFT JOIN adempiere.amn_location as lct ON (emp.amn_location_id= lct.amn_location_id)
		INNER JOIN adempiere.amn_contract as amc ON (amc.amn_contract_id= emp.amn_contract_id) 
		 LEFT JOIN c_currency curr1 on pyr.c_currency_id = curr1.c_currency_id
	     LEFT JOIN c_currency_trl currt1 on curr1.c_currency_id = currt1.c_currency_id and currt1.ad_language = (SELECT AD_Language FROM AD_Client WHERE AD_Client_ID=$P{AD_Client_ID})
	     LEFT JOIN c_currency curr2 on curr2.c_currency_id = $P{C_Currency_ID}
	     LEFT JOIN c_currency_trl currt2 on curr2.c_currency_id = currt2.c_currency_id and currt2.ad_language = (SELECT AD_Language FROM AD_Client WHERE AD_Client_ID=$P{AD_Client_ID})
		 WHERE 1 = 1  
 			AND ( CASE WHEN ( $P{AMN_Contract_ID}  IS NULL OR amc.amn_contract_id= $P{AMN_Contract_ID} ) THEN 1=1 ELSE 1=0 END )
			AND ( CASE WHEN ( $P{AMN_Period_ID}  IS NULL OR prd.amn_period_id= $P{AMN_Period_ID} ) THEN 1=1 ELSE 1=0 END )
 		    AND CASE  WHEN  cty.sso='Y' THEN 1=1 ELSE 1=0 END  
	  ) as ssodet 
	  GROUP BY client_id, org_id, amn_process_id, prc_value, amn_contract_id, c_value, amn_period_id,  amndateend,
		socialsecurityid, amn_employee_id, emp_value, cedula, emplastname, empfirstname, fechaformateada
) AS sso ON (1= 0)
WHERE (imp_header= 1) OR (client_id= $P{AD_Client_ID}
  AND ( CASE WHEN ( $P{AD_Org_ID}  IS NULL OR $P{AD_Org_ID} = 0 OR org_id= $P{AD_Org_ID} ) THEN 1=1 ELSE 1=0 END ) 
) 
--ORDER BY sso.prc_value, sso.c_value, sso.emp_value
