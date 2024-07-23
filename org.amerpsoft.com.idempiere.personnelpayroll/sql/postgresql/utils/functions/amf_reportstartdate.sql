﻿-- Function: adempiere.amf_reportstartdate(numeric)

-- DROP FUNCTION adempiere.amf_reportstartdate(numeric);

CREATE OR REPLACE FUNCTION adempiere.amf_reportstartdate(p_client_id numeric)
  RETURNS timestamp without time zone AS
$BODY$DECLARE
	v_year_id		numeric :=0;
	v_startDate		timestamp without time zone := null;
	v_currentDate		timestamp without time zone := null;
BEGIN

SELECT 
cast(current_date as timestamp) into v_currentDate ;

SELECT p.sartdate into v_startDate
FROM adempiere.AD_ClientInfo c  
INNER JOIN adempiere.C_Year y ON (c.C_Calendar_ID=y.C_Calendar_ID)  
INNER JOIN adempiere.C_Period p ON (y.C_Year_ID=p.C_Year_ID)   
WHERE c.AD_Client_ID=p_client_id  
AND v_currentDate BETWEEN p.StartDate AND p.EndDate
;

RETURN	v_startDate;
END;	$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION adempiere.amf_reportstartdate(numeric)
  OWNER TO postgres;
