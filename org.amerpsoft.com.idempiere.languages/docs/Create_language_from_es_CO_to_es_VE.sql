﻿-- CREATE_LANGUAJE_FROM_es_CO_to_es_VE.sql
-- Se debe definir el Idioma es_VE como idioma del Systema
-- Ejecutar Language Maintainance en en menú Languaje
--	Ejecutar este script:
--  psql -U adempiere -d idempiereLCO -f CREATE_LANGUAJE_FROM_es_CO_to_es_VE.sql
--
UPDATE adempiere.AD_LANGUAGE SET issystemlanguage = 'Y' WHERE AD_LANGUAGE='es_VE';
UPDATE adempiere.AD_LANGUAGE SET issystemlanguage = 'Y' WHERE AD_LANGUAGE='es_CO';
UPDATE adempiere.AD_CLIENT SET AD_LANGUAGE='es_VE' WHERE AD_LANGUAGE='es_CO';
-- ----------------------------------------
-- ad_column_trl 	(ad_column_id)
-- ----------------------------------------
-- name
UPDATE adempiere.ad_column_trl as adtrl_2
set name=( SELECT adtrl_1."name" FROM adempiere.ad_column_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_column_id = adtrl_2.ad_column_id order by adtrl_1.ad_column_id );
-- set istranslated='Y'
UPDATE adempiere.ad_column_trl as adtrl_1 set istranslated='Y' WHERE adtrl_1.ad_language = 'es_VE';
-- ----------------------------------------
-- ad_desktop_trl 	(ad_desktop_id)
-- ----------------------------------------
-- name
UPDATE adempiere.ad_desktop_trl as adtrl_2
set name=( SELECT adtrl_1."name" FROM adempiere.ad_desktop_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_desktop_id = adtrl_2.ad_desktop_id order by adtrl_1.ad_desktop_id );
-- description
UPDATE adempiere.ad_desktop_trl as adtrl_2
set description=( SELECT adtrl_1."description" FROM adempiere.ad_desktop_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_desktop_id = adtrl_2.ad_desktop_id order by adtrl_1.ad_desktop_id );
-- help
UPDATE adempiere.ad_desktop_trl as adtrl_2
set help=( SELECT adtrl_1."help" FROM adempiere.ad_desktop_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_desktop_id = adtrl_2.ad_desktop_id order by adtrl_1.ad_desktop_id );
-- set istranslated='Y'
UPDATE adempiere.ad_desktop_trl as adtrl_1 set istranslated='Y' WHERE adtrl_1.ad_language = 'es_VE';
-- ----------------------------------------
-- ad_element_trl	(ad_element_id)
-- ----------------------------------------
-- name
UPDATE adempiere.ad_element_trl as adtrl_2
set name=( SELECT adtrl_1."name" FROM adempiere.ad_element_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_element_id = adtrl_2.ad_element_id order by adtrl_1.ad_element_id );
-- printname
UPDATE adempiere.ad_element_trl as adtrl_2
set printname=( SELECT adtrl_1."printname" FROM adempiere.ad_element_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_element_id = adtrl_2.ad_element_id order by adtrl_1.ad_element_id );
-- description
UPDATE adempiere.ad_element_trl as adtrl_2
set description=( SELECT adtrl_1."description" FROM adempiere.ad_element_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_element_id = adtrl_2.ad_element_id order by adtrl_1.ad_element_id );
-- help
UPDATE adempiere.ad_element_trl as adtrl_2
set help=( SELECT adtrl_1."help" FROM adempiere.ad_element_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_element_id = adtrl_2.ad_element_id order by adtrl_1.ad_element_id );
-- set istranslated='Y'
UPDATE adempiere.ad_element_trl as adtrl_1 set istranslated='Y' WHERE adtrl_1.ad_language = 'es_VE';
-- ----------------------------------------
-- ad_field_trl		(ad_field_id)
-- ----------------------------------------
-- name
UPDATE adempiere.ad_field_trl as adtrl_2
set name=( SELECT adtrl_1."name" FROM adempiere.ad_field_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_field_id = adtrl_2.ad_field_id order by adtrl_1.ad_field_id );
-- description
UPDATE adempiere.ad_field_trl as adtrl_2
set description=( SELECT adtrl_1."description" FROM adempiere.ad_field_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_field_id = adtrl_2.ad_field_id order by adtrl_1.ad_field_id );
-- help
UPDATE adempiere.ad_field_trl as adtrl_2
set help=( SELECT adtrl_1."help" FROM adempiere.ad_field_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_field_id = adtrl_2.ad_field_id order by adtrl_1.ad_field_id );
-- set istranslated='Y'
UPDATE adempiere.ad_field_trl as adtrl_1 set istranslated='Y' WHERE adtrl_1.ad_language = 'es_VE';
-- ----------------------------------------
-- ad_fieldgroup_trl	(ad_fieldgroup_id)
-- ----------------------------------------
-- name
UPDATE adempiere.ad_fieldgroup_trl as adtrl_2
set name=( SELECT adtrl_1."name" FROM adempiere.ad_fieldgroup_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_fieldgroup_id = adtrl_2.ad_fieldgroup_id order by adtrl_1.ad_fieldgroup_id );
-- set istranslated='Y'
UPDATE adempiere.ad_fieldgroup_trl as adtrl_1 set istranslated='Y' WHERE adtrl_1.ad_language = 'es_VE';
-- ----------------------------------------
-- ad_form_trl		(ad_form_id)
-- ----------------------------------------
-- name
UPDATE adempiere.ad_form_trl as adtrl_2
set name=( SELECT adtrl_1."name" FROM adempiere.ad_form_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_form_id = adtrl_2.ad_form_id order by adtrl_1.ad_form_id );
-- description
UPDATE adempiere.ad_form_trl as adtrl_2
set description=( SELECT adtrl_1."description" FROM adempiere.ad_form_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_form_id = adtrl_2.ad_form_id order by adtrl_1.ad_form_id );
-- help
UPDATE adempiere.ad_form_trl as adtrl_2
set help=( SELECT adtrl_1."help" FROM adempiere.ad_form_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_form_id = adtrl_2.ad_form_id order by adtrl_1.ad_form_id );
-- set istranslated='Y'
UPDATE adempiere.ad_form_trl as adtrl_1 set istranslated='Y' WHERE adtrl_1.ad_language = 'es_VE';
-- ----------------------------------------
-- ad_infocolumn_trl	(ad_infocolumn_id)
-- ----------------------------------------
-- name
UPDATE adempiere.ad_infocolumn_trl as adtrl_2
set name=( SELECT adtrl_1."name" FROM adempiere.ad_infocolumn_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_infocolumn_id = adtrl_2.ad_infocolumn_id order by adtrl_1.ad_infocolumn_id );
-- description
UPDATE adempiere.ad_infocolumn_trl as adtrl_2
set description=( SELECT adtrl_1."description" FROM adempiere.ad_infocolumn_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_infocolumn_id = adtrl_2.ad_infocolumn_id order by adtrl_1.ad_infocolumn_id );
-- help
UPDATE adempiere.ad_infocolumn_trl as adtrl_2
set help=( SELECT adtrl_1."help" FROM adempiere.ad_infocolumn_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_infocolumn_id = adtrl_2.ad_infocolumn_id order by adtrl_1.ad_infocolumn_id );
-- set istranslated='Y'
UPDATE adempiere.ad_infocolumn_trl as adtrl_1 set istranslated='Y' WHERE adtrl_1.ad_language = 'es_VE';
-- ----------------------------------------
-- ad_infowindow_trl 	(ad_infowindow_id)
-- ----------------------------------------
-- name
UPDATE adempiere.ad_infowindow_trl as adtrl_2
set name=( SELECT adtrl_1."name" FROM adempiere.ad_infowindow_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_infowindow_id = adtrl_2.ad_infowindow_id order by adtrl_1.ad_infowindow_id );
-- description
UPDATE adempiere.ad_infowindow_trl as adtrl_2
set description=( SELECT adtrl_1."description" FROM adempiere.ad_infowindow_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_infowindow_id = adtrl_2.ad_infowindow_id order by adtrl_1.ad_infowindow_id );
-- help
UPDATE adempiere.ad_infowindow_trl as adtrl_2
set help=( SELECT adtrl_1."help" FROM adempiere.ad_infowindow_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_infowindow_id = adtrl_2.ad_infowindow_id order by adtrl_1.ad_infowindow_id );
-- set istranslated='Y'
UPDATE adempiere.ad_infowindow_trl as adtrl_1 set istranslated='Y' WHERE adtrl_1.ad_language = 'es_VE';
-- -----------------------------------------------
-- ad_menu_trl 	(ad_menu_id) only name,description
-- -----------------------------------------------
UPDATE adempiere.ad_menu_trl as adtrl_2
-- name
set name=( SELECT adtrl_1."name" FROM adempiere.ad_menu_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_menu_id = adtrl_2.ad_menu_id order by adtrl_1.ad_menu_id );
-- description
UPDATE adempiere.ad_menu_trl as adtrl_2
set description=( SELECT adtrl_1."description" FROM adempiere.ad_menu_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_menu_id = adtrl_2.ad_menu_id order by adtrl_1.ad_menu_id );
-- set istranslated='Y'
UPDATE adempiere.ad_menu_trl as adtrl_1 set istranslated='Y' WHERE adtrl_1.ad_language = 'es_VE';
-- ----------------------------------------
-- ad_message_trl (ad_message_id)
-- ----------------------------------------
-- msgtext
UPDATE adempiere.ad_message_trl as adtrl_2
set msgtext=( SELECT adtrl_1."msgtext" FROM adempiere.ad_message_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_message_id = adtrl_2.ad_message_id order by adtrl_1.ad_message_id );
-- msgtip
UPDATE adempiere.ad_message_trl as adtrl_2
set msgtip=( SELECT adtrl_1."msgtip" FROM adempiere.ad_message_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_message_id = adtrl_2.ad_message_id order by adtrl_1.ad_message_id );
-- set istranslated='Y'
UPDATE adempiere.ad_message_trl as adtrl_1 set istranslated='Y' WHERE adtrl_1.ad_language = 'es_VE';
-- --------------------------------------------
-- ad_printformatitem_trl  (ad_printformatitem_id)
-- --------------------------------------------
-- UPDATE adempiere.AD_PRINTFORMATITEM_TRL SET AD_LANGUAGE='es_VE' WHERE AD_LANGUAGE='es_CO';
-- printname
UPDATE adempiere.ad_printformatitem_trl as adtrl_2
set printname=( SELECT adtrl_1."printname" FROM adempiere.ad_printformatitem_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_printformatitem_id = adtrl_2.ad_printformatitem_id order by adtrl_1.ad_printformatitem_id );
-- name
UPDATE adempiere.ad_printformatitem_trl as adtrl_2
set name=( SELECT adtrl_1."name" FROM adempiere.ad_printformatitem_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_printformatitem_id = adtrl_2.ad_printformatitem_id order by adtrl_1.ad_printformatitem_id );
-- set istranslated='Y'
UPDATE adempiere.ad_printformatitem_trl as adtrl_1 set istranslated='Y' WHERE adtrl_1.ad_language = 'es_VE';
-- ----------------------------------------
--
-- ----------------------------------------
-- UPDATE adempiere.AD_PRINTLABELLINE_TRL SET AD_LANGUAGE='es_VE' WHERE AD_LANGUAGE='es_CO';

