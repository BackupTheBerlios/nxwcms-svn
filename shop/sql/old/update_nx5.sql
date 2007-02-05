CREATE TABLE `shop_tax` (
`TAX_ID` BIGINT NOT NULL ,
`NAME` VARCHAR( 128 ) NOT NULL ,
`PERCENT` FLOAT DEFAULT '0' NOT NULL ,
PRIMARY KEY ( `TAX_ID` )
);

CREATE TABLE `tickets_answers` (
  `ID` int(7) NOT NULL auto_increment,
  `ticket` varchar(20) default NULL,
  `message` text,
  `timestamp` int(10) NOT NULL default '0',
  `rep` int(5) NOT NULL default '0',
  `reference` int(7) default NULL,
  PRIMARY KEY  (`ID`)
) AUTO_INCREMENT=1 ;

CREATE TABLE `tickets_categories` (
  `id` int(5) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL default '',
  `pophost` varchar(200) NOT NULL default '',
  `popuser` varchar(200) NOT NULL default '',
  `poppass` varchar(200) NOT NULL default '',
  `replyto` varchar(200) NOT NULL default '',
  `notify_from` varchar(200),
  `notify_to` varchar(200) ,
  `notify_subject` varchar(200) ,
  `notify_replyto` varchar(100) ,
  `notify_body` varchar(1024) ,
  `notify_headers` varchar(1024), 
 
  PRIMARY KEY  (`id`)
)  AUTO_INCREMENT=1 ;

CREATE TABLE `tickets_messages` (
  `ID` int(7) NOT NULL auto_increment,
  `ticket` varchar(20) default NULL,
  `message` text,
  `timestamp` int(10) NOT NULL default '0',
  PRIMARY KEY  (`ID`)
) AUTO_INCREMENT=1 ;


CREATE TABLE `tickets_textblocks` (
  `BLOCK_ID` bigint(20) NOT NULL default '0',
  `NAME` varchar(32) NOT NULL default '',
  `CONTENT` longtext,
  PRIMARY KEY  (`BLOCK_ID`),
  UNIQUE KEY `NAME` (`NAME`)
);

INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('CUSTOMERCARE', 'ESERVICES', 'Customer Care Access', 'Allow reading and replying to messages.');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('CUSTOMERCAREADMIN', 'ESERVICES', 'Customer Care Admin', 'Allow technical adminstration of customer care.');

-- Added 11/9/2006
CREATE TABLE `shop_products` (
`PRODUCT_ID` BIGINT NOT NULL DEFAULT '0',
`PRODUCT_CODE` VARCHAR(128) NOT NULL,
`CATEGORY_ID` BIGINT NOT NULL DEFAULT '0',
`CLNID` BIGINT NOT NULL DEFAULT '0',
`PRICE` FLOAT NULL ,
`QUANTITY` BIGINT NULL ,
`TAX_ID` BIGINT NULL ,
`MANUFACTURER_ID` BIGINT NULL ,
`STATUS` VARCHAR( 64 ) NULL ,
`DATE_ADDED` DATETIME NULL ,
`DATE_MODIFIED` DATETIME NULL ,
`PERSON_ADDED` VARCHAR( 64 ) NULL ,
`DATE_AVAILABLE` DATETIME NULL ,
PRIMARY KEY ( `PRODUCT_ID` )
) TYPE = MYISAM ;

ALTER TABLE `cluster_templates` ADD `IS_SHOP_CATEGORY` TINYINT( 1 ) NOT NULL DEFAULT '0' AFTER `TEMPLATE` ,
ADD `IS_SHOP_PRODUCT` TINYINT( 1 ) NOT NULL DEFAULT '0' AFTER `IS_SHOP_CATEGORY` ;

ALTER TABLE `categories` ADD `CLNID` BIGINT NULL AFTER `CATEGORY_ID` ;
