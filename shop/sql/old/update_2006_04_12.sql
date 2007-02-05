ALTER TABLE `content` ADD `ACCESSKEY` CHAR( 16 ) NULL AFTER `MT_ID` ;
ALTER TABLE `content` ADD INDEX ( `ACCESSKEY` );
ALTER TABLE `categories` ADD INDEX ( `PARENT_CATEGORY_ID` ) ;
ALTER TABLE `centerstage` ADD INDEX ( `CHID` );
ALTER TABLE `centerstage` ADD INDEX ( `CLNID` );
ALTER TABLE `channel_articles` ADD INDEX ( `CHID` ) ;
ALTER TABLE `channel_articles` ADD INDEX ( `CH_CAT_ID` ) ;
ALTER TABLE `channel_categories` ADD INDEX ( `CHID` ) ;
ALTER TABLE `content_variations` ADD INDEX ( `FK_ID` ) ;
ALTER TABLE `content_variations` ADD INDEX ( `VARIATION_ID` ) ;
ALTER TABLE `cluster_templates` ADD INDEX ( `MT_ID` ) ;
ALTER TABLE `compound_group_members` ADD INDEX ( `CGMID` ) ;
ALTER TABLE `internal_resources` ADD INDEX ( `LANGID` ) ;
ALTER TABLE `sitepage_master` ADD INDEX ( `CLT_ID` ) ;
ALTER TABLE `sitepage` ADD INDEX ( `SPM_ID` ) ;
ALTER TABLE `sitepage` ADD INDEX ( `MENU_ID` ) ;
ALTER TABLE `sitepage` ADD INDEX ( `CLNID` ) ;
ALTER TABLE `sitemap` ADD INDEX ( `PARENT_ID` ) ;
ALTER TABLE `sitemap` ADD INDEX ( `SPM_ID` ) ;
ALTER TABLE `role_sys_functions` ADD INDEX ( `FUNCTION_ID` ) ;
ALTER TABLE `state_translation` ADD INDEX ( `OUT_ID` ) ;
ALTER TABLE `state_translation` ADD INDEX ( `LEVEL` ) ;








 
 



