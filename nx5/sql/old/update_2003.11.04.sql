ALTER TABLE `sitemap` ADD `IS_LOCKED` TINYINT DEFAULT '0' NOT NULL AFTER `IS_CACHED` ;
INSERT INTO `sys_functions` ( `FUNCTION_ID` , `PARENT_ID` , `NAME` , `DESCRIPTION` ) VALUES ('LOCK_MENU', 'SITEPAGE_PROPS', 'Lock Menu', 'Allow user to lock the menu and disallow creating further page under one node.');

