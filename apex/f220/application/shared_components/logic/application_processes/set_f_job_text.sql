prompt --application/shared_components/logic/application_processes/set_f_job_text
begin
--   Manifest
--     APPLICATION PROCESS: Set F_JOB_TEXT
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.0'
,p_default_workspace_id=>1830750307483664
,p_default_application_id=>220
,p_default_id_offset=>0
,p_default_owner=>'ANTON'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(559185917197878868)
,p_process_sequence=>100
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set F_JOB_TEXT'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'l_error         number;',
'l_running       number;',
'l_complete       number;',
'begin',
'',
'    select count(*) ',
'      into l_error',
'      from apex_collections ',
'      where collection_name = ''JOB_STATUS''',
'        and c003 = ''ERROR''',
'        and rownum = 1;',
'',
'    select count(*) ',
'      into l_running',
'      from apex_collections ',
'      where collection_name = ''JOB_STATUS''',
'        and c003 = ''RUNNING''',
'        and rownum = 1;',
'',
'    select count(*) ',
'      into l_complete',
'      from apex_collections ',
'      where collection_name = ''JOB_STATUS''',
'        and c003 = ''COMPLETE''',
'        and rownum = 1;',
'',
'    if l_error > 0 then',
'        :F_JOB_TEXT := ''Error'';',
'        :F_JOB_ICON := ''fa-gear fam-warning fam-is-danger'';',
'    elsif l_running > 0 then',
'        :F_JOB_TEXT := ''Running'';',
'        :F_JOB_ICON := ''fa-gear fa-anim-spin'';',
'    elsif l_complete > 0 then',
'        :F_JOB_TEXT := ''Complete'';',
'        :F_JOB_ICON := ''fa-gear fam-plus fam-is-success'';',
'    else',
'        :F_JOB_TEXT := null;',
'        :F_JOB_ICON := null;',
'    end if;',
'',
'end;'))
,p_process_clob_language=>'PLSQL'
);
wwv_flow_api.component_end;
end;
/
