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
