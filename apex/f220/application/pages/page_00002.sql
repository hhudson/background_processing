prompt --application/pages/page_00002
begin
--   Manifest
--     PAGE: 00002
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.0'
,p_default_workspace_id=>1830750307483664
,p_default_application_id=>220
,p_default_id_offset=>0
,p_default_owner=>'ANTON'
);
wwv_flow_api.create_page(
 p_id=>2
,p_user_interface_id=>wwv_flow_api.id(559168718150343472)
,p_name=>'Job Status'
,p_alias=>'JOB-STATUS'
,p_page_mode=>'MODAL'
,p_step_title=>'Job Status'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ANTON'
,p_last_upd_yyyymmddhh24miss=>'20220216161515'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(559188578721944999)
,p_name=>'Report 1'
,p_template=>wwv_flow_api.id(559048174915343398)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c002 job_name, c003 job_status, c004 error_message',
'  from apex_collections',
'  where collection_name = ''JOB_STATUS''',
'  order by seq_id desc'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_api.id(559106690802343428)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>500
,p_csv_output=>'Y'
,p_csv_output_link_text=>'Download'
,p_prn_output=>'N'
,p_prn_format=>'PDF'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(559188938805945002)
,p_query_column_id=>1
,p_column_alias=>'JOB_NAME'
,p_column_display_sequence=>10
,p_column_heading=>'Job Name'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(559189364074945004)
,p_query_column_id=>2
,p_column_alias=>'JOB_STATUS'
,p_column_display_sequence=>20
,p_column_heading=>'Job Status'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(547245753415014016)
,p_query_column_id=>3
,p_column_alias=>'ERROR_MESSAGE'
,p_column_display_sequence=>30
,p_column_heading=>'Error Message'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(547245828037014017)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(559188578721944999)
,p_button_name=>'CLEAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(559144204967343450)
,p_button_image_alt=>'Clear'
,p_button_position=>'TOP'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(547246015537014019)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Truncate Collection'
,p_process_sql_clob=>'apex_collection.truncate_collection(ait62_utils.gc_collection_name);'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(547246121962014020)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.component_end;
end;
/
