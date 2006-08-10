-- phpMyAdmin SQL Dump
-- version 2.6.3-rc1
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Aug 10, 2006 at 03:05 PM
-- Server version: 4.1.11
-- PHP Version: 5.0.4
-- 
-- Database: `demo`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `acl_management`
-- 

DROP TABLE IF EXISTS `acl_management`;
CREATE TABLE `acl_management` (
  `GUID` bigint(20) NOT NULL default '0',
  `TYPE_ID` bigint(20) default NULL,
  `SYSTEM` tinyint(4) NOT NULL default '0',
  `INTERNAL` tinyint(4) NOT NULL default '0',
  `DISABLED` tinyint(4) NOT NULL default '0',
  `INHERIT` tinyint(4) NOT NULL default '1',
  `OWNER_GUID` bigint(20) NOT NULL default '0',
  `LOCKED_BY` bigint(20) default NULL,
  `LOCKED_AT` datetime default NULL,
  PRIMARY KEY  (`GUID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `acl_management`
-- 

INSERT INTO `acl_management` (`GUID`, `TYPE_ID`, `SYSTEM`, `INTERNAL`, `DISABLED`, `INHERIT`, `OWNER_GUID`, `LOCKED_BY`, `LOCKED_AT`) VALUES (1, 1, 0, 0, 0, 0, 1, NULL, NULL);
INSERT INTO `acl_management` (`GUID`, `TYPE_ID`, `SYSTEM`, `INTERNAL`, `DISABLED`, `INHERIT`, `OWNER_GUID`, `LOCKED_BY`, `LOCKED_AT`) VALUES (0, 0, 0, 0, 0, 0, 1, NULL, NULL);

-- --------------------------------------------------------

-- 
-- Table structure for table `acl_relations`
-- 

DROP TABLE IF EXISTS `acl_relations`;
CREATE TABLE `acl_relations` (
  `GUID` bigint(20) NOT NULL default '0',
  `ACCESSOR_GUID` bigint(20) NOT NULL default '0',
  `ROLE_ID` bigint(20) NOT NULL default '0',
  KEY `ACCESSOR_GUID` (`ACCESSOR_GUID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `acl_relations`
-- 

INSERT INTO `acl_relations` (`GUID`, `ACCESSOR_GUID`, `ROLE_ID`) VALUES (1, 101587, 1);
INSERT INTO `acl_relations` (`GUID`, `ACCESSOR_GUID`, `ROLE_ID`) VALUES (0, 101587, 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `address`
-- 

DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `GGUID` bigint(20) NOT NULL default '0',
  `Name` varchar(64) collate latin1_general_ci default NULL,
  `Firstname` varchar(64) collate latin1_general_ci default NULL,
  `Title` varchar(64) collate latin1_general_ci default NULL,
  `AddressLetter` varchar(128) collate latin1_general_ci default NULL,
  `MailAddress` varchar(128) collate latin1_general_ci default NULL,
  `Birthday` date default NULL,
  `Company` varchar(128) collate latin1_general_ci default NULL,
  `Street1` varchar(128) collate latin1_general_ci default NULL,
  `Street2` varchar(128) collate latin1_general_ci default NULL,
  `ZIP` varchar(32) collate latin1_general_ci default NULL,
  `City` varchar(64) collate latin1_general_ci default NULL,
  `Region` varchar(64) collate latin1_general_ci default NULL,
  `Country` varchar(64) collate latin1_general_ci default NULL,
  `Phone` varchar(32) collate latin1_general_ci default NULL,
  `Fax` varchar(32) collate latin1_general_ci default NULL,
  `Cellphone` varchar(32) collate latin1_general_ci default NULL,
  `Website` varchar(128) collate latin1_general_ci default NULL,
  `Notes` text collate latin1_general_ci,
  `Last_Modified` datetime default NULL,
  PRIMARY KEY  (`GGUID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- Dumping data for table `address`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `categories`
-- 

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `CATEGORY_ID` bigint(20) NOT NULL default '0',
  `CATEGORY_NAME` varchar(32) NOT NULL default '',
  `PARENT_CATEGORY_ID` bigint(20) NOT NULL default '0',
  `DELETED` smallint(1) default '0',
  PRIMARY KEY  (`CATEGORY_ID`),
  UNIQUE KEY `CATEGORY_ID` (`CATEGORY_ID`),
  KEY `PARENT_CATEGORY_ID` (`PARENT_CATEGORY_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `categories`
-- 

INSERT INTO `categories` (`CATEGORY_ID`, `CATEGORY_NAME`, `PARENT_CATEGORY_ID`, `DELETED`) VALUES (100013, 'CStructures', 0, 0);
INSERT INTO `categories` (`CATEGORY_ID`, `CATEGORY_NAME`, `PARENT_CATEGORY_ID`, `DELETED`) VALUES (100012, 'CArticles', 0, 0);
INSERT INTO `categories` (`CATEGORY_ID`, `CATEGORY_NAME`, `PARENT_CATEGORY_ID`, `DELETED`) VALUES (100011, 'CPages', 0, 0);
INSERT INTO `categories` (`CATEGORY_ID`, `CATEGORY_NAME`, `PARENT_CATEGORY_ID`, `DELETED`) VALUES (100001, 'Header', 100000, 0);
INSERT INTO `categories` (`CATEGORY_ID`, `CATEGORY_NAME`, `PARENT_CATEGORY_ID`, `DELETED`) VALUES (100000, 'Layout', 0, 0);
INSERT INTO `categories` (`CATEGORY_ID`, `CATEGORY_NAME`, `PARENT_CATEGORY_ID`, `DELETED`) VALUES (100045, 'Sidebar', 100000, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `categories_info`
-- 

DROP TABLE IF EXISTS `categories_info`;
CREATE TABLE `categories_info` (
  `CATEGORY_ID` bigint(20) NOT NULL default '0',
  `VARIATION_ID` bigint(20) NOT NULL default '0',
  `IMAGE` bigint(20) NOT NULL default '0',
  `HEADER` text collate latin1_general_ci NOT NULL,
  `FOOTER` text collate latin1_general_ci NOT NULL,
  `TITLE` text collate latin1_general_ci NOT NULL,
  `SORT_ORDER` tinyint(4) NOT NULL default '0',
  `DATE_ADDED` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`CATEGORY_ID`,`VARIATION_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- Dumping data for table `categories_info`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `centerstage`
-- 

DROP TABLE IF EXISTS `centerstage`;
CREATE TABLE `centerstage` (
  `STAGE_ID` bigint(20) NOT NULL default '0',
  `CHID` bigint(20) default NULL,
  `CH_CAT_ID` bigint(20) default NULL,
  `SORT_ALGORITHM` tinyint(4) NOT NULL default '1',
  `MAXCARD` bigint(20) NOT NULL default '3',
  `CLNID` bigint(20) default NULL,
  PRIMARY KEY  (`STAGE_ID`),
  KEY `CHID` (`CHID`),
  KEY `CLNID` (`CLNID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `centerstage`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `channel_articles`
-- 

DROP TABLE IF EXISTS `channel_articles`;
CREATE TABLE `channel_articles` (
  `ARTICLE_ID` bigint(20) NOT NULL default '0',
  `CHID` bigint(20) NOT NULL default '0',
  `CH_CAT_ID` bigint(20) NOT NULL default '0',
  `CLT_ID` bigint(20) NOT NULL default '0',
  `POSITION` bigint(20) NOT NULL default '0',
  `TITLE` varchar(64) NOT NULL default '',
  `ARTICLE_DATE` datetime NOT NULL default '0000-00-00 00:00:00',
  `LAUNCH_DATE` datetime default NULL,
  `EXPIRE_DATE` datetime default NULL,
  `VERSION` bigint(20) NOT NULL default '0',
  PRIMARY KEY  (`ARTICLE_ID`),
  KEY `CHID` (`CHID`),
  KEY `CH_CAT_ID` (`CH_CAT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `channel_articles`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `channel_categories`
-- 

DROP TABLE IF EXISTS `channel_categories`;
CREATE TABLE `channel_categories` (
  `CH_CAT_ID` bigint(20) NOT NULL default '0',
  `CHID` bigint(20) NOT NULL default '0',
  `PAGE_ID` bigint(20) default NULL,
  `NAME` varchar(64) NOT NULL default '',
  PRIMARY KEY  (`CH_CAT_ID`),
  KEY `CHID` (`CHID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `channel_categories`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `channel_cluster_templates`
-- 

DROP TABLE IF EXISTS `channel_cluster_templates`;
CREATE TABLE `channel_cluster_templates` (
  `CHID` bigint(20) NOT NULL default '0',
  `CLT_ID` bigint(20) NOT NULL default '0',
  `POSITION` bigint(20) NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `channel_cluster_templates`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `channels`
-- 

DROP TABLE IF EXISTS `channels`;
CREATE TABLE `channels` (
  `CHID` bigint(20) NOT NULL default '0',
  `NAME` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`CHID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `channels`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `cluster_content`
-- 

DROP TABLE IF EXISTS `cluster_content`;
CREATE TABLE `cluster_content` (
  `CLCID` bigint(20) NOT NULL default '0',
  `CLID` bigint(20) NOT NULL default '0',
  `CLTI_ID` bigint(20) NOT NULL default '0',
  `POSITION` tinyint(4) NOT NULL default '1',
  `TITLE` varchar(32) default NULL,
  `FKID` bigint(20) NOT NULL default '0',
  `DELETED` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`CLCID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `cluster_content`
-- 

INSERT INTO `cluster_content` (`CLCID`, `CLID`, `CLTI_ID`, `POSITION`, `TITLE`, `FKID`, `DELETED`) VALUES (100022, 100021, 100015, 1, '', 0, 0);
INSERT INTO `cluster_content` (`CLCID`, `CLID`, `CLTI_ID`, `POSITION`, `TITLE`, `FKID`, `DELETED`) VALUES (100023, 100021, 100016, 1, '', 0, 0);
INSERT INTO `cluster_content` (`CLCID`, `CLID`, `CLTI_ID`, `POSITION`, `TITLE`, `FKID`, `DELETED`) VALUES (100040, 100038, 100036, 1, '', 0, 0);
INSERT INTO `cluster_content` (`CLCID`, `CLID`, `CLTI_ID`, `POSITION`, `TITLE`, `FKID`, `DELETED`) VALUES (100039, 100038, 100035, 1, '', 0, 0);
INSERT INTO `cluster_content` (`CLCID`, `CLID`, `CLTI_ID`, `POSITION`, `TITLE`, `FKID`, `DELETED`) VALUES (100057, 100056, 100051, 1, '', 0, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `cluster_node`
-- 

DROP TABLE IF EXISTS `cluster_node`;
CREATE TABLE `cluster_node` (
  `CLNID` bigint(20) NOT NULL default '0',
  `CLT_ID` bigint(20) NOT NULL default '0',
  `NAME` varchar(32) NOT NULL default '',
  `DELETED` tinyint(4) NOT NULL default '0',
  `VERSION` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`CLNID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `cluster_node`
-- 

INSERT INTO `cluster_node` (`CLNID`, `CLT_ID`, `NAME`, `DELETED`, `VERSION`) VALUES (100020, 100014, 'test', 0, 0);
INSERT INTO `cluster_node` (`CLNID`, `CLT_ID`, `NAME`, `DELETED`, `VERSION`) VALUES (100037, 100033, 'test', 0, 10);
INSERT INTO `cluster_node` (`CLNID`, `CLT_ID`, `NAME`, `DELETED`, `VERSION`) VALUES (100055, 100050, 'Forum', 0, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `cluster_template_item_types`
-- 

DROP TABLE IF EXISTS `cluster_template_item_types`;
CREATE TABLE `cluster_template_item_types` (
  `CLTITYPE_ID` tinyint(4) NOT NULL default '0',
  `NAME` varchar(32) NOT NULL default '',
  `DESCRIPTION` varchar(255) default NULL,
  PRIMARY KEY  (`CLTITYPE_ID`),
  UNIQUE KEY `CLTITYPE_ID` (`CLTITYPE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `cluster_template_item_types`
-- 

INSERT INTO `cluster_template_item_types` (`CLTITYPE_ID`, `NAME`, `DESCRIPTION`) VALUES (1, 'Static Content-Item', 'The same content for all instances of the cluster.');
INSERT INTO `cluster_template_item_types` (`CLTITYPE_ID`, `NAME`, `DESCRIPTION`) VALUES (2, 'Dynamic Content-Item', 'Different Content-Items for instances of a cluster');
INSERT INTO `cluster_template_item_types` (`CLTITYPE_ID`, `NAME`, `DESCRIPTION`) VALUES (3, 'Static Cluster-Instance', 'One Cluster-Instance for all instances of the cluster.');
INSERT INTO `cluster_template_item_types` (`CLTITYPE_ID`, `NAME`, `DESCRIPTION`) VALUES (4, 'Dynamic Cluster-Template', 'Different Cluster-Instances for each instance of an cluster.');
INSERT INTO `cluster_template_item_types` (`CLTITYPE_ID`, `NAME`, `DESCRIPTION`) VALUES (5, 'Library', 'Link to contents from the object browser');
INSERT INTO `cluster_template_item_types` (`CLTITYPE_ID`, `NAME`, `DESCRIPTION`) VALUES (6, 'Compound Cluster', 'Compounds are Clusters having an own layout.');
INSERT INTO `cluster_template_item_types` (`CLTITYPE_ID`, `NAME`, `DESCRIPTION`) VALUES (7, 'Compound Group', 'Group Compounds and select group for content');
INSERT INTO `cluster_template_item_types` (`CLTITYPE_ID`, `NAME`, `DESCRIPTION`) VALUES (8, 'Channel', 'Linking content of channels.');

-- --------------------------------------------------------

-- 
-- Table structure for table `cluster_template_items`
-- 

DROP TABLE IF EXISTS `cluster_template_items`;
CREATE TABLE `cluster_template_items` (
  `CLTI_ID` bigint(20) NOT NULL default '0',
  `CLT_ID` bigint(20) NOT NULL default '0',
  `NAME` varchar(32) NOT NULL default '',
  `POSITION` tinyint(4) NOT NULL default '0',
  `MINCARD` tinyint(4) NOT NULL default '1',
  `MAXCARD` tinyint(4) NOT NULL default '1',
  `FKID` bigint(20) NOT NULL default '0',
  `CLTITYPE_ID` tinyint(4) NOT NULL default '0',
  `EXCLUSIVE` tinyint(4) NOT NULL default '0',
  `DELETED` tinyint(4) NOT NULL default '0',
  `VERSION` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`CLTI_ID`),
  UNIQUE KEY `CLTI_ID` (`CLTI_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `cluster_template_items`
-- 

INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100015, 100014, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100016, 100014, 'Body', 2, 1, 1, 100024, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100035, 100033, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100036, 100033, 'Body', 2, 1, 1, 100024, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100051, 100050, 'URL', 1, 1, 1, 100048, 2, 0, 0, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `cluster_templates`
-- 

DROP TABLE IF EXISTS `cluster_templates`;
CREATE TABLE `cluster_templates` (
  `CLT_ID` bigint(20) NOT NULL default '0',
  `MT_ID` bigint(20) NOT NULL default '0',
  `CATEGORY_ID` bigint(20) default NULL,
  `NAME` varchar(32) NOT NULL default '',
  `DESCRIPTION` varchar(255) default NULL,
  `CLT_TYPE_ID` smallint(6) NOT NULL default '0',
  `TEMPLATE` longtext,
  `DELETED` tinyint(4) NOT NULL default '0',
  `VERSION` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`CLT_ID`),
  UNIQUE KEY `CLT_ID` (`CLT_ID`),
  KEY `MT_ID` (`MT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `cluster_templates`
-- 

INSERT INTO `cluster_templates` (`CLT_ID`, `MT_ID`, `CATEGORY_ID`, `NAME`, `DESCRIPTION`, `CLT_TYPE_ID`, `TEMPLATE`, `DELETED`, `VERSION`) VALUES (100010, 2, 0, 'CPages', '', 0, '', 1, 0);
INSERT INTO `cluster_templates` (`CLT_ID`, `MT_ID`, `CATEGORY_ID`, `NAME`, `DESCRIPTION`, `CLT_TYPE_ID`, `TEMPLATE`, `DELETED`, `VERSION`) VALUES (100014, 2, 100011, 'Text', '', 0, '', 0, 0);
INSERT INTO `cluster_templates` (`CLT_ID`, `MT_ID`, `CATEGORY_ID`, `NAME`, `DESCRIPTION`, `CLT_TYPE_ID`, `TEMPLATE`, `DELETED`, `VERSION`) VALUES (100033, 100034, 100011, 'Text', '', 0, '', 0, 10);
INSERT INTO `cluster_templates` (`CLT_ID`, `MT_ID`, `CATEGORY_ID`, `NAME`, `DESCRIPTION`, `CLT_TYPE_ID`, `TEMPLATE`, `DELETED`, `VERSION`) VALUES (100050, 2, 100011, 'URL', 'Stores an URL only', 0, '', 0, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `cluster_variations`
-- 

DROP TABLE IF EXISTS `cluster_variations`;
CREATE TABLE `cluster_variations` (
  `CLNID` bigint(20) NOT NULL default '0',
  `VARIATION_ID` bigint(20) NOT NULL default '0',
  `CLID` bigint(20) NOT NULL default '0',
  `DELETED` tinyint(4) NOT NULL default '0',
  `LAST_CHANGED` bigint(14) default NULL,
  `CREATED_AT` bigint(20) default NULL,
  `LAST_USER` varchar(32) default NULL,
  `CREATE_USER` varchar(32) default NULL,
  `LAUNCHED_AT` bigint(20) default NULL,
  `LAUNCH_USER` varchar(32) default NULL,
  PRIMARY KEY  (`CLNID`,`VARIATION_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `cluster_variations`
-- 

INSERT INTO `cluster_variations` (`CLNID`, `VARIATION_ID`, `CLID`, `DELETED`, `LAST_CHANGED`, `CREATED_AT`, `LAST_USER`, `CREATE_USER`, `LAUNCHED_AT`, `LAUNCH_USER`) VALUES (100020, 1, 100021, 0, 20060809212156, 20060809212137, 'Administrator', 'Administrator', 20060809220746, 'Administrator');
INSERT INTO `cluster_variations` (`CLNID`, `VARIATION_ID`, `CLID`, `DELETED`, `LAST_CHANGED`, `CREATED_AT`, `LAST_USER`, `CREATE_USER`, `LAUNCHED_AT`, `LAUNCH_USER`) VALUES (100037, 1, 100038, 0, 20060809212156, 20060809212137, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` (`CLNID`, `VARIATION_ID`, `CLID`, `DELETED`, `LAST_CHANGED`, `CREATED_AT`, `LAST_USER`, `CREATE_USER`, `LAUNCHED_AT`, `LAUNCH_USER`) VALUES (100055, 1, 100056, 0, 20060810135757, 20060810135606, 'Administrator', 'Administrator', NULL, NULL);

-- --------------------------------------------------------

-- 
-- Table structure for table `compound_group_members`
-- 

DROP TABLE IF EXISTS `compound_group_members`;
CREATE TABLE `compound_group_members` (
  `CGID` bigint(20) NOT NULL default '0',
  `CGMID` bigint(20) NOT NULL default '0',
  `POSITION` bigint(20) NOT NULL default '0',
  KEY `CGMID` (`CGMID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `compound_group_members`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `compound_groups`
-- 

DROP TABLE IF EXISTS `compound_groups`;
CREATE TABLE `compound_groups` (
  `CGID` bigint(20) NOT NULL default '0',
  `NAME` varchar(64) NOT NULL default '',
  `DESCRIPTION` varchar(255) default NULL,
  `SORTMODE` smallint(6) NOT NULL default '1',
  `VERSION` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`CGID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `compound_groups`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `content`
-- 

DROP TABLE IF EXISTS `content`;
CREATE TABLE `content` (
  `CID` bigint(20) NOT NULL default '0',
  `MODULE_ID` bigint(20) NOT NULL default '0',
  `CATEGORY_ID` bigint(20) NOT NULL default '0',
  `MT_ID` bigint(20) NOT NULL default '0',
  `ACCESSKEY` varchar(16) default NULL,
  `NAME` varchar(32) NOT NULL default '',
  `DESCRIPTION` varchar(255) default NULL,
  `KEYWORDS` varchar(255) default NULL,
  `CREATED` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `LAST_MOD_DATE` timestamp NOT NULL default '0000-00-00 00:00:00',
  `LAST_MODIFIER` varchar(32) default NULL,
  `DELETED` tinyint(4) NOT NULL default '0',
  `VERSION` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`CID`),
  UNIQUE KEY `CID` (`CID`),
  KEY `NAME` (`NAME`),
  KEY `ACCESSKEY` (`ACCESSKEY`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `content`
-- 

INSERT INTO `content` (`CID`, `MODULE_ID`, `CATEGORY_ID`, `MT_ID`, `ACCESSKEY`, `NAME`, `DESCRIPTION`, `KEYWORDS`, `CREATED`, `LAST_MOD_DATE`, `LAST_MODIFIER`, `DELETED`, `VERSION`) VALUES (100002, 100012, 100001, 2, 'Logo', 'Logo', '', '', '2006-08-09 21:01:40', '2006-08-09 20:58:25', 'Administrator', 0, 0);
INSERT INTO `content` (`CID`, `MODULE_ID`, `CATEGORY_ID`, `MT_ID`, `ACCESSKEY`, `NAME`, `DESCRIPTION`, `KEYWORDS`, `CREATED`, `LAST_MOD_DATE`, `LAST_MODIFIER`, `DELETED`, `VERSION`) VALUES (100008, 100007, 100001, 2, 'Banner1', 'Banner', '', '', '2006-08-09 21:08:08', '2006-08-09 21:03:52', 'Administrator', 0, 0);
INSERT INTO `content` (`CID`, `MODULE_ID`, `CATEGORY_ID`, `MT_ID`, `ACCESSKEY`, `NAME`, `DESCRIPTION`, `KEYWORDS`, `CREATED`, `LAST_MOD_DATE`, `LAST_MODIFIER`, `DELETED`, `VERSION`) VALUES (100046, 100007, 100045, 2, 'side1', 'SideAd1', '', '', '2006-08-10 12:53:57', '2006-08-10 12:50:29', 'Administrator', 0, 0);
INSERT INTO `content` (`CID`, `MODULE_ID`, `CATEGORY_ID`, `MT_ID`, `ACCESSKEY`, `NAME`, `DESCRIPTION`, `KEYWORDS`, `CREATED`, `LAST_MOD_DATE`, `LAST_MODIFIER`, `DELETED`, `VERSION`) VALUES (100048, 100007, 100045, 2, 'side2', 'side2', '', '', '2006-08-10 12:57:37', '2006-08-10 12:54:10', 'Administrator', 0, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `content_variations`
-- 

DROP TABLE IF EXISTS `content_variations`;
CREATE TABLE `content_variations` (
  `CID` bigint(20) NOT NULL default '0',
  `VARIATION_ID` bigint(20) NOT NULL default '0',
  `FK_ID` bigint(20) NOT NULL default '0',
  `DELETED` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`CID`,`VARIATION_ID`),
  KEY `FK_ID` (`FK_ID`),
  KEY `VARIATION_ID` (`VARIATION_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `content_variations`
-- 

INSERT INTO `content_variations` (`CID`, `VARIATION_ID`, `FK_ID`, `DELETED`) VALUES (100002, 1, 100003, 0);
INSERT INTO `content_variations` (`CID`, `VARIATION_ID`, `FK_ID`, `DELETED`) VALUES (100008, 1, 100009, 0);
INSERT INTO `content_variations` (`CID`, `VARIATION_ID`, `FK_ID`, `DELETED`) VALUES (100046, 1, 100047, 0);
INSERT INTO `content_variations` (`CID`, `VARIATION_ID`, `FK_ID`, `DELETED`) VALUES (100048, 1, 100049, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `dig_clicks`
-- 

DROP TABLE IF EXISTS `dig_clicks`;
CREATE TABLE `dig_clicks` (
  `c_num` mediumint(9) NOT NULL default '0',
  `c_url` varchar(255) collate latin1_general_ci NOT NULL default '',
  `c_val` varchar(255) collate latin1_general_ci NOT NULL default '',
  `c_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- Dumping data for table `dig_clicks`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `dig_engine`
-- 

DROP TABLE IF EXISTS `dig_engine`;
CREATE TABLE `dig_engine` (
  `spider_id` mediumint(9) NOT NULL default '0',
  `key_id` mediumint(9) NOT NULL default '0',
  `weight` smallint(4) NOT NULL default '0',
  KEY `key_id` (`key_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- Dumping data for table `dig_engine`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `dig_excludes`
-- 

DROP TABLE IF EXISTS `dig_excludes`;
CREATE TABLE `dig_excludes` (
  `ex_id` mediumint(11) NOT NULL auto_increment,
  `ex_site_id` mediumint(9) NOT NULL default '0',
  `ex_path` text collate latin1_general_ci NOT NULL,
  PRIMARY KEY  (`ex_id`),
  KEY `ex_site_id` (`ex_site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `dig_excludes`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `dig_includes`
-- 

DROP TABLE IF EXISTS `dig_includes`;
CREATE TABLE `dig_includes` (
  `in_id` mediumint(11) NOT NULL auto_increment,
  `in_site_id` mediumint(9) NOT NULL default '0',
  `in_path` text collate latin1_general_ci NOT NULL,
  PRIMARY KEY  (`in_id`),
  KEY `in_site_id` (`in_site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `dig_includes`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `dig_keywords`
-- 

DROP TABLE IF EXISTS `dig_keywords`;
CREATE TABLE `dig_keywords` (
  `key_id` int(9) NOT NULL auto_increment,
  `twoletters` char(2) collate latin1_general_ci NOT NULL default '',
  `keyword` varchar(64) collate latin1_general_ci NOT NULL default '',
  PRIMARY KEY  (`key_id`),
  UNIQUE KEY `keyword` (`keyword`),
  KEY `twoletters` (`twoletters`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `dig_keywords`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `dig_logs`
-- 

DROP TABLE IF EXISTS `dig_logs`;
CREATE TABLE `dig_logs` (
  `l_id` mediumint(9) NOT NULL auto_increment,
  `l_includes` varchar(255) collate latin1_general_ci NOT NULL default '',
  `l_excludes` varchar(127) collate latin1_general_ci default NULL,
  `l_num` mediumint(9) default NULL,
  `l_mode` char(1) collate latin1_general_ci default NULL,
  `l_ts` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `l_time` float NOT NULL default '0',
  PRIMARY KEY  (`l_id`),
  KEY `l_includes` (`l_includes`),
  KEY `l_excludes` (`l_excludes`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `dig_logs`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `dig_site_page`
-- 

DROP TABLE IF EXISTS `dig_site_page`;
CREATE TABLE `dig_site_page` (
  `site_id` int(4) NOT NULL default '0',
  `days` int(4) NOT NULL default '0',
  `links` int(4) NOT NULL default '5',
  `depth` int(4) NOT NULL default '5',
  PRIMARY KEY  (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- Dumping data for table `dig_site_page`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `dig_sites`
-- 

DROP TABLE IF EXISTS `dig_sites`;
CREATE TABLE `dig_sites` (
  `site_id` mediumint(9) NOT NULL auto_increment,
  `site_url` varchar(127) collate latin1_general_ci NOT NULL default '',
  `upddate` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `username` varchar(32) collate latin1_general_ci default NULL,
  `password` varchar(32) collate latin1_general_ci default NULL,
  `port` smallint(6) default NULL,
  `locked` tinyint(1) NOT NULL default '0',
  `stopped` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `dig_sites`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `dig_spider`
-- 

DROP TABLE IF EXISTS `dig_spider`;
CREATE TABLE `dig_spider` (
  `spider_id` mediumint(9) NOT NULL auto_increment,
  `file` varchar(127) collate latin1_general_ci NOT NULL default '',
  `first_words` mediumtext collate latin1_general_ci NOT NULL,
  `upddate` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `md5` varchar(50) collate latin1_general_ci default NULL,
  `site_id` mediumint(9) NOT NULL default '0',
  `path` varchar(127) collate latin1_general_ci NOT NULL default '',
  `num_words` int(11) NOT NULL default '1',
  `last_modified` timestamp NOT NULL default '0000-00-00 00:00:00',
  `filesize` int(11) NOT NULL default '0',
  PRIMARY KEY  (`spider_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `dig_spider`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `dig_tempspider`
-- 

DROP TABLE IF EXISTS `dig_tempspider`;
CREATE TABLE `dig_tempspider` (
  `file` text collate latin1_general_ci NOT NULL,
  `id` mediumint(11) NOT NULL auto_increment,
  `level` tinyint(6) NOT NULL default '0',
  `path` text collate latin1_general_ci NOT NULL,
  `site_id` mediumint(9) NOT NULL default '0',
  `indexed` tinyint(1) NOT NULL default '0',
  `upddate` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `error` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `dig_tempspider`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `groups`
-- 

DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `GROUP_ID` bigint(20) NOT NULL default '0',
  `GROUP_NAME` varchar(32) NOT NULL default '',
  `DESCRIPTION` varchar(255) default NULL,
  PRIMARY KEY  (`GROUP_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `groups`
-- 

INSERT INTO `groups` (`GROUP_ID`, `GROUP_NAME`, `DESCRIPTION`) VALUES (1, 'System', 'internal use');

-- --------------------------------------------------------

-- 
-- Table structure for table `internal_resources`
-- 

DROP TABLE IF EXISTS `internal_resources`;
CREATE TABLE `internal_resources` (
  `RESID` varchar(32) NOT NULL default '',
  `LANGID` char(3) NOT NULL default '',
  `VALUE` text,
  `TOOLTIP` text,
  PRIMARY KEY  (`RESID`,`LANGID`),
  KEY `LANGID` (`LANGID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `internal_resources`
-- 

INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCH_EXPIRED_ARTICLES', 'DE', 'Zur?ckgezogene Artikel', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_PERMISSION', 'DE', 'Rollen-Berechtigungen bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_GENERAL', 'DE', 'Allgemeine Rollen-Daten bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PREV_AVAIL', 'DE', 'Sie haben ein Objekt ausgew?hlt. Eine Vorschau wird nach dem Speichern ver?fgbar sein.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('OBJLAUNCH_SUCCESS', 'DE', 'Das Objekt wurde erfolgreich ver?ffentlicht', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOT_SPECIFIED', 'DE', 'Alle Typen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_OBJ', 'DE', 'Kein Objekt ausgew?hlt.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOT_SELECTED', 'DE', 'Kein Element ausgew?hlt.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_SYNC_CL', 'DE', 'Cluster synchronisieren', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MULTIPAGE', 'DE', 'Multipage', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MH_GLOSSARY', 'DE', 'Glossar', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LEAVE_EMPTY', 'DE', 'frei lassen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('INSTANCES_CREATED', 'DE', 'Neue Instanzen des Elements wurden erzeugt.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('KEEP_CLUSTER', 'DE', 'urspr?nglichen Cluster beibehalten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HIDE', 'DE', 'verstecken', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_VARIATION', 'DE', 'Inhalte k?nnen in verschiedenen Variationen vorliegen. Variationen k?nnen z.B. verschiedene Sprachen oder unterschiedliche Inhaltsprofile darstellen.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_SYNCCL', 'DE', 'Eine Einrichtung zur Synchronisation von Clustern, nachdem eine Cluster-Vorlage ver?ndert wurde.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_PURGE', 'DE', 'L?scht ?berfl?ssige Daten aus der Datenbank', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_DW', 'DE', 'Erzeugt eine Konfigurations-Datei f?r das N/X Dreamweaver-PlugIn. Mit Hilfe dieses Plug-Ins k?nnen N/X-Vorlagen benutzerfreundlich mit Dreamweaver entwickelt werden.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_BACKUP', 'DE', 'Die untenstehende Liste zeigt eine Liste von Sicherungen an. Sie k?nnen hier einzelne Sicherungen l?schen. Um eine Sicherung zur?ckzuspielen, m?ssen Sie sich manuell auf Ihrem Server anmelden und die Dateien selbst wiederherstellen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONFIRM_UNSAVED_CHANGES', 'DE', 'Note: Unsaved changes will be lost if you proceed. If you have already edited something, you may cancel now and save your work. Proceed ?', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GOTO_CL', 'DE', 'Gehe zu Cluster', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FIND_OBJ', 'DE', 'Finde Objekt', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXPL_SEL_SPM', 'DE', 'Bitte w?hlen Sie eine Seiten-Vorlage aus.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ENDTIME', 'DE', 'Endzeit', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXPL_SEL_CH', 'DE', 'Bitte w?hlen Sie einen Kanal.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ENDATE', 'DE', 'Enddatum', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DELETE_PAGE', 'DE', 'Seite l?schen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DISABLE', 'DE', 'Deaktivieren', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DWEXT_CONTENTFIELDINFO', 'DE', 'Inhalts-Feld-Informationen erzeugen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DWEXT_CONTENTFIELDINFO_MES', 'DE', 'erzeugt Inhalts-Feld-Informationen f?r Dreamweaver MX', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT', 'DE', 'Cluster-Vorlage', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CMPTYPE', 'DE', 'Verbund-Typ', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COPY_CLUSTER', 'DE', 'Cluster kopieren', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLEAR', 'DE', 'L?schen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHANNEL_IMPORTARTICLES', 'DE', 'Artikel importieren', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CAL_BTO', 'DE', 'Zur?ck zur ?bersicht', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AUTH_GROUP', 'DE', 'Autentifizierung', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ARTICLE_VARIATION_MISSING', 'DE', 'Variation dieses Artikels existiert noch nicht', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ARTICLE_IS_LIVE', 'DE', 'Artikel ist live', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ARTICLE_IS_EXPIRED', 'DE', 'Artikel ist abgelaufen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ADD_LINK', 'DE', 'Link hinzuf?gen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ADDITIONAL_LINK', 'DE', 'Zus?tzlicher Link', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ADDITIONAL_IMAGE', 'DE', 'Zus?tzliches Bild', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_ACCESS', 'DE', 'Eine Einrichtung zum Erstellen und Verwalten von Benutzerprofilen in N/X', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NUM_OF_ART', 'DE', 'Anzahl Artikel (-1 = unendlich)', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ORDERART', 'DE', 'Sortierung von Artikeln', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ALL', 'DE', 'Alles', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('READY_TO_USE', 'DE', 'Fertig zum Gebrauch', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CH_CAT2', 'DE', 'Kanal und Kategorie', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_CHANNEL_CAT', 'DE', 'Kanal und Kategorie ausw?hlen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_DBLINK_ADDWHERE', 'DE', 'Additional WHERE-clause', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_CONTENT', 'DE', 'Noch kein Inhalt eingegeben', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_DBLINK_SRCHVALUE', 'DE', 'Search for value', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_DBLINK_EXTERNALDB', 'DE', 'External Database', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_EXPIRE', 'DE', 'Cluster zur?ckziehen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BACK_TO_CV', 'DE', 'Zur?ck zur Cluster-?bersicht', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_LAUNCH', 'DE', 'Cluster ver?ffentlichen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHANNEL_GRABMP', 'DE', 'grab from Multipage', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AR_EXPIRE', 'DE', 'Artikel zur?ckziehen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_PGN', 'DE', 'Plug-Ins erlauben Ihnen, N/X ?her seine Standard-Funktionalit?ten hinaus zu erweitern. ?blicherweise werden Plug-Ins dazu verwendet, neue Objekttypen zu den Standard-Typen Text und Bild hinzuzuf?gen.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_TEXT_NOBREAK', 'DE', 'Ignore New-Lines', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DEL_ARTICLE', 'DE', 'M?chten Sie diesen Artikel wirklich in allen Variationen l?schen?', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AR_LAUNCH', 'DE', 'Artikel ver?ffentlichen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATE_ARTICLE', 'DE', 'Neuen Artikel im Kanal erzeugen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_PROPERTIES', 'DE', 'Eigenschaften bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_CLT', 'DE', 'Cluster-Vorlage bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NODE_ACCESS', 'DE', 'Zugriffsrechte f?r Root-Seite setzen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BACK_TO_OVERVIEW', 'DE', 'Zur?ck zur ?bersicht', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEW_ARTICLE', 'DE', 'Neuer Artikel', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DESTROY_EXCLUSIVE_CONTENT', 'DE', 'Exklusive Inhalte l?schen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT_ARTICLE', 'DE', 'Artikel bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DESTROY_TREE', 'DE', 'Baum zerst?ren', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONFIRM_DELETE', 'DE', 'M?chten Sie dieses Element wirklich l?schen?', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_ROLLOUT', 'DE', 'Rollout ist eine Einrichtung in N/X, mit der Sie Kopien eines Teils Ihrer Website erstellen und diese an anderer Stelle mit oder ohne alte Inhalte weiderverwenden k?nnen.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHANNEL', 'DE', 'Kanal', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_SELECT', 'DE', 'Cluster-Vorlagen ausw?hlen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_CHANNEL', 'DE', 'Themen-Kategorien f?r die Inhalte der von N/X erzeugten Artikel, z.B. Neuigkeiten, Personen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHANNELS', 'DE', 'Kan?le', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_FILE', 'DE', 'Datei ausw?hlen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_IMPORTING', 'DE', 'Daten werden importiert', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_IMPORTING', 'DE', 'Das System hat versucht, die Daten zu importieren. Bitten ?berpr?fen Sie den Status auf der rechten Seite.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_IMPORT_VAL', 'DE', 'Das System hat die Korrektheit der hochgeladenen XML-Datei ?berpr?ft. Im Bericht rechts finden Sie n?here Informationen.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_IMPORT_VAL', 'DE', 'Zusammenfassung des hochgeladenen XML', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_IMPORT_FILE', 'DE', 'Bitte w?hlen Sie eine XML-Datei auf Ihrer Festplatte aus, die ins System geladen werden soll<br/><br/>Das System wird eine ?berpr?fung durchf?hren und den Status auf der rechten Seite ausgeben.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_IMPORT_FILE', 'DE', 'N/X-XML-Datei ausw?hlen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('IMPORT_DATA', 'DE', 'N/X-XML-Daten importieren', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZ_IMPORT_TITLE', 'DE', 'Dieser Assisten dient dem Import von Daten in N/X, die zuvor von einer anderen N/X-Installation exportiert wurden. Um eine Ressource erneut importieren zu k?nnen, m?ssen Sie sie zun?chst l?schen.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXPL_SEL_CLUSTER', 'DE', 'Nachdem Sie eine Cluster-Vorlage gew?hlt haben, erscheint eine Liste von Clustern, aus der Sie einen ausw?hlen k?nnen.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STEP', 'DE', 'Schritt', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEXT', 'DE', 'N?chstes', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXP_REPORT', 'DE', 'Exportiere folgende Daten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXPL_EXEC_EXPORT', 'DE', 'Das System erzeugt gerade eine XML-Datei f?r den Export..<br/><br/>In ein paar Sekunden wird ein PopUp erscheinen. Klicken Sie "Speichern", um die Daten auf Ihre Festplatte zu sichern.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXEC_EXPORT', 'DE', 'Quelle wird exportiert', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PAGE_TEMPLATE', 'DE', 'Seiten Vorlage', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_SEL_EXP_RES', 'DE', 'Ressource f?r den Export ausw?hlen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_DESCR', 'DE', 'Beschreibung hinzuf?gen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_DESCR_EXPL', 'DE', 'Sie sollten eine kurze Beschreibung zu den exportierten Daten hinzuf?gen.<br><br>Jeder, der die Daten importiert, wird leichter verstehen, was er importiert.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLUSTER', 'DE', 'Cluster', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLUSTER_TEMPLATE', 'DE', 'Cluster-Vorlage', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_EXPORT_TYPE', 'DE', 'Bitte w?hlen Sie rechts den Typ von Daten aus, den Sie exportieren m?chten. Cluster speichern Inhalte. Wenn Sie Cluser exportieren, werden automatisch auch die zugeh?rigen Vorlagen exportiert. Cluster-Vorlagen sind Schemata, um Cluster zu erstellen. seiten-Vorlagen werden benutzt, um Seiten zu erstellen.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_EXPORT_TYPE', 'DE', 'W?hlen Sie den Typ f?r den Export aus.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZ_EXPORT_TITLE', 'DE', 'Der Assistent dient zum Austausch von Clusern, Cluster-Vorlagen und Seiten-Vorlagen zwischen Ihrer und anderen N/X-Installationen. Der Assistent erzeugt eine XML-Datei, die Sie auf Ihre lokale Festplatte speichern und mit anderen N/X-Nutzern austauschen k?nnen.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXPORT_DATA', 'DE', 'Inhalts- und Vorlagen-Export-Assistent', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LAST_LAUNCHED_AT', 'DE', 'Zuletzt ver?ffentlicht am', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BY', 'DE', 'nach', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LAST_MOD_AT', 'DE', 'Zuletzt ge?ndert am', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATED_AT', 'DE', 'Erstellt am', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLUSTER_INFORMATION', 'DE', 'Informationen ?ber diesen Datensatz', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TT_RSTCI', 'DE', 'Jede Seite in N/X besitzt einen Cluster. Duch Klicken auf "Cluster-Instanz zur?cksetzen" k?nnen Sie der Seite einen neuen Cluster zuweisen und den alten entfernen.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_METATEMP', 'DE', 'Eine Meta-Schablone wird benutzt, um festzulegen, welche Metadaten-Felder eine Seite erhalten soll. Wenn Sie in einer Vorlage ein neues Metadaten-Feld erstellen, wird jede auf dieser Vorlage basierende Seite dieses Feld besitzen.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_CLUSTER', 'DE', 'Es gibt keine Cluster', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_AGENT', 'DE', 'Agent verwenden', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_CLB', 'DE', 'Ein Cluster ist eine Ansammlung von statischen und dynamischen Inhalts-Platzhaltern, die entweder von einem Entwickler oder einem Editor einer Website gef?llt werden. Die Grundstruktur in N/X besteht aus Daten-Clustern', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PROMPTDELETE', 'DE', 'M?chten Sie diesen Datensatz wirklich l?schen? Diese Aktion kann nicht r?ckg?ngig gemacht werden!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATENEW', 'DE', 'Ein neues Mitglied dieser Vorlage wurde mit untenstehenden Daten erstellt.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECTONE', 'DE', 'Sie m?ssen hier eine Auswahl treffen!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SAVESUCCESS', 'DE', 'Die Daten wurden erfolgreich in die Datenbank geschrieben.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DELETESUCCESS', 'DE', 'Die unten aufgef?hrten Daten wurden erfolgreich aus der Datenbank gel?scht. Sie k?nnen nicht wiederhergestellt werden!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SAVEERROR', 'DE', 'W?hrend des Speicherns der Daten in die Datenbank ist ein Fehler aufgetreten. Bitte stellen Sie sicher, dass die Datenbank verbunden ist, oder benachrichtigen Sie Ihren Administrator.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PROCERROR', 'DE', 'W?hrend der Verarbeitung des Formulars ist ein Fehler aufgetreten. Bitte ?berpr?fen Sie die markierten Felder und lesen Sie die dortigen Anweisungen f?r weitergehende Informationen.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PWDTOOSHORT', 'DE', 'Das Passwort muss mindestens 6 Zeichen lang sein!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PWDNOTMATCH', 'DE', 'Die von Ihnen eingegebene Passw?rter stimmen nicht ?berein!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DATEFORMAT', 'DE', 'Das Datumsformat ist nicht korrekt!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WRONGDATE', 'DE', 'Das von Ihnen eingegebene Datum existiert nicht!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOTNUMBER', 'DE', 'Sie k?nnen in dieses Feld nur Zahlenwerte eingeben!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MANDATORY', 'DE', 'Dieses Feld darf nicht leer sein!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('UNIQUE', 'DE', 'Dieses Feld muss eindeutig sein!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STATUS', 'DE', 'Status:', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EMPTY', 'DE', '<leer>', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECT_CL', 'DE', 'W?hlen Sie eine Cluster-Instanz aus', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECT_CI', 'DE', 'W?hlen Sie ein Inhalts-Element aus', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONFIG', 'DE', 'konfigurieren', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONFIGURED', 'DE', 'Fertig zur Verwendung.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOTCONFIGURED', 'DE', 'Noch nicht konfiguriert.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHOOSEFILE', 'DE', 'W?hlen Sie eine Datei aus.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PREVIEW', 'DE', 'Vorschau', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_CONTENT', 'DE', 'Inhalt bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_META', 'DE', 'META-Daten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_DISPATCHER', 'DE', 'Benutzen Sie diese Schaltfl?che, um zwischen der Bearbeitung der META-Daten und der Bearbeitung der Inhalte umherzuschlaten.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACTIVE_VARIATION', 'DE', 'Aktive Variation:', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_VARIATIONS', 'DE', 'Es wurden noch keine Variationen f?r dieses Objekt definiert.<br>Bitten Sie einen Entwickler, die Konfiguration des gew?hlten Elements zu ?berpr?fen!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECT_VARIATION', 'DE', 'Variation ausw?hlen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('METATEMPLATE', 'DE', 'Zus?tzliche META-Key-Vorlage', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('POSITION', 'DE', 'Position', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DELETE', 'DE', 'L?schen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TYPE', 'DE', 'Typ', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('KEYWORDS', 'DE', 'Schl?sselw?rter', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECTOBJECT', 'DE', 'Bitte w?hlen Sie eine Klasse aus und geben Sie eine Position und einen Namen an, um das Objekt zu erzeugen.<br>Geben Sie als Position 0 an, um das neue Objekt am Anfang einzuf?gen, 999, um es am Ende anzuf?gen und jede beliebige andere Numm', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTAINERNAME', 'DE', 'Vorlage', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DOWN', 'DE', 'Ab', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('UP', 'DE', 'Auf', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT', 'DE', 'Bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DOSOMETHING', 'DE', 'Bitte w?hlen Sie aus, was Sie tun m?chten. Sie k?nnen neue Elemente einf?gen, bestehende Elemente bearbeiten oder l?schen und die Reihenfolge bestehender Elemente ver?ndern.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DESCRIPTION', 'DE', 'Beschreibung', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NAME', 'DE', 'Name', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEW', 'DE', 'Neue einf?gen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO', 'DE', 'Nein', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('YES', 'DE', 'Ja', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CANCEL', 'DE', 'Abbrechen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COMMIT', 'DE', '?bernehmen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_PROFILE', 'DE', 'Mein Profil', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ERROR_SEL_ROLE', 'DE', 'Sie m?ssen mindestens eine Rolle ausw?hlen!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ERROR_SEL_GROUP', 'DE', 'Sie m?ssen eine Gruppe ausw?hlen!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_TO_GROUP', 'DE', 'User zur Gruppe hinzuf?gen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_DESCRIPTION', 'DE', 'Beschreibung', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_FILTERMENU', 'DE', 'Rollen-Administration', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_PERMISSIONS', 'DE', 'Benutzer-Berechtigungen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('UP_INTRO', 'DE', 'Bitte w?hlen Sie die Gruppe und die Rollen in der Gruppe, die Sie diesem User zuweisen m?chten.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_LINK', 'DE', 'Rollen-Profile', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_HEAD', 'DE', 'Rollen-Profil', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_NAME', 'DE', 'Rollen-Name', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_FILTERMENU', 'DE', 'Gruppen-Administration', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_DESCRIPTIO', 'DE', 'Beschreibung', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_NAME', 'DE', 'Gruppen-Name', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_PERMGRID', 'DE', 'Berechtigungs-Gitter', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_LINK', 'DE', 'Gruppen-Profile', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_HEAD', 'DE', 'Gruppen-Profil', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_FILTERMENU', 'DE', 'Benutzer Administration', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_SETPERM', 'DE', 'Setzen Sie hier die User-Berechtigungen. Um einen User aus einer Gruppe zu entfernen, entfernen Sie einfach alle Gruppen von ihm.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_EMAIL', 'DE', 'eMail', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_ACTIVE', 'DE', 'Account freigegeben', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PASSWORD', 'DE', 'Passwort', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FULL_NAME', 'DE', 'voller Name', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_LINK', 'DE', 'Benutzer-Profile', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_NAME', 'DE', 'Benutzername', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_HEAD', 'DE', 'Benutzer-Profil', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOGIN_FAILED', 'DE', 'Die Login-Daten, die Sie eingegeben haben, konnten nicht verifiziert werden. Bitte versuchen Sie es erneut.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('V_EDIT', 'DE', 'Variationen bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_BASE', 'DE', 'Grundlegende META-Daten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_MODULE', 'DE', 'Inhaltstyp-spezifische META-Daten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VARIATIONS', 'DE', 'Verf?gbare Variationen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('V_NAME', 'DE', 'Name', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('V_SHORT', 'DE', 'K?rzel', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_ADDITIONAL', 'DE', 'Zus?tzliche META-Daten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_DELETE', 'DE', 'M?chten Sie diesen Teil der Meta-Vorlage wirklich l?schen? Alle Informationen, die im CMS in irgend ein mit diesem Teil verkn?pften META-Eingabefeld eingegeben wurden, werden gel?scht. Die Daten k?nnen anschliessend nicht wiederhe', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_SCHEME', 'DE', 'Meta-Vorlagen-Schema bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_PROPERTIES', 'DE', 'Meta-Vorlagen-Eigenschaften bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('METATEMPLATES', 'DE', 'Meta-Daten-Vorlagen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_PARENT', 'DE', '?bergeordneter Ordner', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_DELFOLDER', 'DE', 'Ordner und alle untergeordneten Objekte l?schen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_MOVEOBJECTS', 'DE', 'Alle Objekte zur n?chst h?heren Ebene verschieben', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_FOLDERNOTEMPTY', 'DE', 'Der Ordner ist nicht leer, Sie k?nnen ihn also nicht l?schen! Bitte ?berpr?fen Sie alle Objekte und Cluster!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_DELFOLDERMES', 'DE', 'Sie sind im Begriff einen Ordner zu l?schen. Bitte w?hlen Sie eine Aktion aus.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_DELETEFOLDER', 'DE', 'Ordner l?schen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_FOLDERNAME', 'DE', 'Ordner-Name', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_EDITFOLDER', 'DE', 'Ordner-Eigenschaften bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_TEXT', 'DE', 'Text', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_ALT', 'DE', 'ALT-Tag', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_COPYRIGHT', 'DE', 'Copyright', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_BROWSE', 'DE', 'Objekte', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_HOME', 'DE', 'Start', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_NEWFOLDER', 'DE', 'Neuer Ordner', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_PREVIEW', 'DE', 'Vorschau von', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_EDIT', 'DE', 'Objekt bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_DEL', 'DE', 'Objekt l?schen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_DELMES', 'DE', 'Sie sind im Begriff ein Objekt zu l?schen.<b>Beachten Sie dass hierbei alle Variationen und META-DATEN gel?scht werden!</b>', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_PROPERTIES', 'DE', 'Objekt-Eigenschaften', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_NAME', 'DE', 'Objekt-Name', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_NEW', 'DE', 'Neues Objekt', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_UNINSTALLDELE', 'DE', 'Modul entfernen,<br> Alle zugeh?rigen Inhalte l?schen.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_UNINSTALLMES', 'DE', 'Sie sind im Begriff, ein Modul zu entfernen. Das Entfernen eines Moduls l?scht nicht nur den Inhalts-Typ sondern l?scht auch jedes einzelne Objekt, das in der Datenbank gespeichert ist. Die Deinstallation des Moduls wird alle(!) Daten dieses Mod', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_UNINSTALL', 'DE', 'PlugIn entfernen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_INSTALL', 'DE', 'PlugIn installieren', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_TITLE', 'DE', 'PlugIns', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_NEWERINSTALLE', 'DE', 'Eine neuere Version des PlugIns ist bereits installiert!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_ALREADYINSTAL', 'DE', 'Das PlugIn ist bereits installiert!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_ERROR', 'DE', 'W?hrend der Installation des PlugIns ist ein Fehler aufgetreten!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_UPGRADED', 'DE', 'Das PlugIn wurde erfolgreich aktualisiert!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_INSTALLED', 'DE', 'Das PlugIn wurde erfolgreich installiert!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLASS_WRONG', 'DE', 'Die von Ihnen angegebene Datei hat keine g?ltige Klassen-Signatur!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_FILEWRONG', 'DE', 'Der von Ihnen eingegebene Dateiname konnte auf dem Server nicht gefunden werden!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_CHOOSE', 'DE', 'PlugIn: ? /plugin/', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_MINCARD', 'DE', 'minimale Anzahl Instanzen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_MAXCARD', 'DE', 'maximale Anzahl Instanzen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LINKED', 'DE', 'Verkn?pft mit', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_INSTALLDESC', 'DE', 'Bitte stellen Sie sicher, dass Sie alle ben?tigten Dateien ins Verzeichnis kopiert haben, bevor Sie fortfahren. Geben Sie in das untenstehende Eingabefeld den korrekten Pfad zum PlugIn ein. Das System wird das PlugIn dann automatisch installieren.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_SCHEME', 'DE', 'Cluster-Vorlagen-Schema bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLTI_DELETE', 'DE', 'M?chten Sie dieses Element wirklich l?schen? S?mtliche Instanzen dieses Elements werden ebenfalls gel?scht!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_DELMES', 'DE', 'Sie sind im Begriff eine Cluster-Vorlage zu l?schen. Dies wird den Verlust aller(!) Ihnhalte zur Folge haben, die mit dieser Cluster-Vorlage erstellt wurden. Sind Sie sicher, dass Sie forfahren m?chten?', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_DELETE', 'DE', 'Cluster-Vorlage l?schen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_NAME', 'DE', 'Cluster-Vorlagen-Name', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_PROPERTIES', 'DE', 'Cluster-Vorlagen-Eigenschaften', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_BROWSE', 'DE', 'Cluster-Vorlagen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_NEW', 'DE', 'Neue Cluster-Vorlage', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_PGN', 'DE', 'Plugin-Kontrolle', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_PURGE', 'DE', 'Datenbank bereinigen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_VAR', 'DE', 'Variationen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_UMAN', 'DE', 'Benutzer-Verwaltung', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_CLTB', 'DE', 'Cluster-Vorlagen-Browser', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_CLB', 'DE', 'Cluster-Browser', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_LOGOUT', 'DE', 'Abmelden', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_MYPROFILE', 'DE', 'Mein Profil', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_MYPRT', 'DE', 'Meine Portale', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_PRTMAN', 'DE', 'Portal-Manager', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_ES', 'DE', 'Site Erkunden', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_SPM', 'DE', 'Sitepage-Master', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_INSTALLPLUGIN', 'DE', 'PlugIns', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECTEDOBJECT', 'DE', 'Derzeit ausgew?hltes Inhalts-Element', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECTEDINSTANCE', 'DE', 'Ausgew?hlte Cluster-Instanz', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_META', 'DE', 'Meta-Vorlagen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_BROWSER', 'DE', 'Objekt-Browser', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCH', 'DE', 'Suche starten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCHIN', 'DE', 'Suchen nach', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCHRESULTS', 'DE', 'Such-Ergebnisse, bitte treffen Sie Ihre Auswahl', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTENTTYPE', 'DE', 'Inhalts-Typ', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTENTITEM', 'DE', 'Inhalts-Element', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FOLDER', 'DE', 'Ordner', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SR_SELECTCLI', 'DE', 'Bitte w?hlen Sie eine Cluster-Vorlage. Anschliessend k?nnen Sie die zu verwendende Instanz der Vorlage ausw?hlen.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SR_SELECTCI', 'DE', 'Sie k?nnen hier nach einem beliebigen Inhalts-Element suchen. Wenn Sie ein Inhalts-Element selektieren m?chten, w?hlen Sie es aus und klicken Sie die Aktualisieren-Schaltfl?che! Wenn sie neuen Inhalt mit diesem Feld verbinden m?ch', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI', 'DE', 'Cluster-Instanz:', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_NOTDELETED', 'DE', 'Diese Insatanz kann nicht gel?scht werden!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_DELETED', 'DE', 'Die Instanz wurde gel?scht!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_DELETEMES', 'DE', 'M?chten Sie diese Instanz wirklich l?schen? Sie kann anschliessend nicht wiederhergestellt werden!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_DELETE', 'DE', 'Cluster-Mitglied l?schen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_EDIT', 'DE', 'Cluster-Mitglied bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TITLE', 'DE', 'Titel', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_NOTITLE', 'DE', 'Noch kein Titel angegeben', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_BROWSER', 'MND', '??????????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_OWNER', 'MND', '???Master', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_CRSUCCEEDED', 'MND', '???????????????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_MYPORTAL', 'MND', '?????????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_EDIT', 'MND', '????????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_BROWSE', 'MND', '??????????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_NEWPAGE', 'MND', '?????????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_NEWINSTANCE', 'MND', '??????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_IPROPERTIES', 'MND', '??????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_PROPERTIES', 'MND', '?????????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_DELMES', 'MND', '??????????????????????????????????????!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_DELETE', 'MND', '????????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_PDELMES', 'MND', '????????????????????????????????!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_PDELETE', 'MND', '?????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_CONFIGURE', 'MND', '??????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_CONFDESC', 'MND', '???????????????????????????????????????????????????????Âµ???????????????????Ã´??', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_LINK', 'MND', '?????????????????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_CLNEW', 'MND', '?????Âµ??????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_EDIT', 'MND', '???????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUPROPS', 'MND', '??????????????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUNAME', 'MND', '?????????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUHELP', 'MND', '????????????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_LAUNCHDATE', 'MND', '??...???', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_EXPIREDATE', 'MND', '??...??', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_LAUNCHDATES', 'MND', '?????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_PREVIEW', 'MND', '?????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_LAUNCH', 'MND', '??????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_EXPIRE', 'MND', '????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOSPTITLE', 'MND', '???????????????????????????!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM', 'MND', '??????Master', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_EDIT', 'MND', '????????Master', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_META', 'MND', 'META-Key??', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_VARIATIONS', 'MND', '??????????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_TYPE', 'MND', '??????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_CLUSTER', 'MND', '????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_PATH', 'MND', '???Â·??', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_BROWSE', 'MND', '?????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_NEW', 'MND', '?????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_PROPERTIES', 'MND', '???????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_DEL', 'MND', '??????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_DELMES', 'MND', '?????????????????????.??????????????!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_EDIT', 'MND', '???????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_CREATEINSTANC', 'MND', '?????????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_CREATEINSMES', 'MND', '??????????????????????????????. ???????????????????????????????????????????????????Creat???.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_NOTITLE', 'MND', '??????????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TITLE', 'MND', '???', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_EDIT', 'MND', '????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_DELETE', 'MND', '?????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_DELETEMES', 'MND', '???????????????????. ?????????!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_DELETED', 'MND', '??????????????!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_NOTDELETED', 'MND', '???????????????!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI', 'MND', '??????:', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SR_SELECTCI', 'MND', '????????????????????????.?????????????????????, ????????????Â²?????Update???! ???????????????????????????, create the content in the Object Browser first.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SR_SELECTCLI', 'MND', '?????????????. ???????????????????????????.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FOLDER', 'MND', '????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTENTTYPE', 'MND', '???????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTENTITEM', 'MND', '???????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCH', 'MND', '???????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCHIN', 'MND', '????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCHRESULTS', 'MND', '???????????????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECTEDOBJECT', 'MND', '???????????????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECTEDINSTANCE', 'MND', '????????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_META', 'MND', 'Meta??', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_BROWSER', 'MND', '?????????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_INSTALLPLUGIN', 'MND', '????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_ES', 'MND', '?????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_SPM', 'MND', '??????Master', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_PRTMAN', 'MND', '?????????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_MYPRT', 'MND', '??????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_MYPROFILE', 'MND', '?????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_LOGOUT', 'MND', '???', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_CLB', 'MND', '????????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_CLTB', 'MND', '???????????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_UMAN', 'MND', '?Ã»????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_VAR', 'MND', '????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_PURGE', 'MND', '????????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_PGN', 'MND', '???????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_NEW', 'MND', '?Â´???', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_BROWSE', 'MND', '????????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_NAME', 'MND', '????????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_PROPERTIES', 'MND', '????????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_DELETE', 'MND', '???????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_DELMES', 'MND', '??????????????????. ???????????????????????????(!)??????. ?????????????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLTI_DELETE', 'MND', '???????????????????. ?????????????????????!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_SCHEME', 'MND', '?????????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_MINCARD', 'MND', '??????????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_MAXCARD', 'MND', '??????????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LINKED', 'MND', '??????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_INSTALLDESC', 'MND', '???????????????????????????????????????????????. ?????????????????????????????Â·??. ????????????????.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_CHOOSE', 'MND', '????: &nbsp; /plugin/', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_FILEWRONG', 'MND', '???????????????????????????!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLASS_WRONG', 'MND', '??????????Ã»?????????????!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_INSTALLED', 'MND', '??????????!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_UPGRADED', 'MND', '???????????!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_ERROR', 'MND', '?????????????!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_ALREADYINSTAL', 'MND', '??????????!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_NEWERINSTALLE', 'MND', '???????????????????Â°?!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_TITLE', 'MND', '????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_INSTALL', 'MND', '???????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_UNINSTALL', 'MND', '??????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_UNINSTALLMES', 'MND', '????????????????. ?????????????????????????????????????????????????Ã¿?????????. ?????????????????????????(!)????!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_UNINSTALLDELE', 'MND', '??????,<br> ???????????????.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_NEW', 'MND', '????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_NAME', 'MND', '??????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_PROPERTIES', 'MND', '??????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_DELMES', 'MND', '????????????????. <b>???????????????META-DATA!</b>', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_DEL', 'MND', '?????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_EDIT', 'MND', '????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_PREVIEW', 'MND', '???', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_TEXT', 'MND', '???', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_ALT', 'MND', 'ALT-Tag', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_COPYRIGHT', 'MND', '???', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_BROWSE', 'MND', '??????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_HOME', 'MND', '???', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_NEWFOLDER', 'MND', '??????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_EDITFOLDER', 'MND', '??????????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_FOLDERNAME', 'MND', '???????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_DELETEFOLDER', 'MND', '???????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_DELFOLDERMES', 'MND', '??????????????????.  ????????????.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_FOLDERNOTEMPTY', 'MND', '????????. ???????????????! ?????????????????!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_DELFOLDER', 'MND', '??????????????????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_MOVEOBJECTS', 'MND', '??????????????????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_PARENT', 'MND', '??????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('METATEMPLATES', 'MND', 'Meta??????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_PROPERTIES', 'MND', '??Meta??????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_SCHEME', 'MND', '??Meta?????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_DELETE', 'MND', '????????????meta?????????????? ????????????????????CMS META??????????????????????. ???????????!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_ADDITIONAL', 'MND', '?????META???', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_BASE', 'MND', '??????META???', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_MODULE', 'MND', '?????????????META???', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VARIATIONS', 'MND', '???Ãµ????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('V_NAME', 'MND', '???', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('V_SHORT', 'MND', 'Short-Tag', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('V_EDIT', 'MND', '??????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOGIN_FAILED', 'MND', '?????????Â¼???????????! ????????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_HEAD', 'MND', '?Ã»????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_LINK', 'MND', '?Ã»????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_NAME', 'MND', '?Ã»???', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FULL_NAME', 'MND', '???', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PASSWORD', 'MND', '???', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_EMAIL', 'MND', 'eMail', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_ACTIVE', 'MND', '??????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_FILTERMENU', 'MND', '?Ã»????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_SETPERM', 'MND', '???????????Ã»????. ??????????????Ã»?, ??????????????????????.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_PERMGRID', 'MND', '???', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_LINK', 'MND', '???', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_HEAD', 'MND', '???', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_NAME', 'MND', '????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_DESCRIPTIO', 'MND', '????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_FILTERMENU', 'MND', '?????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_LINK', 'MND', '??????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_HEAD', 'MND', '??????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_NAME', 'MND', '?????e', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_DESCRIPTION', 'MND', '????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_FILTERMENU', 'MND', '??????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_PERMISSIONS', 'MND', '?Ã»???', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('UP_INTRO', 'MND', '????????????Ã»??????????????.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_TO_GROUP', 'MND', '?????Ã»??????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ERROR_SEL_GROUP', 'MND', '?????????????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ERROR_SEL_ROLE', 'MND', '???????????????????!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_PROFILE', 'MND', '?????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COMMIT', 'MND', '??', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CANCEL', 'MND', '???', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('YES', 'MND', '?', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO', 'MND', '??', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEW', 'MND', '?????Âµ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NAME', 'MND', '???', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DESCRIPTION', 'MND', '????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DOSOMETHING', 'MND', '????????????????. ????????????, ?????, ?????????????????.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT', 'MND', '??', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('UP', 'MND', '?', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DOWN', 'MND', '?', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTAINERNAME', 'MND', '??', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECTOBJECT', 'MND', '?????????????????????????????????????????.<br>??????Ã£??????????????? 0 ??????????999 ????????????????????.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('POSITION', 'MND', '??', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DELETE', 'MND', '???', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TYPE', 'MND', '???', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('KEYWORDS', 'MND', '????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('METATEMPLATE', 'MND', '?????META-Key??', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECT_VARIATION', 'MND', '???????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACTIVE_VARIATION', 'MND', '?????????:', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_VARIATIONS', 'MND', '??????Ã»?????????!<br> ?????????????????????????????!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_CONTENT', 'MND', '?????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_META', 'MND', '??META???', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_DISPATCHER', 'MND', '?????????????META??????????????????.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PREVIEW', 'MND', '???', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHOOSEFILE', 'MND', '?????????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONFIGURED', 'MND', '??????????.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOTCONFIGURED', 'MND', '?????.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONFIG', 'MND', '???', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECT_CI', 'MND', '?????????????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECT_CL', 'MND', '???????????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EMPTY', 'MND', '&lt;??&gt;', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STATUS', 'MND', '??:', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('UNIQUE', 'MND', '????????????????!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MANDATORY', 'MND', '?????????????!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOTNUMBER', 'MND', '???????????????????????????!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WRONGDATE', 'MND', '?????????????????!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DATEFORMAT', 'MND', '??????????!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PWDNOTMATCH', 'MND', '??????????????!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PWDTOOSHORT', 'MND', '????????????????6?????!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PROCERROR', 'MND', '??????????????. ???????????????????????????Ã½?????????.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SAVEERROR', 'MND', '??????????????????????. ?????????????????????????????.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SAVESUCCESS', 'MND', '?????????????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DELETESUCCESS', 'MND', '?????????????????????????. ??????????!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECTONE', 'MND', '??????????????????????!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATENEW', 'MND', '????????????????Â³??. ?????????????.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PROMPTDELETE', 'MND', '?????????????????????? ???????????????!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RESET', 'MND', '???Ã±?', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BACK', 'MND', '??', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATE', 'MND', '???????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ERROR', 'MND', '????????????????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE', 'MND', '????????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_MES', 'MND', '????????????????????.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_VAR', 'MND', '????????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_CONTENT', 'MND', '???????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VAR_SUCCEEDED', 'MND', ' ???!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_FOLDER', 'MND', '????????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_CLUSTER', 'MND', '?????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_META', 'MND', '????Meta', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_CLT', 'MND', '????????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_PAGES', 'MND', '????????????Masters', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_EXPIRED', 'MND', '??????????', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_BROWSER', 'IT', 'Esplora il portale', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_OWNER', 'IT', 'Proprietario della pagina', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_CRSUCCEEDED', 'IT', 'La creazione della nuova pagina del portale ? avvenuta con successo!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_MYPORTAL', 'IT', 'Mio Portale', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_EDIT', 'IT', 'Edita la pagine dal portale', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_BROWSE', 'IT', 'Esplora la mappa del sito', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_NEWPAGE', 'IT', 'Aggiungi la pagina del sito', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_NEWINSTANCE', 'IT', 'Aggiungere Pagina', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_IPROPERTIES', 'IT', 'Propiet? dalla pagina', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_PROPERTIES', 'IT', 'Propriet? della pagina del sito', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_DELETE', 'IT', 'Cancella la pagina del sito', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_PDELETE', 'IT', 'Cancella Pagina', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_CONFIGURE', 'IT', 'Configura Pagina', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_CONFDESC', 'IT', 'Puoi collegare la pagina del sito a una istanza di gruppo esistente, o puoi creare una nuova istanza. Decidere cosa fare.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_LINK', 'IT', 'Collegare a una istanza di gruppo esistente', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_CLNEW', 'IT', 'Creare una nuova istanza di gruppo', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_EDIT', 'IT', 'Edita la pagina del sito', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUPROPS', 'IT', 'Nome del men? e testo di aiuto', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUNAME', 'IT', 'Nome nel Men?', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUHELP', 'IT', 'Testo di aiuto per il Men?', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_LAUNCHDATE', 'IT', 'Attivata da', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_EXPIREDATE', 'IT', 'Scaduta da', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_LAUNCHDATES', 'IT', 'Configurazione del tempo di vita', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_PREVIEW', 'IT', 'Pagina Precedente', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_LAUNCH', 'IT', 'Aprire la Pagina', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_EXPIRE', 'IT', 'F? scadere pagina', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM', 'IT', 'Pagina del sito principale', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_EDIT', 'IT', 'Edita pagina del sito principale', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_META', 'IT', 'Template di META-chiavi', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_VARIATIONS', 'IT', 'Variazioni visualizabili', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_TYPE', 'IT', 'Tipo di pagina', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_CLUSTER', 'IT', 'Gruppo di Template', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_PATH', 'IT', 'Percorso dei Template', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_BROWSE', 'IT', 'Esplora gruppo', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_NEW', 'IT', 'Nuova istanza', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_PROPERTIES', 'IT', 'Propriet? del gruppo', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_DEL', 'IT', 'Cancella istanza', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_CREATEINSTANC', 'IT', 'Creare nuova istanza', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_NOTITLE', 'IT', 'Nessun titolo definito', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TITLE', 'IT', 'Titolo', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_EDIT', 'IT', 'Edita membri del gruppo', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_DELETE', 'IT', 'Cancella membri del gruppo', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_DELETEMES', 'IT', 'Vuoi veramente cancellare questa istanza. Sar? persa per sempre!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI', 'IT', 'Istanza di gruppo:', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SR_SELECTCI', 'IT', 'Puoi cercare qu? per ogni content-items . Se vuoi selezionare un content-item, sceglierlo e premere il pulsante di Update ! Se vuoi connettere un nuovo contenuto con questo campo, bisogna prima creare il contenuto nel navigatore di oggetti.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SR_SELECTCLI', 'IT', 'Selezionare un cluster-template. Dopodich? puoi selezionare una istanza del template da assegnare.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FOLDER', 'IT', 'Cartella', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTENTTYPE', 'IT', 'Content-Type', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTENTITEM', 'IT', 'Content-Item', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCH', 'IT', 'Inizia ricerca', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCHIN', 'IT', 'Ricerca per', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCHRESULTS', 'IT', 'Risultati della ricerca, fare un scelta', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECTEDOBJECT', 'IT', 'Content-Item attualmente selezionato', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECTEDINSTANCE', 'IT', 'Seleziona una istanza Cluster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_META', 'IT', 'Meta Templates', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_BROWSER', 'IT', 'Esplora oggetti', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_INSTALLPLUGIN', 'IT', 'PlugIns', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_ES', 'IT', 'Explora il  Sito', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_SPM', 'IT', 'Pagina principale', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_PRTMAN', 'IT', 'Manager del portale', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_MYPRT', 'IT', 'Mio Portale', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_MYPROFILE', 'IT', 'Mio Profilo', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_LOGOUT', 'IT', 'Sconnettiti', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_CLB', 'IT', 'Esplora i Cluster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_CLTB', 'IT', 'Esplora i Cluster-Template', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_UMAN', 'IT', 'Manager utente', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_VAR', 'IT', 'Variazioni', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_PURGE', 'IT', 'Ripulisci Database', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_PGN', 'IT', 'Controllo deiPlugin', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_NEW', 'IT', 'Nuovo CL-Template', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_BROWSE', 'IT', 'Esplora il CL-Templates', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_NAME', 'IT', 'Nome del CL-Template', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_PROPERTIES', 'IT', 'Propriet? del Cluster-Template', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_DELETE', 'IT', 'Cancella il Cluster-Template', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_DELMES', 'IT', 'Vuoi candellare il cluster-template. Questo comporter? la perdita di tutti(!) i contenuti creati su e con il cluster-template. Sei sicuro, vuoi proseguire?', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLTI_DELETE', 'IT', 'Vuoi veramente cancellare questo oggetto. Tutte le istanza di questo oggetto saranno perse!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_SCHEME', 'IT', 'Edita lo schema  Cluster-Template', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_MINCARD', 'IT', 'Minimo numero di istanze', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_MAXCARD', 'IT', 'Massimo numero di istanze', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LINKED', 'IT', 'Collegato  con', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_INSTALLDESC', 'IT', 'Essere sicuri di aver copiato tutti i necessari file nella cartella. Inserire il percorso corretto per i plugin nel campo sottostante. Il sistema istaller? i the PlugIn automaticamente.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_CHOOSE', 'IT', 'PlugIn: &nbsp; /plugin/', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_FILEWRONG', 'IT', 'Il file inserito non ? stato trovato nel server!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLASS_WRONG', 'IT', 'Il file specificato non ha un firma di classe valida!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_INSTALLED', 'IT', 'Il PlugIn ? stato installato con successo!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_UPGRADED', 'IT', 'Il PlugIn ? stato aggiornato con successo!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_ALREADYINSTAL', 'IT', 'Il PlugIn ? gi? istallato!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_TITLE', 'IT', 'PlugIns', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_INSTALL', 'IT', 'Aggiungi PlugIn', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_UNINSTALL', 'IT', 'Rimuovi PlugIn', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_UNINSTALLMES', 'IT', 'Stai per rimuovere un modulo. Rimuovere un modulo non solo rimuove i tipi contenuti ma anche cancella ogni singolo oggetto di questo tipo che sono immagazzinati nel database. La rimozione canceller? definitivamente tutti(!) i dati di questo modulo!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_UNINSTALLDELE', 'IT', 'Rimuovi il modulo,<br> Cancella tutti i contenuti corrispondenti.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_NEW', 'IT', 'Nuovo oggetto', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_PROPERTIES', 'IT', 'Propriet? degli oggetti', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_DELMES', 'IT', 'Stai per cancellare un oggetto. <b>Tutte le variazioni e i META-DATI saranno perse!</b>', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_DEL', 'IT', 'Cancella oggetto', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_EDIT', 'IT', 'Edita oggetto', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_PREVIEW', 'IT', 'Anteprima di', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_TEXT', 'IT', 'Testo', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_ALT', 'IT', 'ALT-Tag', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_COPYRIGHT', 'IT', 'Copyright', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_BROWSE', 'IT', 'Esplora oggetti', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_HOME', 'IT', 'Inizia', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_NEWFOLDER', 'IT', 'Nuovo contenitore', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_EDITFOLDER', 'IT', 'Edita le propriet? del contenitore', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_FOLDERNAME', 'IT', 'Nomina il contenitore', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_DELETEFOLDER', 'IT', 'Cancella il contenitore', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_FOLDERNOTEMPTY', 'IT', 'Il contenitore non ? vuoto. Non ? possibili cancellarlo! Controllare tutti gli oggetti e gruppi!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_DELFOLDER', 'IT', 'Cancellare il contenitore a tutti gli oggetti figli', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_MOVEOBJECTS', 'IT', 'Spostare tutti gli oggetti nel nodo principale', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_PARENT', 'IT', 'Contenitore principale', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('METATEMPLATES', 'IT', 'Contenitori Meta-Dati', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_PROPERTIES', 'IT', 'Edita la propriet? dei Meta-Contenitori', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_SCHEME', 'IT', 'Edita schemi dei Meta-Contenitori', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_DELETE', 'IT', 'Vuoi veramente cancellare questa parte di meta-contenitori? Tutte le informazioni inserite in ogni META-ingresso in CMS collegati con queste parti saranno cancellati. I dati saranno persi per sempre!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_ADDITIONAL', 'IT', 'META-Dati addizionali', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_BASE', 'IT', 'META-Dati base', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_MODULE', 'IT', 'Specificare i META-Dati del modulo', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VARIATIONS', 'IT', 'Variazioni Disponibili', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('V_NAME', 'IT', 'Nome', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('V_SHORT', 'IT', 'Short-Tag', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('V_EDIT', 'IT', 'Editare variazioni', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOGIN_FAILED', 'IT', 'I dati di accesso inseriti non possono essere verificati! Riprovare.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_HEAD', 'IT', 'Profilo Utente', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_LINK', 'IT', 'Profili Utente', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_NAME', 'IT', 'Nome utente', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FULL_NAME', 'IT', 'Name Completo', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PASSWORD', 'IT', 'Password', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_EMAIL', 'IT', 'eMail', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_ACTIVE', 'IT', 'Acconto Abilitato', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_FILTERMENU', 'IT', 'Amminisgtrazione utenti', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_PERMGRID', 'IT', 'Griglia dei permessi', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_LINK', 'IT', 'Profili del Gruppo', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_HEAD', 'IT', 'Profilo del Gruppo', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_NAME', 'IT', 'Nome del Gruppo', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_DESCRIPTIO', 'IT', 'Descrizione', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_FILTERMENU', 'IT', 'Amministrazione del Gruppo', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_LINK', 'IT', 'Profili delle regole', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_HEAD', 'IT', 'Profilo della regola', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_NAME', 'IT', 'Nome  della regola', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_DESCRIPTION', 'IT', 'Descrizione', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_FILTERMENU', 'IT', 'Regole di amministrazione', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_PERMISSIONS', 'IT', 'Permessi utente', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_TO_GROUP', 'IT', 'Aggiungi utente al gruppo', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ERROR_SEL_GROUP', 'IT', 'Devi selezionare un gruppo!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ERROR_SEL_ROLE', 'IT', 'Devi selezionare almeno una regola!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_PROFILE', 'IT', 'Mio profilo', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COMMIT', 'IT', 'Impegna', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CANCEL', 'IT', 'Cancella', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('YES', 'IT', 'Si', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO', 'IT', 'No', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEW', 'IT', 'Inserire Nuovo', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NAME', 'IT', 'Nome', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DESCRIPTION', 'IT', 'Descrizione', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT', 'IT', 'Editare', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('UP', 'IT', 'S?', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DOWN', 'IT', 'Gi?', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTAINERNAME', 'IT', 'Contenitori', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('POSITION', 'IT', 'Posizione', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DELETE', 'IT', 'Cancellare', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TYPE', 'IT', 'Tipi', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('KEYWORDS', 'IT', 'Parole chiavi', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('METATEMPLATE', 'IT', 'Contenitori di META-chiavi addizionali', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECT_VARIATION', 'IT', 'Selezionare Variazioni', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_CONTENT', 'IT', 'Edita Contenuto', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_META', 'IT', 'Editare i META-Dati', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PREVIEW', 'IT', 'Anteprima', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHOOSEFILE', 'IT', 'Sciegli un file', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOTCONFIGURED', 'IT', 'Non ancora configurato.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONFIG', 'IT', 'Configura', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECT_CI', 'IT', 'Selezionare il contenuto degli oggetti', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECT_CL', 'IT', 'Selezionare un gruppo di istanze', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EMPTY', 'IT', '&lt;Vuoto&gt;', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STATUS', 'IT', 'Stato:', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('UNIQUE', 'IT', 'Questo campo deve essere unico!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MANDATORY', 'IT', 'Questo campo non pu? essere vuoto!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOTNUMBER', 'IT', 'Devi inserire un numero in questo campo!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WRONGDATE', 'IT', 'La data inserita, non esiste!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DATEFORMAT', 'IT', 'Il formato della data non ? corretto!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PWDNOTMATCH', 'IT', 'La passwords inserita non ? corretta!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PWDTOOSHORT', 'IT', 'La password deve essere di almeno 6 caratteri!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PROCERROR', 'IT', 'Un errore ? successo mentre si processava il form. Controllare il campo marcato di blu e leggere qu? per ulteriori informazioni.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SAVEERROR', 'IT', 'Si ? verificato un errore mentre si stavano salvando i dati nel database. Assicurarsi che il database sia connesso o contattare il proprio Amministratore.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SAVESUCCESS', 'IT', 'I dati sono stati scritti correttamente nel database.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DELETESUCCESS', 'IT', 'I dati elencati sotto sono stati correttamente cancellati dal database. Ora sono persi!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECTONE', 'IT', 'Devi fare una scelta qu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATENEW', 'IT', 'Un nuovo membro di questo template ? stato creato. Guardare i dati elencati sotto.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PROMPTDELETE', 'IT', 'Vuoi veramente cancellare questo dataset? Questa azione non pu? essere ripristinata!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RESET', 'IT', 'Resettare Form', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BACK', 'IT', 'Indietro', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATE', 'IT', 'Creare Oggetto', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE', 'IT', 'Ripulisci Database', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_MES', 'IT', 'Selezionare la parte di database, che si vuole ripulire.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_VAR', 'IT', 'Ripulire Variazioni', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_CONTENT', 'IT', 'Ripulire Contenuto', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VAR_SUCCEEDED', 'IT', ' completato!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_FOLDER', 'IT', 'Ripulire Cartelle', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_CLUSTER', 'IT', 'Ripulire Gruppo', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_META', 'IT', 'Ripulire Meta', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_CLT', 'IT', 'Ripulire Gruppo di Contenitori', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_PAGES', 'IT', 'Ripulire pagina del sito e quella principale', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_EXPIRED', 'IT', 'Ripulisci pagine scadute', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_JS', 'PL', 'U?yj Javascript', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_BL', 'PL', 'J?zyk systemu zarz?dzania', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_BROWSER', 'PL', 'Przegl?danie Portali', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_OWNER', 'PL', 'W?a?ciciel Strony', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_CRSUCCEEDED', 'PL', 'Utworzenie nowej strony portalu powiod?o si', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_MYPORTAL', 'PL', 'Moje Portale', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_EDIT', 'PL', 'Edycja strony Portal-u', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_BROWSE', 'PL', 'Przegl?danie uk?adu stron', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_NEWPAGE', 'PL', 'Dodanie strony serwisu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_NEWINSTANCE', 'PL', 'Dodanie strony', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_IPROPERTIES', 'PL', 'W?a?ciwo?ci strony', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_PROPERTIES', 'PL', 'W?a?ciwo?ci strony serwisu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_DELMES', 'PL', 'Zamierzasz usun?? stron? serwisu. Prosz? zauwa?y?, ?e tak?e czynna wersja tej strony serwisu zostanie usuni?ta!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_DELETE', 'PL', 'Usuni?cie strony serwisu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_PDELMES', 'PL', 'Zamierzasz usun?? stron?. Prosz? zauwa?y?, ?e tak?e czynna wersja tej strony zostanie usuni?ta!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_PDELETE', 'PL', 'Usuni?cie strony', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_CONFIGURE', 'PL', 'Konfiguracja strony', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_CONFDESC', 'PL', 'Mo?na po??czy? t? stron? serwisu z instniej?cym wysta?pieniem klastra lub mo?na utworzy? now? instancj?. Prosz? zadecydowa? co zamierzsz zrobi', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_LINK', 'PL', 'Utworzy? po??czenie do istniej?cego wyst?pienia klastra', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_CLNEW', 'PL', 'Stworzy? nowe wyst?pienie klastra', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_EDIT', 'PL', 'Edycja strony serwisu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUPROPS', 'PL', 'Nazwa menu i tekst pomocy', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUNAME', 'PL', 'Nazwa w menu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUHELP', 'PL', 'Tekst pomocy dla menu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_LAUNCHDATE', 'PL', 'Wa?ne od', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_EXPIREDATE', 'PL', 'Up?ywa od', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_LAUNCHDATES', 'PL', 'Konfiguracja czasu pracy', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_PREVIEW', 'PL', 'Podgl?d strony', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_LAUNCH', 'PL', 'Uruchom stron', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_EXPIRE', 'PL', 'Przedawnij stron', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOSPTITLE', 'PL', 'Nale?y zdefiniowa? nazw? w menu przed uruchomieniem strony!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACTIVE', 'PL', 'Aktywne', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM', 'PL', 'Wzorzec strony serwisu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_EDIT', 'PL', 'Edycja wzorca strony serwisu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_META', 'PL', 'Wzorzec meta kluczy', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_VARIATIONS', 'PL', 'Wy?wietlane wersje', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_TYPE', 'PL', 'Rodzaj strony', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_CLUSTER', 'PL', 'Wzorzec klastra', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_PATH', 'PL', '?cie?ka do wzorca', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_BROWSE', 'PL', 'Przegl?danie klastr?w', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_NEW', 'PL', 'Nowe wyst?pienie', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_PROPERTIES', 'PL', 'W?a?ciwo?ci klastra', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_DEL', 'PL', 'Usu? wyst?pienie', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_DELMES', 'PL', 'Czy na pewno chcesz usun?? to wyst?pienie klastra? Wszystkie dane zawarto?ci zostan? stracone!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_EDIT', 'PL', 'Edycja wyst?pienia klastra', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_CREATEINSTANC', 'PL', 'Ut?rzenie nowego wyst?pienia', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_CREATEINSMES', 'PL', 'Nadal zostaj? gniazda do utworzenia dodatkowych wyst?pie? dla thych p?l zawarto?ci. Je?eli chcesz utworzy? dodatkowe wyst?pienie, wprowad? tytu? w polu tekstowym poni?ej i naci?nij przycisk utw?rz.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_NOTITLE', 'PL', 'Nie zosta? jeszcze zdefiniowany tytu?', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TITLE', 'PL', 'Tytu?', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_EDIT', 'PL', 'Edycja cz?onka klastra', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_DELETE', 'PL', 'Usu? cz?onka klastra', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_DELETEMES', 'PL', 'Czy na pewno chcesz usun?? to wyst?pienie? Zostanie stracone na zawsze!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_DELETED', 'PL', 'Wyst?pienie zosta?o usuni?te!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_NOTDELETED', 'PL', 'To wyst?pienie nie mo?e zosta? usuni?te!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI', 'PL', 'Wyst?pienie klastra:', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SR_SELECTCI', 'PL', 'Tutaj mo?na wyszukiwa? dowolne elementy zawarto?ci. Je?eli chcemy wybra? element zawarto?ci, nale?y nacisn?? przycisk Aktualizuj! Je?eli chcemy pod??czy? si? do nowej zawarto?ci za pomoc? tego pola - stw?rz wcze?niej zawarto?? w Przegl?darce obiekt?w.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SR_SELECTCLI', 'PL', 'Prosz? wybra? szablon klastra. Nast?pnie mo?na wybra? wyst?pienie szablonu w celu dalszego u?ycia.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FOLDER', 'PL', 'Folder', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTENTTYPE', 'PL', 'Rodzaj zawarto?ci', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTENTITEM', 'PL', 'Element zawarto?ci', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCH', 'PL', 'Pocz?tek wyszukiwania', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCHIN', 'PL', 'Szukaj', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCHRESULTS', 'PL', 'Wyniki wyszukiwania, prosz? wybra', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECTEDOBJECT', 'PL', 'Aktualnie wybrany element zawarto?ci', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECTEDINSTANCE', 'PL', 'Wybrane wyst?pienie klastra', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_META', 'PL', 'Szablony Meta', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_BROWSER', 'PL', 'Przegladarka obiekt?w', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_INSTALLPLUGIN', 'PL', 'Dodatki', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_ES', 'PL', 'Przegl?darka serwisu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_SPM', 'PL', 'Wzorzec stron serwisu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_PRTMAN', 'PL', 'Zarz?dzanie portalem', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_MYPRT', 'PL', 'Moje portale', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_MYPROFILE', 'PL', 'M?j profil', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_LOGOUT', 'PL', 'Wyloguj', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_CLB', 'PL', 'Przegl?darka klastra', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_CLTB', 'PL', 'Przegl?darka szablon?w klastra', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_UMAN', 'PL', 'Zarz?dzanie u?ytkownikami', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_VAR', 'PL', 'Odmiany', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_PURGE', 'PL', 'Usuni?cie bazy danych', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_PGN', 'PL', 'Kontrola dodatk?w', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_REPORT', 'PL', 'Raport serweisu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_NEW', 'PL', 'Nowy szablon klastra', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_BROWSE', 'PL', 'Przegl?d. szabl.klas.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_NAME', 'PL', 'Nazwa szabl.klas.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_PROPERTIES', 'PL', 'W?a?ciwo?ci szabl.klas.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_DELETE', 'PL', 'Usuni?cie szabl.klas.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_DELMES', 'PL', 'Zamierzasz usun?? szablon klastra. Spowoduje to usuni?ci? wszystkich(!) zawarto?ci stworzonych przy u?yciu szablonu klastra. Czy na pewno chcesz kontynuowa', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLTI_DELETE', 'PL', 'Czy na pewno chesz usun?? ten element? Wszystkie wyst?pienia tego elementu tak?e zostan? usuni?te!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_SCHEME', 'PL', 'Edycja schematu szablonu klastra', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_MINCARD', 'PL', 'Wyst?pienia', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_MAXCARD', 'PL', '-', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LINKED', 'PL', 'Po??czone z', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_INSTALLDESC', 'PL', 'Prosze si? upewni?, ?e zosta?y skopiowane wszystkie niezb?dne pliki do katalogu przed kontynuacj?. Wprowad? poprawn? ?cie?k? do dodatku w poni?szym polu. System zainstaluje dodatek automatycznie.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_CHOOSE', 'PL', 'Dodatek: &nbsp; /plugin/', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_FILEWRONG', 'PL', 'Nazwa pliku, kt?ra zosta?a wprowadzona nie mog?a zosta? znaleziona na serwerze!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLASS_WRONG', 'PL', 'Plik, kt?ry zosta? wprowadzony nie zawiera poprawnej sygnatury!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_INSTALLED', 'PL', 'Dodatek zosta? poprawnie zainstalowany!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_UPGRADED', 'PL', 'Dodatek zosta? porawnie zaktualizowany!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_ERROR', 'PL', 'Wyst?pi? b??d podczas instalacji dodatku!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_ALREADYINSTAL', 'PL', 'Dodatek ju? zosta? zainstalowany!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_NEWERINSTALLE', 'PL', 'Ju? jest zainstalowana nowsza wersja dodatku!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_TITLE', 'PL', 'Dodatki', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_INSTALL', 'PL', 'Zainstaluj dodatek', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_UNINSTALL', 'PL', 'Odinstaluj dodatek', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_UNINSTALLMES', 'PL', 'Zamierzasz odinstalowa? modu?. Odinstalowanie modu?u nie tylko usuwa rodzaj zawarto?ci ale tak?e usuwa ka?dy obiekt tego typu przechowywany w bazie danych. Odinstalowanie definitywnie(!) usunie wszystkie dane dla tego modu?u!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_UNINSTALLDELE', 'PL', 'Odinstaluj modu?,<br> Usuni?cie wszystkie zale?ne zawarto?ci.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_NEW', 'PL', 'Nowy obiekt', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_NAME', 'PL', 'Nazwa obiektu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_PROPERTIES', 'PL', 'W?a?ciwo?ci obiektu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_DELMES', 'PL', 'Zamierzasz usun?? obiekt. <b>Nale?y zauwa?y?, ?e wszystkie odmiany i meta dane zostan? utracone!</b>', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_DEL', 'PL', 'Usu? obiekt', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_EDIT', 'PL', 'Edytuj obiekt', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_PREVIEW', 'PL', 'Podgl?d', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_TEXT', 'PL', 'Tekst', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_ALT', 'PL', 'Opis rysunku', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_COPYRIGHT', 'PL', 'Prawo autorskie', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_BROWSE', 'PL', 'Przegl?d obiekt?w', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_HOME', 'PL', 'Start', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_NEWFOLDER', 'PL', 'Nowy folder', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_EDITFOLDER', 'PL', 'Edycja w?a?ciwo?ci folderu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_FOLDERNAME', 'PL', 'Nazwa folderu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_DELETEFOLDER', 'PL', 'Usu? folder', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_DELFOLDERMES', 'PL', 'Zamierzasz usun?? folder. Prosz? zaznaczy? akcj', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_FOLDERNOTEMPTY', 'PL', 'Folder nie jest pusty. Nie mo?na go usun??. Prosz? sprawdzi? wszystkie obiekty i klastry!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_DELFOLDER', 'PL', 'Usuni?cie folderu i wszystkich podrz?dnych obiekt?w', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_MOVEOBJECTS', 'PL', 'Przesuni?cie wszystkich obiekt?w do nadrz?dnego w?z?a', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_PARENT', 'PL', 'Nadrz?dny folder', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('METATEMPLATES', 'PL', 'Szablon meta danych', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_PROPERTIES', 'PL', 'Edycja w?a?ciwo?ci meta szablonu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_SCHEME', 'PL', 'Edycja schematu meta szablonu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_DELETE', 'PL', 'Czy rzeczywi?cie zamierzasz usun?? t? cz??? meta szablonu? Wszystkie informacje wprowadzone w dowolne meta pola w systemie CMS po??czone do tej cz??ci zostan? usuni?te. Dane zostan? usuni?te ca?kowicie!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_ADDITIONAL', 'PL', 'Dodatkowe meta dane', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_BASE', 'PL', 'Podstawowe meta dane', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_MODULE', 'PL', 'Meta dane specyficzne dla rodzaju zawrto?ci', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VARIATIONS', 'PL', 'Dost?pne odmiany', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('V_NAME', 'PL', 'Nazwa', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('V_SHORT', 'PL', 'Kr?tki znacznik', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('V_EDIT', 'PL', 'Edycja odmian', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOGIN_FAILED', 'PL', 'Wprowadzone dane u?ytkownika nie mog? zosta? potwierdzone! Prosz? spr?bowa? ponownie.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_HEAD', 'PL', 'Profil u?ytkownika', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_LINK', 'PL', 'Profile u?ytkownik?w', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_NAME', 'PL', 'Nazwa u?ytkownika', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FULL_NAME', 'PL', 'Pe?na nazwa', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PASSWORD', 'PL', 'Has?o', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_EMAIL', 'PL', 'eMail', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_ACTIVE', 'PL', 'Konto w??czone', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_FILTERMENU', 'PL', 'Administracja u?ytkonikami', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_SETPERM', 'PL', 'Ustal prawa dost?pu u?ytkownika poni?ej. W celu usuni?cia u?ytkownika z grupy, po prostu odwo?aj wszytkie grupy przynale?ne do niego.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_PERMGRID', 'PL', 'Siatka uprawnie?', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_LINK', 'PL', 'Profile grupy', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_HEAD', 'PL', 'Profil grupy', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_NAME', 'PL', 'Nazwa grupy', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_DESCRIPTIO', 'PL', 'Opis', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_FILTERMENU', 'PL', 'Adminstracja grup?', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_LINK', 'PL', 'Profile r?l', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_HEAD', 'PL', 'Profil roli', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_NAME', 'PL', 'Nazwa roli', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_DESCRIPTION', 'PL', 'Opis', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_FILTERMENU', 'PL', 'Adminstracja rolami', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_PERMISSIONS', 'PL', 'Uprawnienia u?ytkownika', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('UP_INTRO', 'PL', 'Prosz? zaznaczy? grup? i role w grupie, kt?re checesz doda? dla u?ytkownika.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_TO_GROUP', 'PL', 'Dodanie u?ytkownika do grupy', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ERROR_SEL_GROUP', 'PL', 'Nale?y wybra? grup', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ERROR_SEL_ROLE', 'PL', 'Nale?y wybra? co najmniej jedn? rol', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_PROFILE', 'PL', 'M?j profil', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COMMIT', 'PL', 'Powie?', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CANCEL', 'PL', 'Anuluj', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('YES', 'PL', 'Tak', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO', 'PL', 'Nie', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEW', 'PL', 'Wstaw nowy', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NAME', 'PL', 'Nazwa', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DESCRIPTION', 'PL', 'Opis', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DOSOMETHING', 'PL', 'Prosz? wybra? dzia?anie, kt?re chesz wykona?. Mo?esz wybra? nowe elementy, edytowa? elementy, usun?? elementy lub zmieni? kolejno?? element?w.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT', 'PL', 'Edycja', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('UP', 'PL', 'W g?r', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DOWN', 'PL', 'W d??', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTAINERNAME', 'PL', 'Szablon', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECTOBJECT', 'PL', 'Prosz? wybra? klas? oraz okre?li? pozycj? i nazw? dla tworzonego obiektu.<br> Dla pozycji u?yj 0 dla okre?lenia pocz?tkowej pozycji, 999 dla okre?lenie na ko?cu poza innymi pozycjami twojego wybory.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('POSITION', 'PL', 'Pozycja', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DELETE', 'PL', 'Usu?', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TYPE', 'PL', 'Typ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('KEYWORDS', 'PL', 'S?owa kluczowe', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('METATEMPLATE', 'PL', 'Dodatkowe meta klucze szablonu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECT_VARIATION', 'PL', 'Wybierz odmian', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACTIVE_VARIATION', 'PL', 'Aktywne odmiany:', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_VARIATIONS', 'PL', 'Nie ma obecnie zdefiniowanych odmian tego obiektu!<br>Prosz? skonsultowa? to z programist? w celu sprawdzenia konfiguracji wybranego elementu!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_CONTENT', 'PL', 'Edycja zawarto?ci', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_META', 'PL', 'Edycja meta danych', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_DISPATCHER', 'PL', 'U?yj tego przycisku w celu prze??czenia si? pomi?dzy edytowaniem meta danych a edycj? zawarto?ci.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PREVIEW', 'PL', 'Podgl?d', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHOOSEFILE', 'PL', 'Wybierz plik', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONFIGURED', 'PL', 'Gotowy do u?ycia.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOTCONFIGURED', 'PL', 'Nie skonfigurowany jeszcze.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONFIG', 'PL', 'Konfiguracja', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECT_CI', 'PL', 'Wybierz element zawarto?ci', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECT_CL', 'PL', 'Wybierz element klastra', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EMPTY', 'PL', '&lt;pusty&gt;', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STATUS', 'PL', 'Status:', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('UNIQUE', 'PL', 'To pole musi by? unikalne!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MANDATORY', 'PL', 'To pole nie mo?e by? puste!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOTNUMBER', 'PL', 'Nale?y wprowadzi? numer do tego pola!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WRONGDATE', 'PL', 'Data, kt?ra zosta?a wprowadzone nie istnieje!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DATEFORMAT', 'PL', 'Format daty jest nieprawid?owy!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PWDNOTMATCH', 'PL', 'Has?a, kt?re zosta?y wprowadzone nie zgadzaj? si', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PWDTOOSHORT', 'PL', 'Has?o musi zawiera? co najmniej 6 znak?w!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PROCERROR', 'PL', 'Wyst?pi? b??d podczas przetwarzania danych formularza. Prosz? sprawdzi? pola zaznaczone na niebiesko i przeczyta? dodatkowe informacje.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SAVEERROR', 'PL', 'Wyst?pi? b??d podczas zapisywania danych do bazy danych. Prosz? sprawdzi? czy baza danych jest pod??czona lub zadzwoni? do administratora.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SAVESUCCESS', 'PL', 'Dane zosta?y poprawnie zapisane do bazy danych.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DELETESUCCESS', 'PL', 'Dane wypisane poni?ej zosta?y poprawnie usuni?te z bazy danych. Zosta?y ca?kowicie usuni?te!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECTONE', 'PL', 'Tutaj nale?y dokona? wyboru!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATENEW', 'PL', 'Nowy cz?onek tego szablonu zosta? utworzony zobacz dane wypisane poni?ej.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PROMPTDELETE', 'PL', 'Czy na pewno chcesz usun?? ten zestaw danych? Ta akcja nie mo?e zosta? cofni?ta!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RESET', 'PL', 'Wyczy?? formularz', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BACK', 'PL', 'Wstecz', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATE', 'PL', 'Utw?rz element', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ERROR', 'PL', 'Wyst?pi? b??d podczas operacji wykonywania wyboru!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE', 'PL', 'Usuni?cie bazy danych', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_MES', 'PL', 'Prosz? wybra? cz?sci bazy danych, kt?re zamierzasz usun?', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_VAR', 'PL', 'Usuni?cie odmian', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_CONTENT', 'PL', 'Usuni?cie zawarto?ci', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VAR_SUCCEEDED', 'PL', ' powiod?o si', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_FOLDER', 'PL', 'Usuni?cie folderu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_CLUSTER', 'PL', 'Usuni?cie klastra', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_META', 'PL', 'Usuni?cie Meta', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_CLT', 'PL', 'Usuni?cie szablon?w klastra', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_PAGES', 'PL', 'Usuni?cie stron serwisu i wzorc?w', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_EXPIRED', 'PL', 'Usuni?cie stron przedawnionych', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_COMPGRP', 'DE', 'Verbund-Gruppen sind Gruppen von Clustern. Cluster-Vorlagen k?nnen ein eigenes Layout besitzen. Dies erm?glicht Ihnen, Ihre Homepage aus Bl?cken zusammenzusezten, z.B. News, Umfrage, Bildergalerie - alles auf einer Seite und bei Bedarf.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_CLUSTERTEMPLATES', 'DE', 'Es gibt keine Cluster-Vorlagen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_CLT', 'DE', 'Cluster-Vorlagen erlauben Ihnen, die Struktur f?r Ihre Site festzulegen und den Typ von Inhalten zu bestimmen. Anschlie?end werden Cluster-Vorlagen mit Seiten-Vorlagen verschmolzen, welche die Inhalte in der Web-Seite darstellen.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_SELECTTHUMB', 'DE', 'Vorschaubild ausw?hlen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TT_REFRESH', 'DE', 'Instanzen erneuern aktualisiert zwischengespeicherte Seiten mit den ge?nderten Werten.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_PAGETEMP', 'DE', 'In Tabellenkalkulations- und Datenbank-Anwendungen ist eine Vorlage ein leeres Formular, das zeigt, welche Felder an welcher Position und in welcher L?nge existieren. In N/X sind Vorlage die Grundlage f?r jede Ausgabe. Eine Vorlage ist ein Formular, in dem alle Zellen definiert wurden, jedoch noch keine Inhalte hinterlegt wurden.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATED', 'DE', 'Erstellt', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDITED', 'DE', 'Bearbeitet', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('IN_CHANNEL', 'DE', 'in Kanal', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AUTHOR', 'DE', 'Autor', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_ARTICLE', 'DE', 'Artikel ausw?hlen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CH_CAT', 'DE', 'Kategorien definieren', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CH_ADMIN', 'DE', 'Kanal-Administration', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ARTICLES', 'DE', 'Atikel', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHANNEL_SELECT', 'DE', 'Kanal ausw?hlen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_OBJBROWSE', 'DE', 'Die Inhalts-Bibliothek enth?lt alle Inhalte der Site.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_SP', 'DE', 'Die Sitemap dient zum Bearbeiten von Seiten-Struktur und Seiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MH_GETSTART', 'DE', 'Erste Schritte', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_HELP', 'DE', 'Hilfe', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_CHANNELS', 'DE', 'Kan?le', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_EXPORT_WZ', 'DE', 'Export-Assistent', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_IMPORT_WZ', 'DE', 'Import-Assistent', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SYNC_CLUSTERS', 'DE', 'Cluster synchronisieren', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AGENT_EXPLAINHOME', 'DE', 'You can find me by clicking the N/X-Logo in the upper-right corner of your browser.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AGENT_LOGOUT', 'DE', 'I hope you enjoyed working with N/X. Have a nice day!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AGENT_CALLED', 'DE', 'you asked for me?', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AGENT_NXHOMEPAGE', 'DE', 'Visit N/X Homepage!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AGENT_GOAWAY', 'DE', 'Hide and stay away!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AGENT_GOHOME', 'DE', 'Go home!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AGENT_WELCOME', 'DE', 'Welcome to N/X.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('YESTERDAY', 'DE', 'Gestern', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WHEN', 'DE', 'Wann', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WEEKDAY', 'DE', 'Wochentage', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WEEKDAY_AS', 'DE', 'Wochentags-Analyse', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VIS_FIRST', 'DE', 'Erstmalige Besucher', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VIS_ONL', 'DE', 'Besucher online', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VIS_PER_VIS', 'DE', 'Durchschnittliche Besucher je Besucher', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VIS_RET', 'DE', 'Wiederkehrende Besucher', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WEBSITE', 'DE', 'Website', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VISITS_OVERVIEW', 'DE', 'Besuchs-?bersicht', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VISITS', 'DE', 'Besuche', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VISITORS', 'DE', 'Besucher', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_PERMISSION', 'DE', 'Benutzerrechte bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_JS', 'DE', 'Javascript verwenden', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_GENERAL', 'DE', 'Allgemeine Benutzerdaten bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_BL', 'DE', 'Hintergrund-Sprache', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USAGE', 'DE', 'Benutzung', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USERPERM_HEAD', 'DE', 'Benutzer-Rechte berabeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TRANSLATION', 'DE', 'N/X ?bersetzungs-System', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOTAL', 'DE', 'Total', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_SKW', 'DE', 'Top Such-Schl?sselworte', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_SI', 'DE', 'Top Suchmaschinen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_REFERER', 'DE', 'Top Referer', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_PATHS', 'DE', 'Top Pfade', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_OS', 'DE', 'Top Betriebssysteme', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_EXITT', 'DE', 'Top Ausgangs-Ziele', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_HOSTS', 'DE', 'Top Hosts', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_BROWSER', 'DE', 'Top Browser', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TMPL_NAME', 'DE', 'Vorlage ausw?hlen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TODAY', 'DE', 'Heute', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP', 'DE', 'Daten einschr?nken', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TIPP_TEMPLATE_1', 'DE', 'Vorlagen sind die Basis jeder Ausgabe von N/X. Sie m?ssen zun?chst eine Cluster-Vorlage erstellen, die die Struktur und die Art der Inhalte definiert. Anschlie?end k?nnen Sie die Seiten-Vorlage erstellen, indem Sie eine Cluster-Vorlage mit einer PHP-datei verbinden.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TIME_BETW_VISITS', 'DE', 'Durchschnittliche Zeit zwischen Besuchen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('THISYEAR', 'DE', 'Dieses Jahr', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('THISWEEK', 'DE', 'Dieses Woche', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('THISMONTH', 'DE', 'Dieser Monat', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TF', 'DE', 'Zeitrahmen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TESTS', 'DE', 'N/X Unit-Tests', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TEMPLATE', 'DE', 'Vorlage', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STNAME', 'DE', 'W?hlen Sie einen Namen, um die Seite in der Sitemap zu identifizieren', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STATS_HEADER', 'DE', 'N/X 2004 Traffic-Statistiken', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STATS', 'DE', 'Statistiken', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('START_BAK', 'DE', 'Datensicherung starten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_RLTREE', 'DE', 'Baum auffrischen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUDIRECTTITLE', 'DE', 'Optionalen Pfad auf dem Server f?r direkten Zugriff angeben', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUDIRECT', 'DE', 'Direkt-URL auf Live-Server', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUDIRECTTIT', 'DE', 'Optionalen Pfad auf dem Server f?r direkten Zugriff angeben', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_THUMBNAIL', 'DE', 'Vorschaubild', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_RLAUNCH', 'DE', 'Instanzen erneuern', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SMA_EXT_EDIT', 'DE', 'Bearbeitungs-Fenster ?ffnen. Alle inline bearbeiteten Texte vorher speichern !', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SHORTEST_PATHS', 'DE', 'K?rzeste Pfade', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SET', 'DE', 'Setzen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_MEM', 'DE', 'Gew?hlte Mitglieder', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELMULTIPLE', 'DE', 'Halten Sie die STRG-Taste gedr?ckt, um mehrere Elemente auszuw?hlen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECT', 'DE', 'Ausw?hlen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCH_CLEAR', 'DE', 'Filter zur?cksetzen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SAVE_BACK', 'DE', 'Speichern und Zur?ck', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SAVE', 'DE', 'Speichern', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RL_PERM', 'DE', 'Rollen-Berechtigungen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RET_VIS', 'DE', 'Wiederkerende Besucher', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RESET_FORM', 'DE', 'Formular zur?cksetzen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('REMAIN_POS', 'DE', 'Position beibehalten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('REFERER', 'DE', 'Referer', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RB_CACHE', 'DE', 'Zwischenspeichern neu aufbauen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RATERES', 'DE', 'Ergebnisse bewerten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RANK', 'DE', 'Rang', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PTEMPL', 'DE', 'Seiten-Vorlagen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PROPERTIES', 'DE', 'Eigenschaften', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PRINT', 'DE', 'Drucken', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PREDEF_TIME', 'DE', 'Vordefinierter Zeitrahmen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('POS_IN_MENU', 'DE', 'Position in Sitemap', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PI_OVERVIEW', 'DE', '?berischt Seiten-Ansichten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PI', 'DE', 'Seiten-Ansichten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PGNTXT_SMA', 'DE', 'Alle bearbeiteten Texte auf der Seite speichern', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PERCENT', 'DE', 'Prozent', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PATHS', 'DE', 'Click-Pfade', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PAGE', 'DE', 'Seite', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PAGES', 'DE', 'Seiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PATH', 'DE', 'Pfad', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('OVERVIEW', 'DE', '?bersicht', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('OTHERS', 'DE', 'Andere', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ORDERCOMP', 'DE', 'Sortierung von Verb?nden', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ORDER', 'DE', 'nach Sortierung', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('OK', 'DE', 'Ok', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NUMBER_OF_INSTANCES', 'DE', 'Bitte geben Sie an, wie viele Instanzen Sie erzeugen m?chten.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_CONTENTS', 'DE', 'In diesem Ordner existieren keine Inhalte', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_CLUSTER_SELECTED', 'DE', 'Kein Cluster ausgew?hlt', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEW_FOLDER', 'DE', 'Ordner erstellen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEW_CONTENT', 'DE', 'Neuer Inhalt', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_WWW', 'DE', 'Website', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_TEMP', 'DE', 'Vorlagen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_TRANSLATION', 'DE', '?bersetzung', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_ROLLOUT', 'DE', 'Rollout', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_REPORT', 'DE', 'Seiten-Bericht', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_PTEMP', 'DE', 'Seiten Vorlagen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_MAINTENANCE', 'DE', 'Wartung', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_LIB', 'DE', 'Bibliothek', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_CREATEINSMES', 'DE', 'Es stehen noch freie Pl?tze zur Erzeugung von zus?tzlichen Instanzen dieses Inhalts-Feldes zur Verf?gung. Wenn Sie eine neue Instanz erzuegen m?chten, geben Sie den Titel in das untenstehende Textfeld ein und klicken Sie auf die Erzeug', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_CREATEINSTANC', 'DE', 'neue Instanz erzeugen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_EDIT', 'DE', 'Cluster-Instanz bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_DELMES', 'DE', 'M?chen Sie diese Instanz des Clusters wirklich l?schen? S?mtlicher Inhalt geht hiermit verloren!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_DEL', 'DE', 'Instance l?schen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_PROPERTIES', 'DE', 'Cluster Eigenschaften', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_NEW', 'DE', 'Neue Instanz', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_BROWSE', 'DE', 'Cluster durchsuchen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_PATH', 'DE', 'Vorlagen-Pfad', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_CLUSTER', 'DE', 'Cluster-Vorlage', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_TYPE', 'DE', 'Seiten-Typ', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_VARIATIONS', 'DE', 'm?gliche Variationen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_META', 'DE', 'META-Key Vorlage', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_EDIT', 'DE', 'Sitepage-Master bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM', 'DE', 'Sitepage-Master', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACTIVE', 'DE', 'Aktiviert', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOSPTITLE', 'DE', 'Sie m?ssen einen Men?namen angeben, bevor Sie die Seite launchen k?nnen!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_EXPIRE', 'DE', 'Seite deaktivieren', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_LAUNCH', 'DE', 'Seite launchen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_PREVIEW', 'DE', 'Seiten-Vorschau', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_LAUNCHDATES', 'DE', 'Live Time-Konfiguration', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_EXPIREDATE', 'DE', 'Inaktiv ab', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_LAUNCHDATE', 'DE', 'Aktiv ab', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUHELP', 'DE', 'Hilfetext f?r das Men?', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUNAME', 'DE', 'Name im Men?', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUPROPS', 'DE', 'Men?-Name und Hilfetext', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_EDIT', 'DE', 'Sitepage bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_CLNEW', 'DE', 'Neue Cluster-Instanz erzeugen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_LINK', 'DE', 'Link zu existierender Cluster-Instanz', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_CONFDESC', 'DE', 'Sie k?nnen diese Sitepage mit einer existierenden Instanz des Cluster verlinken oder eine neue Instanz erzeugen. Bitte entscheiden Sie, was Sie tun m?chten.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_CONFIGURE', 'DE', 'Seite konfigurieren', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_PDELETE', 'DE', 'Seite l?schen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_PDELMES', 'DE', 'Sie sind im Begriff eine Seite zu l?schen. Bitte beachten Sie, dass auch die LIVE-Instanz dieser Seite gel?scht wird!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_DELETE', 'DE', 'Sitepage l?schen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_DELMES', 'DE', 'Sie sind im Begriff eine Sitepage zu l?schen. Bitte bachten Sie, dass auch die LIVE-Instanz dieser Sitepage gel?scht wird!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_PROPERTIES', 'DE', 'Eigenschaften', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_IPROPERTIES', 'DE', 'Seiten-Eigenschaften', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_NEWINSTANCE', 'DE', 'Neue Seite', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_NEWPAGE', 'DE', 'Sitepage hinzuf?gen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_BROWSE', 'DE', 'Sitemap', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_EDIT', 'DE', 'Portalseite bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_MYPORTAL', 'DE', 'Meine Portale', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_CRSUCCEEDED', 'DE', 'Neues Portal erfolgreich erstellt!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_OWNER', 'DE', 'Seiten-Besitzer', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_BROWSER', 'DE', 'Portal-Browser', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_COMBOBJ', 'DE', 'kombinierte Inhalte (Cluster)', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_CLUSTERS', 'DE', 'Cluster', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_CLT', 'DE', 'Cluster Vorlagen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_BACKUP', 'DE', 'Datensicherung', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_ADMIN', 'DE', 'Administration', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_ACCESS', 'DE', 'Zugriff', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_TITLE', 'DE', 'Wartung', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_SPIDER', 'DE', 'Spider laufen lassen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_GENERATE_DTA_SUCCEEDED', 'DE', '<br><br>Daten wurden erfolgreich generiert und in die Datei geschrieben.<br>', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_GENERATE_DTA_MES', 'DE', 'Datentypen generieren', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_GENERATE_DTA_', 'DE', 'Datentypen generieren', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_GENERATE_DTA', 'DE', 'Datentypen generieren', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_DW_CONTENTFIELDINFO', 'DE', 'Dreamweaver Inhalts-Feld-Info', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_DW_CONTENTFIE', 'DE', 'Dreamweaver Inhalts-Feld-Info', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_DW_CONTENT', 'DE', 'Dreamweaver PlugIn', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MINIMUMAT', 'DE', 'Minimum bei', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MINIMUM', 'DE', 'Minimum', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MENU', 'DE', 'Men?', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MEDIAN', 'DE', 'Median', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MAXIMUMAT', 'DE', 'Maximum bei', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MAXIMUM', 'DE', 'Maximum', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LONGEST_PATHS', 'DE', 'L?ngste Pfade', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOGS', 'DE', 'Log-Datei Analyse', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOGGED_AS', 'DE', 'Eingeloggt als', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOCK_MENU', 'DE', 'Men? serren', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOCATION', 'DE', 'Verweisziel, falls extern', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LIVE_AUTHORING', 'DE', 'Live-Bearbeitung', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LIBRARY', 'DE', 'Inhalts-Bibliothek', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LAUNCH', 'DE', 'ver?ffentlichen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LASTYEAR', 'DE', 'Letztes Jahr', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LASTWEEK', 'DE', 'Letzte Woche', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LASTMONTH', 'DE', 'Letzter Monat', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('I_AFTER', 'DE', 'Einf?gen nach', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('IS_COMPOUND', 'DE', 'Verbund-Cluster-Vorlage', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('IS_FILTERED', 'DE', 'Hinweis: M?glicherweise werden nicht alle Datens?tze angezeigt, weil ein Filter verwendet wird.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('INSTANCE_CREATED', 'DE', 'Eine neue Instanz des Elements wurde erzeugt.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('INSNAME', 'DE', '', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('IND_TIME', 'DE', 'individueller Zeitrahmen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HOURS_AS', 'DE', 'Stunden-Analyse', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HOUR', 'DE', 'Stunden', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP', 'DE', 'Hilfe', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GO', 'DE', 'Los!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_DESCRIPTION', 'DE', 'Beschreibung', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FOLDER_DELMES', 'DE', 'M?chen Sie diesen Ordner wirklich l?schen ?', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ENVIRONMENT', 'DE', 'Umgebung', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXPLORE', 'DE', 'Durchsuchen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FILTER_COLUMN', 'DE', '...in', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FILTER_RULE', 'DE', 'Suche nach...', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_CPGROUPGENERAL', 'DE', 'Gruppe gerell bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_CPGROUP', 'DE', 'Verbund-Gruppe bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT_TEMPLATE', 'DE', 'Vorlage bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT_SPM', 'DE', 'Vorlagen-Eigenschaften bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT_ALL', 'DE', 'Alles bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT_CONTENT', 'DE', 'Inhalt bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT_FOLDER', 'DE', 'Ordner bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT_ACCESS', 'DE', 'Zugriff festlegen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DWEXT_CONTENTFIE', 'DE', 'Inhalts-Feld-Informationen erzeugen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DATE', 'DE', 'Datum', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DEL_FOLDER', 'DE', 'Ordner l?schen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DESC', 'DE', 'Beschreibung', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DISPLAY', 'DE', 'Anzeigen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATE_INSTANCES', 'DE', 'Instanzen erzeugen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CR_CONTENT', 'DE', 'Inhalt f?r diese Seite erzeugen?', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COUNT', 'DE', 'Anzahl', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CPG_MEMBERS_SELECT', 'DE', 'Mitglieder dieser Verbundgruppe ausw?hlen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CP_GROUP', 'DE', 'Verbund-Gruppe', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COLOR', 'DE', 'Farbe', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COMB_ALL', 'DE', 'Alles ausw?hlen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COMB_NONE', 'DE', 'Auswahl entfernen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COMMENT', 'DE', 'Kommentar', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTENT', 'DE', 'Inhalt', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTENT_DESC', 'DE', 'Beschreibung des Inhalts', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_NAME', 'DE', 'Cluster-Name', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CAL_NAME', 'DE', 'Kalender-Name', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CATEGORY', 'DE', 'Kategorie', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CAT_NAME', 'DE', 'Kategorie', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLEAR_MEDIA', 'DE', 'Datei aus Datenbank entfernen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLK_PATHS', 'DE', 'Click-Pfade', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CAL_EDIT', 'DE', 'Termin bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CALENDAR_SELECT', 'DE', 'Kalender ausw?hlen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CALENDARS_EDIT', 'DE', 'Kalender bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CALENDARS_TIPP', 'DE', 'Sie k?nnen hier verschiedene Kalender erstellen. Jeder Kalender wird seine eigenen Termine und Ereignisse haben.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CALENDARS_DEFINE', 'DE', 'Kalender definieren', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CALENDAR', 'DE', 'Kalender', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CALENDARS', 'DE', 'Kalender', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CALENDARS_CAT_DEFINE', 'DE', 'Kategorien definieren', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CACHED', 'DE', 'Seite zwischenspeichern (cache)', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BEGIN', 'DE', 'Zu Beginn', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BAK_FILE', 'DE', 'Sicherungs-Datei', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BACKUP', 'DE', 'System-Sicherung', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BACK_INFO', 'DE', 'Die untenstehende Liste zeigt die auf Ihrem Server verf?gbaren N/X-Sicherungen an. Sie k?nnen hier einzelne Sicherungen l?schen. Um eine Sicherung zur?ck zu spielen, m?ssen Sie sich manuell auf Ihrem Server einloggen und die Dateien wiederherstellen.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AVG_VIS_LENGTH', 'DE', 'durchschnittliche Besuchsdauer (Sekunden)', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AVG_VISIT_LENGTH', 'DE', 'durchschnittliche Besuchsdauer', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AVG_CLICKSTREAM', 'DE', 'durchschnittlicher Click-Pfad', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AVAIL_VARIATIONS', 'DE', 'Verf?gbare Variationen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AVERAGE', 'DE', 'Durchschnitt', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_PARENT', 'DE', 'Berechtigungen geerbt von', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_ROLE', 'DE', 'Rollen f?r Gruppe ausw?hlen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_TITLE', 'DE', 'Setze Berechtigungen f?r', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AFTER', 'DE', 'Nach:', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ALC_OWNER', 'DE', 'Besitzer festlegen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AVAIL_ITEMS', 'DE', 'Verf?gbare Elemente', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_INHERIT_NOTE', 'DE', 'Hinweis: Wenn dieses Feld markiert ist, ist keine andere Konfiguration verf?gbar!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_OWNER', 'DE', 'Besitzer', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_GROUPS', 'DE', 'Hinzuzuf?gende Gruppe ausw?hlen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_GROUPSROLES', 'DE', 'Fremdzugriff', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_INFO', 'DE', 'Zugriffsrechte vom Elternobjekt geerbt', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_INHERIT', 'DE', 'Berechtigungen vom Elternobjekt erben', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_EXPIRED', 'DE', 'Deaktivierte Seiten bereinigen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_ACCESS', 'DE', 'Berechtigungen in Gruppen berabeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_GROUPEDIT', 'DE', 'Gruppe f?r Rollen-Bearbeitung ausw?hlen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_META', 'DE', 'Meta bereinigen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_CLT', 'DE', 'Cluster-Vorlagen bereinigen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_PAGES', 'DE', 'Sitepages und Master bereinigen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_FOLDER', 'DE', 'Ordner bereinigen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_CLUSTER', 'DE', 'Cluster bereinigen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VAR_SUCCEEDED', 'DE', 'erfolgt!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_VAR', 'DE', 'Variationen bereinigen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_CONTENT', 'DE', 'Inhalt bereinigen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ERROR', 'DE', 'W?hrend der Ausf?hrung der gew?hlten Operation ist ein Fehler aufgetreten!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE', 'DE', 'Datenbank bereinigen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_MES', 'DE', 'Bitte w?hlen Sie die Teile der Datenbank, die Sie bereinigen m?chten.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RESET', 'DE', 'Formular zur?cksetzen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BACK', 'DE', 'Zur?ck', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATE', 'DE', 'Element erstellen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCH_LIVE_ACRTICLES', 'DE', 'Ver?ffentlichte Artikel', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEASRCH_MISSING_VARIATIONS', 'DE', 'Fehlende Variationen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_CH', 'DE', 'Kanal ausw?hlen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_CLUSTER', 'DE', 'Cluster ausw?hlen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_EVENT', 'DE', 'Ereignis oder Termin speichern', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_PTML', 'DE', 'Seiten-Vorlage ausw?hlen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_VAR', 'DE', 'Variation ausw?hlen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SHOW', 'DE', 'anzeigen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SHOW_ADVANCED_SEARCH', 'DE', 'erweiterte Suchoptionen anzeigen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SHOW_ALL', 'DE', 'Alles anzeigen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SHOW_PAGEWISE', 'DE', 'Seitenweise anzeigen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STARTDATE', 'DE', 'Startdatum', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STARTTIME', 'DE', 'Startzeit', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SYNC_CLUSTERS_DESCR', 'DE', 'Wenn Sie eine Cluster-Vorlage ?ndern, werden die Cluster nicht automatisch synchronisiert. Sie werden synchronisiert, wenn Sie das n?chste mal mit ihnen arbeiten. Hier k?nnen Sie alle manuell synchronisieren.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_ENTRYPAGES', 'DE', 'Top Eingangsseiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_EXITPAGES', 'DE', 'Top Ausgangsseiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_PAGES', 'DE', 'Top Seiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TRANS_TEMPL', 'DE', '?bersetzen von', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TRANS_THIS', 'DE', '?bersetzen Sie:', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('UPL_TEXT', 'DE', 'Text-Datei hochladen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_ARTICLEIMPORT_SRCTYPE', 'DE', 'Bitte geben Sie den Quellen-Typ an, aus dem Sie die Artikel importieren m?chten.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_ARTICLEIMPORT_TARGET', 'DE', 'Bitte w?hlen Sie rechts den Ziel-Kanal aus. Alle importierten Artikel werden in diesem Kanal gespeichert.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_ARTICLEIMPORT_SRCTYPE', 'DE', 'Quellen-Typ ausw?hlen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_ARTICLEIMPORT_TARGET', 'DE', 'Ziel-Kanal ausw?hlen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_KEEPCLUSTER', 'DE', 'Bestehende Cluster beibehalten?', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_KEEPCLUSTER_EXPL', 'DE', 'Sie k?nnen festlegen, ob Sie die bestehenden Cluster beibehalten m?chten oder lieber Kopien von jedem Cluster anlegen wollen.<br><br>Beachten Sie: Wenn Sie die bestehenden Cluster beibehalten, teilen Sie sie sich mit der urspr?nglichen Quelle.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZ_ARTICLEIMPORT', 'DE', 'Artikel-Import Assistent', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZ_ARTICLEIMPORT_TITLE', 'DE', 'Der Assistent hilft Ihnen, Artikel  aus unterschiedlichen Quellen in einen Kanal zu laden.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_JS', 'EN', 'Use Javascript', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_BL', 'EN', 'Backend Language', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_BROWSER', 'EN', 'Portal Browser', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_OWNER', 'EN', 'Page owner', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_CRSUCCEEDED', 'EN', 'The creation of a new portal page succeeded!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_MYPORTAL', 'EN', 'My Portals', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_EDIT', 'EN', 'Edit Portalpage', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_BROWSE', 'EN', 'Browse Sitemap', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_NEWPAGE', 'EN', 'Add Page', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_NEWINSTANCE', 'EN', 'Add Page', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_IPROPERTIES', 'EN', 'Page Properties', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_PROPERTIES', 'EN', 'Sitepage Properties', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_DELMES', 'EN', 'You are about to delete a sitepage. Please note, that also the LIVE-Instance of this sitepage will be deleted!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_DELETE', 'EN', 'Delete Sitepage', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_PDELMES', 'EN', 'You are about to delete a page. Please note, that also the LIVE-Instance of this page will be deleted!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_PDELETE', 'EN', 'Delete Page', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_CONFIGURE', 'EN', 'Configure Page', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_CONFDESC', 'EN', 'You can link this sitepage to an existing instance of the Cluster or you can create a new instance. Please decide, what you like to do.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_LINK', 'EN', 'Link to existing cluster instance', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_CLNEW', 'EN', 'Create Cluster', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_EDIT', 'EN', 'Edit Sitepage', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUPROPS', 'EN', 'Menu Name and Helptext', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUNAME', 'EN', 'Name on Menu', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUHELP', 'EN', 'Helptext for Menu', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_LAUNCHDATE', 'EN', 'Active from', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_EXPIREDATE', 'EN', 'Expired from', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_LAUNCHDATES', 'EN', 'Live Time Configuration', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_PREVIEW', 'EN', 'Preview Page', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_LAUNCH', 'EN', 'Launch Page', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_EXPIRE', 'EN', 'Expire Page', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOSPTITLE', 'EN', 'You must define the Name on Menu before you can launch the page!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACTIVE', 'EN', 'Show Page in Menu', 'When you uncheck this box, the page will no longer be displayed in the menu of the website.');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM', 'EN', 'Sitepage Master', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_EDIT', 'EN', 'Edit Sitepage Master', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_META', 'EN', 'META-Key Template', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_VARIATIONS', 'EN', 'Displayable Variations', 'Select the variations, this template is valid for. If you have languages as variations, you should select all languages.');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_TYPE', 'EN', 'Page Type', 'Please select always singlepage. Multipage is mature and is there for compatiblity reasons only. Use channels instead.');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_CLUSTER', 'EN', 'Cluster Template', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_PATH', 'EN', 'Template Path', 'Filename of the php-file which will be called when you use the page. The file will be created in wwwdev and copied to www after launch.');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_BROWSE', 'EN', 'Browse Clusters', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_NEW', 'EN', 'Create Cluster', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_PROPERTIES', 'EN', 'Cluster Properties', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_DEL', 'EN', 'Delete Instance', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_DELMES', 'EN', 'Do you really want to delete this instance of the cluster. All content data will be lost!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_EDIT', 'EN', 'Edit Cluster-Instance', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_CREATEINSTANC', 'EN', 'Create new Instance', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_CREATEINSMES', 'EN', 'There are still slots left for creating additional instances of this content-field. If you want to create another instance, then enter a title in the textfield below and press the Create button.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_NOTITLE', 'EN', 'No title defined yet', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TITLE', 'EN', 'Title', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_EDIT', 'EN', 'Edit Cluster member', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_DELETE', 'EN', 'Delete Cluster member', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_DELETEMES', 'EN', 'Do you really want to delete this cluster. It will be lost forever!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_DELETED', 'EN', 'The cluster has been deleted!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_NOTDELETED', 'EN', 'This cluster cannot be deleted!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI', 'EN', 'Cluster:', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SR_SELECTCI', 'EN', 'You can search for any content-items here. If you want to select a content-item, then choose it and press the Update button! If you want to connect new content with this field, create the content in the Object Browser first.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SR_SELECTCLI', 'EN', 'Please select a cluster-template. Afterwards you can select an instance of the template for use.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FOLDER', 'EN', 'Folder', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTENTTYPE', 'EN', 'Content-Type', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTENTITEM', 'EN', 'Content-Item', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCH', 'EN', 'Start Search', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCHIN', 'EN', 'Search for', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCHRESULTS', 'EN', 'Search results, please select', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECTEDOBJECT', 'EN', 'Currently Selected Content-Item', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECTEDINSTANCE', 'EN', 'Selected Cluster-Instance', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_META', 'EN', 'Meta Templates', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_BROWSER', 'EN', 'Object Browser', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_INSTALLPLUGIN', 'EN', 'PlugIns', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_ES', 'EN', 'Explore Site', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_SPM', 'EN', 'Sitepage-Master', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_PRTMAN', 'EN', 'Portal Manager', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_MYPRT', 'EN', 'My Portals', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_MYPROFILE', 'EN', 'My Profile', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_LOGOUT', 'EN', 'Logout', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_CLB', 'EN', 'Cluster Browser', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_CLTB', 'EN', 'Cluster-Template Browser', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_UMAN', 'EN', 'User Mangement', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_VAR', 'EN', 'Variations', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_PURGE', 'EN', 'Purge Database', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_PGN', 'EN', 'Plugin Control', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_REPORT', 'EN', 'Site Report', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_NEW', 'EN', 'New CL-Template', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_BROWSE', 'EN', 'Browse CL-Templates', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_NAME', 'EN', 'CL-Template Name', 'Name of the cluster-tempalte. You can edit cluster templates in Templages &amp;gt; Custer-Templates.');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_PROPERTIES', 'EN', 'Cluster-Template Properties', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_DELETE', 'EN', 'Delete Cluster-Template', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_DELMES', 'EN', 'You are about to delete a cluster-template. This will cause the loss of all(!) contents created on and with that cluster-template. Are you sure, you want to procceed?', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLTI_DELETE', 'EN', 'Do you really want to delete this Item. All instances of this item will be lost also!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_SCHEME', 'EN', 'Edit Cluster-Template Scheme', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_MINCARD', 'EN', 'Instances', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_MAXCARD', 'EN', '-', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LINKED', 'EN', 'Linked to', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_INSTALLDESC', 'EN', 'Please make sure that you copied all neccessary files into the folder, before succeeding. Insert the correct path to the plugin in the Input-field below. The system will then install the PlugIn automatically.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_CHOOSE', 'EN', 'PlugIn: ? /plugin/', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_FILEWRONG', 'EN', 'The filename you entered could not be found on the server!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLASS_WRONG', 'EN', 'The file you specified has no valid class signature!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_INSTALLED', 'EN', 'The PlugIn was successfully installed!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_UPGRADED', 'EN', 'The PlugIn was successfully upgraded!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_ERROR', 'EN', 'There was an error while installing the plugin!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_ALREADYINSTAL', 'EN', 'The PlugIn is already installed!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_NEWERINSTALLE', 'EN', 'There is already a newer version of this PlugIn installed!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_TITLE', 'EN', 'PlugIns', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_INSTALL', 'EN', 'Install PlugIn', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_UNINSTALL', 'EN', 'UnInstall PlugIn', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_UNINSTALLMES', 'EN', 'You are about to uninstall a module. UnInstalling a module does not only remove the content-type but also deletes every single object of this type that is stored in the database. The uninstallation will definitely delete all(!) data of this module!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_UNINSTALLDELE', 'EN', 'Uninstall Module,<br> Delete all correspondig contents.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_NEW', 'EN', 'New Object', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_NAME', 'EN', 'Object Name', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_PROPERTIES', 'EN', 'Object Properties', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_DELMES', 'EN', 'You are about to delete an object. <b>Note that all variations and META-DATA will be lost!</b>', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_DEL', 'EN', 'Delete object', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_EDIT', 'EN', 'Edit Object', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_PREVIEW', 'EN', 'Preview of', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_TEXT', 'EN', 'Text', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_ALT', 'EN', 'ALT-Tag', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_COPYRIGHT', 'EN', 'Copyright', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_BROWSE', 'EN', 'Browse Objects', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_HOME', 'EN', 'Start', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_NEWFOLDER', 'EN', 'New Folder', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_EDITFOLDER', 'EN', 'Edit Folder Properties', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_FOLDERNAME', 'EN', 'Folder Name', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_DELETEFOLDER', 'EN', 'Delete Folder', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_DELFOLDERMES', 'EN', 'You are about to delete a Folder.  Please select an action.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_FOLDERNOTEMPTY', 'EN', 'The folder is not empty. So you cannot delete it! Please check all Objects and Clusters!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_DELFOLDER', 'EN', 'Delete Folder and all child objects', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_MOVEOBJECTS', 'EN', 'Move all objects to parent node', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_PARENT', 'EN', 'Parent Folder', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('METATEMPLATES', 'EN', 'Meta-Data Templates', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_PROPERTIES', 'EN', 'Edit Meta-Template Properties', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_SCHEME', 'EN', 'Edit Meta-Template Scheme', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_DELETE', 'EN', 'Do you really want to delete this part of the meta-template? All information entered in any META-Input in CMS linked to this part will be deleted. The data is going to be lost forever!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_ADDITIONAL', 'EN', 'Additional META-Data', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_BASE', 'EN', 'Basic META-Data', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_MODULE', 'EN', 'Content-Type specific META-Data', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VARIATIONS', 'EN', 'Available Variations', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('V_NAME', 'EN', 'Name', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('V_SHORT', 'EN', 'Short-Tag', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('V_EDIT', 'EN', 'Edit Variations', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOGIN_FAILED', 'EN', 'The login data you entered could not be verified! Please try again.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_HEAD', 'EN', 'User profile', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_LINK', 'EN', 'User profiles', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_NAME', 'EN', 'Username', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FULL_NAME', 'EN', 'Full Name', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PASSWORD', 'EN', 'Password', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_EMAIL', 'EN', 'eMail', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_ACTIVE', 'EN', 'Account Enabled', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_FILTERMENU', 'EN', 'User Administration', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_SETPERM', 'EN', 'Set User Permissions below. To remove a user form a group, just revoke all groups from him.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_PERMGRID', 'EN', 'Permission Grid', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_LINK', 'EN', 'Group profiles', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_HEAD', 'EN', 'Group profile', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_NAME', 'EN', 'Group name', 'You can create groups of clusters, e.g. banners, and name these groups.');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_DESCRIPTIO', 'EN', 'Description', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_FILTERMENU', 'EN', 'Group Administration', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_LINK', 'EN', 'Role profiles', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_HEAD', 'EN', 'Role profile', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_NAME', 'EN', 'Role name', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_DESCRIPTION', 'EN', 'Description', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_FILTERMENU', 'EN', 'Role Administration', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_PERMISSIONS', 'EN', 'User Permissions', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('UP_INTRO', 'EN', 'Please select the group and the roles in the group, you want to add to the user.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_TO_GROUP', 'EN', 'Add user to group', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ERROR_SEL_GROUP', 'EN', 'You must select a group!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ERROR_SEL_ROLE', 'EN', 'You must select at least one role!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_PROFILE', 'EN', 'My Profile', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COMMIT', 'EN', 'Commit', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CANCEL', 'EN', 'Cancel', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('YES', 'EN', 'Yes', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO', 'EN', 'No', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEW', 'EN', 'Create New', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NAME', 'EN', 'Name', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DESCRIPTION', 'EN', 'Description', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DOSOMETHING', 'EN', 'Please select the action you want to do. You can insert new items, edit items, delete items and change the order of items.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT', 'EN', 'Edit', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('UP', 'EN', 'Up', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DOWN', 'EN', 'Down', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTAINERNAME', 'EN', 'Template', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECTOBJECT', 'EN', 'Please select a class and specify a position and a name for creating a new object.<br>For position use 0 for inserting at the begin, 999 for inserting at the end and any other position of your choice.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('POSITION', 'EN', 'Position', 'Pages are ordered by their position in the tree of the website.');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DELETE', 'EN', 'Delete', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TYPE', 'EN', 'Type', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('KEYWORDS', 'EN', 'Keywords', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('METATEMPLATE', 'EN', 'Additional META-Key-Template', 'Select a Meta-Template if you want to add meta-data to a cluster.');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECT_VARIATION', 'EN', 'Select Variation', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACTIVE_VARIATION', 'EN', 'Active Variation:', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_VARIATIONS', 'EN', 'There are currently no variations of this object defined!<br>Please call a developer for checking the configuration of the selected item!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_CONTENT', 'EN', 'Edit Content', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_META', 'EN', 'Edit META-Data', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_DISPATCHER', 'EN', 'Use this button for switching between Editing of META-Data and Editing of Content.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PREVIEW', 'EN', 'Preview', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHOOSEFILE', 'EN', 'Choose a file', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONFIGURED', 'EN', 'Ready to use.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOTCONFIGURED', 'EN', 'Not configured yet.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONFIG', 'EN', 'Configure', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECT_CI', 'EN', 'Select a Content-Item', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECT_CL', 'EN', 'Select a Cluster-Instance', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EMPTY', 'EN', '<empty>', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STATUS', 'EN', 'Status:', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('UNIQUE', 'EN', 'The value you entered already exsists whether in another item or in the dustbin.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MANDATORY', 'EN', 'This field cannot be empty!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOTNUMBER', 'EN', 'You must enter a number into this field!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WRONGDATE', 'EN', 'The date you entered, does not exist!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PWDNOTMATCH', 'EN', 'The passwords you entered do not match!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PWDTOOSHORT', 'EN', 'The password must be at least 6 chars!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PROCERROR', 'EN', 'An error occured while processing the form. Please check the marked fields and read there for further information.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SAVEERROR', 'EN', 'An error occured while saving the data to the database. Please make sure, the database is connected or call your Administrator.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SAVESUCCESS', 'EN', 'The data was successfully written to the database.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DELETESUCCESS', 'EN', 'The data listed below was successfully deleted from the database. It is now lost!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECTONE', 'EN', 'You must make a choice here!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATENEW', 'EN', 'A new member of this template was created. See the data listed below.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PROMPTDELETE', 'EN', 'Do you really want to delete this dataset? This action cannot be undone!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RESET', 'EN', 'Reset Form', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BACK', 'EN', 'Back', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATE', 'EN', 'Create Item', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ERROR', 'EN', 'An error occured while doing the selected operation!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE', 'EN', 'Purge Database', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_MES', 'EN', 'Please select the parts of the database, you want to purge.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_VAR', 'EN', 'Purge Variations', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_CONTENT', 'EN', 'Purge Content', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VAR_SUCCEEDED', 'EN', 'succeeded!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_FOLDER', 'EN', 'Purge Folders', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_CLUSTER', 'EN', 'Purge Cluster', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_META', 'EN', 'Purge Meta', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_CLT', 'EN', 'Purge Cluster-Templates', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_PAGES', 'EN', 'Purge Sitepages and Masters', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_EXPIRED', 'EN', 'Purge Expired Pages', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT_ALL', 'EN', 'Edit All', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SAVE', 'EN', 'Save', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LIVE_AUTHORING', 'EN', 'Live Authoring', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('INSTANCE_CREATED', 'EN', 'A new instance of the item was created.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GO', 'EN', 'GO', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CACHED', 'EN', 'Cache Page', 'N/X is able to create static HTML-files for the website. Whenever the\r\ncheckbox is checked, the system will create a static HTML-page.');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MENU', 'EN', 'Menu', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RB_CACHE', 'EN', 'Rebuild Cache', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOGGED_AS', 'EN', 'Logged in as', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_ACCESS', 'EN', 'Access', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_MAINTENANCE', 'EN', 'Maintenance', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_WWW', 'EN', 'Website', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_TEMP', 'EN', 'Templates', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_ROLLOUT', 'EN', 'Rollout', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_LIB', 'EN', 'Library', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_COMBOBJ', 'EN', 'Combined Contents (Cluster)', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_CLT', 'EN', 'Cluster Templates', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RL_PERM', 'EN', 'Role Permissions', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_TITLE', 'EN', 'Maintenance', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_GENERATE_DTA', 'EN', 'Generate DataTypes', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_DW_CONTENTFIE', 'EN', 'Dreamweaver Content-Field-Info', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_GENERATE_DTA_', 'EN', 'generates DataTypes', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DWEXT_CONTENTFIE', 'EN', 'Generate Content-Field-Information', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_RLAUNCH', 'EN', 'Refresh instances', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_RLTREE', 'EN', 'Refresh Tree', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUDIRECTTIT', 'EN', 'Define optinal Path on server for direct access', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUDIRECT', 'EN', 'Direct url on Live Server', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TMPL_NAME', 'EN', 'Select a template', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STNAME', 'EN', 'Select a name to identify this page in the sitemap', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('POS_IN_MENU', 'EN', 'Position in sitemap', 'Pages are ordered by their position in the tree of the website.');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CR_CONTENT', 'EN', 'Create Content for this page?', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLEAR_MEDIA', 'EN', 'Remove file from database', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DESC', 'EN', 'Description', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOCATION', 'EN', 'Location, if external', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTENT', 'EN', 'Content', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_CLUSTERS', 'EN', 'Clusters', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_PTEMP', 'EN', 'Page Templates', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_SPIDER', 'EN', 'Run Spider', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_DW_CONTENTFIELDINFO', 'EN', 'Dreamweaver Content-Field-Info', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOGS', 'EN', 'Logfile Analysis', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TESTS', 'EN', 'N/X Unit Tests', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_ADMIN', 'EN', 'Administration', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_BACKUP', 'EN', 'Backup', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_TRANSLATION', 'EN', 'Translation', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PTEMPL', 'EN', 'Page Template', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUDIRECTTITLE', 'EN', 'Define optional Path on server for direct access', 'Sometimes you may want to access a page with a name instead of an IP-address, e.g.\r\nwww.news.fi/oulu instead of www.news.fi/www/p100211_v1.html. You enter\r\nthe Path here.');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LIBRARY', 'EN', 'Content Library', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEW_CONTENT', 'EN', 'New Content', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEW_FOLDER', 'EN', 'Create Folder', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT_FOLDER', 'EN', 'Edit Folder', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DEL_FOLDER', 'EN', 'Delete Folder', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT_ACCESS', 'EN', 'Set Access', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USAGE', 'EN', 'Usage', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LAUNCH', 'EN', 'Launch', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AVAIL_VARIATIONS', 'EN', 'Available variations', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_CONTENTS', 'EN', 'No Contents available in this folder.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT_CONTENT', 'EN', 'Edit Content', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTENT_DESC', 'EN', 'Description of Content', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SAVE_BACK', 'EN', 'Save and Back', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PROPERTIES', 'EN', 'Properties', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RESET_FORM', 'EN', 'Reset Form', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_CLUSTER_SELECTED', 'EN', 'No cluster selected.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATE_INSTANCES', 'EN', 'Create instances', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NUMBER_OF_INSTANCES', 'EN', 'Please specify how many instances you want to create', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TIPP_TEMPLATE_1', 'EN', 'Templates are the basis of every output with N/X. You will need to create a cluster-template first, which defines the structure and the kind of contents. Afterwards you can create the page-templates here by merging a cluster-template and php-file.<br><br>', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_THUMBNAIL', 'EN', 'Thumbnail', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP', 'EN', 'Help', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXPLORE', 'EN', 'Explore', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FILTER_RULE', 'EN', 'Search for...', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FILTER_COLUMN', 'EN', '...in', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCH_CLEAR', 'EN', 'Reset Filter', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_CPGROUP', 'EN', 'Edit Compound Group', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_DESCRIPTION', 'EN', 'Description', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ORDER', 'EN', 'By order', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ORDERCOMP', 'EN', 'Order of Compounds', 'Set the order in which clusters, e.g. banners, appear.');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_CPGROUPGENERAL', 'EN', 'Edit Group General', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CPG_MEMBERS_SELECT', 'EN', 'Select members of this compound group', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AVAIL_ITEMS', 'EN', 'Available items', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_MEM', 'EN', 'Selected members', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COMB_ALL', 'EN', 'Select All', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COMB_NONE', 'EN', 'Clear All', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_DW_CONTENT', 'EN', 'Dreamweaver Plugin', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_GENERATE_DTA_MES', 'EN', 'generates DataTypes', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_GENERATE_DTA_SUCCEEDED', 'EN', '<br><br>DataTypes were successfully generated and file was written.<br>', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('START_BAK', 'EN', 'Start Backup', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BACKUP', 'EN', 'System Backup', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BACK_INFO', 'EN', 'The list below shows you the backups of N/X on your server. You can delete the backups here. To restore a backup,you need to manually log in your server and restore the files yourself.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BAK_FILE', 'EN', 'Backup file', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('IS_COMPOUND', 'EN', 'Compound Cluster Template', 'Enable cluster to have its own layout-template by checking this box.');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TEMPLATE', 'EN', 'Template', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('OVERVIEW', 'EN', 'Overview', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VISITORS', 'EN', 'Visitors', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PAGES', 'EN', 'Pages', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WEEKDAY', 'EN', 'Weekdays', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HOUR', 'EN', 'Hours', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('REFERER', 'EN', 'Referer', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ENVIRONMENT', 'EN', 'Environment', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PATHS', 'EN', 'Clickpaths', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STATS_HEADER', 'EN', 'N/X 2004 Traffic Statistics', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VISITS_OVERVIEW', 'EN', 'Visits overview', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VISITS', 'EN', 'Visits', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOTAL', 'EN', 'Total', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AVERAGE', 'EN', 'Average', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MEDIAN', 'EN', 'Median', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MAXIMUM', 'EN', 'Maximum', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MAXIMUMAT', 'EN', 'Maximum at', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MINIMUM', 'EN', 'Minimum', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MINIMUMAT', 'EN', 'Minimum at', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PI_OVERVIEW', 'EN', 'Page Impressions overview', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PI', 'EN', 'Page Impressions', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TF', 'EN', 'Time Frame', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PREDEF_TIME', 'EN', 'Predefined timeframe', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TODAY', 'EN', 'Today', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('YESTERDAY', 'EN', 'Yesterday', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('THISWEEK', 'EN', 'This Week', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LASTWEEK', 'EN', 'Last Week', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('THISMONTH', 'EN', 'This Month', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LASTMONTH', 'EN', 'Last Month', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('THISYEAR', 'EN', 'This Year', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LASTYEAR', 'EN', 'Last Year', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('IND_TIME', 'EN', 'Individual timeframe', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SET', 'EN', 'Set', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PRINT', 'EN', 'print', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_TITLE', 'EN', 'Setting permissions for', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_INHERIT', 'EN', 'Inherit permissions from parent', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_INHERIT_NOTE', 'EN', 'Note: When the box is checked, there is no other configuration available!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_INFO', 'EN', 'Inherited Access from parent', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_PARENT', 'EN', 'Permissions inherited from', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_GROUPSROLES', 'EN', 'Foreign Access', 'Declare groups, who you allow to access this object.');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ALC_OWNER', 'EN', 'Set owner', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_OWNER', 'EN', 'Owner', 'The members of this group have Administrator role on this ressource');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_ACCESS', 'EN', 'Edit permissions in groups on', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_GROUPS', 'EN', 'Select Group to add', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_GROUPEDIT', 'EN', 'Select group to edit roles', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_ROLE', 'EN', 'Select roles for group', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELMULTIPLE', 'EN', 'Hold down the CTRL-Key to select multiple items!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECT', 'EN', 'Select', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CP_GROUP', 'EN', 'Compound Group', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT_TEMPLATE', 'EN', 'Edit template', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT_SPM', 'EN', 'Edit template properties', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('OK', 'EN', 'Ok', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FOLDER_DELMES', 'EN', 'Do you really want to delete this folder?', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RATERES', 'EN', 'Rate Results', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DISPLAY', 'EN', 'Display', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PAGE', 'EN', 'Page', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COMMENT', 'EN', 'Comment', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DATE', 'EN', 'Date', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SMA_EXT_EDIT', 'EN', 'Open edit window. Save all inline edited texts before!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PGNTXT_SMA', 'EN', 'Save all edited texts on the page', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AVG_VISIT_LENGTH', 'EN', 'Average visit length', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AVG_CLICKSTREAM', 'EN', 'Average clickstream', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VIS_ONL', 'EN', 'Visitors online', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WHEN', 'EN', 'When', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RET_VIS', 'EN', 'Returning visitors', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VIS_FIRST', 'EN', 'First time visitors', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VIS_RET', 'EN', 'Returning visitors', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TIME_BETW_VISITS', 'EN', 'Average time between visits', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VIS_PER_VIS', 'EN', 'Average visits per visitor', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AVG_VIS_LENGTH', 'EN', 'Average visit length (seconds)', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_BROWSER', 'EN', 'Top Browser', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RANK', 'EN', 'Rank', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COUNT', 'EN', 'Count', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PERCENT', 'EN', 'Percent', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_OS', 'EN', 'Top Operating Systems', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_HOSTS', 'EN', 'Top Hosts', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP', 'EN', 'Limit data', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('OTHERS', 'EN', 'Others', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLK_PATHS', 'EN', 'Clickpaths', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_PATHS', 'EN', 'Top paths', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PATH', 'EN', 'Path', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SHORTEST_PATHS', 'EN', 'Shortest paths', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LONGEST_PATHS', 'EN', 'Longest paths', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WEBSITE', 'EN', 'Website', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TRANSLATION', 'EN', 'N/X Translation System', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STATS', 'EN', 'Statistics', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOCK_MENU', 'EN', 'Lock Menu', 'By locking a menu, a developer can prevent editors from creating sub pages for a page.');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_PERMISSION', 'EN', 'Edit user permissions', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USERPERM_HEAD', 'EN', 'Edit user permissions', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_GENERAL', 'EN', 'Edit general user data', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('IS_FILTERED', 'EN', 'Note: You may not display all records because you are using a filter!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_REFERER', 'EN', 'Top referer', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_SI', 'EN', 'Top search engines', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_SKW', 'EN', 'Top search keywords', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_EXITT', 'EN', 'Top exit targets', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HOURS_AS', 'EN', 'Hour Analysis', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WEEKDAY_AS', 'EN', 'Weekday Analysis', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('I_AFTER', 'EN', 'Insert after', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AFTER', 'EN', 'After:', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('REMAIN_POS', 'EN', 'Do not change position', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BEGIN', 'EN', 'Start', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_NAME', 'EN', 'Cluster Name', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('INSNAME', 'EN', '<Cluster Name>', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CAL_NAME', 'EN', 'Calendar Name', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CALENDARS', 'EN', 'Calendars', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CALENDARS_DEFINE', 'EN', 'Define Calendars', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CALENDARS_TIPP', 'EN', 'You can create several calendars here. Each calendar will have its own events and dates.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CALENDAR', 'EN', 'Calendar', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CALENDARS_EDIT', 'EN', 'Edit Calendar', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CALENDARS_CAT_DEFINE', 'EN', 'Define Categories', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CALENDAR_SELECT', 'EN', 'Select Calendar', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CAT_NAME', 'EN', 'Category', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CATEGORY', 'EN', 'Category', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COLOR', 'EN', 'Color', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CAL_EDIT', 'EN', 'Edit Appointment', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_PAGES', 'EN', 'Top pages', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_ENTRYPAGES', 'EN', 'Top entry pages', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_EXITPAGES', 'EN', 'Top exit pages', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_EVENT', 'EN', 'Select Event or Appointment', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STARTDATE', 'EN', 'Startdate', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STARTTIME', 'EN', 'Starttime', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ENDATE', 'EN', 'Enddate', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ENDTIME', 'EN', 'Endtime', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CAL_BTO', 'EN', 'Back to Overview', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_PERMISSION', 'EN', 'Edit role permissions', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_GENERAL', 'EN', 'Edit general role data', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ADD_LINK', 'EN', 'Add Link', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ADDITIONAL_LINK', 'EN', 'Additional Link', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ADDITIONAL_IMAGE', 'EN', 'Additional Image', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_OBJ', 'EN', 'No object selected.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLEAR', 'EN', 'Clear', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FIND_OBJ', 'EN', 'Find Object', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PREV_AVAIL', 'EN', 'You selected an object. A preview will be available after saving.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOT_SPECIFIED', 'EN', 'Any type', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CMPTYPE', 'EN', 'Compound type:', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('INSTANCES_CREATED', 'EN', 'New instances of the item have been created.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONFIRM_DELETE', 'EN', 'Do you really want to delete this item?', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOT_SELECTED', 'EN', 'No item selected yet.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_CONTENT', 'EN', 'No content entered yet.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LEAVE_EMPTY', 'EN', 'Leave empty.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GOTO_CL', 'EN', 'Goto Cluster', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_EXPIRE', 'EN', 'Expire Cluster', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_LAUNCH', 'EN', 'Launch Cluster', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('OBJLAUNCH_SUCCESS', 'EN', 'The object was successfully launched.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_CLUSTER', 'EN', 'There are no clusters.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BACK_TO_CV', 'EN', 'Back to cluster overview', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATED_AT', 'EN', 'Created at', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BY', 'EN', 'by', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LAST_MOD_AT', 'EN', 'Last Modified at', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLUSTER_INFORMATION', 'EN', 'Information about this record', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LAST_LAUNCHED_AT', 'EN', 'Last Launched at', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_CHANNELS', 'EN', 'Channels', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ARTICLES', 'EN', 'Articles', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CH_ADMIN', 'EN', 'Channel Administration', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CH_CAT', 'EN', 'Define Categories', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHANNELS', 'EN', 'Channels', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHANNEL', 'EN', 'Channel', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHANNEL_SELECT', 'EN', 'Select Channel', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AUTHOR', 'EN', 'Author', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDITED', 'EN', 'Edited', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATED', 'EN', 'Created', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_ARTICLE', 'EN', 'Select Article', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('IN_CHANNEL', 'EN', 'in channel', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT_ARTICLE', 'EN', 'Edit Article', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BACK_TO_OVERVIEW', 'EN', 'Back to Overview', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATE_ARTICLE', 'EN', 'Create new Article in channel', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AR_LAUNCH', 'EN', 'Launch Article', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_SELECT', 'EN', 'Select cluster templates', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT', 'EN', 'Cluster Template', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEW_ARTICLE', 'EN', 'New Article', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AR_EXPIRE', 'EN', 'Expire Article', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DWEXT_CONTENTFIELDINFO', 'EN', 'Generate Content-Field-Information', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DWEXT_CONTENTFIELDINFO_MES', 'EN', 'generates Content-Field-Information for Dreamweaver MX', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DEL_ARTICLE', 'EN', 'Do you really want to delete this article in all variations?', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('READY_TO_USE', 'EN', 'Ready to use.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_CHANNEL_CAT', 'EN', 'Select Channel and Category', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ALL', 'EN', 'All', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ORDERART', 'EN', 'Order of Articles', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NUM_OF_ART', 'EN', 'Number of articles (999 = infinite)', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CH_CAT2', 'EN', 'Channel and Category', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DESTROY_TREE', 'EN', 'Destroy Tree', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DESTROY_EXCLUSIVE_CONTENT', 'EN', 'Destroy exclusive content', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AUTH_GROUP', 'EN', 'Authentification', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SYNC_CLUSTERS', 'EN', 'Synchronize Clusters', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SYNC_CLUSTERS_DESCR', 'EN', 'Whe you are changing a cluster template, the clusters are not automatically synched. They are synched when you are working with them the next time. You can sync all of them here.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_EXPORT_WZ', 'EN', 'Export Wizzard', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_IMPORT_WZ', 'EN', 'Import Wizzard', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_HELP', 'EN', 'Help', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MH_GETSTART', 'EN', 'Getting Started', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MH_GLOSSARY', 'EN', 'Glossary', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DELETE_PAGE', 'EN', 'Delete Page', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TT_REFRESH', 'EN', 'Refresh Instances updates the changes made to a template to cached pages.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TT_RSTCI', 'EN', 'Each page in N/X has a cluster. By pressing Reset ClusterInstance you can assign a new cluster to the page and remove the old one.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_SP', 'EN', 'Sitemap is used for editing site structure and pages.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_OBJBROWSE', 'EN', 'Content library contains all content material of the site', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_CLB', 'EN', 'Cluster is a collection of static dynamic content placeholders, which are either to be filled in by a developer or an editor of a webpage. The structure-definition within N/X is done with data clusters.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_CHANNEL', 'EN', 'Topic categories defining the contents of articles created by N/X. i.e. News, Persons', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_ROLLOUT', 'EN', 'Rollout is a feature of N/X that enables you to make copies of a section on your web page and re-use it with or without the old content.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXPORT_DATA', 'EN', 'Export Content and Templates Wizzard', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZ_EXPORT_TITLE', 'EN', 'This wizard is used to exchange clusters, cluster-templates and page-templates between your N/X installation and others. The wizard generates a XML File, which you can store on your local hard drive and exchange with other N/X-Users.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_EXPORT_TYPE', 'EN', 'Select type to export', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_EXPORT_TYPE', 'EN', 'On the right you need to select the type of data you want to export. Clusters are storing content. When you export clusters, the templates are automatically exported too. Cluster-Templates are schemes for creating clusters. Page-Templates are used for cre', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLUSTER', 'EN', 'Cluster', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLUSTER_TEMPLATE', 'EN', 'Cluster Template', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PAGE_TEMPLATE', 'EN', 'Page Template', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_SEL_EXP_RES', 'EN', 'Select Ressource for export', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_DESCR', 'EN', 'Add description', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_DESCR_EXPL', 'EN', 'You should add a short description to the exported data.<br/><br/> Anyone who will import the data will easier understand, what he exports.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXEC_EXPORT', 'EN', 'Exporting the ressource', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXPL_EXEC_EXPORT', 'EN', 'The system is generating a XML-File for export now.<br/><br/>In a few seconds, a popup will appear. Press Save for storing the Ressource on your harddisk.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXP_REPORT', 'EN', 'Exporting following data', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEXT', 'EN', 'Next', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STEP', 'EN', 'Step', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('IMPORT_DATA', 'EN', 'Import N/X-XML Data', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZ_IMPORT_TITLE', 'EN', 'This wizard is used for importing data to N/X, which has formerly been exported with another N/X installation. You must delete a resource before you can import it for a second time.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_IMPORT_FILE', 'EN', 'Select N/X-XML File', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_IMPORT_FILE', 'EN', 'Please choose a N/X-XML file from your harddisk for upload into the system.<br/><br/>The system will perform a check and will display status information on the next page.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_IMPORT_VAL', 'EN', 'Summary of uploaded xml', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_IMPORT_VAL', 'EN', 'The system has checked the correctness of the uploaded XML file. Read the report on the left for details.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_IMPORTING', 'EN', 'Importing data', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_IMPORTING', 'EN', 'The system has tried to import the data. Check the status on the right.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_FILE', 'EN', 'Select a file', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_PAGETEMP', 'EN', 'In spreadsheet and database applications, a template is a blank form that shows which fields exist, their locations, and their length. In N/X, templates are the basis of every output. A template is a form in which all the cells have been defined but no data has yet been entered.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_CLT', 'EN', 'Cluster template is a form that enables you to create structure for your site and define the type of contents. Afterwards, cluster template is merged with a page-template that includes the content of the web page.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_METATEMP', 'EN', 'A meta template is used for defining which metadata fields need to go on a new page. When you create a new metadata field in the template, each new page based on that template will contain that field.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_COMPGRP', 'EN', 'Compound group is a group of clusters. Clusters templates may have an own layout. This enables you to build your homepage out of blocks, e.g. News-Article, Poll, Image-Gallery all on one page and on demand.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_PURGE', 'EN', 'Deletes unnecessary information from the database.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_DW', 'EN', 'Creates a configuration-file for N/X Dreamweaver Plug-in. With the help of the Plug-in, templates can be developed with Dreamweaver.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_SYNCCL', 'EN', 'A feature used for synchronizing clusters after having modified/changed a cluster template.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_SYNC_CL', 'EN', 'Synchronize Clusters', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_PGN', 'EN', 'Plug-ins allow you to enhance N/X beyond its standard features. Typically, plug-ins are used to create new objects types in addition to the two standard object types text and image.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_BACKUP', 'EN', 'The list below shows you the backups of N/X on your server. You can delete the backups here. To restore a backup ,you need to manually log in to your server and restore the files yourself.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_VARIATION', 'EN', 'Content may have different variations. So variations can be languages or different profiles of content.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_ACCESS', 'EN', 'A feature used for creating and managing user profiles within N/X.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SHOW_PAGEWISE', 'EN', 'show pagewise', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SHOW_ALL', 'EN', 'show all', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NODE_ACCESS', 'EN', 'Set access for site root', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_SELECTTHUMB', 'EN', 'Select Thumbnail', 'Select a graphic which will be displayed if an editor creates a new page. You can upload your own icon-graphics to the folder cms/modules/sitepages/thumbnails.');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_PROPERTIES', 'EN', 'Edit Properties', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_CLT', 'EN', 'Edit Cluster Template', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXPL_SEL_CLUSTER', 'EN', 'After selecting a cluster-template, a list with clusters will appear, where you can select one.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_PTML', 'EN', 'Select Page-Template', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXPL_SEL_SPM', 'EN', 'Please select a page-template.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHANNEL_IMPORTARTICLES', 'EN', 'Import articles', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZ_ARTICLEIMPORT', 'EN', 'Article-Import Wizard', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZ_ARTICLEIMPORT_TITLE', 'EN', 'This wizard is used to import article data to a channel from different sources. You can import from existing Multipages or other channels. You have to make sure that the corresponding templates are compatible.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_ARTICLEIMPORT_TARGET', 'EN', 'Select target channel', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_ARTICLEIMPORT_TARGET', 'EN', 'On the right you need to select the target channel. All imported articles will be stored within this channel.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_CH', 'EN', 'Select Channel', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXPL_SEL_CH', 'EN', 'Please select a channel.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_ARTICLEIMPORT_SRCTYPE', 'EN', 'Select source type', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_ARTICLEIMPORT_SRCTYPE', 'EN', 'Please select the type of source you want to import the articles from.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MULTIPAGE', 'EN', 'Multipage', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COPY_CLUSTER', 'EN', 'Copy clusters', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('KEEP_CLUSTER', 'EN', 'Keep original Cluster', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ARTICLE_IS_EXPIRED', 'EN', 'Article is expired', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ARTICLE_IS_LIVE', 'EN', 'Article is live', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DISABLE', 'EN', 'Disable', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TRANS_TEMPL', 'EN', 'Translate from', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TRANS_THIS', 'EN', 'Translate this:', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_VAR', 'EN', 'Select Variation', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ARTICLE_VARIATION_MISSING', 'EN', 'Variation of this article does not exist yet', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SHOW_ADVANCED_SEARCH', 'EN', 'Display advanced search options', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCH_LIVE_ACRTICLES', 'EN', 'Live articles', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SHOW', 'EN', 'show', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HIDE', 'EN', 'hide', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCH_EXPIRED_ARTICLES', 'EN', 'Expired articles', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEASRCH_MISSING_VARIATIONS', 'EN', 'Missing variations', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MAINT_MODE', 'EN', 'Maintenance Mode', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MAINT_BB', 'EN', 'Backend Maintenance', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MAINT_WWW', 'EN', 'Live Website Maintenance', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('UPL_TEXT', 'EN', 'Upload text file', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_KEEPCLUSTER', 'EN', 'Keep existing clusters ?', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_KEEPCLUSTER_EXPL', 'EN', 'You can specify whether you want to keep the existing clusters or create copies of each cluster.<br><br>Keep in mind: if you keep the original clusters you sharen them with the original source.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_CLUSTER', 'EN', 'Select Cluster', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_CLUSTERTEMPLATES', 'EN', 'There are no cluster-templates.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RESET_LOGS', 'EN', 'Reset Logs', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOGFILE', 'EN', 'View System Logs', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOGS_INFO', 'EN', 'The list below shows you logs made while running N/X.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MESSAGE', 'EN', 'Message', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AGENT_WELCOME', 'EN', 'Welcome to N/X.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AGENT_GOHOME', 'EN', 'Go home!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AGENT_GOAWAY', 'EN', 'Hide and stay away!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AGENT_NXHOMEPAGE', 'EN', 'Visit N/X Homepage!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AGENT_CALLED', 'EN', 'you asked for me?', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AGENT_LOGOUT', 'EN', 'I hope you enjoyed working with N/X. Have a nice day!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AGENT_EXPLAINHOME', 'EN', 'You can find me by clicking the N/X-Logo in the upper-right corner of your browser.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_AGENT', 'EN', 'Use Agent', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLTPOSITION', 'EN', 'Position', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FONT', 'EN', 'Font name', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FONTSIZE', 'EN', 'Font size', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NUMBER', 'EN', 'Enter a number!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TEXT_STYLE', 'EN', 'Text Style', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TEXT_ALIGN', 'EN', 'Text Align', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TEXT_COLOR', 'EN', 'Text Color', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BG_COLOR', 'EN', 'Background Color', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WIDTH', 'EN', 'Width', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HEIGHT', 'EN', 'Height', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('INDIV_CONFIG', 'EN', 'Individual configuration for this item', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GR_TEXT', 'EN', 'Graphical Text', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_LAUCH_SUCCESS', 'EN', 'The pages based on this master were relaunched successfully.<br>', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONFIRM_UNSAVED_CHANGES', 'EN', 'Note: Unsaved changes will be lost if you proceed. If you have already edited something, you may cancel now and save your work. Proceed ?', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_SELECT', 'EN', 'Please select a cluster to link it into the cluster-template', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_HOME', 'EN', 'Home', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_EXCLUSIVE', 'EN', 'Developer Content', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BACK_SP', 'EN', 'Back to Website', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONFIRM_UNSAVED_CHANGES_LINKEDCL', 'EN', 'Note: When changing the linked cluster, any changes you apply on the currently linked cluster will be lost. If you want to save these canges, save your work first and change the linked cluster then. Proceed ?', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLLINK', 'EN', 'This box is linked to', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BACK_SP', 'DE', '', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BG_COLOR', 'DE', '', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLLINK', 'DE', '', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLTPOSITION', 'DE', '', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_EXCLUSIVE', 'DE', '', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_SELECT', 'DE', '', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONFIRM_UNSAVED_CHANGES_LINKEDCL', 'DE', '', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FONT', 'DE', '', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FONTSIZE', 'DE', '', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GR_TEXT', 'DE', '', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HEIGHT', 'DE', '', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_LW_SITE', 'EN', 'Launch whole site', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('INDIV_CONFIG', 'DE', '', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOGFILE', 'DE', '', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOGS_INFO', 'DE', '', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MESSAGE', 'DE', '', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_HOME', 'DE', '', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NUMBER', 'DE', '', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RESET_LOGS', 'DE', '', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_LAUCH_SUCCESS', 'DE', '', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TEXT_ALIGN', 'DE', '', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TEXT_COLOR', 'DE', '', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TEXT_STYLE', 'DE', '', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WIDTH', 'DE', '', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_LWS_MESSAGES', 'EN', 'Do you really want to launch the whole website?', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CH_ARTICLE_DATE', 'EN', 'Article Date', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXPIRE', 'EN', 'Expire', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CH_ARTICLE_DATE', 'DE', '', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXPIRE', 'DE', '', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BY_ORDER', 'EN', 'By order', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_LWS_MESSAGES', 'DE', '', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_LW_SITE', 'DE', '', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GALNAME', 'EN', 'Gallery Name', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GALDESC', 'EN', 'Gallery Description', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GAFOLDER', 'EN', 'Image-Folder', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GALROWS', 'EN', 'Rows', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GALCOLS', 'EN', 'Columns', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MEDIA_SUPPORTED', 'EN', 'The Media plugin supports the following file-types:<br>Macromedia Flash Films (.swf), Windows Media (.avi), Real Player (.rm), Apple Quicktime (.mov), MP3 over Windows Media (.mp3), PDF (.pdf)', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_DELMES2', 'EN', 'Do you really want to delete this content? It may still be used in some clusters.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MISSING_PGN', 'EN', 'Missing Plugin: ', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('IMP_ERR', 'EN', 'You cannot import, because of following errors:', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FILE_ALREADY_UPLOADED', 'EN', 'You have already uploaded a file. You can go on by pressing Next.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GO_IMPORT', 'EN', 'Press Next to import this data now. If the data has already been imported, nothing will be changed.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NUMB_IMPORTED', 'EN', 'Number of imported recordsets:', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PROC_DATA', 'EN', 'Processing Data...', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BAK_TIPP', 'EN', 'You can backup your database and www and wwwdev folder here. Make sure you have setup backup in settings.inc.php!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COPYCLUSTERT', 'EN', 'Create Copy', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATECOPY', 'EN', 'Create Copy', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COPYCLT', 'EN', 'Copy cluster template', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SOURCE', 'EN', 'Source', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEWNAME', 'EN', 'New Name', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHNLAUNCHED', 'EN', 'The channel was launched successfully.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_LWC', 'EN', 'Launch all articles', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_XML', 'EN', 'The file you uploaded is not XML or your browser does not send the file correct!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHANGE_TEMPLATE', 'EN', 'Change Template', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CCONLAUNCH', 'EN', 'Clear Cache on Launch', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CCONLAUNCH_LBL', 'EN', 'Dev-Page-IDs (commaseparated)', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLLOUT_SEL', 'EN', 'Source and Destination for Rollout', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEW_ROLLOUT', 'EN', 'Start another rollout', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CR_BO_LANG', 'EN', 'Create a new backend language', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LANGUAGE', 'EN', 'Language', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_ACCESS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_GROUPEDIT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_GROUPS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_GROUPSROLES', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_INFO', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_INHERIT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_INHERIT_NOTE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_OWNER', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_PARENT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_ROLE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_TITLE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACTIVE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACTIVE_VARIATION', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ADDITIONAL_IMAGE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ADDITIONAL_LINK', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ADD_LINK', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AFTER', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AGENT_CALLED', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AGENT_EXPLAINHOME', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AGENT_GOAWAY', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AGENT_GOHOME', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AGENT_LOGOUT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AGENT_NXHOMEPAGE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AGENT_WELCOME', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ALC_OWNER', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ALL', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ARTICLES', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ARTICLE_IS_EXPIRED', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ARTICLE_IS_LIVE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ARTICLE_VARIATION_MISSING', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AR_EXPIRE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AR_LAUNCH', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AUTHOR', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AUTH_GROUP', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AVAIL_ITEMS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AVAIL_VARIATIONS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AVERAGE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AVG_CLICKSTREAM', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AVG_VISIT_LENGTH', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AVG_VIS_LENGTH', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BACK', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BACKUP', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BACK_INFO', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BACK_SP', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BACK_TO_CV', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BACK_TO_OVERVIEW', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BAK_FILE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BAK_TIPP', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BEGIN', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BG_COLOR', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BY', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BY_ORDER', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CACHED', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CALENDAR', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CALENDARS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CALENDARS_CAT_DEFINE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CALENDARS_DEFINE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CALENDARS_EDIT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CALENDARS_TIPP', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CALENDAR_SELECT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CAL_BTO', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CAL_EDIT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CAL_NAME', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CANCEL', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CATEGORY', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CAT_NAME', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CCONLAUNCH', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CCONLAUNCH_LBL', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHANGE_TEMPLATE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHANNEL', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHANNELS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHANNEL_IMPORTARTICLES', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHANNEL_SELECT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHNLAUNCHED', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHOOSEFILE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CH_ADMIN', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CH_ARTICLE_DATE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CH_CAT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CH_CAT2', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLASS_WRONG', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLEAR', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLEAR_MEDIA', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_DELETE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_DELETED', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_DELETEMES', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_EDIT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_NOTDELETED', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLK_PATHS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLLINK', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLTI_DELETE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLTPOSITION', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_BROWSE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_DELETE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_DELMES', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_EXCLUSIVE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_MAXCARD', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_MINCARD', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_NAME', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_NEW', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_PROPERTIES', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_SCHEME', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_SELECT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLUSTER', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLUSTER_INFORMATION', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLUSTER_TEMPLATE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_BROWSE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_CREATEINSMES', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_CREATEINSTANC', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_DEL', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_DELMES', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_EDIT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_EXPIRE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_LAUNCH', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_NAME', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_NEW', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_NOTITLE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_PROPERTIES', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_SELECT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CMPTYPE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COLOR', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COMB_ALL', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COMB_NONE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COMMENT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COMMIT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONFIG', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONFIGURED', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONFIRM_DELETE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONFIRM_UNSAVED_CHANGES', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONFIRM_UNSAVED_CHANGES_LINKEDCL', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTAINERNAME', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTENT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTENTITEM', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTENTTYPE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTENT_DESC', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COPYCLT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COPYCLUSTERT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COPY_CLUSTER', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COUNT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CPG_MEMBERS_SELECT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CP_GROUP', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATECOPY', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATED', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATED_AT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATENEW', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATE_ARTICLE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATE_INSTANCES', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CR_BO_LANG', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CR_CONTENT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DATE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DELETE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DELETESUCCESS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DELETE_PAGE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DEL_ARTICLE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DEL_FOLDER', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DESC', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DESCRIPTION', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DESTROY_EXCLUSIVE_CONTENT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DESTROY_TREE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DISABLE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DISPLAY', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DOSOMETHING', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DOWN', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DWEXT_CONTENTFIE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DWEXT_CONTENTFIELDINFO', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DWEXT_CONTENTFIELDINFO_MES', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDITED', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT_ACCESS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT_ALL', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT_ARTICLE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT_CONTENT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT_FOLDER', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT_SPM', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT_TEMPLATE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_CLT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_CONTENT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_CPGROUP', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_CPGROUPGENERAL', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_DISPATCHER', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_META', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_PROPERTIES', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EMPTY', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ENDATE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ENDTIME', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ENVIRONMENT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ERROR', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ERROR_SEL_GROUP', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ERROR_SEL_ROLE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXEC_EXPORT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXPIRE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXPLORE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXPL_EXEC_EXPORT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXPL_SEL_CH', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXPL_SEL_CLUSTER', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXPL_SEL_SPM', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXPORT_DATA', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXP_REPORT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FILE_ALREADY_UPLOADED', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FILTER_COLUMN', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FILTER_RULE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FIND_OBJ', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FOLDER', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FOLDER_DELMES', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FONT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FONTSIZE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FULL_NAME', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GAFOLDER', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GALCOLS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GALDESC', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GALNAME', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GALROWS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GO', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GOTO_CL', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GO_IMPORT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_DESCRIPTIO', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_DESCRIPTION', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_FILTERMENU', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_HEAD', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_LINK', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_NAME', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GR_TEXT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HEIGHT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_ACCESS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PGN_INFO', 'EN', 'Plugin information', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_BACKUP', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_CHANNEL', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_CLB', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_CLT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_COMPGRP', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_DW', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_METATEMP', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_OBJBROWSE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_PAGETEMP', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_PGN', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_PURGE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_ROLLOUT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_SP', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_SYNCCL', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_VARIATION', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HIDE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HOUR', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HOURS_AS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('IMPORT_DATA', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('IMP_ERR', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('INDIV_CONFIG', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('IND_TIME', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('INSNAME', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('INSTANCES_CREATED', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('INSTANCE_CREATED', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('IN_CHANNEL', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('IS_COMPOUND', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('IS_FILTERED', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('I_AFTER', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('KEEP_CLUSTER', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('KEYWORDS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LANGUAGE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LASTMONTH', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LASTWEEK', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LASTYEAR', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LAST_LAUNCHED_AT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LAST_MOD_AT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LAUNCH', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LEAVE_EMPTY', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LIBRARY', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LINKED', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LIVE_AUTHORING', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOCATION', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOCK_MENU', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOGFILE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOGGED_AS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOGIN_FAILED', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOGS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOGS_INFO', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LONGEST_PATHS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MANDATORY', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MAXIMUM', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MAXIMUMAT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MEDIAN', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MEDIA_SUPPORTED', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MENU', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MESSAGE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('METATEMPLATE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('METATEMPLATES', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MH_GETSTART', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MH_GLOSSARY', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MINIMUM', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MINIMUMAT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MISSING_PGN', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_ADDITIONAL', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_BASE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_DELETE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_DW_CONTENT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_DW_CONTENTFIE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_DW_CONTENTFIELDINFO', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_GENERATE_DTA', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_GENERATE_DTA_', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_GENERATE_DTA_MES', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_GENERATE_DTA_SUCCEEDED', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_LWC', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_LWS_MESSAGES', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_LW_SITE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_MODULE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_PROPERTIES', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_SCHEME', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_SPIDER', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_SYNC_CL', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_TITLE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MULTIPAGE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_ACCESS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_ADMIN', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_BACKUP', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_BROWSER', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_CHANNELS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_CLB', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_CLT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_CLTB', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_CLUSTERS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_COMBOBJ', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_ES', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_EXPORT_WZ', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_HELP', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_HOME', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_IMPORT_WZ', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_INSTALLPLUGIN', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_LIB', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_LOGOUT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_MAINTENANCE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_META', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_MYPROFILE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_MYPRT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_PGN', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_PRTMAN', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_PTEMP', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_PURGE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_REPORT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_ROLLOUT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_SPM', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_TEMP', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_TRANSLATION', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_UMAN', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_VAR', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_WWW', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NAME', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEW', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEWNAME', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEW_ARTICLE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEW_CONTENT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEW_FOLDER', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEW_ROLLOUT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEXT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NODE_ACCESS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOSPTITLE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOTCONFIGURED', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOTNUMBER', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOT_SELECTED', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOT_SPECIFIED', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_CLUSTER', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_CLUSTERTEMPLATES', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_CLUSTER_SELECTED', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_CONTENT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_CONTENTS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_OBJ', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_VARIATIONS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_XML', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NUMBER', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NUMBER_OF_INSTANCES', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NUMB_IMPORTED', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NUM_OF_ART', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('OBJLAUNCH_SUCCESS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('OK', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ORDER', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ORDERART', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ORDERCOMP', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('OTHERS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('OVERVIEW', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_ALT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_BROWSE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_COPYRIGHT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_DEL', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_DELMES', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_DELMES2', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_EDIT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_NAME', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_NEW', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_PREVIEW', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_PROPERTIES', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_TEXT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PAGE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PAGES', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PAGE_TEMPLATE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PASSWORD', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PATH', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PATHS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PERCENT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PGNTXT_SMA', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_ALREADYINSTAL', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_CHOOSE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_ERROR', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_FILEWRONG', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_INSTALL', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_INSTALLDESC', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_INSTALLED', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_NEWERINSTALLE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_TITLE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_UNINSTALL', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_UNINSTALLDELE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_UNINSTALLMES', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_UPGRADED', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PI', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PI_OVERVIEW', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('POSITION', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('POS_IN_MENU', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_BROWSER', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_CRSUCCEEDED', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_EDIT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_MYPORTAL', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_OWNER', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PREDEF_TIME', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PREVIEW', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PREV_AVAIL', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PRINT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PROCERROR', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PROC_DATA', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PROMPTDELETE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PROPERTIES', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PTEMPL', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_CLT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_CLUSTER', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_CONTENT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_EXPIRED', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_FOLDER', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_MES', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_META', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_PAGES', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_VAR', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PWDNOTMATCH', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PWDTOOSHORT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RANK', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RATERES', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RB_CACHE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('READY_TO_USE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('REFERER', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('REMAIN_POS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RESET', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RESET_FORM', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RESET_LOGS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RET_VIS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RL_PERM', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_DESCRIPTION', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_FILTERMENU', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_GENERAL', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_HEAD', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_LINK', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_NAME', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_PERMISSION', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLLOUT_SEL', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_DELETEFOLDER', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_DELFOLDER', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_DELFOLDERMES', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_EDITFOLDER', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_FOLDERNAME', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_FOLDERNOTEMPTY', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_HOME', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_MOVEOBJECTS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_NEWFOLDER', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_PARENT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SAVE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SAVEERROR', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SAVESUCCESS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SAVE_BACK', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCH', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCHIN', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCHRESULTS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCH_CLEAR', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCH_EXPIRED_ARTICLES', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCH_LIVE_ACRTICLES', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEASRCH_MISSING_VARIATIONS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECTEDINSTANCE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECTEDOBJECT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECTOBJECT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECTONE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECT_CI', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECT_CL', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECT_VARIATION', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELMULTIPLE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_ARTICLE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_CH', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_CHANNEL_CAT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_CLUSTER', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_EVENT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_FILE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_MEM', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_PTML', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_VAR', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SET', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SHORTEST_PATHS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SHOW', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SHOW_ADVANCED_SEARCH', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SHOW_ALL', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SHOW_PAGEWISE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SMA_EXT_EDIT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SOURCE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_CLUSTER', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_EDIT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_LAUCH_SUCCESS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_META', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_PATH', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_RLAUNCH', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_SELECTTHUMB', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_THUMBNAIL', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_TYPE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_VARIATIONS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_BROWSE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_CLNEW', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_CONFDESC', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_CONFIGURE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_DELETE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_DELMES', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_EDIT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_EXPIRE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_EXPIREDATE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_IPROPERTIES', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_LAUNCH', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_LAUNCHDATE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_LAUNCHDATES', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_LINK', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUDIRECT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUDIRECTTIT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUDIRECTTITLE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUHELP', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUNAME', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUPROPS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_NEWINSTANCE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_NEWPAGE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_PDELETE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_PDELMES', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_PREVIEW', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_PROPERTIES', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_RLTREE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SR_SELECTCI', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SR_SELECTCLI', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STARTDATE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STARTTIME', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('START_BAK', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STATS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STATS_HEADER', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STATUS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STEP', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STNAME', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SYNC_CLUSTERS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SYNC_CLUSTERS_DESCR', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TEMPLATE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TESTS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TEXT_ALIGN', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TEXT_COLOR', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TEXT_STYLE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TF', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('THISMONTH', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('THISWEEK', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('THISYEAR', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TIME_BETW_VISITS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TIPP_TEMPLATE_1', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TITLE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TMPL_NAME', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TODAY', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_BROWSER', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_ENTRYPAGES', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_EXITPAGES', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_EXITT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_HOSTS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_OS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_PAGES', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_PATHS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_REFERER', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_SI', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_SKW', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOTAL', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TRANSLATION', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TRANS_TEMPL', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TRANS_THIS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TT_REFRESH', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TT_RSTCI', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TYPE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('UNIQUE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('UP', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('UPL_TEXT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('UP_INTRO', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USAGE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USERPERM_HEAD', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_ACTIVE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_AGENT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_BL', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_EMAIL', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_FILTERMENU', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_GENERAL', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_HEAD', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_JS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_LINK', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_NAME', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_PERMGRID', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_PERMISSION', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_PERMISSIONS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_PROFILE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_SETPERM', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_TO_GROUP', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VARIATIONS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VAR_SUCCEEDED', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VISITORS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VISITS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VISITS_OVERVIEW', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VIS_FIRST', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VIS_ONL', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VIS_PER_VIS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VIS_RET', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('V_EDIT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('V_NAME', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('V_SHORT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WEBSITE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WEEKDAY', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WEEKDAY_AS', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WHEN', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WIDTH', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WRONGDATE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_ARTICLEIMPORT_SRCTYPE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_ARTICLEIMPORT_TARGET', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_EXPORT_TYPE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_IMPORTING', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_IMPORT_FILE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_IMPORT_VAL', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_ARTICLEIMPORT_SRCTYPE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_ARTICLEIMPORT_TARGET', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_DESCR', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_DESCR_EXPL', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_EXPORT_TYPE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_IMPORTING', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_IMPORT_FILE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_IMPORT_VAL', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_KEEPCLUSTER', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_KEEPCLUSTER_EXPL', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_SEL_EXP_RES', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZ_ARTICLEIMPORT', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZ_ARTICLEIMPORT_TITLE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZ_EXPORT_TITLE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZ_IMPORT_TITLE', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('YES', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('YESTERDAY', '100', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LANGID', 'EN', 'Language ID', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_ARTICLES', 'EN', 'Articles', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PAGE_ID', 'EN', 'Page ID', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOT_FOUND', 'EN', 'Sorry, I found nothing', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PNF', 'EN', 'The page with the ID you entered was not found.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MODTYPE', 'EN', 'Plugin Type', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VERSION', 'EN', 'Version', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SOURCEFILE', 'EN', 'Source file', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('UNINSTALL', 'EN', 'Uninstall', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('UNINSTCONF', 'EN', 'Uninstalling a plugin can cause damage to the website! Do you want to proceed?', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_RB_CACHE_MES', 'EN', 'Rebuild Cache of all live pages', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_GROUP', 'EN', 'Cluster Group', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_ACCESS', 'FR', 'Editer les permissions dans les groupes', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_GROUPEDIT', 'FR', 'S?lectionner le groupe pour ?diter les r?les', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_GROUPS', 'FR', 'S?lectionner le groupe ? ajouter', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_GROUPSROLES', 'FR', 'Acc?s ?tranger', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_INFO', 'FR', 'Acc?s h?rit? du parent', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_INHERIT', 'FR', 'H?riter des permissions du parent', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_INHERIT_NOTE', 'FR', 'Note : quand la case est coch?e, il n''y a pas d''autre configuration disponible !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_OWNER', 'FR', 'Propri?taire', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_PARENT', 'FR', 'Permissions h?rit?es de', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_ROLE', 'FR', 'S?lectionner les r?les pour le groupe', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_TITLE', 'FR', 'Configuration des permissions pour', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACTIVE', 'FR', 'Actif', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACTIVE_VARIATION', 'FR', 'Variation active', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ADD_LINK', 'FR', 'Ajouter un lien', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ADDITIONAL_IMAGE', 'FR', 'Image additionnelle', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ADDITIONAL_LINK', 'FR', 'Lien additionnel', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AFTER', 'FR', 'Apr?s :', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AGENT_CALLED', 'FR', 'Vous m''avez demand? ?', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AGENT_EXPLAINHOME', 'FR', 'Vous pouvez me trouver en cliquant sur le logo N/X, en haut ? droite de la fen?tre', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AGENT_GOAWAY', 'FR', 'Cachez-vous et restez ?loign? !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AGENT_GOHOME', 'FR', 'Rentrez chez vous !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AGENT_LOGOUT', 'FR', 'J''esp?re que vous avez bien travaill? avec N/X. Bonne journ?e !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AGENT_NXHOMEPAGE', 'FR', 'Visitez le site de N/X', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AGENT_WELCOME', 'FR', 'Bienvenue sur N/X', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ALC_OWNER', 'FR', 'D?finir le propri?taire', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ALL', 'FR', 'Tous', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AR_EXPIRE', 'FR', 'Expirer l''article', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AR_LAUNCH', 'FR', 'Lancer l''article', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ARTICLE_IS_EXPIRED', 'FR', 'L''article a expir', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ARTICLE_IS_LIVE', 'FR', 'L''article est en ligne', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ARTICLE_VARIATION_MISSING', 'FR', 'La variation de cet article n''existe pas encore.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ARTICLES', 'FR', 'Articles', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AUTH_GROUP', 'FR', 'Authentification', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AUTHOR', 'FR', 'Auteur', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AVAIL_ITEMS', 'FR', 'Entr?es disponibles', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AVAIL_VARIATIONS', 'FR', 'Variations disponibles', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AVERAGE', 'FR', 'Moyenne', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AVG_CLICKSTREAM', 'FR', 'Taux de clics moyen', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AVG_VIS_LENGTH', 'FR', 'Temps moyen de visite (secondes)', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AVG_VISIT_LENGTH', 'FR', 'Temps moyen de visite', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BACK', 'FR', 'Retour', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BACK_INFO', 'FR', 'La liste ci-dessous montre les sauvegardes de N/X sur votre serveur. Vous pouvez supprimer les sauvegardes ici. Pour restaurer une sauvegarde, vous devez vous connecter manuellement au serveur et restaurer les fichiers.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BACK_TO_CV', 'FR', 'Retour ? la vue d''ensemble du cluster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BACK_TO_OVERVIEW', 'FR', 'Retour ? la vue d''ensemble', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BACKUP', 'FR', 'Sauvegarde syst?me', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BAK_FILE', 'FR', 'Fichier de sauvegarde', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BAK_TIPP', 'FR', 'Vous pouvez sauvegarder votre base de donn?es et les dossiers de site www et wwwdev ici. V?rifiez que vous avez bien configur? la sauvegarde dans settings.inc.php !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BEGIN', 'FR', 'D?marrer', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BY', 'FR', 'par', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BY_ORDER', 'FR', 'Par ordre', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CACHED', 'FR', 'Page de cache', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CAL_BTO', 'FR', 'Retour ? la vue d''ensemble', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CAL_EDIT', 'FR', 'Editer le rendez-vous', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CAL_NAME', 'FR', 'Nom du calendrier', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CALENDAR', 'FR', 'Calendrier', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CALENDAR_SELECT', 'FR', 'S?lectionner un calendrier', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CALENDARS', 'FR', 'Calendriers', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CALENDARS_CAT_DEFINE', 'FR', 'D?finir les cat?gories', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CALENDARS_DEFINE', 'FR', 'D?finir les calendriers', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CALENDARS_EDIT', 'FR', 'Editer le calendrier', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CALENDARS_TIPP', 'FR', 'Vous pouvez cr?er plusieurs calendriers ici. Chaque calendrier aura ses propres ?v?nements et dates.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CANCEL', 'FR', 'Annuler', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CAT_NAME', 'FR', 'Cat?gorie', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CATEGORY', 'FR', 'Cat?gorie', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CH_ADMIN', 'FR', 'Administration du canal', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CH_ARTICLE_DATE', 'FR', 'Date de l''article', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CH_CAT', 'FR', 'D?finir les cat?gories', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CH_CAT2', 'FR', 'Canal et cat?gorie', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHANGE_TEMPLATE', 'FR', 'Changer de mod?le', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHANNEL', 'FR', 'Canal', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHANNEL_GRABMP', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHANNEL_IMPORTARTICLES', 'FR', 'Importer des articles', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHANNEL_SELECT', 'FR', 'S?lectionner un canal', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHANNELS', 'FR', 'Canaux', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHOOSEFILE', 'FR', 'Choisir un fichier', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_BROWSE', 'FR', 'Voir les clusters', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_CREATEINSMES', 'FR', 'Il reste des emplacements pour cr?er d''autres instances de ce champ de contenu. Si vous voulez cr?er une autre instance, entrez un titre dans le champ texte ci-dessous et appuyez sur Cr?er.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_CREATEINSTANC', 'FR', 'Cr?er une nouvelle instance', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_DEL', 'FR', 'Supprimer l''instance', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_DELMES', 'FR', 'Voulez-vous vraiment supprimer cette instance de cluster ? Toutes les donn?es seront perdues !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_EDIT', 'FR', 'Modifier l''instance du cluster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_EXPIRE', 'FR', 'Expirer le cluster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_LAUNCH', 'FR', 'Lancer le cluster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_NAME', 'FR', 'Nom du cluster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_NEW', 'FR', 'Nouvelle instance', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_NOTITLE', 'FR', 'Aucun titre d?fini', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_PROPERTIES', 'FR', 'Propri?t?s du cluster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_SELECT', 'FR', 'S?lectionnez un cluster pour le lier ? un mod?le de cluster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLASS_WRONG', 'FR', 'Le fichier sp?cifi? n''a pas de signature de classe valide !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLEAR', 'FR', 'Effacer', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLEAR_MEDIA', 'FR', 'Supprimer le fichier depuis la base de donn?es', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI', 'FR', 'Instance de cluster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_DELETE', 'FR', 'Supprimer le membre de cluster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_DELETED', 'FR', 'L''instance a ?t? supprim?e.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_DELETEMES', 'FR', 'Voulez-vous vraiment supprimer cette instance ? Elle sera perdue ? jamais !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_EDIT', 'FR', 'Modifier le membre de cluster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_NOTDELETED', 'FR', 'Cette instance ne peut pas ?tre supprim?e !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLK_PATHS', 'FR', 'Chemins des clics', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT', 'FR', 'Mod?le de cluster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_BROWSE', 'FR', 'Voir les mod?les de clusters', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_DELETE', 'FR', 'Supprimer le mod?le de cluster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_DELMES', 'FR', 'Vous ?tes sur le point de supprimer un mod?le de cluster. Cela entra?nera la perte de toutes les donn?es cr??es avec ce mod?le. Voulez-vous vraiment continuer ?', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_EXCLUSIVE', 'FR', 'Contenu d?veloppeur', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_MAXCARD', 'FR', '', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_MINCARD', 'FR', 'Instances', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_NAME', 'FR', 'Nom du mod?le de cluster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_NEW', 'FR', 'Nouveau mod?le de cluster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_PROPERTIES', 'FR', 'Propri?t?s du mod?le de cluster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_SCHEME', 'FR', 'Modifier le sch?ma du mod?le de cluster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_SELECT', 'FR', 'S?lectionner des mod?les de clusters', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLTI_DELETE', 'FR', 'Voulez-vous vraiment supprimer cette entr?e ? Toutes les instances seront aussi perdues !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLTPOSITION', 'FR', 'Position', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLUSTER', 'FR', 'Cluster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLUSTER_INFORMATION', 'FR', 'Informations de cet enregistrement', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLUSTER_TEMPLATE', 'FR', 'Mod?le de cluster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CMPTYPE', 'FR', 'Type de composition', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COLOR', 'FR', 'Couleur', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COMB_ALL', 'FR', 'Tout s?lectionner', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COMB_NONE', 'FR', 'Tout effacer', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COMMENT', 'FR', 'Commentaire', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COMMIT', 'FR', 'Proposer', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONFIG', 'FR', 'Configurer', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONFIGURED', 'FR', 'Pr?t ? l''utilisation', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONFIRM_DELETE', 'FR', 'Voulez-vous vraiment supprimer cette entr?e ?', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONFIRM_UNSAVED_CHANGES', 'FR', 'Note : les modifications non enregistr?es seront perdues si vous continuez. Si vous avez d?j? modifi? quelque chose, vous pouvez annuler et enregistrer votre travail. On continue ? ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTAINERNAME', 'FR', 'Mod?le', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTENT', 'FR', 'Contenu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTENT_DESC', 'FR', 'Description du contenu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTENTITEM', 'FR', 'Entr?e de contenu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTENTTYPE', 'FR', 'Type de contenu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COPY_CLUSTER', 'FR', 'Copier des clusters', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COUNT', 'FR', 'Compteur', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CP_GROUP', 'FR', 'Groupe compos', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CPG_MEMBERS_SELECT', 'FR', 'S?lectionner des membres de ce groupe de composition', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CR_CONTENT', 'FR', 'Cr?er du contenu pour cette page ?', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATE', 'FR', 'Cr?er un article', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATE_ARTICLE', 'FR', 'Cr?er un nouvel article dans le canal', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATE_INSTANCES', 'FR', 'Cr?er des instances', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATED', 'FR', 'Cr', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATED_AT', 'FR', 'Cr?? le', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATENEW', 'FR', 'Un nouveau membre de ce mod?le a ?t? cr??. Voir les donn?es ci-dessous', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DATE', 'FR', 'Date', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DATEFORMAT', 'FR', 'Ce format de date n''est pas correct !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DEL_ARTICLE', 'FR', 'Voulez-vous vraiment supprimer cet article dans toutes ses variations ?', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DEL_FOLDER', 'FR', 'Supprimer le dossier', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DELETE', 'FR', 'Supprimer', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DELETE_PAGE', 'FR', 'Supprimer la page', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DELETESUCCESS', 'FR', 'Les donn?es ci-dessous ont ?t? supprim?es de la base de donn?es. Elles sont maintenant perdues !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DESC', 'FR', 'Description', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DESCRIPTION', 'FR', 'Description', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DESTROY_EXCLUSIVE_CONTENT', 'FR', 'D?truire le contenu exclusif', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DESTROY_TREE', 'FR', 'D?truire l''arborescence', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DISABLE', 'FR', 'D?sactiver', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DISPLAY', 'FR', 'Afficher', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DOSOMETHING', 'FR', 'S?lectionnez l''action que vous souhaitez. Vous pouvez ins?rer des entr?es, les modifier, les supprimer et changer leur ordre.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DOWN', 'FR', 'Bas', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DWEXT_CONTENTFIE', 'FR', 'G?n?rer les informations du champ de contenu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DWEXT_CONTENTFIELDINFO', 'FR', 'G?n?rer les informations du champ de contenu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DWEXT_CONTENTFIELDINFO_MES', 'FR', 'G?n?rer les informations du champ de contenu pour Dreamweaver MX', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_CLT', 'FR', 'Modifier le mod?le de cluster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_CONTENT', 'FR', 'Modifier le contenu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_CPGROUP', 'FR', 'Modifier le groupe de composition', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_CPGROUPGENERAL', 'FR', 'Modifier le groupe g?n?ral', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_DISPATCHER', 'FR', 'Utilisez ce bouton pour basculer entre la modification des m?ta-donn?es et la modification du contenu.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_META', 'FR', 'Modifier les m?ta-donn?es', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_PROPERTIES', 'FR', 'Modifier les propri?t', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT', 'FR', 'Modifier', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT_ACCESS', 'FR', 'D?finir les acc', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT_ALL', 'FR', 'Modifier tout', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT_ARTICLE', 'FR', 'Modifier l''article', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT_CONTENT', 'FR', 'Modifier le contenu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT_FOLDER', 'FR', 'Modifier le dossier', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT_SPM', 'FR', 'Modifier les propri?t?s du mod?le', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT_TEMPLATE', 'FR', 'Modifier le mod?le', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDITED', 'FR', 'Modifi', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EMPTY', 'FR', '<vide>', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ENDATE', 'FR', 'Date de fin', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ENDTIME', 'FR', 'Heure de fin', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ENVIRONMENT', 'FR', 'Environnement', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ERROR', 'FR', 'Une erreur est apparue pendant l''op?ration s?lectionn?e !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ERROR_SEL_GROUP', 'FR', 'Vous devez choisir un groupe !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ERROR_SEL_ROLE', 'FR', 'Vous devez choisir au moins un r?le !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXEC_EXPORT', 'FR', 'Exportation de la ressource en cours', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXP_REPORT', 'FR', 'Exportation des donn?es suivantes en cours', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXPIRE', 'FR', 'Expirer', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXPL_EXEC_EXPORT', 'FR', 'Ce syst?me g?n?re actuellement un fichier XML d''exportation.<br/><br/>Dans quelques secondes, une fen?tre appara?tra. Cliquez sur Enregistrer pour placer la ressource sur votre disque.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXPL_SEL_CH', 'FR', 'Choisissez un canal.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXPL_SEL_CLUSTER', 'FR', 'Apr?s avoir choisi un mod?le de cluster, vous pourrez choisir un cluster dans la liste qui appara?tra.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXPL_SEL_SPM', 'FR', 'Choisissez un mod?le de page.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXPLORE', 'FR', 'Explorer', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXPORT_DATA', 'FR', 'Assistant d''exportation du contenu et des mod?les', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FILTER_COLUMN', 'FR', '?dans', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FILTER_RULE', 'FR', 'Chercher?', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FIND_OBJ', 'FR', 'Trouver l''objet', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FOLDER', 'FR', 'Dossier', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FOLDER_DELMES', 'FR', 'Voulez-vous vraiment supprimer ce dossier ?', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FULL_NAME', 'FR', 'Nom complet', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GO', 'FR', 'Allez !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GOTO_CL', 'FR', 'Aller au cluster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_DESCRIPTIO', 'FR', 'Description', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_DESCRIPTION', 'FR', 'Description', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_FILTERMENU', 'FR', 'Administration des groupes', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_HEAD', 'FR', 'Profil du groupe', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_LINK', 'FR', 'Profils des groupes', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_NAME', 'FR', 'Nom du groupe', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP', 'FR', 'Aide', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_ACCESS', 'FR', 'Un dispositif existe pour cr?er et g?rer des profils d''utilisateur dans N/X.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_ARTICLES', 'EN', 'The form displays articles.<br><br>The color codes are:<li>red: article not published<li>grey: article not translated<li>green: article published', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_BACKUP', 'FR', 'La liste ci-dessous montre les sauvegardes de N/X sur votre serveur. Vous pouvez supprimer les sauvegardes ici. Pour restaurer une sauvegarde, vous devez vous connecter manuellement au serveur et restaurer les fichiers.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_CHANNEL', 'FR', 'Cat?gories de th?mes d?finissant le contenu des articles cr??s par N/X (par exemple, News, Personnes?).', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_CLB', 'FR', 'Un cluster est une collection de champs de contenu dynamiques ou statiques, compl?t?s par un d?veloppeur ou un r?dacteur de pages Web. La d?finition de la structure dans N/X est faite avec des clusters de donn?es.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_CLT', 'FR', 'Le mod?le de cluster est un formulaire qui vous permet de cr?er la structure des donn?es pour votre site et de d?finir le type de contenu. Ensuite, le mod?le de cluster est fusionn? avec un mod?le de page qui g?re le contenu de la page Web.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_COMPGRP', 'FR', 'Le groupe de composition est un groupe de clusters. Les mod?les de clusters peuvent avoir leur propre disposition. Ceci vous permet de construire votre page Web hors de blocs (par exemple, articles de news, sondage, galerie de photos... le tout sur une page et sur demande).', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_DW', 'FR', 'Cr?e un dossier de configuration pour l''extension N/X de Dreamweaver. A l''aide de cette extension, des mod?les peuvent ?tre d?velopp?s avec Dreamweaver.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_METATEMP', 'FR', 'Un mod?le de m?ta-donn?e est utilis? pour d?finir quels champs de m?ta-donn?es seront plac?s dans une nouvelle page. Quand vous cr?ez un nouveau champ de m?ta-donn?e dans le mod?le, chaque nouvelle page bas?e sur ce mod?le contiendra ce champ.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_OBJBROWSE', 'FR', 'La biblioth?que de contenu contient tous les ?l?ments de contenu du site', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_PAGETEMP', 'FR', 'Dans les tableurs et les applications de base de donn?es, un mod?le est un formulaire vide qui montre quels champs existent, leur emplacement et leur longueur. Dans N/X, les mod?les sont ? la base de son fonctionnement. Un mod?le est un formulaire dans lequel toutes les cellules ont ?t? d?finies mais aucune donn?e n''a encore ?t? saisie.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_PGN', 'FR', 'Les extensions vous permettent d''?tendre les fonctions de N/X. Typiquement, des extensions sont employ?es pour cr?er de nouveaux types d''objets, en plus des deux types d''objets standards Text et Image.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_PURGE', 'FR', 'Supprime les informations inutiles de la base de donn?es.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_ROLLOUT', 'FR', 'Rollout est un dispositif de N/X qui permet de cr?er des copies d''une section de votre page Web et de les r?utiliser avec ou sans l''ancien contenu.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_SP', 'FR', 'Le plan du site est utilis? pour modifier la structure et les pages du site.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_SYNCCL', 'FR', 'Dispositif utilis? pour synchroniser les clusters apr?s avoir modifi? ou chang? un mod?le de cluster.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_VARIATION', 'FR', 'Un contenu peut avoir plusieurs variations. Ces variations peuvent ?tre des langues diff?rentes ou des profils de contenu diff?rents.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HIDE', 'FR', 'Cacher', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HOUR', 'FR', 'Heures', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HOURS_AS', 'FR', 'Analyse des heures', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('I_AFTER', 'FR', 'Ins?rer apr', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('IMPORT_DATA', 'FR', 'Importer des donn?es N/X-XML', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('IN_CHANNEL', 'FR', 'dans le canal', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('IND_TIME', 'FR', 'Fuseau horaire individuel', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('INDIV_CONFIG', 'FR', 'Configuration individuelle pour cette entr', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('INSNAME', 'FR', '<Nom du cluster>', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('INSTANCE_CREATED', 'FR', 'Une nouvelle instance de cette entr?e a ?t? cr??e.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('INSTANCES_CREATED', 'FR', 'De nouvelles instances de cette entr?e ont ?t? cr??es.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('IS_COMPOUND', 'FR', 'Mod?le de cluster de composition', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('IS_FILTERED', 'FR', 'Note : vous ne pouvez pas afficher tous les enregistrements parce que vous utilisez un filtre !  ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('KEEP_CLUSTER', 'FR', 'Garder le cluster original', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('KEYWORDS', 'FR', 'Mots-cl', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LAST_LAUNCHED_AT', 'FR', 'Dernier lancement ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LAST_MOD_AT', 'FR', 'Derni?re modification ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LASTMONTH', 'FR', 'Mois dernier', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LASTWEEK', 'FR', 'Semaine derni?re', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LASTYEAR', 'FR', 'Ann?e derni?re', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LAUNCH', 'FR', 'Lancement', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LEAVE_EMPTY', 'FR', 'Laisser vide', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LIBRARY', 'FR', 'Biblioth?que de contenu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LINKED', 'FR', 'Li? ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LIVE_AUTHORING', 'FR', 'Gestion en direct', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOCATION', 'FR', 'Emplacement, si externe', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOCK_MENU', 'FR', 'Bloquer le menu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOGFILE', 'FR', 'Voir les logs syst?me', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOGGED_AS', 'FR', 'Utilisateur connect', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOGIN_FAILED', 'FR', 'L''identifiant saisi ne peut pas ?tre v?rifi? ! Essayez de nouveau.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOGS', 'FR', 'Analyse du fichier de logs', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOGS_INFO', 'FR', 'La liste ci-dessous montre les logs r?alis?s pendant que N/X fonctionne.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LONGEST_PATHS', 'FR', 'Chemins les plus longs', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_ACCESS', 'FR', 'Acc', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_ADMIN', 'FR', 'Administration', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_BACKUP', 'FR', 'Sauvegarde', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_BROWSER', 'FR', 'Navigateur d''objets', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_CHANNELS', 'FR', 'Canaux', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_CLB', 'FR', 'Navigateur de clusters', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_CLT', 'FR', 'Mod?les de clusters', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_CLTB', 'FR', 'Navigateur de mod?les de clusters', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_CLUSTERS', 'FR', 'Clusters', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_COMBOBJ', 'FR', 'Contenus combin?s (cluster)', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_ES', 'FR', 'Explorer le site', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_EXPORT_WZ', 'FR', 'Assistant d''exportation', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_HELP', 'FR', 'Aide', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_HOME', 'FR', 'Accueil', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_IMPORT_WZ', 'FR', 'Assistant d''importation', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_INSTALLPLUGIN', 'FR', 'Extensions', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_LIB', 'FR', 'Biblioth?que', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_LOGOUT', 'FR', 'Se d?connecter', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_MAINTENANCE', 'FR', 'Maintenance', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_META', 'FR', 'Mod?les de m?ta', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_MYPROFILE', 'FR', 'Mon profil', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_MYPRT', 'FR', 'Mes portails', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_PGN', 'FR', 'Contr?le des extensions', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_PRTMAN', 'FR', 'Gestionnaire de portail', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_PTEMP', 'FR', 'Mod?les de pages', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_PURGE', 'FR', 'Nettoyer le base de donn?es', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_REPORT', 'FR', 'Rapport de site', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_ROLLOUT', 'FR', 'Bascule', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_SPM', 'FR', 'Page de site ma?tre', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_TEMP', 'FR', 'Mod?les', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_TRANSLATION', 'FR', 'Traduction', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_UMAN', 'FR', 'Gestion des utilisateurs', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_VAR', 'FR', 'Variations', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_WWW', 'FR', 'Site Web', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MANDATORY', 'FR', 'Ce champ ne peut pas ?tre vide !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MAXIMUM', 'FR', 'Maximum', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MAXIMUMAT', 'FR', 'Maximum ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MEDIAN', 'FR', 'M?dian', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MENU', 'FR', 'Menu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MESSAGE', 'FR', 'Message', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('METATEMPLATE', 'FR', 'Mod?le de m?ta-cl? additionnel', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('METATEMPLATES', 'FR', 'Mod?les de m?ta-donn?es', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MH_GETSTART', 'FR', 'Pour commencer', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MH_GLOSSARY', 'FR', 'Lexique', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MINIMUM', 'FR', 'Minimum', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MINIMUMAT', 'FR', 'Minimum ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_ADDITIONAL', 'FR', 'M?ta-donn?es additionnelles', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_BASE', 'FR', 'M?ta-donn?es basiques', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_DELETE', 'FR', 'Voulez-vous vraiment supprimer cette partie du mod?le de m?ta ? Toute les informations ?crites dans n''importe quelle m?ta-donn?e li?e ? la pr?sente partie seront supprim?es. Les donn?es vont ?tre perdues ? jamais ! ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_DW_CONTENT', 'FR', 'Extension Dreamweaver', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_DW_CONTENTFIE', 'FR', 'Informations du champ de contenu Dreamweaver', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_DW_CONTENTFIELDINFO', 'FR', 'Informations du champ de contenu Dreamweaver', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_GENERATE_DTA', 'FR', 'G?n?rer les types de donn?es', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_GENERATE_DTA_', 'FR', 'g?n?re les types de donn?es', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_GENERATE_DTA_MES', 'FR', 'g?n?re les types de donn?es', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_GENERATE_DTA_SUCCEEDED', 'FR', '<br><br>Les types de donn?es ont ?t? g?n?r?s avec succ?s et le fichier ?crit.<br>', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_LW_SITE', 'FR', 'Lancer le site entier', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_MODULE', 'FR', 'M?ta-donn?e de type de contenu sp?cifique', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_PROPERTIES', 'FR', 'Modifier les propri?t?s du mod?le de m?ta', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_SCHEME', 'FR', 'Modifier le sch?ma du mod?le de m?ta', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_SPIDER', 'FR', 'D?marrer le spider', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_SYNC_CL', 'FR', 'Synchroniser les clusters', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_TITLE', 'FR', 'Maintenance', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MULTIPAGE', 'FR', 'Multipage', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NAME', 'FR', 'Nom', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEW', 'FR', 'Cr?er un nouveau', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEW_ARTICLE', 'FR', 'Nouvel article', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEW_CONTENT', 'FR', 'Nouveau contenu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEW_FOLDER', 'FR', 'Cr?er un dossier', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEXT', 'FR', 'Suivant', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO', 'FR', 'Non', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_CLUSTER', 'FR', 'Il n''y a aucun cluster.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_CLUSTER_SELECTED', 'FR', 'Aucun cluster s?lectionn', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_CLUSTERTEMPLATES', 'FR', 'Il n''y a aucun mod?le de cluster.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_CONTENT', 'FR', 'Aucun contenu d?j? saisi.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_CONTENTS', 'FR', 'Aucun contenu disponible dans ce dossier.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_OBJ', 'FR', 'Aucun objet s?lectionn', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_VARIATIONS', 'FR', 'Il n''y a actuellement aucune variation d?finie pour cet objet<br>Demandez ? un d?veloppeur de v?rifier la configuration de l''entr?e s?lectionn?e.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NODE_ACCESS', 'FR', 'D?finir les acc?s pour la racine du site', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOSPTITLE', 'FR', 'Vous devez d?finir le nom dans le menu avant de pouvoir lancer la page !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOT_SELECTED', 'FR', 'Aucune entr?e encore s?lectionn?e.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOT_SPECIFIED', 'FR', 'N''importe quel type', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOTCONFIGURED', 'FR', 'Pas encore configur', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOTNUMBER', 'FR', 'Vous devez entrer un nombre dans ce champ !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NUM_OF_ART', 'FR', 'Nombre d''articles (999 = infini)', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NUMBER_OF_INSTANCES', 'FR', 'Sp?cifiez combien d''instances vous voulez cr?er.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_ALT', 'FR', 'Libell? ALT', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_BROWSE', 'FR', 'Naviguer dans les objets', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_COPYRIGHT', 'FR', 'Copyright', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_DBLINK_ADDWHERE', 'FR', 'Clause WHERE additionnelle', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_DBLINK_EXTERNALDB', 'FR', 'Base de donn?es externe', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_DBLINK_SRCHVALUE', 'FR', 'Rechercher la valeur', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_DEL', 'FR', 'Supprimer l''objet', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_DELMES', 'FR', 'Vous ?tes sur le point de supprimer un objet.<b>Notez que toutes les variations et toutes les m?ta-donn?es seront perdues !</b>', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_EDIT', 'FR', 'Modifier l''objet', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_NAME', 'FR', 'Nom de l''objet', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_NEW', 'FR', 'Nouvel objet', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_PREVIEW', 'FR', 'Pr?visualisation de', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_PROPERTIES', 'FR', 'Propri?t?s de l''objet', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_TEXT', 'FR', 'Texte', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_TEXT_NOBREAK', 'FR', 'Ignorer les nouvelles lignes', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('OBJLAUNCH_SUCCESS', 'FR', 'L''objet a ?t? lanc? avec succ?s.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('OK', 'FR', 'Ok', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ORDER', 'FR', 'Par ordre', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ORDERART', 'FR', 'Ordre des articles', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ORDERCOMP', 'FR', 'Ordres des compositions', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('OTHERS', 'FR', 'Autres', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('OVERVIEW', 'FR', 'Vue d''ensemble', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PAGE', 'FR', 'Page', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PAGE_TEMPLATE', 'FR', 'Mod?le de page', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PAGES', 'FR', 'Pages', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PASSWORD', 'FR', 'Mot de passe', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PATH', 'FR', 'Chemin', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PATHS', 'FR', 'Chemin de clics', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PERCENT', 'FR', 'Pourcentage', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_ALREADYINSTAL', 'FR', 'L''extension est d?j? install?e !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_CHOOSE', 'FR', 'Extension : /plugin/', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_ERROR', 'FR', 'Il y a eu une erreur pendant l''installation de l''extension !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_FILEWRONG', 'FR', 'Le nom de fichier entr? ne peut pas ?tre trouv? sur le serveur !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_INSTALL', 'FR', 'Installer une extension', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_INSTALLDESC', 'FR', 'V?rifiez que vous avez copi? tous les fichiers n?cessaires dans le dossier avant de proc?der. Ins?rez le chemin correct de l''extension dans le champ ci-dessous. Le syst?me pourra alors installer l''extension automatiquement.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_INSTALLED', 'FR', 'L''extension a ?t? install?e avec succ?s !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_NEWERINSTALLE', 'FR', 'Il y a une version plus r?cente de cette extension install?e !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_TITLE', 'FR', 'Extensions', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_UNINSTALL', 'FR', 'D?sinstaller une extension', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_UNINSTALLDELE', 'FR', 'D?sinstaller un module, <br> supprimer les contenus correspondants.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_UNINSTALLMES', 'FR', 'Vous ?tes sur le point de d?sinstaller un module.<b>La d?sinstallation d''un module ne supprime pas seulement le type de contenu mais aussi chaque objet unique de ce type stock? dans la base de donn?es. La d?sinstallation supprimera d?finitivement toutes les donn?es de ce module ! ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_UPGRADED', 'FR', 'L''extension a ?t? mise ? jour avec succ?s !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PGNTXT_SMA', 'FR', 'Enregistrer tous les textes modifi?s sur cette page', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PI', 'FR', 'Pages demand?es', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PI_OVERVIEW', 'FR', 'Vue d''ensemble des pages demand?es', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_BROWSER', 'FR', 'Navigateur de portail', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_CRSUCCEEDED', 'FR', 'La cr?ation d''un nouveau portail a abouti !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_EDIT', 'FR', 'Modifier la page du portail', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_MYPORTAL', 'FR', 'Mes portails', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_OWNER', 'FR', 'Propri?taire de la page', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('POS_IN_MENU', 'FR', 'Position dans le plan du site', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('POSITION', 'FR', 'Position', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PREDEF_TIME', 'FR', 'Fuseau horaire pr?d?fini', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PREV_AVAIL', 'FR', 'Vous avez s?lectionn? un objet. Une pr?visualisation sera disponible apr?s enregistrement.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PREVIEW', 'FR', 'Pr?visualisation', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PRINT', 'FR', 'Imprimer', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PROCERROR', 'FR', 'Une erreur s''est produite pendant le traitement du formulaire. Regardez les champs marqu?s et lisez les commentaires pour plus d''information.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PROMPTDELETE', 'FR', 'Voulez-vous vraiment supprimer ce jeu de donn?es ? Cette action ne peut pas ?tre annul?e !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PROPERTIES', 'FR', 'Propri?t', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PTEMPL', 'FR', 'Mod?le de page', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE', 'FR', 'Nettoyer la base de donn?es', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_CLT', 'FR', 'Nettoyer les mod?les de clusters', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_CLUSTER', 'FR', 'Nettoyer le cluster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_CONTENT', 'FR', 'Nettoyer le contenu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_EXPIRED', 'FR', 'Nettoyer les pages expir?es', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_FOLDER', 'FR', 'Nettoyer les dossiers', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_MES', 'FR', 'S?lectionnez les parties de la base de donn?es que vous voulez nettoyer.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_META', 'FR', 'Nettoyer les m?ta-donn?es', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_PAGES', 'FR', 'Nettoyer les pages du site et les ma?tres', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_VAR', 'FR', 'Nettoyer les variations', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PWDNOTMATCH', 'FR', 'Les mots de passe entr?s ne correspondent pas !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PWDTOOSHORT', 'FR', 'Le mot de passe doit ?tre d''au moins 6 caract?res !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_DELETEFOLDER', 'FR', 'Supprimer le dossier', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_DELFOLDER', 'FR', 'Supprimer le dossier et tous les objets enfants', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_DELFOLDERMES', 'FR', 'Vous ?tes sur le point de supprimer un dossier. S?lectionnez une action.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_EDITFOLDER', 'FR', 'Modifier les propri?t?s du dossier', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_FOLDERNAME', 'FR', 'Nom du dossier', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_FOLDERNOTEMPTY', 'FR', 'Le dossier n''est pas vide. Vous ne pouvez donc pas le supprimer ! V?rifier tous les objets et tous les clusters !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_HOME', 'FR', 'D?marrer', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_MOVEOBJECTS', 'FR', 'D?placer tous les objets vers le n?ud parent', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_NEWFOLDER', 'FR', 'Nouveau dossier', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_PARENT', 'FR', 'Dossier parent', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RANK', 'FR', 'Rang', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RATERES', 'FR', 'R?sultats des taux', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RB_CACHE', 'FR', 'Reconstruire le cache', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('READY_TO_USE', 'FR', 'Pr?t ? l''utilisation.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('REFERER', 'FR', 'R?f?rent', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('REMAIN_POS', 'FR', 'Ne pas changer la position', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RESET', 'FR', 'Remettre ? z?ro le formulaire', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RESET_FORM', 'FR', 'Remettre ? z?ro le formulaire', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RESET_LOGS', 'FR', 'Remettre ? z?ro les logs', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RET_VIS', 'FR', 'Visiteurs de renvoi', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RL_PERM', 'FR', 'Permissions des r?les', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_DESCRIPTION', 'FR', 'Description', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_FILTERMENU', 'FR', 'Administration des r?les', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_GENERAL', 'FR', 'Modifier les donn?es g?n?rales du r?le', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_HEAD', 'FR', 'Profil du r?le', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_LINK', 'FR', 'Profils du r?le', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_NAME', 'FR', 'Nom du r?le', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_PERMISSION', 'FR', 'Modifier les permissions du r?le', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SAVE', 'FR', 'Enregistrer', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SAVE_BACK', 'FR', 'Enregistrer et revenir', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SAVEERROR', 'FR', 'Une erreur s''est produite pendant l''enregistrement des donn?es dans la base de donn?es. V?rifiez que la base de donn?es est connect?e ou appelez votre administrateur.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SAVESUCCESS', 'FR', 'Les donn?es ont ?t? ?crites dans la base de donn?es avec succ?s.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCH', 'FR', 'D?marrer la recherche', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCH_CLEAR', 'FR', 'Remettre ? z?ro le filtre', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCH_EXPIRED_ARTICLES', 'FR', 'Articles expir', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCH_LIVE_ACRTICLES', 'FR', 'Articles en cours', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCHIN', 'FR', 'Rechercher', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCHRESULTS', 'FR', 'R?sultat de la recherche, veuillez faire votre choix', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEASRCH_MISSING_VARIATIONS', 'FR', 'Variations manquantes', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_ARTICLE', 'FR', 'S?lectionner un article', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_CH', 'FR', 'S?lectionner un canal', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_CHANNEL_CAT', 'FR', 'S?lectionner un canal et une cat?gorie', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_CLUSTER', 'FR', 'S?lectionner un cluster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_EVENT', 'FR', 'S?lectionner un ?v?nement ou un rendez-vous', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_FILE', 'FR', 'S?lectionner un fichier', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_MEM', 'FR', 'S?lectionner des membres', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_PTML', 'FR', 'S?lectionner un mod?le de page', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_VAR', 'FR', 'S?lectionner une variation', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECT', 'FR', 'S?lectionner', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECT_CI', 'FR', 'S?lectionner une entr?e de contenu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECT_CL', 'FR', 'S?lectionner une instance de cluster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECT_VARIATION', 'FR', 'S?lectionner une variation', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECTEDINSTANCE', 'FR', 'Instance de cluster s?lectionn', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECTEDOBJECT', 'FR', 'Entr?e de contenu actuellement s?lectionn', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECTOBJECT', 'FR', 'S?lectionnez une classe et sp?cifiez une position et un nom pour cr?er un nouvel objet.<br>Pour la position, utilisez 0 pour l''ins?rer au d?but, 999 pour l''ins?rer ? la fin ou n''importe quel autre position de votre choix.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECTONE', 'FR', 'Vous devez faire un choix ici !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELMULTIPLE', 'FR', 'Maintenez la touche CTRL enfonc?e pour s?lectionner plusieurs entr?es.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SET', 'FR', 'D?finir', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SHORTEST_PATHS', 'FR', 'Chemins les plus courts', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SHOW', 'FR', 'Montrer', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SHOW_ADVANCED_SEARCH', 'FR', 'Afficher les options de recherche avanc?es', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SHOW_ALL', 'FR', 'Tout montrer', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SHOW_PAGEWISE', 'FR', 'Montrer la mise en page', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SMA_EXT_EDIT', 'FR', 'Ouvrir une fen?tre d''?dition. Enregistrer d''abord tous les textes ?dit?s avant !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_BROWSE', 'FR', 'Plan du site', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_CLNEW', 'FR', 'Cr?er une nouvelle instance de cluster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_CONFDESC', 'FR', 'Vous pouvez lier cette page du site ? une instance existante du cluster ou cr?er une nouvelle instance. D?cidez ce que vous souhaitez faire.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_CONFIGURE', 'FR', 'Configurer la page', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_DELETE', 'FR', 'Supprimer une page du site', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_DELMES', 'FR', 'Vous ?tes sur le point de supprimer une page du site. Notez que toutes les instances vivantes de cette page seront ?galement supprim?es !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_EDIT', 'FR', 'Modifier une page du site', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_EXPIRE', 'FR', 'Expirer la page', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_EXPIREDATE', 'FR', 'Expir? depuis', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_IPROPERTIES', 'FR', 'Propri?t?s de la page', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_LAUNCH', 'FR', 'Lancer la page', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_LAUNCHDATE', 'FR', 'Actif depuis', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_LAUNCHDATES', 'FR', 'Configuration du temps de vie', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_LINK', 'FR', 'Lien vers une instance de cluster existante', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUDIRECT', 'FR', 'URL directe sur le serveur en ligne', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUDIRECTTIT', 'FR', 'D?finir le chemin optionnel sur le serveur pour un acc?s direct', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUDIRECTTITLE', 'FR', 'D?finir le chemin optionnel sur le serveur pour un acc?s direct', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUHELP', 'FR', 'Texte d''aide pour le menu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUNAME', 'FR', 'Nom dans le menu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUPROPS', 'FR', 'Nom du menu et texte d''aide', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_NEWINSTANCE', 'FR', 'Ajouter une page', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_NEWPAGE', 'FR', 'Ajouter une page', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_PDELETE', 'FR', 'Supprimer une page', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_PDELMES', 'FR', 'Vous ?tes sur le point de supprimer une page. Notez que toutes les instances vivantes de cette page seront ?galement supprim?es !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_PREVIEW', 'FR', 'Pr?visualisation de la page', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_PROPERTIES', 'FR', 'Propri?t?s de la page', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_RLTREE', 'FR', 'Rafra?chir l''arborescence', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM', 'FR', 'Page de site ma?tre', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_CLUSTER', 'FR', 'Mod?le de cluster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_EDIT', 'FR', 'Modifier la page de site ma?tre', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_LAUCH_SUCCESS', 'FR', 'Les pages d?finies sur le ma?tre ont ?t? relanc?es avec succ?s.<br>', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_META', 'FR', 'Mod?le de m?ta-cl', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_PATH', 'FR', 'Chemin du mod?le', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_RLAUNCH', 'FR', 'Rafra?chir les instances', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_SELECTTHUMB', 'FR', 'S?lectionner une vignette', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_THUMBNAIL', 'FR', 'Vignette', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_TYPE', 'FR', 'Type de page', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_VARIATIONS', 'FR', 'Variations affichables', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SR_SELECTCI', 'FR', 'Vous pouvez chercher n''importe quelle entr?e de contenu ici. Si vous voulez s?lectionner une entr?e de contenu, choisissez-la et appuyez sur le bouton Mettre ? jour. Si vous voulez relier un nouveau contenu ? ce champ, cr?ez d''abord le contenu dans le navigateur d''objet. ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SR_SELECTCLI', 'FR', 'S?lectionnez un mod?le de cluster. Ensuite, vous pourrez s?lectionner une instance de ce mod?le pour l''utiliser.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('START_BAK', 'FR', 'D?marrer la sauvegarde', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STARTDATE', 'FR', 'Date de d?marrage', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STARTTIME', 'FR', 'Heure de d?marrage', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STATS', 'FR', 'Statistiques', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STATS_HEADER', 'FR', 'Statistiques de trafic N/X 2004', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STATUS', 'FR', 'Etat :', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STEP', 'FR', 'Etape', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STNAME', 'FR', 'S?lectionner un nom pour identifier cette page dans le plan du site', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SYNC_CLUSTERS', 'FR', 'Synchroniser les clusters', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SYNC_CLUSTERS_DESCR', 'FR', 'Quand vous modifiez un mod?le de cluster, les clusters ne sont pas automatiquement synchronis?s. Ils sont synchronis?s quand vous travaillez avec la fois suivante. Vous pouvez tous les synchroniser.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TEMPLATE', 'FR', 'Mod?le', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TESTS', 'FR', 'Tests unitaires N/X', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TF', 'FR', 'Fuseau horaire', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('THISMONTH', 'FR', 'Ce mois-ci', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('THISWEEK', 'FR', 'Cette semaine', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('THISYEAR', 'FR', 'Cette ann', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TIME_BETW_VISITS', 'FR', 'Moyenne de temps entre les visites', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TIPP_TEMPLATE_1', 'FR', 'Les mod?les sont ? la base du fonctionnement de N/X. Vous aurez besoin de cr?er un mod?le de cluster en premier qui d?finira la structure et le type de contenu. Par la suite, vous pourrez cr?er les mod?les de pages ici en fusionnant un mod?le de cluster et un fichier PHP.<br><br>', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TITLE', 'FR', 'Titre', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TMPL_NAME', 'FR', 'S?lectionner un mod?le', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TODAY', 'FR', 'Aujourd''hui', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP', 'FR', 'Principales donn?es', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_BROWSER', 'FR', 'Principaux navigateurs', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_ENTRYPAGES', 'FR', 'Principales pages d''entr?es', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_EXITPAGES', 'FR', 'Principales pages de sortie', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_EXITT', 'FR', 'Principales cibles de sortie', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_HOSTS', 'FR', 'Principaux h?bergeurs', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_OS', 'FR', 'Principaux syst?mes d''exploitation', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_PAGES', 'FR', 'Principales pages', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_PATHS', 'FR', 'Principaux chemins', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_REFERER', 'FR', 'Principaux r?f?rents', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_SI', 'FR', 'Principaux moteurs de recherche', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_SKW', 'FR', 'Principaux mots-cl?s de recherche', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOTAL', 'FR', 'Total', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TRANS_TEMPL', 'FR', 'Traduit depuis', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TRANS_THIS', 'FR', 'Traduire ceci :', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TRANSLATION', 'FR', 'Syst?me de traduction N/X', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TT_REFRESH', 'FR', 'Rafra?chir les instances met ? jour les pages en cache dont le mod?le a ?t? modifi', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TT_RSTCI', 'FR', 'Dans N/X, chaque page a un cluster. En appuyant sur Red?finir l''instance du cluster, vous pouvez assigner un nouveau cluster ? la page et supprimer l''ancien.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TYPE', 'FR', 'Type', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('UNIQUE', 'FR', 'Ce champ doit ?tre unique !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('UP', 'FR', 'Haut', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('UP_INTRO', 'FR', 'S?lectionnez le groupe et ses r?les ? affecter ? l''utilisateur.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('UPL_TEXT', 'FR', 'Charger un fichier texte', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USAGE', 'FR', 'Utilisation', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_ACTIVE', 'FR', 'Compte activ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_AGENT', 'FR', 'Utiliser l''agent', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_BL', 'FR', 'Langage de l''interface', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_EMAIL', 'FR', 'E-mail', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_FILTERMENU', 'FR', 'Administration des utilisateurs', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_GENERAL', 'FR', 'Modifier les donn?es g?n?rales de l''utilisateur', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_HEAD', 'FR', 'Profil de l''utilisateur', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_JS', 'FR', 'Utiliser le Javascript', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_LINK', 'FR', 'Profils des utilisateurs', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_NAME', 'FR', 'Nom de l''utilisateur', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_PERMGRID', 'FR', 'Grille de permissions', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_PERMISSION', 'FR', 'Modifier les permissions de l''utilisateur', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_PERMISSIONS', 'FR', 'Permissions de l''utilisateur', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_PROFILE', 'FR', 'Mon profil', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_SETPERM', 'FR', 'D?finir les permissions de l''utilisateur ci-dessous. Pour enlever un utilisateur d''un groupe, retirez tous les groupes depuis celui-ci.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_TO_GROUP', 'FR', 'Ajouter un utilisateur au groupe', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USERPERM_HEAD', 'FR', 'Modifier les permissions de l''utilisateur', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('V_EDIT', 'FR', 'Modifier les variations', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('V_NAME', 'FR', 'Nom', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('V_SHORT', 'FR', 'Balise courte', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VAR_SUCCEEDED', 'FR', 'r?ussi !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VARIATIONS', 'FR', 'Variations disponibles', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VIS_FIRST', 'FR', 'Visiteurs pour la premi?re fois', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VIS_ONL', 'FR', 'Visiteurs en ligne', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VIS_PER_VIS', 'FR', 'Moyenne des visites par visiteur', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VIS_RET', 'FR', 'Visiteurs p?riodiques', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VISITORS', 'FR', 'Visiteurs', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VISITS', 'FR', 'Visites', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VISITS_OVERVIEW', 'FR', 'Vue d''ensemble des visites', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WEBSITE', 'FR', 'Site Web', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WEEKDAY', 'FR', 'Jours de la semaine', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WEEKDAY_AS', 'FR', 'Analyse des jours de la semaine', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WHEN', 'FR', 'Quand', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WRONGDATE', 'FR', 'La date saisie n''existe pas !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZ_ARTICLEIMPORT', 'FR', 'Assistant d''importation d''articles', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZ_ARTICLEIMPORT_TITLE', 'FR', 'Cet assistant est utilis? pour importer des donn?es d''articles depuis diff?rentes sources vers un canal. Vous pouvez importer depuis des multiples existantes ou d''autres canaux. Vous devez vous assurer que les mod?les correspondants sont compatibles. ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZ_EXPORT_TITLE', 'FR', 'Cet assistant est utilis? pour ?changer des clusters, des mod?les de clusters et des mod?les de pages entre votre installation N/X et d''autres installations. L''assistant produit un fichier XML que vous pouvez stocker sur votre disque dur local et ?changer avec d''autres utilisateurs de N/X.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZ_IMPORT_TITLE', 'FR', 'Cet assistant est utilis? pour importer vers N/X des donn?es qui ont ?t? pr?alablement export?es avec une autre installation de N/X. Vous devez supprimer une ressource avant de l''importer une deuxi?me fois.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_ARTICLEIMPORT_SRCTYPE', 'FR', 'S?lectionnez depuis quel type de source vous voulez importer les articles.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_ARTICLEIMPORT_TARGET', 'FR', 'A droite, vous devez choisir le canal cible. Tous les articles import?s seront stock?s dans ce canal.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_EXPORT_TYPE', 'FR', 'A droite, vous devez choisir le type de donn?es que vous voulez exporter. Les clusters stockent le contenu. Quand vous exportez des clusters, les mod?les sont ?galement automatiquement export?s. Les mod?les de clusters d?finissent la structure pour cr?er des clusters. Des mod?les de pages d?finissent la mise en page que les clusters vont utiliser en fonction de leur contenu.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_IMPORT_FILE', 'FR', 'Choisissez un fichier N/X-XML sur votre disque pour le charger dans le syst?me.<br./><br./>Le syst?me le contr?lera et montrera l''information d''?tat sur la prochaine page.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_IMPORT_VAL', 'FR', 'Le syst?me a v?rifi? l''exactitude du fichier XML charg?. Lisez le rapport ? gauche pour plus de d?tails.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_IMPORTING', 'FR', 'Le syst?me a tent? d''importer les donn?es. Lisez l''?tat ? droite.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_ARTICLEIMPORT_SRCTYPE', 'FR', 'S?lectionner le type de source', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_ARTICLEIMPORT_TARGET', 'FR', 'S?lectionner le canal cible', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_DESCR', 'FR', 'Ajouter une description', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_DESCR_EXPL', 'FR', 'Vous devriez ajouter une courte description aux donn?es export?es.</br.></br.>Celui qui importera les donn?es comprendra plus facilement ce qu''il a export', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_EXPORT_TYPE', 'FR', 'S?lectionner un type ? exporter', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_IMPORT_FILE', 'FR', 'S?lectionner un fichier N/X-XML ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_IMPORT_VAL', 'FR', 'Sommaire du XML charg', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_IMPORTING', 'FR', 'Donn?es en cours d''importation', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_KEEPCLUSTER', 'FR', 'Garder les clusters existants ?', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_KEEPCLUSTER_EXPL', 'FR', 'Vous pouvez indiquer si vous voulez garder les clusters existants ou cr?er des copies de chaque cluster.<br.><br.>Garder ? l''esprit que si vous gardez les clusters originaux vous les partagez avec la source originale.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_SEL_EXP_RES', 'FR', 'S?lectionner une ressource ? exporter', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('YES', 'FR', 'Oui', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('YESTERDAY', 'FR', 'Hier', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_ARTICLES', 'FR', 'Articles', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_GROUP', 'FR', 'Cluster Group', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PAGE_ID', 'FR', 'Page ID', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PROC_DATA', 'FR', 'Processing Data...', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MAINT_WWWDEV', 'EN', 'Dev Website Maintenance', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BB_IN_MM_MODE', 'EN', 'The backend is in maintenance at the moment. Only the Administrator can log in!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('POPUP_MENU', 'EN', 'Popup window', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PAR_PAGE', 'EN', 'Parent Page', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('IMP_IMAGES', 'EN', 'Import images', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_IMP_FOLDER', 'EN', 'Select import folder', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('IMP_IMPAGES', 'EN', 'Import Images', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZ_IMPORT_IM_TITLE', 'EN', 'This wizard is used for importing importing images to N/X. Pack the images into a zip archive. The wizard will then create the data.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_ARCHIVE_FILE', 'EN', 'Select Archive', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_ARCHIVE_FILE', 'EN', 'Please select the zip-archive you want to import. The images must be into that archive in a flat structure, having no folders.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MUST_UPLOAD', 'EN', 'You must upload a file to proceed!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ARCHERR', 'EN', 'The archive could not be properly imported. Check for php_zip extension!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_ACH_CHECK', 'EN', 'Check Archive', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NUMB_FILES', 'EN', 'Number of files found in archive: ', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_ARCH_CHECK', 'EN', 'Please control the result of the archive checks and press next if you want to resume.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_DEST_FOLDER', 'EN', 'Select destination folder', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_DEST_FOLDER', 'EN', 'Please select the folder, where all the new pictures will be copied to.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DEST_FOLDER', 'EN', 'Destination folder', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NUM_FILES', 'EN', 'Number of files found in archive: ', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_IMP_IMAG', 'EN', 'Importing images...', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOFI', 'EN', 'Number of files imported:', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACCESS_VIOLATION', 'EN', 'Access violation', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACCESS_V_TEXT', 'EN', 'You have not rights to access this object!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLEAR_JPCACHE', 'EN', 'Clear Cache', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WAS_DELETED', 'EN', 'The referenced object was deleted from library!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOGIN', 'EN', 'Sign In', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DESIGNS', 'EN', 'Layout Designs', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_ESERVICES', 'EN', 'E-Services', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTACTS', 'EN', 'Contacts', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SHOP', 'EN', 'Shop', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEWSLETTER', 'EN', 'Newsletter', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MAILINGS', 'EN', 'Mailings', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WEBSITEPRV', 'EN', 'Website preview', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCH WEBSITE', 'EN', 'Search Website', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHANGE', 'EN', 'Change', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACKEY', 'EN', 'Access Key', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTACTS_OVERVIEW', 'EN', 'Contacts Overview', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FIRSTNAME', 'EN', 'Firstname', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EMAIL', 'EN', 'E-Mail-Address', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CITY', 'EN', 'City', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LAST_MOD', 'EN', 'Last Modified', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCH2', 'EN', 'Search', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('OF', 'EN', 'of', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEWSLETTERS', 'EN', 'Newsletters', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SUBSCRIPTIONS', 'EN', 'Subscriptions', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACCESS_KEY', 'EN', 'Access Key', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('INSTALL_PGN', 'EN', 'Install a plugin', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ADTEXTAS', 'EN', 'AD-Javascript (copy from Google Adsense Homepage)', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATED_ITEM', 'EN', 'The following Placeholder was created:', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WYSIWYG', 'EN', 'WYSIWYG Editor', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LAUNCH_TREE', 'EN', 'Launch Tree', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXP_TREE', 'EN', 'Expire Tree', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DEL_TREE', 'EN', 'Delete Tree', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MORE_ACT', 'EN', 'More actions...', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MENU_DESIGNS', 'EN', 'Menu Designs', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOMENU', 'EN', 'No automatic menu drawing', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_MENU', 'EN', 'Select Menu Layout', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_MENUSTYLE', 'EN', 'Adjust Menu Type', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACTIVECOLOR', 'EN', 'Active Background-Color', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACTIVETCOLOR', 'EN', 'Active Text-Color', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACTIVETSCOLOR', 'EN', 'Active SubText-Color', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('INACTIVECOLOR', 'EN', 'Inactive Background-Color', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('INACTIVETCOLOR', 'EN', 'Inactive Text-Color', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RESETCLI', 'EN', 'Change Object', '');

-- --------------------------------------------------------

-- 
-- Table structure for table `internal_resources_languages`
-- 

DROP TABLE IF EXISTS `internal_resources_languages`;
CREATE TABLE `internal_resources_languages` (
  `LANGID` char(3) NOT NULL default '',
  `NAME` varchar(32) NOT NULL default '',
  `AGENT_LANGID` varchar(10) NOT NULL default '',
  `AGENT_CLASSID` varchar(36) NOT NULL default '',
  `AGENT_VERSION` varchar(7) NOT NULL default '',
  PRIMARY KEY  (`LANGID`),
  UNIQUE KEY `NAME` (`NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `internal_resources_languages`
-- 

INSERT INTO `internal_resources_languages` (`LANGID`, `NAME`, `AGENT_LANGID`, `AGENT_CLASSID`, `AGENT_VERSION`) VALUES ('EN', 'English', '0x0409', 'B8F2846E-CE36-11D0-AC83-00C04FD97575', '6,0,0,0');
INSERT INTO `internal_resources_languages` (`LANGID`, `NAME`, `AGENT_LANGID`, `AGENT_CLASSID`, `AGENT_VERSION`) VALUES ('DE', 'Deutsch', '0x0407', '1D87F5B5-05F1-11d2-AD7C-0000F8799342', '1,0,0,0');
INSERT INTO `internal_resources_languages` (`LANGID`, `NAME`, `AGENT_LANGID`, `AGENT_CLASSID`, `AGENT_VERSION`) VALUES ('IT', 'Italian', '0x0410', '1D87F5B6-05F1-11d2-AD7C-0000F8799342', '1,0,0,0');
INSERT INTO `internal_resources_languages` (`LANGID`, `NAME`, `AGENT_LANGID`, `AGENT_CLASSID`, `AGENT_VERSION`) VALUES ('MND', 'Chineese (Mandarin)', '', '', '');
INSERT INTO `internal_resources_languages` (`LANGID`, `NAME`, `AGENT_LANGID`, `AGENT_CLASSID`, `AGENT_VERSION`) VALUES ('PL', 'Polish', '12', '32', '65');
INSERT INTO `internal_resources_languages` (`LANGID`, `NAME`, `AGENT_LANGID`, `AGENT_CLASSID`, `AGENT_VERSION`) VALUES ('FR', 'French', '', '', '');

-- --------------------------------------------------------

-- 
-- Table structure for table `log`
-- 

DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `LOG_ID` bigint(20) NOT NULL default '0',
  `CATEGORY` varchar(16) NOT NULL default '',
  `MESSAGE` varchar(255) default NULL,
  `USER_ID` bigint(20) default NULL,
  `TARGET1_ID` bigint(20) default NULL,
  `TARGET2_ID` bigint(20) default NULL,
  `LOG_TIME` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  KEY `LOG_TIME` (`LOG_TIME`),
  KEY `CATEGORY` (`CATEGORY`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `log`
-- 

INSERT INTO `log` (`LOG_ID`, `CATEGORY`, `MESSAGE`, `USER_ID`, `TARGET1_ID`, `TARGET2_ID`, `LOG_TIME`) VALUES (100000, 'LAUNCH', 'C:Webcorps/www/text.php could not be deleted.', 1, NULL, NULL, '2006-08-09 22:05:37');
INSERT INTO `log` (`LOG_ID`, `CATEGORY`, `MESSAGE`, `USER_ID`, `TARGET1_ID`, `TARGET2_ID`, `LOG_TIME`) VALUES (100001, 'LAUNCH', 'C:Webcorps/www/std/index.php could not be deleted.', 1, NULL, NULL, '2006-08-09 22:05:37');
INSERT INTO `log` (`LOG_ID`, `CATEGORY`, `MESSAGE`, `USER_ID`, `TARGET1_ID`, `TARGET2_ID`, `LOG_TIME`) VALUES (100002, 'LAUNCH', 'C:Webcorps/www/std/index.html could not be deleted.', 1, NULL, NULL, '2006-08-09 22:05:37');
INSERT INTO `log` (`LOG_ID`, `CATEGORY`, `MESSAGE`, `USER_ID`, `TARGET1_ID`, `TARGET2_ID`, `LOG_TIME`) VALUES (100003, 'LAUNCH', 'C:Webcorps/www/std/test/index.php could not be deleted.', 1, NULL, NULL, '2006-08-09 22:07:46');
INSERT INTO `log` (`LOG_ID`, `CATEGORY`, `MESSAGE`, `USER_ID`, `TARGET1_ID`, `TARGET2_ID`, `LOG_TIME`) VALUES (100004, 'LAUNCH', 'C:Webcorps/www/std/test/index.html could not be deleted.', 1, NULL, NULL, '2006-08-09 22:07:46');
INSERT INTO `log` (`LOG_ID`, `CATEGORY`, `MESSAGE`, `USER_ID`, `TARGET1_ID`, `TARGET2_ID`, `LOG_TIME`) VALUES (100005, 'LAUNCH', 'C:Webcorps/www/std/test/index.html could not be deleted.', 1, NULL, NULL, '2006-08-09 22:07:47');

-- --------------------------------------------------------

-- 
-- Table structure for table `mailinglist`
-- 

DROP TABLE IF EXISTS `mailinglist`;
CREATE TABLE `mailinglist` (
  `MAILINGLIST_ID` bigint(20) NOT NULL default '0',
  `NAME` varchar(128) collate latin1_general_ci NOT NULL default '',
  `DESCRIPTION` text collate latin1_general_ci NOT NULL,
  `FROM_EMAIL` varchar(128) collate latin1_general_ci NOT NULL default '',
  `FROM_NAME` varchar(128) collate latin1_general_ci NOT NULL default '',
  `CHECK_SUBSCRIPTION` tinyint(4) NOT NULL default '0',
  `HTML` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`MAILINGLIST_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- Dumping data for table `mailinglist`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `messaging`
-- 

DROP TABLE IF EXISTS `messaging`;
CREATE TABLE `messaging` (
  `GUID` bigint(20) NOT NULL default '0',
  `SENDER_NAME` varchar(64) default NULL,
  `RECIPIENT_NAME` varchar(64) default NULL,
  `SENDER_GUID` bigint(20) default NULL,
  `RECIPIENT_GUID` bigint(20) default NULL,
  `SUBJECT` varchar(255) default NULL,
  `BODY` text,
  `CREATED` bigint(20) default NULL,
  `VIEWED` tinyint(4) NOT NULL default '0',
  `PRIORITY` tinyint(4) NOT NULL default '1',
  PRIMARY KEY  (`GUID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `messaging`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `meta`
-- 

DROP TABLE IF EXISTS `meta`;
CREATE TABLE `meta` (
  `MID` bigint(20) NOT NULL default '0',
  `MTI_ID` bigint(20) NOT NULL default '0',
  `CID` bigint(20) NOT NULL default '0',
  `VALUE` varchar(255) default NULL,
  `DELETED` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`MID`,`MTI_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `meta`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `meta_datatypes`
-- 

DROP TABLE IF EXISTS `meta_datatypes`;
CREATE TABLE `meta_datatypes` (
  `MTYPE_ID` mediumint(9) NOT NULL default '0',
  `NAME` varchar(16) NOT NULL default '',
  `DESCRIPTION` varchar(255) default NULL,
  PRIMARY KEY  (`MTYPE_ID`),
  UNIQUE KEY `MTYPE_ID` (`MTYPE_ID`,`NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `meta_datatypes`
-- 

INSERT INTO `meta_datatypes` (`MTYPE_ID`, `NAME`, `DESCRIPTION`) VALUES (1, 'Text', 'Single Line Input with Maximum of 64 chars');
INSERT INTO `meta_datatypes` (`MTYPE_ID`, `NAME`, `DESCRIPTION`) VALUES (2, 'Textarea', 'Four-Line Textarea with maximum of 255 chars of Input');
INSERT INTO `meta_datatypes` (`MTYPE_ID`, `NAME`, `DESCRIPTION`) VALUES (3, 'Color', 'Special Inputfield for entering a color.');

-- --------------------------------------------------------

-- 
-- Table structure for table `meta_template_items`
-- 

DROP TABLE IF EXISTS `meta_template_items`;
CREATE TABLE `meta_template_items` (
  `MTI_ID` bigint(20) NOT NULL default '0',
  `MT_ID` bigint(20) NOT NULL default '0',
  `NAME` varchar(32) NOT NULL default '',
  `POSITION` smallint(6) NOT NULL default '0',
  `MTYPE_ID` mediumint(9) NOT NULL default '0',
  `VERSION` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`MTI_ID`),
  UNIQUE KEY `MTI_ID` (`MTI_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `meta_template_items`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `meta_templates`
-- 

DROP TABLE IF EXISTS `meta_templates`;
CREATE TABLE `meta_templates` (
  `MT_ID` bigint(20) NOT NULL default '0',
  `NAME` varchar(32) NOT NULL default '',
  `DESCRIPTION` varchar(255) default NULL,
  `INTERNAL` tinyint(4) NOT NULL default '0',
  `VERSION` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`MT_ID`),
  UNIQUE KEY `MT_ID` (`MT_ID`,`NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `meta_templates`
-- 

INSERT INTO `meta_templates` (`MT_ID`, `NAME`, `DESCRIPTION`, `INTERNAL`, `VERSION`) VALUES (2, '-', NULL, 0, 0);
INSERT INTO `meta_templates` (`MT_ID`, `NAME`, `DESCRIPTION`, `INTERNAL`, `VERSION`) VALUES (100034, '-', '', 0, 10);

-- --------------------------------------------------------

-- 
-- Table structure for table `module_type`
-- 

DROP TABLE IF EXISTS `module_type`;
CREATE TABLE `module_type` (
  `MODULE_TYPE_ID` tinyint(4) NOT NULL default '0',
  `NAME` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`MODULE_TYPE_ID`),
  UNIQUE KEY `NAME` (`NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `module_type`
-- 

INSERT INTO `module_type` (`MODULE_TYPE_ID`, `NAME`) VALUES (1, 'Contenttype Extension');
INSERT INTO `module_type` (`MODULE_TYPE_ID`, `NAME`) VALUES (2, 'System Extension');
INSERT INTO `module_type` (`MODULE_TYPE_ID`, `NAME`) VALUES (3, 'CDS Extension');
INSERT INTO `module_type` (`MODULE_TYPE_ID`, `NAME`) VALUES (4, 'Textfilter Extension');

-- --------------------------------------------------------

-- 
-- Table structure for table `modules`
-- 

DROP TABLE IF EXISTS `modules`;
CREATE TABLE `modules` (
  `MODULE_ID` bigint(20) NOT NULL default '0',
  `MODULE_NAME` varchar(32) NOT NULL default '',
  `DESCRIPTION` varchar(255) default NULL,
  `VERSION` tinyint(4) NOT NULL default '0',
  `MT_ID` bigint(20) NOT NULL default '0',
  `CLASS` varchar(32) NOT NULL default '',
  `SOURCE` varchar(64) NOT NULL default '',
  `MODULE_TYPE_ID` tinyint(4) NOT NULL default '1',
  PRIMARY KEY  (`MODULE_ID`),
  UNIQUE KEY `MODULE_ID` (`MODULE_ID`,`MODULE_NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `modules`
-- 

INSERT INTO `modules` (`MODULE_ID`, `MODULE_NAME`, `DESCRIPTION`, `VERSION`, `MT_ID`, `CLASS`, `SOURCE`, `MODULE_TYPE_ID`) VALUES (100012, 'Image', 'Image. Allowed formats are GIF, JPEG and PNG.', 1, 100010, 'pgnImage', 'image/pgn_image.php', 1);
INSERT INTO `modules` (`MODULE_ID`, `MODULE_NAME`, `DESCRIPTION`, `VERSION`, `MT_ID`, `CLASS`, `SOURCE`, `MODULE_TYPE_ID`) VALUES (100018, 'Label', 'Text-Content with one line for input.', 1, 100016, 'pgnLabel', 'label/pgn_label.php', 1);
INSERT INTO `modules` (`MODULE_ID`, `MODULE_NAME`, `DESCRIPTION`, `VERSION`, `MT_ID`, `CLASS`, `SOURCE`, `MODULE_TYPE_ID`) VALUES (100024, 'Text', 'Text-Content with any length and format.', 2, 100022, 'pgnText', 'text/pgn_text.php', 1);
INSERT INTO `modules` (`MODULE_ID`, `MODULE_NAME`, `DESCRIPTION`, `VERSION`, `MT_ID`, `CLASS`, `SOURCE`, `MODULE_TYPE_ID`) VALUES (100048, 'Link', 'Link to pages', 1, 100047, 'pgnLink', 'link/pgn_link.php', 1);
INSERT INTO `modules` (`MODULE_ID`, `MODULE_NAME`, `DESCRIPTION`, `VERSION`, `MT_ID`, `CLASS`, `SOURCE`, `MODULE_TYPE_ID`) VALUES (100506, 'RSSReader', 'CDS-API-Extension for reading rss feeds', 1, 100505, 'pgnRSSReader', 'rssreader/pgn_rssreader.php', 3);
INSERT INTO `modules` (`MODULE_ID`, `MODULE_NAME`, `DESCRIPTION`, `VERSION`, `MT_ID`, `CLASS`, `SOURCE`, `MODULE_TYPE_ID`) VALUES (100510, 'RSSCreator', 'CDS-API-Extension for creating RSS-Feeds', 1, 100509, 'pgnRSSCreator', 'rsscreator/pgn_rsscreator.php', 3);
INSERT INTO `modules` (`MODULE_ID`, `MODULE_NAME`, `DESCRIPTION`, `VERSION`, `MT_ID`, `CLASS`, `SOURCE`, `MODULE_TYPE_ID`) VALUES (100663, 'CMS', 'CDS-API-Extension for creating, launching and editing Clusters.', 1, 100662, 'pgnCMS', 'cms/pgn_cms.php', 3);
INSERT INTO `modules` (`MODULE_ID`, `MODULE_NAME`, `DESCRIPTION`, `VERSION`, `MT_ID`, `CLASS`, `SOURCE`, `MODULE_TYPE_ID`) VALUES (100711, 'FAQ', 'CDS-API-Extension for realizing a FAQ', 1, 100710, 'pgnFAQ', 'faq/pgn_faq.php', 3);
INSERT INTO `modules` (`MODULE_ID`, `MODULE_NAME`, `DESCRIPTION`, `VERSION`, `MT_ID`, `CLASS`, `SOURCE`, `MODULE_TYPE_ID`) VALUES (100007, 'Adsense', 'Google Adsense Ad-Management Plugin.', 1, 100006, 'pgnAdsense', 'adsense/pgn_adsense.php', 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `pgn_adsense`
-- 

DROP TABLE IF EXISTS `pgn_adsense`;
CREATE TABLE `pgn_adsense` (
  `FKID` bigint(20) NOT NULL default '0',
  `ADTEXT` text collate latin1_general_ci,
  `IMPRESSIONS` bigint(20) NOT NULL default '0',
  `CLICKS` bigint(20) NOT NULL default '0',
  PRIMARY KEY  (`FKID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- Dumping data for table `pgn_adsense`
-- 

INSERT INTO `pgn_adsense` (`FKID`, `ADTEXT`, `IMPRESSIONS`, `CLICKS`) VALUES (100009, '&lt;script type=&quot;text/javascript&quot;&gt;&lt;!--\r\ngoogle_ad_client = &quot;pub-9320408685906498&quot;;\r\ngoogle_ad_width = 468;\r\ngoogle_ad_height = 60;\r\ngoogle_ad_format = &quot;468x60_as&quot;;\r\ngoogle_ad_type = &quot;text_image&quot;;\r\ngoogle_ad_channel =&quot;3676843672&quot;;\r\ngoogle_color_border = &quot;FFFFFF&quot;;\r\ngoogle_color_bg = &quot;FFFFFF&quot;;\r\ngoogle_color_link = &quot;990000&quot;;\r\ngoogle_color_text = &quot;333333&quot;;\r\ngoogle_color_url = &quot;999999&quot;;\r\n//--&gt;&lt;/script&gt;\r\n&lt;script type=&quot;text/javascript&quot;\r\n  src=&quot;http://pagead2.googlesyndication.com/pagead/show_ads.js&quot;&gt;\r\n&lt;/script&gt;', 0, 0);
INSERT INTO `pgn_adsense` (`FKID`, `ADTEXT`, `IMPRESSIONS`, `CLICKS`) VALUES (100047, '&lt;script type=&quot;text/javascript&quot;&gt;&lt;!--\r\ngoogle_ad_client = &quot;pub-9320408685906498&quot;;\r\ngoogle_ad_width = 160;\r\ngoogle_ad_height = 600;\r\ngoogle_ad_format = &quot;160x600_as&quot;;\r\ngoogle_ad_type = &quot;text_image&quot;;\r\ngoogle_ad_channel =&quot;3676843672&quot;;\r\ngoogle_color_border = &quot;FFFFFF&quot;;\r\ngoogle_color_bg = &quot;FFFFFF&quot;;\r\ngoogle_color_link = &quot;990000&quot;;\r\ngoogle_color_text = &quot;333333&quot;;\r\ngoogle_color_url = &quot;999999&quot;;\r\n//--&gt;&lt;/script&gt;\r\n&lt;script type=&quot;text/javascript&quot;\r\n  src=&quot;http://pagead2.googlesyndication.com/pagead/show_ads.js&quot;&gt;\r\n&lt;/script&gt;', 0, 0);
INSERT INTO `pgn_adsense` (`FKID`, `ADTEXT`, `IMPRESSIONS`, `CLICKS`) VALUES (100049, '&lt;script type=&quot;text/javascript&quot;&gt;&lt;!--\r\ngoogle_ad_client = &quot;pub-9320408685906498&quot;;\r\ngoogle_ad_width = 125;\r\ngoogle_ad_height = 125;\r\ngoogle_ad_format = &quot;125x125_as_rimg&quot;;\r\ngoogle_cpa_choice = &quot;CAAQsdyWhAIaCMvLJa9eDHjiKJ_D93M&quot;;\r\ngoogle_ad_channel = &quot;3608138593&quot;;\r\n//--&gt;&lt;/script&gt;\r\n&lt;script type=&quot;text/javascript&quot; src=&quot;http://pagead2.googlesyndication.com/pagead/show_ads.js&quot;&gt;\r\n&lt;/script&gt;', 0, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `pgn_config_store`
-- 

DROP TABLE IF EXISTS `pgn_config_store`;
CREATE TABLE `pgn_config_store` (
  `CLTI_ID` bigint(20) NOT NULL default '0',
  `TEXT1` varchar(255) default NULL,
  `TEXT2` varchar(255) default NULL,
  `TEXT3` varchar(255) default NULL,
  `TEXT4` varchar(255) default NULL,
  `TEXT5` varchar(255) default NULL,
  `TEXT6` varchar(255) default NULL,
  `TEXT7` varchar(255) default NULL,
  `TEXT8` varchar(255) default NULL,
  `TEXT9` varchar(255) default NULL,
  `TEXT10` varchar(255) default NULL,
  `TEXT11` varchar(255) default NULL,
  `TEXT12` varchar(255) default NULL,
  `TEXT13` varchar(255) default NULL,
  `TEXT14` varchar(255) default NULL,
  `TEXT15` varchar(255) default NULL,
  `NUMBER1` bigint(20) default NULL,
  `NUMBER2` bigint(20) default NULL,
  `NUMBER3` bigint(20) default NULL,
  `NUMBER4` bigint(20) default NULL,
  `NUMBER5` bigint(20) default NULL,
  `NUMBER6` bigint(20) default NULL,
  `NUMBER7` bigint(20) default NULL,
  `NUMBER8` bigint(20) default NULL,
  `NUMBER9` bigint(20) default NULL,
  `NUMBER10` bigint(20) default NULL,
  `NUMBER11` bigint(20) default NULL,
  `NUMBER12` bigint(20) default NULL,
  `NUMBER13` bigint(20) default NULL,
  `NUMBER14` bigint(20) default NULL,
  `NUMBER15` bigint(20) default NULL,
  `DATE1` datetime default NULL,
  `DATE2` datetime default NULL,
  `DATE3` datetime default NULL,
  `DATE4` datetime default NULL,
  `DATE5` datetime default NULL,
  PRIMARY KEY  (`CLTI_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `pgn_config_store`
-- 

INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100002, 'h1', '#152B36', '#F4FEFD', 'Zrnic', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100111, 'h2', '#152b36', '#f4fefd', 'Zrnic', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 24, 200, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100123, 'h1', '#152b36', '#f4fefd', 'Zrnic', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100321, 'West', '#152b36', '#f4fefd', 'Zrnic', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100322, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100345, 'h1', '#152b36', '#f4fefd', 'Zrnic', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100455, 'h1', '#152b36', '#f4fefd', 'Zrnic', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100527, '400', '80', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100556, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100598, 'h1', '#152b36', '#f4fefd', 'Zrnic', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100733, 'h1', '#152b36', '#f4fefd', 'Zrnic', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100714, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100832, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100341, 'h2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100398, 'h3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100401, 'h3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100400, 'h3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100399, 'h3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (101178, 'h1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100179, 'h1', '#152b36', '#f4fefd', 'Zrnic', '', '', '', '', '', '', '', '', '', '', '', 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100466, 'h3', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100467, 'h3', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100468, 'h3', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100469, 'h3', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100190, 'h2', '#152b36', '#f4fefd', 'Zrnic', '', '', '', '', '', '', '', '', '', '', '', 24, 200, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100021, 'h1', '#152B36', '#F4FEFD', 'Zrnic', '', '', '', '', '', '', '', '', '', '', '', 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (101905, 'h1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100479, 'h1', '#152b36', '#f4fefd', 'Zrnic', '', '', '', '', '', '', '', '', '', '', '', 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100606, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100622, 'h1', '#152b36', '#f4fefd', 'Zrnic', '', '', '', '', '', '', '', '', '', '', '', 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100778, 'h1', '#152b36', '#f4fefd', 'Zrnic', '', '', '', '', '', '', '', '', '', '', '', 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100491, 'h1', '#152b36', '#f4fefd', 'Zrnic', '', '', '', '', '', '', '', '', '', '', '', 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100350, 'h2', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100351, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100844, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100845, 'h2', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100015, 'head1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100016, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100035, 'head1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100036, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

-- 
-- Table structure for table `pgn_image`
-- 

DROP TABLE IF EXISTS `pgn_image`;
CREATE TABLE `pgn_image` (
  `FKID` bigint(20) NOT NULL default '0',
  `FILENAME` varchar(32) default NULL,
  `ALT` varchar(64) default NULL,
  `WIDTH` smallint(6) default NULL,
  `HEIGHT` smallint(6) default NULL,
  `COPYRIGHT` varchar(64) default NULL,
  PRIMARY KEY  (`FKID`),
  UNIQUE KEY `FKID` (`FKID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `pgn_image`
-- 

INSERT INTO `pgn_image` (`FKID`, `FILENAME`, `ALT`, `WIDTH`, `HEIGHT`, `COPYRIGHT`) VALUES (100003, '100003.gif', 'Logo', 120, 60, '');

-- --------------------------------------------------------

-- 
-- Table structure for table `pgn_label`
-- 

DROP TABLE IF EXISTS `pgn_label`;
CREATE TABLE `pgn_label` (
  `FKID` bigint(20) NOT NULL default '0',
  `CONTENT` varchar(255) default NULL,
  PRIMARY KEY  (`FKID`),
  UNIQUE KEY `FKID` (`FKID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `pgn_label`
-- 

INSERT INTO `pgn_label` (`FKID`, `CONTENT`) VALUES (100022, '<DIV class=head1>Title of this page</DIV>');
INSERT INTO `pgn_label` (`FKID`, `CONTENT`) VALUES (100039, '<DIV class=head1>Title of this page</DIV>');

-- --------------------------------------------------------

-- 
-- Table structure for table `pgn_link`
-- 

DROP TABLE IF EXISTS `pgn_link`;
CREATE TABLE `pgn_link` (
  `FKID` bigint(20) NOT NULL default '0',
  `LABEL` varchar(255) default NULL,
  `EXTERNAL` tinyint(4) NOT NULL default '0',
  `HREF` varchar(128) default NULL,
  `SPID` bigint(20) default NULL,
  `TARGET` varchar(32) default NULL,
  PRIMARY KEY  (`FKID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `pgn_link`
-- 

INSERT INTO `pgn_link` (`FKID`, `LABEL`, `EXTERNAL`, `HREF`, `SPID`, `TARGET`) VALUES (100057, 'Forum', 0, 'http://www.nxsystems.org/xmb', 0, '');

-- --------------------------------------------------------

-- 
-- Table structure for table `pgn_text`
-- 

DROP TABLE IF EXISTS `pgn_text`;
CREATE TABLE `pgn_text` (
  `FKID` bigint(20) NOT NULL default '0',
  `CONTENT` longtext,
  PRIMARY KEY  (`FKID`),
  UNIQUE KEY `FKID` (`FKID`),
  FULLTEXT KEY `CONTENT` (`CONTENT`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `pgn_text`
-- 

INSERT INTO `pgn_text` (`FKID`, `CONTENT`) VALUES (100023, 'This is a demotext');
INSERT INTO `pgn_text` (`FKID`, `CONTENT`) VALUES (100040, 'This is a demotext');

-- --------------------------------------------------------

-- 
-- Table structure for table `pot_accesslog`
-- 

DROP TABLE IF EXISTS `pot_accesslog`;
CREATE TABLE `pot_accesslog` (
  `accesslog_id` int(11) NOT NULL default '0',
  `timestamp` int(10) unsigned NOT NULL default '0',
  `document_id` int(11) NOT NULL default '0',
  `exit_target_id` int(11) NOT NULL default '0',
  `entry_document` tinyint(3) unsigned NOT NULL default '0',
  KEY `accesslog_id` (`accesslog_id`),
  KEY `client_time` (`timestamp`),
  KEY `document_id` (`document_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 DELAY_KEY_WRITE=1;

-- 
-- Dumping data for table `pot_accesslog`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `pot_add_data`
-- 

DROP TABLE IF EXISTS `pot_add_data`;
CREATE TABLE `pot_add_data` (
  `accesslog_id` int(11) NOT NULL default '0',
  `data_field` varchar(32) NOT NULL default '',
  `data_value` varchar(255) NOT NULL default '',
  KEY `accesslog_id` (`accesslog_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 DELAY_KEY_WRITE=1;

-- 
-- Dumping data for table `pot_add_data`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `pot_documents`
-- 

DROP TABLE IF EXISTS `pot_documents`;
CREATE TABLE `pot_documents` (
  `data_id` int(11) NOT NULL default '0',
  `string` varchar(255) NOT NULL default '',
  `document_url` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`data_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 DELAY_KEY_WRITE=1;

-- 
-- Dumping data for table `pot_documents`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `pot_exit_targets`
-- 

DROP TABLE IF EXISTS `pot_exit_targets`;
CREATE TABLE `pot_exit_targets` (
  `data_id` int(11) NOT NULL default '0',
  `string` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`data_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 DELAY_KEY_WRITE=1;

-- 
-- Dumping data for table `pot_exit_targets`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `pot_hostnames`
-- 

DROP TABLE IF EXISTS `pot_hostnames`;
CREATE TABLE `pot_hostnames` (
  `data_id` int(11) NOT NULL default '0',
  `string` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`data_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 DELAY_KEY_WRITE=1;

-- 
-- Dumping data for table `pot_hostnames`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `pot_nxlog`
-- 

DROP TABLE IF EXISTS `pot_nxlog`;
CREATE TABLE `pot_nxlog` (
  `accesslog_id` int(11) NOT NULL default '0',
  `weekday` int(1) NOT NULL default '0',
  `hour` int(2) NOT NULL default '0',
  `starttime` int(10) NOT NULL default '0',
  `endtime` int(10) NOT NULL default '0',
  `pi` int(4) NOT NULL default '0',
  `duration` int(11) NOT NULL default '0',
  PRIMARY KEY  (`accesslog_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 DELAY_KEY_WRITE=1;

-- 
-- Dumping data for table `pot_nxlog`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `pot_operating_systems`
-- 

DROP TABLE IF EXISTS `pot_operating_systems`;
CREATE TABLE `pot_operating_systems` (
  `data_id` int(11) NOT NULL default '0',
  `string` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`data_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 DELAY_KEY_WRITE=1;

-- 
-- Dumping data for table `pot_operating_systems`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `pot_referers`
-- 

DROP TABLE IF EXISTS `pot_referers`;
CREATE TABLE `pot_referers` (
  `data_id` int(11) NOT NULL default '0',
  `string` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`data_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 DELAY_KEY_WRITE=1;

-- 
-- Dumping data for table `pot_referers`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `pot_search_engines`
-- 

DROP TABLE IF EXISTS `pot_search_engines`;
CREATE TABLE `pot_search_engines` (
  `accesslog_id` int(11) NOT NULL default '0',
  `search_engine` varchar(64) NOT NULL default '',
  `keywords` varchar(254) NOT NULL default '',
  PRIMARY KEY  (`accesslog_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 DELAY_KEY_WRITE=1;

-- 
-- Dumping data for table `pot_search_engines`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `pot_user_agents`
-- 

DROP TABLE IF EXISTS `pot_user_agents`;
CREATE TABLE `pot_user_agents` (
  `data_id` int(11) NOT NULL default '0',
  `string` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`data_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 DELAY_KEY_WRITE=1;

-- 
-- Dumping data for table `pot_user_agents`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `pot_visitors`
-- 

DROP TABLE IF EXISTS `pot_visitors`;
CREATE TABLE `pot_visitors` (
  `accesslog_id` int(11) NOT NULL default '0',
  `visitor_id` int(11) NOT NULL default '0',
  `client_id` int(10) unsigned NOT NULL default '0',
  `operating_system_id` int(11) NOT NULL default '0',
  `user_agent_id` int(11) NOT NULL default '0',
  `host_id` int(11) NOT NULL default '0',
  `referer_id` int(11) NOT NULL default '0',
  `timestamp` int(10) unsigned NOT NULL default '0',
  `returning_visitor` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`accesslog_id`),
  KEY `client_time` (`client_id`,`timestamp`),
  KEY `os_ua` (`operating_system_id`,`user_agent_id`),
  KEY `host_id` (`host_id`),
  KEY `referer_id` (`referer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 DELAY_KEY_WRITE=1;

-- 
-- Dumping data for table `pot_visitors`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `registry`
-- 

DROP TABLE IF EXISTS `registry`;
CREATE TABLE `registry` (
  `REGID` bigint(20) NOT NULL default '0',
  `REGNAME` varchar(32) NOT NULL default '',
  `VALUE` varchar(255) NOT NULL default '',
  `PARENTREGID` bigint(20) NOT NULL default '0',
  PRIMARY KEY  (`REGID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `registry`
-- 

INSERT INTO `registry` (`REGID`, `REGNAME`, `VALUE`, `PARENTREGID`) VALUES (100680, 'PLUGINS', '', 0);
INSERT INTO `registry` (`REGID`, `REGNAME`, `VALUE`, `PARENTREGID`) VALUES (100681, 'FAQ', '', 100680);
INSERT INTO `registry` (`REGID`, `REGNAME`, `VALUE`, `PARENTREGID`) VALUES (100682, 'CLT', '100712', 100681);
INSERT INTO `registry` (`REGID`, `REGNAME`, `VALUE`, `PARENTREGID`) VALUES (101146, 'SYSTEM', '', 0);
INSERT INTO `registry` (`REGID`, `REGNAME`, `VALUE`, `PARENTREGID`) VALUES (101147, 'MAINTENANCE', '', 101146);
INSERT INTO `registry` (`REGID`, `REGNAME`, `VALUE`, `PARENTREGID`) VALUES (101148, 'WWWDEV', '', 101147);
INSERT INTO `registry` (`REGID`, `REGNAME`, `VALUE`, `PARENTREGID`) VALUES (101149, 'WWW', '', 101147);
INSERT INTO `registry` (`REGID`, `REGNAME`, `VALUE`, `PARENTREGID`) VALUES (101150, 'BB', '', 101147);
INSERT INTO `registry` (`REGID`, `REGNAME`, `VALUE`, `PARENTREGID`) VALUES (100024, 'CDS', '', 0);
INSERT INTO `registry` (`REGID`, `REGNAME`, `VALUE`, `PARENTREGID`) VALUES (100025, 'MENU', 'tabmenu/dc_tabmenu.php', 100024);
INSERT INTO `registry` (`REGID`, `REGNAME`, `VALUE`, `PARENTREGID`) VALUES (100026, 'COLORACTIVE', '#6699cc', 100025);
INSERT INTO `registry` (`REGID`, `REGNAME`, `VALUE`, `PARENTREGID`) VALUES (100027, 'COLORTACTIVE', '#cbe5ff', 100025);
INSERT INTO `registry` (`REGID`, `REGNAME`, `VALUE`, `PARENTREGID`) VALUES (100028, 'COLORSTACTIVE', '#ffffff', 100025);
INSERT INTO `registry` (`REGID`, `REGNAME`, `VALUE`, `PARENTREGID`) VALUES (100029, 'COLORINACTIVE', '#efefef', 100025);
INSERT INTO `registry` (`REGID`, `REGNAME`, `VALUE`, `PARENTREGID`) VALUES (100030, 'COLORTINACTIVE', '#0000ff', 100025);

-- --------------------------------------------------------

-- 
-- Table structure for table `role_sys_functions`
-- 

DROP TABLE IF EXISTS `role_sys_functions`;
CREATE TABLE `role_sys_functions` (
  `ROLE_ID` bigint(20) NOT NULL default '0',
  `FUNCTION_ID` char(16) NOT NULL default '',
  KEY `ROLE_ID` (`ROLE_ID`,`FUNCTION_ID`),
  KEY `FUNCTION_ID` (`FUNCTION_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `role_sys_functions`
-- 

INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'ADD_SITEPAGE');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'ADD_SP_MASTER');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'ADMINISTRATION_M');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'ALLOW_CMS_LOGIN');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'B_CL_EDIT_ALL');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'B_CL_USAGE');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'B_DESTROY_TREE');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'B_EDIT_ALL');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'B_LIVE_AUTHORING');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'B_PREVIEW_PAGE');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'B_RELAUNCH_INST');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'B_RELAUNCH_TREE');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'B_USAGE');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'CLEAR_CACHE');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'CL_BROWSER');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'CL_PROPS');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'CL_TEMP_BROWSER');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'CL_USAGE');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'C_ACTIVE');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'C_CACHE');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'DELETE_CL');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'DELETE_CL_TEMP');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'DELETE_FOLDER');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'DELETE_OBJECT');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'DELETE_SITEPAGE');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'DELETE_SP_MASTER');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'DIRECT_URL');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'EDIT_CL_CONTENT');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'EDIT_CL_TEMP');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'EDIT_CONTENT');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'EDIT_META_DATA');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'EDIT_OBJECT');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'ED_CL_TEMP_PROPS');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'ED_FOLDER_PROPS');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'EXPLORE_SITE_M');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'EXPLORE_SITE_S');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'MAINTENANCE');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'MENU');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'META_TEMP');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'MY_PORTALS');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'MY_PROFILE');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'NEW_CL_TEMP');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'NEW_FOLDER');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'NEW_OBJECT');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'OBJECT_BROWSER');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'OBJECT_PROPS');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'OBJ_USAGE');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'PORTAL_MANAGER');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'RESOURCES_M');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'ROLLOUT');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'SITEPAGE_MASTER');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'SITEPAGE_PROPS');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (2, 'VARIATIONS');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (3, 'ADD_SITEPAGE');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (3, 'ADMINISTRATION_M');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (3, 'ALLOW_CMS_LOGIN');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (3, 'B_CL_EDIT_ALL');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (3, 'B_CL_USAGE');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (3, 'B_EDIT_ALL');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (3, 'B_LIVE_AUTHORING');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (3, 'B_PREVIEW_PAGE');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (3, 'B_USAGE');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (3, 'CL_BROWSER');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (3, 'CL_PROPS');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (3, 'DELETE_OBJECT');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (3, 'DELETE_SITEPAGE');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (3, 'EDIT_CL_CONTENT');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (3, 'EDIT_CONTENT');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (3, 'EDIT_META_DATA');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (3, 'EDIT_OBJECT');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (3, 'EXPLORE_SITE_M');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (3, 'EXPLORE_SITE_S');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (3, 'MENU');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (3, 'MY_PORTALS');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (3, 'MY_PROFILE');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (3, 'NEW_FOLDER');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (3, 'NEW_OBJECT');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (3, 'OBJECT_BROWSER');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (3, 'OBJECT_PROPS');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (3, 'RESOURCES_M');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (3, 'SITEPAGE_PROPS');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (5, 'ADMINISTRATION_M');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (5, 'ALLOW_CMS_LOGIN');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (5, 'B_EDIT_ALL');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (5, 'B_LIVE_AUTHORING');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (5, 'B_PREVIEW_PAGE');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (5, 'B_RELAUNCH_TREE');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (5, 'B_USAGE');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (5, 'EDIT_CONTENT');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (5, 'EDIT_META_DATA');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (5, 'EXPLORE_SITE_M');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (5, 'EXPLORE_SITE_S');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (5, 'MENU');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (5, 'MY_PORTALS');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (5, 'MY_PROFILE');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (5, 'PLUGINS_M');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (5, 'SITEPAGE_PROPS');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (100255, 'COMMUNITY_LOGIN');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (100328, 'ADMINISTRATION_M');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (100328, 'ALLOW_CMS_LOGIN');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (100328, 'B_CL_EDIT_ALL');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (100328, 'B_EDIT_ALL');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (100328, 'B_EXPIRE_LAUNCH');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (100328, 'B_LIVE_AUTHORING');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (100328, 'B_PREVIEW_PAGE');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (100328, 'DELETE_OBJECT');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (100328, 'EDIT_CL_CONTENT');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (100328, 'EDIT_CONTENT');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (100328, 'EDIT_META_DATA');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (100328, 'EDIT_OBJECT');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (100328, 'EXPLORE_SITE_M');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (100328, 'MENU');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (100328, 'MY_PROFILE');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (100328, 'NEW_OBJECT');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (100328, 'OBJECT_BROWSER');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (100328, 'OBJECT_PROPS');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (100328, 'OBJ_USAGE');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (100328, 'RESOURCES_M');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (100329, 'ADMINISTRATION_M');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (100329, 'ALLOW_CMS_LOGIN');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (100329, 'MY_PROFILE');
INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES (100329, 'TRAFFIC');

-- --------------------------------------------------------

-- 
-- Table structure for table `roles`
-- 

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `ROLE_ID` bigint(20) NOT NULL default '0',
  `ROLE_NAME` varchar(32) NOT NULL default '',
  `DESCRIPTION` varchar(255) default NULL,
  PRIMARY KEY  (`ROLE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `roles`
-- 

INSERT INTO `roles` (`ROLE_ID`, `ROLE_NAME`, `DESCRIPTION`) VALUES (1, 'Administrator', '');
INSERT INTO `roles` (`ROLE_ID`, `ROLE_NAME`, `DESCRIPTION`) VALUES (2, 'Developer', '');
INSERT INTO `roles` (`ROLE_ID`, `ROLE_NAME`, `DESCRIPTION`) VALUES (3, 'Editor', '');
INSERT INTO `roles` (`ROLE_ID`, `ROLE_NAME`, `DESCRIPTION`) VALUES (5, 'Quality Manager', 'Checks, wether the quality of content is alright or not.');
INSERT INTO `roles` (`ROLE_ID`, `ROLE_NAME`, `DESCRIPTION`) VALUES (100328, 'Portal Editor', '');
INSERT INTO `roles` (`ROLE_ID`, `ROLE_NAME`, `DESCRIPTION`) VALUES (100329, 'Analyst', '');
INSERT INTO `roles` (`ROLE_ID`, `ROLE_NAME`, `DESCRIPTION`) VALUES (100255, 'Community', '');

-- --------------------------------------------------------

-- 
-- Table structure for table `sequences`
-- 

DROP TABLE IF EXISTS `sequences`;
CREATE TABLE `sequences` (
  `seq` varchar(32) NOT NULL default '',
  `val` bigint(20) NOT NULL default '1000'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `sequences`
-- 

INSERT INTO `sequences` (`seq`, `val`) VALUES ('GUID', 100058);
INSERT INTO `sequences` (`seq`, `val`) VALUES ('log', 100006);

-- --------------------------------------------------------

-- 
-- Table structure for table `sessions`
-- 

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `SESSKEY` varchar(32) NOT NULL default '',
  `EXPIRY` int(11) unsigned NOT NULL default '0',
  `DATA` text NOT NULL,
  PRIMARY KEY  (`SESSKEY`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `sessions`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `shop_tax`
-- 

DROP TABLE IF EXISTS `shop_tax`;
CREATE TABLE `shop_tax` (
  `TAX_ID` bigint(20) NOT NULL default '0',
  `NAME` varchar(128) collate latin1_general_ci NOT NULL default '',
  `PERCENT` float NOT NULL default '0',
  PRIMARY KEY  (`TAX_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- Dumping data for table `shop_tax`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `sitemap`
-- 

DROP TABLE IF EXISTS `sitemap`;
CREATE TABLE `sitemap` (
  `MENU_ID` bigint(20) NOT NULL default '0',
  `PARENT_ID` bigint(20) NOT NULL default '0',
  `SPM_ID` bigint(20) NOT NULL default '0',
  `NAME` varchar(32) NOT NULL default '',
  `POSITION` tinyint(4) NOT NULL default '0',
  `IS_POPUP` tinyint(4) NOT NULL default '0',
  `DELETED` tinyint(4) NOT NULL default '0',
  `VERSION` tinyint(4) NOT NULL default '0',
  `IS_DISPLAYED` tinyint(1) NOT NULL default '1',
  `IS_CACHED` tinyint(1) NOT NULL default '1',
  `IS_LOCKED` tinyint(4) NOT NULL default '0',
  `CC_ON_LAUNCH` varchar(255) default NULL,
  PRIMARY KEY  (`MENU_ID`),
  KEY `PARENT_ID` (`PARENT_ID`),
  KEY `SPM_ID` (`SPM_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `sitemap`
-- 

INSERT INTO `sitemap` (`MENU_ID`, `PARENT_ID`, `SPM_ID`, `NAME`, `POSITION`, `IS_POPUP`, `DELETED`, `VERSION`, `IS_DISPLAYED`, `IS_CACHED`, `IS_LOCKED`, `CC_ON_LAUNCH`) VALUES (100018, 0, 100017, 'test', 1, 0, 0, 0, 1, 1, 0, NULL);
INSERT INTO `sitemap` (`MENU_ID`, `PARENT_ID`, `SPM_ID`, `NAME`, `POSITION`, `IS_POPUP`, `DELETED`, `VERSION`, `IS_DISPLAYED`, `IS_CACHED`, `IS_LOCKED`, `CC_ON_LAUNCH`) VALUES (100041, 100042, 100032, 'test', 1, 0, 0, 10, 1, 1, 0, NULL);
INSERT INTO `sitemap` (`MENU_ID`, `PARENT_ID`, `SPM_ID`, `NAME`, `POSITION`, `IS_POPUP`, `DELETED`, `VERSION`, `IS_DISPLAYED`, `IS_CACHED`, `IS_LOCKED`, `CC_ON_LAUNCH`) VALUES (100053, 100018, 100052, 'Forum', 1, 1, 0, 0, 1, 1, 0, '');

-- --------------------------------------------------------

-- 
-- Table structure for table `sitepage`
-- 

DROP TABLE IF EXISTS `sitepage`;
CREATE TABLE `sitepage` (
  `SPID` bigint(20) NOT NULL default '0',
  `SPM_ID` bigint(20) NOT NULL default '0',
  `MENU_ID` bigint(20) NOT NULL default '0',
  `POSITION` tinyint(4) NOT NULL default '0',
  `CLNID` bigint(20) NOT NULL default '0',
  `LAUNCH_DATE` datetime default NULL,
  `EXPIRE_DATE` datetime default NULL,
  `POPUP_WINDOW` tinyint(4) NOT NULL default '0',
  `DELETED` tinyint(4) NOT NULL default '0',
  `VERSION` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`SPID`),
  KEY `SPM_ID` (`SPM_ID`),
  KEY `MENU_ID` (`MENU_ID`),
  KEY `CLNID` (`CLNID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `sitepage`
-- 

INSERT INTO `sitepage` (`SPID`, `SPM_ID`, `MENU_ID`, `POSITION`, `CLNID`, `LAUNCH_DATE`, `EXPIRE_DATE`, `POPUP_WINDOW`, `DELETED`, `VERSION`) VALUES (100019, 100017, 100018, 1, 100020, NULL, NULL, 0, 0, 0);
INSERT INTO `sitepage` (`SPID`, `SPM_ID`, `MENU_ID`, `POSITION`, `CLNID`, `LAUNCH_DATE`, `EXPIRE_DATE`, `POPUP_WINDOW`, `DELETED`, `VERSION`) VALUES (100031, 100032, 100041, 1, 100037, NULL, NULL, 0, 0, 10);
INSERT INTO `sitepage` (`SPID`, `SPM_ID`, `MENU_ID`, `POSITION`, `CLNID`, `LAUNCH_DATE`, `EXPIRE_DATE`, `POPUP_WINDOW`, `DELETED`, `VERSION`) VALUES (100054, 100052, 100053, 1, 100055, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `sitepage_master`
-- 

DROP TABLE IF EXISTS `sitepage_master`;
CREATE TABLE `sitepage_master` (
  `SPM_ID` bigint(20) NOT NULL default '0',
  `NAME` varchar(32) NOT NULL default '',
  `DESCRIPTION` varchar(255) NOT NULL default '0',
  `TEMPLATE_PATH` varchar(64) default NULL,
  `CLT_ID` bigint(20) NOT NULL default '0',
  `SPMTYPE_ID` bigint(20) NOT NULL default '0',
  `DELETED` tinyint(4) NOT NULL default '0',
  `THUMBNAIL` varchar(64) default NULL,
  `VERSION` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`SPM_ID`),
  KEY `CLT_ID` (`CLT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `sitepage_master`
-- 

INSERT INTO `sitepage_master` (`SPM_ID`, `NAME`, `DESCRIPTION`, `TEMPLATE_PATH`, `CLT_ID`, `SPMTYPE_ID`, `DELETED`, `THUMBNAIL`, `VERSION`) VALUES (100017, 'Text', '- Headline\r\n- HTML-Text', 'text.php', 100014, 1, 0, 'image_top_left.png', 0);
INSERT INTO `sitepage_master` (`SPM_ID`, `NAME`, `DESCRIPTION`, `TEMPLATE_PATH`, `CLT_ID`, `SPMTYPE_ID`, `DELETED`, `THUMBNAIL`, `VERSION`) VALUES (100032, 'Text', '- Headline\r\n- HTML-Text', 'text.php', 100033, 1, 0, NULL, 10);
INSERT INTO `sitepage_master` (`SPM_ID`, `NAME`, `DESCRIPTION`, `TEMPLATE_PATH`, `CLT_ID`, `SPMTYPE_ID`, `DELETED`, `THUMBNAIL`, `VERSION`) VALUES (100052, 'External Page', 'Opens a new window and displays the URL which is stored in the template.', 'external.php', 100050, 1, 0, 'default.png', 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `sitepage_names`
-- 

DROP TABLE IF EXISTS `sitepage_names`;
CREATE TABLE `sitepage_names` (
  `SPID` bigint(20) NOT NULL default '0',
  `VARIATION_ID` bigint(20) NOT NULL default '0',
  `NAME` varchar(128) default NULL,
  `DIRECT_URL` varchar(64) default NULL,
  `HELP` varchar(128) default NULL,
  `DELETED` tinyint(4) NOT NULL default '0',
  `VERSION` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`SPID`,`VARIATION_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `sitepage_names`
-- 

INSERT INTO `sitepage_names` (`SPID`, `VARIATION_ID`, `NAME`, `DIRECT_URL`, `HELP`, `DELETED`, `VERSION`) VALUES (100019, 1, 'test', NULL, '', 0, 0);
INSERT INTO `sitepage_names` (`SPID`, `VARIATION_ID`, `NAME`, `DIRECT_URL`, `HELP`, `DELETED`, `VERSION`) VALUES (100031, 1, 'test', '', '', 0, 10);
INSERT INTO `sitepage_names` (`SPID`, `VARIATION_ID`, `NAME`, `DIRECT_URL`, `HELP`, `DELETED`, `VERSION`) VALUES (100054, 1, 'Forum', NULL, '', 0, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `sitepage_owner`
-- 

DROP TABLE IF EXISTS `sitepage_owner`;
CREATE TABLE `sitepage_owner` (
  `SPID` bigint(20) NOT NULL default '0',
  `GROUP_ID` bigint(20) NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `sitepage_owner`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `sitepage_types`
-- 

DROP TABLE IF EXISTS `sitepage_types`;
CREATE TABLE `sitepage_types` (
  `SPMTYPE_ID` bigint(20) NOT NULL default '0',
  `NAME` varchar(16) NOT NULL default ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `sitepage_types`
-- 

INSERT INTO `sitepage_types` (`SPMTYPE_ID`, `NAME`) VALUES (1, 'SINGLEPAGE');
INSERT INTO `sitepage_types` (`SPMTYPE_ID`, `NAME`) VALUES (2, 'MULTIPAGE');
INSERT INTO `sitepage_types` (`SPMTYPE_ID`, `NAME`) VALUES (3, 'PORTAL');

-- --------------------------------------------------------

-- 
-- Table structure for table `sitepage_variations`
-- 

DROP TABLE IF EXISTS `sitepage_variations`;
CREATE TABLE `sitepage_variations` (
  `SPM_ID` bigint(20) NOT NULL default '0',
  `VARIATION_ID` bigint(20) NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `sitepage_variations`
-- 

INSERT INTO `sitepage_variations` (`SPM_ID`, `VARIATION_ID`) VALUES (100017, 1);
INSERT INTO `sitepage_variations` (`SPM_ID`, `VARIATION_ID`) VALUES (100032, 1);
INSERT INTO `sitepage_variations` (`SPM_ID`, `VARIATION_ID`) VALUES (100052, 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `state_translation`
-- 

DROP TABLE IF EXISTS `state_translation`;
CREATE TABLE `state_translation` (
  `IN_ID` bigint(20) NOT NULL default '0',
  `OUT_ID` bigint(20) NOT NULL default '0',
  `LEVEL` tinyint(4) NOT NULL default '1',
  `MODIFIED` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `EXPIRED` tinyint(4) NOT NULL default '0',
  KEY `IN_ID` (`IN_ID`),
  KEY `OUT_ID` (`OUT_ID`),
  KEY `LEVEL` (`LEVEL`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `state_translation`
-- 

INSERT INTO `state_translation` (`IN_ID`, `OUT_ID`, `LEVEL`, `MODIFIED`, `EXPIRED`) VALUES (100019, 100031, 10, '2006-08-09 22:07:46', 0);
INSERT INTO `state_translation` (`IN_ID`, `OUT_ID`, `LEVEL`, `MODIFIED`, `EXPIRED`) VALUES (100017, 100032, 10, '2006-08-09 22:05:37', 0);
INSERT INTO `state_translation` (`IN_ID`, `OUT_ID`, `LEVEL`, `MODIFIED`, `EXPIRED`) VALUES (100014, 100033, 10, '2006-08-09 22:07:46', 0);
INSERT INTO `state_translation` (`IN_ID`, `OUT_ID`, `LEVEL`, `MODIFIED`, `EXPIRED`) VALUES (2, 100034, 10, '2006-08-09 22:07:46', 0);
INSERT INTO `state_translation` (`IN_ID`, `OUT_ID`, `LEVEL`, `MODIFIED`, `EXPIRED`) VALUES (100015, 100035, 10, '2006-08-09 22:07:46', 0);
INSERT INTO `state_translation` (`IN_ID`, `OUT_ID`, `LEVEL`, `MODIFIED`, `EXPIRED`) VALUES (100016, 100036, 10, '2006-08-09 22:07:46', 0);
INSERT INTO `state_translation` (`IN_ID`, `OUT_ID`, `LEVEL`, `MODIFIED`, `EXPIRED`) VALUES (100020, 100037, 10, '2006-08-09 22:07:46', 0);
INSERT INTO `state_translation` (`IN_ID`, `OUT_ID`, `LEVEL`, `MODIFIED`, `EXPIRED`) VALUES (100021, 100038, 10, '2006-08-09 22:05:37', 0);
INSERT INTO `state_translation` (`IN_ID`, `OUT_ID`, `LEVEL`, `MODIFIED`, `EXPIRED`) VALUES (100022, 100039, 10, '2006-08-09 22:07:46', 0);
INSERT INTO `state_translation` (`IN_ID`, `OUT_ID`, `LEVEL`, `MODIFIED`, `EXPIRED`) VALUES (100023, 100040, 10, '2006-08-09 22:07:46', 0);
INSERT INTO `state_translation` (`IN_ID`, `OUT_ID`, `LEVEL`, `MODIFIED`, `EXPIRED`) VALUES (100018, 100041, 10, '2006-08-09 22:07:46', 0);
INSERT INTO `state_translation` (`IN_ID`, `OUT_ID`, `LEVEL`, `MODIFIED`, `EXPIRED`) VALUES (0, 100042, 10, '2006-08-09 22:05:37', 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `syndication`
-- 

DROP TABLE IF EXISTS `syndication`;
CREATE TABLE `syndication` (
  `IN_ID` bigint(20) NOT NULL default '0',
  `OUT_ID` bigint(20) NOT NULL default '0',
  `PROVIDER` varchar(32) NOT NULL default '',
  UNIQUE KEY `OUT_ID` (`OUT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `syndication`
-- 

INSERT INTO `syndication` (`IN_ID`, `OUT_ID`, `PROVIDER`) VALUES (100366, 100551, 'WWW.ZOO-MUNICH.COM');
INSERT INTO `syndication` (`IN_ID`, `OUT_ID`, `PROVIDER`) VALUES (101222, 100554, 'WWW.ZOO-MUNICH.COM');
INSERT INTO `syndication` (`IN_ID`, `OUT_ID`, `PROVIDER`) VALUES (101237, 100572, 'WWW.ZOO-MUNICH.COM');

-- --------------------------------------------------------

-- 
-- Table structure for table `sys_functions`
-- 

DROP TABLE IF EXISTS `sys_functions`;
CREATE TABLE `sys_functions` (
  `FUNCTION_ID` varchar(16) NOT NULL default '',
  `PARENT_ID` varchar(16) NOT NULL default '0',
  `NAME` varchar(32) NOT NULL default '',
  `DESCRIPTION` varchar(255) default NULL,
  PRIMARY KEY  (`FUNCTION_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `sys_functions`
-- 

INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('EXPLORE_SITE_M', '0', 'Content Menu', 'Content Menu');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('EXPLORE_SITE_S', 'EXPLORE_SITE_M', 'Website', 'Content - Website');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('EDIT_CONTENT', 'EXPLORE_SITE_S', 'Edit Content', 'Content - Edit Content');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('B_EDIT_ALL', 'EDIT_CONTENT', 'Button Edit All', 'Content - Edit Content - Edit All');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('B_USAGE', 'EDIT_CONTENT', 'Button Usage', 'Content - Usage');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('B_LIVE_AUTHORING', 'EDIT_CONTENT', 'Live Authoring', 'Content - Live Authoring');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('B_PREVIEW_PAGE', 'EDIT_CONTENT', 'Preview Page', 'Content - Preview Page');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('B_EXPIRE_LAUNCH', 'EDIT_CONTENT', 'Button Expire/Launch Page', 'Content - Website - Expire/Launch Page');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('B_LAUNCH_TREE', 'EDIT_CONTENT', 'Launch Tree', 'Content - Website - Launch Tree');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('B_RELAUNCH_TREE', 'EDIT_CONTENT', 'Refresh Tree', 'Content - Website - Refresh Tree');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('B_EXPIRE_TREE', 'EDIT_CONTENT', 'Expire Tree', 'Content - Website - Expire Tree');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('B_DESTROY_TREE', 'EDIT_CONTENT', 'Destroy Tree', 'Content - Website - Destroy Tree');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('EDIT_META_DATA', 'EDIT_CONTENT', 'Edit Meta Data', 'Content - Edit Meta Data');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('SITEPAGE_PROPS', 'EXPLORE_SITE_S', 'Sitepage Properties', 'Content - Website  - Sitepage Properties');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('B_RESET_CL_INST', 'SITEPAGE_PROPS', 'Reset Cluster Instance', 'Content - Website  - Sitepage Properties - Reset Cluster Instance');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('C_ACTIVE', 'SITEPAGE_PROPS', 'Checkbox Active', 'Content - Website - Sitepage Properties - Active');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('C_CACHE', 'SITEPAGE_PROPS', 'Checkbox Cache', 'Content - Website - Sitepage Properties - Cache');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('CLEAR_CACHE', 'SITEPAGE_PROPS', 'Clear Cache on Launch', 'Content - Website - Sitepage Properties - Clear Cache on Launch');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('MENU', 'EXPLORE_SITE_S', 'Menu', 'Allow editing of menu entries.');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('DIRECT_URL', 'MENU', 'Direct URL', 'Content - Menues - Direct URL');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('ADD_SITEPAGE', 'EXPLORE_SITE_S', 'Add Sitepage', 'Content - Add Sitepage');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('DELETE_SITEPAGE', 'EXPLORE_SITE_S', 'Delete Sitepage', 'Content - Delete Sitepage');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('PORTAL_MANAGER', 'EXPLORE_SITE_M', 'Portal Manager', 'Portal Manager');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('SITEPAGE_MASTER', 'TEMPLATES_M', 'Page Templates', 'Enable access to page-templates');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('B_RELAUNCH_INST', 'SITEPAGE_MASTER', 'Button Relaunch Instances', 'Sitepage Master - Relaunch Instances');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('ADD_SP_MASTER', 'SITEPAGE_MASTER', 'Add Sitepage Master', 'Sitepage Master - Insert New');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('DELETE_SP_MASTER', 'SITEPAGE_MASTER', 'Delete Sitepage Master', 'Sitepage Master - Delete');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('ROLLOUT', 'EXPLORE_SITE_M', 'Rollout', 'Rollout');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('OBJECT_BROWSER', 'EXPLORE_SITE_M', 'Library', 'Allow general access to content library');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('NEW_FOLDER', 'GENERAL', 'New Folder', 'Allow to create folder');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('NEW_OBJECT', 'OBJECT_BROWSER', 'Object Browser - New Object', 'Object Browser - New Object');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('EDIT_OBJECT', 'OBJECT_BROWSER', 'Edit Object', 'Object Browser - Edit Object');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('OBJECT_PROPS', 'OBJECT_BROWSER', 'Object Properties', 'Object Browser - Object Properties');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('DELETE_OBJECT', 'OBJECT_BROWSER', 'Delete Object', 'Object Browser - Delete Object');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('DELETE_FOLDER', 'GENERAL', 'Delete Folder', 'Allow delete folder');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('CL_BROWSER', 'EXPLORE_SITE_M', 'Clusters', 'Allow general access to cluster browser.');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('NEW_CL_TEMP', 'CL_TEMP_BROWSER', 'New CL-Template', 'Cluster Template Browser - New CL-Template');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('NEW_INSTANCE', 'CL_BROWSER', 'Cluster Browser - New Instance', 'Cluster Browser - New Instance');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('ED_FOLDER_PROPS', 'GENERAL', 'Edit Folder Properties', 'Allow edit folder ?roperties');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('EDIT_CL_CONTENT', 'CL_BROWSER', 'Edit Cluster Content', 'Cluster Browser - Edit Cluster Content');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('B_CL_EDIT_ALL', 'EDIT_CL_CONTENT', 'Button Cluster Edit All', 'Cluster Browser - Edit Content - Edit All');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('B_CL_USAGE', 'EDIT_CL_CONTENT', 'Button Cluster Usage', 'Cluster Browser - Edit Content - Usage');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('ED_CL_META_DATA', 'CL_EDIT_CONTENT', 'Edit Cluster Meta Data', 'Cluster Browser - Edit Meta Data');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('CL_PROPS', 'CL_BROWSER', 'Cluster Properties', 'Cluster Browser - Cluster Properties');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('DELETE_CL', 'CL_BROWSER', 'Delete Cluster', 'Cluster Browser - Delete Cluster');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('CL_TEMP_BROWSER', 'TEMPLATES_M', 'Cluster Templates', 'Enable access to cluster-templates');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('EDIT_CL_TEMP', 'CL_TEMP_BROWSER', 'Edit Cluster Template', 'Cluster Template Browser - Edit Cluster Template');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('ED_CL_TEMP_PROPS', 'CL_TEMP_BROWSER', 'Edit CL-Template Props', 'Cluster Template Browser - Edit Cluster Template Properties');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('DELETE_CL_TEMP', 'CL_BROWSER', 'Delete Cluster Template', 'Cluster Browser - Delete Cluster Template');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('META_TEMP', 'TEMPLATES_M', 'Meta Templates', 'Enable access to meta-templates');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('PLUGINS_M', '0', 'Plugins', 'Plugins');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('PLUGIN_CONTROL', 'PLUGINS_M', 'Plugin Control', 'Plugin Control');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('ADMINISTRATION_M', '0', 'Administration', 'Administration');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('USER_MANAGEMENT', 'ADMINISTRATION_M', 'User Management', 'User Management');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('VARIATIONS', 'ADMINISTRATION_M', 'Variations', 'Variations');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('MAINTENANCE', '0', 'Maintenance Menu', 'Enable access to maintenance menu');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('PURGE_DATABASE', 'MAINTENANCE', 'Purge Database', 'Purge Database');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('MY_PROFILE', 'ADMINISTRATION_M', 'My Profile', 'My Profile');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('OBJ_USAGE', 'OBJECT_BROWSER', 'Object Usage', 'Allow displaying usage of this object');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('TRAFFIC', 'ADMINISTRATION_M', 'Page Traffic', 'Traffic Analysis of this Website');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('CL_USAGE', 'CL_BROWSER', 'Cluster Usage', 'Displays usage of this cluster in pages.');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('TESTS', 'MAINTENANCE', 'PHPUnit Tests', NULL);
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('LOGS', 'MAINTENANCE', 'Log Analysis', NULL);
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('ED_FOLDER_ACL', 'ED_FOLDER_PROPS', 'Set Access', 'Set Access to a folder an all object who reside within.');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('BACKUP', 'ADMINISTRATION_M', 'Backup', 'Backup Database and Filesystem');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('SearchEngineAdm', 'MAINTENANCE', 'Search Engine Admin', 'Can run spider and admin the search engine.');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('LOCK_MENU', 'SITEPAGE_PROPS', 'Lock Menu', 'Allow user to lock the menu and disallow creating further page under one node.');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('CALENDAR_CREATE', 'CALENDAR', 'Administration', 'Create Calendars and Categories');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('CALENDAR_EDIT', 'CALENDAR', 'Edit', 'Edit the calendar');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('CALENDAR', 'PLUGINS_M', 'Calendar', 'Calendar Plugin');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('CHANNELS', 'EXPLORE_SITE_M', 'Channels', 'Allow general access to channels');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('CHANNEL_ADMIN', 'CHANNELS', 'Channel Administration', 'Create, Modify and Delete Channels');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('CHANNEL_EDIT', 'CHANNELS', 'Edit Content', 'Edit the content in a channel');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('CHANNEL_DELETE', 'CHANNELS', 'Delete Article', 'Delete an article in a channel.');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('CHANNEL_LAUNCH', 'CHANNELS', 'Launch Article', 'Launch an article in a channel.');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('ALLOW_CMS_LOGIN', 'GENERAL', 'Allow Backend Login', 'Must be set, if user shall be able to login to the backend.');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('COMMUNITY_LOGIN', 'GENERAL', 'Community Login', 'Use for building community portals.');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('SYNC_CLUSTERS', 'MAINTENANCE', 'Synchronize All Clusters', NULL);
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('SYNDICATION', 'EXPLORE_SITE_M', 'Syndication', 'Allow import and export of data');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('IMPORT', 'SYNDICATION', 'Import Data', 'Import Clusters, Templates and so on.');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('EXPORT', 'SYNDICATION', 'Export Data', 'Export clusters, templates and so on.');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('TEMPLATES_M', '0', 'Templates Menu', 'Enable the general Templates Menu');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('COMPOUND_GROUPS', 'TEMPLATES_M', 'Compound Groups', 'Edit, create and delete compound groups');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('GENERAL', '0', 'General functions', 'General functions of N/X');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('SET_PAGE_ACCESS', 'EXPLORE_SITE_S', 'Set Access', 'Set Permissions for a page');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('EDIT_EXCLUSIVE', 'EDIT_CL_CONTENT', 'Edit Developer Content', 'Allow user to edit Developer Content');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('ESERVICES', '0', 'Menu E-Services', 'Allow the user to display the menu E-Services');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('ADDRESS', 'ESERVICES', 'Address Editor', 'Allow displaying, editing and deleting Contacts');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('SHOP', 'ESERVICES', 'Shop Access', 'Allow access to general shop backoffice');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('SHOPADM', 'SHOP', 'Shop-Administrator', 'Technical Shop Administration');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('SHOPPRODADM', 'SHOP', 'Product-Administrator', 'Edit categories, products.....');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('ORDERPROC', 'SHOP', 'Order Processor', 'Account for processing orders');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('NEWSLETTER', 'ESERVICES', 'Newsletter Access', 'Allow access to general newsletter backoffice');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('NEWSLETTERADM', 'NEWSLETTER', 'Newsletter-Administrator', 'Technical Newsletter Administration');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('NEWSLETTEREDITOR', 'NEWSLETTER', 'Newsletter-Editor', 'Edit and create newsletter');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('NEWSLETTERSENDER', 'NEWSLETTER', 'Newsletter-Sender', 'Send Newsletters');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('CUSTOMERCARE', 'ESERVICES', 'Customer Care Access', 'Allow reading and replying to messages.');
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('CUSTOMERCAREADMI', 'ESERVICES', 'Customer Care Admin', 'Allow technical adminstration of customer care.');

-- --------------------------------------------------------

-- 
-- Table structure for table `temp_vars`
-- 

DROP TABLE IF EXISTS `temp_vars`;
CREATE TABLE `temp_vars` (
  `NAME` varchar(128) NOT NULL default '',
  `USER_ID` varchar(16) NOT NULL default '',
  `VALUE` varchar(255) default NULL,
  PRIMARY KEY  (`NAME`,`USER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `temp_vars`
-- 

INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('pnode', '1', '100011');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('menu', '1', '1x0');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('channels.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('channels.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('categories.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('categories.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('user_general.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('user_general.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('overview.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('overview.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('linkset', '1', '');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('install.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('install.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('sitepage_master.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('sitepage_master.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('edit_template.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('edit_template.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('lastaction', '1', '0');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('mid', '1', '100018');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('sitepagebrowser.phpview', '1', '1');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('panelmenu', '1', '1x-1');

-- --------------------------------------------------------

-- 
-- Table structure for table `tickets`
-- 

DROP TABLE IF EXISTS `tickets`;
CREATE TABLE `tickets` (
  `subject` text collate latin1_general_ci,
  `name` text collate latin1_general_ci,
  `email` text collate latin1_general_ci,
  `phone` text collate latin1_general_ci,
  `status` enum('open','closed') collate latin1_general_ci NOT NULL default 'open',
  `rate` int(2) default NULL,
  `rep` int(5) default NULL,
  `ID` int(6) NOT NULL default '0',
  `cat` int(5) NOT NULL default '0',
  `priority` tinyint(1) NOT NULL default '2',
  `tracking` varchar(32) collate latin1_general_ci default NULL,
  `INSERTTIMESTAMP` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- Dumping data for table `tickets`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `tickets_answers`
-- 

DROP TABLE IF EXISTS `tickets_answers`;
CREATE TABLE `tickets_answers` (
  `ID` int(7) NOT NULL auto_increment,
  `ticket` varchar(20) collate latin1_general_ci default NULL,
  `message` text collate latin1_general_ci,
  `timestamp` int(10) NOT NULL default '0',
  `rep` int(5) NOT NULL default '0',
  `reference` int(7) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `tickets_answers`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `tickets_categories`
-- 

DROP TABLE IF EXISTS `tickets_categories`;
CREATE TABLE `tickets_categories` (
  `id` int(5) NOT NULL auto_increment,
  `name` varchar(100) collate latin1_general_ci NOT NULL default '',
  `pophost` varchar(200) collate latin1_general_ci NOT NULL default '',
  `popuser` varchar(200) collate latin1_general_ci NOT NULL default '',
  `poppass` varchar(200) collate latin1_general_ci NOT NULL default '',
  `replyto` varchar(200) collate latin1_general_ci NOT NULL default '',
  `notify_from` varchar(200) collate latin1_general_ci default NULL,
  `notify_to` varchar(200) collate latin1_general_ci default NULL,
  `notify_subject` varchar(200) collate latin1_general_ci default NULL,
  `notify_replyto` varchar(100) collate latin1_general_ci default NULL,
  `notify_body` text collate latin1_general_ci,
  `notify_headers` text collate latin1_general_ci,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `tickets_categories`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `tickets_messages`
-- 

DROP TABLE IF EXISTS `tickets_messages`;
CREATE TABLE `tickets_messages` (
  `ID` int(7) NOT NULL auto_increment,
  `ticket` varchar(20) collate latin1_general_ci default NULL,
  `message` text collate latin1_general_ci,
  `timestamp` int(10) NOT NULL default '0',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `tickets_messages`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `tickets_textblocks`
-- 

DROP TABLE IF EXISTS `tickets_textblocks`;
CREATE TABLE `tickets_textblocks` (
  `BLOCK_ID` bigint(20) NOT NULL default '0',
  `NAME` varchar(32) collate latin1_general_ci NOT NULL default '',
  `CONTENT` longtext collate latin1_general_ci,
  PRIMARY KEY  (`BLOCK_ID`),
  UNIQUE KEY `NAME` (`NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- Dumping data for table `tickets_textblocks`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `user_permissions`
-- 

DROP TABLE IF EXISTS `user_permissions`;
CREATE TABLE `user_permissions` (
  `GROUP_ID` bigint(20) default NULL,
  `ROLE_ID` bigint(20) default NULL,
  `USER_ID` varchar(16) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `user_permissions`
-- 

INSERT INTO `user_permissions` (`GROUP_ID`, `ROLE_ID`, `USER_ID`) VALUES (1, 1, '1');

-- --------------------------------------------------------

-- 
-- Table structure for table `user_session`
-- 

DROP TABLE IF EXISTS `user_session`;
CREATE TABLE `user_session` (
  `USER_ID` varchar(16) NOT NULL default '',
  `LAST_LOGIN` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `SESSION_ID` varchar(32) default NULL,
  `REMOTE_ADDRESS` varchar(64) default NULL,
  PRIMARY KEY  (`USER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `user_session`
-- 

INSERT INTO `user_session` (`USER_ID`, `LAST_LOGIN`, `SESSION_ID`, `REMOTE_ADDRESS`) VALUES ('1', '2006-08-10 13:52:58', 'c67bf3a2a0bd62ea3b6911f04bf45626', '127.0.0.1');

-- --------------------------------------------------------

-- 
-- Table structure for table `users`
-- 

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `USER_ID` bigint(20) NOT NULL default '0',
  `USER_NAME` varchar(16) NOT NULL default '',
  `FULL_NAME` varchar(64) NOT NULL default '',
  `PASSWORD` varchar(32) NOT NULL default '',
  `EMAIL` varchar(64) default NULL,
  `ACTIVE` int(1) NOT NULL default '0',
  `REGISTRATION_DATE` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `BACKEND_LANGUAGE` tinyint(3) NOT NULL default '1',
  `LANGID` char(3) NOT NULL default 'EN',
  `USE_JAVASCRIPT` tinyint(1) NOT NULL default '0',
  `USE_AGENT` char(1) NOT NULL default '1',
  PRIMARY KEY  (`USER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `users`
-- 

INSERT INTO `users` (`USER_ID`, `USER_NAME`, `FULL_NAME`, `PASSWORD`, `EMAIL`, `ACTIVE`, `REGISTRATION_DATE`, `BACKEND_LANGUAGE`, `LANGID`, `USE_JAVASCRIPT`, `USE_AGENT`) VALUES (1, 'Administrator', 'Administrator', '7b7bc2512ee1fedcd76bdc68926d4f7b', 'pleaseEnterM@il', 1, '2004-12-22 20:56:40', 1, 'EN', 0, '0');

-- --------------------------------------------------------

-- 
-- Table structure for table `var_log`
-- 

DROP TABLE IF EXISTS `var_log`;
CREATE TABLE `var_log` (
  `NAME` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `var_log`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `variations`
-- 

DROP TABLE IF EXISTS `variations`;
CREATE TABLE `variations` (
  `VARIATION_ID` bigint(20) NOT NULL default '0',
  `NAME` varchar(32) NOT NULL default '',
  `SHORTTEXT` varchar(5) NOT NULL default '',
  `DESCRIPTION` varchar(255) NOT NULL default '',
  `DELETED` tinyint(4) default '0',
  PRIMARY KEY  (`VARIATION_ID`),
  UNIQUE KEY `VARIATION_ID` (`VARIATION_ID`,`NAME`,`SHORTTEXT`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `variations`
-- 

INSERT INTO `variations` (`VARIATION_ID`, `NAME`, `SHORTTEXT`, `DESCRIPTION`, `DELETED`) VALUES (1, 'Standard', 'std', 'Standard Value, No Variation', 0);
