prompt --application/pages/page_00900
begin
--   Manifest
--     PAGE: 00900
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.10.01'
,p_release=>'20.2.0.00.20'
,p_default_workspace_id=>9526531750928358
,p_default_application_id=>700
,p_default_id_offset=>28323188538908472
,p_default_owner=>'DEV'
);
wwv_flow_api.create_page(
 p_id=>900
,p_user_interface_id=>wwv_flow_api.id(63766922917014449)
,p_name=>'#fa-gears'
,p_alias=>'DASHBOARD'
,p_step_title=>'Dashboard'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(64766608684607384)
,p_step_template=>wwv_flow_api.id(64127379571157916)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(63770652250014528)
,p_last_updated_by=>'DEV'
,p_last_upd_yyyymmddhh24miss=>'20210228180402'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(24327877447084361)
,p_plug_name=>'CHARTS'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(63687285315014341)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_required_role=>wwv_flow_api.id(31236197613688358)
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(22661704301774361)
,p_plug_name=>'Top 10 Users'
,p_parent_plug_id=>wwv_flow_api.id(24327877447084361)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(64142195941700285)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(13124746069120356)
,p_region_id=>wwv_flow_api.id(22661704301774361)
,p_chart_type=>'donut'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_format_scaling=>'none'
,p_fill_multi_series_gaps=>false
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>false
,p_show_value=>true
,p_show_label=>false
,p_show_row=>false
,p_show_start=>false
,p_show_end=>false
,p_show_progress=>false
,p_show_baseline=>false
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
,p_show_gauge_value=>false
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(13125210949120356)
,p_chart_id=>wwv_flow_api.id(13124746069120356)
,p_seq=>10
,p_name=>'Series 1'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT *',
'FROM (',
'    SELECT user_id, COUNT(*) AS rows_',
'    FROM p901_logs',
'    GROUP BY user_id',
'    ORDER BY 2 DESC, 1',
')',
'WHERE ROWNUM <= 10;'))
,p_items_value_column_name=>'ROWS_'
,p_items_label_column_name=>'USER_ID'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'LABEL'
,p_link_target=>'f?p=&APP_ID.:901:&SESSION.::&DEBUG.::P901_USER_ID:&USER_ID.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(22661983106774364)
,p_plug_name=>'Top 10 Pages'
,p_parent_plug_id=>wwv_flow_api.id(24327877447084361)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(64142195941700285)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(13121155685120345)
,p_region_id=>wwv_flow_api.id(22661983106774364)
,p_chart_type=>'donut'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_format_scaling=>'none'
,p_fill_multi_series_gaps=>false
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>false
,p_show_value=>true
,p_show_label=>false
,p_show_row=>false
,p_show_start=>false
,p_show_end=>false
,p_show_progress=>false
,p_show_baseline=>false
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
,p_show_gauge_value=>false
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(13121675594120346)
,p_chart_id=>wwv_flow_api.id(13121155685120345)
,p_seq=>10
,p_name=>'Series 1'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT *',
'FROM (',
'    SELECT page_id, COUNT(*) AS rows_',
'    FROM p901_logs',
'    WHERE page_id BETWEEN 1 AND 999',
'    GROUP BY page_id',
'    ORDER BY 2 DESC, 1',
')',
'WHERE ROWNUM <= 10',
'ORDER BY 1;',
''))
,p_items_value_column_name=>'ROWS_'
,p_items_label_column_name=>'PAGE_ID'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'LABEL'
,p_link_target=>'f?p=&APP_ID.:901:&SESSION.::&DEBUG.::P901_PAGE_ID:&PAGE_ID.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(22662326941774367)
,p_plug_name=>'Top 10 Sessions'
,p_parent_plug_id=>wwv_flow_api.id(24327877447084361)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(64142195941700285)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(13119364850120335)
,p_region_id=>wwv_flow_api.id(22662326941774367)
,p_chart_type=>'donut'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_format_scaling=>'none'
,p_fill_multi_series_gaps=>false
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>false
,p_show_value=>true
,p_show_label=>false
,p_show_row=>false
,p_show_start=>false
,p_show_end=>false
,p_show_progress=>false
,p_show_baseline=>false
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
,p_show_gauge_value=>false
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(13119819771120339)
,p_chart_id=>wwv_flow_api.id(13119364850120335)
,p_seq=>10
,p_name=>'Series 1'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT *',
'FROM (',
'    SELECT',
'        SUBSTR(session_id, -3) AS session_id,',
'        COUNT(*) AS rows_',
'    FROM p901_logs',
'    WHERE session_id > 0',
'    GROUP BY SUBSTR(session_id, -3)',
'    ORDER BY 2 DESC, 1',
')',
'WHERE ROWNUM <= 10;',
''))
,p_items_value_column_name=>'ROWS_'
,p_items_label_column_name=>'SESSION_ID'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'LABEL'
,p_link_target=>'f?p=&APP_ID.:901:&SESSION.::&DEBUG.::P901_SESSION_ID:&SESSION_ID.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(34647717482613319)
,p_plug_name=>'Flags'
,p_parent_plug_id=>wwv_flow_api.id(24327877447084361)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(64142195941700285)
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(13122910504120349)
,p_region_id=>wwv_flow_api.id(34647717482613319)
,p_chart_type=>'donut'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_format_scaling=>'none'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_indicator_size=>1
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(13123407713120350)
,p_chart_id=>wwv_flow_api.id(13122910504120349)
,p_seq=>10
,p_name=>'Series 1'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT flag, COUNT(*) AS rows_',
'FROM p901_logs',
'GROUP BY flag',
'ORDER BY 1;'))
,p_items_value_column_name=>'ROWS_'
,p_items_label_column_name=>'FLAG'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'LABEL'
,p_link_target=>'f?p=&APP_ID.:901:&SESSION.::&DEBUG.::P901_FLAG:&FLAG.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(71819787564897425)
,p_plug_name=>'Dashboard'
,p_region_name=>'DASHBOARD'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(64142195941700285)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT * FROM p900_dashboard;',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_footer=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span class="timing">#TIMING#s</span>',
''))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(15350545041894537)
,p_name=>'TRIGGERS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TRIGGERS'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Triggers'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>130
,p_value_alignment=>'RIGHT'
,p_link_target=>'f?p=&APP_ID.:901:&SESSION.::&DEBUG.::P901_FLAG,G_DATE,P901_RESET:G,&TODAY.,Y'
,p_link_text=>'&TRIGGERS.'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(15350642954894538)
,p_name=>'PAGES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAGES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Pages'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>140
,p_value_alignment=>'RIGHT'
,p_link_target=>'f?p=&APP_ID.:901:&SESSION.::&DEBUG.::P901_FLAG,G_DATE,P901_RESET:P,&TODAY.,Y'
,p_link_text=>'&PAGES.'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(15350726369894539)
,p_name=>'FORMS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FORMS'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Forms'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>150
,p_value_alignment=>'RIGHT'
,p_link_target=>'f?p=&APP_ID.:901:&SESSION.::&DEBUG.::P901_FLAG,G_DATE,P901_RESET:F,&TODAY.,Y'
,p_link_text=>'&FORMS.'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(54372616585354812)
,p_name=>'TODAY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TODAY'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Today'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:901:&SESSION.::&DEBUG.:RP,:P901_RESET,G_DATE:Y,&TODAY.'
,p_link_text=>'&TODAY.'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(54372719941354813)
,p_name=>'MODULES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MODULES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Modules'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>20
,p_value_alignment=>'RIGHT'
,p_link_target=>'f?p=&APP_ID.:901:&SESSION.::&DEBUG.:RP,:P901_FLAG,G_DATE,P901_RESET:M,&TODAY.,Y'
,p_link_text=>'&MODULES.'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(54372780848354814)
,p_name=>'ACTIONS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTIONS'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Actions'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>30
,p_value_alignment=>'RIGHT'
,p_link_target=>'f?p=&APP_ID.:901:&SESSION.::&DEBUG.:RP,:P901_FLAG,G_DATE,P901_RESET:A,&TODAY.,Y'
,p_link_text=>'&ACTIONS.'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(54372935842354815)
,p_name=>'DEBUGS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DEBUGS'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Debugs'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>40
,p_value_alignment=>'RIGHT'
,p_link_target=>'f?p=&APP_ID.:901:&SESSION.::&DEBUG.:RP,:P901_FLAG,G_DATE,P901_RESET:D,&TODAY.,Y'
,p_link_text=>'&DEBUGS.'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(54373039756354816)
,p_name=>'INFO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INFO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Info'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
,p_link_target=>'f?p=&APP_ID.:901:&SESSION.::&DEBUG.:RP,:P901_FLAG,G_DATE,P901_RESET:I,&TODAY.,Y'
,p_link_text=>'&INFO.'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(54373105355354817)
,p_name=>'RESULTS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RESULTS'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Results'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_link_target=>'f?p=&APP_ID.:901:&SESSION.::&DEBUG.:RP,:P901_FLAG,G_DATE,P901_RESET:R,&TODAY.,Y'
,p_link_text=>'&RESULTS.'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(54373166694354818)
,p_name=>'WARNINGS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WARNINGS'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Warnings'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_link_target=>'f?p=&APP_ID.:901:&SESSION.::&DEBUG.:RP,:P901_FLAG,G_DATE,P901_RESET:W,&TODAY.,Y'
,p_link_text=>'&WARNINGS.'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(54373307983354819)
,p_name=>'ERRORS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ERRORS'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Errors'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>80
,p_value_alignment=>'RIGHT'
,p_link_target=>'f?p=&APP_ID.:901:&SESSION.::&DEBUG.:RP,:P901_FLAG,G_DATE,P901_RESET:E,&TODAY.,Y'
,p_link_text=>'&ERRORS.'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(54373379094354820)
,p_name=>'LONGOPS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LONGOPS'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Longops'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(54373473054354821)
,p_name=>'SCHEDULERS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SCHEDULERS'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Schedulers'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(54373744849354823)
,p_name=>'LOBS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LOBS'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Lobs'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>120
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(54484323348385574)
,p_name=>'TOTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TOTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Total'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>160
,p_value_alignment=>'RIGHT'
,p_link_target=>'f?p=&APP_ID.:901:&SESSION.::&DEBUG.:RP,:G_DATE,P901_RESET:&TODAY.,Y'
,p_link_text=>'&TOTAL.'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(54484395124385575)
,p_name=>'ACTION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Action'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:900:&SESSION.::&DEBUG.:RP:P900_DELETE,P900_DELETE_OLD:&TODAY.,'
,p_link_text=>'&ACTION.'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
,p_escape_on_http_output=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(54372546010354811)
,p_internal_uid=>54372546010354811
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:SAVE'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(config) {',
'    return unified_ig_toolbar(config, '''');',
'}',
''))
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(54490058517386856)
,p_interactive_grid_id=>wwv_flow_api.id(54372546010354811)
,p_static_id=>'312290'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(54490206071386857)
,p_report_id=>wwv_flow_api.id(54490058517386856)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(16064087920648652)
,p_view_id=>wwv_flow_api.id(54490206071386857)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(15350545041894537)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(16064993881648663)
,p_view_id=>wwv_flow_api.id(54490206071386857)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(15350642954894538)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(16065878980648667)
,p_view_id=>wwv_flow_api.id(54490206071386857)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(15350726369894539)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54490689812386861)
,p_view_id=>wwv_flow_api.id(54490206071386857)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(54372616585354812)
,p_is_visible=>true
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54491165561386865)
,p_view_id=>wwv_flow_api.id(54490206071386857)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(54372719941354813)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54491660744386867)
,p_view_id=>wwv_flow_api.id(54490206071386857)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(54372780848354814)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54492229096386868)
,p_view_id=>wwv_flow_api.id(54490206071386857)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(54372935842354815)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54492676603386870)
,p_view_id=>wwv_flow_api.id(54490206071386857)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(54373039756354816)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54493157570386871)
,p_view_id=>wwv_flow_api.id(54490206071386857)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(54373105355354817)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54493669609386872)
,p_view_id=>wwv_flow_api.id(54490206071386857)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(54373166694354818)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54494183634386874)
,p_view_id=>wwv_flow_api.id(54490206071386857)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(54373307983354819)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54494712082386875)
,p_view_id=>wwv_flow_api.id(54490206071386857)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(54373379094354820)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54495188584386876)
,p_view_id=>wwv_flow_api.id(54490206071386857)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(54373473054354821)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54496231235386879)
,p_view_id=>wwv_flow_api.id(54490206071386857)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(54373744849354823)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54496736846386880)
,p_view_id=>wwv_flow_api.id(54490206071386857)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(54484323348385574)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54497169217386881)
,p_view_id=>wwv_flow_api.id(54490206071386857)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(54484395124385575)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(31330584376875804)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(71819787564897425)
,p_button_name=>'DELETE_OLD'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(63744470351014400)
,p_button_image_alt=>'Delete (7 days old)'
,p_button_position=>'RIGHT_OF_TITLE'
,p_button_redirect_url=>'f?p=&APP_ID.:900:&SESSION.::&DEBUG.:RP:P900_DELETE_OLD:Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9541307114654020)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(71819787564897425)
,p_button_name=>'SHRINK'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(63744470351014400)
,p_button_image_alt=>'Shrink'
,p_button_position=>'RIGHT_OF_TITLE'
,p_button_redirect_url=>'f?p=&APP_ID.:900:&SESSION.::&DEBUG.::P900_SHRINK:Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(9541270026654019)
,p_name=>'P900_SHRINK'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(71819787564897425)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(31330995658875805)
,p_name=>'P900_RESET'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(71819787564897425)
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(31331389291875806)
,p_name=>'P900_DELETE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(71819787564897425)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(31331737351875807)
,p_name=>'P900_DELETE_OLD'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(71819787564897425)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(31332148780875808)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DELETE'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'tree.log_module(''DELETE'', :P900_DELETE);',
'--',
'DELETE FROM logs e',
'WHERE e.created_at    >= TO_DATE(:P900_DELETE, ''YYYY-MM-DD'')',
'    AND e.created_at  <  TO_DATE(:P900_DELETE, ''YYYY-MM-DD'') + 1;',
'--',
'tree.update_timer();',
'--',
'apex.redirect();',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P900_DELETE'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(31333380832875811)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DELETE_OLD'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'tree.log_module(''DELETE_OLD'');',
'tree.purge_old(7);',
'tree.update_timer();',
'--',
'apex.redirect();',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P900_DELETE_OLD'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9541124196654018)
,p_process_sequence=>30
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SHRINK'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'tree.log_module(''SHRINK'');',
'--',
'EXECUTE IMMEDIATE ''ALTER TABLE #OWNER#.logs ENABLE ROW MOVEMENT'';',
'EXECUTE IMMEDIATE ''ALTER TABLE #OWNER#.logs SHRINK SPACE'';',
'EXECUTE IMMEDIATE ''ALTER TABLE #OWNER#.logs DISABLE ROW MOVEMENT'';',
'--',
'DBMS_STATS.GATHER_TABLE_STATS(''#OWNER#'', ''LOGS'');',
'EXECUTE IMMEDIATE ''ANALYZE TABLE #OWNER#.logs COMPUTE STATISTICS FOR TABLE'';',
'--',
'tree.update_timer();',
'--',
'apex.redirect();',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P900_SHRINK'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'Y'
);
wwv_flow_api.component_end;
end;
/