-- --------------------------------------------
-- ad_process_para_trl   (ad_process_para_id)
-- --------------------------------------------
-- name
UPDATE adempiere.ad_process_para_trl as adtrl_2
set name=( SELECT adtrl_1."name" FROM adempiere.ad_process_para_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_process_para_id = adtrl_2.ad_process_para_id order by adtrl_1.ad_process_para_id );
-- description
UPDATE adempiere.ad_process_para_trl as adtrl_2
set description=( SELECT adtrl_1."description" FROM adempiere.ad_process_para_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_process_para_id = adtrl_2.ad_process_para_id order by adtrl_1.ad_process_para_id );
-- help
UPDATE adempiere.ad_process_para_trl as adtrl_2
set help=( SELECT adtrl_1."help" FROM adempiere.ad_process_para_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_process_para_id = adtrl_2.ad_process_para_id order by adtrl_1.ad_process_para_id );
-- set istranslated='Y'
UPDATE adempiere.ad_process_para_trl as adtrl_1 set istranslated='Y' WHERE adtrl_1.ad_language = 'es_VE';
-- ----------------------------------------
-- ad_process_trl   (ad_process_id)
-- --------------------------------------------
-- name
UPDATE adempiere.ad_process_trl as adtrl_2
set name=( SELECT adtrl_1."name" FROM adempiere.ad_process_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_process_id = adtrl_2.ad_process_id order by adtrl_1.ad_process_id );
-- description
UPDATE adempiere.ad_process_trl as adtrl_2
set description=( SELECT adtrl_1."description" FROM adempiere.ad_process_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_process_id = adtrl_2.ad_process_id order by adtrl_1.ad_process_id );
-- help
UPDATE adempiere.ad_process_trl as adtrl_2
set help=( SELECT adtrl_1."help" FROM adempiere.ad_process_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_process_id = adtrl_2.ad_process_id order by adtrl_1.ad_process_id );
-- set istranslated='Y'
UPDATE adempiere.ad_process_trl as adtrl_1 set istranslated='Y' WHERE adtrl_1.ad_language = 'es_VE';
-- ----------------------------------------
-- ad_ref_list_trl    (ad_ref_list_id)
-- ----------------------------------------
-- name
UPDATE adempiere.ad_ref_list_trl as adtrl_2
set name=( SELECT adtrl_1."name" FROM adempiere.ad_ref_list_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_ref_list_id = adtrl_2.ad_ref_list_id order by adtrl_1.ad_ref_list_id );
-- description
UPDATE adempiere.ad_ref_list_trl as adtrl_2
set description=( SELECT adtrl_1."description" FROM adempiere.ad_ref_list_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_ref_list_id = adtrl_2.ad_ref_list_id order by adtrl_1.ad_ref_list_id );
-- set istranslated='Y'
UPDATE adempiere.ad_ref_list_trl as adtrl_1 set istranslated='Y' WHERE adtrl_1.ad_language = 'es_VE';
-- ----------------------------------------
-- ad_reference_trl   (ad_reference_id)
-- ----------------------------------------
-- name
UPDATE adempiere.ad_reference_trl as adtrl_2
set name=( SELECT adtrl_1."name" FROM adempiere.ad_reference_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_reference_id = adtrl_2.ad_reference_id order by adtrl_1.ad_reference_id );
-- description
UPDATE adempiere.ad_reference_trl as adtrl_2
set description=( SELECT adtrl_1."description" FROM adempiere.ad_reference_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_reference_id = adtrl_2.ad_reference_id order by adtrl_1.ad_reference_id );
-- help
UPDATE adempiere.ad_reference_trl as adtrl_2
set help=( SELECT adtrl_1."help" FROM adempiere.ad_reference_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_reference_id = adtrl_2.ad_reference_id order by adtrl_1.ad_reference_id );
-- set istranslated='Y'
UPDATE adempiere.ad_reference_trl as adtrl_1 set istranslated='Y' WHERE adtrl_1.ad_language = 'es_VE';
-- ----------------------------------------
-- ad_tab_trl		(ad_tab_id)
-- ----------------------------------------
-- name
UPDATE adempiere.ad_tab_trl as adtrl_2
set name=( SELECT adtrl_1."name" FROM adempiere.ad_tab_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_tab_id = adtrl_2.ad_tab_id order by adtrl_1.ad_tab_id );
-- description
UPDATE adempiere.ad_tab_trl as adtrl_2
set description=( SELECT adtrl_1."description" FROM adempiere.ad_tab_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_tab_id = adtrl_2.ad_tab_id order by adtrl_1.ad_tab_id );
-- help
UPDATE adempiere.ad_tab_trl as adtrl_2
set help=( SELECT adtrl_1."help" FROM adempiere.ad_tab_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_tab_id = adtrl_2.ad_tab_id order by adtrl_1.ad_tab_id );
-- commitwarning
UPDATE adempiere.ad_tab_trl as adtrl_2
set commitwarning=( SELECT adtrl_1."commitwarning" FROM adempiere.ad_tab_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_tab_id = adtrl_2.ad_tab_id order by adtrl_1.ad_tab_id );
-- set istranslated='Y'
UPDATE adempiere.ad_tab_trl as adtrl_1 set istranslated='Y' WHERE adtrl_1.ad_language = 'es_VE';
-- ----------------------------------------
--	ad_table_trl   (ad_table_id)
-- ----------------------------------------
-- name
UPDATE adempiere.ad_table_trl as adtrl_2
set name=( SELECT adtrl_1."name" FROM adempiere.ad_table_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_table_id = adtrl_2.ad_table_id order by adtrl_1.ad_table_id );
-- set istranslated='Y'
UPDATE adempiere.ad_table_trl as adtrl_1 set istranslated='Y' WHERE adtrl_1.ad_language = 'es_VE';
-- ----------------------------------------
-- ad_task_trl		(ad_task_id)
-- ----------------------------------------
-- name
UPDATE adempiere.ad_task_trl as adtrl_2
set name=( SELECT adtrl_1."name" FROM adempiere.ad_task_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_task_id = adtrl_2.ad_task_id order by adtrl_1.ad_task_id );
-- description
UPDATE adempiere.ad_task_trl as adtrl_2
set description=( SELECT adtrl_1."description" FROM adempiere.ad_task_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_task_id = adtrl_2.ad_task_id order by adtrl_1.ad_task_id );
-- help
UPDATE adempiere.ad_task_trl as adtrl_2
set help=( SELECT adtrl_1."help" FROM adempiere.ad_task_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_task_id = adtrl_2.ad_task_id order by adtrl_1.ad_task_id );
-- set istranslated='Y'
UPDATE adempiere.ad_task_trl as adtrl_1 set istranslated='Y' WHERE adtrl_1.ad_language = 'es_VE';
-- ----------------------------------------
--
-- ----------------------------------------
-- UPDATE adempiere.AD_USERDEF_WIN SET AD_LANGUAGE='es_VE' WHERE AD_LANGUAGE='es_CO';
-- ----------------------------------------
-- ad_wf_node_trl	(ad_wf_node_id)
-- ----------------------------------------
-- name
UPDATE adempiere.ad_wf_node_trl as adtrl_2
set name=( SELECT adtrl_1."name" FROM adempiere.ad_wf_node_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_wf_node_id = adtrl_2.ad_wf_node_id order by adtrl_1.ad_wf_node_id );
-- description
UPDATE adempiere.ad_wf_node_trl as adtrl_2
set description=( SELECT adtrl_1."description" FROM adempiere.ad_wf_node_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_wf_node_id = adtrl_2.ad_wf_node_id order by adtrl_1.ad_wf_node_id );
-- help
UPDATE adempiere.ad_wf_node_trl as adtrl_2
set help=( SELECT adtrl_1."help" FROM adempiere.ad_wf_node_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_wf_node_id = adtrl_2.ad_wf_node_id order by adtrl_1.ad_wf_node_id );
-- set istranslated='Y'
UPDATE adempiere.ad_wf_node_trl as adtrl_1 set istranslated='Y' WHERE adtrl_1.ad_language = 'es_VE';
-- ----------------------------------------
-- ad_window_trl (ad_window_id)
-- ----------------------------------------
-- name
UPDATE adempiere.ad_window_trl as adtrl_2
set name=( SELECT adtrl_1."name" FROM adempiere.ad_window_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_window_id = adtrl_2.ad_window_id order by adtrl_1.ad_window_id );
-- description
UPDATE adempiere.ad_window_trl as adtrl_2
set description=( SELECT adtrl_1."description" FROM adempiere.ad_window_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_window_id = adtrl_2.ad_window_id order by adtrl_1.ad_window_id );
-- help
UPDATE adempiere.ad_window_trl as adtrl_2
set help=( SELECT adtrl_1."help" FROM adempiere.ad_window_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_window_id = adtrl_2.ad_window_id order by adtrl_1.ad_window_id );
-- set istranslated='Y'
UPDATE adempiere.ad_window_trl as adtrl_1 set istranslated='Y' WHERE adtrl_1.ad_language = 'es_VE';
-- ----------------------------------------
-- ad_workbench_trl  	(ad_workbench_id)
-- ----------------------------------------
-- name
UPDATE adempiere.ad_workbench_trl as adtrl_2
set name=( SELECT adtrl_1."name" FROM adempiere.ad_workbench_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_workbench_id = adtrl_2.ad_workbench_id order by adtrl_1.ad_workbench_id );
-- description
UPDATE adempiere.ad_workbench_trl as adtrl_2
set description=( SELECT adtrl_1."description" FROM adempiere.ad_workbench_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_workbench_id = adtrl_2.ad_workbench_id order by adtrl_1.ad_workbench_id );
-- help
UPDATE adempiere.ad_workbench_trl as adtrl_2
set help=( SELECT adtrl_1."help" FROM adempiere.ad_workbench_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_workbench_id = adtrl_2.ad_workbench_id order by adtrl_1.ad_workbench_id );
-- set istranslated='Y'
UPDATE adempiere.ad_workbench_trl as adtrl_1 set istranslated='Y' WHERE adtrl_1.ad_language = 'es_VE';
-- ----------------------------------------
-- ad_workflow_trl	(ad_workflow_id)
-- ----------------------------------------
-- name
UPDATE adempiere.ad_workflow_trl as adtrl_2
set name=( SELECT adtrl_1."name" FROM adempiere.ad_workflow_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_workflow_id = adtrl_2.ad_workflow_id order by adtrl_1.ad_workflow_id );
-- description
UPDATE adempiere.ad_workflow_trl as adtrl_2
set description=( SELECT adtrl_1."description" FROM adempiere.ad_workflow_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_workflow_id = adtrl_2.ad_workflow_id order by adtrl_1.ad_workflow_id );
-- help
UPDATE adempiere.ad_workflow_trl as adtrl_2
set help=( SELECT adtrl_1."help" FROM adempiere.ad_workflow_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.ad_workflow_id = adtrl_2.ad_workflow_id order by adtrl_1.ad_workflow_id );
-- set istranslated='Y'
UPDATE adempiere.ad_workflow_trl as adtrl_1 set istranslated='Y' WHERE adtrl_1.ad_language = 'es_VE';
-- ----------------------------------------
--
-- ----------------------------------------
-- UPDATE adempiere.C_BPARTNER SET AD_LANGUAGE='es_VE' WHERE AD_LANGUAGE='es_CO';
-- UPDATE C_COUNTRY SET AD_LANGUAGE='es_VE' WHERE AD_LANGUAGE='es_CO';
-- ----------------------------------------
-- c_country_trl	(c_country_id)
-- ----------------------------------------
-- name
UPDATE adempiere.c_country_trl as adtrl_2
set name=( SELECT adtrl_1."name" FROM adempiere.c_country_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.c_country_id = adtrl_2.c_country_id order by adtrl_1.c_country_id );
-- description
UPDATE adempiere.c_country_trl as adtrl_2
set description=( SELECT adtrl_1."description" FROM adempiere.c_country_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.c_country_id = adtrl_2.c_country_id order by adtrl_1.c_country_id );
-- regionname
UPDATE adempiere.c_country_trl as adtrl_2
set regionname=( SELECT adtrl_1."regionname" FROM adempiere.c_country_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.c_country_id = adtrl_2.c_country_id order by adtrl_1.c_country_id );
-- set istranslated='Y'
UPDATE adempiere.c_country_trl as adtrl_1 set istranslated='Y' WHERE adtrl_1.ad_language = 'es_VE';
-- ----------------------------------------
-- c_currency_trl	(c_currency_id)
-- ----------------------------------------
-- description
UPDATE adempiere.c_currency_trl as adtrl_2
set description=( SELECT adtrl_1."description" FROM adempiere.c_currency_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.c_currency_id = adtrl_2.c_currency_id order by adtrl_1.c_currency_id );
-- set istranslated='Y'
UPDATE adempiere.c_currency_trl as adtrl_1 set istranslated='Y' WHERE adtrl_1.ad_language = 'es_VE';
-- ----------------------------------------
-- c_doctype_trl  (c_doctype_id)
-- ----------------------------------------
-- name
UPDATE adempiere.c_doctype_trl as adtrl_2
set name=( SELECT adtrl_1."name" FROM adempiere.c_doctype_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.c_doctype_id = adtrl_2.c_doctype_id order by adtrl_1.c_doctype_id );
-- printname
UPDATE adempiere.c_doctype_trl as adtrl_2
set printname=( SELECT adtrl_1."printname" FROM adempiere.c_doctype_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.c_doctype_id = adtrl_2.c_doctype_id order by adtrl_1.c_doctype_id );
-- documentnote
UPDATE adempiere.c_doctype_trl as adtrl_2
set documentnote=( SELECT adtrl_1."documentnote" FROM adempiere.c_doctype_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.c_doctype_id = adtrl_2.c_doctype_id order by adtrl_1.c_doctype_id );
-- set istranslated='Y'
UPDATE adempiere.c_doctype_trl as adtrl_1 set istranslated='Y' WHERE adtrl_1.ad_language = 'es_VE';
-- ----------------------------------------
-- c_dunninglevel_trl   (c_dunninglevel_id)
-- ----------------------------------------
-- printname
UPDATE adempiere.c_dunninglevel_trl as adtrl_2
set printname=( SELECT adtrl_1."printname" FROM adempiere.c_dunninglevel_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.c_dunninglevel_id = adtrl_2.c_dunninglevel_id order by adtrl_1.c_dunninglevel_id );
-- note
UPDATE adempiere.c_dunninglevel_trl as adtrl_2
set note=( SELECT adtrl_1."note" FROM adempiere.c_dunninglevel_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.c_dunninglevel_id = adtrl_2.c_dunninglevel_id order by adtrl_1.c_dunninglevel_id );
-- set istranslated='Y'
UPDATE adempiere.c_dunninglevel_trl as adtrl_1 set istranslated='Y' WHERE adtrl_1.ad_language = 'es_VE';
-- ----------------------------------------
-- c_elementvalue_trl	(c_elementvalue_id)
-- ----------------------------------------
-- name
UPDATE adempiere.c_elementvalue_trl as adtrl_2
set name=( SELECT adtrl_1."name" FROM adempiere.c_elementvalue_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.c_elementvalue_id = adtrl_2.c_elementvalue_id order by adtrl_1.c_elementvalue_id );
-- description
UPDATE adempiere.c_elementvalue_trl as adtrl_2
set description=( SELECT adtrl_1."description" FROM adempiere.c_elementvalue_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.c_elementvalue_id = adtrl_2.c_elementvalue_id order by adtrl_1.c_elementvalue_id );
-- set istranslated='Y'
UPDATE adempiere.c_elementvalue_trl as adtrl_1 set istranslated='Y' WHERE adtrl_1.ad_language = 'es_VE';
-- ----------------------------------------
-- c_greeting_trl	(c_greeting_id)
-- ----------------------------------------
-- name
UPDATE adempiere.c_greeting_trl as adtrl_2
set name=( SELECT adtrl_1."name" FROM adempiere.c_greeting_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.c_greeting_id = adtrl_2.c_greeting_id order by adtrl_1.c_greeting_id );
-- greeting
UPDATE adempiere.c_greeting_trl as adtrl_2
set greeting=( SELECT adtrl_1."greeting" FROM adempiere.c_greeting_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.c_greeting_id = adtrl_2.c_greeting_id order by adtrl_1.c_greeting_id );
-- set istranslated='Y'
UPDATE adempiere.c_greeting_trl as adtrl_1 set istranslated='Y' WHERE adtrl_1.ad_language = 'es_VE';
-- ----------------------------------------
-- c_paymentterm_trl	(c_paymentterm_id)
-- ----------------------------------------
-- name
UPDATE adempiere.c_paymentterm_trl as adtrl_2
set name=( SELECT adtrl_1."name" FROM adempiere.c_paymentterm_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.c_paymentterm_id = adtrl_2.c_paymentterm_id order by adtrl_1.c_paymentterm_id );
-- description
UPDATE adempiere.c_paymentterm_trl as adtrl_2
set description=( SELECT adtrl_1."description" FROM adempiere.c_paymentterm_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.c_paymentterm_id = adtrl_2.c_paymentterm_id order by adtrl_1.c_paymentterm_id );
-- documentnote
UPDATE adempiere.c_paymentterm_trl as adtrl_2
set documentnote=( SELECT adtrl_1."documentnote" FROM adempiere.c_paymentterm_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.c_paymentterm_id = adtrl_2.c_paymentterm_id order by adtrl_1.c_paymentterm_id );
-- set istranslated='Y'
UPDATE adempiere.c_paymentterm_trl as adtrl_1 set istranslated='Y' WHERE adtrl_1.ad_language = 'es_VE';
-- ----------------------------------------
-- c_tax_trl	(c_tax_id)
-- ----------------------------------------
-- name
UPDATE adempiere.c_tax_trl as adtrl_2
set name=( SELECT adtrl_1."name" FROM adempiere.c_tax_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.c_tax_id = adtrl_2.c_tax_id order by adtrl_1.c_tax_id );
-- description
UPDATE adempiere.c_tax_trl as adtrl_2
set description=( SELECT adtrl_1."description" FROM adempiere.c_tax_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.c_tax_id = adtrl_2.c_tax_id order by adtrl_1.c_tax_id );
-- taxindicator
UPDATE adempiere.c_tax_trl as adtrl_2
set taxindicator=( SELECT adtrl_1."taxindicator" FROM adempiere.c_tax_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.c_tax_id = adtrl_2.c_tax_id order by adtrl_1.c_tax_id );
-- set istranslated='Y'
UPDATE adempiere.c_tax_trl as adtrl_1 set istranslated='Y' WHERE adtrl_1.ad_language = 'es_VE';
-- ----------------------------------------
-- c_taxcategory_trl	(c_taxcategory_id)
-- ----------------------------------------
-- name
UPDATE adempiere.c_taxcategory_trl as adtrl_2
set name=( SELECT adtrl_1."name" FROM adempiere.c_taxcategory_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.c_taxcategory_id = adtrl_2.c_taxcategory_id order by adtrl_1.c_taxcategory_id );
-- description
UPDATE adempiere.c_taxcategory_trl as adtrl_2
set description=( SELECT adtrl_1."description" FROM adempiere.c_taxcategory_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.c_taxcategory_id = adtrl_2.c_taxcategory_id order by adtrl_1.c_taxcategory_id );
-- set istranslated='Y'
UPDATE adempiere.c_taxcategory_trl as adtrl_1 set istranslated='Y' WHERE adtrl_1.ad_language = 'es_VE';
-- ----------------------------------------
-- c_uom_trl	(c_uom_id)
-- ----------------------------------------
-- name
UPDATE adempiere.c_uom_trl as adtrl_2
set name=( SELECT adtrl_1."name" FROM adempiere.c_uom_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.c_uom_id = adtrl_2.c_uom_id order by adtrl_1.c_uom_id );
-- description
UPDATE adempiere.c_uom_trl as adtrl_2
set description=( SELECT adtrl_1."description" FROM adempiere.c_uom_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.c_uom_id = adtrl_2.c_uom_id order by adtrl_1.c_uom_id );
-- set istranslated='Y'
UPDATE adempiere.c_uom_trl as adtrl_1 set istranslated='Y' WHERE adtrl_1.ad_language = 'es_VE';
-- --------------------------------------------------------
-- cm_container_element_trl 	(cm_container_element_id)
-- --------------------------------------------------------
-- name
UPDATE adempiere.cm_container_element_trl as adtrl_2
set name=( SELECT adtrl_1."name" FROM adempiere.cm_container_element_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.cm_container_element_id = adtrl_2.cm_container_element_id order by adtrl_1.cm_container_element_id );
-- description
UPDATE adempiere.cm_container_element_trl as adtrl_2
set description=( SELECT adtrl_1."description" FROM adempiere.cm_container_element_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.cm_container_element_id = adtrl_2.cm_container_element_id order by adtrl_1.cm_container_element_id );
-- help
UPDATE adempiere.cm_container_element_trl as adtrl_2
set help=( SELECT adtrl_1."help" FROM adempiere.cm_container_element_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.cm_container_element_id = adtrl_2.cm_container_element_id order by adtrl_1.cm_container_element_id );
-- set istranslated='Y'
UPDATE adempiere.cm_container_element_trl as adtrl_1 set istranslated='Y' WHERE adtrl_1.ad_language = 'es_VE';
-- ----------------------------------------
-- cm_container_trl 	(cm_container_id)
-- ----------------------------------------
-- name
UPDATE adempiere.cm_container_trl as adtrl_2
set name=( SELECT adtrl_1."name" FROM adempiere.cm_container_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.cm_container_id = adtrl_2.cm_container_id order by adtrl_1.cm_container_id );
-- title
UPDATE adempiere.cm_container_trl as adtrl_2
set title=( SELECT adtrl_1."title" FROM adempiere.cm_container_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.cm_container_id = adtrl_2.cm_container_id order by adtrl_1.cm_container_id );
-- meta_description
UPDATE adempiere.cm_container_trl as adtrl_2
set meta_description=( SELECT adtrl_1."meta_description" FROM adempiere.cm_container_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.cm_container_id = adtrl_2.cm_container_id order by adtrl_1.cm_container_id );
-- meta_keywords
UPDATE adempiere.cm_container_trl as adtrl_2
set meta_keywords=( SELECT adtrl_1."meta_keywords" FROM adempiere.cm_container_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.cm_container_id = adtrl_2.cm_container_id order by adtrl_1.cm_container_id );
-- set istranslated='Y'
UPDATE adempiere.cm_container_trl as adtrl_1 set istranslated='Y' WHERE adtrl_1.ad_language = 'es_VE';
-- ------------------------------------------------
-- cm_cstage_element_trl	(cm_cstage_element_id)
-- ------------------------------------------------
-- name
UPDATE adempiere.cm_cstage_element_trl as adtrl_2
set name=( SELECT adtrl_1."name" FROM adempiere.cm_cstage_element_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.cm_cstage_element_id = adtrl_2.cm_cstage_element_id order by adtrl_1.cm_cstage_element_id );
-- description
UPDATE adempiere.cm_cstage_element_trl as adtrl_2
set description=( SELECT adtrl_1."description" FROM adempiere.cm_cstage_element_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.cm_cstage_element_id = adtrl_2.cm_cstage_element_id order by adtrl_1.cm_cstage_element_id );
-- help
UPDATE adempiere.cm_cstage_element_trl as adtrl_2
set help=( SELECT adtrl_1."help" FROM adempiere.cm_cstage_element_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.cm_cstage_element_id = adtrl_2.cm_cstage_element_id order by adtrl_1.cm_cstage_element_id );
-- set istranslated='Y'
UPDATE adempiere.cm_cstage_element_trl as adtrl_1 set istranslated='Y' WHERE adtrl_1.ad_language = 'es_VE';
-- ----------------------------------------
-- cm_cstage_trl  (cm_cstage_id)
-- ----------------------------------------
-- name
UPDATE adempiere.cm_cstage_trl as adtrl_2
set name=( SELECT adtrl_1."name" FROM adempiere.cm_cstage_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.cm_cstage_id = adtrl_2.cm_cstage_id order by adtrl_1.cm_cstage_id );
-- title
UPDATE adempiere.cm_cstage_trl as adtrl_2
set title=( SELECT adtrl_1."title" FROM adempiere.cm_cstage_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.cm_cstage_id = adtrl_2.cm_cstage_id order by adtrl_1.cm_cstage_id );
-- meta_description
UPDATE adempiere.cm_cstage_trl as adtrl_2
set meta_description=( SELECT adtrl_1."meta_description" FROM adempiere.cm_cstage_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.cm_cstage_id = adtrl_2.cm_cstage_id order by adtrl_1.cm_cstage_id );
-- meta_keywords
UPDATE adempiere.cm_cstage_trl as adtrl_2
set meta_keywords=( SELECT adtrl_1."meta_keywords" FROM adempiere.cm_cstage_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.cm_cstage_id = adtrl_2.cm_cstage_id order by adtrl_1.cm_cstage_id );
-- set istranslated='Y'
UPDATE adempiere.cm_cstage_trl as adtrl_1 set istranslated='Y' WHERE adtrl_1.ad_language = 'es_VE';
-- ----------------------------------------
--
-- ----------------------------------------
-- UPDATE adempiere.CM_NEWSCHANNEL SET AD_LANGUAGE='es_VE' WHERE AD_LANGUAGE='es_CO';

