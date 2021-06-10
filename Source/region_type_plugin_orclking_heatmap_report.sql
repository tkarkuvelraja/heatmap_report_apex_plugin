prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_200100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2020.03.31'
,p_release=>'20.1.0.00.13'
,p_default_workspace_id=>42678949574119189
,p_default_application_id=>103
,p_default_id_offset=>207553547390460401
,p_default_owner=>'FXO'
);
end;
/
 
prompt APPLICATION 103 - P-Track
--
-- Application Export:
--   Application:     103
--   Name:            P-Track
--   Date and Time:   17:46 Thursday June 10, 2021
--   Exported By:     KARKUVELRAJA.T
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     PLUGIN: 213778509658223662
--   Manifest End
--   Version:         20.1.0.00.13
--   Instance ID:     218250327993139
--

begin
  -- replace components
  wwv_flow_api.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/region_type/orclking_heatmap_report
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(213778509658223662)
,p_plugin_type=>'REGION TYPE'
,p_name=>'ORCLKING.HEATMAP.REPORT'
,p_display_name=>'Heat Map Report'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'FUNCTION render_heatmap_report (p_region              IN apex_plugin.t_region, ',
'                                p_plugin              IN apex_plugin.t_plugin, ',
'                                p_is_printer_friendly IN boolean) ',
'RETURN apex_plugin.t_region_render_result ',
'AS ',
'  subtype plugin_attr IS VARCHAR2(32767); ',
'  l_column_value_list apex_plugin_util.t_column_value_list; ',
'  l_region            VARCHAR2(100); -- To keep region static id ',
'  l_data              CLOB; -- To store column values ',
'  c                   INTEGER := 0; ',
'  l_max               NUMBER; ',
'  l_neutral           NUMBER := 2;',
'  l_class             VARCHAR2(30); ',
'  l_pct               INTEGER; ',
'  l_pct_string        VARCHAR2(30); ',
'BEGIN ',
'    -- Debug information will be logged when application''s debug mode enabled ',
'    IF apex_application.g_debug THEN ',
'      apex_plugin_util.debug_region (p_plugin => p_plugin, p_region => p_region, ',
'      p_is_printer_friendly => p_is_printer_friendly); ',
'    END IF;',
'    ',
'    -- Get region static id  ',
'    l_region := CASE ',
'                  WHEN p_region.static_id IS NOT NULL THEN p_region.static_id ',
'                  ELSE ''R'' ',
'                       ||p_region.ID ',
'                END; ',
'',
'    -- Get data from region source (sql query) ',
'    l_column_value_list := apex_plugin_util.get_data ( p_sql_statement => p_region.SOURCE, ',
'                                                       p_min_columns => 5, ',
'                                                       p_max_columns => 5, ',
'                                                       p_component_name => p_region.NAME); ',
'    sys.htp.p(''<ul class="p-HeatMap">''); ',
'    ',
'    FOR i IN 1..l_column_value_list(1).count loop ',
'        c := c + 1; ',
'        IF c = 1 THEN ',
'          -- first row has the highest value ',
'          l_max := l_column_value_list(5)(i); ',
'        END IF; ',
'',
'        IF l_column_value_list(5)(i) > l_neutral THEN ',
'          l_class := ''is-up''; ',
'        elsif l_column_value_list(5)(i) = l_neutral THEN ',
'          l_class := ''is-neutral''; ',
'        ELSE ',
'          l_class := ''is-down''; ',
'        END IF; ',
'',
'        IF l_column_value_list(5)(i) = 0 ',
'            OR l_column_value_list(5)(i) = l_max THEN ',
'          l_pct := 100; ',
'        ELSE ',
'          l_pct := greatest(round(( l_column_value_list(5)(i) / l_max ) * 100, -1), 10); ',
'        END IF; ',
'',
'        IF l_class = ''is-neutral'' THEN ',
'          l_pct_string := ''null''; ',
'        ELSE ',
'          l_pct_string := ''pct-''||l_pct; ',
'        END IF; ',
'      ',
'          sys.htp.p(''<li class="p-HeatMap-item">''); ',
'',
'          sys.htp.p('' <a href="'' ',
'                    ||l_column_value_list(4)(i) ',
'                    ||''" class="p-HeatMap-link '' ',
'                    ||l_class ',
'                    ||'' '' ',
'                    ||l_pct_string ',
'                    ||''" title="'' ',
'                    ||l_column_value_list(2)(i) ',
'                    ||''">''); ',
'',
'          sys.htp.p(''<span class="p-HeatMap-body">''); ',
'',
'          sys.htp.p(''<span class="p-HeatMap-label">'' ',
'                    ||trim(apex_escape.html(l_column_value_list(3)(i))) ',
'                    ||''</span>''); ',
'',
'          sys.htp.p(''<span class="p-HeatMap-value">'' ',
'                    ||trim(to_char(l_column_value_list(5)(i), ''999G999G999G999G990'')) ',
'                    ||''</span>''); ',
'          ',
'          sys.htp.p(''</span>''); ',
'',
'          sys.htp.p('' </a>''); ',
'',
'          sys.htp.p(''</li>''); ',
'    END loop; ',
'',
'    sys.htp.p(''</ul>''); ',
'    ',
'    -- Add required CSS file ',
'    apex_css.add_file(p_name => ''heatmap'', -- Name the CSS file, ',
'    p_directory => p_plugin.file_prefix, -- Location of the CSS file, ',
'    p_version => NULL); ',
'',
'    RETURN NULL; ',
'END render_heatmap_report; '))
,p_api_version=>2
,p_render_function=>'render_heatmap_report'
,p_standard_attributes=>'SOURCE_SQL:AJAX_ITEMS_TO_SUBMIT:NO_DATA_FOUND_MESSAGE'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
,p_about_url=>'https://github.com/tkarkuvelraja/heatmap_region_apex_plugin'
,p_files_version=>3
);
wwv_flow_api.create_plugin_std_attribute(
 p_id=>wwv_flow_api.id(213780783242258416)
,p_plugin_id=>wwv_flow_api.id(213778509658223662)
,p_name=>'SOURCE_SQL'
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2A0D0A202A204F7261636C65204150455820486561744D6170205265706F72742E0D0A202A20506C75672D696E20547970653A20526567696F6E0D0A202A2053756D6D6172793A20506C7567696E20496E20746F20616C6C6F77206F6E6C79204E756D';
wwv_flow_api.g_varchar2_table(2) := '657269632056616C75657320616E6420616C6C6F77204F6E6C79206F6E6520444F5420696E2061204E756D626572204669656C642E0D0A202A0D0A202A202D2D2D2D2D20436F6E7461637420696E666F726D6174696F6E202D2D2D2D0D0A202A0D0A202A';
wwv_flow_api.g_varchar2_table(3) := '20446576656C6F706564206279202A204576616C7561746520436F6E73756C74696E672053657276696365732C2042616E67616C6F72650D0A202A20436F6E746163743A20696E666F406576616C7561746563732E636F6D0D0A202A2057656273697465';
wwv_flow_api.g_varchar2_table(4) := '3A2068747470733A2F2F6576616C7561746563732E636F6D0D0A202A0D0A202A2040617574686F72204B61726B7576656C72616A61205468616E67616D617269617070616E202D20746B61726B7576656C72616A6140676D61696C2E636F6D0D0A202A20';
wwv_flow_api.g_varchar2_table(5) := '50726F66696C653A2068747470733A2F2F7777772E6C696E6B6564696E2E636F6D2F696E2F6B61726B7576656C72616A617468616E67616D617269617070616E0D0A202A20547769747465723A2068747470733A2F2F747769747465722E636F6D2F746B';
wwv_flow_api.g_varchar2_table(6) := '61726B7576656C72616A610D0A202A20426C6F673A20687474703A2F2F6F72636C6B696E672E626C6F6773706F742E636F6D2F0D0A202A205265666572656E63653A2068747470733A2F2F617065782E6F7261636C652E636F6D0D0A202A2F0D0A0D0A2E';
wwv_flow_api.g_varchar2_table(7) := '702D486561744D6170207B0D0A096C6973742D7374796C653A206E6F6E653B0D0A096D617267696E3A20303B0D0A0970616464696E673A203470783B0D0A096F766572666C6F773A2068696464656E3B0D0A7D0D0A0D0A2E702D486561744D61702D6974';
wwv_flow_api.g_varchar2_table(8) := '656D207B0D0A0977696474683A20373270783B0D0A096865696768743A20373270783B0D0A09626F782D73697A696E673A20626F726465722D626F783B0D0A0970616464696E673A20303B0D0A09666C6F61743A206C6566743B0D0A7D0D0A0D0A2E752D';
wwv_flow_api.g_varchar2_table(9) := '52544C202E702D486561744D61702D6974656D207B0D0A09666C6F61743A2072696768743B0D0A7D0D0A0D0A2E702D486561744D61702D6C696E6B207B0D0A0977696474683A20313030253B0D0A096865696768743A20313030253B0D0A09746578742D';
wwv_flow_api.g_varchar2_table(10) := '616C69676E3A2063656E7465723B0D0A09646973706C61793A20666C65783B0D0A09666C65782D646972656374696F6E3A20636F6C756D6E3B0D0A09616C69676E2D6974656D733A2063656E7465723B0D0A096A7573746966792D636F6E74656E743A20';
wwv_flow_api.g_varchar2_table(11) := '63656E7465723B0D0A09626F782D736861646F773A20302030203020317078207267626128302C20302C20302C202E30352920696E7365743B0D0A09636F6C6F723A20234646463B0D0A096261636B67726F756E642D636F6C6F723A20233434343B0D0A';
wwv_flow_api.g_varchar2_table(12) := '09746578742D736861646F773A20302032707820317078207267626128302C20302C20302C202E3235293B0D0A09746578742D6465636F726174696F6E3A206E6F6E653B0D0A09706F736974696F6E3A2072656C61746976653B0D0A096F766572666C6F';
wwv_flow_api.g_varchar2_table(13) := '773A2068696464656E3B0D0A7D0D0A0D0A2E702D486561744D61702D6C696E6B3A6265666F7265207B0D0A09636F6E74656E743A2027273B0D0A09706F736974696F6E3A206162736F6C7574653B0D0A096C6566743A20303B0D0A09746F703A20303B0D';
wwv_flow_api.g_varchar2_table(14) := '0A0972696768743A20303B0D0A09626F74746F6D3A20303B0D0A7D0D0A0D0A2E702D486561744D61702D6C6162656C2C0D0A2E702D486561744D61702D76616C7565207B0D0A09646973706C61793A20626C6F636B3B0D0A0977686974652D7370616365';
wwv_flow_api.g_varchar2_table(15) := '3A206E6F777261703B0D0A09706F736974696F6E3A2072656C61746976653B0D0A096C696E652D6865696768743A20323070783B0D0A09666F6E742D73697A653A20313670783B0D0A7D0D0A0D0A2E702D486561744D61702D6C696E6B3A666F6375732C';
wwv_flow_api.g_varchar2_table(16) := '0D0A2E702D486561744D61702D6C696E6B3A686F766572207B0D0A096F75746C696E653A206E6F6E653B0D0A097472616E73666F726D3A207363616C6528312E313131293B0D0A097A2D696E6465783A20313B0D0A09626F782D736861646F773A203020';
wwv_flow_api.g_varchar2_table(17) := '32707820347078207267626128302C20302C20302C202E3235290D0A7D0D0A0D0A2E702D486561744D61702D626F6479207B0D0A097472616E73666F726D3A207363616C6528302E3829207472616E736C617465592831307078293B0D0A096F70616369';
wwv_flow_api.g_varchar2_table(18) := '74793A202E373B0D0A7D0D0A0D0A2E702D486561744D61702D6C696E6B3A686F766572202E702D486561744D61702D626F64792C0D0A2E702D486561744D61702D6C696E6B3A666F637573202E702D486561744D61702D626F6479207B0D0A097472616E';
wwv_flow_api.g_varchar2_table(19) := '73666F726D3A207363616C652831293B0D0A096F7061636974793A20313B0D0A7D0D0A0D0A2E702D486561744D61702D76616C7565207B0D0A09666F6E742D7765696768743A20626F6C643B0D0A097472616E73666F726D3A207472616E736C61746559';
wwv_flow_api.g_varchar2_table(20) := '2833327078293B0D0A096F7061636974793A20303B0D0A7D0D0A0D0A2E702D486561744D61702D6C696E6B3A686F766572202E702D486561744D61702D76616C75652C0D0A2E702D486561744D61702D6C696E6B3A666F637573202E702D486561744D61';
wwv_flow_api.g_varchar2_table(21) := '702D76616C7565207B0D0A097472616E73666F726D3A207472616E736C617465592830293B0D0A096F7061636974793A20313B0D0A7D0D0A0D0A0D0A2F2A20436F6C6F7273202A2F0D0A0D0A2E702D486561744D61702D6C696E6B2E69732D75703A6265';
wwv_flow_api.g_varchar2_table(22) := '666F7265207B0D0A096261636B67726F756E642D636F6C6F723A20233634444431373B0D0A7D0D0A0D0A2E702D486561744D61702D6C696E6B2E69732D646F776E3A6265666F7265207B0D0A096261636B67726F756E642D636F6C6F723A202364353030';
wwv_flow_api.g_varchar2_table(23) := '30303B0D0A7D0D0A0D0A2E702D486561744D61702D6C696E6B2E69732D6E65757472616C3A6265666F7265207B0D0A096261636B67726F756E642D636F6C6F723A20233434343B0D0A7D0D0A0D0A0D0A2F2A2050657263656E74204D6F64696669657273';
wwv_flow_api.g_varchar2_table(24) := '202A2F0D0A0D0A2E7063742D31303A6265666F7265207B0D0A096F7061636974793A202E313B0D0A7D0D0A0D0A2E7063742D32303A6265666F7265207B0D0A096F7061636974793A202E323B0D0A7D0D0A0D0A2E7063742D33303A6265666F7265207B0D';
wwv_flow_api.g_varchar2_table(25) := '0A096F7061636974793A202E333B0D0A7D0D0A0D0A2E7063742D34303A6265666F7265207B0D0A096F7061636974793A202E343B0D0A7D0D0A0D0A2E7063742D35303A6265666F7265207B0D0A096F7061636974793A202E353B0D0A7D0D0A0D0A2E7063';
wwv_flow_api.g_varchar2_table(26) := '742D36303A6265666F7265207B0D0A096F7061636974793A202E363B0D0A7D0D0A0D0A2E7063742D37303A6265666F7265207B0D0A096F7061636974793A202E373B0D0A7D0D0A0D0A2E7063742D38303A6265666F7265207B0D0A096F7061636974793A';
wwv_flow_api.g_varchar2_table(27) := '202E383B0D0A7D0D0A0D0A2E7063742D39303A6265666F7265207B0D0A096F7061636974793A202E393B0D0A7D0D0A0D0A2E7063742D3130303A6265666F7265207B0D0A096F7061636974793A20313B0D0A7D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(208440138607012332)
,p_plugin_id=>wwv_flow_api.id(213778509658223662)
,p_file_name=>'heatmap.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
prompt --application/end_environment
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
