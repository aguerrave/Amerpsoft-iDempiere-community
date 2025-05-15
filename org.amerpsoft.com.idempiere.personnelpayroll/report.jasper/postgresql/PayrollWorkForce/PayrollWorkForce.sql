-- Payroll Workforce
-- PayrollWorkforce.jrxml
-- optmone='A' reemplazado por pydma.accounttype ='E'
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
		CASE WHEN ($P{AD_Org_ID} IS NULL OR $P{AD_Org_ID} = 0) THEN 
			(SELECT STRING_AGG(DISTINCT ORGX.value, ' - ' ORDER BY ORGX.value) 
	         FROM AD_Org ORGX
	         WHERE ORGX.Ad_client_ID=$P{AD_Client_ID} AND ORGX.issummary = 'N') 
	         ELSE coalesce(org.name,org.value,'') END AS all_orgs,
		CASE WHEN ($P{AD_Org_ID} IS NULL OR $P{AD_Org_ID} = 0) THEN img1.binarydata ELSE img2.binarydata END as rep_logo,
	    CASE WHEN  org.ad_client_id = $P{AD_Client_ID}   AND ($P{AD_Org_ID} IS NULL OR $P{AD_Org_ID} = 0) THEN 1
	             WHEN  org.ad_client_id = $P{AD_Client_ID}  AND org.ad_org_id= $P{AD_Org_ID}  THEN 1
	             ELSE 0 END as imp_header,
	    -- CURRENCY
		CONCAT(curr.iso_code,'-',currt.cursymbol,'-',COALESCE(currt.description,curr.iso_code,curr.cursymbol,'')) as moneda
	FROM adempiere.ad_client as cli
		 INNER JOIN adempiere.ad_org as org ON (org.ad_client_id = cli.ad_client_id)
		 INNER JOIN adempiere.ad_clientinfo as cliinfo ON (cli.ad_client_id = cliinfo.ad_client_id)
		  LEFT JOIN adempiere.ad_image as img1 ON (cliinfo.logoreport_id = img1.ad_image_id)
		 INNER JOIN adempiere.ad_orginfo as orginfo ON (org.ad_org_id = orginfo.ad_org_id)
		  LEFT JOIN adempiere.ad_image as img2 ON (orginfo.logo_id = img2.ad_image_id)
		  LEFT JOIN c_currency curr on curr.c_currency_id = $P{C_Currency_ID}
          LEFT JOIN c_currency_trl currt on curr.c_currency_id = currt.c_currency_id and currt.ad_language = (SELECT AD_Language FROM AD_Client WHERE AD_Client_ID=$P{AD_Client_ID})
	WHERE cli.ad_client_id = $P{AD_Client_ID} AND CASE WHEN ($P{AD_Org_ID} IS NULL OR $P{AD_Org_ID} = 0 OR org.ad_org_id = $P{AD_Org_ID} ) THEN 1 = 1 ELSE 1 = 0 END
) as header_info
FULL JOIN
(
SELECT 
    -- CURRENCY
    curr1.iso_code as iso_code1,
    currt1.cursymbol as cursymbol1,
    COALESCE(currt1.description,curr1.iso_code,curr1.cursymbol,'') as currname1,
    curr2.iso_code as iso_code2,
    currt2.cursymbol as cursymbol2,
    COALESCE(currt2.description,curr2.iso_code,curr2.cursymbol,'') as currname2, 
	-- Activity
	pydma.c_activity_id,
	pydma.activity_value,
	pydma.activity_name,
	-- Work Force
	pydma.workforce,
	pydma.optmode,
	-- Employee
	pydma.amn_employee_id,
	pydma.employee_value,
	pydma.employee_name,
	-- Concept Types
	pydma.amn_concept_types_id, 
	pydma.concept_value,
	pydma.concept_name,
	-- Account 
	pydma.account_sign,
	pydma.account_value,
	pydma.account_name,
	pydma.db_acct,
	pydma.cr_acct,
	pydma.accounttype,
    -- AMN PERIOD tipe (NN NU)
    tiper.amn_period_id as ti_period_id, 
    tiper.amndateini, 
    tiper.amndateend,
    -- C_PERIOD
    per.c_period_id as c_period_id, 
    per.startdate as startdate, 
    per.enddate as enddate,
    -- AMN_PAYROLL
    pydma.amn_payroll_id, 
    pydma.pay_name as nombre, 
    pydma.invdateini as fecha_inicio, 
    pydma.invdateend as fecha_fin,    
    -- AMN_PAYROLL_DETAIL
   -- C_YEAR 
   year2.c_year_id,  year2.periodos
    FROM AMN_Period tiper
    LEFT JOIN C_Period per ON (per.c_period_id = tiper.c_period_id )
    LEFT JOIN C_Year year ON (year.C_Year_ID = per.C_Year_ID )
    LEFT JOIN (
		SELECT DISTINCT ON (per2.C_Year_ID) 
		per2.C_Year_ID,
		CONCAT(MAX(per2.periodtxt01)::text, ' ', MAX(per2.periodtxt02)::text, ' ', MAX(per2.periodtxt03)::text, ' ', MAX(per2.periodtxt04)::text,
		       ' ', MAX(per2.periodtxt05)::text, ' ', MAX(per2.periodtxt06)::text, ' ', MAX(per2.periodtxt07)::text, ' ', MAX(per2.periodtxt08)::text,
		       ' ', MAX(per2.periodtxt09)::text, ' ', MAX(per2.periodtxt10)::text, ' ', MAX(per2.periodtxt11)::text, ' ', MAX(per2.periodtxt12)::text
			) as periodos 
		FROM 
		(SELECT
		cper.C_Year_ID,
		cper.C_Period_ID , 
		--cper.PeriodNo, 
		CASE WHEN cper.PeriodNo=1 THEN to_char(cper.startdate,'MM-YYYY') ELSE '' END as periodtxt01,
		CASE WHEN cper.PeriodNo=2 THEN to_char(cper.startdate,'MM-YYYY') ELSE '' END as periodtxt02,
		CASE WHEN cper.PeriodNo=3 THEN to_char(cper.startdate,'MM-YYYY') ELSE '' END as periodtxt03,
		CASE WHEN cper.PeriodNo=4 THEN to_char(cper.startdate,'MM-YYYY') ELSE '' END as periodtxt04,
		CASE WHEN cper.PeriodNo=5 THEN to_char(cper.startdate,'MM-YYYY') ELSE '' END as periodtxt05,
		CASE WHEN cper.PeriodNo=6 THEN to_char(cper.startdate,'MM-YYYY') ELSE '' END as periodtxt06,
		CASE WHEN cper.PeriodNo=7 THEN to_char(cper.startdate,'MM-YYYY') ELSE '' END as periodtxt07,
		CASE WHEN cper.PeriodNo=8 THEN to_char(cper.startdate,'MM-YYYY') ELSE '' END as periodtxt08,
		CASE WHEN cper.PeriodNo=9 THEN to_char(cper.startdate,'MM-YYYY') ELSE '' END as periodtxt09,
		CASE WHEN cper.PeriodNo=10 THEN to_char(cper.startdate,'MM-YYYY') ELSE '' END as periodtxt10,
		CASE WHEN cper.PeriodNo=11 THEN to_char(cper.startdate,'MM-YYYY') ELSE '' END as periodtxt11,
		CASE WHEN cper.PeriodNo=12 THEN to_char(cper.startdate,'MM-YYYY') ELSE '' END as periodtxt12
		FROM C_Period cper WHERE cper.c_period_id >=  $P{C_PeriodIni_ID} AND cper.c_period_id <=  $P{C_PeriodEnd_ID} AND cper.c_year_id = $P{C_Year_ID}
		) as per2
		GROUP BY per2.C_Year_ID
	    ) year2 ON ( year2.c_year_id = year.c_year_id)
    LEFT JOIN adempiere.amn_payroll as pyr ON (pyr.amn_period_id = tiper.amn_period_id)
    LEFT JOIN (
		-- DEBITS
		SELECT
		-- Client -Org
		pay.ad_client_id,
		pay.ad_org_id,
		-- Payroll
		pay.name as pay_name,
		pay.invdateini, 
		pay.invdateend,
		-- PayrollDetail
		prdet.amn_payroll_id, 
		prdet.amn_payroll_detail_id,
		-- Activity
		COALESCE(act.c_activity_id,0) as c_activity_id,
		COALESCE(act.value,'ND') as activity_value,
		COALESCE(act.name,'Actividad No-Definida') as activity_name,
		-- Work Force
		jobt.workforce,
		-- Employee
		emp.amn_employee_id,
		emp.value as employee_value,
		emp.name as employee_name,
		-- Concept Types
		ctyacc.amn_concept_types_id as amn_concept_types_id, 
		ctyacc.value as concept_value,
		ctyacc.name as concept_name,
		ctyacc.optmode,
		-- Account 
		ctyacc.account_sign,
		ctyacc.account_value,
		ctyacc.account_name,
		ctyacc.accounttype,
		CASE WHEN ctyacc.account_sign ='DB' AND prdet.amountallocated <> 0 THEN 
				--prdet.amountallocated 
				currencyConvert(pay.amountallocated,pay.c_currency_id, $P{C_Currency_ID}, pay.dateacct, pay.C_ConversionType_ID, pay.AD_Client_ID, pay.AD_Org_ID ) 
		     WHEN ctyacc.account_sign ='DB' AND prdet.amountdeducted <> 0 THEN 
		     	--prdet.amountdeducted 
				currencyConvert(pay.amountdeducted,pay.c_currency_id, $P{C_Currency_ID}, pay.dateacct, pay.C_ConversionType_ID, pay.AD_Client_ID, pay.AD_Org_ID ) 
		     WHEN ctyacc.account_sign ='DB' AND (prdet.amountallocated = 0 AND prdet.amountdeducted = 0 ) THEN 
		     	--prdet.amountcalculated
		     	currencyConvert(pay.amountcalculated,pay.c_currency_id, $P{C_Currency_ID}, pay.dateacct, pay.C_ConversionType_ID, pay.AD_Client_ID, pay.AD_Org_ID ) 
		ELSE  0 END as db_acct,
		CASE WHEN ctyacc.account_sign ='CR' AND prdet.amountallocated <> 0 THEN 
				--prdet.amountallocated 
		     	currencyConvert(pay.amountallocated,pay.c_currency_id, $P{C_Currency_ID}, pay.dateacct, pay.C_ConversionType_ID, pay.AD_Client_ID, pay.AD_Org_ID ) 
		     WHEN ctyacc.account_sign ='CR' AND prdet.amountdeducted <> 0 THEN 
		     	--prdet.amountdeducted 
		     	currencyConvert(pay.amountdeducted,pay.c_currency_id, $P{C_Currency_ID}, pay.dateacct, pay.C_ConversionType_ID, pay.AD_Client_ID, pay.AD_Org_ID ) 
		     WHEN ctyacc.account_sign ='CR' AND (prdet.amountallocated = 0 AND prdet.amountdeducted = 0 ) THEN 
		     	--prdet.amountcalculated
		     	currencyConvert(pay.amountcalculated,pay.c_currency_id, $P{C_Currency_ID}, pay.dateacct, pay.C_ConversionType_ID, pay.AD_Client_ID, pay.AD_Org_ID ) 
		ELSE  0 END  as cr_acct
		-- Amount
		--prdet.amountallocated,
		--prdet.amountdeducted,
		--prdet.amountcalculated
		FROM AMN_Payroll_Detail prdet
		LEFT JOIN AMN_Concept_Types_Proc ctyp ON (ctyp.AMN_Concept_Types_Proc_ID = prdet.AMN_Concept_Types_Proc_ID)
		LEFT JOIN 
		(--DEBIT ACCOUNT
		 SELECT
			ctys.amn_concept_types_id as amn_concept_types_id, 
			ctys.calcorder as calcorder,
			ctys.value,
			ctys.name,
			ctys.optmode,
			'DB' as account_sign,
			cedb.C_ElementValue_ID as Account_ID,
			cedb.value as account_value,
			cedb.name as account_name,
			cedb.accounttype as accounttype
			FROM AMN_Concept_Types ctys 
			LEFT JOIN C_ValidCombination vacodb ON ( vacodb.C_ValidCombination_ID = ctys.AMN_Deb_Acct)
			LEFT JOIN C_ElementValue cedb ON (cedb.C_ElementValue_ID = vacodb.Account_ID)
			-- CREDIT ACCOUNT
		  UNION
		  SELECT
			ctys.amn_concept_types_id as amn_concept_types_id, 
			ctys.calcorder  as calcorder,
			ctys.value,
			ctys.name,
			ctys.optmode,
			'CR' as account_sign,
			cecr.C_ElementValue_ID as Account_ID,
			cecr.value as cr_value,
			cecr.name as cr_name,
			cecr.accounttype as accounttype
			FROM AMN_Concept_Types ctys 
			LEFT JOIN C_ValidCombination vacocr ON ( vacocr.C_ValidCombination_ID = ctys.AMN_Cre_Acct)
			LEFT JOIN C_ElementValue cecr ON (cecr.C_ElementValue_ID = vacocr.Account_ID)
			-- ORDER
			ORDER BY Calcorder, account_sign DESC
	           ) as ctyacc ON ( ctyacc.AMN_Concept_Types_ID = ctyp.AMN_Concept_Types_ID)
	       LEFT JOIN AMN_Payroll pay ON ( pay.AMN_Payroll_ID = prdet.amn_payroll_id )
		   LEFT JOIN AMN_Employee emp ON ( emp.amn_employee_id = pay.amn_employee_id)
		   LEFT JOIN C_Activity act ON ( act.C_Activity_ID = emp.C_Activity_ID )
		   LEFT JOIN AMN_JobTitle jobt ON (jobt.AMN_JobTitle_ID = emp.AMN_JobTitle_ID ) 
		) as pydma ON ( pydma.amn_payroll_id = pyr.amn_payroll_id)
       LEFT JOIN adempiere.ad_org as org ON (org.ad_org_id = pydma.ad_org_id)
       INNER JOIN adempiere.ad_client as cli ON (org.ad_client_id = cli.ad_client_id)
       INNER JOIN adempiere.ad_clientinfo as cliinfo ON (cli.ad_client_id = cliinfo.ad_client_id)
       INNER JOIN adempiere.ad_orginfo as orginfo ON (org.ad_org_id = orginfo.ad_org_id)
       LEFT JOIN adempiere.ad_image AS IMG ON (cliinfo.logoreport_id = IMG.ad_image_id)
       LEFT JOIN c_currency curr1 on pyr.c_currency_id = curr1.c_currency_id
       LEFT JOIN c_currency_trl currt1 on curr1.c_currency_id = currt1.c_currency_id and currt1.ad_language = (SELECT AD_Language FROM AD_Client WHERE AD_Client_ID=$P{AD_Client_ID}) 
       LEFT JOIN c_currency curr2 on curr2.c_currency_id = $P{C_Currency_ID}
       LEFT JOIN c_currency_trl currt2 on curr2.c_currency_id = currt2.c_currency_id and currt2.ad_language = (SELECT AD_Language FROM AD_Client WHERE AD_Client_ID=$P{AD_Client_ID})
WHERE  pydma.ad_client_id = $P{AD_Client_ID} 
		AND per.c_period_id >= $P{C_PeriodIni_ID} 
        AND per.c_period_id <= $P{C_PeriodEnd_ID} AND per.c_year_id = $P{C_Year_ID}
        AND pydma.optmode='A'   --	AND pydma.accounttype ='E'
)
as prwf ON (1= 0)
order by prwf.c_activity_id, prwf.workforce,  prwf.account_value, prwf.concept_value, prwf.employee_value, prwf.amndateini