-- ----------------------------------------
--
-- ----------------------------------------
-- UPDATE adempiere.K_SYNONYM SET AD_LANGUAGE='es_VE' WHERE AD_LANGUAGE='es_CO';

-- ----------------------------------------
-- m_product_trl	(m_product_id)
-- ----------------------------------------
-- name
UPDATE adempiere.m_product_trl as adtrl_2
set name=( SELECT adtrl_1."name" FROM adempiere.m_product_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.m_product_id = adtrl_2.m_product_id order by adtrl_1.m_product_id );
-- documentnote
UPDATE adempiere.m_product_trl as adtrl_2
set documentnote=( SELECT adtrl_1."documentnote" FROM adempiere.m_product_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.m_product_id = adtrl_2.m_product_id order by adtrl_1.m_product_id );
-- set istranslated='Y'
UPDATE adempiere.m_product_trl as adtrl_1 set istranslated='Y' WHERE adtrl_1.ad_language = 'es_VE';
-- ----------------------------------------
-- r_mailtext_trl	(r_mailtext_id)
-- ----------------------------------------
-- name
UPDATE adempiere.r_mailtext_trl as adtrl_2
set name=( SELECT adtrl_1."name" FROM adempiere.r_mailtext_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.r_mailtext_id = adtrl_2.r_mailtext_id order by adtrl_1.r_mailtext_id );
-- mailheader
UPDATE adempiere.r_mailtext_trl as adtrl_2
set mailheader=( SELECT adtrl_1."mailheader" FROM adempiere.r_mailtext_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.r_mailtext_id = adtrl_2.r_mailtext_id order by adtrl_1.r_mailtext_id );
-- mailtext
UPDATE adempiere.r_mailtext_trl as adtrl_2
set mailtext=( SELECT adtrl_1."mailtext" FROM adempiere.r_mailtext_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.r_mailtext_id = adtrl_2.r_mailtext_id order by adtrl_1.r_mailtext_id );
-- set istranslated='Y'
UPDATE adempiere.r_mailtext_trl as adtrl_1 set istranslated='Y' WHERE adtrl_1.ad_language = 'es_VE';
-- ----------------------------------------
--
-- ----------------------------------------
-- UPDATE adempiere.W_MAILMSG_TRL SET AD_LANGUAGE='es_VE' WHERE AD_LANGUAGE='es_CO';

