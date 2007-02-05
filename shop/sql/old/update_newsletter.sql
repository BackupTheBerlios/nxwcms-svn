INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('NEWSLETTER', 'ESERVICES', 'Newsletter Access', 'Allow access to general newsletter backoffice');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('NEWSLETTERADM', 'NEWSLETTER', 'Newsletter-Administrator', 'Technical Newsletter Administration');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('NEWSLETTEREDITOR', 'NEWSLETTER', 'Newsletter-Editor', 'Edit and create newsletter');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('NEWSLETTERSENDER', 'NEWSLETTER', 'Newsletter-Sender', 'Send Newsletters');

CREATE TABLE `mailinglist` (
`MAILINGLIST_ID` BIGINT NOT NULL ,
`NAME` VARCHAR( 128 ) NOT NULL ,
`DESCRIPTION` VARCHAR( 1024 ) NOT NULL ,
`FROM_EMAIL` VARCHAR( 128 ) NOT NULL ,
`FROM_NAME` VARCHAR( 128 ) NOT NULL ,
`CHECK_SUBSCRIPTION` TINYINT DEFAULT '0' NOT NULL ,
`HTML` TINYINT DEFAULT '0' NOT NULL ,
PRIMARY KEY ( `MAILINGLIST_ID` )
) TYPE = MYISAM ;