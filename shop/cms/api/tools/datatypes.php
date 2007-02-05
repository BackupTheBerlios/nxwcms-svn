<?
// This file is auto-generated. DO NOT CHANGE !!!
$c_datatypes["acl_management"]["GUID"] = "NUMBER";
$c_datatypes["acl_management"]["TYPE_ID"] = "NUMBER";
$c_datatypes["acl_management"]["SYSTEM"] = "NUMBER";
$c_datatypes["acl_management"]["INTERNAL"] = "NUMBER";
$c_datatypes["acl_management"]["DISABLED"] = "NUMBER";
$c_datatypes["acl_management"]["INHERIT"] = "NUMBER";
$c_datatypes["acl_management"]["OWNER_GUID"] = "NUMBER";
$c_datatypes["acl_management"]["LOCKED_BY"] = "NUMBER";
$c_datatypes["acl_management"]["LOCKED_AT"] = "DATETIME";
$c_datatypes["acl_relations"]["GUID"] = "NUMBER";
$c_datatypes["acl_relations"]["ACCESSOR_GUID"] = "NUMBER";
$c_datatypes["acl_relations"]["ROLE_ID"] = "NUMBER";
$c_datatypes["address"]["GGUID"] = "NUMBER";
$c_datatypes["address"]["NAME"] = "TEXT";
$c_datatypes["address"]["FIRSTNAME"] = "TEXT";
$c_datatypes["address"]["TITLE"] = "TEXT";
$c_datatypes["address"]["ADDRESSLETTER"] = "TEXT";
$c_datatypes["address"]["MAILADDRESS"] = "TEXT";
$c_datatypes["address"]["BIRTHDAY"] = "DATE";
$c_datatypes["address"]["COMPANY"] = "TEXT";
$c_datatypes["address"]["STREET1"] = "TEXT";
$c_datatypes["address"]["STREET2"] = "TEXT";
$c_datatypes["address"]["ZIP"] = "TEXT";
$c_datatypes["address"]["CITY"] = "TEXT";
$c_datatypes["address"]["REGION"] = "TEXT";
$c_datatypes["address"]["COUNTRY"] = "TEXT";
$c_datatypes["address"]["PHONE"] = "TEXT";
$c_datatypes["address"]["FAX"] = "TEXT";
$c_datatypes["address"]["CELLPHONE"] = "TEXT";
$c_datatypes["address"]["WEBSITE"] = "TEXT";
$c_datatypes["address"]["NOTES"] = "TEXT";
$c_datatypes["address"]["LAST_MODIFIED"] = "DATETIME";
$c_datatypes["categories"]["CATEGORY_ID"] = "NUMBER";
$c_datatypes["categories"]["CLNID"] = "NUMBER";
$c_datatypes["categories"]["CATEGORY_NAME"] = "TEXT";
$c_datatypes["categories"]["PARENT_CATEGORY_ID"] = "NUMBER";
$c_datatypes["categories"]["DELETED"] = "NUMBER";
$c_datatypes["centerstage"]["STAGE_ID"] = "NUMBER";
$c_datatypes["centerstage"]["CHID"] = "NUMBER";
$c_datatypes["centerstage"]["CH_CAT_ID"] = "NUMBER";
$c_datatypes["centerstage"]["SORT_ALGORITHM"] = "NUMBER";
$c_datatypes["centerstage"]["MAXCARD"] = "NUMBER";
$c_datatypes["centerstage"]["CLNID"] = "NUMBER";
$c_datatypes["channel_articles"]["ARTICLE_ID"] = "NUMBER";
$c_datatypes["channel_articles"]["CHID"] = "NUMBER";
$c_datatypes["channel_articles"]["CH_CAT_ID"] = "NUMBER";
$c_datatypes["channel_articles"]["CLT_ID"] = "NUMBER";
$c_datatypes["channel_articles"]["POSITION"] = "NUMBER";
$c_datatypes["channel_articles"]["TITLE"] = "TEXT";
$c_datatypes["channel_articles"]["ARTICLE_DATE"] = "DATETIME";
$c_datatypes["channel_articles"]["LAUNCH_DATE"] = "DATETIME";
$c_datatypes["channel_articles"]["EXPIRE_DATE"] = "DATETIME";
$c_datatypes["channel_articles"]["VERSION"] = "NUMBER";
$c_datatypes["channel_categories"]["CH_CAT_ID"] = "NUMBER";
$c_datatypes["channel_categories"]["CHID"] = "NUMBER";
$c_datatypes["channel_categories"]["PAGE_ID"] = "NUMBER";
$c_datatypes["channel_categories"]["NAME"] = "TEXT";
$c_datatypes["channel_cluster_templates"]["CHID"] = "NUMBER";
$c_datatypes["channel_cluster_templates"]["CLT_ID"] = "NUMBER";
$c_datatypes["channel_cluster_templates"]["POSITION"] = "NUMBER";
$c_datatypes["channels"]["CHID"] = "NUMBER";
$c_datatypes["channels"]["NAME"] = "TEXT";
$c_datatypes["cluster_content"]["CLCID"] = "NUMBER";
$c_datatypes["cluster_content"]["CLID"] = "NUMBER";
$c_datatypes["cluster_content"]["CLTI_ID"] = "NUMBER";
$c_datatypes["cluster_content"]["POSITION"] = "NUMBER";
$c_datatypes["cluster_content"]["TITLE"] = "TEXT";
$c_datatypes["cluster_content"]["FKID"] = "NUMBER";
$c_datatypes["cluster_content"]["DELETED"] = "NUMBER";
$c_datatypes["cluster_node"]["CLNID"] = "NUMBER";
$c_datatypes["cluster_node"]["CLT_ID"] = "NUMBER";
$c_datatypes["cluster_node"]["NAME"] = "TEXT";
$c_datatypes["cluster_node"]["DELETED"] = "NUMBER";
$c_datatypes["cluster_node"]["VERSION"] = "NUMBER";
$c_datatypes["cluster_template_item_types"]["CLTITYPE_ID"] = "NUMBER";
$c_datatypes["cluster_template_item_types"]["NAME"] = "TEXT";
$c_datatypes["cluster_template_item_types"]["DESCRIPTION"] = "TEXT";
$c_datatypes["cluster_template_items"]["CLTI_ID"] = "NUMBER";
$c_datatypes["cluster_template_items"]["CLT_ID"] = "NUMBER";
$c_datatypes["cluster_template_items"]["NAME"] = "TEXT";
$c_datatypes["cluster_template_items"]["POSITION"] = "NUMBER";
$c_datatypes["cluster_template_items"]["MINCARD"] = "NUMBER";
$c_datatypes["cluster_template_items"]["MAXCARD"] = "NUMBER";
$c_datatypes["cluster_template_items"]["FKID"] = "NUMBER";
$c_datatypes["cluster_template_items"]["CLTITYPE_ID"] = "NUMBER";
$c_datatypes["cluster_template_items"]["EXCLUSIVE"] = "NUMBER";
$c_datatypes["cluster_template_items"]["DELETED"] = "NUMBER";
$c_datatypes["cluster_template_items"]["VERSION"] = "NUMBER";
$c_datatypes["cluster_templates"]["CLT_ID"] = "NUMBER";
$c_datatypes["cluster_templates"]["MT_ID"] = "NUMBER";
$c_datatypes["cluster_templates"]["CATEGORY_ID"] = "NUMBER";
$c_datatypes["cluster_templates"]["NAME"] = "TEXT";
$c_datatypes["cluster_templates"]["DESCRIPTION"] = "TEXT";
$c_datatypes["cluster_templates"]["CLT_TYPE_ID"] = "NUMBER";
$c_datatypes["cluster_templates"]["TEMPLATE"] = "LONGTEXT";
$c_datatypes["cluster_templates"]["IS_SHOP_CATEGORY"] = "NUMBER";
$c_datatypes["cluster_templates"]["IS_SHOP_PRODUCT"] = "NUMBER";
$c_datatypes["cluster_templates"]["DELETED"] = "NUMBER";
$c_datatypes["cluster_templates"]["VERSION"] = "NUMBER";
$c_datatypes["cluster_variations"]["CLNID"] = "NUMBER";
$c_datatypes["cluster_variations"]["VARIATION_ID"] = "NUMBER";
$c_datatypes["cluster_variations"]["CLID"] = "NUMBER";
$c_datatypes["cluster_variations"]["DELETED"] = "NUMBER";
$c_datatypes["cluster_variations"]["LAST_CHANGED"] = "NUMBER";
$c_datatypes["cluster_variations"]["CREATED_AT"] = "NUMBER";
$c_datatypes["cluster_variations"]["LAST_USER"] = "TEXT";
$c_datatypes["cluster_variations"]["CREATE_USER"] = "TEXT";
$c_datatypes["cluster_variations"]["LAUNCHED_AT"] = "NUMBER";
$c_datatypes["cluster_variations"]["LAUNCH_USER"] = "TEXT";
$c_datatypes["compound_group_members"]["CGID"] = "NUMBER";
$c_datatypes["compound_group_members"]["CGMID"] = "NUMBER";
$c_datatypes["compound_group_members"]["POSITION"] = "NUMBER";
$c_datatypes["compound_groups"]["CGID"] = "NUMBER";
$c_datatypes["compound_groups"]["NAME"] = "TEXT";
$c_datatypes["compound_groups"]["DESCRIPTION"] = "TEXT";
$c_datatypes["compound_groups"]["SORTMODE"] = "NUMBER";
$c_datatypes["compound_groups"]["VERSION"] = "NUMBER";
$c_datatypes["content"]["CID"] = "NUMBER";
$c_datatypes["content"]["MODULE_ID"] = "NUMBER";
$c_datatypes["content"]["CATEGORY_ID"] = "NUMBER";
$c_datatypes["content"]["MT_ID"] = "NUMBER";
$c_datatypes["content"]["ACCESSKEY"] = "TEXT";
$c_datatypes["content"]["NAME"] = "TEXT";
$c_datatypes["content"]["DESCRIPTION"] = "TEXT";
$c_datatypes["content"]["KEYWORDS"] = "TEXT";
$c_datatypes["content"]["CREATED"] = "TIMESTAMP";
$c_datatypes["content"]["LAST_MOD_DATE"] = "TIMESTAMP";
$c_datatypes["content"]["LAST_MODIFIER"] = "TEXT";
$c_datatypes["content"]["DELETED"] = "NUMBER";
$c_datatypes["content"]["VERSION"] = "NUMBER";
$c_datatypes["content_variations"]["CID"] = "NUMBER";
$c_datatypes["content_variations"]["VARIATION_ID"] = "NUMBER";
$c_datatypes["content_variations"]["FK_ID"] = "NUMBER";
$c_datatypes["content_variations"]["DELETED"] = "NUMBER";
$c_datatypes["dig_clicks"]["C_NUM"] = "NUMBER";
$c_datatypes["dig_clicks"]["C_URL"] = "TEXT";
$c_datatypes["dig_clicks"]["C_VAL"] = "TEXT";
$c_datatypes["dig_clicks"]["C_TIME"] = "TIMESTAMP";
$c_datatypes["dig_engine"]["SPIDER_ID"] = "NUMBER";
$c_datatypes["dig_engine"]["KEY_ID"] = "NUMBER";
$c_datatypes["dig_engine"]["WEIGHT"] = "NUMBER";
$c_datatypes["dig_excludes"]["EX_ID"] = "NUMBER";
$c_datatypes["dig_excludes"]["EX_SITE_ID"] = "NUMBER";
$c_datatypes["dig_excludes"]["EX_PATH"] = "TEXT";
$c_datatypes["dig_includes"]["IN_ID"] = "NUMBER";
$c_datatypes["dig_includes"]["IN_SITE_ID"] = "NUMBER";
$c_datatypes["dig_includes"]["IN_PATH"] = "TEXT";
$c_datatypes["dig_keywords"]["KEY_ID"] = "NUMBER";
$c_datatypes["dig_keywords"]["TWOLETTERS"] = "TEXT";
$c_datatypes["dig_keywords"]["KEYWORD"] = "TEXT";
$c_datatypes["dig_logs"]["L_ID"] = "NUMBER";
$c_datatypes["dig_logs"]["L_INCLUDES"] = "TEXT";
$c_datatypes["dig_logs"]["L_EXCLUDES"] = "TEXT";
$c_datatypes["dig_logs"]["L_NUM"] = "NUMBER";
$c_datatypes["dig_logs"]["L_MODE"] = "TEXT";
$c_datatypes["dig_logs"]["L_TS"] = "TIMESTAMP";
$c_datatypes["dig_logs"]["L_TIME"] = "FLOAT";
$c_datatypes["dig_site_page"]["SITE_ID"] = "NUMBER";
$c_datatypes["dig_site_page"]["DAYS"] = "NUMBER";
$c_datatypes["dig_site_page"]["LINKS"] = "NUMBER";
$c_datatypes["dig_site_page"]["DEPTH"] = "NUMBER";
$c_datatypes["dig_sites"]["SITE_ID"] = "NUMBER";
$c_datatypes["dig_sites"]["SITE_URL"] = "TEXT";
$c_datatypes["dig_sites"]["UPDDATE"] = "TIMESTAMP";
$c_datatypes["dig_sites"]["USERNAME"] = "TEXT";
$c_datatypes["dig_sites"]["PASSWORD"] = "TEXT";
$c_datatypes["dig_sites"]["PORT"] = "NUMBER";
$c_datatypes["dig_sites"]["LOCKED"] = "NUMBER";
$c_datatypes["dig_sites"]["STOPPED"] = "NUMBER";
$c_datatypes["dig_spider"]["SPIDER_ID"] = "NUMBER";
$c_datatypes["dig_spider"]["FILE"] = "TEXT";
$c_datatypes["dig_spider"]["FIRST_WORDS"] = "MEDIUMTEXT";
$c_datatypes["dig_spider"]["UPDDATE"] = "TIMESTAMP";
$c_datatypes["dig_spider"]["MD5"] = "TEXT";
$c_datatypes["dig_spider"]["SITE_ID"] = "NUMBER";
$c_datatypes["dig_spider"]["PATH"] = "TEXT";
$c_datatypes["dig_spider"]["NUM_WORDS"] = "NUMBER";
$c_datatypes["dig_spider"]["LAST_MODIFIED"] = "TIMESTAMP";
$c_datatypes["dig_spider"]["FILESIZE"] = "NUMBER";
$c_datatypes["dig_tempspider"]["FILE"] = "TEXT";
$c_datatypes["dig_tempspider"]["ID"] = "NUMBER";
$c_datatypes["dig_tempspider"]["LEVEL"] = "NUMBER";
$c_datatypes["dig_tempspider"]["PATH"] = "TEXT";
$c_datatypes["dig_tempspider"]["SITE_ID"] = "NUMBER";
$c_datatypes["dig_tempspider"]["INDEXED"] = "NUMBER";
$c_datatypes["dig_tempspider"]["UPDDATE"] = "TIMESTAMP";
$c_datatypes["dig_tempspider"]["ERROR"] = "NUMBER";
$c_datatypes["groups"]["GROUP_ID"] = "NUMBER";
$c_datatypes["groups"]["GROUP_NAME"] = "TEXT";
$c_datatypes["groups"]["DESCRIPTION"] = "TEXT";
$c_datatypes["internal_resources"]["RESID"] = "TEXT";
$c_datatypes["internal_resources"]["LANGID"] = "TEXT";
$c_datatypes["internal_resources"]["VALUE"] = "TEXT";
$c_datatypes["internal_resources"]["TOOLTIP"] = "TEXT";
$c_datatypes["internal_resources_languages"]["LANGID"] = "TEXT";
$c_datatypes["internal_resources_languages"]["NAME"] = "TEXT";
$c_datatypes["internal_resources_languages"]["AGENT_LANGID"] = "TEXT";
$c_datatypes["internal_resources_languages"]["AGENT_CLASSID"] = "TEXT";
$c_datatypes["internal_resources_languages"]["AGENT_VERSION"] = "TEXT";
$c_datatypes["log"]["LOG_ID"] = "NUMBER";
$c_datatypes["log"]["CATEGORY"] = "TEXT";
$c_datatypes["log"]["MESSAGE"] = "TEXT";
$c_datatypes["log"]["USER_ID"] = "NUMBER";
$c_datatypes["log"]["TARGET1_ID"] = "NUMBER";
$c_datatypes["log"]["TARGET2_ID"] = "NUMBER";
$c_datatypes["log"]["LOG_TIME"] = "TIMESTAMP";
$c_datatypes["mailinglist"]["MAILINGLIST_ID"] = "NUMBER";
$c_datatypes["mailinglist"]["NAME"] = "TEXT";
$c_datatypes["mailinglist"]["DESCRIPTION"] = "TEXT";
$c_datatypes["mailinglist"]["FROM_EMAIL"] = "TEXT";
$c_datatypes["mailinglist"]["FROM_NAME"] = "TEXT";
$c_datatypes["mailinglist"]["CHECK_SUBSCRIPTION"] = "NUMBER";
$c_datatypes["mailinglist"]["HTML"] = "NUMBER";
$c_datatypes["messaging"]["GUID"] = "NUMBER";
$c_datatypes["messaging"]["SENDER_NAME"] = "TEXT";
$c_datatypes["messaging"]["RECIPIENT_NAME"] = "TEXT";
$c_datatypes["messaging"]["SENDER_GUID"] = "NUMBER";
$c_datatypes["messaging"]["RECIPIENT_GUID"] = "NUMBER";
$c_datatypes["messaging"]["SUBJECT"] = "TEXT";
$c_datatypes["messaging"]["BODY"] = "TEXT";
$c_datatypes["messaging"]["CREATED"] = "NUMBER";
$c_datatypes["messaging"]["VIEWED"] = "NUMBER";
$c_datatypes["messaging"]["PRIORITY"] = "NUMBER";
$c_datatypes["meta"]["MID"] = "NUMBER";
$c_datatypes["meta"]["MTI_ID"] = "NUMBER";
$c_datatypes["meta"]["CID"] = "NUMBER";
$c_datatypes["meta"]["VALUE"] = "TEXT";
$c_datatypes["meta"]["DELETED"] = "NUMBER";
$c_datatypes["meta_datatypes"]["MTYPE_ID"] = "NUMBER";
$c_datatypes["meta_datatypes"]["NAME"] = "TEXT";
$c_datatypes["meta_datatypes"]["DESCRIPTION"] = "TEXT";
$c_datatypes["meta_template_items"]["MTI_ID"] = "NUMBER";
$c_datatypes["meta_template_items"]["MT_ID"] = "NUMBER";
$c_datatypes["meta_template_items"]["NAME"] = "TEXT";
$c_datatypes["meta_template_items"]["POSITION"] = "NUMBER";
$c_datatypes["meta_template_items"]["MTYPE_ID"] = "NUMBER";
$c_datatypes["meta_template_items"]["VERSION"] = "NUMBER";
$c_datatypes["meta_templates"]["MT_ID"] = "NUMBER";
$c_datatypes["meta_templates"]["NAME"] = "TEXT";
$c_datatypes["meta_templates"]["DESCRIPTION"] = "TEXT";
$c_datatypes["meta_templates"]["INTERNAL"] = "NUMBER";
$c_datatypes["meta_templates"]["VERSION"] = "NUMBER";
$c_datatypes["module_type"]["MODULE_TYPE_ID"] = "NUMBER";
$c_datatypes["module_type"]["NAME"] = "TEXT";
$c_datatypes["modules"]["MODULE_ID"] = "NUMBER";
$c_datatypes["modules"]["MODULE_NAME"] = "TEXT";
$c_datatypes["modules"]["DESCRIPTION"] = "TEXT";
$c_datatypes["modules"]["VERSION"] = "NUMBER";
$c_datatypes["modules"]["MT_ID"] = "NUMBER";
$c_datatypes["modules"]["CLASS"] = "TEXT";
$c_datatypes["modules"]["SOURCE"] = "TEXT";
$c_datatypes["modules"]["MODULE_TYPE_ID"] = "NUMBER";
$c_datatypes["pgn_config_store"]["CLTI_ID"] = "NUMBER";
$c_datatypes["pgn_config_store"]["TEXT1"] = "TEXT";
$c_datatypes["pgn_config_store"]["TEXT2"] = "TEXT";
$c_datatypes["pgn_config_store"]["TEXT3"] = "TEXT";
$c_datatypes["pgn_config_store"]["TEXT4"] = "TEXT";
$c_datatypes["pgn_config_store"]["TEXT5"] = "TEXT";
$c_datatypes["pgn_config_store"]["TEXT6"] = "TEXT";
$c_datatypes["pgn_config_store"]["TEXT7"] = "TEXT";
$c_datatypes["pgn_config_store"]["TEXT8"] = "TEXT";
$c_datatypes["pgn_config_store"]["TEXT9"] = "TEXT";
$c_datatypes["pgn_config_store"]["TEXT10"] = "TEXT";
$c_datatypes["pgn_config_store"]["TEXT11"] = "TEXT";
$c_datatypes["pgn_config_store"]["TEXT12"] = "TEXT";
$c_datatypes["pgn_config_store"]["TEXT13"] = "TEXT";
$c_datatypes["pgn_config_store"]["TEXT14"] = "TEXT";
$c_datatypes["pgn_config_store"]["TEXT15"] = "TEXT";
$c_datatypes["pgn_config_store"]["NUMBER1"] = "NUMBER";
$c_datatypes["pgn_config_store"]["NUMBER2"] = "NUMBER";
$c_datatypes["pgn_config_store"]["NUMBER3"] = "NUMBER";
$c_datatypes["pgn_config_store"]["NUMBER4"] = "NUMBER";
$c_datatypes["pgn_config_store"]["NUMBER5"] = "NUMBER";
$c_datatypes["pgn_config_store"]["NUMBER6"] = "NUMBER";
$c_datatypes["pgn_config_store"]["NUMBER7"] = "NUMBER";
$c_datatypes["pgn_config_store"]["NUMBER8"] = "NUMBER";
$c_datatypes["pgn_config_store"]["NUMBER9"] = "NUMBER";
$c_datatypes["pgn_config_store"]["NUMBER10"] = "NUMBER";
$c_datatypes["pgn_config_store"]["NUMBER11"] = "NUMBER";
$c_datatypes["pgn_config_store"]["NUMBER12"] = "NUMBER";
$c_datatypes["pgn_config_store"]["NUMBER13"] = "NUMBER";
$c_datatypes["pgn_config_store"]["NUMBER14"] = "NUMBER";
$c_datatypes["pgn_config_store"]["NUMBER15"] = "NUMBER";
$c_datatypes["pgn_config_store"]["DATE1"] = "DATETIME";
$c_datatypes["pgn_config_store"]["DATE2"] = "DATETIME";
$c_datatypes["pgn_config_store"]["DATE3"] = "DATETIME";
$c_datatypes["pgn_config_store"]["DATE4"] = "DATETIME";
$c_datatypes["pgn_config_store"]["DATE5"] = "DATETIME";
$c_datatypes["pgn_image"]["FKID"] = "NUMBER";
$c_datatypes["pgn_image"]["FILENAME"] = "TEXT";
$c_datatypes["pgn_image"]["ALT"] = "TEXT";
$c_datatypes["pgn_image"]["WIDTH"] = "NUMBER";
$c_datatypes["pgn_image"]["HEIGHT"] = "NUMBER";
$c_datatypes["pgn_image"]["COPYRIGHT"] = "TEXT";
$c_datatypes["pgn_label"]["FKID"] = "NUMBER";
$c_datatypes["pgn_label"]["CONTENT"] = "TEXT";
$c_datatypes["pgn_link"]["FKID"] = "NUMBER";
$c_datatypes["pgn_link"]["LABEL"] = "TEXT";
$c_datatypes["pgn_link"]["EXTERNAL"] = "NUMBER";
$c_datatypes["pgn_link"]["HREF"] = "TEXT";
$c_datatypes["pgn_link"]["SPID"] = "NUMBER";
$c_datatypes["pgn_link"]["TARGET"] = "TEXT";
$c_datatypes["pgn_list"]["FKID"] = "NUMBER";
$c_datatypes["pgn_list"]["CONTENT"] = "TEXT";
$c_datatypes["pgn_mouseoverimage"]["FKID"] = "NUMBER";
$c_datatypes["pgn_mouseoverimage"]["FILENAME1"] = "TEXT";
$c_datatypes["pgn_mouseoverimage"]["FILENAME2"] = "TEXT";
$c_datatypes["pgn_mouseoverimage"]["ALT"] = "TEXT";
$c_datatypes["pgn_mouseoverimage"]["WIDTH"] = "NUMBER";
$c_datatypes["pgn_mouseoverimage"]["HEIGHT"] = "NUMBER";
$c_datatypes["pgn_mouseoverimage"]["COPYRIGHT"] = "TEXT";
$c_datatypes["pgn_text"]["FKID"] = "NUMBER";
$c_datatypes["pgn_text"]["CONTENT"] = "LONGTEXT";
$c_datatypes["pot_accesslog"]["ACCESSLOG_ID"] = "NUMBER";
$c_datatypes["pot_accesslog"]["TIMESTAMP"] = "NUMBER";
$c_datatypes["pot_accesslog"]["DOCUMENT_ID"] = "NUMBER";
$c_datatypes["pot_accesslog"]["EXIT_TARGET_ID"] = "NUMBER";
$c_datatypes["pot_accesslog"]["ENTRY_DOCUMENT"] = "NUMBER";
$c_datatypes["pot_add_data"]["ACCESSLOG_ID"] = "NUMBER";
$c_datatypes["pot_add_data"]["DATA_FIELD"] = "TEXT";
$c_datatypes["pot_add_data"]["DATA_VALUE"] = "TEXT";
$c_datatypes["pot_documents"]["DATA_ID"] = "NUMBER";
$c_datatypes["pot_documents"]["STRING"] = "TEXT";
$c_datatypes["pot_documents"]["DOCUMENT_URL"] = "TEXT";
$c_datatypes["pot_exit_targets"]["DATA_ID"] = "NUMBER";
$c_datatypes["pot_exit_targets"]["STRING"] = "TEXT";
$c_datatypes["pot_hostnames"]["DATA_ID"] = "NUMBER";
$c_datatypes["pot_hostnames"]["STRING"] = "TEXT";
$c_datatypes["pot_nxlog"]["ACCESSLOG_ID"] = "NUMBER";
$c_datatypes["pot_nxlog"]["WEEKDAY"] = "NUMBER";
$c_datatypes["pot_nxlog"]["HOUR"] = "NUMBER";
$c_datatypes["pot_nxlog"]["STARTTIME"] = "NUMBER";
$c_datatypes["pot_nxlog"]["ENDTIME"] = "NUMBER";
$c_datatypes["pot_nxlog"]["PI"] = "NUMBER";
$c_datatypes["pot_nxlog"]["DURATION"] = "NUMBER";
$c_datatypes["pot_operating_systems"]["DATA_ID"] = "NUMBER";
$c_datatypes["pot_operating_systems"]["STRING"] = "TEXT";
$c_datatypes["pot_referers"]["DATA_ID"] = "NUMBER";
$c_datatypes["pot_referers"]["STRING"] = "TEXT";
$c_datatypes["pot_search_engines"]["ACCESSLOG_ID"] = "NUMBER";
$c_datatypes["pot_search_engines"]["SEARCH_ENGINE"] = "TEXT";
$c_datatypes["pot_search_engines"]["KEYWORDS"] = "TEXT";
$c_datatypes["pot_user_agents"]["DATA_ID"] = "NUMBER";
$c_datatypes["pot_user_agents"]["STRING"] = "TEXT";
$c_datatypes["pot_visitors"]["ACCESSLOG_ID"] = "NUMBER";
$c_datatypes["pot_visitors"]["VISITOR_ID"] = "NUMBER";
$c_datatypes["pot_visitors"]["CLIENT_ID"] = "NUMBER";
$c_datatypes["pot_visitors"]["OPERATING_SYSTEM_ID"] = "NUMBER";
$c_datatypes["pot_visitors"]["USER_AGENT_ID"] = "NUMBER";
$c_datatypes["pot_visitors"]["HOST_ID"] = "NUMBER";
$c_datatypes["pot_visitors"]["REFERER_ID"] = "NUMBER";
$c_datatypes["pot_visitors"]["TIMESTAMP"] = "NUMBER";
$c_datatypes["pot_visitors"]["RETURNING_VISITOR"] = "NUMBER";
$c_datatypes["registry"]["REGID"] = "NUMBER";
$c_datatypes["registry"]["REGNAME"] = "TEXT";
$c_datatypes["registry"]["VALUE"] = "TEXT";
$c_datatypes["registry"]["PARENTREGID"] = "NUMBER";
$c_datatypes["role_sys_functions"]["ROLE_ID"] = "NUMBER";
$c_datatypes["role_sys_functions"]["FUNCTION_ID"] = "TEXT";
$c_datatypes["roles"]["ROLE_ID"] = "NUMBER";
$c_datatypes["roles"]["ROLE_NAME"] = "TEXT";
$c_datatypes["roles"]["DESCRIPTION"] = "TEXT";
$c_datatypes["sequences"]["SEQ"] = "TEXT";
$c_datatypes["sequences"]["VAL"] = "NUMBER";
$c_datatypes["sessions"]["SESSKEY"] = "TEXT";
$c_datatypes["sessions"]["EXPIRY"] = "NUMBER";
$c_datatypes["sessions"]["DATA"] = "TEXT";
$c_datatypes["shop_products"]["PRODUCT_ID"] = "NUMBER";
$c_datatypes["shop_products"]["CATEGORY_ID"] = "NUMBER";
$c_datatypes["shop_products"]["CLNID"] = "NUMBER";
$c_datatypes["shop_products"]["PRODUCT_CODE"] = "TEXT";
$c_datatypes["shop_products"]["PRICE"] = "FLOAT";
$c_datatypes["shop_products"]["QUANTITY"] = "NUMBER";
$c_datatypes["shop_products"]["TAX_ID"] = "NUMBER";
$c_datatypes["shop_products"]["MANUFACTURER_ID"] = "NUMBER";
$c_datatypes["shop_products"]["STATUS"] = "TEXT";
$c_datatypes["shop_products"]["DATE_ADDED"] = "DATETIME";
$c_datatypes["shop_products"]["DATE_MODIFIED"] = "DATETIME";
$c_datatypes["shop_products"]["PERSON_ADDED"] = "TEXT";
$c_datatypes["shop_products"]["DATE_AVAILABLE"] = "DATETIME";
$c_datatypes["shop_tax"]["TAX_ID"] = "NUMBER";
$c_datatypes["shop_tax"]["NAME"] = "TEXT";
$c_datatypes["shop_tax"]["PERCENT"] = "FLOAT";
$c_datatypes["sitemap"]["MENU_ID"] = "NUMBER";
$c_datatypes["sitemap"]["PARENT_ID"] = "NUMBER";
$c_datatypes["sitemap"]["SPM_ID"] = "NUMBER";
$c_datatypes["sitemap"]["NAME"] = "TEXT";
$c_datatypes["sitemap"]["POSITION"] = "NUMBER";
$c_datatypes["sitemap"]["IS_POPUP"] = "NUMBER";
$c_datatypes["sitemap"]["DELETED"] = "NUMBER";
$c_datatypes["sitemap"]["VERSION"] = "NUMBER";
$c_datatypes["sitemap"]["IS_DISPLAYED"] = "NUMBER";
$c_datatypes["sitemap"]["IS_CACHED"] = "NUMBER";
$c_datatypes["sitemap"]["IS_LOCKED"] = "NUMBER";
$c_datatypes["sitemap"]["CC_ON_LAUNCH"] = "TEXT";
$c_datatypes["sitepage"]["SPID"] = "NUMBER";
$c_datatypes["sitepage"]["SPM_ID"] = "NUMBER";
$c_datatypes["sitepage"]["MENU_ID"] = "NUMBER";
$c_datatypes["sitepage"]["POSITION"] = "NUMBER";
$c_datatypes["sitepage"]["CLNID"] = "NUMBER";
$c_datatypes["sitepage"]["LAUNCH_DATE"] = "DATETIME";
$c_datatypes["sitepage"]["EXPIRE_DATE"] = "DATETIME";
$c_datatypes["sitepage"]["POPUP_WINDOW"] = "NUMBER";
$c_datatypes["sitepage"]["DELETED"] = "NUMBER";
$c_datatypes["sitepage"]["VERSION"] = "NUMBER";
$c_datatypes["sitepage_master"]["SPM_ID"] = "NUMBER";
$c_datatypes["sitepage_master"]["NAME"] = "TEXT";
$c_datatypes["sitepage_master"]["DESCRIPTION"] = "TEXT";
$c_datatypes["sitepage_master"]["TEMPLATE_PATH"] = "TEXT";
$c_datatypes["sitepage_master"]["CLT_ID"] = "NUMBER";
$c_datatypes["sitepage_master"]["SPMTYPE_ID"] = "NUMBER";
$c_datatypes["sitepage_master"]["DELETED"] = "NUMBER";
$c_datatypes["sitepage_master"]["THUMBNAIL"] = "TEXT";
$c_datatypes["sitepage_master"]["VERSION"] = "NUMBER";
$c_datatypes["sitepage_names"]["SPID"] = "NUMBER";
$c_datatypes["sitepage_names"]["VARIATION_ID"] = "NUMBER";
$c_datatypes["sitepage_names"]["NAME"] = "TEXT";
$c_datatypes["sitepage_names"]["DIRECT_URL"] = "TEXT";
$c_datatypes["sitepage_names"]["HELP"] = "TEXT";
$c_datatypes["sitepage_names"]["DELETED"] = "NUMBER";
$c_datatypes["sitepage_names"]["VERSION"] = "NUMBER";
$c_datatypes["sitepage_owner"]["SPID"] = "NUMBER";
$c_datatypes["sitepage_owner"]["GROUP_ID"] = "NUMBER";
$c_datatypes["sitepage_types"]["SPMTYPE_ID"] = "NUMBER";
$c_datatypes["sitepage_types"]["NAME"] = "TEXT";
$c_datatypes["sitepage_variations"]["SPM_ID"] = "NUMBER";
$c_datatypes["sitepage_variations"]["VARIATION_ID"] = "NUMBER";
$c_datatypes["state_translation"]["IN_ID"] = "NUMBER";
$c_datatypes["state_translation"]["OUT_ID"] = "NUMBER";
$c_datatypes["state_translation"]["LEVEL"] = "NUMBER";
$c_datatypes["state_translation"]["MODIFIED"] = "TIMESTAMP";
$c_datatypes["state_translation"]["EXPIRED"] = "NUMBER";
$c_datatypes["syndication"]["IN_ID"] = "NUMBER";
$c_datatypes["syndication"]["OUT_ID"] = "NUMBER";
$c_datatypes["syndication"]["PROVIDER"] = "TEXT";
$c_datatypes["sys_functions"]["FUNCTION_ID"] = "TEXT";
$c_datatypes["sys_functions"]["PARENT_ID"] = "TEXT";
$c_datatypes["sys_functions"]["NAME"] = "TEXT";
$c_datatypes["sys_functions"]["DESCRIPTION"] = "TEXT";
$c_datatypes["temp_vars"]["NAME"] = "TEXT";
$c_datatypes["temp_vars"]["USER_ID"] = "TEXT";
$c_datatypes["temp_vars"]["VALUE"] = "TEXT";
$c_datatypes["tickets"]["SUBJECT"] = "TEXT";
$c_datatypes["tickets"]["NAME"] = "TEXT";
$c_datatypes["tickets"]["EMAIL"] = "TEXT";
$c_datatypes["tickets"]["PHONE"] = "TEXT";
$c_datatypes["tickets"]["STATUS"] = "ENUM";
$c_datatypes["tickets"]["RATE"] = "NUMBER";
$c_datatypes["tickets"]["REP"] = "NUMBER";
$c_datatypes["tickets"]["ID"] = "NUMBER";
$c_datatypes["tickets"]["CAT"] = "NUMBER";
$c_datatypes["tickets"]["PRIORITY"] = "NUMBER";
$c_datatypes["tickets"]["TRACKING"] = "TEXT";
$c_datatypes["tickets"]["INSERTTIMESTAMP"] = "DATETIME";
$c_datatypes["tickets_answers"]["ID"] = "NUMBER";
$c_datatypes["tickets_answers"]["TICKET"] = "TEXT";
$c_datatypes["tickets_answers"]["MESSAGE"] = "TEXT";
$c_datatypes["tickets_answers"]["TIMESTAMP"] = "NUMBER";
$c_datatypes["tickets_answers"]["REP"] = "NUMBER";
$c_datatypes["tickets_answers"]["REFERENCE"] = "NUMBER";
$c_datatypes["tickets_categories"]["ID"] = "NUMBER";
$c_datatypes["tickets_categories"]["NAME"] = "TEXT";
$c_datatypes["tickets_categories"]["POPHOST"] = "TEXT";
$c_datatypes["tickets_categories"]["POPUSER"] = "TEXT";
$c_datatypes["tickets_categories"]["POPPASS"] = "TEXT";
$c_datatypes["tickets_categories"]["REPLYTO"] = "TEXT";
$c_datatypes["tickets_categories"]["NOTIFY_FROM"] = "TEXT";
$c_datatypes["tickets_categories"]["NOTIFY_TO"] = "TEXT";
$c_datatypes["tickets_categories"]["NOTIFY_SUBJECT"] = "TEXT";
$c_datatypes["tickets_categories"]["NOTIFY_REPLYTO"] = "TEXT";
$c_datatypes["tickets_categories"]["NOTIFY_BODY"] = "TEXT";
$c_datatypes["tickets_categories"]["NOTIFY_HEADERS"] = "TEXT";
$c_datatypes["tickets_messages"]["ID"] = "NUMBER";
$c_datatypes["tickets_messages"]["TICKET"] = "TEXT";
$c_datatypes["tickets_messages"]["MESSAGE"] = "TEXT";
$c_datatypes["tickets_messages"]["TIMESTAMP"] = "NUMBER";
$c_datatypes["tickets_textblocks"]["BLOCK_ID"] = "NUMBER";
$c_datatypes["tickets_textblocks"]["NAME"] = "TEXT";
$c_datatypes["tickets_textblocks"]["CONTENT"] = "LONGTEXT";
$c_datatypes["user_permissions"]["GROUP_ID"] = "NUMBER";
$c_datatypes["user_permissions"]["ROLE_ID"] = "NUMBER";
$c_datatypes["user_permissions"]["USER_ID"] = "TEXT";
$c_datatypes["user_session"]["USER_ID"] = "TEXT";
$c_datatypes["user_session"]["LAST_LOGIN"] = "TIMESTAMP";
$c_datatypes["user_session"]["SESSION_ID"] = "TEXT";
$c_datatypes["user_session"]["REMOTE_ADDRESS"] = "TEXT";
$c_datatypes["users"]["USER_ID"] = "NUMBER";
$c_datatypes["users"]["USER_NAME"] = "TEXT";
$c_datatypes["users"]["FULL_NAME"] = "TEXT";
$c_datatypes["users"]["PASSWORD"] = "TEXT";
$c_datatypes["users"]["EMAIL"] = "TEXT";
$c_datatypes["users"]["ACTIVE"] = "NUMBER";
$c_datatypes["users"]["REGISTRATION_DATE"] = "TIMESTAMP";
$c_datatypes["users"]["BACKEND_LANGUAGE"] = "NUMBER";
$c_datatypes["users"]["LANGID"] = "TEXT";
$c_datatypes["users"]["USE_JAVASCRIPT"] = "NUMBER";
$c_datatypes["users"]["USE_AGENT"] = "TEXT";
$c_datatypes["var_log"]["NAME"] = "TEXT";
$c_datatypes["variations"]["VARIATION_ID"] = "NUMBER";
$c_datatypes["variations"]["NAME"] = "TEXT";
$c_datatypes["variations"]["SHORTTEXT"] = "TEXT";
$c_datatypes["variations"]["DESCRIPTION"] = "TEXT";
$c_datatypes["variations"]["DELETED"] = "NUMBER";
?>