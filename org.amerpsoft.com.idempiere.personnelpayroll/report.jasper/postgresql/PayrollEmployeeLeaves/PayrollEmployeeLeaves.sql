-- PayrollEmployeeLeaves
-- Payroll Employee Leaves V2
-- Parameter isSummary
WITH date_series AS (
    -- Generamos todas las fechas dentro del período dado
    SELECT generate_series(
        COALESCE(DATE($P{DateIni}), DATE_TRUNC('month', CURRENT_DATE)::DATE), 
        COALESCE(DATE($P{DateEnd}), (DATE_TRUNC('month', CURRENT_DATE) + INTERVAL '1 month' - INTERVAL '1 day')::DATE), 
        '1 day'::interval
    )::DATE AS report_date
),
leaves_data AS (
    -- Subquery de Leaves con integración de la serie de fechas
    SELECT 
        empl2.ad_client_id,
        empl2.amn_employee_id,
        amc2.amn_contract_id,
        amc2.value AS c_value, 
        COALESCE(amc2.name, amc2.description) AS c_tipo, 
        amlt.value AS leaves_value, 
        ds.report_date
    FROM adempiere.amn_employee empl2
    CROSS JOIN date_series ds  -- Generamos una fila por cada empleado y día en el periodo
    INNER JOIN adempiere.amn_contract amc2 ON amc2.amn_contract_id = empl2.amn_contract_id	 
    LEFT JOIN adempiere.amn_leaves amle ON amle.amn_employee_id = empl2.amn_employee_id AND ds.report_date BETWEEN amle.datefrom AND amle.dateto
    LEFT JOIN adempiere.amn_leaves_types amlt ON amlt.amn_leaves_types_id = amle.amn_leaves_types_id
    WHERE empl2.isActive = 'Y'
        AND empl2.AD_Client_ID = $P{AD_Client_ID} 
        AND ( $P{AMN_Contract_ID} IS NULL OR amc2.amn_contract_id = $P{AMN_Contract_ID} ) 
        AND ( $P{AMN_Employee_ID} IS NULL OR empl2.amn_employee_id = $P{AMN_Employee_ID} )
)
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
			leaves_all.leaves_all_txt,
		    CASE WHEN  org.ad_client_id = $P{AD_Client_ID}   AND ($P{AD_Org_ID} IS NULL OR $P{AD_Org_ID} = 0) THEN 1
		             WHEN  org.ad_client_id = $P{AD_Client_ID}  AND org.ad_org_id= $P{AD_Org_ID}  THEN 1
		             ELSE 0 END as imp_header
		FROM adempiere.ad_client as cli
			 INNER JOIN adempiere.ad_org as org ON (org.ad_client_id = cli.ad_client_id)
			 INNER JOIN adempiere.ad_clientinfo as cliinfo ON (cli.ad_client_id = cliinfo.ad_client_id)
			  LEFT JOIN adempiere.ad_image as img1 ON (cliinfo.logoreport_id = img1.ad_image_id)
			 INNER JOIN adempiere.ad_orginfo as orginfo ON (org.ad_org_id = orginfo.ad_org_id)
			  LEFT JOIN adempiere.ad_image as img2 ON (orginfo.logo_id = img2.ad_image_id)
			 LEFT JOIN (
				SELECT ad_client_id, STRING_AGG(lt_reference, ', ') AS leaves_all_txt
				FROM (
					SELECT amlt.ad_client_id, CONCAT( amlt.Value,':',amltt.name) AS lt_reference, amlt.Value AS lt_value, amlt.Name AS lt_name, amltt.name AS ltt_name, amltt.description AS ltt_description
					FROM AMN_leaves_Types amlt
					INNER JOIN AMN_leaves_Types_Trl amltt ON amltt.amn_leaves_types_id = amlt.amn_leaves_types_id 
					WHERE amlt.ad_client_id = $P{AD_Client_ID} AND amltt.ad_language = (SELECT AD_Language FROM AD_Client WHERE AD_Client_ID =$P{AD_Client_ID} )
				) AS leatyp
				GROUP BY ad_client_id
				) AS leaves_all ON leaves_all.ad_client_id = cli.ad_client_id
		WHERE cli.ad_client_id = $P{AD_Client_ID} AND CASE WHEN ($P{AD_Org_ID} IS NULL OR $P{AD_Org_ID} = 0 OR org.ad_org_id = $P{AD_Org_ID} ) THEN 1 = 1 ELSE 1 = 0 END
	) as header_info
	FULL JOIN
	(
	SELECT 
		LTALL.ad_client_id, 
		LTALL.report_date,
		org.ad_org_id, org.value AS emp_org_value, org.name AS emp_org_name,
		-- EMPLOYEE
		LTALL.amn_employee_id, 
		emp2.value as emp_value, 
	  	emp2.name as emp_name, 
		-- CONTRACT
		amc.value as c_value, COALESCE(amc.name, amc.description) as c_tipo, 
		-- LOCATION
		emp2.amn_location_id, lct.value AS location_value, lct.name AS location_name,
		-- SHIFT
		amnsh.name AS shift_name,
		-- Leaves Types
	    AJ::NUMERIC(15, 2) AS AJ,  -- Convertir a NUMERIC
	    CO::NUMERIC(15, 2) AS CO,  -- Convertir a NUMERIC
	    DU::NUMERIC(15, 2) AS DU,  -- Convertir a NUMERIC
	    DL::NUMERIC(15, 2) AS DL,  -- Convertir a NUMERIC
	    MA::NUMERIC(15, 2) AS MA,  -- Convertir a NUMERIC
	    MT::NUMERIC(15, 2) AS MT,  -- Convertir a NUMERIC
	    LA::NUMERIC(15, 2) AS LA,  -- Convertir a NUMERIC
	    RM::NUMERIC(15, 2) AS RM,  -- Convertir a NUMERIC
	    PA::NUMERIC(15, 2) AS PA,  -- Convertir a NUMERIC
	    PR::NUMERIC(15, 2) AS PR,  -- Convertir a NUMERIC
	    SU::NUMERIC(15, 2) AS SU,  -- Convertir a NUMERIC
	    VA::NUMERIC(15, 2) AS VA,  -- Convertir a NUMERIC
	    PS::NUMERIC(15, 2) AS PS,  -- Convertir a NUMERIC
	    PE::NUMERIC(15, 2) AS PE,  -- Convertir a NUMERIC
	    RE::NUMERIC(15, 2) AS RE,  -- Convertir a NUMERIC
	    LI::NUMERIC(15, 2) AS LI   -- Convertir a NUMERIC
	FROM (
		SELECT 
		    -- Si es resumen, colocamos la fecha de inicio del período
		    ld.report_date,
		    ld.ad_client_id,
		    ld.amn_employee_id,
		    emp.name AS employee_name,
		    ld.amn_contract_id,
		    ld.c_value AS contract_value,
		    -- Tipos de ausencias en columnas separadas con sumas o valores individuales
		    SUM(CASE WHEN ld.leaves_value = 'AJ' THEN 1 ELSE 0 END) AS AJ,
		    SUM(CASE WHEN ld.leaves_value = 'CO' THEN 1 ELSE 0 END) AS CO,
		    SUM(CASE WHEN ld.leaves_value = 'DU' THEN 1 ELSE 0 END) AS DU,
		    SUM(CASE WHEN ld.leaves_value = 'DL' THEN 1 ELSE 0 END) AS DL,
		    SUM(CASE WHEN ld.leaves_value = 'MA' THEN 1 ELSE 0 END) AS MA,
		    SUM(CASE WHEN ld.leaves_value = 'MT' THEN 1 ELSE 0 END) AS MT,
		    SUM(CASE WHEN ld.leaves_value = 'LA' THEN 1 ELSE 0 END) AS LA,
		    SUM(CASE WHEN ld.leaves_value = 'RM' THEN 1 ELSE 0 END) AS RM,
		    SUM(CASE WHEN ld.leaves_value = 'PA' THEN 1 ELSE 0 END) AS PA,
		    SUM(CASE WHEN ld.leaves_value = 'PR' THEN 1 ELSE 0 END) AS PR,
		    SUM(CASE WHEN ld.leaves_value = 'SU' THEN 1 ELSE 0 END) AS SU,
		    SUM(CASE WHEN ld.leaves_value = 'VA' THEN 1 ELSE 0 END) AS VA,
		    SUM(CASE WHEN ld.leaves_value = 'PS' THEN 1 ELSE 0 END) AS PS,
		    SUM(CASE WHEN ld.leaves_value = 'PE' THEN 1 ELSE 0 END) AS PE,
		    SUM(CASE WHEN ld.leaves_value = 'RE' THEN 1 ELSE 0 END) AS RE,
		    SUM(CASE WHEN ld.leaves_value = 'LI' THEN 1 ELSE 0 END) AS LI
		FROM leaves_data ld
		LEFT JOIN adempiere.amn_employee emp ON emp.amn_employee_id = ld.amn_employee_id
		GROUP BY 
		    ld.ad_client_id,
		    ld.amn_employee_id,
		    emp.name,
		    ld.amn_contract_id,
		    ld.c_value,
		    ld.report_date 
		ORDER BY ld.amn_employee_id, report_date
	) AS LTALL
	INNER JOIN adempiere.amn_employee as emp2 ON emp2.amn_employee_id = LTALL.amn_employee_id
	LEFT JOIN adempiere.amn_jobtitle as jtt ON (emp2.amn_jobtitle_id= jtt.amn_jobtitle_id)
	INNER JOIN adempiere.amn_location as lct 	 ON (lct.amn_location_id= emp2.amn_location_id)
	INNER JOIN adempiere.amn_contract as amc 	 ON (amc.amn_contract_id= emp2.amn_contract_id)	 
	LEFT JOIN adempiere.ad_org   as org ON (org.ad_org_id = emp2.ad_orgto_id)
	LEFT JOIN adempiere.amn_shift AS amnsh ON amnsh.amn_shift_id = emp2.amn_shift_id
	LEFT JOIN (
		SELECT ad_client_id, STRING_AGG(lt_reference, ', ') AS leaves_all_txt
		FROM (
			SELECT amlt.ad_client_id, CONCAT( amlt.Value,':',amltt.name) AS lt_reference, amlt.Value AS lt_value, amlt.Name AS lt_name, amltt.name AS ltt_name, amltt.description AS ltt_description
			FROM AMN_leaves_Types amlt
			INNER JOIN AMN_leaves_Types_Trl amltt ON amltt.amn_leaves_types_id = amlt.amn_leaves_types_id 
			WHERE amlt.ad_client_id = $P{AD_Client_ID} AND amltt.ad_language = (SELECT AD_Language FROM AD_Client WHERE AD_Client_ID =$P{AD_Client_ID} )
		) AS leatyp
		GROUP BY ad_client_id
	) AS leaves_all ON leaves_all.ad_client_id = emp2.ad_client_id
	WHERE emp2.isActive = 'Y' AND emp2.AD_Client_ID= $P{AD_Client_ID} 
		AND ( CASE WHEN ( $P{AD_Org_ID} IS NULL OR $P{AD_Org_ID} = 0 OR emp2.ad_orgto_id = $P{AD_Org_ID} ) THEN 1=1 ELSE 1=0 END ) 
		AND ( CASE WHEN ( $P{AMN_Location_ID} IS NULL OR lct.amn_location_id= $P{AMN_Location_ID} ) THEN 1=1 ELSE 1=0 END )
		AND ( CASE WHEN ( $P{AMN_Contract_ID}  IS NULL OR amc.amn_contract_id= $P{AMN_Contract_ID} ) THEN 1=1 ELSE 1=0 END )
		AND ( CASE WHEN ( $P{AMN_Employee_ID}  IS NULL OR emp2.amn_employee_id= $P{AMN_Employee_ID} ) THEN  1=1 ELSE 1=0 END )
	) as leaves ON (1= 0)
WHERE (imp_header = 1) OR 
	(leaves.ad_client_id= $P{AD_Client_ID} 
	AND ( CASE WHEN ( $P{AD_Org_ID}  IS NULL OR $P{AD_Org_ID} = 0 OR leaves.ad_org_id= $P{AD_Org_ID} ) THEN 1=1 ELSE 1=0 END ) )
ORDER BY  leaves.emp_org_value, leaves.c_value, leaves.location_value, leaves.emp_value, leaves.report_date, header_info ASC
