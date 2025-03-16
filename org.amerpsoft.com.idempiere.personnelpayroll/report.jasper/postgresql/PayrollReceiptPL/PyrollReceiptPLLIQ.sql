-- PayrollReceipt PL LIquidacion
-- FROM AD_Tree 1000008  FROM A GIVEN AD_Client_ID
-- FOR NEW Payroll REPORTS
WITH Conceptos AS (
	WITH RECURSIVE Nodos AS (
	    SELECT 
	    TRN1.AD_Tree_ID,
	    TRN1.Node_ID, 
	    0 as level, 
	    TRN1.Parent_ID, 
		ARRAY [TRN1.Node_ID::text]  AS ancestry, 
		ARRAY [ACTP.value::text]  AS valueparent,
		ARRAY [ACTP.calcorder::int]  AS calcorderparent,
		TRN1.Node_ID as Star_An,
		ACT.issummary
		FROM ad_treenode TRN1 
		LEFT JOIN AMN_Concept_Types ACT ON ACT.AMN_Concept_Types_ID = TRN1.Node_ID
		LEFT JOIN AMN_Concept_Types ACTP ON ACTP.AMN_Concept_Types_ID = TRN1.Parent_ID
		WHERE TRN1.AD_tree_ID=(
			SELECT DISTINCT tree.AD_Tree_ID
				FROM AD_Client adcli
				LEFT JOIN AMN_Concept amnc ON adcli.AD_Client_ID = amnc.AD_Client_ID
				LEFT JOIN AD_Tree tree ON tree.AD_Tree_ID= amnc.AD_Tree_ID
				WHERE adcli.AD_client_ID=$P{AD_Client_ID}	) 
		AND TRN1.isActive='Y' AND TRN1.Parent_ID = 0		
		UNION ALL
		SELECT 
		TRN1.AD_Tree_ID, 
		TRN1.Node_ID, 
		TRN2.level+1 as level,
		TRN1.Parent_ID, 
		TRN2.ancestry || ARRAY[TRN1.Node_ID::text] AS ancestry,
		TRN2.valueparent || ARRAY [ACTP.value::text]  AS valueparent,
		TRN2.calcorderparent || ARRAY [ACTP.calcorder::int]  AS calcorderparent,
		COALESCE(TRN2.Star_An,TRN1.Parent_ID) as Star_An,
		ACT.issummary
		FROM ad_treenode TRN1 
		INNER JOIN Nodos TRN2 ON (TRN2.node_id =TRN1.Parent_ID)
		LEFT JOIN AMN_Concept_Types ACT ON ACT.AMN_Concept_Types_ID = TRN1.Node_ID
		LEFT JOIN AMN_Concept_Types ACTP ON ACTP.AMN_Concept_Types_ID = TRN1.Parent_ID
		WHERE TRN1.AD_tree_ID=(
			SELECT DISTINCT tree.AD_Tree_ID
				FROM AD_Client adcli
				LEFT JOIN AMN_Concept amnc ON adcli.AD_Client_ID = amnc.AD_Client_ID
				LEFT JOIN AD_Tree tree ON tree.AD_Tree_ID= amnc.AD_Tree_ID
				WHERE adcli.AD_client_ID=$P{AD_Client_ID}
		)  AND TRN1.isActive='Y' 		
	) 
	-- MAIN SELECT
	-- AMN_Concept_types for Level reports
	SELECT DISTINCT ON (trial.calcorder, trial.ancestry)
		trial.Level,
		trial.Node_ID, 
		trial.value1 as value1,
		ACTN1.name AS name1,
		ACTN1.calcorder AS calcorder1,
		trial.value2 as value2,
		COALESCE(ACTN2.name,ACTN2.description)  AS name2,
		ACTN2.calcorder AS calcorder2,
		trial.value3 as value3,
		ACTN3.name AS name3,
		ACTN3.calcorder AS calcorder3,
		trial.amn_concept_types_id, 
		trial.calcorder,
		trial.optmode, 
		trial.isshow,
		trial.concept_value,
		trial.concept_name,
		trial.concept_name_indent,
		trial.concept_description
	FROM (
		SELECT 
			PAR.Level,
			PAR.issummary,
			PAR.AD_Tree_ID,
			CNT.tree_name,
			PAR.Node_ID, 
			PAR.Parent_ID ,
			PAR.ancestry,
			PAR.valueparent,
			COALESCE(valueparent[2],'') as Value1,
			COALESCE(valueparent[3],'') as Value2,
			COALESCE(valueparent[4],'') as Value3,
			CNT.AD_client_ID,
			CNT.AD_Org_ID,
			CNT.AMN_Concept_Types_ID,
			CNT.calcorder,
			CNT.optmode, 
			CNT.isshow,
			CNT.concept_value,
			CNT.concept_name,
			LPAD('', LEVEL ,' ') || COALESCE(CNT.concept_name,CNT.concept_description) as concept_name_indent,
			CNT.concept_description
		FROM Nodos PAR
		INNER JOIN (
			SELECT 
			adcli.AD_Client_ID, 
			amnc.AD_Org_ID,
			amnct.AMN_Concept_Types_ID, 
			amnct.value as concept_value,
			amnct.name as concept_name,
			amnct.description as concept_description,
			amnct.calcorder,
			amnct.optmode, 
			amnct.isshow,
			tree.AD_Tree_ID, 
			tree.name as tree_name
			FROM AD_Client adcli
			LEFT JOIN amn_concept amnc ON amnc.ad_client_id = adcli.ad_client_id 
			LEFT JOIN amn_concept_types amnct ON amnct.amn_concept_id = amnc.amn_concept_id  
			LEFT JOIN AD_Tree tree ON tree.AD_Tree_ID= amnc.AD_Tree_ID
			WHERE adcli.AD_client_ID=$P{AD_Client_ID}
			ORDER BY amnct.calcorder
		) as CNT ON CNT.AMN_Concept_types_ID = PAR.Node_ID
		WHERE PAR.issummary='N'
	) trial
	LEFT JOIN amn_concept_types as ACTN1 ON (ACTN1.Value = trial.Value1 AND ACTN1.AD_Client_ID= trial.AD_Client_ID)
	LEFT JOIN amn_concept_types as ACTN2 ON (ACTN2.Value = trial.Value2 AND ACTN2.AD_Client_ID= trial.AD_Client_ID)
	LEFT JOIN amn_concept_types as ACTN3 ON (ACTN3.Value = trial.Value3 AND ACTN3.AD_Client_ID= trial.AD_Client_ID)
	WHERE trial.ad_client_id = $P{AD_Client_ID}
	 AND ( CASE WHEN ( ( $P{AD_Org_ID} = 0 OR $P{AD_Org_ID} IS NULL ) OR trial.ad_org_id= $P{AD_Org_ID} ) THEN 1=1 ELSE 1=0 END )
	ORDER BY trial.calcorder, trial.ancestry
) 
-- 
-- MAIN SELECT
SELECT 
	org_name,
	ciudad_dir,
	rep_name, 
	rep_logo,
	value1,
	name1,
	calcorder1,	
	value2,
	name2,
	calcorder2,
	amndateend,
	isshow,
	c_value,
	departamento,
	sector,
	value_emp,
	empleado, 
	fecha_ingreso,
	a_servicio, m_servicio, d_servicio,
	sex,
	paymenttype,
	cargo,
	nro_id,
	copia, 
	copiaforma,
	documentno,
	invdateend,
	amountallocated_t,
	amountdeducted_t,
	iso_code1,
	iso_code2,
	cty_value,
	concept_type,
	loan_balance,loan_value,
	SUM(cantidad) AS cantidad,
	prestacion_text,
	SUM(amountallocated) AS amountallocated,
	SUM(amountdeducted) AS amountdeducted, 
	SUM(amountcalculated) AS amountcalculated