-- ----------------------------------------
--
-- ----------------------------------------
-- UPDATE adempiere.W_STORE_TRL SET AD_LANGUAGE='es_VE' WHERE AD_LANGUAGE='es_CO';

-- ----------------------------------------
-- c_charge_trl	(c_charge_id)
-- ----------------------------------------
-- name
UPDATE adempiere.c_charge_trl as adtrl_2
set name=( SELECT adtrl_1."name" FROM adempiere.c_charge_trl as adtrl_1 
WHERE adtrl_1.ad_language = 'es_CO' and adtrl_1.c_charge_id = adtrl_2.c_charge_id order by adtrl_1.c_charge_id );
-- set istranslated='Y'
UPDATE adempiere.c_charge_trl as adtrl_1 set istranslated='Y' WHERE adtrl_1.ad_language = 'es_VE';

-- ----------------------------------------
--
-- ----------------------------------------
-- Tables PP added in manufacturing, these commands will show errors in 3.4.2s
-- UPDATE adempiere.pp_order_bom_trl SET AD_LANGUAGE='es_VE' WHERE AD_LANGUAGE='es_CO';

-- ----------------------------------------
--
-- ----------------------------------------
-- UPDATE adempiere.pp_order_bomline_trl SET AD_LANGUAGE='es_VE' WHERE AD_LANGUAGE='es_CO';

-- ----------------------------------------
--
-- ----------------------------------------
-- UPDATE adempiere.pp_order_node_trl SET AD_LANGUAGE='es_VE' WHERE AD_LANGUAGE='es_CO';

-- ----------------------------------------
--
-- ----------------------------------------
-- UPDATE adempiere.pp_order_workflow_trl SET AD_LANGUAGE='es_VE' WHERE AD_LANGUAGE='es_CO';

-- ----------------------------------------
--
-- ----------------------------------------
-- UPDATE adempiere.pp_product_bom_trl SET AD_LANGUAGE='es_VE' WHERE AD_LANGUAGE='es_CO';

-- ----------------------------------------
--
-- ----------------------------------------
-- UPDATE adempiere.pp_product_bomline_trl SET AD_LANGUAGE='es_VE' WHERE AD_LANGUAGE='es_CO';

-- COMMIT;
