prompt --application/shared_components/user_interface/themes
begin
--   Manifest
--     THEME: 220
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.0'
,p_default_workspace_id=>1830750307483664
,p_default_application_id=>220
,p_default_id_offset=>0
,p_default_owner=>'ANTON'
);
wwv_flow_api.create_theme(
 p_id=>wwv_flow_api.id(559147031373343458)
,p_theme_id=>42
,p_theme_name=>'Universal Theme'
,p_theme_internal_name=>'UNIVERSAL_THEME'
,p_ui_type_name=>'DESKTOP'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_reference_id=>4070917134413059350
,p_is_locked=>false
,p_default_page_template=>wwv_flow_api.id(559041949226343394)
,p_default_dialog_template=>wwv_flow_api.id(559025480166343388)
,p_error_template=>wwv_flow_api.id(559026935349343389)
,p_printer_friendly_template=>wwv_flow_api.id(559041949226343394)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_api.id(559026935349343389)
,p_default_button_template=>wwv_flow_api.id(559144204967343450)
,p_default_region_template=>wwv_flow_api.id(559079120751343416)
,p_default_chart_template=>wwv_flow_api.id(559079120751343416)
,p_default_form_template=>wwv_flow_api.id(559079120751343416)
,p_default_reportr_template=>wwv_flow_api.id(559079120751343416)
,p_default_tabform_template=>wwv_flow_api.id(559079120751343416)
,p_default_wizard_template=>wwv_flow_api.id(559079120751343416)
,p_default_menur_template=>wwv_flow_api.id(559088518644343420)
,p_default_listr_template=>wwv_flow_api.id(559079120751343416)
,p_default_irr_template=>wwv_flow_api.id(559077254481343416)
,p_default_report_template=>wwv_flow_api.id(559106690802343428)
,p_default_label_template=>wwv_flow_api.id(559141795443343448)
,p_default_menu_template=>wwv_flow_api.id(559145679000343451)
,p_default_calendar_template=>wwv_flow_api.id(559145736213343452)
,p_default_list_template=>wwv_flow_api.id(559124881958343439)
,p_default_nav_list_template=>wwv_flow_api.id(559140433309343447)
,p_default_top_nav_list_temp=>wwv_flow_api.id(559140433309343447)
,p_default_side_nav_list_temp=>wwv_flow_api.id(559138682428343447)
,p_default_nav_list_position=>'SIDE'
,p_default_dialogbtnr_template=>wwv_flow_api.id(559049125450343398)
,p_default_dialogr_template=>wwv_flow_api.id(559048174915343398)
,p_default_option_label=>wwv_flow_api.id(559141795443343448)
,p_default_required_label=>wwv_flow_api.id(559143077083343449)
,p_default_page_transition=>'NONE'
,p_default_popup_transition=>'NONE'
,p_default_navbar_list_template=>wwv_flow_api.id(559116040638343434)
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(42),'#IMAGE_PREFIX#themes/theme_42/21.1/')
,p_files_version=>64
,p_icon_library=>'FONTAPEX'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.stickyWidget#MIN#.js?v=#APEX_VERSION#',
'#THEME_IMAGES#js/theme42#MIN#.js?v=#APEX_VERSION#'))
,p_css_file_urls=>'#THEME_IMAGES#css/Core#MIN#.css?v=#APEX_VERSION#'
);
wwv_flow_api.component_end;
end;
/
