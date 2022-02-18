prompt --application/pages/page_00001
begin
--   Manifest
--     PAGE: 00001
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
 p_id=>1
,p_user_interface_id=>wwv_flow_api.id(559168718150343472)
,p_name=>'Home'
,p_alias=>'HOME'
,p_step_title=>'AIT62 - Sequence DNA'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ANTON'
,p_last_upd_yyyymmddhh24miss=>'20220218105535'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(547245393253014012)
,p_plug_name=>'DNA Analyzer'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(559079120751343416)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(559179534482343518)
,p_plug_name=>'AIT62 - Sequence DNA'
,p_icon_css_classes=>'app-icon'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(559069357469343411)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_query_num_rows=>15
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(547245543884014014)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(547245393253014012)
,p_button_name=>'ANALYZE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(559144204967343450)
,p_button_image_alt=>'Analyze...'
,p_button_position=>'BELOW_BOX'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(547246397358014022)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(547245393253014012)
,p_button_name=>'SET_TYPE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(559144204967343450)
,p_button_image_alt=>'Set Type'
,p_button_position=>'BODY'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(547246458836014023)
,p_branch_name=>'Same Page'
,p_branch_action=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(547245487573014013)
,p_name=>'P1_DNA_SEQUENCE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(547245393253014012)
,p_prompt=>'DNA Sequence'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(559141795443343448)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(547246268237014021)
,p_name=>'P1_ANALYSIS_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(547245393253014012)
,p_prompt=>'Analysis Type'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Normal;Normal,Full;Full,Minimal;Minimal'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select -'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(559141795443343448)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(547245639864014015)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Analyze DNA in Background'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'ait62_utils.analyze_dna_in_background(  p_dna_sequence      => :P1_DNA_SEQUENCE,',
'                                        p_app_id            => :APP_ID,',
'                                        p_pageid            => :APP_PAGE_ID,',
'                                        p_app_session       => :APP_SESSION);',
''))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'Unable to analyze.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(547245543884014014)
,p_process_success_message=>'DNA submitted for analysis.'
);
wwv_flow_api.component_end;
end;
/
