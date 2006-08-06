CREATE TABLE `log` (
  `LOG_ID` bigint(20) NOT NULL default '0',
  `CATEGORY` varchar(16) NOT NULL default '',
  `MESSAGE` varchar(255) default NULL,
  `USER_ID` bigint(20) default NULL,
  `TARGET1_ID` bigint(20) default NULL,
  `TARGET2_ID` bigint(20) default NULL,
  `LOG_TIME` timestamp(14) NOT NULL,
  KEY `LOG_TIME` (`LOG_TIME`),
  KEY `CATEGORY` (`CATEGORY`)
) TYPE=MyISAM;
INSERT INTO `sys_functions` ( `FUNCTION_ID` , `PARENT_ID` , `NAME` , `DESCRIPTION` ) VALUES ('TESTS', 'MAINTENANCE', 'PHPUnit Tests', NULL );
INSERT INTO `sys_functions` ( `FUNCTION_ID` , `PARENT_ID` , `NAME` , `DESCRIPTION` ) VALUES ('LOGS', 'MAINTENANCE', 'Log Analysis', NULL );