FROM 
(
	SELECT DISTINCT
		-- REPORT HEADER
		lct.orgname AS org_name,
	    CASE WHEN ( $P{AD_Org_ID} = 0 OR $P{AD_Org_ID} IS NULL ) THEN concat(COALESCE(cli.name,cli.value),' - Consolidado') ELSE coalesce(org.name,org.value,'') END as rep_name,
		CASE WHEN ( $P{AD_Org_ID} = 0 OR $P{AD_Org_ID} IS NULL ) THEN img1.binarydata ELSE img2.binarydata END as rep_logo,
		cty.value1,
		cty.name1,
		cty.calcorder1,
		cty.value2,
		cty.name2,
		cty.calcorder2,	
		-- PERIOD
		prd.amn_period_id, prd.name as periodo, prd.amndateini, prd.amndateend,
		-- TIPO DE CONCEPTO
		cty.amn_concept_types_id, 
		cty.optmode, 
		cty.calcorder, 
		cty.isshow, 
		cty.concept_value as cty_value, 
		COALESCE(cty.concept_name, cty.concept_description) as concept_type,
		-- TIPO DE CONCEPTO (PROCESO)
		ctp.value as ctp_value, COALESCE(ctp.name, ctp.description) as concept_type_process, 	 
		-- PROCESS
		prc.amn_process_id, COALESCE(prc.name, prc.description) as proceso,
	     --CASE WHEN ( {AMN_Process_ID}  IS NULL OR prc.amn_process_id= AMN_Process_ID} ) THEN 1 ELSE 0 END AS imp_proceso,
		-- CONTRACT
	   	amc.value as c_value, COALESCE(amc.name, amc.description) as c_tipo, 
		-- DEPARTAMENT
	   	COALESCE(dep.name,dep.description,'') as departamento,
	   	COALESCE(sec.name,sec.description,'') as sector,
		-- EMPLOYEE
	  	emp.value as value_emp, emp.name as empleado, emp.incomedate as fecha_ingreso, emp.paymenttype,
	  	emp.sex,
	   	COALESCE(jtt.name, jtt.description,'') as cargo, 
	   	COALESCE(cbp.taxid,'') as nro_id, 
   	    date_part('year',age(pyr.invdateend, emp.incomedate)) a_servicio, 
    	date_part('month',age(pyr.invdateend, emp.incomedate)) m_servicio, 
    	date_part('day',age(pyr.invdateend, emp.incomedate)) d_servicio,
    	emp.status, 
    	-- CITY
		INITCAP(COALESCE(cit.name, '-')) as ciudad_dir,
		-- PAYROLL
	   	'Original ' as copia,
	   	'01' as copiaforma,
	   	COALESCE(pyr.documentno,'') as documentno,
	   	pyr.description as recibo,
	   	pyr.invdateend, 
		-- PYR AMOUNTS CONVERTED
	   	adempiere.amf_num2letter((currencyConvert(pyr.amountallocated,pyr.c_currency_id, $P{C_Currency_ID}, pyr.dateacct, NULL, pyr.AD_Client_ID, pyr.AD_Org_ID )  -  currencyConvert(pyr.amountdeducted,pyr.c_currency_id, $P{C_Currency_ID}, pyr.dateacct, NULL, pyr.AD_Client_ID, pyr.AD_Org_ID ) ),'U','es') as prestacion_text,
		currencyConvert(pyr.amountallocated,pyr.c_currency_id, $P{C_Currency_ID}, pyr.dateacct, NULL, pyr.AD_Client_ID, pyr.AD_Org_ID ) as amountallocated_t, 
		currencyConvert(pyr.amountdeducted,pyr.c_currency_id, $P{C_Currency_ID}, pyr.dateacct, NULL, pyr.AD_Client_ID, pyr.AD_Org_ID ) as amountdeducted_t, 
		currencyConvert(pyr.amountcalculated,pyr.c_currency_id, $P{C_Currency_ID}, pyr.dateacct, NULL, pyr.AD_Client_ID, pyr.AD_Org_ID ) as amountcalculated_t, 
		-- CURRENCY
		curr1.iso_code as iso_code1,
		COALESCE(currt1.cursymbol,curr1.cursymbol,curr1.iso_code,'') as cursymbol1,
		COALESCE(currt1.description,curr1.description,curr1.iso_code,curr1.cursymbol,'') as currname1,
		curr2.iso_code as iso_code2,
		COALESCE(currt2.cursymbol,curr2.cursymbol,curr2.iso_code,'') as cursymbol2,
		COALESCE(currt2.description,curr2.description,curr2.iso_code,curr2.cursymbol,'') as currname2, 
		-- PAYROLL DETAIL
		CASE WHEN bal.loan_balance IS NOT NULL THEN CAST(bal.loan_balance AS NUMERIC) ELSE CAST(0 AS numeric) END AS loan_balance,
		CASE WHEN bal.loan_value IS NOT NULL THEN bal.loan_value  ELSE '' END AS loan_value,
	   -- MONTOS Y CIFRAS cty.concept_value	   
	    pyr_d.amn_payroll_detail_id, 
	    pyr_d.qtyvalue as cantidad, 
		currencyConvert(pyr_d.amountallocated,pyr.c_currency_id, $P{C_Currency_ID}, pyr.dateacct, NULL, pyr.AD_Client_ID, pyr.AD_Org_ID ) as amountallocated, 
		currencyConvert(pyr_d.amountdeducted,pyr.c_currency_id, $P{C_Currency_ID}, pyr.dateacct, NULL, pyr.AD_Client_ID, pyr.AD_Org_ID ) as amountdeducted, 
		currencyConvert(pyr_d.amountcalculated,pyr.c_currency_id, $P{C_Currency_ID}, pyr.dateacct, NULL, pyr.AD_Client_ID, pyr.AD_Org_ID ) as amountcalculated
	FROM adempiere.amn_payroll as pyr
	LEFT JOIN adempiere.amn_payroll_detail 		as pyr_d ON (pyr_d.amn_payroll_id= pyr.amn_payroll_id)
	LEFT JOIN (
		SELECT ampd.amn_payroll_id, ampd.amn_payroll_detail_id, ampde.amountbalance AS loan_balance, ampde.value AS loan_value
		FROM adempiere.AMN_Payroll_Detail ampd 
		INNER JOIN adempiere.AMN_Payroll_Deferred ampde ON ampde.amn_payroll_deferred_id = ampd.amn_payroll_Deferred_id
	) AS bal ON bal.amn_payroll_detail_id = pyr_d.amn_payroll_detail_id
	LEFT JOIN adempiere.amn_concept_types_proc  as ctp 	 ON (ctp.amn_concept_types_proc_id= pyr_d.amn_concept_types_proc_id)
	LEFT JOIN Conceptos 			as cty 	 ON (cty.amn_concept_types_id= ctp.amn_concept_types_id)
	LEFT JOIN adempiere.amn_process  					as prc 	 ON (prc.amn_process_id= pyr.amn_process_id)
	INNER JOIN adempiere.amn_employee as emp ON (emp.amn_employee_id= pyr.amn_employee_id)
	LEFT JOIN adempiere.amn_department as dep ON (emp.amn_department_id = dep.amn_department_id)
	LEFT JOIN adempiere.amn_jobtitle as jtt ON (emp.amn_jobtitle_id= jtt.amn_jobtitle_id)
	LEFT JOIN adempiere.c_bpartner 						as cbp 	 ON (emp.c_bpartner_id= cbp.c_bpartner_id)
	LEFT JOIN adempiere.amn_period   					    as prd 	 ON (prd.amn_period_id= pyr.amn_period_id)
	LEFT JOIN adempiere.amn_location 					as lct 	 ON (lct.amn_location_id= pyr.amn_location_id)
	LEFT JOIN adempiere.amn_contract 					as amc 	 ON (amc.amn_contract_id= pyr.amn_contract_id)	 
	LEFT JOIN adempiere.amn_sector						AS sec   ON (sec.amn_sector_id = emp.amn_sector_id)
	INNER JOIN adempiere.ad_client as cli ON (cli.ad_client_id = pyr.ad_client_id)
	INNER JOIN adempiere.ad_clientinfo as cliinfo ON (cli.ad_client_id = cliinfo.ad_client_id)
	LEFT JOIN adempiere.ad_image as img1 ON (cliinfo.logoreport_id = img1.ad_image_id)
	INNER JOIN adempiere.ad_org as org ON (org.ad_org_id = pyr.ad_org_id)
	INNER JOIN adempiere.ad_orginfo as orginfo ON (org.ad_org_id = orginfo.ad_org_id)
	LEFT JOIN adempiere.ad_image as img2 ON (orginfo.logo_id = img2.ad_image_id)
	LEFT JOIN c_currency curr1 on pyr.c_currency_id = curr1.c_currency_id
	LEFT JOIN c_currency_trl currt1 on curr1.c_currency_id = currt1.c_currency_id and currt1.ad_language = (SELECT AD_Language FROM AD_Client WHERE AD_Client_ID=$P{AD_Client_ID})
	LEFT JOIN c_currency curr2 on curr2.c_currency_id = $P{C_Currency_ID}
	LEFT JOIN c_currency_trl currt2 on curr2.c_currency_id = currt2.c_currency_id and currt2.ad_language = (SELECT AD_Language FROM AD_Client WHERE AD_Client_ID=$P{AD_Client_ID})
	LEFT JOIN adempiere.c_country as ctr_e ON (ctr_e.c_country_id= emp.c_country_id)
    LEFT JOIN adempiere.c_location as loc ON (orginfo.c_location_id= loc.c_location_id)
	LEFT JOIN adempiere.c_country as ctr ON (ctr.c_country_id= loc.c_country_id)
	LEFT JOIN adempiere.c_region as reg ON (reg.c_region_id= loc.c_region_id)
    LEFT JOIN adempiere.c_municipality as mun ON (mun.c_municipality_id= loc.c_municipality_id)
	LEFT JOIN adempiere.c_parish as par ON (par.c_parish_id= loc.c_parish_id)
	LEFT JOIN adempiere.c_city as cit ON (cit.c_city_id= loc.c_city_id)
	WHERE prc.value= 'PL' AND pyr.ad_client_id=  $P{AD_Client_ID}  
		AND ( CASE WHEN ( $P{AD_Org_ID} IS NULL OR $P{AD_Org_ID} = 0 OR pyr.ad_org_id = $P{AD_Org_ID} ) THEN 1=1 ELSE 1=0 END ) 
	    AND ( CASE WHEN ( $P{AMN_Payroll_ID} IS NULL OR pyr.amn_payroll_id= $P{AMN_Payroll_ID} ) THEN 1=1 ELSE 1=0 END )
	    AND ( CASE WHEN ( $P{AMN_Location_ID} IS NULL OR lct.amn_location_id= $P{AMN_Location_ID} ) THEN 1=1 ELSE 1=0 END )
	    AND ( CASE WHEN ( $P{AMN_Department_ID} IS NULL OR dep.amn_department_id= $P{AMN_Department_ID} ) THEN 1=1 ELSE 1=0 END )
		AND ( CASE WHEN ( $P{AMN_Contract_ID}  IS NULL OR amc.amn_contract_id= $P{AMN_Contract_ID} ) THEN 1=1 ELSE 1=0 END )
		AND ( CASE WHEN ( $P{AMN_Period_ID}  IS NULL OR prd.amn_period_id= $P{AMN_Period_ID} ) THEN 1=1 ELSE 1=0 END )
	    AND ( CASE WHEN ( $P{AMN_Employee_ID}  IS NULL OR emp.amn_employee_id= $P{AMN_Employee_ID} ) THEN  1=1 ELSE 1=0 END )
	    AND ( CASE WHEN ( $P{isShowZERO} = 'Y') OR ($P{isShowZERO} = 'N' 
	    			AND (  pyr_d.qtyvalue <> 0 OR pyr_d.amountallocated <> 0 OR pyr_d.amountdeducted<>0  OR pyr_d.amountcalculated<> 0)) THEN 1=1 ELSE 1=0 END )
) AS recibo
GROUP BY org_name, rep_name, rep_logo, value1,name1, calcorder1,value2,name2, calcorder2,amndateend, isshow, c_value,
sector, departamento, value_emp, empleado, fecha_ingreso, a_servicio, sex, m_servicio, d_servicio, ciudad_dir, paymenttype, cargo, nro_id, copia, copiaforma,
documentno,	invdateend, amn_payroll_detail_id, amountallocated_t, amountdeducted_t, loan_balance, loan_value, cty_value, concept_type,
iso_code1, iso_code2, prestacion_text
ORDER BY  amndateend, documentno, calcorder2