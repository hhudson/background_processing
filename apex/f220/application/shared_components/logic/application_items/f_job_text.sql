prompt --application/shared_components/logic/application_items/f_job_text
begin
--   Manifest
--     APPLICATION ITEM: F_JOB_TEXT
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.0'
,p_default_workspace_id=>1830750307483664
,p_default_application_id=>220
,p_default_id_offset=>0
,p_default_owner=>'ANTON'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(559181928101346817)
,p_name=>'F_JOB_TEXT'
,p_protection_level=>'I'
);
wwv_flow_api.component_end;
end;
/
