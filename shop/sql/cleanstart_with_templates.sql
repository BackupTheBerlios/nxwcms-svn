-- phpMyAdmin SQL Dump
-- version 2.6.3-rc1
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Aug 14, 2006 at 12:25 PM
-- Server version: 4.1.11
-- PHP Version: 5.0.4
-- 
-- Database: `demo`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `acl_management`
-- 

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
INSERT INTO `acl_management` (`GUID`, `TYPE_ID`, `SYSTEM`, `INTERNAL`, `DISABLED`, `INHERIT`, `OWNER_GUID`, `LOCKED_BY`, `LOCKED_AT`) VALUES (100001, 0, 0, 0, 0, 1, 1, NULL, NULL);

-- --------------------------------------------------------

-- 
-- Table structure for table `acl_relations`
-- 

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

INSERT INTO `channel_articles` (`ARTICLE_ID`, `CHID`, `CH_CAT_ID`, `CLT_ID`, `POSITION`, `TITLE`, `ARTICLE_DATE`, `LAUNCH_DATE`, `EXPIRE_DATE`, `VERSION`) VALUES (100156, 100154, 100155, 100134, 1, 'Welcome', '2006-08-11 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `channel_articles` (`ARTICLE_ID`, `CHID`, `CH_CAT_ID`, `CLT_ID`, `POSITION`, `TITLE`, `ARTICLE_DATE`, `LAUNCH_DATE`, `EXPIRE_DATE`, `VERSION`) VALUES (100161, 100154, 100155, 100162, 1, 'Welcome', '2006-08-11 00:00:00', NULL, NULL, 10);

-- --------------------------------------------------------

-- 
-- Table structure for table `channel_categories`
-- 

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

INSERT INTO `channel_categories` (`CH_CAT_ID`, `CHID`, `PAGE_ID`, `NAME`) VALUES (100155, 100154, 100256, 'General News');

-- --------------------------------------------------------

-- 
-- Table structure for table `channel_cluster_templates`
-- 

CREATE TABLE `channel_cluster_templates` (
  `CHID` bigint(20) NOT NULL default '0',
  `CLT_ID` bigint(20) NOT NULL default '0',
  `POSITION` bigint(20) NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `channel_cluster_templates`
-- 

INSERT INTO `channel_cluster_templates` (`CHID`, `CLT_ID`, `POSITION`) VALUES (100154, 100134, 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `channels`
-- 

CREATE TABLE `channels` (
  `CHID` bigint(20) NOT NULL default '0',
  `NAME` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`CHID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `channels`
-- 

INSERT INTO `channels` (`CHID`, `NAME`) VALUES (100154, 'News');

-- --------------------------------------------------------

-- 
-- Table structure for table `cluster_content`
-- 

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

INSERT INTO `cluster_content` (`CLCID`, `CLID`, `CLTI_ID`, `POSITION`, `TITLE`, `FKID`, `DELETED`) VALUES (100158, 100157, 100135, 1, '', 0, 0);
INSERT INTO `cluster_content` (`CLCID`, `CLID`, `CLTI_ID`, `POSITION`, `TITLE`, `FKID`, `DELETED`) VALUES (100159, 100157, 100136, 1, '', 0, 0);
INSERT INTO `cluster_content` (`CLCID`, `CLID`, `CLTI_ID`, `POSITION`, `TITLE`, `FKID`, `DELETED`) VALUES (100179, 100176, 100174, 1, '', 100179, 0);
INSERT INTO `cluster_content` (`CLCID`, `CLID`, `CLTI_ID`, `POSITION`, `TITLE`, `FKID`, `DELETED`) VALUES (100178, 100176, 100173, 1, '', 0, 0);
INSERT INTO `cluster_content` (`CLCID`, `CLID`, `CLTI_ID`, `POSITION`, `TITLE`, `FKID`, `DELETED`) VALUES (100177, 100176, 100172, 1, '', 0, 0);
INSERT INTO `cluster_content` (`CLCID`, `CLID`, `CLTI_ID`, `POSITION`, `TITLE`, `FKID`, `DELETED`) VALUES (100199, 100198, 100184, 1, '', 0, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `cluster_node`
-- 

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

INSERT INTO `cluster_node` (`CLNID`, `CLT_ID`, `NAME`, `DELETED`, `VERSION`) VALUES (100156, 100134, 'Welcome', 0, 0);
INSERT INTO `cluster_node` (`CLNID`, `CLT_ID`, `NAME`, `DELETED`, `VERSION`) VALUES (100175, 100171, 'News', 0, 10);
INSERT INTO `cluster_node` (`CLNID`, `CLT_ID`, `NAME`, `DELETED`, `VERSION`) VALUES (100197, 100183, 'Articles', 0, 10);

-- --------------------------------------------------------

-- 
-- Table structure for table `cluster_template_item_types`
-- 

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

INSERT INTO `cluster_template_item_types` (`CLTITYPE_ID`, `NAME`, `DESCRIPTION`) VALUES (1, '5. Static Content', 'Standard input-fields. Static content is defined once for all objects of a class. So all objects have the same content (static content).');
INSERT INTO `cluster_template_item_types` (`CLTITYPE_ID`, `NAME`, `DESCRIPTION`) VALUES (2, '1. Content', 'Contents are standard input fields. Authors can fill content in these fields. (e.g. textfields, HTML-Fields, ....)');
INSERT INTO `cluster_template_item_types` (`CLTITYPE_ID`, `NAME`, `DESCRIPTION`) VALUES (3, '6. Static Object-Link', 'Objects can be linked with others. For example you may want to link an object "engine" with an object "car". Static object links are the same for all objects of an class.');
INSERT INTO `cluster_template_item_types` (`CLTITYPE_ID`, `NAME`, `DESCRIPTION`) VALUES (4, '2. Object Link', 'Objects can be linked with others. For example you may want to link an object "engine" with an object "car".');
INSERT INTO `cluster_template_item_types` (`CLTITYPE_ID`, `NAME`, `DESCRIPTION`) VALUES (5, '3. Library Content', 'This field allows to link content from the Library. This is the prefered placeholder for images, flash-films ....');
INSERT INTO `cluster_template_item_types` (`CLTITYPE_ID`, `NAME`, `DESCRIPTION`) VALUES (6, '7. Layout-Object Link', 'Layout objects are objects which are based on a class having its own layout defined. This placeholder is about the same as the Object-Link, except there must be the layout.');
INSERT INTO `cluster_template_item_types` (`CLTITYPE_ID`, `NAME`, `DESCRIPTION`) VALUES (7, '8. Object Group Link', 'This placeholder makes the content of object-groups accessible. Object-Groubs are defined in Templates/Object Groups');
INSERT INTO `cluster_template_item_types` (`CLTITYPE_ID`, `NAME`, `DESCRIPTION`) VALUES (8, '4. Channel Link', 'Use this placeholder, if you want to access articles from channels on your webpage.');

-- --------------------------------------------------------

-- 
-- Table structure for table `cluster_template_items`
-- 

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
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100051, 100050, 'URL', 1, 1, 1, 100048, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100064, 100063, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100065, 100063, 'Commented Sitemap', 2, 1, 1, 100062, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100135, 100134, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100136, 100134, 'Body', 2, 1, 1, 100024, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100139, 100138, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100140, 100138, 'Body', 2, 1, 1, 100024, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100141, 100138, 'Articles', 3, 1, 1, 1, 8, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100168, 100167, 'Backlink Title', 1, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100174, 100171, 'Articles', 3, 1, 1, 1, 8, 0, 0, 10);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100173, 100171, 'Body', 2, 1, 1, 100024, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100172, 100171, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100184, 100183, 'Backlink Title', 1, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100267, 100554, 'Body', 3, 1, 1, 100024, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100268, 100554, 'Name', 5, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100269, 100554, 'Christian Name', 6, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100270, 100554, 'Street', 7, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100271, 100554, 'ZIP', 8, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100272, 100554, 'City', 9, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100273, 100554, 'TEL', 10, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100274, 100554, 'FAX', 11, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100275, 100554, 'E-Mail', 12, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100276, 100554, 'Submit', 13, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100277, 100554, 'Reset', 14, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100278, 100554, 'Success', 15, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100279, 100554, 'Validation', 16, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100280, 100554, 'Trouble Email', 17, 1, 1, 100018, 2, 1, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100281, 100554, 'Category', 18, 1, 1, 100018, 2, 1, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100282, 100554, 'Subject', 2, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100283, 100554, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100284, 100554, 'Mailbody', 4, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100336, 100335, 'Body', 5, 1, 1, 100024, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100337, 100335, 'Name', 6, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100338, 100335, 'Christian Name', 7, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100339, 100335, 'Street', 8, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100340, 100335, 'ZIP', 9, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100341, 100335, 'City', 10, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100342, 100335, 'TEL', 11, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100343, 100335, 'FAX', 12, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100344, 100335, 'E-Mail', 13, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100345, 100335, 'SUBMIT', 14, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100346, 100335, 'Reset', 15, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100347, 100335, 'success', 16, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100348, 100335, 'Validation', 17, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100349, 100335, 'EMail Recipient', 18, 1, 1, 100018, 2, 1, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100350, 100335, 'EMail Subject', 19, 1, 1, 100018, 2, 1, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100351, 100335, 'Subject', 3, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100352, 100335, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100353, 100335, 'Mailbody', 4, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100487, 100511, 'Feedname', 4, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100399, 101177, 'Address', 3, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100400, 101177, 'Body', 2, 1, 1, 100024, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100401, 101177, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100402, 100511, 'Channel', 3, 1, 1, 1, 8, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100429, 100428, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100430, 100428, 'Body', 2, 1, 1, 100024, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100431, 100428, 'Gallery', 3, 1, 1, 100427, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100454, 100511, 'Feed Title', 1, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100456, 100511, 'Feed Description', 2, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100564, 100560, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100566, 100560, 'Body', 2, 1, 1, 100024, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100568, 100560, 'URL', 3, 1, 1, 100048, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100616, 100612, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100618, 100612, 'Body', 2, 1, 1, 100024, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100620, 100612, 'Address', 3, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100622, 100612, 'ShowControls', 4, 1, 1, 100062, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100645, 100612, 'Google-API-Key', 6, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100647, 100612, 'Address Description', 5, 1, 1, 100024, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100720, 100716, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100722, 100716, 'Body', 2, 1, 1, 100024, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100724, 100716, 'Search Button', 3, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES (100726, 100716, 'No Results Text', 4, 1, 1, 100018, 2, 0, 0, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `cluster_templates`
-- 

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

INSERT INTO `cluster_templates` (`CLT_ID`, `MT_ID`, `CATEGORY_ID`, `NAME`, `DESCRIPTION`, `CLT_TYPE_ID`, `TEMPLATE`, `DELETED`, `VERSION`) VALUES (100014, 100432, 100011, 'Text', '', 0, '', 0, 0);
INSERT INTO `cluster_templates` (`CLT_ID`, `MT_ID`, `CATEGORY_ID`, `NAME`, `DESCRIPTION`, `CLT_TYPE_ID`, `TEMPLATE`, `DELETED`, `VERSION`) VALUES (100050, 100432, 100011, 'URL', 'Stores an URL only', 0, '', 0, 0);
INSERT INTO `cluster_templates` (`CLT_ID`, `MT_ID`, `CATEGORY_ID`, `NAME`, `DESCRIPTION`, `CLT_TYPE_ID`, `TEMPLATE`, `DELETED`, `VERSION`) VALUES (100063, 2, 100011, 'Sitemap', 'Class for building sitemap pages', 0, '', 0, 0);
INSERT INTO `cluster_templates` (`CLT_ID`, `MT_ID`, `CATEGORY_ID`, `NAME`, `DESCRIPTION`, `CLT_TYPE_ID`, `TEMPLATE`, `DELETED`, `VERSION`) VALUES (100078, 2, 100011, 'Empty', 'Empty Class with no content.', 0, '', 0, 0);
INSERT INTO `cluster_templates` (`CLT_ID`, `MT_ID`, `CATEGORY_ID`, `NAME`, `DESCRIPTION`, `CLT_TYPE_ID`, `TEMPLATE`, `DELETED`, `VERSION`) VALUES (100134, 2, 100012, 'Text Article', 'Standard article with Headline and Body.', 1, 'echo &#039;&lt;span class=&quot;head1&quot;&gt;&#039;.$me-&gt;content-&gt;get(&quot;Headline&quot;).&#039;&lt;/span&gt;&#039;;\r\nbr();\r\necho $me-&gt;content-&gt;get(&quot;Body&quot;);', 0, 0);
INSERT INTO `cluster_templates` (`CLT_ID`, `MT_ID`, `CATEGORY_ID`, `NAME`, `DESCRIPTION`, `CLT_TYPE_ID`, `TEMPLATE`, `DELETED`, `VERSION`) VALUES (100138, 100432, 100011, 'Articles Overview', 'Wrapper Class for showing the overview of a channel.', 0, '', 0, 0);
INSERT INTO `cluster_templates` (`CLT_ID`, `MT_ID`, `CATEGORY_ID`, `NAME`, `DESCRIPTION`, `CLT_TYPE_ID`, `TEMPLATE`, `DELETED`, `VERSION`) VALUES (100167, 100432, 100011, 'Article Page', '', 0, '', 0, 0);
INSERT INTO `cluster_templates` (`CLT_ID`, `MT_ID`, `CATEGORY_ID`, `NAME`, `DESCRIPTION`, `CLT_TYPE_ID`, `TEMPLATE`, `DELETED`, `VERSION`) VALUES (100171, 100034, 100011, 'Articles Overview', 'Wrapper Class for showing the overview of a channel.', 0, '', 0, 10);
INSERT INTO `cluster_templates` (`CLT_ID`, `MT_ID`, `CATEGORY_ID`, `NAME`, `DESCRIPTION`, `CLT_TYPE_ID`, `TEMPLATE`, `DELETED`, `VERSION`) VALUES (100183, 100034, 100011, 'Article Page', '', 0, '', 0, 10);
INSERT INTO `cluster_templates` (`CLT_ID`, `MT_ID`, `CATEGORY_ID`, `NAME`, `DESCRIPTION`, `CLT_TYPE_ID`, `TEMPLATE`, `DELETED`, `VERSION`) VALUES (100554, 100432, 100011, 'Contact  (Mailing System)', '', 0, '', 0, 0);
INSERT INTO `cluster_templates` (`CLT_ID`, `MT_ID`, `CATEGORY_ID`, `NAME`, `DESCRIPTION`, `CLT_TYPE_ID`, `TEMPLATE`, `DELETED`, `VERSION`) VALUES (100335, 100432, 100011, 'Contact (Email)', '', 0, '', 0, 0);
INSERT INTO `cluster_templates` (`CLT_ID`, `MT_ID`, `CATEGORY_ID`, `NAME`, `DESCRIPTION`, `CLT_TYPE_ID`, `TEMPLATE`, `DELETED`, `VERSION`) VALUES (100511, 2, 100011, 'RSS Creator', '', 0, '', 0, 0);
INSERT INTO `cluster_templates` (`CLT_ID`, `MT_ID`, `CATEGORY_ID`, `NAME`, `DESCRIPTION`, `CLT_TYPE_ID`, `TEMPLATE`, `DELETED`, `VERSION`) VALUES (101177, 100432, 100011, 'RSS Reader', '', 0, '', 0, 0);
INSERT INTO `cluster_templates` (`CLT_ID`, `MT_ID`, `CATEGORY_ID`, `NAME`, `DESCRIPTION`, `CLT_TYPE_ID`, `TEMPLATE`, `DELETED`, `VERSION`) VALUES (100428, 100432, 100011, 'Gallery', 'Class which is used to build a Gallery', 0, '', 0, 0);
INSERT INTO `cluster_templates` (`CLT_ID`, `MT_ID`, `CATEGORY_ID`, `NAME`, `DESCRIPTION`, `CLT_TYPE_ID`, `TEMPLATE`, `DELETED`, `VERSION`) VALUES (100560, 2, 100011, 'Internal Frame', '', 0, '', 0, 0);
INSERT INTO `cluster_templates` (`CLT_ID`, `MT_ID`, `CATEGORY_ID`, `NAME`, `DESCRIPTION`, `CLT_TYPE_ID`, `TEMPLATE`, `DELETED`, `VERSION`) VALUES (100612, 100432, 100011, 'Map Page', '', 0, '', 0, 0);
INSERT INTO `cluster_templates` (`CLT_ID`, `MT_ID`, `CATEGORY_ID`, `NAME`, `DESCRIPTION`, `CLT_TYPE_ID`, `TEMPLATE`, `DELETED`, `VERSION`) VALUES (100716, 2, 100011, 'Search engine', 'Content definition for the search page.', 0, '', 0, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `cluster_variations`
-- 

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

INSERT INTO `cluster_variations` (`CLNID`, `VARIATION_ID`, `CLID`, `DELETED`, `LAST_CHANGED`, `CREATED_AT`, `LAST_USER`, `CREATE_USER`, `LAUNCHED_AT`, `LAUNCH_USER`) VALUES (100156, 1, 100157, 0, 20060811140641, 20060811140618, 'Administrator', 'Administrator', 20060811200603, 'Administrator');
INSERT INTO `cluster_variations` (`CLNID`, `VARIATION_ID`, `CLID`, `DELETED`, `LAST_CHANGED`, `CREATED_AT`, `LAST_USER`, `CREATE_USER`, `LAUNCHED_AT`, `LAUNCH_USER`) VALUES (100175, 1, 100176, 0, 20060811140730, 20060811140431, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` (`CLNID`, `VARIATION_ID`, `CLID`, `DELETED`, `LAST_CHANGED`, `CREATED_AT`, `LAST_USER`, `CREATE_USER`, `LAUNCHED_AT`, `LAUNCH_USER`) VALUES (100197, 1, 100198, 0, 20060811150340, 20060811150326, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

-- 
-- Table structure for table `compound_group_members`
-- 

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
INSERT INTO `content` (`CID`, `MODULE_ID`, `CATEGORY_ID`, `MT_ID`, `ACCESSKEY`, `NAME`, `DESCRIPTION`, `KEYWORDS`, `CREATED`, `LAST_MOD_DATE`, `LAST_MODIFIER`, `DELETED`, `VERSION`) VALUES (100126, 100007, 100045, 100034, 'side2', 'side2', '', '', '2006-08-11 15:07:14', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` (`CID`, `MODULE_ID`, `CATEGORY_ID`, `MT_ID`, `ACCESSKEY`, `NAME`, `DESCRIPTION`, `KEYWORDS`, `CREATED`, `LAST_MOD_DATE`, `LAST_MODIFIER`, `DELETED`, `VERSION`) VALUES (100124, 100012, 100001, 100034, 'Logo', 'Logo', '', '', '2006-08-11 15:07:09', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` (`CID`, `MODULE_ID`, `CATEGORY_ID`, `MT_ID`, `ACCESSKEY`, `NAME`, `DESCRIPTION`, `KEYWORDS`, `CREATED`, `LAST_MOD_DATE`, `LAST_MODIFIER`, `DELETED`, `VERSION`) VALUES (100132, 100018, 100001, 100034, 'homepagetitle', 'Homepage Title', '', '', '2006-08-11 15:07:07', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` (`CID`, `MODULE_ID`, `CATEGORY_ID`, `MT_ID`, `ACCESSKEY`, `NAME`, `DESCRIPTION`, `KEYWORDS`, `CREATED`, `LAST_MOD_DATE`, `LAST_MODIFIER`, `DELETED`, `VERSION`) VALUES (100130, 100018, 100001, 2, 'homepagetitle', 'Homepage Title', '', '', '2006-08-11 11:24:11', '2006-08-11 11:23:43', 'Administrator', 0, 0);
INSERT INTO `content` (`CID`, `MODULE_ID`, `CATEGORY_ID`, `MT_ID`, `ACCESSKEY`, `NAME`, `DESCRIPTION`, `KEYWORDS`, `CREATED`, `LAST_MOD_DATE`, `LAST_MODIFIER`, `DELETED`, `VERSION`) VALUES (100122, 100007, 100001, 100034, 'Banner1', 'Banner', '', '', '2006-08-11 15:07:05', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` (`CID`, `MODULE_ID`, `CATEGORY_ID`, `MT_ID`, `ACCESSKEY`, `NAME`, `DESCRIPTION`, `KEYWORDS`, `CREATED`, `LAST_MOD_DATE`, `LAST_MODIFIER`, `DELETED`, `VERSION`) VALUES (100128, 100007, 100045, 100034, 'side1', 'SideAd1', '', '', '2006-08-11 15:07:16', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` (`CID`, `MODULE_ID`, `CATEGORY_ID`, `MT_ID`, `ACCESSKEY`, `NAME`, `DESCRIPTION`, `KEYWORDS`, `CREATED`, `LAST_MOD_DATE`, `LAST_MODIFIER`, `DELETED`, `VERSION`) VALUES (100538, 100048, 100001, 2, 'rssfeed', 'Standard RSS Feed', '', '', '2006-08-13 12:58:23', '2006-08-13 12:58:15', 'Administrator', 0, 0);
INSERT INTO `content` (`CID`, `MODULE_ID`, `CATEGORY_ID`, `MT_ID`, `ACCESSKEY`, `NAME`, `DESCRIPTION`, `KEYWORDS`, `CREATED`, `LAST_MOD_DATE`, `LAST_MODIFIER`, `DELETED`, `VERSION`) VALUES (100543, 100048, 100001, 100034, 'rssfeed', 'Standard RSS Feed', '', '', '2006-08-13 12:58:29', '0000-00-00 00:00:00', 'Administrator', 0, 10);

-- --------------------------------------------------------

-- 
-- Table structure for table `content_variations`
-- 

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
INSERT INTO `content_variations` (`CID`, `VARIATION_ID`, `FK_ID`, `DELETED`) VALUES (100128, 1, 100129, 0);
INSERT INTO `content_variations` (`CID`, `VARIATION_ID`, `FK_ID`, `DELETED`) VALUES (100126, 1, 100127, 0);
INSERT INTO `content_variations` (`CID`, `VARIATION_ID`, `FK_ID`, `DELETED`) VALUES (100124, 1, 100125, 0);
INSERT INTO `content_variations` (`CID`, `VARIATION_ID`, `FK_ID`, `DELETED`) VALUES (100132, 1, 100133, 0);
INSERT INTO `content_variations` (`CID`, `VARIATION_ID`, `FK_ID`, `DELETED`) VALUES (100130, 1, 100131, 0);
INSERT INTO `content_variations` (`CID`, `VARIATION_ID`, `FK_ID`, `DELETED`) VALUES (100122, 1, 100123, 0);
INSERT INTO `content_variations` (`CID`, `VARIATION_ID`, `FK_ID`, `DELETED`) VALUES (100538, 1, 100539, 0);
INSERT INTO `content_variations` (`CID`, `VARIATION_ID`, `FK_ID`, `DELETED`) VALUES (100543, 1, 100544, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `dig_clicks`
-- 

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=3 ;

-- 
-- Dumping data for table `dig_tempspider`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `groups`
-- 

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

CREATE TABLE `internal_resources` (
  `RESID` varchar(32) NOT NULL default '',
  `LANGID` char(3) NOT NULL default '',
  `VALUE` text,
  `TOOLTIP` text,
  PRIMARY KEY  (`RESID`,`LANGID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `internal_resources`
-- 

INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCH_EXPIRED_ARTICLES', 'DE', 'Zurückgezogene Artikel', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_PERMISSION', 'DE', 'Rollen-Berechtigungen bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_GENERAL', 'DE', 'Eigenschaften', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PREV_AVAIL', 'DE', 'Sie haben einen Inhalt ausgewählt. Die Vorschau wird nach dem Speichern verfügbar sein.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('OBJLAUNCH_SUCCESS', 'DE', 'Das Objekt wurde erfolgreich veröffentlicht', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOT_SPECIFIED', 'DE', 'Alle Typen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_OBJ', 'DE', 'Kein Inhalt ausgewählt.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOT_SELECTED', 'DE', 'Kein Element ausgewählt.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_SYNC_CL', 'DE', 'Objekte synchronisieren', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MULTIPAGE', 'DE', 'Multipage', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MH_GLOSSARY', 'DE', 'Glossar', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LEAVE_EMPTY', 'DE', 'leer lassen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('INSTANCES_CREATED', 'DE', 'Neue Instanzen des Elements wurden erzeugt.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('KEEP_CLUSTER', 'DE', 'Originalobjekt beibehalten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HIDE', 'DE', 'Schließen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_VARIATION', 'DE', 'Inhalte können in verschiedenen Variationen vorliegen. Variationen können z.B. verschiedene Sprachen oder unterschiedliche Inhaltsprofile darstellen.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_SYNCCL', 'DE', 'Eine Einrichtung zur Synchronisation von Clustern, nachdem eine Cluster-Vorlage verändert wurde.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_PURGE', 'DE', 'Löscht überflüssige Daten aus der Datenbank', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_DW', 'DE', 'Erzeugt eine Konfigurations-Datei für das N/X Dreamweaver-PlugIn. Mit Hilfe dieses Plug-Ins können N/X-Vorlagen benutzerfreundlich mit Dreamweaver entwickelt werden.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_BACKUP', 'DE', 'Die untenstehende Liste zeigt eine Liste von Sicherungen an. Sie können hier einzelne Sicherungen löschen. Um eine Sicherung zurückzuspielen, müssen Sie sich manuell auf Ihrem Server anmelden und die Dateien selbst wiederherstellen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONFIRM_UNSAVED_CHANGES', 'DE', 'Achtung: Ungesicherte Änderungen gehen verloren, wenn Sie fortfahren. Möchten Sie dies tun?', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GOTO_CL', 'DE', 'Gehe zu Objekt', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FIND_OBJ', 'DE', 'Finde Objekt', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXPL_SEL_SPM', 'DE', 'Bitte wählen Sie eine Seiten-Vorlage aus.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ENDTIME', 'DE', 'Endzeit', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXPL_SEL_CH', 'DE', 'Bitte wählen Sie einen Kanal.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ENDATE', 'DE', 'Enddatum', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DELETE_PAGE', 'DE', 'Löschen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DISABLE', 'DE', 'Deaktivieren', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DWEXT_CONTENTFIELDINFO', 'DE', 'Inhalts-Feld-Informationen erzeugen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DWEXT_CONTENTFIELDINFO_MES', 'DE', 'erzeugt Inhalts-Feld-Informationen für Dreamweaver MX', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT', 'DE', 'Klasse', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CMPTYPE', 'DE', 'Layout-Klassen-Typ:', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COPY_CLUSTER', 'DE', 'Objekt kopieren', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLEAR', 'DE', 'Löschen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHANNEL_IMPORTARTICLES', 'DE', 'Artikel importieren', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CAL_BTO', 'DE', 'Zurück zur Übersicht', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AUTH_GROUP', 'DE', 'Autentifizierung', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ARTICLE_VARIATION_MISSING', 'DE', 'Sprachversion dieses Artikels existiert noch nicht', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ARTICLE_IS_LIVE', 'DE', 'Artikel ist veröffentlicht', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ARTICLE_IS_EXPIRED', 'DE', 'Artikel ist nicht veröffentlicht', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ADD_LINK', 'DE', 'Link hinzufügen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ADDITIONAL_LINK', 'DE', 'Zusätzlicher Link', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ADDITIONAL_IMAGE', 'DE', 'Zusätzliches Bild', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_ACCESS', 'DE', 'Eine Einrichtung zum Erstellen und Verwalten von Benutzerprofilen in N/X', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NUM_OF_ART', 'DE', 'Anzahl Artikel (999 = unendlich)', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ORDERART', 'DE', 'Sortierung von Artikeln', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ALL', 'DE', 'Alles', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('READY_TO_USE', 'DE', 'fertig', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CH_CAT2', 'DE', 'Kanal und Kategorie', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_CHANNEL_CAT', 'DE', 'Kanal und Kategorie auswählen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_DBLINK_ADDWHERE', 'DE', 'Additional WHERE-clause', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_CONTENT', 'DE', '<leer>', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_DBLINK_SRCHVALUE', 'DE', 'Search for value', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_DBLINK_EXTERNALDB', 'DE', 'External Database', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_EXPIRE', 'DE', 'Objekt zurückziehen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BACK_TO_CV', 'DE', 'Zurück zur Objektübersicht', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_LAUNCH', 'DE', 'Objekt veröffentlichen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHANNEL_GRABMP', 'DE', 'grab from Multipage', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AR_EXPIRE', 'DE', 'Artikel zurückziehen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_PGN', 'DE', 'Plug-Ins erlauben Ihnen, N/X üher seine Standard-Funktionalitäten hinaus zu erweitern. Üblicherweise werden Plug-Ins dazu verwendet, neue Objekttypen zu den Standard-Typen Text und Bild hinzuzufügen.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_TEXT_NOBREAK', 'DE', 'Ignore New-Lines', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DEL_ARTICLE', 'DE', 'Möchten Sie diesen Artikel wirklich in allen Sprachen löschen?', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AR_LAUNCH', 'DE', 'Artikel veröffentlichen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATE_ARTICLE', 'DE', 'Neuen Artikel im Kanal erzeugen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_PROPERTIES', 'DE', 'Eigenschaften', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_CLT', 'DE', 'Klasse bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NODE_ACCESS', 'DE', 'Zugriffsrechte für Root-Seite setzen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BACK_TO_OVERVIEW', 'DE', 'Zurück zur Übersicht', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEW_ARTICLE', 'DE', 'Neuer Artikel', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DESTROY_EXCLUSIVE_CONTENT', 'DE', 'Exklusive Inhalte löschen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT_ARTICLE', 'DE', 'Artikel bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DESTROY_TREE', 'DE', 'Baum löschen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONFIRM_DELETE', 'DE', 'Möchten Sie dieses Element wirklich löschen?', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_ROLLOUT', 'DE', 'Rollout ist eine Einrichtung in N/X, mit der Sie Kopien eines Teils Ihrer Website erstellen und diese an anderer Stelle mit oder ohne alte Inhalte weiderverwenden können.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHANNEL', 'DE', 'Kanal', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_SELECT', 'DE', 'Klasse auswählen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_CHANNEL', 'DE', 'Themen-Kategorien für die Inhalte der von N/X erzeugten Artikel, z.B. Neuigkeiten, Personen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHANNELS', 'DE', 'Kanäle', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_FILE', 'DE', 'Datei auswählen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_IMPORTING', 'DE', 'Daten werden importiert', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_IMPORTING', 'DE', 'Das System hat versucht, die Daten zu importieren. Bitten überprüfen Sie den Status auf der rechten Seite.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_IMPORT_VAL', 'DE', 'Das System hat die Korrektheit der hochgeladenen XML-Datei überprüft. Im Bericht rechts finden Sie nähere Informationen.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_IMPORT_VAL', 'DE', 'Zusammenfassung des hochgeladenen XML', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_IMPORT_FILE', 'DE', 'Bitte wählen Sie eine XML-Datei auf Ihrer Festplatte aus, die ins System geladen werden soll<br/><br/>Das System wird eine Überprüfung durchführen und den Status auf der rechten Seite ausgeben.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_IMPORT_FILE', 'DE', 'N/X-XML-Datei auswählen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('IMPORT_DATA', 'DE', 'N/X-XML-Daten importieren', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZ_IMPORT_TITLE', 'DE', 'Dieser Assisten dient zum Import von Daten in N/X, die zuvor von einer anderen N/X-Installation exportiert wurden. Um eine Ressource erneut importieren zu können, müssen Sie sie zunächst löschen.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXPL_SEL_CLUSTER', 'DE', 'Nachdem Sie eine Klasse gewählt haben, erscheint eine Liste von Objekten, aus der Sie eins auswählen können.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STEP', 'DE', 'Schritt', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEXT', 'DE', 'Weiter', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXP_REPORT', 'DE', 'Exportiere folgende Daten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXPL_EXEC_EXPORT', 'DE', 'Das System erzeugt gerade eine XML-Datei für den Export..<br/><br/>In ein paar Sekunden wird ein PopUp erscheinen. Klicken Sie "Speichern", um die Daten auf Ihre Festplatte zu sichern.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXEC_EXPORT', 'DE', 'Quelle wird exportiert', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PAGE_TEMPLATE', 'DE', 'Seiten Vorlage', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_SEL_EXP_RES', 'DE', 'Ressource für den Export auswählen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_DESCR', 'DE', 'Beschreibung hinzufügen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_DESCR_EXPL', 'DE', 'Sie sollten eine kurze Beschreibung zu den exportierten Daten hinzufügen.<br><br>Jeder, der die Daten importiert, wird leichter verstehen, was er importiert.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLUSTER', 'DE', 'Objekt', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLUSTER_TEMPLATE', 'DE', 'Klasse', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_EXPORT_TYPE', 'DE', 'Bitte wählen Sie rechts den Typ von Daten aus, den Sie exportieren möchten. Cluster speichern Inhalte. Wenn Sie Cluser exportieren, werden automatisch auch die zugehörigen Vorlagen exportiert. Cluster-Vorlagen sind Schemata, um Cluster zu erstellen. seiten-Vorlagen werden benutzt, um Seiten zu erstellen.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_EXPORT_TYPE', 'DE', 'Wählen Sie den Typ für den Export aus.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZ_EXPORT_TITLE', 'DE', 'Der Assistent dient zum Austausch von Objekten, Klassen und Seiten-Vorlagen zwischen Ihrer und anderen N/X-Installationen. Der Assistent erzeugt eine XML-Datei, die Sie auf Ihre lokale Festplatte speichern und mit anderen N/X-Nutzern austauschen können.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXPORT_DATA', 'DE', 'Inhalte- und Vorlagen-Export-Assistent', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LAST_LAUNCHED_AT', 'DE', 'Zuletzt veröffentlicht am', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BY', 'DE', 'von', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LAST_MOD_AT', 'DE', 'Zuletzt geändert am', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATED_AT', 'DE', 'Erstellt am', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLUSTER_INFORMATION', 'DE', 'Informationen über diesen Datensatz', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TT_RSTCI', 'DE', 'Jede Seite in N/X besitzt ein Objekt. Duch Klicken auf "Objekt zurücksetzen" können Sie der Seite eine neues Objekt zuweisen.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_METATEMP', 'DE', 'Eine Meta-Schablone wird benutzt, um festzulegen, welche Metadaten-Felder eine Seite erhalten soll. Wenn Sie in einer Vorlage ein neues Metadaten-Feld erstellen, wird jede auf dieser Vorlage basierende Seite dieses Feld besitzen.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_CLUSTER', 'DE', 'Keine Inhalte.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_AGENT', 'DE', 'Agent verwenden', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_CLB', 'DE', 'Ein Cluster ist eine Ansammlung von statischen und dynamischen Inhalts-Platzhaltern, die entweder von einem Entwickler oder einem Editor einer Website gefüllt werden. Die Grundstruktur in N/X besteht aus Daten-Clustern', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PROMPTDELETE', 'DE', 'Möchten Sie diesen Datensatz wirklich löschen?', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATENEW', 'DE', 'Es wurde ein neuer Datensatz erzeugt.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECTONE', 'DE', 'Sie müssen hier eine Auswahl treffen!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SAVESUCCESS', 'DE', 'Die Daten wurden erfolgreich in die Datenbank geschrieben.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DELETESUCCESS', 'DE', 'Die unten aufgeführten Daten wurden erfolgreich gelöscht.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SAVEERROR', 'DE', 'Während des Speicherns der Daten in die Datenbank ist ein Fehler aufgetreten. Bitte stellen Sie sicher, dass die Datenbank verbunden ist, oder benachrichtigen Sie Ihren Administrator.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PROCERROR', 'DE', 'Während der Verarbeitung des Formulars ist ein Fehler aufgetreten. Bitte überprüfen Sie die markierten Felder und lesen Sie die dortigen Anweisungen für weitergehende Informationen.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PWDTOOSHORT', 'DE', 'Das Passwort muss mindestens 6 Zeichen lang sein!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PWDNOTMATCH', 'DE', 'Die von Ihnen eingegebene Passwörter stimmen nicht überein!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DATEFORMAT', 'DE', 'Das Datumsformat ist nicht korrekt!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WRONGDATE', 'DE', 'Das von Ihnen eingegebene Datum existiert nicht!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOTNUMBER', 'DE', 'Sie können in dieses Feld nur Zahlenwerte eingeben!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MANDATORY', 'DE', 'Dieses Feld darf nicht leer sein!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('UNIQUE', 'DE', 'Dieser Wert muss eindeutig sein!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STATUS', 'DE', 'Status:', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EMPTY', 'DE', '<leer>', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECT_CL', 'DE', 'Wählen Sie ein Objekt aus', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECT_CI', 'DE', 'Wählen Sie ein Inhalts-Element aus', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONFIG', 'DE', 'Anpassen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONFIGURED', 'DE', 'fertig', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOTCONFIGURED', 'DE', 'Noch nicht konfiguriert.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHOOSEFILE', 'DE', 'Wählen Sie eine Datei aus', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PREVIEW', 'DE', 'Vorschau', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_CONTENT', 'DE', 'Inhalt bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_META', 'DE', 'META-Daten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_DISPATCHER', 'DE', 'Benutzen Sie diese Schaltfläche, um zwischen der Bearbeitung der META-Daten und der Bearbeitung der Inhalte umherzuschlaten.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACTIVE_VARIATION', 'DE', 'Ausgewählte Sprache:', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_VARIATIONS', 'DE', 'Es wurden noch keine Sprachversionen für dieses Objekt erzeugt.<br>Bitten Sie einen Entwickler, die Konfiguration des gewählten Elements zu überprüfen!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECT_VARIATION', 'DE', 'Sprache auswählen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('METATEMPLATE', 'DE', 'Zusätzliche META-Vorlage', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('POSITION', 'DE', 'Position', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DELETE', 'DE', 'Löschen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TYPE', 'DE', 'Typ', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('KEYWORDS', 'DE', 'Schlüsselwörter', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECTOBJECT', 'DE', 'Bitte wählen Sie eine Klasse aus und geben Sie eine Position und einen Namen an, um das Objekt zu erzeugen.<br>Geben Sie als Position 0 an, um das neue Objekt am Anfang einzufügen, 999, um es am Ende anzufügen und jede beliebige andere Numm', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTAINERNAME', 'DE', 'Vorlage', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DOWN', 'DE', 'Ab', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('UP', 'DE', 'Auf', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT', 'DE', 'Bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DOSOMETHING', 'DE', 'Bitte wählen Sie aus, was Sie tun möchten. Sie können neue Elemente einfügen, bestehende Elemente bearbeiten oder löschen und die Reihenfolge bestehender Elemente verändern.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DESCRIPTION', 'DE', 'Beschreibung', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NAME', 'DE', 'Name', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEW', 'DE', 'Neu', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO', 'DE', 'Nein', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('YES', 'DE', 'Ja', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CANCEL', 'DE', 'Abbrechen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COMMIT', 'DE', 'Übernehmen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_PROFILE', 'DE', 'Mein Profil', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ERROR_SEL_ROLE', 'DE', 'Sie müssen mindestens eine Rolle auswählen!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ERROR_SEL_GROUP', 'DE', 'Sie müssen eine Gruppe auswählen!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_TO_GROUP', 'DE', 'Bneutzer zur Gruppe hinzufügen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_DESCRIPTION', 'DE', 'Beschreibung', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_FILTERMENU', 'DE', 'Rollen-Verwaltung', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_PERMISSIONS', 'DE', 'Benutzer-Rechte', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('UP_INTRO', 'DE', 'Bitte wählen Sie die Gruppe und die Rollen in der Gruppe, die Sie diesem User zuweisen möchten.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_LINK', 'DE', 'Rollen-Profile', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_HEAD', 'DE', 'Rollen-Profil', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_NAME', 'DE', 'Rollen-Name', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_FILTERMENU', 'DE', 'Gruppen-Verwaltung', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_DESCRIPTIO', 'DE', 'Beschreibung', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_NAME', 'DE', 'Gruppen-Name', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_PERMGRID', 'DE', 'Berechtigungs-Gitter', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_LINK', 'DE', 'Gruppen-Profile', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_HEAD', 'DE', 'Gruppen-Profil', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_FILTERMENU', 'DE', 'Benutzeraverwaltung', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_SETPERM', 'DE', 'Setzen Sie hier die User-Rechte. Um einen User aus einer Gruppe zu entfernen, entfernen Sie einfach alle Gruppen von ihm.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_EMAIL', 'DE', 'eMail', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_ACTIVE', 'DE', 'Konto aktiv', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PASSWORD', 'DE', 'Passwort', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FULL_NAME', 'DE', 'Voller Name', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_LINK', 'DE', 'Benutzer-Profile', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_NAME', 'DE', 'Benutzername', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_HEAD', 'DE', 'Benutzer-Profil', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOGIN_FAILED', 'DE', 'Die Login-Daten, die Sie eingegeben haben, konnten nicht verifiziert werden. Bitte versuchen Sie es erneut.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('V_EDIT', 'DE', 'Sprachen bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_BASE', 'DE', 'Basis META-Daten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_MODULE', 'DE', 'Inhaltstyp-spezifische META-Daten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VARIATIONS', 'DE', 'Verfügbare Variationen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('V_NAME', 'DE', 'Name', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('V_SHORT', 'DE', 'Kürzel', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_ADDITIONAL', 'DE', 'Zusätzliche META-Daten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_DELETE', 'DE', 'Möchten Sie diesen Teil der Meta-Vorlage wirklich löschen? Alle Informationen, die im CMS in irgend ein mit diesem Teil verknüpften META-Eingabefeld eingegeben wurden, werden gelöscht. Die Daten können anschliessend nicht wiederhe', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_SCHEME', 'DE', 'Meta-Vorlage bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_PROPERTIES', 'DE', 'Eigenschaften bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('METATEMPLATES', 'DE', 'Meta-Vorlagen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_PARENT', 'DE', 'Übergeordneter Ordner', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_DELFOLDER', 'DE', 'Ordner und alle untergeordneten Objekte löschen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_MOVEOBJECTS', 'DE', 'Alle Objekte zur nächst höheren Ebene verschieben', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_FOLDERNOTEMPTY', 'DE', 'Der Ordner ist nicht leer, Sie können ihn also nicht löschen! Bitte überprüfen Sie alle Objekte und Inhalte!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_DELFOLDERMES', 'DE', 'Sie sind im Begriff einen Ordner zu löschen. Bitte wählen Sie eine Aktion aus.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_DELETEFOLDER', 'DE', 'Ordner löschen', '');
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
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_DEL', 'DE', 'Objekt löschen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_DELMES', 'DE', 'Sie sind im Begriff ein Objekt zu löschen.<b>Beachten Sie dass hierbei alle  Sprachversionen und META-DATEN gelöscht werden!</b>', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_PROPERTIES', 'DE', 'Objekt-Eigenschaften', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_NAME', 'DE', 'Objekt-Name', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_NEW', 'DE', 'Neues Objekt', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_UNINSTALLDELE', 'DE', 'Plugin entfernen,<br> Alle zugehörigen Inhalte löschen.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_UNINSTALLMES', 'DE', 'Sie sind im Begriff, ein Plugin zu entfernen. Das Entfernen eines Moduls löscht nicht nur den Inhalts-Typ sondern löscht auch jeden einzelnen Inhalt, der in der Datenbank gespeichert ist.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_UNINSTALL', 'DE', 'PlugIn deinstallieren', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_INSTALL', 'DE', 'PlugIn installieren', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_TITLE', 'DE', 'PlugIns', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_NEWERINSTALLE', 'DE', 'Eine neuere Version des PlugIns ist bereits installiert!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_ALREADYINSTAL', 'DE', 'Das PlugIn ist bereits installiert!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_ERROR', 'DE', 'Während der Installation des PlugIns ist ein Fehler aufgetreten!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_UPGRADED', 'DE', 'Das PlugIn wurde erfolgreich aktualisiert!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_INSTALLED', 'DE', 'Das PlugIn wurde erfolgreich installiert!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLASS_WRONG', 'DE', 'Die von Ihnen angegebene Datei hat keine gültige Klassen-Signatur!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_FILEWRONG', 'DE', 'Der von Ihnen eingegebene Dateiname konnte auf dem Server nicht gefunden werden!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_CHOOSE', 'DE', 'PlugIn:   /plugin/', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_MINCARD', 'DE', 'minimale Anzahl', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_MAXCARD', 'DE', 'maximale Anzahl', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LINKED', 'DE', 'Verknüpft mit', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_INSTALLDESC', 'DE', 'Bitte stellen Sie sicher, dass Sie alle benötigten Dateien ins Verzeichnis kopiert haben, bevor Sie fortfahren. Geben Sie in das untenstehende Eingabefeld den korrekten Pfad zum PlugIn ein. Das System wird das PlugIn dann automatisch installieren.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_SCHEME', 'DE', 'Klasse bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLTI_DELETE', 'DE', 'Möchten Sie dieses Element wirklich löschen? Sämtliche Instanzen dieses Elements werden ebenfalls gelöscht!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_DELMES', 'DE', 'Sie sind im Begriff eine Klasse zu löschen. Dies wird den Verlust aller(!) Ihnhalte zur Folge haben, die mit dieser Klasse als Vorlage erstellt wurden. Sind Sie sicher, dass Sie forfahren möchten?', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_DELETE', 'DE', 'Klasse löschen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_NAME', 'DE', 'Klassenname', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_PROPERTIES', 'DE', 'Klassen-Eigenschaften', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_BROWSE', 'DE', 'Klassen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_NEW', 'DE', 'Neue Klasse', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_PGN', 'DE', 'Plugin-Verwaltung', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_PURGE', 'DE', 'Datenbank bereinigen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_VAR', 'DE', 'Sprachen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_UMAN', 'DE', 'Benutzer-Verwaltung', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_CLTB', 'DE', 'Klassen-Browser', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_CLB', 'DE', 'Objekte', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_LOGOUT', 'DE', 'Abmelden', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_MYPROFILE', 'DE', 'Mein Profil', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_MYPRT', 'DE', 'Meine Portale', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_PRTMAN', 'DE', 'Portal-Manager', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_ES', 'DE', 'Website', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_SPM', 'DE', 'Seiten Vorlagen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_INSTALLPLUGIN', 'DE', 'PlugIns', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECTEDOBJECT', 'DE', 'Derzeit ausgewähltes Inhalts-Element', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECTEDINSTANCE', 'DE', 'Ausgewähltes Objekt', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_META', 'DE', 'Meta-Vorlagen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_BROWSER', 'DE', 'Objekt-Browser', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCH', 'DE', 'Suchen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCHIN', 'DE', 'Suchen nach', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCHRESULTS', 'DE', 'Such-Ergebnisse, bitte treffen Sie Ihre Auswahl', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTENTTYPE', 'DE', 'Typ', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTENTITEM', 'DE', 'Inhalt', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FOLDER', 'DE', 'Ordner', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SR_SELECTCLI', 'DE', 'Bitte wählen Sie eine Klasse. Anschließend können Sie ein Objekt auswählen.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SR_SELECTCI', 'DE', 'Sie können hier nach einem beliebigen Inhalts-Element suchen. Wenn Sie ein Inhalts-Element selektieren möchten, wählen Sie es aus und klicken Sie die Aktualisieren-Schaltfläche! Wenn sie neuen Inhalt mit diesem Feld verbinden möchten, erstellen Sie es bitte zunächst in der Bibliothek.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI', 'DE', 'Objekt:', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_NOTDELETED', 'DE', 'Dieses Objekt kann nicht gelöscht werden!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_DELETED', 'DE', 'Das Objekt wurde gelöscht.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_DELETEMES', 'DE', 'Möchten Sie dieses Objekt wirklich löschen?', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_DELETE', 'DE', 'Objekt löschen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_EDIT', 'DE', 'Objekt-Figur bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TITLE', 'DE', 'Titel', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_NOTITLE', 'DE', 'Noch kein Titel angegeben', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_BROWSER', 'MND', 'Èë¿Úä¯ÀÀÆ÷', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_OWNER', 'MND', 'Ò³ÃæMaster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_CRSUCCEEDED', 'MND', '³É¹¦´´½¨ÐÂÈë¿ÚÒ³Ãæ!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_MYPORTAL', 'MND', 'ÎÒµÄÈë¿ÚÒ³Ãæ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_EDIT', 'MND', '±à¼­Èë¿ÚÒ³Ãæ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_BROWSE', 'MND', 'ä¯ÀÀÕ¾µãµØÍ¼', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_NEWPAGE', 'MND', 'Ôö¼ÓÕ¾µãÒ³Ãæ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_NEWINSTANCE', 'MND', 'Ôö¼ÓÒ³Ãæ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_IPROPERTIES', 'MND', 'Ò³ÃæÊôÐÔ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_PROPERTIES', 'MND', 'Õ¾µãÒ³ÃæÊôÐÔ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_DELMES', 'MND', 'ÄúÕý×¼±¸É¾³ýÕ¾µãÒ³Ãæ¡£Çë×¢Òâ£¬Õ¾µãÒ³ÃæµÄÊµÀýÒ²»á±»É¾³ý!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_DELETE', 'MND', 'É¾³ýÕ¾µãÒ³Ãæ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_PDELMES', 'MND', 'ÄúÕý×¼±¸É¾³ýÒ³Ãæ¡£Çë×¢Òâ£¬Ò³ÃæµÄÊµÀýÒ²»á±»É¾³ý!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_PDELETE', 'MND', 'É¾³ýÒ³Ãæ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_CONFIGURE', 'MND', 'ÅäÖÃÒ³Ãæ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_CONFDESC', 'MND', 'Äú¿ÉÒÔ½«±¾Õ¾µãÒ³Ãæ¹ØÁªÖÁÒ»¸öÒÑ´æÔÚµÄ´ØµÄÀý³Ì£¬»òÕßÄúÒ²¿ÉÒÔ´´½¨Ò»¸öÐÂµÄÀý³Ì£¬Çë¾ö¶¨ÄúÏë×öÊ²Ã´¡£', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_LINK', 'MND', '¹ØÁªÖÁÒÑ´æÔÚµÄ´ØµÄÀý³Ì', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_CLNEW', 'MND', '´´½¨ÐÂµÄ´ØµÄÀý³Ì', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_EDIT', 'MND', '±à¼­Õ¾µãÒ³Ãæ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUPROPS', 'MND', '²Ëµ¥ÃûÓë°ïÖúÎÄ×Ö', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUNAME', 'MND', '²Ëµ¥ÉÏµÄÃû³Æ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUHELP', 'MND', '²Ëµ¥ÉÏµÄ°ïÖúÎÄ×Ö', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_LAUNCHDATE', 'MND', '´Ó...¼¤»î', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_EXPIREDATE', 'MND', '´Ó...Ê§Ð§', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_LAUNCHDATES', 'MND', 'ÊµÊ±ÅäÖÃ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_PREVIEW', 'MND', 'Ô¤ÀÀÒ³Ãæ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_LAUNCH', 'MND', 'Æô¶¯Ò³Ãæ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_EXPIRE', 'MND', 'Ê§Ð§Ò³Ãæ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOSPTITLE', 'MND', 'Æô¶¯Ò³ÃæÖ®Ç°Äú±ØÐë¶¨Òå²Ëµ¥ÉÏµÄÃû³Æ!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM', 'MND', 'Õ¾µãÒ³ÃæMaster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_EDIT', 'MND', '±à¼­Õ¾µãÒ³ÃæMaster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_META', 'MND', 'META-KeyÄ£°å', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_VARIATIONS', 'MND', '¿ÉÏÔÊ¾µÄ±äÁ¿', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_TYPE', 'MND', 'Ò³ÃæÖÖÀà', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_CLUSTER', 'MND', '´ØÄ£°å', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_PATH', 'MND', 'Ä£°åÂ·¾¶', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_BROWSE', 'MND', 'ä¯ÀÀ´Ø', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_NEW', 'MND', 'ÐÂÀý³Ì', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_PROPERTIES', 'MND', 'Àý³ÌÊôÐÔ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_DEL', 'MND', 'É¾³ýÀý³Ì', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_DELMES', 'MND', 'ÄúÈ·ÊµÏëÉ¾³ýÕâ¸ö´ØÀý³ÌÂð.ËùÓÐÄÚÈÝÊý¾Ý»á¶ªÊ§!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_EDIT', 'MND', '±à¼­´ØÀý³Ì', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_CREATEINSTANC', 'MND', '´´½¨ÐÂÀý³Ì', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_CREATEINSMES', 'MND', 'ÈÔÓÐ¿Õ¼ä¿É´´½¨Õâ¸öÄÚÈÝ×Ö¶ÎµÄ¶îÍâÀý³Ì. Èç¹ûÄúÏë´´½¨ÁíÒ»¸öÀý³Ì£¬ÇëÔÚÏÂÃæµÄÎÄ×Ö¿òÖÐÊäÈë±êÌâ£¬²¢°´ÏÂCreat°´Å¥.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_NOTITLE', 'MND', '»¹Î´¶¨Òå±êÌâ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TITLE', 'MND', '±êÌâ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_EDIT', 'MND', '±à¼­´ØºÅ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_DELETE', 'MND', 'É¾³ý´ØºÅ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_DELETEMES', 'MND', 'ÄúÈ·ÊµÏëÉ¾³ýÕâ¸öÀý³ÌÂð. Ëü»áÓÀÔ¶Ê§È¥!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_DELETED', 'MND', 'Õâ¸öÀý³ÌÒÑ±»É¾³ý!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_NOTDELETED', 'MND', 'Õâ¸öÀý³Ì²»ÄÜ±»É¾³ý!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI', 'MND', '´ØÀý³Ì:', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SR_SELECTCI', 'MND', 'Äú¿ÉËÑË÷ÈÎºÎÕâÀïµÄÄÚÈÝÌõÄ¿.Èç¹ûÄúÏëÑ¡¶¨Ò»¸öÄÚÈÝÌõÄ¿, ¿ÉÑ¡ÖÐËü²¢°´ÏÂ²¢°´ÏÂUpdate°´Å¥! Èç¹ûÄúÏë¹ØÁªÐÂÄÚÈÝÖÁÕâ¸ö×Ö¶Î, create the content in the Object Browser first.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SR_SELECTCLI', 'MND', 'ÇëÑ¡ÔñÒ»¸ö´ØÄ£°å. È»ºóÄú¿ÉÑ¡ÔñÒ»¸öÄ£°åµÄÀý³ÌÀ´Ê¹ÓÃ.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FOLDER', 'MND', 'ÎÄ¼þ¼Ð', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTENTTYPE', 'MND', 'ÄÚÈÝÀàÐÍ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTENTITEM', 'MND', 'ÄÚÈÝÌõÄ¿', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCH', 'MND', '¿ªÊ¼ËÑË÷', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCHIN', 'MND', 'ËÑË÷', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCHRESULTS', 'MND', 'ËÑË÷½á¹û£¬ÇëÑ¡Ôñ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECTEDOBJECT', 'MND', 'µ±Ç°Ñ¡ÔñµÄÄÚÈÝÌõÄ¿', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECTEDINSTANCE', 'MND', 'Ñ¡Ôñ´ØÀý³Ì', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_META', 'MND', 'MetaÄ£°å', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_BROWSER', 'MND', 'Ä¿±êä¯ÀÀÆ÷', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_INSTALLPLUGIN', 'MND', '²å¼þ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_ES', 'MND', 'Ì½Ë÷Õ¾µã', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_SPM', 'MND', 'Õ¾µãÒ³ÃæMaster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_PRTMAN', 'MND', 'Èë¿Ú¹ÜÀíÆ÷', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_MYPRT', 'MND', 'ÎÒµÄÈë¿Ú', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_MYPROFILE', 'MND', 'ÎÒµÄ´«ÂÔ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_LOGOUT', 'MND', 'µÇ³ö', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_CLB', 'MND', '´Øä¯ÀÀÆ÷', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_CLTB', 'MND', '´ØÄ£°åä¯ÀÀÆ÷', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_UMAN', 'MND', 'ÓÃ»§¹ÜÀí', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_VAR', 'MND', '±äÁ¿', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_PURGE', 'MND', '¾»»¯Êý¾Ý¿â', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_PGN', 'MND', '²å¼þ¿ØÖÆ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_NEW', 'MND', 'ÐÂ´ØÄ£°å', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_BROWSE', 'MND', 'ä¯ÀÀ´ØÄ£°å', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_NAME', 'MND', '´ØÄ£°åÃû³Æ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_PROPERTIES', 'MND', '´ØÄ£°åÊôÐÔ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_DELETE', 'MND', 'É¾³ý´ØÄ£°å', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_DELMES', 'MND', 'ÄúÕý×¼±¸É¾³ýÒ»¸ö´ØÄ£°å. Õâ»áµ¼ÖÂÔÚÄÇ¸ö´ØÄ£°åÉÏ´´½¨µÄËùÓÐ(!)ÄÚÈÝ¶ªÊ§. ÄúÈ·¶¨Òª¼ÌÐøÂð?', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLTI_DELETE', 'MND', 'ÄúÊÇ·ñÕæÏëÉ¾³ýÕâ¸öÌõÄ¿. Õâ¸öÌõÄ¿µÄËùÓÐÀý³ÌÒ²»á¶ªÊ§!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_SCHEME', 'MND', '±à¼­´ØÄ£°å·½°¸', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_MINCARD', 'MND', '×îÉÙÀý³ÌÊý', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_MAXCARD', 'MND', '×î´óÀý³ÌÊý', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LINKED', 'MND', '¹ØÁªÖÁ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_INSTALLDESC', 'MND', 'ÇëÈ·¶¨ÄúÒÑ½«ËùÓÐ±ØÐèµÄÎÄ¼þ¸´ÖÆµ½Õâ¸öÎÄ¼þ¼Ð£¬·ñÔò²»ÄÜ³É¹¦. ÔÚÏÂÃæµÄÊäÈë¿òÖÐÊäÈë²å¼þµÄÕýÈ·Â·¾¶. ÏµÍ³¼´»á×Ô¶¯°²×°²å¼þ.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_CHOOSE', 'MND', '²å¼þ: &nbsp; /plugin/', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_FILEWRONG', 'MND', 'ÔÚ·þÎñÆ÷ÉÏÕÒ²»µ½ÄúÊäÈëµÄÎÄ¼þÃû!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLASS_WRONG', 'MND', 'ÄúÖ¸¶¨µÄÎÄ¼þÃ»ÓÐºÏ·¨µÄÀàÐÍÇ©Ãû!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_INSTALLED', 'MND', '³É¹¦°²×°²å¼þ!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_UPGRADED', 'MND', '³É¹¦Éý¼¶²å¼þ!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_ERROR', 'MND', '°²×°²å¼þÊ±ÓÐ´íÎó!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_ALREADYINSTAL', 'MND', '²å¼þÒÑ±»°²×°!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_NEWERINSTALLE', 'MND', 'ÒÑ¾­°²×°ÓÐÕâ¸ö²å¼þµÄÐÂ°æ±¾!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_TITLE', 'MND', '²å¼þ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_INSTALL', 'MND', '°²×°²å¼þ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_UNINSTALL', 'MND', 'Ð¶ÔØ²å¼þ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_UNINSTALLMES', 'MND', 'ÄúÕý×¼±¸Ð¶ÔØÒ»¸öÄ£¿é. Ð¶ÔØÒ»¸öÄ£¿é²»Ö»É¾³ýÄÚÈÝÀàÐÍ£¬Í¬Ê±Ò²É¾³ýÕâ¸öÀàÐÍ´¢´æÔÚÊý¾Ý¿âÖÐµÄÃ¿¸öµ¥¸öÄ¿±ê. Ð¶ÔØ½«»á¿Ï¶¨É¾³ýÕâ¸öÄ£¿éµÄËùÓÐ(!)Êý¾Ý!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_UNINSTALLDELE', 'MND', 'Ð¶ÔØÄ£¿é,<br> É¾³ýËùÓÐ¶ÔÓ¦µÄÄÚÈÝ.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_NEW', 'MND', 'ÐÂÄ¿±ê', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_NAME', 'MND', 'Ä¿±êÃû³Æ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_PROPERTIES', 'MND', 'Ä¿±êÊôÐÔ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_DELMES', 'MND', 'ÄúÕý×¼±¸É¾³ýÒ»¸öÄ¿±ê. <b>×¢Òâ»á¶ªÊ§ËùÓÐ±äÁ¿ÓëMETA-DATA!</b>', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_DEL', 'MND', 'É¾³ýÄ¿±ê', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_EDIT', 'MND', '±à¼­Ä¿±ê', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_PREVIEW', 'MND', 'Ô¤ÀÀ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_TEXT', 'MND', 'ÎÄ±¾', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_ALT', 'MND', 'ALT-Tag', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_COPYRIGHT', 'MND', '°æÈ¨', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_BROWSE', 'MND', 'ä¯ÀÀÄ¿±ê', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_HOME', 'MND', '¿ªÊ¼', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_NEWFOLDER', 'MND', 'ÐÂÎÄ¼þ¼Ð', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_EDITFOLDER', 'MND', '±à¼­ÎÄ¼þ¼ÐÊôÐÔ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_FOLDERNAME', 'MND', 'ÎÄ¼þ¼ÐÃû', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_DELETEFOLDER', 'MND', 'É¾³ýÎÄ¼þ¼Ð', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_DELFOLDERMES', 'MND', 'ÄúÕý×¼±¸É¾³ýÒ»¸öÎÄ¼þ¼Ð.  ÇëÑ¡ÔñÒ»¸ö¶¯×÷.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_FOLDERNOTEMPTY', 'MND', 'ÎÄ¼þ¼Ð²»¿Õ. Òò´ËÄú²»ÄÜÉ¾³ýËü! Çë¼ì²éËùÓÐÄ¿±êÓë´Ø!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_DELFOLDER', 'MND', 'É¾³ýÎÄ¼þ¼ÐÓëËùÓÐ×ÓÄ¿±ê', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_MOVEOBJECTS', 'MND', '½«ËùÓÐÄ¿±êÒÆÖÁ¸¸½áµã', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_PARENT', 'MND', '¸¸ÎÄ¼þ¼Ð', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('METATEMPLATES', 'MND', 'MetaÊý¾ÝÄ£°å', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_PROPERTIES', 'MND', '±à¼­MetaÄ£°åÊôÐÔ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_SCHEME', 'MND', '±à¼­MetaÄ£°å·½°¸', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_DELETE', 'MND', 'ÄúÊÇ·ñÕæÏëÉ¾³ýmetaÄ£°åµÄÕâ¸ö²¿·Ö? ËùÓÐ¹ØÁªµ½Õâ¸ö²¿·ÖµÄÔÚCMS METAÊäÈëÖÐÊäÈëµÄÐÅÏ¢½«»á±»É¾³ý. Êý¾Ý»áÓÀÔ¶¶ªÊ§!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_ADDITIONAL', 'MND', '¸½¼ÓµÄMETAÊý¾Ý', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_BASE', 'MND', '»ù±¾µÄMETAÊý¾Ý', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_MODULE', 'MND', 'ÄÚÈÝÀàÐÍÖ¸¶¨µÄMETAÊý¾Ý', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VARIATIONS', 'MND', '¿ÉÓÃµÄ±äÁ¿', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('V_NAME', 'MND', 'Ãû³Æ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('V_SHORT', 'MND', 'Short-Tag', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('V_EDIT', 'MND', '±à¼­±äÁ¿', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOGIN_FAILED', 'MND', 'ÄúÊäÈëµÄµÇÂ¼Êý¾Ý²»ÄÜ±»ÑéÖ¤! ÇëÔÙÊÔÒ»±é.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_HEAD', 'MND', 'ÓÃ»§´«ÂÔ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_LINK', 'MND', 'ÓÃ»§´«ÂÔ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_NAME', 'MND', 'ÓÃ»§Ãû', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FULL_NAME', 'MND', 'È«Ãû', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PASSWORD', 'MND', 'ÃÜÂë', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_EMAIL', 'MND', 'eMail', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_ACTIVE', 'MND', 'Ê¹ÕÊºÅ¿ÉÓÃ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_FILTERMENU', 'MND', 'ÓÃ»§¹ÜÀí', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_SETPERM', 'MND', 'ÔÚÏÂÃæÉèÖÃÓÃ»§È¨ÏÞ. Òª´Ó×éÖÐÉ¾³ýÒ»¸öÓÃ»§, ½«Ëû´ÓËùÓÐµÄ×éÖÐ³·Ïû¼´¿É.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_PERMGRID', 'MND', 'È¨ÏÞ±í', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_LINK', 'MND', '×é´«ÂÔ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_HEAD', 'MND', '×é´«ÂÔ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_NAME', 'MND', '×éÃû', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_DESCRIPTIO', 'MND', 'ÃèÊö', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_FILTERMENU', 'MND', '×é¹ÜÀí', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_LINK', 'MND', '½ÇÉ«´«ÂÔ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_HEAD', 'MND', '½ÇÉ«´«ÂÔ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_NAME', 'MND', '½ÇÉ«Ãûe', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_DESCRIPTION', 'MND', 'ÃèÊö', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_FILTERMENU', 'MND', '½ÇÉ«¹ÜÀí', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_PERMISSIONS', 'MND', 'ÓÃ»§È¨ÏÞ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('UP_INTRO', 'MND', 'ÇëÑ¡ÔñÄúÏë¸³ÓèÓÃ»§µÄ×é¼°ÔÚ×éÖÐµÄ½ÇÉ«.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_TO_GROUP', 'MND', 'Ìí¼ÓÓÃ»§µ½×éÖÐ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ERROR_SEL_GROUP', 'MND', 'Äú±ØÐëÑ¡ÔñÒ»¸ö×é!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ERROR_SEL_ROLE', 'MND', 'Äú±ØÐëÖÁÉÙÑ¡ÔñÒ»¸ö½ÇÉ«!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_PROFILE', 'MND', 'ÎÒµÄ´«ÂÔ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COMMIT', 'MND', 'Î¯ÍÐ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CANCEL', 'MND', 'È¡Ïû', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('YES', 'MND', 'ÊÇ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO', 'MND', '·ñ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEW', 'MND', '²åÈëÐÂµÄ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NAME', 'MND', 'Ãû³Æ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DESCRIPTION', 'MND', 'ÃèÊö', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DOSOMETHING', 'MND', 'ÇëÑ¡ÔñÄúÒª½øÐÐµÄ¶¯×÷. Äú¿É²åÈëÐÂÌõÄ¿, ±à¼­ÌõÄ¿, É¾³ýÌõÄ¿¼°¸Ä±äÌõÄ¿Ë³Ðò.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT', 'MND', '±à¼­', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('UP', 'MND', 'ÉÏ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DOWN', 'MND', 'ÏÂ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTAINERNAME', 'MND', 'Ä£°å', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECTOBJECT', 'MND', 'ÇëÑ¡ÔñÒ»¸öÀàÐÍ²¢Ö¸¶¨Ò»¸öÎ»ÖÃÓëÃû³ÆÒÔ±ã´´½¨Ò»¸öÐÂÄ¿±ê.<br>¶ÔÓÚÎ»ÖÃ£¬°´ÄúµÄÐèÒª£¬Ê¹ÓÃ 0 ½«²åÔÚ¿ªÍ·£¬999 ½«²åÔÚÄ©Î²£¬ÒÔ¼°ÆäËüÎ»ÖÃ.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('POSITION', 'MND', 'Î»ÖÃ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DELETE', 'MND', 'É¾³ý', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TYPE', 'MND', 'ÀàÐÍ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('KEYWORDS', 'MND', '¹Ø¼ü×Ö', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('METATEMPLATE', 'MND', '¸½¼ÓµÄMETA-KeyÄ£°å', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECT_VARIATION', 'MND', 'Ñ¡Ôñ±äÁ¿', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACTIVE_VARIATION', 'MND', '¼¤»îµÄ±äÁ¿:', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_VARIATIONS', 'MND', 'Ä¿Ç°Õâ¸öÃ»ÓÐ¶¨Òå±äÁ¿!<br> ÇëÕÒÒ»Î»¿ª·¢Õß¼ì²éËùÑ¡µÄÌõÄ¿µÄÅäÖÃ!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_CONTENT', 'MND', '±à¼­ÄÚÈÝ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_META', 'MND', '±à¼­METAÊý¾Ý', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_DISPATCHER', 'MND', 'Ê¹ÓÃÕâ¸ö°´Å¥ÔÚ±à¼­METAÊý¾ÝÓë±à¼­ÄÚÈÝÖ®¼äÇÐ»».', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PREVIEW', 'MND', 'Ô¤ÀÀ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHOOSEFILE', 'MND', 'Ñ¡ÔñÒ»¸öÎÄ¼þ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONFIGURED', 'MND', 'ÒÑ×¼±¸ºÃÊ¹ÓÃ.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOTCONFIGURED', 'MND', 'Î´ÅäÖÃ.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONFIG', 'MND', 'ÅäÖÃ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECT_CI', 'MND', 'Ñ¡ÔñÒ»¸öÄÚÈÝÌõÄ¿', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECT_CL', 'MND', 'Ñ¡ÔñÒ»¸ö´ØÀý³Ì', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EMPTY', 'MND', '&lt;¿Õ&gt;', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STATUS', 'MND', '×´Ì¬:', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('UNIQUE', 'MND', 'Õâ¸ö×Ö¶Î±ØÐëÊÇÎ¨Ò»µÄ!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MANDATORY', 'MND', 'Õâ¸ö×Ö¶Î±ØÐëÎª¿Õ!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOTNUMBER', 'MND', 'Äú±ØÐëÊäÈëÒ»¸öÊý×Öµ½Õâ¸ö×Ö¶ÎÖÐ!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WRONGDATE', 'MND', 'ÄúÊäÈëµÄÊý¾Ý²»´æÔÚ!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DATEFORMAT', 'MND', 'Êý¾Ý¸ñÊ½²»¶Ô!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PWDNOTMATCH', 'MND', 'ÄúÊäÈëµÄÃÜÂë²»¶Ô!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PWDTOOSHORT', 'MND', 'ÃÜÂë±ØÐëÖÁÉÙÓÐÖú6¸ö×Ö·û!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PROCERROR', 'MND', '´¦Àí±íµ¥Ê±³öÏÖ´íÎó. Çë¼ì²é±êÎªÀ¶É«µÄ×Ö¶Î²¢ÔÄ¶ÁÄÇÀïÈ¡µÃ½øÒ»²½µÄÐÅÏ¢.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SAVEERROR', 'MND', '½«Êý¾Ý´æÈëÊý¾Ý¿âÊ±³öÏÖ´íÎó. ÇëÈ·¶¨Êý¾Ý¿âÒÑÁ¬½Ó£¬»òÕÒÄúµÄ¹ÜÀíÔ±.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SAVESUCCESS', 'MND', 'Êý¾Ý³É¹¦Ð´ÈëÊý¾Ý¿â.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DELETESUCCESS', 'MND', 'ÏÂÁÐÊý¾ÝÒÑ±»´ÓÊý¾Ý¿âÖÐ³É¹¦É¾³ý. ÏÖÔÚËüÒÑ¶ªÊ§!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECTONE', 'MND', 'Äú±ØÐëÔÚÕâÀï×ö³öÒ»¸öÑ¡Ôñ!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATENEW', 'MND', 'Õâ¸öÄ£°åÒÑ´´½¨Ò»¸öÐÂ³ÉÔ±. Çë²Î¼ûÏÂÁÐÊý¾Ý.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PROMPTDELETE', 'MND', 'ÄúÊÇ·ñÕæÏëÉ¾³ýÕâ¸öÊý¾Ý¼¯? Õâ¸ö¶¯×÷²»ÄÜ·´»Ú!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RESET', 'MND', 'ÖØÖÃ±íµ¥', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BACK', 'MND', 'ÍË»Ø', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATE', 'MND', '´´½¨ÌõÄ¿', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ERROR', 'MND', 'ÔÚ½øÐÐËùÑ¡²Ù×÷Ê±³ö´í!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE', 'MND', '¾»»¯Êý¾Ý¿â', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_MES', 'MND', 'ÇëÑ¡ÔñÄúÏë¾»»¯µÄÊý¾Ý¿â²¿·Ö.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_VAR', 'MND', '¾»»¯²ÎÊý', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_CONTENT', 'MND', '¾»»¯ÄÚÈÝ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VAR_SUCCEEDED', 'MND', ' ³É¹¦!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_FOLDER', 'MND', '¾»»¯ÎÄ¼þ¼Ð', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_CLUSTER', 'MND', '¾»»¯´Ø', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_META', 'MND', '¾»»¯Meta', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_CLT', 'MND', '¾»»¯´ØÄ£°å', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_PAGES', 'MND', '¾»»¯Õ¾µãÒ³ÃæÓëMasters', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_EXPIRED', 'MND', '¾»»¯Ê§Ð§µÄÒ³Ãæ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_BROWSER', 'IT', 'Esplora il portale', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_OWNER', 'IT', 'Proprietario della pagina', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_CRSUCCEEDED', 'IT', 'La creazione della nuova pagina del portale è avvenuta con successo!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_MYPORTAL', 'IT', 'Mio Portale', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_EDIT', 'IT', 'Edita la pagine dal portale', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_BROWSE', 'IT', 'Esplora la mappa del sito', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_NEWPAGE', 'IT', 'Aggiungi la pagina del sito', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_NEWINSTANCE', 'IT', 'Aggiungere Pagina', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_IPROPERTIES', 'IT', 'Propietà dalla pagina', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_PROPERTIES', 'IT', 'Proprietà della pagina del sito', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_DELETE', 'IT', 'Cancella la pagina del sito', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_PDELETE', 'IT', 'Cancella Pagina', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_CONFIGURE', 'IT', 'Configura Pagina', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_CONFDESC', 'IT', 'Puoi collegare la pagina del sito a una istanza di gruppo esistente, o puoi creare una nuova istanza. Decidere cosa fare.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_LINK', 'IT', 'Collegare a una istanza di gruppo esistente', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_CLNEW', 'IT', 'Creare una nuova istanza di gruppo', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_EDIT', 'IT', 'Edita la pagina del sito', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUPROPS', 'IT', 'Nome del menù e testo di aiuto', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUNAME', 'IT', 'Nome nel Menù', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUHELP', 'IT', 'Testo di aiuto per il Menù', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_LAUNCHDATE', 'IT', 'Attivata da', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_EXPIREDATE', 'IT', 'Scaduta da', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_LAUNCHDATES', 'IT', 'Configurazione del tempo di vita', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_PREVIEW', 'IT', 'Pagina Precedente', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_LAUNCH', 'IT', 'Aprire la Pagina', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_EXPIRE', 'IT', 'Fà scadere pagina', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM', 'IT', 'Pagina del sito principale', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_EDIT', 'IT', 'Edita pagina del sito principale', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_META', 'IT', 'Template di META-chiavi', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_VARIATIONS', 'IT', 'Variazioni visualizabili', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_TYPE', 'IT', 'Tipo di pagina', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_CLUSTER', 'IT', 'Gruppo di Template', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_PATH', 'IT', 'Percorso dei Template', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_BROWSE', 'IT', 'Esplora gruppo', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_NEW', 'IT', 'Nuova istanza', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_PROPERTIES', 'IT', 'Proprietà del gruppo', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_DEL', 'IT', 'Cancella istanza', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_CREATEINSTANC', 'IT', 'Creare nuova istanza', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_NOTITLE', 'IT', 'Nessun titolo definito', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TITLE', 'IT', 'Titolo', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_EDIT', 'IT', 'Edita membri del gruppo', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_DELETE', 'IT', 'Cancella membri del gruppo', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_DELETEMES', 'IT', 'Vuoi veramente cancellare questa istanza. Sarà persa per sempre!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI', 'IT', 'Istanza di gruppo:', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SR_SELECTCI', 'IT', 'Puoi cercare quì per ogni content-items . Se vuoi selezionare un content-item, sceglierlo e premere il pulsante di Update ! Se vuoi connettere un nuovo contenuto con questo campo, bisogna prima creare il contenuto nel navigatore di oggetti.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SR_SELECTCLI', 'IT', 'Selezionare un cluster-template. Dopodichè puoi selezionare una istanza del template da assegnare.', NULL);
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
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_PROPERTIES', 'IT', 'Proprietà del Cluster-Template', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_DELETE', 'IT', 'Cancella il Cluster-Template', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_DELMES', 'IT', 'Vuoi candellare il cluster-template. Questo comporterà la perdita di tutti(!) i contenuti creati su e con il cluster-template. Sei sicuro, vuoi proseguire?', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLTI_DELETE', 'IT', 'Vuoi veramente cancellare questo oggetto. Tutte le istanza di questo oggetto saranno perse!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_SCHEME', 'IT', 'Edita lo schema  Cluster-Template', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_MINCARD', 'IT', 'Minimo numero di istanze', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_MAXCARD', 'IT', 'Massimo numero di istanze', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LINKED', 'IT', 'Collegato  con', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_INSTALLDESC', 'IT', 'Essere sicuri di aver copiato tutti i necessari file nella cartella. Inserire il percorso corretto per i plugin nel campo sottostante. Il sistema istallerà i the PlugIn automaticamente.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_CHOOSE', 'IT', 'PlugIn: &nbsp; /plugin/', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_FILEWRONG', 'IT', 'Il file inserito non è stato trovato nel server!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLASS_WRONG', 'IT', 'Il file specificato non ha un firma di classe valida!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_INSTALLED', 'IT', 'Il PlugIn è stato installato con successo!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_UPGRADED', 'IT', 'Il PlugIn è stato aggiornato con successo!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_ALREADYINSTAL', 'IT', 'Il PlugIn è già istallato!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_TITLE', 'IT', 'PlugIns', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_INSTALL', 'IT', 'Aggiungi PlugIn', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_UNINSTALL', 'IT', 'Rimuovi PlugIn', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_UNINSTALLMES', 'IT', 'Stai per rimuovere un modulo. Rimuovere un modulo non solo rimuove i tipi contenuti ma anche cancella ogni singolo oggetto di questo tipo che sono immagazzinati nel database. La rimozione cancellerà definitivamente tutti(!) i dati di questo modulo!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_UNINSTALLDELE', 'IT', 'Rimuovi il modulo,<br> Cancella tutti i contenuti corrispondenti.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_NEW', 'IT', 'Nuovo oggetto', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_PROPERTIES', 'IT', 'Proprietà degli oggetti', NULL);
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
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_EDITFOLDER', 'IT', 'Edita le proprietà del contenitore', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_FOLDERNAME', 'IT', 'Nomina il contenitore', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_DELETEFOLDER', 'IT', 'Cancella il contenitore', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_FOLDERNOTEMPTY', 'IT', 'Il contenitore non è vuoto. Non è possibili cancellarlo! Controllare tutti gli oggetti e gruppi!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_DELFOLDER', 'IT', 'Cancellare il contenitore a tutti gli oggetti figli', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_MOVEOBJECTS', 'IT', 'Spostare tutti gli oggetti nel nodo principale', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_PARENT', 'IT', 'Contenitore principale', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('METATEMPLATES', 'IT', 'Contenitori Meta-Dati', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_PROPERTIES', 'IT', 'Edita la proprietà dei Meta-Contenitori', NULL);
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
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('UP', 'IT', 'Sù', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DOWN', 'IT', 'Giù', NULL);
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
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MANDATORY', 'IT', 'Questo campo non può essere vuoto!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOTNUMBER', 'IT', 'Devi inserire un numero in questo campo!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WRONGDATE', 'IT', 'La data inserita, non esiste!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DATEFORMAT', 'IT', 'Il formato della data non è corretto!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PWDNOTMATCH', 'IT', 'La passwords inserita non è corretta!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PWDTOOSHORT', 'IT', 'La password deve essere di almeno 6 caratteri!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PROCERROR', 'IT', 'Un errore è successo mentre si processava il form. Controllare il campo marcato di blu e leggere quì per ulteriori informazioni.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SAVEERROR', 'IT', 'Si è verificato un errore mentre si stavano salvando i dati nel database. Assicurarsi che il database sia connesso o contattare il proprio Amministratore.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SAVESUCCESS', 'IT', 'I dati sono stati scritti correttamente nel database.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DELETESUCCESS', 'IT', 'I dati elencati sotto sono stati correttamente cancellati dal database. Ora sono persi!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECTONE', 'IT', 'Devi fare una scelta quì!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATENEW', 'IT', 'Un nuovo membro di questo template è stato creato. Guardare i dati elencati sotto.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PROMPTDELETE', 'IT', 'Vuoi veramente cancellare questo dataset? Questa azione non può essere ripristinata!', NULL);
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
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_JS', 'PL', 'U¿yj Javascript', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_BL', 'PL', 'Jêzyk systemu zarz±dzania', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_BROWSER', 'PL', 'Przegl±danie Portali', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_OWNER', 'PL', 'W³a¶ciciel Strony', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_CRSUCCEEDED', 'PL', 'Utworzenie nowej strony portalu powiod³o siê!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_MYPORTAL', 'PL', 'Moje Portale', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_EDIT', 'PL', 'Edycja strony Portal-u', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_BROWSE', 'PL', 'Przegl±danie uk³adu stron', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_NEWPAGE', 'PL', 'Dodanie strony serwisu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_NEWINSTANCE', 'PL', 'Dodanie strony', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_IPROPERTIES', 'PL', 'W³a¶ciwo¶ci strony', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_PROPERTIES', 'PL', 'W³a¶ciwo¶ci strony serwisu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_DELMES', 'PL', 'Zamierzasz usun±æ stronê serwisu. Proszê zauwa¿yæ, ¿e tak¿e czynna wersja tej strony serwisu zostanie usuniêta!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_DELETE', 'PL', 'Usuniêcie strony serwisu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_PDELMES', 'PL', 'Zamierzasz usun±æ stronê. Proszê zauwa¿yæ, ¿e tak¿e czynna wersja tej strony zostanie usuniêta!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_PDELETE', 'PL', 'Usuniêcie strony', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_CONFIGURE', 'PL', 'Konfiguracja strony', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_CONFDESC', 'PL', 'Mo¿na po³±czyæ t± stronê serwisu z instniej±cym wysta±pieniem klastra lub mo¿na utworzyæ now± instancjê. Proszê zadecydowaæ co zamierzsz zrobiæ.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_LINK', 'PL', 'Utworzyæ po³±czenie do istniej±cego wyst±pienia klastra', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_CLNEW', 'PL', 'Stworzyæ nowe wyst±pienie klastra', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_EDIT', 'PL', 'Edycja strony serwisu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUPROPS', 'PL', 'Nazwa menu i tekst pomocy', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUNAME', 'PL', 'Nazwa w menu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUHELP', 'PL', 'Tekst pomocy dla menu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_LAUNCHDATE', 'PL', 'Wa¿ne od', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_EXPIREDATE', 'PL', 'Up³ywa od', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_LAUNCHDATES', 'PL', 'Konfiguracja czasu pracy', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_PREVIEW', 'PL', 'Podgl±d strony', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_LAUNCH', 'PL', 'Uruchom stronê', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_EXPIRE', 'PL', 'Przedawnij stronê', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOSPTITLE', 'PL', 'Nale¿y zdefiniowaæ nazwê w menu przed uruchomieniem strony!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACTIVE', 'PL', 'Aktywne', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM', 'PL', 'Wzorzec strony serwisu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_EDIT', 'PL', 'Edycja wzorca strony serwisu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_META', 'PL', 'Wzorzec meta kluczy', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_VARIATIONS', 'PL', 'Wy¶wietlane wersje', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_TYPE', 'PL', 'Rodzaj strony', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_CLUSTER', 'PL', 'Wzorzec klastra', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_PATH', 'PL', '¦cie¿ka do wzorca', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_BROWSE', 'PL', 'Przegl±danie klastrów', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_NEW', 'PL', 'Nowe wyst±pienie', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_PROPERTIES', 'PL', 'W³a¶ciwo¶ci klastra', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_DEL', 'PL', 'Usuñ wyst±pienie', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_DELMES', 'PL', 'Czy na pewno chcesz usun±æ to wyst±pienie klastra? Wszystkie dane zawarto¶ci zostan± stracone!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_EDIT', 'PL', 'Edycja wyst±pienia klastra', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_CREATEINSTANC', 'PL', 'Utórzenie nowego wyst±pienia', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_CREATEINSMES', 'PL', 'Nadal zostaj± gniazda do utworzenia dodatkowych wyst±pieñ dla thych pól zawarto¶ci. Je¿eli chcesz utworzyæ dodatkowe wyst±pienie, wprowad¼ tytu³ w polu tekstowym poni¿ej i naci¶nij przycisk utwórz.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_NOTITLE', 'PL', 'Nie zosta³ jeszcze zdefiniowany tytu³', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TITLE', 'PL', 'Tytu³', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_EDIT', 'PL', 'Edycja cz³onka klastra', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_DELETE', 'PL', 'Usuñ cz³onka klastra', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_DELETEMES', 'PL', 'Czy na pewno chcesz usun±æ to wyst±pienie? Zostanie stracone na zawsze!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_DELETED', 'PL', 'Wyst±pienie zosta³o usuniête!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_NOTDELETED', 'PL', 'To wyst±pienie nie mo¿e zostaæ usuniête!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI', 'PL', 'Wyst±pienie klastra:', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SR_SELECTCI', 'PL', 'Tutaj mo¿na wyszukiwaæ dowolne elementy zawarto¶ci. Je¿eli chcemy wybraæ element zawarto¶ci, nale¿y nacisn±æ przycisk Aktualizuj! Je¿eli chcemy pod³±czyæ siê do nowej zawarto¶ci za pomoc± tego pola - stwórz wcze¶niej zawarto¶æ w Przegl±darce obiektów.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SR_SELECTCLI', 'PL', 'Proszê wybraæ szablon klastra. Nastêpnie mo¿na wybraæ wyst±pienie szablonu w celu dalszego u¿ycia.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FOLDER', 'PL', 'Folder', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTENTTYPE', 'PL', 'Rodzaj zawarto¶ci', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTENTITEM', 'PL', 'Element zawarto¶ci', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCH', 'PL', 'Pocz±tek wyszukiwania', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCHIN', 'PL', 'Szukaj', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCHRESULTS', 'PL', 'Wyniki wyszukiwania, proszê wybraæ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECTEDOBJECT', 'PL', 'Aktualnie wybrany element zawarto¶ci', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECTEDINSTANCE', 'PL', 'Wybrane wyst±pienie klastra', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_META', 'PL', 'Szablony Meta', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_BROWSER', 'PL', 'Przegladarka obiektów', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_INSTALLPLUGIN', 'PL', 'Dodatki', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_ES', 'PL', 'Przegl±darka serwisu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_SPM', 'PL', 'Wzorzec stron serwisu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_PRTMAN', 'PL', 'Zarz±dzanie portalem', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_MYPRT', 'PL', 'Moje portale', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_MYPROFILE', 'PL', 'Mój profil', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_LOGOUT', 'PL', 'Wyloguj', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_CLB', 'PL', 'Przegl±darka klastra', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_CLTB', 'PL', 'Przegl±darka szablonów klastra', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_UMAN', 'PL', 'Zarz±dzanie u¿ytkownikami', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_VAR', 'PL', 'Odmiany', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_PURGE', 'PL', 'Usuniêcie bazy danych', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_PGN', 'PL', 'Kontrola dodatków', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_REPORT', 'PL', 'Raport serweisu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_NEW', 'PL', 'Nowy szablon klastra', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_BROWSE', 'PL', 'Przegl±d. szabl.klas.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_NAME', 'PL', 'Nazwa szabl.klas.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_PROPERTIES', 'PL', 'W³a¶ciwo¶ci szabl.klas.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_DELETE', 'PL', 'Usuniêcie szabl.klas.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_DELMES', 'PL', 'Zamierzasz usun±æ szablon klastra. Spowoduje to usuniêciê wszystkich(!) zawarto¶ci stworzonych przy u¿yciu szablonu klastra. Czy na pewno chcesz kontynuowaæ?', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLTI_DELETE', 'PL', 'Czy na pewno chesz usun±æ ten element? Wszystkie wyst±pienia tego elementu tak¿e zostan± usuniête!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_SCHEME', 'PL', 'Edycja schematu szablonu klastra', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_MINCARD', 'PL', 'Wyst±pienia', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_MAXCARD', 'PL', '-', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LINKED', 'PL', 'Po³±czone z', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_INSTALLDESC', 'PL', 'Prosze siê upewniæ, ¿e zosta³y skopiowane wszystkie niezbêdne pliki do katalogu przed kontynuacj±. Wprowad¼ poprawn± ¶cie¿kê do dodatku w poni¿szym polu. System zainstaluje dodatek automatycznie.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_CHOOSE', 'PL', 'Dodatek: &nbsp; /plugin/', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_FILEWRONG', 'PL', 'Nazwa pliku, która zosta³a wprowadzona nie mog³a zostaæ znaleziona na serwerze!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLASS_WRONG', 'PL', 'Plik, który zosta³ wprowadzony nie zawiera poprawnej sygnatury!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_INSTALLED', 'PL', 'Dodatek zosta³ poprawnie zainstalowany!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_UPGRADED', 'PL', 'Dodatek zosta³ porawnie zaktualizowany!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_ERROR', 'PL', 'Wyst±pi³ b³±d podczas instalacji dodatku!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_ALREADYINSTAL', 'PL', 'Dodatek ju¿ zosta³ zainstalowany!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_NEWERINSTALLE', 'PL', 'Ju¿ jest zainstalowana nowsza wersja dodatku!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_TITLE', 'PL', 'Dodatki', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_INSTALL', 'PL', 'Zainstaluj dodatek', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_UNINSTALL', 'PL', 'Odinstaluj dodatek', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_UNINSTALLMES', 'PL', 'Zamierzasz odinstalowaæ modu³. Odinstalowanie modu³u nie tylko usuwa rodzaj zawarto¶ci ale tak¿e usuwa ka¿dy obiekt tego typu przechowywany w bazie danych. Odinstalowanie definitywnie(!) usunie wszystkie dane dla tego modu³u!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_UNINSTALLDELE', 'PL', 'Odinstaluj modu³,<br> Usuniêcie wszystkie zale¿ne zawarto¶ci.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_NEW', 'PL', 'Nowy obiekt', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_NAME', 'PL', 'Nazwa obiektu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_PROPERTIES', 'PL', 'W³a¶ciwo¶ci obiektu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_DELMES', 'PL', 'Zamierzasz usun±æ obiekt. <b>Nale¿y zauwa¿yæ, ¿e wszystkie odmiany i meta dane zostan± utracone!</b>', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_DEL', 'PL', 'Usuñ obiekt', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_EDIT', 'PL', 'Edytuj obiekt', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_PREVIEW', 'PL', 'Podgl±d', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_TEXT', 'PL', 'Tekst', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_ALT', 'PL', 'Opis rysunku', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_COPYRIGHT', 'PL', 'Prawo autorskie', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_BROWSE', 'PL', 'Przegl±d obiektów', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_HOME', 'PL', 'Start', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_NEWFOLDER', 'PL', 'Nowy folder', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_EDITFOLDER', 'PL', 'Edycja w³a¶ciwo¶ci folderu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_FOLDERNAME', 'PL', 'Nazwa folderu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_DELETEFOLDER', 'PL', 'Usuñ folder', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_DELFOLDERMES', 'PL', 'Zamierzasz usun±æ folder. Proszê zaznaczyæ akcjê.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_FOLDERNOTEMPTY', 'PL', 'Folder nie jest pusty. Nie mo¿na go usun±æ. Proszê sprawdziæ wszystkie obiekty i klastry!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_DELFOLDER', 'PL', 'Usuniêcie folderu i wszystkich podrzêdnych obiektów', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_MOVEOBJECTS', 'PL', 'Przesuniêcie wszystkich obiektów do nadrzêdnego wêz³a', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_PARENT', 'PL', 'Nadrzêdny folder', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('METATEMPLATES', 'PL', 'Szablon meta danych', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_PROPERTIES', 'PL', 'Edycja w³a¶ciwo¶ci meta szablonu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_SCHEME', 'PL', 'Edycja schematu meta szablonu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_DELETE', 'PL', 'Czy rzeczywi¶cie zamierzasz usun±æ t± czê¶æ meta szablonu? Wszystkie informacje wprowadzone w dowolne meta pola w systemie CMS po³±czone do tej czê¶ci zostan± usuniête. Dane zostan± usuniête ca³kowicie!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_ADDITIONAL', 'PL', 'Dodatkowe meta dane', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_BASE', 'PL', 'Podstawowe meta dane', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_MODULE', 'PL', 'Meta dane specyficzne dla rodzaju zawrto¶ci', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VARIATIONS', 'PL', 'Dostêpne odmiany', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('V_NAME', 'PL', 'Nazwa', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('V_SHORT', 'PL', 'Krótki znacznik', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('V_EDIT', 'PL', 'Edycja odmian', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOGIN_FAILED', 'PL', 'Wprowadzone dane u¿ytkownika nie mog± zostaæ potwierdzone! Proszê spróbowaæ ponownie.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_HEAD', 'PL', 'Profil u¿ytkownika', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_LINK', 'PL', 'Profile u¿ytkowników', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_NAME', 'PL', 'Nazwa u¿ytkownika', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FULL_NAME', 'PL', 'Pe³na nazwa', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PASSWORD', 'PL', 'Has³o', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_EMAIL', 'PL', 'eMail', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_ACTIVE', 'PL', 'Konto w³±czone', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_FILTERMENU', 'PL', 'Administracja u¿ytkonikami', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_SETPERM', 'PL', 'Ustal prawa dostêpu u¿ytkownika poni¿ej. W celu usuniêcia u¿ytkownika z grupy, po prostu odwo³aj wszytkie grupy przynale¿ne do niego.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_PERMGRID', 'PL', 'Siatka uprawnieñ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_LINK', 'PL', 'Profile grupy', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_HEAD', 'PL', 'Profil grupy', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_NAME', 'PL', 'Nazwa grupy', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_DESCRIPTIO', 'PL', 'Opis', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_FILTERMENU', 'PL', 'Adminstracja grup±', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_LINK', 'PL', 'Profile ról', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_HEAD', 'PL', 'Profil roli', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_NAME', 'PL', 'Nazwa roli', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_DESCRIPTION', 'PL', 'Opis', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_FILTERMENU', 'PL', 'Adminstracja rolami', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_PERMISSIONS', 'PL', 'Uprawnienia u¿ytkownika', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('UP_INTRO', 'PL', 'Proszê zaznaczyæ grupê i role w grupie, które checesz dodaæ dla u¿ytkownika.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_TO_GROUP', 'PL', 'Dodanie u¿ytkownika do grupy', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ERROR_SEL_GROUP', 'PL', 'Nale¿y wybraæ grupê!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ERROR_SEL_ROLE', 'PL', 'Nale¿y wybraæ co najmniej jedn± rolê!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_PROFILE', 'PL', 'Mój profil', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COMMIT', 'PL', 'Powie¿', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CANCEL', 'PL', 'Anuluj', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('YES', 'PL', 'Tak', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO', 'PL', 'Nie', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEW', 'PL', 'Wstaw nowy', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NAME', 'PL', 'Nazwa', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DESCRIPTION', 'PL', 'Opis', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DOSOMETHING', 'PL', 'Proszê wybraæ dzia³anie, które chesz wykonaæ. Mo¿esz wybraæ nowe elementy, edytowaæ elementy, usun±æ elementy lub zmieniæ kolejno¶æ elementów.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT', 'PL', 'Edycja', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('UP', 'PL', 'W górê', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DOWN', 'PL', 'W dó³', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTAINERNAME', 'PL', 'Szablon', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECTOBJECT', 'PL', 'Proszê wybraæ klasê oraz okre¶liæ pozycjê i nazwê dla tworzonego obiektu.<br> Dla pozycji u¿yj 0 dla okre¶lenia pocz±tkowej pozycji, 999 dla okre¶lenie na koñcu poza innymi pozycjami twojego wybory.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('POSITION', 'PL', 'Pozycja', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DELETE', 'PL', 'Usuñ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TYPE', 'PL', 'Typ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('KEYWORDS', 'PL', 'S³owa kluczowe', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('METATEMPLATE', 'PL', 'Dodatkowe meta klucze szablonu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECT_VARIATION', 'PL', 'Wybierz odmianê', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACTIVE_VARIATION', 'PL', 'Aktywne odmiany:', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_VARIATIONS', 'PL', 'Nie ma obecnie zdefiniowanych odmian tego obiektu!<br>Proszê skonsultowaæ to z programist± w celu sprawdzenia konfiguracji wybranego elementu!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_CONTENT', 'PL', 'Edycja zawarto¶ci', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_META', 'PL', 'Edycja meta danych', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_DISPATCHER', 'PL', 'U¿yj tego przycisku w celu prze³±czenia siê pomiêdzy edytowaniem meta danych a edycj± zawarto¶ci.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PREVIEW', 'PL', 'Podgl±d', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHOOSEFILE', 'PL', 'Wybierz plik', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONFIGURED', 'PL', 'Gotowy do u¿ycia.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOTCONFIGURED', 'PL', 'Nie skonfigurowany jeszcze.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONFIG', 'PL', 'Konfiguracja', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECT_CI', 'PL', 'Wybierz element zawarto¶ci', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECT_CL', 'PL', 'Wybierz element klastra', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EMPTY', 'PL', '&lt;pusty&gt;', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STATUS', 'PL', 'Status:', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('UNIQUE', 'PL', 'To pole musi byæ unikalne!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MANDATORY', 'PL', 'To pole nie mo¿e byæ puste!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOTNUMBER', 'PL', 'Nale¿y wprowadziæ numer do tego pola!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WRONGDATE', 'PL', 'Data, która zosta³a wprowadzone nie istnieje!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DATEFORMAT', 'PL', 'Format daty jest nieprawid³owy!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PWDNOTMATCH', 'PL', 'Has³a, które zosta³y wprowadzone nie zgadzaj± siê!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PWDTOOSHORT', 'PL', 'Has³o musi zawieraæ co najmniej 6 znaków!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PROCERROR', 'PL', 'Wyst±pi³ b³±d podczas przetwarzania danych formularza. Proszê sprawdziæ pola zaznaczone na niebiesko i przeczytaæ dodatkowe informacje.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SAVEERROR', 'PL', 'Wyst±pi³ b³±d podczas zapisywania danych do bazy danych. Proszê sprawdziæ czy baza danych jest pod³±czona lub zadzwoniæ do administratora.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SAVESUCCESS', 'PL', 'Dane zosta³y poprawnie zapisane do bazy danych.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DELETESUCCESS', 'PL', 'Dane wypisane poni¿ej zosta³y poprawnie usuniête z bazy danych. Zosta³y ca³kowicie usuniête!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECTONE', 'PL', 'Tutaj nale¿y dokonaæ wyboru!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATENEW', 'PL', 'Nowy cz³onek tego szablonu zosta³ utworzony zobacz dane wypisane poni¿ej.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PROMPTDELETE', 'PL', 'Czy na pewno chcesz usun±æ ten zestaw danych? Ta akcja nie mo¿e zostaæ cofniêta!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RESET', 'PL', 'Wyczy¶æ formularz', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BACK', 'PL', 'Wstecz', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATE', 'PL', 'Utwórz element', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ERROR', 'PL', 'Wyst±pi³ b³±d podczas operacji wykonywania wyboru!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE', 'PL', 'Usuniêcie bazy danych', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_MES', 'PL', 'Proszê wybraæ czêsci bazy danych, które zamierzasz usun±æ.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_VAR', 'PL', 'Usuniêcie odmian', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_CONTENT', 'PL', 'Usuniêcie zawarto¶ci', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VAR_SUCCEEDED', 'PL', ' powiod³o siê!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_FOLDER', 'PL', 'Usuniêcie folderu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_CLUSTER', 'PL', 'Usuniêcie klastra', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_META', 'PL', 'Usuniêcie Meta', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_CLT', 'PL', 'Usuniêcie szablonów klastra', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_PAGES', 'PL', 'Usuniêcie stron serwisu i wzorców', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_EXPIRED', 'PL', 'Usuniêcie stron przedawnionych', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_COMPGRP', 'DE', 'Verbund-Gruppen sind Gruppen von Clustern. Cluster-Vorlagen können ein eigenes Layout besitzen. Dies ermöglicht Ihnen, Ihre Homepage aus Blöcken zusammenzusezten, z.B. News, Umfrage, Bildergalerie - alles auf einer Seite und bei Bedarf.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_CLUSTERTEMPLATES', 'DE', 'Keine Klassen.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_CLT', 'DE', 'Cluster-Vorlagen erlauben Ihnen, die Struktur für Ihre Site festzulegen und den Typ von Inhalten zu bestimmen. Anschließend werden Cluster-Vorlagen mit Seiten-Vorlagen verschmolzen, welche die Inhalte in der Web-Seite darstellen.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_SELECTTHUMB', 'DE', 'Vorschaubild auswählen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TT_REFRESH', 'DE', 'Instanzen erneuern aktualisiert zwischengespeicherte Seiten mit den geänderten Werten.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_PAGETEMP', 'DE', 'In Tabellenkalkulations- und Datenbank-Anwendungen ist eine Vorlage ein leeres Formular, das zeigt, welche Felder an welcher Position und in welcher Länge existieren. In N/X sind Vorlage die Grundlage für jede Ausgabe. Eine Vorlage ist ein Formular, in dem alle Zellen definiert wurden, jedoch noch keine Inhalte hinterlegt wurden.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATED', 'DE', 'Erstellt', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDITED', 'DE', 'Bearbeitet', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('IN_CHANNEL', 'DE', 'in Kanal', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AUTHOR', 'DE', 'Autor', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_ARTICLE', 'DE', 'Artikel auswählen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CH_CAT', 'DE', 'Kategorien bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CH_ADMIN', 'DE', 'Kanal-Administration', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ARTICLES', 'DE', 'Artikel', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHANNEL_SELECT', 'DE', 'Kanal auswählen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_OBJBROWSE', 'DE', 'Die Inhalts-Bibliothek enthält alle Inhalte der Site.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_SP', 'DE', 'Die Sitemap dient zum Bearbeiten von Seiten-Struktur und Seiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MH_GETSTART', 'DE', 'Erste Schritte', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_HELP', 'DE', 'Hilfe', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_CHANNELS', 'DE', 'Kanäle', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_EXPORT_WZ', 'DE', 'Export-Assistent', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_IMPORT_WZ', 'DE', 'Import-Assistent', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SYNC_CLUSTERS', 'DE', 'Objekte synchronisieren', '');
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
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WEEKDAY_AS', 'DE', 'Wochentage-Analyse', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VIS_FIRST', 'DE', 'Erstmalige Besucher', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VIS_ONL', 'DE', 'Besucher online', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VIS_PER_VIS', 'DE', 'Durchschnittliche Besuche je Besucher', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VIS_RET', 'DE', 'Wiederkehrende Besucher', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WEBSITE', 'DE', 'Website', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VISITS_OVERVIEW', 'DE', 'Besucher-Übersicht', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VISITS', 'DE', 'Besuche', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VISITORS', 'DE', 'Besucher', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_PERMISSION', 'DE', 'Benutzerrechte bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_JS', 'DE', 'Javascript verwenden', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_GENERAL', 'DE', 'Allgemeine Benutzerdaten bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_BL', 'DE', 'Backoffice-Sprache', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USAGE', 'DE', 'Verwendung', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USERPERM_HEAD', 'DE', 'Benutzer-Rechte berabeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TRANSLATION', 'DE', 'N/X Übersetzungs-System', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOTAL', 'DE', 'Gesamt', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_SKW', 'DE', 'Top Such-Schlüsselworte', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_SI', 'DE', 'Top Suchmaschinen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_REFERER', 'DE', 'Top Referer', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_PATHS', 'DE', 'Top Pfade', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_OS', 'DE', 'Top Betriebssysteme', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_EXITT', 'DE', 'Top Ausgangs-Ziele', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_HOSTS', 'DE', 'Top Hosts', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_BROWSER', 'DE', 'Top Browser', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TMPL_NAME', 'DE', 'Vorlage auswählen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TODAY', 'DE', 'Heute', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP', 'DE', 'Daten einschränken', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TIPP_TEMPLATE_1', 'DE', 'Vorlagen sind die Basis jeder Ausgabe von N/X. Sie müssen zunächst eine Klasse  erstellen, die die Struktur und die Art der Inhalte definiert. Anschließend können Sie die Seiten-Vorlage erstellen, indem Sie eine Klasse mit einer PHP-Datei verbinden.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TIME_BETW_VISITS', 'DE', 'Durchschnittliche Zeit zwischen Besuchen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('THISYEAR', 'DE', 'Dieses Jahr', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('THISWEEK', 'DE', 'Dieses Woche', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('THISMONTH', 'DE', 'Dieser Monat', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TF', 'DE', 'Zeitrahmen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TESTS', 'DE', 'N/X Unit-Tests', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TEMPLATE', 'DE', 'Vorlage', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STNAME', 'DE', 'Wählen Sie einen Namen, um die Seite in der Sitemap zu identifizieren', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STATS_HEADER', 'DE', 'N/X 5.0 Statistiken', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STATS', 'DE', 'Statistiken', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('START_BAK', 'DE', 'Datensicherung starten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_RLTREE', 'DE', 'Baum erneut veröffentlichen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUDIRECTTITLE', 'DE', 'Optionale URL auf dem Server für direkten Zugriff angeben', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUDIRECT', 'DE', 'Seiten-URL auf Live-Server', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUDIRECTTIT', 'DE', 'Optionale URL auf dem Server für direkten Zugriff angeben', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_THUMBNAIL', 'DE', 'Vorschaubild', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_RLAUNCH', 'DE', 'Seiten erneut veröffentlichen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SMA_EXT_EDIT', 'DE', 'Bearbeitungs-Fenster öffnen. Alle inline bearbeiteten Texte vorher speichern !', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SHORTEST_PATHS', 'DE', 'Kürzeste Pfade', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SET', 'DE', 'Setzen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_MEM', 'DE', 'Gewählte Mitglieder', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELMULTIPLE', 'DE', 'Halten Sie die STRG-Taste gedrückt, um mehrere Elemente auszuwählen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECT', 'DE', 'Auswählen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCH_CLEAR', 'DE', 'Filter löschen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SAVE_BACK', 'DE', 'Speichern und Zurück', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SAVE', 'DE', 'Speichern', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RL_PERM', 'DE', 'Rollen-Berechtigungen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RET_VIS', 'DE', 'Wiederkehrende Besucher', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RESET_FORM', 'DE', 'Reset', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('REMAIN_POS', 'DE', 'Position beibehalten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('REFERER', 'DE', 'Referer', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RB_CACHE', 'DE', 'Zwischenspeichern neu aufbauen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RATERES', 'DE', 'Ergebnisse bewerten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RANK', 'DE', 'Rang', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PTEMPL', 'DE', 'Seiten-Vorlagen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PROPERTIES', 'DE', 'Eigenschaften', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PRINT', 'DE', 'Drucken', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PREDEF_TIME', 'DE', 'Vordefinierter Zeitrahmen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('POS_IN_MENU', 'DE', 'Position in Ast', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PI_OVERVIEW', 'DE', 'Page Impressions Übersicht', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PI', 'DE', 'Page Impressions', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PGNTXT_SMA', 'DE', 'Alle bearbeiteten Texte auf der Seite speichern', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PERCENT', 'DE', 'Prozent', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PATHS', 'DE', 'Click-Pfade', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PAGE', 'DE', 'Seite', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PAGES', 'DE', 'Seiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PATH', 'DE', 'Pfad', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('OVERVIEW', 'DE', 'Übersicht', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('OTHERS', 'DE', 'Andere', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ORDERCOMP', 'DE', 'Sortierung von Layout-Klassen-Gruppen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ORDER', 'DE', 'nach Position', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('OK', 'DE', 'OK', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NUMBER_OF_INSTANCES', 'DE', 'Bitte geben Sie an, wie viele Slots Sie erzeugen möchten.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_CONTENTS', 'DE', 'In diesem Ordner existieren keine Inhalte', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_CLUSTER_SELECTED', 'DE', 'Kein Objekt ausgewählt', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEW_FOLDER', 'DE', 'Ordner erstellen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEW_CONTENT', 'DE', 'Neuer Inhalt', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_WWW', 'DE', 'Website', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_TEMP', 'DE', 'Vorlagen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_TRANSLATION', 'DE', 'Übersetzung', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_ROLLOUT', 'DE', 'Website kopieren', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_REPORT', 'DE', 'Statistiken', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_PTEMP', 'DE', 'Seiten Vorlagen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_MAINTENANCE', 'DE', 'Wartung', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_LIB', 'DE', 'Bibliothek', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_CREATEINSMES', 'DE', 'Es stehen noch freie Platzhalter zur Verfügung. Wenn Sie eine neue Instanz erzeugen möchten, geben Sie den Titel in das untenstehende Textfeld ein und klicken Sie auf die Erzeugen.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_CREATEINSTANC', 'DE', 'Neues Objekt erzeugen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_EDIT', 'DE', 'Objekt bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_DELMES', 'DE', 'Möchen Sie dieses Objekt wirklich löschen? Sämtlicher Inhalte geht hiermit verloren!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_DEL', 'DE', 'Objekt löschen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_PROPERTIES', 'DE', 'Objekt-Eigenschaften', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_NEW', 'DE', 'Neues Objekt', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_BROWSE', 'DE', 'Objekte', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_PATH', 'DE', 'Dateipfad/Name', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_CLUSTER', 'DE', 'Klasse', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_TYPE', 'DE', 'Seiten-Typ', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_VARIATIONS', 'DE', 'Verfügbare Sprachen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_META', 'DE', 'META-Vorlage', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_EDIT', 'DE', 'Vorlage bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM', 'DE', 'Seiten-Vorlage', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACTIVE', 'DE', 'Seite im Menü zeigen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOSPTITLE', 'DE', 'Sie müssen einen Menünamen definieren, bevor Sie die Seite launchen können!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_EXPIRE', 'DE', 'Seite zurückziehen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_LAUNCH', 'DE', 'Veröffentlichen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_PREVIEW', 'DE', 'Vorschau', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_LAUNCHDATES', 'DE', 'Zeitgesteuertes Veröffentlichen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_EXPIREDATE', 'DE', 'Zurückziehen am', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_LAUNCHDATE', 'DE', 'Veröffentlichen ab', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUHELP', 'DE', 'Hilfetext für das Menü', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUNAME', 'DE', 'Name im Menü', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUPROPS', 'DE', 'Menü-Name', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_EDIT', 'DE', 'Seite bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_CLNEW', 'DE', 'Neues Objekt', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_LINK', 'DE', 'Link zu Objekt', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_CONFDESC', 'DE', 'Sie können diese Seite mit einem Objekt verlinken oder ein neues Objekt für die Seite erzeugen.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_CONFIGURE', 'DE', 'Seite konfigurieren', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_PDELETE', 'DE', 'Seite löschen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_PDELMES', 'DE', 'Sie sind im Begriff eine Seite zu löschen. Bitte beachten Sie, dass auch die veröffentliichte Seite gelöscht wird!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_DELETE', 'DE', 'Seite löschen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_DELMES', 'DE', 'Sie sind im Begriff eine Seite zu löschen. Bitte beachten Sie, dass auch die veröffentliichte Seite gelöscht wird!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_PROPERTIES', 'DE', 'Eigenschaften', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_IPROPERTIES', 'DE', 'Seiteneinstellungen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_NEWINSTANCE', 'DE', 'Neue Seite', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_NEWPAGE', 'DE', 'Neue Seite', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_BROWSE', 'DE', 'Website', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_EDIT', 'DE', 'Portalseite bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_MYPORTAL', 'DE', 'Meine Portale', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_CRSUCCEEDED', 'DE', 'Neues Portal erfolgreich erstellt!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_OWNER', 'DE', 'Seiten-Besitzer', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_BROWSER', 'DE', 'Portal-Browser', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_COMBOBJ', 'DE', 'kombinierte Inhalte (Objekte)', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_CLUSTERS', 'DE', 'Objekte', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_CLT', 'DE', 'Klassen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_BACKUP', 'DE', 'Datensicherung', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_ADMIN', 'DE', 'Verwaltung', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_ACCESS', 'DE', 'Benutzerverwaltung', '');
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
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MENU', 'DE', 'Menü', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MEDIAN', 'DE', 'Median', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MAXIMUMAT', 'DE', 'Maximum bei', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MAXIMUM', 'DE', 'Maximum', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LONGEST_PATHS', 'DE', 'Längste Pfade', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOGS', 'DE', 'Log-Datei Analyse', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOGGED_AS', 'DE', 'Eingeloggt als', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOCK_MENU', 'DE', 'Kinderseiten verbieten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOCATION', 'DE', 'Verweisziel, falls extern', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LIVE_AUTHORING', 'DE', 'WYSIWYG-Editor', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LIBRARY', 'DE', 'Inhalts-Bibliothek', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LAUNCH', 'DE', 'Veröffentlichen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXP_TREE', 'EN', 'Unpublish Tree', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LASTYEAR', 'DE', 'Letztes Jahr', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LASTWEEK', 'DE', 'Letzte Woche', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LASTMONTH', 'DE', 'Letzter Monat', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('I_AFTER', 'DE', 'Einfügen nach', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('IS_COMPOUND', 'DE', 'Layout-Klasse', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('IS_FILTERED', 'DE', 'Hinweis: Möglicherweise werden nicht alle Datensätze angezeigt, weil ein Filter verwendet wird.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('INSTANCE_CREATED', 'DE', 'Eine neue Instanz des Elements wurde erzeugt.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('INSNAME', 'DE', '<Objektname>', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('IND_TIME', 'DE', 'Individuelles Intervall', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HOURS_AS', 'DE', 'Stunden-Analyse', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HOUR', 'DE', 'Stunden', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP', 'DE', 'Hilfe', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GO', 'DE', 'GO', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_DESCRIPTION', 'DE', 'Beschreibung', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FOLDER_DELMES', 'DE', 'Möchen Sie diesen Ordner wirklich löschen ?', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ENVIRONMENT', 'DE', 'Umgebung', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXPLORE', 'DE', 'Durchsuchen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FILTER_COLUMN', 'DE', '...in', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FILTER_RULE', 'DE', 'Suche nach...', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_CPGROUPGENERAL', 'DE', 'Allgemeines', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_CPGROUP', 'DE', 'Layout-Klassen-Gruppe bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT_TEMPLATE', 'DE', 'Vorlage bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT_SPM', 'DE', 'Allgemeine Einstellungen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT_ALL', 'DE', 'Alles bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT_CONTENT', 'DE', 'Inhalt bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT_FOLDER', 'DE', 'Ordner bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT_ACCESS', 'DE', 'Rechte', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DWEXT_CONTENTFIE', 'DE', 'Inhalts-Feld-Informationen erzeugen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DATE', 'DE', 'Datum', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DEL_FOLDER', 'DE', 'Ordner löschen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DESC', 'DE', 'Beschreibung', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DISPLAY', 'DE', 'Anzeigen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATE_INSTANCES', 'DE', 'Slots erzeugen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CR_CONTENT', 'DE', 'Inhalt für diese Seite erzeugen?', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COUNT', 'DE', 'Anzahl', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CPG_MEMBERS_SELECT', 'DE', 'Mitglieder dieser Layout-Klassen-Gruppe auswählen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CP_GROUP', 'DE', 'Layout-Klassen-Gruppe', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COLOR', 'DE', 'Farbe', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COMB_ALL', 'DE', 'Alles auswählen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COMB_NONE', 'DE', 'Auswahl löschen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COMMENT', 'DE', 'Kommentar', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTENT', 'DE', 'Inhalte', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTENT_DESC', 'DE', 'Beschreibung', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_NAME', 'DE', 'Objektname', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CAL_NAME', 'DE', 'Name', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CATEGORY', 'DE', 'Kategorie', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CAT_NAME', 'DE', 'Kategorie', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLEAR_MEDIA', 'DE', 'Datei aus Datenbank entfernen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLK_PATHS', 'DE', 'Klick-Pfade', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CAL_EDIT', 'DE', 'Termin bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CALENDAR_SELECT', 'DE', 'Kalender auswählen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CALENDARS_EDIT', 'DE', 'Kalender bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CALENDARS_TIPP', 'DE', 'Sie können hier verschiedene Kalender erstellen. Jeder Kalender hat seine eigenen Termine und Ereignisse.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CALENDARS_DEFINE', 'DE', 'Kalender erstellen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CALENDAR', 'DE', 'Kalender', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CALENDARS', 'DE', 'Kalender', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CALENDARS_CAT_DEFINE', 'DE', 'Kategorien bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CACHED', 'DE', 'Seite cachen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BEGIN', 'DE', 'Start', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BAK_FILE', 'DE', 'Sicherungs-Datei', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BACKUP', 'DE', 'Sicherung', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BACK_INFO', 'DE', 'Die untenstehende Liste zeigt die auf Ihrem Server verfügbaren Sicherungen an. Sie können hier einzelne Sicherungen löschen. Um eine Sicherung zurück zu spielen, müssen Sie sich manuell auf Ihrem Server einloggen und die Dateien wiederherstellen.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AVG_VIS_LENGTH', 'DE', 'Durchschnittliche Besuchsdauer (Sekunden)', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AVG_VISIT_LENGTH', 'DE', 'Durchschnittliche Besuchsdauer (Klicks)', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AVG_CLICKSTREAM', 'DE', 'Durchschnittlicher Klick-Pfad', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AVAIL_VARIATIONS', 'DE', 'Verfügbare Sprachen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AVERAGE', 'DE', 'Durchschnitt', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_PARENT', 'DE', 'Rechte geerbt von', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_ROLE', 'DE', 'Rollen zu Gruppe zuordnen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_TITLE', 'DE', 'Setze Berechtigungen für', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AFTER', 'DE', 'Nach:', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ALC_OWNER', 'DE', 'Eigentümer bestimmen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AVAIL_ITEMS', 'DE', 'Verfügbare Elemente', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_INHERIT_NOTE', 'DE', 'Hinweis: Wenn dieses Feld markiert ist, ist keine andere Konfiguration verfügbar!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_OWNER', 'DE', 'Eigentümer', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_GROUPS', 'DE', 'Gruppe auswählen und hinzufügen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_GROUPSROLES', 'DE', 'Fremdzugriff', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_INFO', 'DE', 'Zugriffsrechte vom Elternobjekt erben', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_INHERIT', 'DE', 'Berechtigungen vom Elternobjekt erben', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_EXPIRED', 'DE', 'Zurückgezogene Seiten bereinigen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_ACCESS', 'DE', 'Rechte in Gruppen berabeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_GROUPEDIT', 'DE', 'Gruppe für Rollen-Bearbeitung auswählen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_META', 'DE', 'Meta bereinigen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_CLT', 'DE', 'Klassen bereinigen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_PAGES', 'DE', 'Seiten und Vorlangen bereinigen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_FOLDER', 'DE', 'Ordner bereinigen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_CLUSTER', 'DE', 'Objekte bereinigen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VAR_SUCCEEDED', 'DE', 'war erfolgreich.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_VAR', 'DE', 'Sprachen bereinigen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_CONTENT', 'DE', 'Inhalte bereinigen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ERROR', 'DE', 'Während der Ausführung der gewählten Operation ist ein Fehler aufgetreten!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE', 'DE', 'Datenbank bereinigen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_MES', 'DE', 'Bitte wählen Sie die Teile der Datenbank, die Sie bereinigen möchten.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RESET', 'DE', 'Reset', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BACK', 'DE', 'Zurück', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATE', 'DE', 'Element erstellen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCH_LIVE_ACRTICLES', 'DE', 'Veröffentlichte Artikel', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEASRCH_MISSING_VARIATIONS', 'DE', 'Fehlende Übersetzungen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_CH', 'DE', 'Kanal auswählen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_CLUSTER', 'DE', 'Objekt auswählen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_EVENT', 'DE', 'Ereignis oder Termin speichern', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_PTML', 'DE', 'Seiten-Vorlage auswählen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_VAR', 'DE', 'Sprache auswählen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SHOW', 'DE', 'anzeigen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SHOW_ADVANCED_SEARCH', 'DE', 'Erweiterte Suchoptionen anzeigen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SHOW_ALL', 'DE', 'Alles anzeigen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SHOW_PAGEWISE', 'DE', 'seitenweise', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STARTDATE', 'DE', 'Startdatum', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STARTTIME', 'DE', 'Startzeit', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SYNC_CLUSTERS_DESCR', 'DE', 'Wenn Sie eine Klasse ändern, werden die Objekte nicht automatisch synchronisiert. Sie werden synchronisiert, wenn Sie das nächste mal mit ihnen arbeiten. Hier können Sie alle manuell synchronisieren.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_ENTRYPAGES', 'DE', 'Top Eingangsseiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_EXITPAGES', 'DE', 'Top Ausgangsseiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_PAGES', 'DE', 'Top Seiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TRANS_TEMPL', 'DE', 'Übersetzen von', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TRANS_THIS', 'DE', 'Übersetzen Sie:', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('UPL_TEXT', 'DE', 'Text-Datei hochladen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_ARTICLEIMPORT_SRCTYPE', 'DE', 'Bitte geben Sie den Quellen-Typ an, aus dem Sie die Artikel importieren möchten.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_ARTICLEIMPORT_TARGET', 'DE', 'Bitte wählen Sie rechts den Ziel-Kanal aus. Alle importierten Artikel werden in diesem Kanal gespeichert.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_ARTICLEIMPORT_SRCTYPE', 'DE', 'Quellen-Typ auswählen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_ARTICLEIMPORT_TARGET', 'DE', 'Ziel-Kanal auswählen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_KEEPCLUSTER', 'DE', 'Bestehende Objekte beibehalten?', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_KEEPCLUSTER_EXPL', 'DE', 'Sie können festlegen, ob Sie die bestehenden Objekte beibehalten möchten oder lieber Kopien von jedem Cluster anlegen wollen.<br><br>Beachten Sie: Wenn Sie die bestehenden Objekte beibehalten, teilen Sie sie sich mit der ursprünglichen Quelle.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZ_ARTICLEIMPORT', 'DE', 'Artikel-Import Assistent', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZ_ARTICLEIMPORT_TITLE', 'DE', 'Der Assistent hilft Ihnen, Artikel  aus unterschiedlichen Quellen in einen Kanal zu laden.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_JS', 'EN', 'Use Javascript', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_BL', 'EN', 'Backend Language', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_BROWSER', 'EN', 'Portal Browser', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_OWNER', 'EN', 'Page Owner', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_CRSUCCEEDED', 'EN', 'The creation of a new portal page succeeded!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_MYPORTAL', 'EN', 'My Portals', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_EDIT', 'EN', 'Edit Portalpage', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_BROWSE', 'EN', 'Browse Website', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_NEWPAGE', 'EN', 'Add Page', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_NEWINSTANCE', 'EN', 'Add Page', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_IPROPERTIES', 'EN', 'Page Properties', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_PROPERTIES', 'EN', 'Properties', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_DELMES', 'EN', 'You are about to delete a sitepage. Please note, that also already published pages will be deleted', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_DELETE', 'EN', 'Delete Page', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_PDELMES', 'EN', 'You are about to delete a page. Please note, that also the published page will be deleted!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_PDELETE', 'EN', 'Delete Page', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_CONFIGURE', 'EN', 'Configure Page', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_CONFDESC', 'EN', 'You can link this sitepage with an object or you can create a new object.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_LINK', 'EN', 'Link to object', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_CLNEW', 'EN', 'New Object', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_EDIT', 'EN', 'Edit Page', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUPROPS', 'EN', 'Page Menu', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUNAME', 'EN', 'Menu Title', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUHELP', 'EN', 'Helptext for Menu', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_LAUNCHDATE', 'EN', 'Publish Date', 'Note: the page must be manually published in order to be published on a defined date!');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_EXPIREDATE', 'EN', 'Unpublish Date', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_LAUNCHDATES', 'EN', 'Automatic Publishing', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_PREVIEW', 'EN', 'Preview', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_LAUNCH', 'EN', 'Publish', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_EXPIRE', 'EN', 'Unpublish Page', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOSPTITLE', 'EN', 'You have to define the menu title before you can launch the page!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACTIVE', 'EN', 'Show Page in Menu', 'When you uncheck this box, the page will no longer be displayed in the menu of the website.');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM', 'EN', 'Page Template', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_EDIT', 'EN', 'Edit Template', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_META', 'EN', 'META-Data Template', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_VARIATIONS', 'EN', 'Displayable Languages', 'Select the langauges, this template is valid for.');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_TYPE', 'EN', 'Page Type', 'Please select always singlepage. Multipage is mature and is there for compatiblity reasons only. Use channels instead.');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_CLUSTER', 'EN', 'Class', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_PATH', 'EN', 'Template Path', 'Filename of the php-file which will be called when you use the page. The file will be created in wwwdev and copied to www after launch.');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_BROWSE', 'EN', 'Browse Objects', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_NEW', 'EN', 'Create Object', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_PROPERTIES', 'EN', 'Object Properties', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_DEL', 'EN', 'Delete Instance', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_DELMES', 'EN', 'Do you really want to delete this instance of the object. All content data will be lost!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_EDIT', 'EN', 'Edit Object', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_CREATEINSTANC', 'EN', 'Create new Instance', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_CREATEINSMES', 'EN', 'There are still slots left for creating additional instances of this content-field. If you want to create another instance, then enter a title in the textfield below and press the Create button.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_NOTITLE', 'EN', 'No title defined yet', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TITLE', 'EN', 'Title', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_EDIT', 'EN', 'Edit Object member', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_DELETE', 'EN', 'Delete Object member', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_DELETEMES', 'EN', 'Do you really want to delete this object?', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_DELETED', 'EN', 'The object was successfully deleted.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_NOTDELETED', 'EN', 'This object cannot be deleted!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI', 'EN', 'Object:', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SR_SELECTCI', 'EN', 'You can search for any content-items here. If you want to select a content-item, then choose it and press the Update button! If you want to connect new content with this field, create the content in the Object Browser first.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SR_SELECTCLI', 'EN', 'Please select a class. Afterwards you can select an instance of the template for use.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FOLDER', 'EN', 'Folder', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTENTTYPE', 'EN', 'Content-Type', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTENTITEM', 'EN', 'Content-Item', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCH', 'EN', 'Start Search', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCHIN', 'EN', 'Search for', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCHRESULTS', 'EN', 'Search results, please select', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECTEDOBJECT', 'EN', 'Currently Selected Content-Item', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECTEDINSTANCE', 'EN', 'Selected Object', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_META', 'EN', 'Meta-Data Templates', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_BROWSER', 'EN', 'Object Browser', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_INSTALLPLUGIN', 'EN', 'Plugins', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_ES', 'EN', 'Explore Site', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_SPM', 'EN', 'Page Templates', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_PRTMAN', 'EN', 'Portal Manager', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_MYPRT', 'EN', 'My Portals', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_MYPROFILE', 'EN', 'Settings', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_LOGOUT', 'EN', 'Sign Out', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_CLB', 'EN', 'Browse Objects', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_CLTB', 'EN', 'Class Browser', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_UMAN', 'EN', 'User Mangement', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_VAR', 'EN', 'Languages', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_PURGE', 'EN', 'Clean up Database', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_PGN', 'EN', 'Plugin Administration', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_REPORT', 'EN', 'Statistics', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_NEW', 'EN', 'New Class', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_BROWSE', 'EN', 'Browse Classes', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_NAME', 'EN', 'Class Name', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_PROPERTIES', 'EN', 'Class Properties', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_DELETE', 'EN', 'Delete Class', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_DELMES', 'EN', 'You are about to delete a class. This will cause the loss of all(!) objects that are based on that class. Are you sure, you want to procceed?', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLTI_DELETE', 'EN', 'Do you really want to delete this Item. All instances of this item will be lost also!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_SCHEME', 'EN', 'Edit Class', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_MINCARD', 'EN', 'Instances', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_MAXCARD', 'EN', '-', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LINKED', 'EN', 'Linked to', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_INSTALLDESC', 'EN', 'Please make sure that you copied all neccessary files into the folder, before succeeding. Insert the correct path to the plugin in the Input-field below. The system will then install the  plugin automatically.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_CHOOSE', 'EN', 'Plugin:   /plugin/', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_FILEWRONG', 'EN', 'The filename you entered could not be found on the server!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLASS_WRONG', 'EN', 'The file you specified has no valid class signature!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_INSTALLED', 'EN', 'The Plugin was successfully installed!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_UPGRADED', 'EN', 'The Plug-In was successfully upgraded!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_ERROR', 'EN', 'There was an error while installing the plugin!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_ALREADYINSTAL', 'EN', 'The PlugIn is already installed!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_NEWERINSTALLE', 'EN', 'There is already a newer version of this Plugin installed!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_TITLE', 'EN', 'Plugins', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_INSTALL', 'EN', 'Install Plugin', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_UNINSTALL', 'EN', 'Uninstall PlugIn', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_UNINSTALLMES', 'EN', 'You are about to uninstall a module. Uninstalling a module does not only remove the content-type but also deletes every single object of this type that is stored in the database. The uninstallation will definitely delete all data of this plugin!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_UNINSTALLDELE', 'EN', 'Uninstall Plugin,<br> Delete all correspondig contents.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_NEW', 'EN', 'New Object', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_NAME', 'EN', 'Object Name', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_PROPERTIES', 'EN', 'Object Properties', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_DELMES', 'EN', 'You are about to delete an object. <b>Note that all languages-versions and META-DATA will be lost!</b>', '');
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
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_FOLDERNOTEMPTY', 'EN', 'This folder is not empty. Only empty folders can be deleted in N/X! Please check all Objects and Contents!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_DELFOLDER', 'EN', 'Delete Folder and all contents', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_MOVEOBJECTS', 'EN', 'Move all objects to parent node', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_PARENT', 'EN', 'Parent Folder', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('METATEMPLATES', 'EN', 'Meta-Data Templates', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_PROPERTIES', 'EN', 'Edit Properties', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_SCHEME', 'EN', 'Edit Meta-Template', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_DELETE', 'EN', 'Do you really want to delete this part of the meta-template? All information entered in any META-Input in CMS linked to this part will be deleted. The data is going to be lost forever!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_ADDITIONAL', 'EN', 'Additional META-Data', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_BASE', 'EN', 'Basic META-Data', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_MODULE', 'EN', 'Content-Type specific META-Data', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VARIATIONS', 'EN', 'Available Languages', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('V_NAME', 'EN', 'Name', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('V_SHORT', 'EN', 'Short-Tag', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('V_EDIT', 'EN', 'Edit Languages', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOGIN_FAILED', 'EN', 'The login failed. Please check your username and password.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_HEAD', 'EN', 'User profile', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_LINK', 'EN', 'User profiles', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_NAME', 'EN', 'Username', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FULL_NAME', 'EN', 'Full Name', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PASSWORD', 'EN', 'Password', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_EMAIL', 'EN', 'eMail', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_ACTIVE', 'EN', 'Enable Account', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_FILTERMENU', 'EN', 'User Administration', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_SETPERM', 'EN', 'Set User Permissions below. To remove a user form a group, just revoke all groups from him.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_PERMGRID', 'EN', 'Permission Grid', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_LINK', 'EN', 'Group profiles', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_HEAD', 'EN', 'Group profile', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_NAME', 'EN', 'Group name', 'You can create groups of objcts, e.g. banners, and name these groups.');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_DESCRIPTIO', 'EN', 'Description', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_FILTERMENU', 'EN', 'Group Administration', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_LINK', 'EN', 'Role Profiles', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_HEAD', 'EN', 'Role Profile', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_NAME', 'EN', 'Role Name', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_DESCRIPTION', 'EN', 'Description', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_FILTERMENU', 'EN', 'Role Administration', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_PERMISSIONS', 'EN', 'User Permissions', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('UP_INTRO', 'EN', 'Please select the group and afterwards the roles in the group, you want to add to the user.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_TO_GROUP', 'EN', 'Add user to group', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ERROR_SEL_GROUP', 'EN', 'You must select a group!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ERROR_SEL_ROLE', 'EN', 'You must select at least one role!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_PROFILE', 'EN', 'Personal Settings', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COMMIT', 'EN', 'Commit', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CANCEL', 'EN', 'Cancel', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('YES', 'EN', 'Yes', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO', 'EN', 'No', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEW', 'EN', 'Create New', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NAME', 'EN', 'Name', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DESCRIPTION', 'EN', 'Description', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DOSOMETHING', 'EN', 'Please select the action you want to apply. You can insert new items, edit items, delete items and change the order of items.', '');
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
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACTIVE_VARIATION', 'EN', 'Active Language:', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_VARIATIONS', 'EN', 'There are actually no language-versions of this object defined!<br>Please call a developer for checking the configuration of the selected item!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_CONTENT', 'EN', 'Content', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_META', 'EN', 'META-Data', '');
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
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('UNIQUE', 'EN', 'The value you entered already exsists.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MANDATORY', 'EN', 'This field cannot be empty!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOTNUMBER', 'EN', 'Please enter a valid number!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WRONGDATE', 'EN', 'Wrong date!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PWDNOTMATCH', 'EN', 'The passwords you entered do not match!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PWDTOOSHORT', 'EN', 'The password must have a length of at least 6 chars!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PROCERROR', 'EN', 'An error occured while processing the form. Please check the marked fields and read there for further information.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SAVEERROR', 'EN', 'An error occured while saving the data to the database. Please make sure, the database is connected or call your Administrator.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SAVESUCCESS', 'EN', 'The data was successfully written to the database.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DELETESUCCESS', 'EN', 'The data listed below was successfully deleted from the database.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECTONE', 'EN', 'Please make your choice.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATENEW', 'EN', 'A new member of this template was created. See the data listed below.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PROMPTDELETE', 'EN', 'Do you really want to delete this record?', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RESET', 'EN', 'Reset', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BACK', 'EN', 'Back', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATE', 'EN', 'Create Item', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ERROR', 'EN', 'An error occured while doing the selected operation!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE', 'EN', 'Clean Up Database', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_MES', 'EN', 'Please select the parts of the database, you want to clean up.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_VAR', 'EN', 'Purge Languages', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_CONTENT', 'EN', 'Purge Content', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VAR_SUCCEEDED', 'EN', 'succeeded!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_FOLDER', 'EN', 'Purge Folders', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_CLUSTER', 'EN', 'Purge Objects', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_META', 'EN', 'Purge Meta-Data', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_CLT', 'EN', 'Purge Classes', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_PAGES', 'EN', 'Purge Pages and Templates', '');
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
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_ACCESS', 'EN', 'User Administration', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_MAINTENANCE', 'EN', 'Maintenance', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_WWW', 'EN', 'Website', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_TEMP', 'EN', 'Templates', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_ROLLOUT', 'EN', 'Copy Website', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_LIB', 'EN', 'Content Library', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_COMBOBJ', 'EN', 'Combined Contents (Cluster)', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_CLT', 'EN', 'Classes', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RL_PERM', 'EN', 'Role Permissions', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_TITLE', 'EN', 'Maintenance', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_GENERATE_DTA', 'EN', 'Update DB-Info', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_DW_CONTENTFIE', 'EN', 'Dreamweaver Content-Field-Info', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_GENERATE_DTA_', 'EN', 'Generate database information', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DWEXT_CONTENTFIE', 'EN', 'Generate Content-Field-Information', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_RLAUNCH', 'EN', 'Refresh Pages', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_RLTREE', 'EN', 'Republish Tree', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUDIRECTTIT', 'EN', 'Define optinal URL on server for direct access', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUDIRECT', 'EN', 'URL on Live Server', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TMPL_NAME', 'EN', 'Select a template', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STNAME', 'EN', 'Select a name to identify the page in the sitemap. The name you selected and the menu title can be different!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('POS_IN_MENU', 'EN', 'Position in sitemap', 'Pages are ordered by their position in the tree of the website.');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CR_CONTENT', 'EN', 'Create Content for this page?', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLEAR_MEDIA', 'EN', 'Remove file from database', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DESC', 'EN', 'Description', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOCATION', 'EN', 'Location, if external', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTENT', 'EN', 'Content', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_CLUSTERS', 'EN', 'Objects', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_PTEMP', 'EN', 'Page Templates', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_SPIDER', 'EN', 'Search Indexing', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_DW_CONTENTFIELDINFO', 'EN', 'Dreamweaver Content-Field-Info', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOGS', 'EN', 'Logfile', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TESTS', 'EN', 'N/X Unit Tests', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_ADMIN', 'EN', 'Administration', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_BACKUP', 'EN', 'Backup', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_TRANSLATION', 'EN', 'Backend Translation', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PTEMPL', 'EN', 'Page Template', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUDIRECTTITLE', 'EN', 'Define optional Path on server for direct access.', 'Sometimes you may want to access a page with a name instead of an IP-address, e.g.\r\nwww.news.fi/oulu instead of www.news.fi/www/p100211_v1.html. You enter\r\nthe Path here.');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LIBRARY', 'EN', 'Content Library', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEW_CONTENT', 'EN', 'New Content', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEW_FOLDER', 'EN', 'Create Folder', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT_FOLDER', 'EN', 'Edit Folder', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DEL_FOLDER', 'EN', 'Delete Folder', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT_ACCESS', 'EN', 'Permissions', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USAGE', 'EN', 'Usage', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LAUNCH', 'EN', 'Publish', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AVAIL_VARIATIONS', 'EN', 'Available languages', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_CONTENTS', 'EN', 'No content available in this folder.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT_CONTENT', 'EN', 'Edit Content', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTENT_DESC', 'EN', 'Description of Content', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SAVE_BACK', 'EN', 'Save and Back', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PROPERTIES', 'EN', 'Properties', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RESET_FORM', 'EN', 'Reset', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_CLUSTER_SELECTED', 'EN', 'No object selected.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATE_INSTANCES', 'EN', 'Create slots', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NUMBER_OF_INSTANCES', 'EN', 'Please specify how many slots you want to create', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TIPP_TEMPLATE_1', 'EN', 'Templates are the basis of every output with N/X. <br>You will need to create a class first, which defines the structure and the kind of contents. Afterwards you can create the page-templates here and assign a php-file to a class.<br><br>', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_THUMBNAIL', 'EN', 'Thumbnail', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP', 'EN', 'Help', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXPLORE', 'EN', 'Explore', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FILTER_RULE', 'EN', 'Search for...', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FILTER_COLUMN', 'EN', 'in', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCH_CLEAR', 'EN', 'Reset Filter', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_CPGROUP', 'EN', 'Edit Layout-Class Group', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GROUP_DESCRIPTION', 'EN', 'Description', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACCESS_VIOLATION', 'DE', 'Zugriffsverletzung', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WYSIWYG', 'EN', 'WYSIWYG Editor', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ORDER', 'EN', 'By order', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ORDERCOMP', 'EN', 'Order of Compounds', 'Set the order in which clusters, e.g. banners, appear.');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_CPGROUPGENERAL', 'EN', 'Edit common Data', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CPG_MEMBERS_SELECT', 'EN', 'Select members of this layout-class group', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AVAIL_ITEMS', 'EN', 'Available items', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_MEM', 'EN', 'Selected members', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COMB_ALL', 'EN', 'Select All', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COMB_NONE', 'EN', 'Clear All', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_DW_CONTENT', 'EN', 'Dreamweaver Plugin', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_GENERATE_DTA_MES', 'EN', 'Generate database-information for automatic versioning.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_GENERATE_DTA_SUCCEEDED', 'EN', 'DataTypes were successfully generated and file was written.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('START_BAK', 'EN', 'Start Backup', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BACKUP', 'EN', 'System Backup', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BACK_INFO', 'EN', 'The list below shows you the backups of N/X on your server. You can delete the backups here. To restore a backup,you need to manually log in your server and restore the files yourself.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BAK_FILE', 'EN', 'Backup file', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('IS_COMPOUND', 'EN', 'Layout-Class', 'Enable objects to have its own layout-template by checking this box.');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TEMPLATE', 'EN', 'Template', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('OVERVIEW', 'EN', 'Overview', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VISITORS', 'EN', 'Visitors', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PAGES', 'EN', 'Pages', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WEEKDAY', 'EN', 'Weekdays', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HOUR', 'EN', 'Hours', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('REFERER', 'EN', 'Referer', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ENVIRONMENT', 'EN', 'Environment', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PATHS', 'EN', 'Clickpaths', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STATS_HEADER', 'EN', 'N/X 5.0 Traffic Statistics', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VISITS_OVERVIEW', 'EN', 'Visitors overview', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VISITS', 'EN', 'Visitors', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOTAL', 'EN', 'Total', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AVERAGE', 'EN', 'Average', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MEDIAN', 'EN', 'Median', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MAXIMUM', 'EN', 'Maximum', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MAXIMUMAT', 'EN', 'Maximum at', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MINIMUM', 'EN', 'Minimum', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MINIMUMAT', 'EN', 'Minimum at', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PI_OVERVIEW', 'EN', 'Page Impressions Overview', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PI', 'EN', 'Page Impressions', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TF', 'EN', 'Time Frame', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PREDEF_TIME', 'EN', 'Predefined Interval', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TODAY', 'EN', 'Today', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('YESTERDAY', 'EN', 'Yesterday', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('THISWEEK', 'EN', 'This Week', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LASTWEEK', 'EN', 'Last Week', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('THISMONTH', 'EN', 'This Month', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LASTMONTH', 'EN', 'Last Month', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('THISYEAR', 'EN', 'This Year', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LASTYEAR', 'EN', 'Last Year', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('IND_TIME', 'EN', 'Individual interval', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SET', 'EN', 'Set', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PRINT', 'EN', 'Print', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_TITLE', 'EN', 'Setting permissions for', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_INHERIT', 'EN', 'Inherit permissions from parent', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_INHERIT_NOTE', 'EN', 'Note: When the box is checked, there is no other configuration available!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_INFO', 'EN', 'Inherited Access from parent', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_PARENT', 'EN', 'Permissions inherited from', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_GROUPSROLES', 'EN', 'Foreign Access', 'Declare groups, who you allow to access this object.');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ALC_OWNER', 'EN', 'Set Owner', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_OWNER', 'EN', 'Owner', 'The members of this group have Administrator role on this ressource');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_ACCESS', 'EN', 'Edit permissions in groups on', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_GROUPS', 'EN', 'Select Group to add', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_GROUPEDIT', 'EN', 'Select group to edit roles', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_ROLE', 'EN', 'Select roles for group', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELMULTIPLE', 'EN', 'Hold down the CTRL-Key to select multiple items!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECT', 'EN', 'Select', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CP_GROUP', 'EN', 'Layout-Class Group', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT_TEMPLATE', 'EN', 'Edit Template', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT_SPM', 'EN', 'Edit Template Properties', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('OK', 'EN', 'Ok', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FOLDER_DELMES', 'EN', 'Do you really want to delete this folder?', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RATERES', 'EN', 'Rate Results', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DISPLAY', 'EN', 'Display', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PAGE', 'EN', 'Page', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COMMENT', 'EN', 'Comment', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DATE', 'EN', 'Date', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SMA_EXT_EDIT', 'EN', 'Open edit window. Save all inline edited texts before!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PGNTXT_SMA', 'EN', 'Save all edited texts on the page', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AVG_VISIT_LENGTH', 'EN', 'Average Visit Length (clicks)', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AVG_CLICKSTREAM', 'EN', 'Average Clickstream', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VIS_ONL', 'EN', 'Visitors online', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WHEN', 'EN', 'When', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RET_VIS', 'EN', 'Returning visitors', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VIS_FIRST', 'EN', 'First time visitors', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VIS_RET', 'EN', 'Returning visitors', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TIME_BETW_VISITS', 'EN', 'Average time between visits', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VIS_PER_VIS', 'EN', 'Average visits per visitor', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AVG_VIS_LENGTH', 'EN', 'Average Visit Length (Seconds)', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_BROWSER', 'EN', 'Top Browsers', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RANK', 'EN', 'Rank', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COUNT', 'EN', 'Count', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PERCENT', 'EN', 'Percent', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_OS', 'EN', 'Top Operating Systems', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_HOSTS', 'EN', 'Top Hosts', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP', 'EN', 'Restrict data', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('OTHERS', 'EN', 'Others', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLK_PATHS', 'EN', 'Clickpaths', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_PATHS', 'EN', 'Top Paths', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PATH', 'EN', 'Path', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SHORTEST_PATHS', 'EN', 'Shortest Paths', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LONGEST_PATHS', 'EN', 'Longest Paths', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WEBSITE', 'EN', 'Website', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TRANSLATION', 'EN', 'N/X Translation System', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STATS', 'EN', 'Statistics', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOCK_MENU', 'EN', 'Permit Childpages', 'By permitting childpages, a developer can prevent editors from creating sub pages for a page.');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_PERMISSION', 'EN', 'Edit user permissions', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USERPERM_HEAD', 'EN', 'Edit user permissions', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_GENERAL', 'EN', 'Edit general user data', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('IS_FILTERED', 'EN', 'Note: Because you applied a filter, not all records are displayed.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_REFERER', 'EN', 'Top Referer', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_SI', 'EN', 'Top Search Engines', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_SKW', 'EN', 'Top Search Keywords', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_EXITT', 'EN', 'Top Exit Targets', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HOURS_AS', 'EN', 'Hour Analysis', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WEEKDAY_AS', 'EN', 'Weekday Analysis', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('I_AFTER', 'EN', 'Insert after', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AFTER', 'EN', 'After:', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('REMAIN_POS', 'EN', 'Do not change position', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BEGIN', 'EN', 'Start', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_NAME', 'EN', 'Object Name', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('INSNAME', 'EN', '&lt;Object Name&gt;', '');
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
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_PAGES', 'EN', 'Top Pages', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_ENTRYPAGES', 'EN', 'Top Entry Pages', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_EXITPAGES', 'EN', 'Top Exit Pages', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_EVENT', 'EN', 'Select Event or Appointment', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STARTDATE', 'EN', 'Startdate', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STARTTIME', 'EN', 'Starttime', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ENDATE', 'EN', 'Enddate', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ENDTIME', 'EN', 'Endtime', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CAL_BTO', 'EN', 'Back to Overview', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_PERMISSION', 'EN', 'Edit Role Permissions', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_GENERAL', 'EN', 'Edit Role General', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ADD_LINK', 'EN', 'Add Link', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ADDITIONAL_LINK', 'EN', 'Additional Link', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ADDITIONAL_IMAGE', 'EN', 'Additional Image', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_OBJ', 'EN', 'No content selected.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLEAR', 'EN', 'Clear', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FIND_OBJ', 'EN', 'Find Object', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PREV_AVAIL', 'EN', 'You sucessfully selected a content. A preview will be available after saving.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOT_SPECIFIED', 'EN', 'Any type', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CMPTYPE', 'EN', 'Layout-Class type:', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('INSTANCES_CREATED', 'EN', 'New instances of the item have been created.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONFIRM_DELETE', 'EN', 'Do you really want to remove this item?', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOT_SELECTED', 'EN', 'No item selected yet.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_CONTENT', 'EN', 'No content entered yet.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LEAVE_EMPTY', 'EN', 'Leave empty.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GOTO_CL', 'EN', 'Goto Object', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_EXPIRE', 'EN', 'Unpublish Object', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_LAUNCH', 'EN', 'Publish Object', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('OBJLAUNCH_SUCCESS', 'EN', 'The object was successfully launched.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_CLUSTER', 'EN', 'No contents.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BACK_TO_CV', 'EN', 'Back to object overview', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATED_AT', 'EN', 'Created at', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BY', 'EN', 'by', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LAST_MOD_AT', 'EN', 'Last modified:', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLUSTER_INFORMATION', 'EN', 'Information about this record', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LAST_LAUNCHED_AT', 'EN', 'Last published:', '');
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
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_ARTICLE', 'EN', 'Select an Article', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('IN_CHANNEL', 'EN', 'in channel', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT_ARTICLE', 'EN', 'Edit Article', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BACK_TO_OVERVIEW', 'EN', 'Back to Overview', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATE_ARTICLE', 'EN', 'Create new Article in Channel', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AR_LAUNCH', 'EN', 'Publish Article', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_SELECT', 'EN', 'Select Classes', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT', 'EN', 'Class', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEW_ARTICLE', 'EN', 'New Article', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AR_EXPIRE', 'EN', 'Unpublish Article', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DWEXT_CONTENTFIELDINFO', 'EN', 'Generate Content-Field-Information', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DWEXT_CONTENTFIELDINFO_MES', 'EN', 'generates Content-Field-Information for Dreamweaver MX', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DEL_ARTICLE', 'EN', 'Do you really want to delete this article in all variations?', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('READY_TO_USE', 'EN', 'Ready to use.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_CHANNEL_CAT', 'EN', 'Select a Channel and a Category', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ALL', 'EN', 'All', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ORDERART', 'EN', 'Order of Articles', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NUM_OF_ART', 'EN', 'Number of articles (999 = infinite)', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CH_CAT2', 'EN', 'Channel and Category', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DESTROY_TREE', 'EN', 'Delete Tree', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DESTROY_EXCLUSIVE_CONTENT', 'EN', 'Delete exclusive content', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AUTH_GROUP', 'EN', 'Authentication', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SYNC_CLUSTERS', 'EN', 'Synchronize Objects', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SYNC_CLUSTERS_DESCR', 'EN', 'After you modified a class, the objects are not automatically synched to the new structure. They are synched when you are working with them the next time. With this function you can sync all of them at once.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_EXPORT_WZ', 'EN', 'Export Wizzard', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_IMPORT_WZ', 'EN', 'Import Wizzard', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_HELP', 'EN', 'Help', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MH_GETSTART', 'EN', 'Getting Started', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MH_GLOSSARY', 'EN', 'Glossary', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DELETE_PAGE', 'EN', 'Delete', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TT_REFRESH', 'EN', 'Refresh Instances updates the changes made to a template to cached pages.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TT_RSTCI', 'EN', 'Each page in N/X is linked to an object. By pressing Reset Object you can link a new object to the page.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_SP', 'EN', 'You can edit the site structure and pages here.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_OBJBROWSE', 'EN', 'Content library contains all content material of the site', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_CLB', 'EN', 'Objects are a collection of placeholders, which are either to be filled in by a developer or an editor of a webpage. The structure-definition within N/X is done with classes.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_CHANNEL', 'EN', 'Topic categories defining the contents of articles created by N/X. i.e. News, Persons', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_ROLLOUT', 'EN', 'Copy website is a feature of N/X that enables you to make copies of a section on your web page and re-use it with or without the old content.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXPORT_DATA', 'EN', 'Export Content and Templates Wizzard', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZ_EXPORT_TITLE', 'EN', 'This wizard is used to exchange objects, classes and page-templates between your N/X installation and others. The wizard generates a XML File, which you can store on your local hard drive and exchange with other N/X-Users.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_EXPORT_TYPE', 'EN', 'Select type to export', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_EXPORT_TYPE', 'EN', 'On the right you need to select the type of data you want to export. Content is stored in objects. When you export objects, the classes are automatically exported too. Classes are schemes for creating objects.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLUSTER', 'EN', 'Object', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLUSTER_TEMPLATE', 'EN', 'Class', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PAGE_TEMPLATE', 'EN', 'Page Template', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_SEL_EXP_RES', 'EN', 'Select Ressource for export', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_DESCR', 'EN', 'Add description', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_DESCR_EXPL', 'EN', 'Now you can add a short description to the exported data.<br/><br/> Anyone who will import the data will easier understand the content of the file.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXEC_EXPORT', 'EN', 'Exporting the ressource', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXPL_EXEC_EXPORT', 'EN', 'The system is generating a XML-File for export now.<br/><br/>In a few seconds, a popup will appear. Press Save for storing the Ressource on your harddisk.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXP_REPORT', 'EN', 'Exporting following data', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEXT', 'EN', 'Next', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STEP', 'EN', 'Step', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('IMPORT_DATA', 'EN', 'Import N/X-XML Data', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZ_IMPORT_TITLE', 'EN', 'This wizard is used for importing data to N/X, which has formerly been exported with another N/X installation. Note: You have to delete a resource before you can import it for a second time.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_IMPORT_FILE', 'EN', 'Select N/X-XML File', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_IMPORT_FILE', 'EN', 'Please choose a N/X-XML file from your harddisk for upload into the system.<br/><br/>The system will perform a check and will display status information on the next page.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_IMPORT_VAL', 'EN', 'Summary of uploaded XML', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_IMPORT_VAL', 'EN', 'The system has checked the correctness of the uploaded XML file. Read the report on the left for details.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_IMPORTING', 'EN', 'Importing data', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_IMPORTING', 'EN', 'The system has tried to import the data. Check the status on the right.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_FILE', 'EN', 'Select a file', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_PAGETEMP', 'EN', 'In spreadsheet and database applications, a template is a blank form that shows which fields exist, their locations, and their length. In N/X, templates are the basis of every output. A template is a form in which all the cells have been defined but no data has yet been entered.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_CLT', 'EN', 'Cluster template is a form that enables you to create structure for your site and define the type of contents. Afterwards, cluster template is merged with a page-template that includes the content of the web page.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_METATEMP', 'EN', 'A meta template is used for defining which metadata fields need to go on a new page. When you create a new metadata field in the template, each new page based on that template will contain that field.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_COMPGRP', 'EN', 'Layout-Class group is a group of objects.  This feature enables you to build your homepage out of blocks, e.g. News-Article, Poll, Image-Gallery all on one page and on demand.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_PURGE', 'EN', 'Deletes unnecessary information from the database.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_DW', 'EN', 'Creates a configuration-file for N/X Dreamweaver Plug-in. With the help of the Plug-in, templates can be developed with Dreamweaver.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_SYNCCL', 'EN', 'A feature used for synchronizing objects after having modified/changed a class.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_SYNC_CL', 'EN', 'Synchronize Clusters', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_PGN', 'EN', 'Plugins allow you to enhance N/X beyond its standard features. Typically, plugins are used to create new content types in addition to the two standard content types text and image.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_BACKUP', 'EN', 'The list below shows you the backups of N/X on your server. You can delete the backups here. To restore a backup ,you need to manually log in to your server and restore the files yourself.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_VARIATION', 'EN', 'Content may have different languages. You define the languages you can use in N/X here.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_ACCESS', 'EN', 'A feature used for creating and managing user profiles within N/X.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SHOW_PAGEWISE', 'EN', 'show pagewise', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SHOW_ALL', 'EN', 'show all', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NODE_ACCESS', 'EN', 'Set access to the website', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_SELECTTHUMB', 'EN', 'Select Thumbnail', 'Select a graphic which will be displayed if an editor creates a new page. You can upload your own icon-graphics to the folder cms/modules/sitepages/thumbnails.');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_PROPERTIES', 'EN', 'Edit Properties', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_CLT', 'EN', 'Edit Class', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXPL_SEL_CLUSTER', 'EN', 'After selecting a class, a list with objects will appear, where you can select one.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_PTML', 'EN', 'Select Page-Template', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXPL_SEL_SPM', 'EN', 'Please select a page-template.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHANNEL_IMPORTARTICLES', 'EN', 'Import articles', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZ_ARTICLEIMPORT', 'EN', 'Article-Import Wizard', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZ_ARTICLEIMPORT_TITLE', 'EN', 'This wizard is used to import article data to a channel from different sources. You can import from existing Multipages or other channels. You have to make sure that the corresponding templates are compatible.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_ARTICLEIMPORT_TARGET', 'EN', 'Select target channel', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_ARTICLEIMPORT_TARGET', 'EN', 'On the right you need to select the target channel. All imported articles will be stored within this channel.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_CH', 'EN', 'Select a Channel', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXPL_SEL_CH', 'EN', 'Please select a channel.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_ARTICLEIMPORT_SRCTYPE', 'EN', 'Select source type', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_ARTICLEIMPORT_SRCTYPE', 'EN', 'Please select the type of source you want to import the articles from.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MULTIPAGE', 'EN', 'Multipage', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COPY_CLUSTER', 'EN', 'Copy objects', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('KEEP_CLUSTER', 'EN', 'Keep original object', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ARTICLE_IS_EXPIRED', 'EN', 'Article is unpublished', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ARTICLE_IS_LIVE', 'EN', 'Article is published', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DISABLE', 'EN', 'Disable', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TRANS_TEMPL', 'EN', 'Translate from', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TRANS_THIS', 'EN', 'Translate this:', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_VAR', 'EN', 'Select Language', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ARTICLE_VARIATION_MISSING', 'EN', 'The language-version of this article does not exist yet.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SHOW_ADVANCED_SEARCH', 'EN', 'Display advanced search options', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCH_LIVE_ACRTICLES', 'EN', 'Published articles', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SHOW', 'EN', 'show', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HIDE', 'EN', 'Hide', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCH_EXPIRED_ARTICLES', 'EN', 'Unpublished articles', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEASRCH_MISSING_VARIATIONS', 'EN', 'Missing translations', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MAINT_MODE', 'EN', 'Offline Mode', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MAINT_BB', 'EN', 'Switch backend into maintenance.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MAINT_WWW', 'EN', 'Switch published website into maintenance.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('UPL_TEXT', 'EN', 'Upload text file', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_KEEPCLUSTER', 'EN', 'Keep existing objects?', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_KEEPCLUSTER_EXPL', 'EN', 'You can specify whether you want to keep the existing objects or to create a copy of each object.<br><br>Keep in mind: if you keep the original objects you will share them with the original source.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_CLUSTER', 'EN', 'Select an Object', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_CLUSTERTEMPLATES', 'EN', 'There are no classes.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RESET_LOGS', 'EN', 'Reset Logs', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOGFILE', 'EN', 'View System Logs', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOGS_INFO', 'EN', 'The list below shows you events that were logged by N/X WCMS.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MESSAGE', 'EN', 'Message', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHANGE', 'EN', 'Change', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AGENT_WELCOME', 'EN', 'Welcome to N/X.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AGENT_GOHOME', 'EN', 'Go home!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AGENT_GOAWAY', 'EN', 'Hide and stay away!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AGENT_NXHOMEPAGE', 'EN', 'Visit N/X Homepage!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AGENT_CALLED', 'EN', 'you asked for me?', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AGENT_LOGOUT', 'EN', 'I hope you enjoyed working with N/X. Have a nice day!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AGENT_EXPLAINHOME', 'EN', 'You can find me by clicking the N/X-Logo in the upper-right corner of your browser.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_AGENT', 'EN', 'Use Agent', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLTPOSITION', 'EN', 'Position', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FONT', 'EN', 'Font Name', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FONTSIZE', 'EN', 'Font Size', '');
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
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_SELECT', 'EN', 'Please select an object to link it with the class.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_HOME', 'EN', 'Home', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_EXCLUSIVE', 'EN', 'Developer Content', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BACK_SP', 'EN', 'Back to Website', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONFIRM_UNSAVED_CHANGES_LINKEDCL', 'EN', 'Note: When changing the linked object, any changes you apply on the currently linked object will be lost. If you want to save these canges, save your work first and change the linked object. Proceed ?', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLLINK', 'EN', 'This slot is linked to', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BACK_SP', 'DE', 'Zurück', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BG_COLOR', 'DE', 'Hintergrundfarbe', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLLINK', 'DE', 'Dieser Platzhalter ist verlinkt mit', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLTPOSITION', 'DE', 'Position', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_EXCLUSIVE', 'DE', 'Inhalt nur für Entwickler sichtbar', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_SELECT', 'DE', 'Bitte wählen Sie ein Objekt, um es mit der Klasse zu verlinken.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONFIRM_UNSAVED_CHANGES_LINKEDCL', 'DE', 'Achtung: Wenn Sie das verlinkte Objekt ändern, gehen alle ungespeicherten Änderungen am aktuellen Objekt verloren. Möchten sie fortfahren?', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FONT', 'DE', 'Schriftname', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FONTSIZE', 'DE', 'Schriftgröße', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GR_TEXT', 'DE', 'Graphischer Text', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HEIGHT', 'DE', 'Höhe', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_LW_SITE', 'EN', 'Launch website', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('INDIV_CONFIG', 'DE', 'Individuelle Konfiguration', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOGFILE', 'DE', 'Systemlogs zeigen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOGS_INFO', 'DE', 'Die Liste enthält alle geloggten Ereignisse.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MESSAGE', 'DE', 'Nachricht', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_HOME', 'DE', 'Home', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NUMBER', 'DE', 'Bitte geben Sie eine Zahl ein!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RESET_LOGS', 'DE', 'Reset', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_LAUCH_SUCCESS', 'DE', 'Die Seiten wurden neu veröffentlicht.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TEXT_ALIGN', 'DE', 'Textausrichtung', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TEXT_COLOR', 'DE', 'Textfarbe', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TEXT_STYLE', 'DE', 'Textformatierung', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WIDTH', 'DE', 'Breite', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_LWS_MESSAGES', 'EN', 'Do you really want to launch the whole website?', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CH_ARTICLE_DATE', 'EN', 'Article Date', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXPIRE', 'EN', 'Unpublish', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CH_ARTICLE_DATE', 'DE', 'Artikeldatum', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXPIRE', 'DE', 'Zurückziehen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BY_ORDER', 'EN', 'By Position', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_LWS_MESSAGES', 'DE', 'Möchten Sie wirklich die gesamte Seite veröffentlichen?', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_LW_SITE', 'DE', 'Ganze Website veröffentlichen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GALNAME', 'EN', 'Gallery Name', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GALDESC', 'EN', 'Gallery Description', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GAFOLDER', 'EN', 'Image-Folder', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GALROWS', 'EN', 'Rows', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GALCOLS', 'EN', 'Columns', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MEDIA_SUPPORTED', 'EN', 'The Media plugin supports the following file-types:<br>Macromedia Flash Films (.swf), Windows Media (.avi), Real Player (.rm), Apple Quicktime (.mov), MP3 over Windows Media (.mp3), PDF (.pdf)', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_DELMES2', 'EN', 'Do you really want to delete this content? It may still be used in some objects.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MISSING_PGN', 'EN', 'Missing Plugin:', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('IMP_ERR', 'EN', 'You cannot import, because of the following errors:', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FILE_ALREADY_UPLOADED', 'EN', 'You have already uploaded a file. You can go on by pressing Next.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GO_IMPORT', 'EN', 'Press Next to import this data now. If the data has already been imported, nothing will be changed.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NUMB_IMPORTED', 'EN', 'Number of imported recordsets:', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PROC_DATA', 'EN', 'Processing Data...', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BAK_TIPP', 'EN', 'You can backup your database and www and wwwdev folder here. Make sure you have setup backup in settings.inc.php!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COPYCLUSTERT', 'EN', 'Create Copy', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATECOPY', 'EN', 'Copy', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COPYCLT', 'EN', 'Copy class', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SOURCE', 'EN', 'Source', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEWNAME', 'EN', 'New Name', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHNLAUNCHED', 'EN', 'The channel was launched successfully.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_LWC', 'EN', 'Launch all articles', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_XML', 'EN', 'The file you uploaded is not XML or your browser does not send the file correct!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHANGE_TEMPLATE', 'EN', 'Active Template', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CCONLAUNCH', 'EN', 'Clear Cache when Publishing', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CCONLAUNCH_LBL', 'EN', 'Dev-Page-IDs (commaseparated)', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLLOUT_SEL', 'EN', 'Source and Destination for Copy', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEW_ROLLOUT', 'EN', 'Start another copy', '');
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
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LAUNCH_TREE', 'EN', 'Publish Tree', '');
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
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOT_FOUND', 'EN', 'There was nothing found.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PNF', 'EN', 'The page with the ID you entered was not found.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MODTYPE', 'EN', 'Plugin Type', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VERSION', 'EN', 'Version', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SOURCEFILE', 'EN', 'Source file', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('UNINSTALL', 'EN', 'Uninstall', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('UNINSTCONF', 'EN', 'Uninstalling a plugin can cause damage to the website! Do you want to proceed?', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_RB_CACHE_MES', 'EN', 'Rebuild Cache of all published pages', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_GROUP', 'EN', 'Object Group', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_ACCESS', 'FR', 'Editer les permissions dans les groupes', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_GROUPEDIT', 'FR', 'Sélectionner le groupe pour éditer les rôles', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_GROUPS', 'FR', 'Sélectionner le groupe à ajouter', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_GROUPSROLES', 'FR', 'Accès étranger', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_INFO', 'FR', 'Accès hérité du parent', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_INHERIT', 'FR', 'Hériter des permissions du parent', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_INHERIT_NOTE', 'FR', 'Note : quand la case est cochée, il n''y a pas d''autre configuration disponible !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_OWNER', 'FR', 'Propriétaire', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_PARENT', 'FR', 'Permissions héritées de', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_ROLE', 'FR', 'Sélectionner les rôles pour le groupe', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACL_TITLE', 'FR', 'Configuration des permissions pour', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACTIVE', 'FR', 'Actif', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACTIVE_VARIATION', 'FR', 'Variation active', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ADD_LINK', 'FR', 'Ajouter un lien', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ADDITIONAL_IMAGE', 'FR', 'Image additionnelle', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ADDITIONAL_LINK', 'FR', 'Lien additionnel', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AFTER', 'FR', 'Après :', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AGENT_CALLED', 'FR', 'Vous m''avez demandé ?', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AGENT_EXPLAINHOME', 'FR', 'Vous pouvez me trouver en cliquant sur le logo N/X, en haut à droite de la fenêtre', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AGENT_GOAWAY', 'FR', 'Cachez-vous et restez éloigné !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AGENT_GOHOME', 'FR', 'Rentrez chez vous !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AGENT_LOGOUT', 'FR', 'J''espère que vous avez bien travaillé avec N/X. Bonne journée !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AGENT_NXHOMEPAGE', 'FR', 'Visitez le site de N/X', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AGENT_WELCOME', 'FR', 'Bienvenue sur N/X', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ALC_OWNER', 'FR', 'Définir le propriétaire', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ALL', 'FR', 'Tous', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AR_EXPIRE', 'FR', 'Expirer l''article', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AR_LAUNCH', 'FR', 'Lancer l''article', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ARTICLE_IS_EXPIRED', 'FR', 'L''article a expiré', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ARTICLE_IS_LIVE', 'FR', 'L''article est en ligne', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ARTICLE_VARIATION_MISSING', 'FR', 'La variation de cet article n''existe pas encore.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ARTICLES', 'FR', 'Articles', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AUTH_GROUP', 'FR', 'Authentification', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AUTHOR', 'FR', 'Auteur', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AVAIL_ITEMS', 'FR', 'Entrées disponibles', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AVAIL_VARIATIONS', 'FR', 'Variations disponibles', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AVERAGE', 'FR', 'Moyenne', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AVG_CLICKSTREAM', 'FR', 'Taux de clics moyen', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AVG_VIS_LENGTH', 'FR', 'Temps moyen de visite (secondes)', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('AVG_VISIT_LENGTH', 'FR', 'Temps moyen de visite', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BACK', 'FR', 'Retour', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BACK_INFO', 'FR', 'La liste ci-dessous montre les sauvegardes de N/X sur votre serveur. Vous pouvez supprimer les sauvegardes ici. Pour restaurer une sauvegarde, vous devez vous connecter manuellement au serveur et restaurer les fichiers.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BACK_TO_CV', 'FR', 'Retour à la vue d''ensemble du cluster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BACK_TO_OVERVIEW', 'FR', 'Retour à la vue d''ensemble', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BACKUP', 'FR', 'Sauvegarde système', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BAK_FILE', 'FR', 'Fichier de sauvegarde', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BAK_TIPP', 'FR', 'Vous pouvez sauvegarder votre base de données et les dossiers de site www et wwwdev ici. Vérifiez que vous avez bien configuré la sauvegarde dans settings.inc.php !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BEGIN', 'FR', 'Démarrer', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BY', 'FR', 'par', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BY_ORDER', 'FR', 'Par ordre', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CACHED', 'FR', 'Page de cache', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CAL_BTO', 'FR', 'Retour à la vue d''ensemble', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CAL_EDIT', 'FR', 'Editer le rendez-vous', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CAL_NAME', 'FR', 'Nom du calendrier', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CALENDAR', 'FR', 'Calendrier', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CALENDAR_SELECT', 'FR', 'Sélectionner un calendrier', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CALENDARS', 'FR', 'Calendriers', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CALENDARS_CAT_DEFINE', 'FR', 'Définir les catégories', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CALENDARS_DEFINE', 'FR', 'Définir les calendriers', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CALENDARS_EDIT', 'FR', 'Editer le calendrier', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CALENDARS_TIPP', 'FR', 'Vous pouvez créer plusieurs calendriers ici. Chaque calendrier aura ses propres événements et dates.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CANCEL', 'FR', 'Annuler', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CAT_NAME', 'FR', 'Catégorie', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CATEGORY', 'FR', 'Catégorie', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CH_ADMIN', 'FR', 'Administration du canal', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CH_ARTICLE_DATE', 'FR', 'Date de l''article', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CH_CAT', 'FR', 'Définir les catégories', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CH_CAT2', 'FR', 'Canal et catégorie', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHANGE_TEMPLATE', 'FR', 'Changer de modèle', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHANNEL', 'FR', 'Canal', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHANNEL_GRABMP', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHANNEL_IMPORTARTICLES', 'FR', 'Importer des articles', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHANNEL_SELECT', 'FR', 'Sélectionner un canal', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHANNELS', 'FR', 'Canaux', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHOOSEFILE', 'FR', 'Choisir un fichier', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_BROWSE', 'FR', 'Voir les clusters', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_CREATEINSMES', 'FR', 'Il reste des emplacements pour créer d''autres instances de ce champ de contenu. Si vous voulez créer une autre instance, entrez un titre dans le champ texte ci-dessous et appuyez sur Créer.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_CREATEINSTANC', 'FR', 'Créer une nouvelle instance', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_DEL', 'FR', 'Supprimer l''instance', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_DELMES', 'FR', 'Voulez-vous vraiment supprimer cette instance de cluster ? Toutes les données seront perdues !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_EDIT', 'FR', 'Modifier l''instance du cluster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_EXPIRE', 'FR', 'Expirer le cluster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_LAUNCH', 'FR', 'Lancer le cluster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_NAME', 'FR', 'Nom du cluster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_NEW', 'FR', 'Nouvelle instance', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_NOTITLE', 'FR', 'Aucun titre défini', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_PROPERTIES', 'FR', 'Propriétés du cluster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_SELECT', 'FR', 'Sélectionnez un cluster pour le lier à un modèle de cluster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLASS_WRONG', 'FR', 'Le fichier spécifié n''a pas de signature de classe valide !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLEAR', 'FR', 'Effacer', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLEAR_MEDIA', 'FR', 'Supprimer le fichier depuis la base de données', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI', 'FR', 'Instance de cluster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_DELETE', 'FR', 'Supprimer le membre de cluster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_DELETED', 'FR', 'L''instance a été supprimée.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_DELETEMES', 'FR', 'Voulez-vous vraiment supprimer cette instance ? Elle sera perdue à jamais !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_EDIT', 'FR', 'Modifier le membre de cluster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLI_NOTDELETED', 'FR', 'Cette instance ne peut pas être supprimée !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLK_PATHS', 'FR', 'Chemins des clics', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT', 'FR', 'Modèle de cluster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_BROWSE', 'FR', 'Voir les modèles de clusters', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_DELETE', 'FR', 'Supprimer le modèle de cluster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_DELMES', 'FR', 'Vous êtes sur le point de supprimer un modèle de cluster. Cela entraînera la perte de toutes les données créées avec ce modèle. Voulez-vous vraiment continuer ?', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_EXCLUSIVE', 'FR', 'Contenu développeur', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_MAXCARD', 'FR', '', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_MINCARD', 'FR', 'Instances', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_NAME', 'FR', 'Nom du modèle de cluster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_NEW', 'FR', 'Nouveau modèle de cluster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_PROPERTIES', 'FR', 'Propriétés du modèle de cluster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_SCHEME', 'FR', 'Modifier le schéma du modèle de cluster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLT_SELECT', 'FR', 'Sélectionner des modèles de clusters', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLTI_DELETE', 'FR', 'Voulez-vous vraiment supprimer cette entrée ? Toutes les instances seront aussi perdues !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLTPOSITION', 'FR', 'Position', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLUSTER', 'FR', 'Cluster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLUSTER_INFORMATION', 'FR', 'Informations de cet enregistrement', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLUSTER_TEMPLATE', 'FR', 'Modèle de cluster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CMPTYPE', 'FR', 'Type de composition', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COLOR', 'FR', 'Couleur', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COMB_ALL', 'FR', 'Tout sélectionner', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COMB_NONE', 'FR', 'Tout effacer', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COMMENT', 'FR', 'Commentaire', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COMMIT', 'FR', 'Proposer', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONFIG', 'FR', 'Configurer', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONFIGURED', 'FR', 'Prêt à l''utilisation', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONFIRM_DELETE', 'FR', 'Voulez-vous vraiment supprimer cette entrée ?', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONFIRM_UNSAVED_CHANGES', 'FR', 'Note : les modifications non enregistrées seront perdues si vous continuez. Si vous avez déjà modifié quelque chose, vous pouvez annuler et enregistrer votre travail. On continue ? ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTAINERNAME', 'FR', 'Modèle', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTENT', 'FR', 'Contenu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTENT_DESC', 'FR', 'Description du contenu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTENTITEM', 'FR', 'Entrée de contenu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTENTTYPE', 'FR', 'Type de contenu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COPY_CLUSTER', 'FR', 'Copier des clusters', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COUNT', 'FR', 'Compteur', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CP_GROUP', 'FR', 'Groupe composé', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CPG_MEMBERS_SELECT', 'FR', 'Sélectionner des membres de ce groupe de composition', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CR_CONTENT', 'FR', 'Créer du contenu pour cette page ?', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATE', 'FR', 'Créer un article', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATE_ARTICLE', 'FR', 'Créer un nouvel article dans le canal', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATE_INSTANCES', 'FR', 'Créer des instances', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATED', 'FR', 'Créé', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATED_AT', 'FR', 'Créé le', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATENEW', 'FR', 'Un nouveau membre de ce modèle a été créé. Voir les données ci-dessous', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DATE', 'FR', 'Date', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DATEFORMAT', 'FR', 'Ce format de date n''est pas correct !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DEL_ARTICLE', 'FR', 'Voulez-vous vraiment supprimer cet article dans toutes ses variations ?', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DEL_FOLDER', 'FR', 'Supprimer le dossier', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DELETE', 'FR', 'Supprimer', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DELETE_PAGE', 'FR', 'Supprimer la page', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DELETESUCCESS', 'FR', 'Les données ci-dessous ont été supprimées de la base de données. Elles sont maintenant perdues !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DESC', 'FR', 'Description', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DESCRIPTION', 'FR', 'Description', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DESTROY_EXCLUSIVE_CONTENT', 'FR', 'Détruire le contenu exclusif', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DESTROY_TREE', 'FR', 'Détruire l''arborescence', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DISABLE', 'FR', 'Désactiver', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DISPLAY', 'FR', 'Afficher', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DOSOMETHING', 'FR', 'Sélectionnez l''action que vous souhaitez. Vous pouvez insérer des entrées, les modifier, les supprimer et changer leur ordre.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DOWN', 'FR', 'Bas', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DWEXT_CONTENTFIE', 'FR', 'Générer les informations du champ de contenu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DWEXT_CONTENTFIELDINFO', 'FR', 'Générer les informations du champ de contenu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DWEXT_CONTENTFIELDINFO_MES', 'FR', 'Générer les informations du champ de contenu pour Dreamweaver MX', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_CLT', 'FR', 'Modifier le modèle de cluster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_CONTENT', 'FR', 'Modifier le contenu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_CPGROUP', 'FR', 'Modifier le groupe de composition', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_CPGROUPGENERAL', 'FR', 'Modifier le groupe général', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_DISPATCHER', 'FR', 'Utilisez ce bouton pour basculer entre la modification des méta-données et la modification du contenu.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_META', 'FR', 'Modifier les méta-données', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ED_PROPERTIES', 'FR', 'Modifier les propriétés', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT', 'FR', 'Modifier', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT_ACCESS', 'FR', 'Définir les accès', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT_ALL', 'FR', 'Modifier tout', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT_ARTICLE', 'FR', 'Modifier l''article', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT_CONTENT', 'FR', 'Modifier le contenu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT_FOLDER', 'FR', 'Modifier le dossier', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT_SPM', 'FR', 'Modifier les propriétés du modèle', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDIT_TEMPLATE', 'FR', 'Modifier le modèle', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EDITED', 'FR', 'Modifié', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EMPTY', 'FR', '<vide>', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ENDATE', 'FR', 'Date de fin', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ENDTIME', 'FR', 'Heure de fin', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ENVIRONMENT', 'FR', 'Environnement', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ERROR', 'FR', 'Une erreur est apparue pendant l''opération sélectionnée !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ERROR_SEL_GROUP', 'FR', 'Vous devez choisir un groupe !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ERROR_SEL_ROLE', 'FR', 'Vous devez choisir au moins un rôle !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXEC_EXPORT', 'FR', 'Exportation de la ressource en cours', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXP_REPORT', 'FR', 'Exportation des données suivantes en cours', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXPIRE', 'FR', 'Expirer', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXPL_EXEC_EXPORT', 'FR', 'Ce système génère actuellement un fichier XML d''exportation.<br/><br/>Dans quelques secondes, une fenêtre apparaîtra. Cliquez sur Enregistrer pour placer la ressource sur votre disque.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXPL_SEL_CH', 'FR', 'Choisissez un canal.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXPL_SEL_CLUSTER', 'FR', 'Après avoir choisi un modèle de cluster, vous pourrez choisir un cluster dans la liste qui apparaîtra.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXPL_SEL_SPM', 'FR', 'Choisissez un modèle de page.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXPLORE', 'FR', 'Explorer', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXPORT_DATA', 'FR', 'Assistant d''exportation du contenu et des modèles', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FILTER_COLUMN', 'FR', '…dans', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FILTER_RULE', 'FR', 'Chercher…', NULL);
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
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_ACCESS', 'FR', 'Un dispositif existe pour créer et gérer des profils d''utilisateur dans N/X.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_ARTICLES', 'EN', 'The form displays articles.<br><br>The color codes are:<li>red: article not published<li>grey: article not translated<li>green: article published', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_BACKUP', 'FR', 'La liste ci-dessous montre les sauvegardes de N/X sur votre serveur. Vous pouvez supprimer les sauvegardes ici. Pour restaurer une sauvegarde, vous devez vous connecter manuellement au serveur et restaurer les fichiers.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_CHANNEL', 'FR', 'Catégories de thèmes définissant le contenu des articles créés par N/X (par exemple, News, Personnes…).', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_CLB', 'FR', 'Un cluster est une collection de champs de contenu dynamiques ou statiques, complétés par un développeur ou un rédacteur de pages Web. La définition de la structure dans N/X est faite avec des clusters de données.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_CLT', 'FR', 'Le modèle de cluster est un formulaire qui vous permet de créer la structure des données pour votre site et de définir le type de contenu. Ensuite, le modèle de cluster est fusionné avec un modèle de page qui gère le contenu de la page Web.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_COMPGRP', 'FR', 'Le groupe de composition est un groupe de clusters. Les modèles de clusters peuvent avoir leur propre disposition. Ceci vous permet de construire votre page Web hors de blocs (par exemple, articles de news, sondage, galerie de photos... le tout sur une page et sur demande).', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_DW', 'FR', 'Crée un dossier de configuration pour l''extension N/X de Dreamweaver. A l''aide de cette extension, des modèles peuvent être développés avec Dreamweaver.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_METATEMP', 'FR', 'Un modèle de méta-donnée est utilisé pour définir quels champs de méta-données seront placés dans une nouvelle page. Quand vous créez un nouveau champ de méta-donnée dans le modèle, chaque nouvelle page basée sur ce modèle contiendra ce champ.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_OBJBROWSE', 'FR', 'La bibliothèque de contenu contient tous les éléments de contenu du site', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_PAGETEMP', 'FR', 'Dans les tableurs et les applications de base de données, un modèle est un formulaire vide qui montre quels champs existent, leur emplacement et leur longueur. Dans N/X, les modèles sont à la base de son fonctionnement. Un modèle est un formulaire dans lequel toutes les cellules ont été définies mais aucune donnée n''a encore été saisie.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_PGN', 'FR', 'Les extensions vous permettent d''étendre les fonctions de N/X. Typiquement, des extensions sont employées pour créer de nouveaux types d''objets, en plus des deux types d''objets standards Text et Image.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_PURGE', 'FR', 'Supprime les informations inutiles de la base de données.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_ROLLOUT', 'FR', 'Rollout est un dispositif de N/X qui permet de créer des copies d''une section de votre page Web et de les réutiliser avec ou sans l''ancien contenu.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_SP', 'FR', 'Le plan du site est utilisé pour modifier la structure et les pages du site.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_SYNCCL', 'FR', 'Dispositif utilisé pour synchroniser les clusters après avoir modifié ou changé un modèle de cluster.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HELP_VARIATION', 'FR', 'Un contenu peut avoir plusieurs variations. Ces variations peuvent être des langues différentes ou des profils de contenu différents.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HIDE', 'FR', 'Cacher', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HOUR', 'FR', 'Heures', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HOURS_AS', 'FR', 'Analyse des heures', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('I_AFTER', 'FR', 'Insérer après', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('IMPORT_DATA', 'FR', 'Importer des données N/X-XML', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('IN_CHANNEL', 'FR', 'dans le canal', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('IND_TIME', 'FR', 'Fuseau horaire individuel', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('INDIV_CONFIG', 'FR', 'Configuration individuelle pour cette entrée', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('INSNAME', 'FR', '<Nom du cluster>', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('INSTANCE_CREATED', 'FR', 'Une nouvelle instance de cette entrée a été créée.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('INSTANCES_CREATED', 'FR', 'De nouvelles instances de cette entrée ont été créées.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('IS_COMPOUND', 'FR', 'Modèle de cluster de composition', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('IS_FILTERED', 'FR', 'Note : vous ne pouvez pas afficher tous les enregistrements parce que vous utilisez un filtre !  ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('KEEP_CLUSTER', 'FR', 'Garder le cluster original', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('KEYWORDS', 'FR', 'Mots-clés', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LAST_LAUNCHED_AT', 'FR', 'Dernier lancement à', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LAST_MOD_AT', 'FR', 'Dernière modification à', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LASTMONTH', 'FR', 'Mois dernier', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LASTWEEK', 'FR', 'Semaine dernière', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LASTYEAR', 'FR', 'Année dernière', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LAUNCH', 'FR', 'Lancement', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LEAVE_EMPTY', 'FR', 'Laisser vide', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LIBRARY', 'FR', 'Bibliothèque de contenu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LINKED', 'FR', 'Lié à', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LIVE_AUTHORING', 'FR', 'Gestion en direct', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOCATION', 'FR', 'Emplacement, si externe', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOCK_MENU', 'FR', 'Bloquer le menu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOGFILE', 'FR', 'Voir les logs système', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOGGED_AS', 'FR', 'Utilisateur connecté', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOGIN_FAILED', 'FR', 'L''identifiant saisi ne peut pas être vérifié ! Essayez de nouveau.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOGS', 'FR', 'Analyse du fichier de logs', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOGS_INFO', 'FR', 'La liste ci-dessous montre les logs réalisés pendant que N/X fonctionne.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LONGEST_PATHS', 'FR', 'Chemins les plus longs', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_ACCESS', 'FR', 'Accès', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_ADMIN', 'FR', 'Administration', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_BACKUP', 'FR', 'Sauvegarde', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_BROWSER', 'FR', 'Navigateur d''objets', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_CHANNELS', 'FR', 'Canaux', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_CLB', 'FR', 'Navigateur de clusters', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_CLT', 'FR', 'Modèles de clusters', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_CLTB', 'FR', 'Navigateur de modèles de clusters', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_CLUSTERS', 'FR', 'Clusters', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_COMBOBJ', 'FR', 'Contenus combinés (cluster)', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_ES', 'FR', 'Explorer le site', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_EXPORT_WZ', 'FR', 'Assistant d''exportation', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_HELP', 'FR', 'Aide', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_HOME', 'FR', 'Accueil', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_IMPORT_WZ', 'FR', 'Assistant d''importation', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_INSTALLPLUGIN', 'FR', 'Extensions', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_LIB', 'FR', 'Bibliothèque', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_LOGOUT', 'FR', 'Se déconnecter', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_MAINTENANCE', 'FR', 'Maintenance', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_META', 'FR', 'Modèles de méta', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_MYPROFILE', 'FR', 'Mon profil', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_MYPRT', 'FR', 'Mes portails', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_PGN', 'FR', 'Contrôle des extensions', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_PRTMAN', 'FR', 'Gestionnaire de portail', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_PTEMP', 'FR', 'Modèles de pages', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_PURGE', 'FR', 'Nettoyer le base de données', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_REPORT', 'FR', 'Rapport de site', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_ROLLOUT', 'FR', 'Bascule', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_SPM', 'FR', 'Page de site maître', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_TEMP', 'FR', 'Modèles', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_TRANSLATION', 'FR', 'Traduction', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_UMAN', 'FR', 'Gestion des utilisateurs', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_VAR', 'FR', 'Variations', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_WWW', 'FR', 'Site Web', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MANDATORY', 'FR', 'Ce champ ne peut pas être vide !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MAXIMUM', 'FR', 'Maximum', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MAXIMUMAT', 'FR', 'Maximum à', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MEDIAN', 'FR', 'Médian', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MENU', 'FR', 'Menu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MESSAGE', 'FR', 'Message', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('METATEMPLATE', 'FR', 'Modèle de méta-clé additionnel', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('METATEMPLATES', 'FR', 'Modèles de méta-données', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MH_GETSTART', 'FR', 'Pour commencer', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MH_GLOSSARY', 'FR', 'Lexique', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MINIMUM', 'FR', 'Minimum', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MINIMUMAT', 'FR', 'Minimum à', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_ADDITIONAL', 'FR', 'Méta-données additionnelles', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_BASE', 'FR', 'Méta-données basiques', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_DELETE', 'FR', 'Voulez-vous vraiment supprimer cette partie du modèle de méta ? Toute les informations écrites dans n''importe quelle méta-donnée liée à la présente partie seront supprimées. Les données vont être perdues à jamais ! ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_DW_CONTENT', 'FR', 'Extension Dreamweaver', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_DW_CONTENTFIE', 'FR', 'Informations du champ de contenu Dreamweaver', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_DW_CONTENTFIELDINFO', 'FR', 'Informations du champ de contenu Dreamweaver', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_GENERATE_DTA', 'FR', 'Générer les types de données', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_GENERATE_DTA_', 'FR', 'génère les types de données', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_GENERATE_DTA_MES', 'FR', 'génère les types de données', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_GENERATE_DTA_SUCCEEDED', 'FR', '<br><br>Les types de données ont été générés avec succès et le fichier écrit.<br>', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_LW_SITE', 'FR', 'Lancer le site entier', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_MODULE', 'FR', 'Méta-donnée de type de contenu spécifique', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_PROPERTIES', 'FR', 'Modifier les propriétés du modèle de méta', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_SCHEME', 'FR', 'Modifier le schéma du modèle de méta', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_SPIDER', 'FR', 'Démarrer le spider', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_SYNC_CL', 'FR', 'Synchroniser les clusters', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_TITLE', 'FR', 'Maintenance', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MULTIPAGE', 'FR', 'Multipage', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NAME', 'FR', 'Nom', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEW', 'FR', 'Créer un nouveau', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEW_ARTICLE', 'FR', 'Nouvel article', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEW_CONTENT', 'FR', 'Nouveau contenu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEW_FOLDER', 'FR', 'Créer un dossier', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEXT', 'FR', 'Suivant', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO', 'FR', 'Non', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_CLUSTER', 'FR', 'Il n''y a aucun cluster.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_CLUSTER_SELECTED', 'FR', 'Aucun cluster sélectionné.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_CLUSTERTEMPLATES', 'FR', 'Il n''y a aucun modèle de cluster.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_CONTENT', 'FR', 'Aucun contenu déjà saisi.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_CONTENTS', 'FR', 'Aucun contenu disponible dans ce dossier.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_OBJ', 'FR', 'Aucun objet sélectionné.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_VARIATIONS', 'FR', 'Il n''y a actuellement aucune variation définie pour cet objet<br>Demandez à un développeur de vérifier la configuration de l''entrée sélectionnée.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NODE_ACCESS', 'FR', 'Définir les accès pour la racine du site', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOSPTITLE', 'FR', 'Vous devez définir le nom dans le menu avant de pouvoir lancer la page !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOT_SELECTED', 'FR', 'Aucune entrée encore sélectionnée.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOT_SPECIFIED', 'FR', 'N''importe quel type', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOTCONFIGURED', 'FR', 'Pas encore configuré.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOTNUMBER', 'FR', 'Vous devez entrer un nombre dans ce champ !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NUM_OF_ART', 'FR', 'Nombre d''articles (999 = infini)', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NUMBER_OF_INSTANCES', 'FR', 'Spécifiez combien d''instances vous voulez créer.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_ALT', 'FR', 'Libellé ALT', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_BROWSE', 'FR', 'Naviguer dans les objets', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_COPYRIGHT', 'FR', 'Copyright', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_DBLINK_ADDWHERE', 'FR', 'Clause WHERE additionnelle', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_DBLINK_EXTERNALDB', 'FR', 'Base de données externe', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_DBLINK_SRCHVALUE', 'FR', 'Rechercher la valeur', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_DEL', 'FR', 'Supprimer l''objet', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_DELMES', 'FR', 'Vous êtes sur le point de supprimer un objet.<b>Notez que toutes les variations et toutes les méta-données seront perdues !</b>', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_EDIT', 'FR', 'Modifier l''objet', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_NAME', 'FR', 'Nom de l''objet', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_NEW', 'FR', 'Nouvel objet', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_PREVIEW', 'FR', 'Prévisualisation de', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_PROPERTIES', 'FR', 'Propriétés de l''objet', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_TEXT', 'FR', 'Texte', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_TEXT_NOBREAK', 'FR', 'Ignorer les nouvelles lignes', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('OBJLAUNCH_SUCCESS', 'FR', 'L''objet a été lancé avec succès.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('OK', 'FR', 'Ok', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ORDER', 'FR', 'Par ordre', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ORDERART', 'FR', 'Ordre des articles', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ORDERCOMP', 'FR', 'Ordres des compositions', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('OTHERS', 'FR', 'Autres', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('OVERVIEW', 'FR', 'Vue d''ensemble', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PAGE', 'FR', 'Page', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PAGE_TEMPLATE', 'FR', 'Modèle de page', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PAGES', 'FR', 'Pages', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PASSWORD', 'FR', 'Mot de passe', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PATH', 'FR', 'Chemin', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PATHS', 'FR', 'Chemin de clics', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PERCENT', 'FR', 'Pourcentage', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_ALREADYINSTAL', 'FR', 'L''extension est déjà installée !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_CHOOSE', 'FR', 'Extension : /plugin/', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_ERROR', 'FR', 'Il y a eu une erreur pendant l''installation de l''extension !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_FILEWRONG', 'FR', 'Le nom de fichier entré ne peut pas être trouvé sur le serveur !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_INSTALL', 'FR', 'Installer une extension', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_INSTALLDESC', 'FR', 'Vérifiez que vous avez copié tous les fichiers nécessaires dans le dossier avant de procéder. Insérez le chemin correct de l''extension dans le champ ci-dessous. Le système pourra alors installer l''extension automatiquement.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_INSTALLED', 'FR', 'L''extension a été installée avec succès !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_NEWERINSTALLE', 'FR', 'Il y a une version plus récente de cette extension installée !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_TITLE', 'FR', 'Extensions', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_UNINSTALL', 'FR', 'Désinstaller une extension', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_UNINSTALLDELE', 'FR', 'Désinstaller un module, <br> supprimer les contenus correspondants.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_UNINSTALLMES', 'FR', 'Vous êtes sur le point de désinstaller un module.<b>La désinstallation d''un module ne supprime pas seulement le type de contenu mais aussi chaque objet unique de ce type stocké dans la base de données. La désinstallation supprimera définitivement toutes les données de ce module ! ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PG_UPGRADED', 'FR', 'L''extension a été mise à jour avec succès !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PGNTXT_SMA', 'FR', 'Enregistrer tous les textes modifiés sur cette page', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PI', 'FR', 'Pages demandées', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PI_OVERVIEW', 'FR', 'Vue d''ensemble des pages demandées', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_BROWSER', 'FR', 'Navigateur de portail', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_CRSUCCEEDED', 'FR', 'La création d''un nouveau portail a abouti !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_EDIT', 'FR', 'Modifier la page du portail', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_MYPORTAL', 'FR', 'Mes portails', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PO_OWNER', 'FR', 'Propriétaire de la page', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('POS_IN_MENU', 'FR', 'Position dans le plan du site', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('POSITION', 'FR', 'Position', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PREDEF_TIME', 'FR', 'Fuseau horaire prédéfini', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PREV_AVAIL', 'FR', 'Vous avez sélectionné un objet. Une prévisualisation sera disponible après enregistrement.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PREVIEW', 'FR', 'Prévisualisation', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PRINT', 'FR', 'Imprimer', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PROCERROR', 'FR', 'Une erreur s''est produite pendant le traitement du formulaire. Regardez les champs marqués et lisez les commentaires pour plus d''information.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PROMPTDELETE', 'FR', 'Voulez-vous vraiment supprimer ce jeu de données ? Cette action ne peut pas être annulée !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PROPERTIES', 'FR', 'Propriétés', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PTEMPL', 'FR', 'Modèle de page', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE', 'FR', 'Nettoyer la base de données', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_CLT', 'FR', 'Nettoyer les modèles de clusters', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_CLUSTER', 'FR', 'Nettoyer le cluster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_CONTENT', 'FR', 'Nettoyer le contenu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_EXPIRED', 'FR', 'Nettoyer les pages expirées', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_FOLDER', 'FR', 'Nettoyer les dossiers', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_MES', 'FR', 'Sélectionnez les parties de la base de données que vous voulez nettoyer.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_META', 'FR', 'Nettoyer les méta-données', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_PAGES', 'FR', 'Nettoyer les pages du site et les maîtres', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PURGE_VAR', 'FR', 'Nettoyer les variations', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PWDNOTMATCH', 'FR', 'Les mots de passe entrés ne correspondent pas !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PWDTOOSHORT', 'FR', 'Le mot de passe doit être d''au moins 6 caractères !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_DELETEFOLDER', 'FR', 'Supprimer le dossier', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_DELFOLDER', 'FR', 'Supprimer le dossier et tous les objets enfants', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_DELFOLDERMES', 'FR', 'Vous êtes sur le point de supprimer un dossier. Sélectionnez une action.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_EDITFOLDER', 'FR', 'Modifier les propriétés du dossier', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_FOLDERNAME', 'FR', 'Nom du dossier', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_FOLDERNOTEMPTY', 'FR', 'Le dossier n''est pas vide. Vous ne pouvez donc pas le supprimer ! Vérifier tous les objets et tous les clusters !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_HOME', 'FR', 'Démarrer', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_MOVEOBJECTS', 'FR', 'Déplacer tous les objets vers le nœud parent', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_NEWFOLDER', 'FR', 'Nouveau dossier', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('R_PARENT', 'FR', 'Dossier parent', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCH WEBSITE', 'EN', 'Search Website', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RANK', 'FR', 'Rang', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RATERES', 'FR', 'Résultats des taux', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RB_CACHE', 'FR', 'Reconstruire le cache', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('READY_TO_USE', 'FR', 'Prêt à l''utilisation.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('REFERER', 'FR', 'Référent', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('REMAIN_POS', 'FR', 'Ne pas changer la position', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RESET', 'FR', 'Remettre à zéro le formulaire', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RESET_FORM', 'FR', 'Remettre à zéro le formulaire', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RESET_LOGS', 'FR', 'Remettre à zéro les logs', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RET_VIS', 'FR', 'Visiteurs de renvoi', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RL_PERM', 'FR', 'Permissions des rôles', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_DESCRIPTION', 'FR', 'Description', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_FILTERMENU', 'FR', 'Administration des rôles', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_GENERAL', 'FR', 'Modifier les données générales du rôle', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_HEAD', 'FR', 'Profil du rôle', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_LINK', 'FR', 'Profils du rôle', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_NAME', 'FR', 'Nom du rôle', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLE_PERMISSION', 'FR', 'Modifier les permissions du rôle', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SAVE', 'FR', 'Enregistrer', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SAVE_BACK', 'FR', 'Enregistrer et revenir', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SAVEERROR', 'FR', 'Une erreur s''est produite pendant l''enregistrement des données dans la base de données. Vérifiez que la base de données est connectée ou appelez votre administrateur.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SAVESUCCESS', 'FR', 'Les données ont été écrites dans la base de données avec succès.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCH', 'FR', 'Démarrer la recherche', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCH_CLEAR', 'FR', 'Remettre à zéro le filtre', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCH_EXPIRED_ARTICLES', 'FR', 'Articles expirés', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCH_LIVE_ACRTICLES', 'FR', 'Articles en cours', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCHIN', 'FR', 'Rechercher', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCHRESULTS', 'FR', 'Résultat de la recherche, veuillez faire votre choix', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEASRCH_MISSING_VARIATIONS', 'FR', 'Variations manquantes', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_ARTICLE', 'FR', 'Sélectionner un article', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_CH', 'FR', 'Sélectionner un canal', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_CHANNEL_CAT', 'FR', 'Sélectionner un canal et une catégorie', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_CLUSTER', 'FR', 'Sélectionner un cluster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_EVENT', 'FR', 'Sélectionner un événement ou un rendez-vous', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_FILE', 'FR', 'Sélectionner un fichier', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_MEM', 'FR', 'Sélectionner des membres', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_PTML', 'FR', 'Sélectionner un modèle de page', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_VAR', 'FR', 'Sélectionner une variation', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECT', 'FR', 'Sélectionner', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECT_CI', 'FR', 'Sélectionner une entrée de contenu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECT_CL', 'FR', 'Sélectionner une instance de cluster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECT_VARIATION', 'FR', 'Sélectionner une variation', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECTEDINSTANCE', 'FR', 'Instance de cluster sélectionnée', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECTEDOBJECT', 'FR', 'Entrée de contenu actuellement sélectionnée', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECTOBJECT', 'FR', 'Sélectionnez une classe et spécifiez une position et un nom pour créer un nouvel objet.<br>Pour la position, utilisez 0 pour l''insérer au début, 999 pour l''insérer à la fin ou n''importe quel autre position de votre choix.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELECTONE', 'FR', 'Vous devez faire un choix ici !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SELMULTIPLE', 'FR', 'Maintenez la touche CTRL enfoncée pour sélectionner plusieurs entrées.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SET', 'FR', 'Définir', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SHORTEST_PATHS', 'FR', 'Chemins les plus courts', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SHOW', 'FR', 'Montrer', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SHOW_ADVANCED_SEARCH', 'FR', 'Afficher les options de recherche avancées', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SHOW_ALL', 'FR', 'Tout montrer', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SHOW_PAGEWISE', 'FR', 'Montrer la mise en page', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SMA_EXT_EDIT', 'FR', 'Ouvrir une fenêtre d''édition. Enregistrer d''abord tous les textes édités avant !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_BROWSE', 'FR', 'Plan du site', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_CLNEW', 'FR', 'Créer une nouvelle instance de cluster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_CONFDESC', 'FR', 'Vous pouvez lier cette page du site à une instance existante du cluster ou créer une nouvelle instance. Décidez ce que vous souhaitez faire.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_CONFIGURE', 'FR', 'Configurer la page', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_DELETE', 'FR', 'Supprimer une page du site', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_DELMES', 'FR', 'Vous êtes sur le point de supprimer une page du site. Notez que toutes les instances vivantes de cette page seront également supprimées !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_EDIT', 'FR', 'Modifier une page du site', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_EXPIRE', 'FR', 'Expirer la page', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_EXPIREDATE', 'FR', 'Expiré depuis', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_IPROPERTIES', 'FR', 'Propriétés de la page', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_LAUNCH', 'FR', 'Lancer la page', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_LAUNCHDATE', 'FR', 'Actif depuis', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_LAUNCHDATES', 'FR', 'Configuration du temps de vie', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_LINK', 'FR', 'Lien vers une instance de cluster existante', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUDIRECT', 'FR', 'URL directe sur le serveur en ligne', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUDIRECTTIT', 'FR', 'Définir le chemin optionnel sur le serveur pour un accès direct', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUDIRECTTITLE', 'FR', 'Définir le chemin optionnel sur le serveur pour un accès direct', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUHELP', 'FR', 'Texte d''aide pour le menu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUNAME', 'FR', 'Nom dans le menu', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUPROPS', 'FR', 'Nom du menu et texte d''aide', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_NEWINSTANCE', 'FR', 'Ajouter une page', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_NEWPAGE', 'FR', 'Ajouter une page', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_PDELETE', 'FR', 'Supprimer une page', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_PDELMES', 'FR', 'Vous êtes sur le point de supprimer une page. Notez que toutes les instances vivantes de cette page seront également supprimées !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_PREVIEW', 'FR', 'Prévisualisation de la page', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_PROPERTIES', 'FR', 'Propriétés de la page', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_RLTREE', 'FR', 'Rafraîchir l''arborescence', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM', 'FR', 'Page de site maître', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_CLUSTER', 'FR', 'Modèle de cluster', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_EDIT', 'FR', 'Modifier la page de site maître', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_LAUCH_SUCCESS', 'FR', 'Les pages définies sur le maître ont été relancées avec succès.<br>', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_META', 'FR', 'Modèle de méta-clé', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_PATH', 'FR', 'Chemin du modèle', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_RLAUNCH', 'FR', 'Rafraîchir les instances', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_SELECTTHUMB', 'FR', 'Sélectionner une vignette', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_THUMBNAIL', 'FR', 'Vignette', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_TYPE', 'FR', 'Type de page', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SPM_VARIATIONS', 'FR', 'Variations affichables', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SR_SELECTCI', 'FR', 'Vous pouvez chercher n''importe quelle entrée de contenu ici. Si vous voulez sélectionner une entrée de contenu, choisissez-la et appuyez sur le bouton Mettre à jour. Si vous voulez relier un nouveau contenu à ce champ, créez d''abord le contenu dans le navigateur d''objet. ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SR_SELECTCLI', 'FR', 'Sélectionnez un modèle de cluster. Ensuite, vous pourrez sélectionner une instance de ce modèle pour l''utiliser.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('START_BAK', 'FR', 'Démarrer la sauvegarde', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STARTDATE', 'FR', 'Date de démarrage', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STARTTIME', 'FR', 'Heure de démarrage', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STATS', 'FR', 'Statistiques', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STATS_HEADER', 'FR', 'Statistiques de trafic N/X 2004', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STATUS', 'FR', 'Etat :', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STEP', 'FR', 'Etape', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STNAME', 'FR', 'Sélectionner un nom pour identifier cette page dans le plan du site', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SYNC_CLUSTERS', 'FR', 'Synchroniser les clusters', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SYNC_CLUSTERS_DESCR', 'FR', 'Quand vous modifiez un modèle de cluster, les clusters ne sont pas automatiquement synchronisés. Ils sont synchronisés quand vous travaillez avec la fois suivante. Vous pouvez tous les synchroniser.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TEMPLATE', 'FR', 'Modèle', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TESTS', 'FR', 'Tests unitaires N/X', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TF', 'FR', 'Fuseau horaire', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('THISMONTH', 'FR', 'Ce mois-ci', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('THISWEEK', 'FR', 'Cette semaine', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('THISYEAR', 'FR', 'Cette année', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TIME_BETW_VISITS', 'FR', 'Moyenne de temps entre les visites', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TIPP_TEMPLATE_1', 'FR', 'Les modèles sont à la base du fonctionnement de N/X. Vous aurez besoin de créer un modèle de cluster en premier qui définira la structure et le type de contenu. Par la suite, vous pourrez créer les modèles de pages ici en fusionnant un modèle de cluster et un fichier PHP.<br><br>', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TITLE', 'FR', 'Titre', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TMPL_NAME', 'FR', 'Sélectionner un modèle', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TODAY', 'FR', 'Aujourd''hui', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP', 'FR', 'Principales données', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_BROWSER', 'FR', 'Principaux navigateurs', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_ENTRYPAGES', 'FR', 'Principales pages d''entrées', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_EXITPAGES', 'FR', 'Principales pages de sortie', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_EXITT', 'FR', 'Principales cibles de sortie', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_HOSTS', 'FR', 'Principaux hébergeurs', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_OS', 'FR', 'Principaux systèmes d''exploitation', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_PAGES', 'FR', 'Principales pages', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_PATHS', 'FR', 'Principaux chemins', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_REFERER', 'FR', 'Principaux référents', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_SI', 'FR', 'Principaux moteurs de recherche', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOP_SKW', 'FR', 'Principaux mots-clés de recherche', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TOTAL', 'FR', 'Total', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TRANS_TEMPL', 'FR', 'Traduit depuis', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TRANS_THIS', 'FR', 'Traduire ceci :', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TRANSLATION', 'FR', 'Système de traduction N/X', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TT_REFRESH', 'FR', 'Rafraîchir les instances met à jour les pages en cache dont le modèle a été modifié.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TT_RSTCI', 'FR', 'Dans N/X, chaque page a un cluster. En appuyant sur Redéfinir l''instance du cluster, vous pouvez assigner un nouveau cluster à la page et supprimer l''ancien.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TYPE', 'FR', 'Type', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('UNIQUE', 'FR', 'Ce champ doit être unique !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('UP', 'FR', 'Haut', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('UP_INTRO', 'FR', 'Sélectionnez le groupe et ses rôles à affecter à l''utilisateur.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('UPL_TEXT', 'FR', 'Charger un fichier texte', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USAGE', 'FR', 'Utilisation', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_ACTIVE', 'FR', 'Compte activé', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_AGENT', 'FR', 'Utiliser l''agent', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_BL', 'FR', 'Langage de l''interface', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_EMAIL', 'FR', 'E-mail', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_FILTERMENU', 'FR', 'Administration des utilisateurs', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_GENERAL', 'FR', 'Modifier les données générales de l''utilisateur', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_HEAD', 'FR', 'Profil de l''utilisateur', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_JS', 'FR', 'Utiliser le Javascript', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_LINK', 'FR', 'Profils des utilisateurs', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_NAME', 'FR', 'Nom de l''utilisateur', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_PERMGRID', 'FR', 'Grille de permissions', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_PERMISSION', 'FR', 'Modifier les permissions de l''utilisateur', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_PERMISSIONS', 'FR', 'Permissions de l''utilisateur', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_PROFILE', 'FR', 'Mon profil', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_SETPERM', 'FR', 'Définir les permissions de l''utilisateur ci-dessous. Pour enlever un utilisateur d''un groupe, retirez tous les groupes depuis celui-ci.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USER_TO_GROUP', 'FR', 'Ajouter un utilisateur au groupe', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('USERPERM_HEAD', 'FR', 'Modifier les permissions de l''utilisateur', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('V_EDIT', 'FR', 'Modifier les variations', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('V_NAME', 'FR', 'Nom', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('V_SHORT', 'FR', 'Balise courte', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VAR_SUCCEEDED', 'FR', 'réussi !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VARIATIONS', 'FR', 'Variations disponibles', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VIS_FIRST', 'FR', 'Visiteurs pour la première fois', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VIS_ONL', 'FR', 'Visiteurs en ligne', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VIS_PER_VIS', 'FR', 'Moyenne des visites par visiteur', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VIS_RET', 'FR', 'Visiteurs périodiques', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VISITORS', 'FR', 'Visiteurs', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VISITS', 'FR', 'Visites', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VISITS_OVERVIEW', 'FR', 'Vue d''ensemble des visites', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WEBSITE', 'FR', 'Site Web', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WEEKDAY', 'FR', 'Jours de la semaine', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WEEKDAY_AS', 'FR', 'Analyse des jours de la semaine', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WHEN', 'FR', 'Quand', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WRONGDATE', 'FR', 'La date saisie n''existe pas !', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZ_ARTICLEIMPORT', 'FR', 'Assistant d''importation d''articles', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZ_ARTICLEIMPORT_TITLE', 'FR', 'Cet assistant est utilisé pour importer des données d''articles depuis différentes sources vers un canal. Vous pouvez importer depuis des multiples existantes ou d''autres canaux. Vous devez vous assurer que les modèles correspondants sont compatibles. ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZ_EXPORT_TITLE', 'FR', 'Cet assistant est utilisé pour échanger des clusters, des modèles de clusters et des modèles de pages entre votre installation N/X et d''autres installations. L''assistant produit un fichier XML que vous pouvez stocker sur votre disque dur local et échanger avec d''autres utilisateurs de N/X.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZ_IMPORT_TITLE', 'FR', 'Cet assistant est utilisé pour importer vers N/X des données qui ont été préalablement exportées avec une autre installation de N/X. Vous devez supprimer une ressource avant de l''importer une deuxième fois.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_ARTICLEIMPORT_SRCTYPE', 'FR', 'Sélectionnez depuis quel type de source vous voulez importer les articles.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_ARTICLEIMPORT_TARGET', 'FR', 'A droite, vous devez choisir le canal cible. Tous les articles importés seront stockés dans ce canal.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_EXPORT_TYPE', 'FR', 'A droite, vous devez choisir le type de données que vous voulez exporter. Les clusters stockent le contenu. Quand vous exportez des clusters, les modèles sont également automatiquement exportés. Les modèles de clusters définissent la structure pour créer des clusters. Des modèles de pages définissent la mise en page que les clusters vont utiliser en fonction de leur contenu.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_IMPORT_FILE', 'FR', 'Choisissez un fichier N/X-XML sur votre disque pour le charger dans le système.<br./><br./>Le système le contrôlera et montrera l''information d''état sur la prochaine page.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_IMPORT_VAL', 'FR', 'Le système a vérifié l''exactitude du fichier XML chargé. Lisez le rapport à gauche pour plus de détails.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_IMPORTING', 'FR', 'Le système a tenté d''importer les données. Lisez l''état à droite.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_ARTICLEIMPORT_SRCTYPE', 'FR', 'Sélectionner le type de source', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_ARTICLEIMPORT_TARGET', 'FR', 'Sélectionner le canal cible', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_DESCR', 'FR', 'Ajouter une description', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_DESCR_EXPL', 'FR', 'Vous devriez ajouter une courte description aux données exportées.</br.></br.>Celui qui importera les données comprendra plus facilement ce qu''il a exporté.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_EXPORT_TYPE', 'FR', 'Sélectionner un type à exporter', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_IMPORT_FILE', 'FR', 'Sélectionner un fichier N/X-XML ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_IMPORT_VAL', 'FR', 'Sommaire du XML chargé', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_IMPORTING', 'FR', 'Données en cours d''importation', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_KEEPCLUSTER', 'FR', 'Garder les clusters existants ?', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_KEEPCLUSTER_EXPL', 'FR', 'Vous pouvez indiquer si vous voulez garder les clusters existants ou créer des copies de chaque cluster.<br.><br.>Garder à l''esprit que si vous gardez les clusters originaux vous les partagez avec la source originale.', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_SEL_EXP_RES', 'FR', 'Sélectionner une ressource à exporter', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('YES', 'FR', 'Oui', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('YESTERDAY', 'FR', 'Hier', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_ARTICLES', 'FR', 'Articles', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_GROUP', 'FR', 'Cluster Group', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PAGE_ID', 'FR', 'Page ID', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PROC_DATA', 'FR', 'Processing Data...', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MAINT_WWWDEV', 'EN', 'Switch test website into maintenance.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BB_IN_MM_MODE', 'EN', 'The backend is in maintenance at the moment. Only the Administrator can log in!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('POPUP_MENU', 'EN', 'Popup Window', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PAR_PAGE', 'EN', 'Parent Page', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('IMP_IMAGES', 'EN', 'Import images', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_IMP_FOLDER', 'EN', 'Select import folder', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('IMP_IMPAGES', 'EN', 'Import Images', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZ_IMPORT_IM_TITLE', 'EN', 'This wizard is used for importing importing images to N/X. Pack the images into a zip archive and upload them with this wizard. The wizard will extract the images and add them to the content library.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_ARCHIVE_FILE', 'EN', 'Select Archive', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_ARCHIVE_FILE', 'EN', 'Please select the zip-archive you want to import. Do not use folders within the zip-archive!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MUST_UPLOAD', 'EN', 'You must upload a file to proceed!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ARCHERR', 'EN', 'The archive could not be properly imported. Check for php_zip extension!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_ACH_CHECK', 'EN', 'Check Archive', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NUMB_FILES', 'EN', 'Number of files found in archive:', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_ARCH_CHECK', 'EN', 'Please control the result of the archive checks and press next if you want to continue.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_DEST_FOLDER', 'EN', 'Select destination folder', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_DEST_FOLDER', 'EN', 'Please select the destiniation folder for the pictures.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DEST_FOLDER', 'EN', 'Destination folder', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NUM_FILES', 'EN', 'Number of files found in archive:', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_IMP_IMAG', 'EN', 'Importing images...', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOFI', 'EN', 'Number of files imported:', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACCESS_VIOLATION', 'EN', 'Access violation', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACCESS_V_TEXT', 'EN', 'You have no rights to access this object!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLEAR_JPCACHE', 'EN', 'Clear Cache', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WAS_DELETED', 'EN', 'The referenced content was deleted from library!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DEL_TREE', 'EN', 'Delete Tree', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MORE_ACT', 'EN', 'More actions...', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RESETCLI', 'EN', 'Change Object', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STATISTICS', 'EN', 'Statistics', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('REFRESH', 'EN', 'Refresh', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACCESS_V_TEXT', 'DE', 'Sie haben nicht die notwendigen Rechte um auf das Object zuzugreifen.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ARCHERR', 'DE', 'Die Archivdatei konnte nicht entpackt werden. Stellen Sie sicher, dass die php_zip Erweiterung korrekt installiert ist.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BAK_TIPP', 'DE', 'Sie können ihre www, wwwdev-Verzeichnisse sowie die Datenbank hier sichern. Bitte stellen Sie vorab sicher, dass die Sicherung korrekt konfiguriert wurde.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BB_IN_MM_MODE', 'DE', 'Das Backoffice ist im Wartungsmodus. Nur der Administrator kann sich einloggen.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BY_ORDER', 'DE', 'nach Position', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CCONLAUNCH', 'DE', 'Cache beim veröffentlichen Leeren', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CCONLAUNCH_LBL', 'DE', 'kommaseparierte Seiten-IDs', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHANGE', 'DE', 'Ändern', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHANGE_TEMPLATE', 'DE', 'Ausgewählte Seitenvorlage', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHNLAUNCHED', 'DE', 'Der Kanal wurde erfolgreich veröffentlicht.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLEAR_JPCACHE', 'DE', 'Cache leeren', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CL_GROUP', 'DE', 'Objektgruppe', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COPYCLT', 'DE', 'Klasse Kopieren', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COPYCLUSTERT', 'DE', 'Kopieren', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATECOPY', 'DE', 'Kopieren', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CR_BO_LANG', 'DE', 'Neue Backoffice-Sprache erstellen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DEL_TREE', 'DE', 'Baum löschen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DEST_FOLDER', 'DE', 'Zielordner', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXP_TREE', 'DE', 'Baum zurückziehen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FILE_ALREADY_UPLOADED', 'DE', 'Die Datei wurde bereits hochgeladen. Sie können fortfahren, indem sie auf Weiter klicken.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GAFOLDER', 'DE', 'Bilder-Ordner', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GALCOLS', 'DE', 'Spalten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GALDESC', 'DE', 'Beschreibung', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GALNAME', 'DE', 'Gallerie', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GALROWS', 'DE', 'Zeilen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GO_IMPORT', 'DE', 'Klicken Sie auf weiter, um die Daten jetzt zu importieren.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZ_IMP_SELCL', 'EN', 'Please select the node you want to import.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('IMP_ERR', 'DE', 'Der Import ist aufgrund der folgenden Fehler fehlgeschlagen:', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('IMP_IMAGES', 'DE', 'Bilder importieren', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('IMP_IMPAGES', 'DE', 'Bilder importieren', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LANGID', 'DE', 'Sprachen ID', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LANGUAGE', 'DE', 'Sprache', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LAUNCH_TREE', 'DE', 'Launch Tree', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MAINT_BB', 'DE', 'Backoffice in Wartungsmodus schalten.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MAINT_MODE', 'DE', 'Wartungsmodus', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MAINT_WWW', 'DE', 'Website in Wartungsmodus schalten.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MAINT_WWWDEV', 'DE', 'Vorschau-Website in Wartungsmodus schalten.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MEDIA_SUPPORTED', 'DE', 'Das Media-Plugin unterstützt folgende Dateitypen:Macromedia Flash Films (.swf), Windows Media (.avi), Real Player (.rm), Apple Quicktime (.mov), MP3 over Windows Media (.mp3), PDF (.pdf)', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MISSING_PGN', 'DE', 'Fehlendes Plugin:', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MODTYPE', 'DE', 'Plugin-Typ:', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MORE_ACT', 'DE', 'Weitere Aktionen...', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_LWC', 'DE', 'Alle Artikel veröffentlichen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_RB_CACHE_MES', 'DE', 'Cache aller veröffentlichten Seiten neu aufbauen.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MUST_UPLOAD', 'DE', 'Sie müssen eine Datei hochladen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_ARTICLES', 'DE', 'Artikel', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEWNAME', 'DE', 'Neuer Name', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEW_ROLLOUT', 'DE', 'Einen neuen Kopiervorgang starten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOFI', 'DE', 'Anzahl der importierten Dateien:', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOT_FOUND', 'DE', 'Es wurde nichts gefunden.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_XML', 'DE', 'Die hochgeladenen Datei ist kein korrektes XML.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NUMB_FILES', 'DE', 'Anzahl von gefundenen Dateien im Archiv:', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NUMB_IMPORTED', 'DE', 'Importierte Datensätze:', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NUM_FILES', 'DE', 'Anzahl von gefundenen Dateien im Archiv:', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_DELMES2', 'DE', 'Möchten Sie diesen inhalt wirklich löschen? Er könnte immer noch von einigen Objekten genutzt werden.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PAGE_ID', 'DE', 'Page ID', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PAR_PAGE', 'DE', 'Elternseite', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PGN_INFO', 'DE', 'Informationen zum Plugin', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PNF', 'DE', 'Die Seiten-Id wurde nicht gefunden', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('POPUP_MENU', 'DE', 'Popup', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PROC_DATA', 'DE', 'Verarbeite Daten....', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('REFRESH', 'DE', 'Aktualisieren', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RESETCLI', 'DE', 'Objekt anpassen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLLOUT_SEL', 'DE', 'Quelle und Ziel der Kopie', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCH WEBSITE', 'DE', 'Search Website', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_IMP_FOLDER', 'DE', 'Importverzeichnis auswählen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SOURCE', 'DE', 'Quelle', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SOURCEFILE', 'DE', 'Quelldatei', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STATISTICS', 'DE', 'Statistiken', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('UNINSTALL', 'DE', 'Deinstallieren', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('UNINSTCONF', 'DE', 'Das Deinstallieren eines Plugins kann ihre Website zerstören. Möchten Sie wirklich fortfahren?', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VERSION', 'DE', 'Version', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WAS_DELETED', 'DE', 'Der Inhalt wurde aus der Bibliothek entfernt.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WYSIWYG', 'DE', 'WYSIWYG Editor', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_ARCHIVE_FILE', 'DE', 'Bitte wählen Sie das zu importierende ZIP-Archiv. Verwenden Sie keine Verzeichnisse innerhalb von Archiven!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_ARCH_CHECK', 'DE', 'Bitte kontrollieren Sie die Archivprüfung.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_DEST_FOLDER', 'DE', 'Bitte wählen Sie den Zielordner für die Bilder.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_ACH_CHECK', 'DE', 'Archiv überprüfen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_ARCHIVE_FILE', 'DE', 'Archiv wählen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_DEST_FOLDER', 'DE', 'Wählen Sie einen Zielordner', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_IMP_IMAG', 'DE', 'Importiere Bilder...', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZ_IMPORT_IM_TITLE', 'DE', 'Dieser Assistent dient zum importieren von Bildern. Packen Sie die Bilder in ein Archiv und laden Sie dies hier hoch.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACCESS_VIOLATION', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACCESS_V_TEXT', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ARCHERR', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BACK_SP', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BB_IN_MM_MODE', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BG_COLOR', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CCONLAUNCH', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CCONLAUNCH_LBL', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHANGE', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHNLAUNCHED', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLEAR_JPCACHE', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CLLINK', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONFIRM_UNSAVED_CHANGES_LINKEDCL', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COPYCLT', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('COPYCLUSTERT', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATECOPY', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CR_BO_LANG', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DEL_TREE', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DEST_FOLDER', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXP_TREE', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FILE_ALREADY_UPLOADED', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FONT', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FONTSIZE', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GAFOLDER', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GALCOLS', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GALDESC', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GALNAME', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GALROWS', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GO_IMPORT', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('GR_TEXT', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('HEIGHT', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('OF', 'EN', 'of', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('IMP_ERR', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('IMP_IMAGES', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('IMP_IMPAGES', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LANGID', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LANGUAGE', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LAUNCH_TREE', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MAINT_BB', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MAINT_MODE', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MAINT_WWW', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MAINT_WWWDEV', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MEDIA_SUPPORTED', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MISSING_PGN', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MODTYPE', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MORE_ACT', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_LWC', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_LWS_MESSAGES', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MT_RB_CACHE_MES', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MUST_UPLOAD', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEWNAME', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEW_ROLLOUT', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOFI', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOT_FOUND', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_XML', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NUMBER', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NUMB_FILES', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NUMB_IMPORTED', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NUM_FILES', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('O_DELMES2', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PAR_PAGE', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PGN_INFO', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('PNF', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('POPUP_MENU', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('REFRESH', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RESETCLI', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLLOUT_SEL', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCH WEBSITE', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_IMP_FOLDER', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SOURCE', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SOURCEFILE', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('STATISTICS', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TEXT_ALIGN', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TEXT_COLOR', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('TEXT_STYLE', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('UNINSTALL', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('UNINSTCONF', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('VERSION', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WAS_DELETED', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WIDTH', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WYSIWYG', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_ARCHIVE_FILE', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_ARCH_CHECK', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZE_DEST_FOLDER', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_ACH_CHECK', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_ARCHIVE_FILE', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_DEST_FOLDER', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZT_IMP_IMAG', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZ_IMPORT_IM_TITLE', 'FR', NULL, NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LATEST', 'EN', 'Latest changed first', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('OLDEST', 'EN', 'Oldest changed first', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RANDOM', 'EN', 'Random', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOGIN', 'EN', 'Sign In', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLL2', 'EN', 'You can change the names of the objects now. This is necessary because you cannot have duplicate names. If names are not too important for you, N/X will use its autonaming algorithm for resolving duplicate name constraints.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SOURCE_NODE', 'EN', 'Source Node:', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DEST_NODE', 'EN', 'Destination node:', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCH_REPL', 'EN', 'Search and replace object names', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCHPHRASE', 'EN', 'Search phrase:', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('REPLACEPHRASE', 'EN', 'Replace phrase:', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('REPLACEALL', 'EN', 'Replace All', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MANEDIT', 'EN', 'Manual edit rollout names and properties', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCHREPLACEVALID', 'EN', 'You must enter a search and a replace string!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLLOUTSUCCESS', 'EN', 'The copy was successful!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('REFRESH_PAGES', 'EN', 'The pages which are based on this template were successfully republished.<br>', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CH_IMP_SUCCESS', 'EN', 'The data was successfully imported to the channel.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NUM_IMP_PAGES', 'EN', 'Total number of imported pages:', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BACK_TO_CHANNELS', 'EN', 'Back to Article Overview', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BACKUP_CONFIG', 'EN', 'The backup directory was not found on the harddisc!', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DEL_BACKUP', 'EN', 'Delete backup file?', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DEL_BACKUP_MES', 'EN', 'Do you really want to delete this backup file?', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('THEREISQUESTION', 'EN', 'Confirm action', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATED_ITEM', 'EN', 'The following Placeholder was created:', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCH2', 'EN', 'Search', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WEBSITEPRV', 'EN', 'Website preview', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BACKUP_CONFIG', 'DE', 'Das Sicherungsverzeichnis wurde auf der Festplatte nicht gefunden.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BACK_TO_CHANNELS', 'DE', 'Zurück zur Artikelübersicht', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CH_IMP_SUCCESS', 'DE', 'Die Daten wurden erfolgreich in den Kanal importiert.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CREATED_ITEM', 'DE', 'Der Platzhalter wurde erzeugt:', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DEL_BACKUP', 'DE', 'Backupdatei löschen?', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DEL_BACKUP_MES', 'DE', 'Möchten Sie die Backupdatei wirklich löschen?', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DEST_NODE', 'DE', 'Zielknoten:', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LATEST', 'DE', 'zuletzt geänderte zuerst', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LOGIN', 'DE', 'Anmelden', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MANEDIT', 'DE', 'Namen von Hand bearbeiten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NUM_IMP_PAGES', 'DE', 'Anzahl importierter Seiten:', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('OF', 'DE', 'von', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('OLDEST', 'DE', 'die ältesten zuerst', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('RANDOM', 'DE', 'Zufällig', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('REFRESH_PAGES', 'DE', 'Die Seiten, die auf dieser Vorlage basieren wurden erfolgreich neu veröffentlicht.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('REPLACEALL', 'DE', 'Alle ersetzen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('REPLACEPHRASE', 'DE', 'Ersetzungstext', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLL2', 'DE', 'Sie können die Namen der Objekte jetzt verändern. Dies ist wichtig, da N/X keine zwei Objekte mit dem selben Namen verwalten kann. Wenn Sie die Namen nicht ändern, wird N/X dies automatisch für Sie übernehmen.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ROLLOUTSUCCESS', 'DE', 'Die Kopie war erfolgreich.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCH2', 'DE', 'Search', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCHPHRASE', 'DE', 'Suchtext', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCHREPLACEVALID', 'DE', 'Sie müssen einen Such- und einen Ersetzungstext eingeben.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEARCH_REPL', 'DE', 'Objektnamen Suchen und Ersetzen.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SOURCE_NODE', 'DE', 'Quellknoten', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('THEREISQUESTION', 'DE', 'Aktion bestätigen', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WEBSITEPRV', 'DE', 'Entwicklungswebsite', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('WZ_IMP_SELCL', 'DE', 'Bitte wählen Sie den Knoten in den Sie importieren möchten.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CR_VR', 'DE', 'Create variation', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CRCLV_MES', 'DE', 'The cluster does not exists in this variation. Do you want to create it?', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DESIGNS', 'EN', 'Layout Designs', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_ESERVICES', 'EN', 'E-Services', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTACTS', 'EN', 'Contacts', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SHOP', 'EN', 'Shop', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEWSLETTER', 'EN', 'Newsletter', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MAILINGS', 'EN', 'Mailings', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MENU_DESIGNS', 'EN', 'Menu Designs', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOMENU', 'EN', 'No automatic menu drawing', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_MENU', 'EN', 'Select Menu Layout', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_MENUSTYLE', 'EN', 'Adjust Menu Type', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACTIVECOLOR', 'EN', 'Active Background-Color', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACTIVETCOLOR', 'EN', 'Active Text-Color', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACTIVETSCOLOR', 'EN', 'Active SubText-Color', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('INACTIVECOLOR', 'EN', 'Inactive Background-Color', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('INACTIVETCOLOR', 'EN', 'Inactive Text-Color', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('INSTALL_PGN', 'EN', 'Install a plugin', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NACTIVE', 'EN', 'Not active', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BACTIVE', 'EN', 'Active', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SP_MENUDESCRIPTION', 'EN', 'Page Description (for sitemap...)', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('URL', 'EN', 'URL', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACKEY', 'EN', 'Access Key', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACCESS_KEY', 'EN', 'Access Key', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DESIGNS', 'DE', 'Layout Designs', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('M_ESERVICES', 'DE', 'E-Services', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTACTS', 'DE', 'Contacts', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SHOP', 'DE', 'Shop', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NEWSLETTER', 'DE', 'Newsletter', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MAILINGS', 'DE', 'Mailings', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('MENU_DESIGNS', 'DE', 'Menu Designs', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NOMENU', 'DE', 'No automatic menu drawing', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_MENU', 'DE', 'Select Menu Layout', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_MENUSTYLE', 'DE', 'Adjust Menu Type', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NACTIVE', 'DE', 'Not active', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('BACTIVE', 'DE', 'Active', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTACTS_OVERVIEW', 'DE', 'Contacts Overview', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FIRSTNAME', 'DE', 'Firstname', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EMAIL', 'DE', 'E-Mail-Address', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CITY', 'DE', 'City', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LAST_MOD', 'DE', 'Last Modified', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('INSTALL_PGN', 'DE', 'Install a plugin', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ACKEY', 'DE', 'Access Key', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EXPL_SEL_CLT', 'DE', 'Please Select a cluster-template.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('SEL_CLT', 'DE', 'Select Cluster-Template', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LATEST_CREATED', 'EN', 'Article Date, latest first', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('OLDEST_CREATED', 'EN', 'Article Date, oldest first', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('POS_ASC', 'EN', 'Position ascending', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('POS_DESC', 'EN', 'Position descending', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('OUTPUTPAGE', 'EN', 'Output Page', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('ART_URL', 'EN', 'Article URL', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('URL_DISP_LATER', 'EN', 'The URL will be displayed after the linked template was launched.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CHNLAUNCHEDERR', 'EN', 'An error occured while launching the channel.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('DISP_DOC', 'EN', 'Display Documentation', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CONTACTS_OVERVIEW', 'EN', 'Contacts Overview', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FIRSTNAME', 'EN', 'Firstname', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('EMAIL', 'EN', 'E-Mail-Address', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('CITY', 'EN', 'City', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('LAST_MOD', 'EN', 'Last Modified', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('NO_PREVIEW', 'EN', 'No preview available.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES ('FLASHGAL', 'EN', 'Flash Gallery', '');

-- --------------------------------------------------------

-- 
-- Table structure for table `internal_resources_languages`
-- 

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


-- --------------------------------------------------------

-- 
-- Table structure for table `mailinglist`
-- 

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

INSERT INTO `meta_template_items` (`MTI_ID`, `MT_ID`, `NAME`, `POSITION`, `MTYPE_ID`, `VERSION`) VALUES (100426, 100425, 'Keywords', 1, 2, 0);
INSERT INTO `meta_template_items` (`MTI_ID`, `MT_ID`, `NAME`, `POSITION`, `MTYPE_ID`, `VERSION`) VALUES (100433, 100432, 'Description', 2, 2, 0);
INSERT INTO `meta_template_items` (`MTI_ID`, `MT_ID`, `NAME`, `POSITION`, `MTYPE_ID`, `VERSION`) VALUES (100435, 100432, 'Keywords', 1, 2, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `meta_templates`
-- 

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
INSERT INTO `meta_templates` (`MT_ID`, `NAME`, `DESCRIPTION`, `INTERNAL`, `VERSION`) VALUES (100425, 'Gallery PlugIn-Scheme', 'internally used for assigning Gallery plugin meta data', 1, 0);
INSERT INTO `meta_templates` (`MT_ID`, `NAME`, `DESCRIPTION`, `INTERNAL`, `VERSION`) VALUES (100432, 'Standard', '', 0, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `module_type`
-- 

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
INSERT INTO `modules` (`MODULE_ID`, `MODULE_NAME`, `DESCRIPTION`, `VERSION`, `MT_ID`, `CLASS`, `SOURCE`, `MODULE_TYPE_ID`) VALUES (100062, 'Boolean', 'Boolean Plugin', 1, 100061, 'pgnBoolean', 'boolean/pgn_boolean.php', 1);
INSERT INTO `modules` (`MODULE_ID`, `MODULE_NAME`, `DESCRIPTION`, `VERSION`, `MT_ID`, `CLASS`, `SOURCE`, `MODULE_TYPE_ID`) VALUES (100311, 'Captcha', 'CDS-API-Extension for creating Captchas', 1, 100310, 'pgnCaptcha', 'captcha/pgn_captcha.php', 3);
INSERT INTO `modules` (`MODULE_ID`, `MODULE_NAME`, `DESCRIPTION`, `VERSION`, `MT_ID`, `CLASS`, `SOURCE`, `MODULE_TYPE_ID`) VALUES (100427, 'Gallery', 'Gallery Plugin', 1, 100425, 'pgnGallery', 'gallery/pgn_gallery.php', 1);
INSERT INTO `modules` (`MODULE_ID`, `MODULE_NAME`, `DESCRIPTION`, `VERSION`, `MT_ID`, `CLASS`, `SOURCE`, `MODULE_TYPE_ID`) VALUES (100445, 'BulkImage', 'System-Extensions for importing images in archives.', 1, 0, 'pgnBulkImage', 'bulkimage/pgn_bulkimage.php', 3);
INSERT INTO `modules` (`MODULE_ID`, `MODULE_NAME`, `DESCRIPTION`, `VERSION`, `MT_ID`, `CLASS`, `SOURCE`, `MODULE_TYPE_ID`) VALUES (100606, 'Google Maps API', 'Google Maps API', 1, 100605, 'pgnGoogleMaps', 'googlemaps/pgn_googlemaps.php', 3);

-- --------------------------------------------------------

-- 
-- Table structure for table `pgn_adsense`
-- 

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
INSERT INTO `pgn_adsense` (`FKID`, `ADTEXT`, `IMPRESSIONS`, `CLICKS`) VALUES (100129, '&lt;script type=&quot;text/javascript&quot;&gt;&lt;!--\r\ngoogle_ad_client = &quot;pub-9320408685906498&quot;;\r\ngoogle_ad_width = 160;\r\ngoogle_ad_height = 600;\r\ngoogle_ad_format = &quot;160x600_as&quot;;\r\ngoogle_ad_type = &quot;text_image&quot;;\r\ngoogle_ad_channel =&quot;3676843672&quot;;\r\ngoogle_color_border = &quot;FFFFFF&quot;;\r\ngoogle_color_bg = &quot;FFFFFF&quot;;\r\ngoogle_color_link = &quot;990000&quot;;\r\ngoogle_color_text = &quot;333333&quot;;\r\ngoogle_color_url = &quot;999999&quot;;\r\n//--&gt;&lt;/script&gt;\r\n&lt;script type=&quot;text/javascript&quot;\r\n  src=&quot;http://pagead2.googlesyndication.com/pagead/show_ads.js&quot;&gt;\r\n&lt;/script&gt;', 0, 0);
INSERT INTO `pgn_adsense` (`FKID`, `ADTEXT`, `IMPRESSIONS`, `CLICKS`) VALUES (100127, '&lt;script type=&quot;text/javascript&quot;&gt;&lt;!--\r\ngoogle_ad_client = &quot;pub-9320408685906498&quot;;\r\ngoogle_ad_width = 125;\r\ngoogle_ad_height = 125;\r\ngoogle_ad_format = &quot;125x125_as_rimg&quot;;\r\ngoogle_cpa_choice = &quot;CAAQsdyWhAIaCMvLJa9eDHjiKJ_D93M&quot;;\r\ngoogle_ad_channel = &quot;3608138593&quot;;\r\n//--&gt;&lt;/script&gt;\r\n&lt;script type=&quot;text/javascript&quot; src=&quot;http://pagead2.googlesyndication.com/pagead/show_ads.js&quot;&gt;\r\n&lt;/script&gt;', 0, 0);
INSERT INTO `pgn_adsense` (`FKID`, `ADTEXT`, `IMPRESSIONS`, `CLICKS`) VALUES (100123, '&lt;script type=&quot;text/javascript&quot;&gt;&lt;!--\r\ngoogle_ad_client = &quot;pub-9320408685906498&quot;;\r\ngoogle_ad_width = 468;\r\ngoogle_ad_height = 60;\r\ngoogle_ad_format = &quot;468x60_as&quot;;\r\ngoogle_ad_type = &quot;text_image&quot;;\r\ngoogle_ad_channel =&quot;3676843672&quot;;\r\ngoogle_color_border = &quot;FFFFFF&quot;;\r\ngoogle_color_bg = &quot;FFFFFF&quot;;\r\ngoogle_color_link = &quot;990000&quot;;\r\ngoogle_color_text = &quot;333333&quot;;\r\ngoogle_color_url = &quot;999999&quot;;\r\n//--&gt;&lt;/script&gt;\r\n&lt;script type=&quot;text/javascript&quot;\r\n  src=&quot;http://pagead2.googlesyndication.com/pagead/show_ads.js&quot;&gt;\r\n&lt;/script&gt;', 0, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `pgn_boolean`
-- 

CREATE TABLE `pgn_boolean` (
  `FKID` bigint(20) NOT NULL default '0',
  `VALUE` int(1) NOT NULL default '0',
  PRIMARY KEY  (`FKID`),
  UNIQUE KEY `FKID` (`FKID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table `pgn_boolean`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `pgn_config_store`
-- 

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
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100111, 'head1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
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
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100401, 'head1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100400, 'h3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100399, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
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
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100064, 'head1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100135, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100139, 'head1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100140, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100163, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100172, 'head1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100173, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100168, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100184, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100283, 'head1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100280, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100281, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100278, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100276, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100429, 'head1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100564, 'head1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100616, 'head1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES (100720, 'head1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

-- 
-- Table structure for table `pgn_gallery`
-- 

CREATE TABLE `pgn_gallery` (
  `GALLERY_ID` bigint(20) NOT NULL default '0',
  `NAME` varchar(64) collate latin1_general_ci NOT NULL default '',
  `DESCRIPTION` varchar(255) collate latin1_general_ci default NULL,
  `IMAGE_FOLDER_ID` bigint(20) NOT NULL default '0',
  `COLS` tinyint(4) NOT NULL default '2',
  `ROWS` tinyint(4) NOT NULL default '4',
  `GALLERYTYPE` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`GALLERY_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- Dumping data for table `pgn_gallery`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `pgn_image`
-- 

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
INSERT INTO `pgn_image` (`FKID`, `FILENAME`, `ALT`, `WIDTH`, `HEIGHT`, `COPYRIGHT`) VALUES (100125, '100125.gif', 'Logo', 120, 60, '');

-- --------------------------------------------------------

-- 
-- Table structure for table `pgn_label`
-- 

CREATE TABLE `pgn_label` (
  `FKID` bigint(20) NOT NULL default '0',
  `CONTENT` varchar(255) default NULL,
  PRIMARY KEY  (`FKID`),
  UNIQUE KEY `FKID` (`FKID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `pgn_label`
-- 

INSERT INTO `pgn_label` (`FKID`, `CONTENT`) VALUES (100131, 'N/X Demohomepage -');
INSERT INTO `pgn_label` (`FKID`, `CONTENT`) VALUES (100133, 'N/X Demohomepage -');
INSERT INTO `pgn_label` (`FKID`, `CONTENT`) VALUES (100158, 'Welcome to N/X');
INSERT INTO `pgn_label` (`FKID`, `CONTENT`) VALUES (100177, 'News');
INSERT INTO `pgn_label` (`FKID`, `CONTENT`) VALUES (100199, 'Back to news Overview');

-- --------------------------------------------------------

-- 
-- Table structure for table `pgn_link`
-- 

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

INSERT INTO `pgn_link` (`FKID`, `LABEL`, `EXTERNAL`, `HREF`, `SPID`, `TARGET`) VALUES (100418, '', 0, NULL, NULL, NULL);
INSERT INTO `pgn_link` (`FKID`, `LABEL`, `EXTERNAL`, `HREF`, `SPID`, `TARGET`) VALUES (100421, '', 0, '', 100256, '');
INSERT INTO `pgn_link` (`FKID`, `LABEL`, `EXTERNAL`, `HREF`, `SPID`, `TARGET`) VALUES (100539, 'rssfeed', 0, '', 100415, '');
INSERT INTO `pgn_link` (`FKID`, `LABEL`, `EXTERNAL`, `HREF`, `SPID`, `TARGET`) VALUES (100544, '', 0, '', 100500, '');

-- --------------------------------------------------------

-- 
-- Table structure for table `pgn_text`
-- 

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


-- --------------------------------------------------------

-- 
-- Table structure for table `pot_accesslog`
-- 

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
INSERT INTO `registry` (`REGID`, `REGNAME`, `VALUE`, `PARENTREGID`) VALUES (100025, 'MENU', 'dropdownmenu/dc_dropdownmenu.php', 100024);
INSERT INTO `registry` (`REGID`, `REGNAME`, `VALUE`, `PARENTREGID`) VALUES (100026, 'COLORACTIVE', '#6699cc', 100025);
INSERT INTO `registry` (`REGID`, `REGNAME`, `VALUE`, `PARENTREGID`) VALUES (100027, 'COLORTACTIVE', '#cbe5ff', 100025);
INSERT INTO `registry` (`REGID`, `REGNAME`, `VALUE`, `PARENTREGID`) VALUES (100028, 'COLORSTACTIVE', '#ffffff', 100025);
INSERT INTO `registry` (`REGID`, `REGNAME`, `VALUE`, `PARENTREGID`) VALUES (100029, 'COLORINACTIVE', '#efefef', 100025);
INSERT INTO `registry` (`REGID`, `REGNAME`, `VALUE`, `PARENTREGID`) VALUES (100030, 'COLORTINACTIVE', '#0000ff', 100025);

-- --------------------------------------------------------

-- 
-- Table structure for table `role_sys_functions`
-- 

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

CREATE TABLE `sequences` (
  `seq` varchar(32) NOT NULL default '',
  `val` bigint(20) NOT NULL default '1000'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `sequences`
-- 

INSERT INTO `sequences` (`seq`, `val`) VALUES ('GUID', 100908);
INSERT INTO `sequences` (`seq`, `val`) VALUES ('log', 100082);

-- --------------------------------------------------------

-- 
-- Table structure for table `sessions`
-- 

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

INSERT INTO `sitemap` (`MENU_ID`, `PARENT_ID`, `SPM_ID`, `NAME`, `POSITION`, `IS_POPUP`, `DELETED`, `VERSION`, `IS_DISPLAYED`, `IS_CACHED`, `IS_LOCKED`, `CC_ON_LAUNCH`) VALUES (100180, 100042, 100170, 'News', 4, 0, 0, 10, 1, 1, 0, NULL);

-- --------------------------------------------------------

-- 
-- Table structure for table `sitepage`
-- 

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


-- --------------------------------------------------------

-- 
-- Table structure for table `sitepage_master`
-- 

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

INSERT INTO `sitepage_master` (`SPM_ID`, `NAME`, `DESCRIPTION`, `TEMPLATE_PATH`, `CLT_ID`, `SPMTYPE_ID`, `DELETED`, `THUMBNAIL`, `VERSION`) VALUES (100017, 'Text', '- Headline\r\n- HTML-Text', 'text.php', 100014, 1, 0, 'HTML_Page.png', 0);
INSERT INTO `sitepage_master` (`SPM_ID`, `NAME`, `DESCRIPTION`, `TEMPLATE_PATH`, `CLT_ID`, `SPMTYPE_ID`, `DELETED`, `THUMBNAIL`, `VERSION`) VALUES (100052, 'External Page', 'Opens a new window and displays the URL which is stored in the template.', 'external.php', 100050, 1, 0, 'Popup.png', 0);
INSERT INTO `sitepage_master` (`SPM_ID`, `NAME`, `DESCRIPTION`, `TEMPLATE_PATH`, `CLT_ID`, `SPMTYPE_ID`, `DELETED`, `THUMBNAIL`, `VERSION`) VALUES (100058, 'Sitemap', 'Draws a sitemap for your homepage.', 'sitemap.php', 100063, 1, 0, 'Sitemap.png', 0);
INSERT INTO `sitepage_master` (`SPM_ID`, `NAME`, `DESCRIPTION`, `TEMPLATE_PATH`, `CLT_ID`, `SPMTYPE_ID`, `DELETED`, `THUMBNAIL`, `VERSION`) VALUES (100079, 'Menu Separator', 'Use for creating menu-sections with no content. If the page is clicked, the system does an automatic forwarding to the first childpage.', 'separator.php', 100078, 1, 0, 'X.png', 0);
INSERT INTO `sitepage_master` (`SPM_ID`, `NAME`, `DESCRIPTION`, `TEMPLATE_PATH`, `CLT_ID`, `SPMTYPE_ID`, `DELETED`, `THUMBNAIL`, `VERSION`) VALUES (100137, 'Article Page', 'Special Template for displaying an article. Articles are grouped in channels. When you setup a channel, you can define a output page for each channel category. Output pages are based on this template', 'article.php', 100167, 1, 0, 'Article.png', 0);
INSERT INTO `sitepage_master` (`SPM_ID`, `NAME`, `DESCRIPTION`, `TEMPLATE_PATH`, `CLT_ID`, `SPMTYPE_ID`, `DELETED`, `THUMBNAIL`, `VERSION`) VALUES (100142, 'Article Overview', 'Displays a list with the selected articles from a channel. Use this template to create a overview page for News and other articles.', 'article_overview.php', 100138, 1, 0, 'Overview.png', 0);
INSERT INTO `sitepage_master` (`SPM_ID`, `NAME`, `DESCRIPTION`, `TEMPLATE_PATH`, `CLT_ID`, `SPMTYPE_ID`, `DELETED`, `THUMBNAIL`, `VERSION`) VALUES (100170, 'Article Overview', 'Displays a list with the selected articles from a channel. Use this template to create a overview page for News and other articles.', 'article_overview.php', 100171, 1, 0, NULL, 10);
INSERT INTO `sitepage_master` (`SPM_ID`, `NAME`, `DESCRIPTION`, `TEMPLATE_PATH`, `CLT_ID`, `SPMTYPE_ID`, `DELETED`, `THUMBNAIL`, `VERSION`) VALUES (100182, 'Article Page', 'Special Template for displaying an article. Articles are grouped in channels. When you setup a channel, you can define a output page for each channel category. Output pages are based on this template', 'article.php', 100183, 1, 0, NULL, 10);
INSERT INTO `sitepage_master` (`SPM_ID`, `NAME`, `DESCRIPTION`, `TEMPLATE_PATH`, `CLT_ID`, `SPMTYPE_ID`, `DELETED`, `THUMBNAIL`, `VERSION`) VALUES (100572, 'Contact (Send Email)', 'Contact form. The form is send to you by email.', 'contact.php', 100335, 1, 0, 'Form.png', 0);
INSERT INTO `sitepage_master` (`SPM_ID`, `NAME`, `DESCRIPTION`, `TEMPLATE_PATH`, `CLT_ID`, `SPMTYPE_ID`, `DELETED`, `THUMBNAIL`, `VERSION`) VALUES (100312, 'Contact  (Mailing System)', 'Contact form. The request are written to the database and can be anwered in E-Services/Mailings.', 'contact2.php', 100554, 1, 0, 'Form.png', 0);
INSERT INTO `sitepage_master` (`SPM_ID`, `NAME`, `DESCRIPTION`, `TEMPLATE_PATH`, `CLT_ID`, `SPMTYPE_ID`, `DELETED`, `THUMBNAIL`, `VERSION`) VALUES (100513, 'RSS Creator', 'Create a RSS-Feed out of a channel.', 'rss.php', 100511, 1, 0, 'XML.png', 0);
INSERT INTO `sitepage_master` (`SPM_ID`, `NAME`, `DESCRIPTION`, `TEMPLATE_PATH`, `CLT_ID`, `SPMTYPE_ID`, `DELETED`, `THUMBNAIL`, `VERSION`) VALUES (101212, 'RSS Reader', 'Load a RSS feed and display it on the homepage.', 'rssdisp.php', 101177, 1, 0, 'Overview2.png', 0);
INSERT INTO `sitepage_master` (`SPM_ID`, `NAME`, `DESCRIPTION`, `TEMPLATE_PATH`, `CLT_ID`, `SPMTYPE_ID`, `DELETED`, `THUMBNAIL`, `VERSION`) VALUES (100436, 'Gallery', 'Template for creating image galleries', 'gallery.php', 100428, 1, 0, 'Gallery.png', 0);
INSERT INTO `sitepage_master` (`SPM_ID`, `NAME`, `DESCRIPTION`, `TEMPLATE_PATH`, `CLT_ID`, `SPMTYPE_ID`, `DELETED`, `THUMBNAIL`, `VERSION`) VALUES (101182, 'Show In Frame', 'Use this template, to show the content of an URL in an embedded frame (iframe).', 'inline.php', 100560, 1, 0, 'IFrame.png', 0);
INSERT INTO `sitepage_master` (`SPM_ID`, `NAME`, `DESCRIPTION`, `TEMPLATE_PATH`, `CLT_ID`, `SPMTYPE_ID`, `DELETED`, `THUMBNAIL`, `VERSION`) VALUES (100639, 'Map', 'View a address with Google Maps.', 'map.php', 100612, 1, 0, 'Map.png', 0);
INSERT INTO `sitepage_master` (`SPM_ID`, `NAME`, `DESCRIPTION`, `TEMPLATE_PATH`, `CLT_ID`, `SPMTYPE_ID`, `DELETED`, `THUMBNAIL`, `VERSION`) VALUES (100743, 'Search Engine', 'This page implements a search engine in your website. You must run the spiders before you can use the integrated searchengine. Therefore go to Maintenance/Search Indexing.', 'search.php', 100716, 1, 0, 'Search.png', 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `sitepage_names`
-- 

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


-- --------------------------------------------------------

-- 
-- Table structure for table `sitepage_owner`
-- 

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

CREATE TABLE `sitepage_variations` (
  `SPM_ID` bigint(20) NOT NULL default '0',
  `VARIATION_ID` bigint(20) NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `sitepage_variations`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `state_translation`
-- 

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


-- --------------------------------------------------------

-- 
-- Table structure for table `syndication`
-- 

CREATE TABLE `syndication` (
  `IN_ID` bigint(20) NOT NULL default '0',
  `OUT_ID` bigint(20) NOT NULL default '0',
  `PROVIDER` varchar(32) NOT NULL default '',
  UNIQUE KEY `OUT_ID` (`OUT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `syndication`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `sys_functions`
-- 

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
INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES ('BULKIMAGE', 'PLUGINS_M', 'Bulk Image', 'Bulkimage Plugin');

-- --------------------------------------------------------

-- 
-- Table structure for table `temp_vars`
-- 

CREATE TABLE `temp_vars` (
  `NAME` varchar(128) NOT NULL default '',
  `USER_ID` varchar(16) NOT NULL default '',
  `VALUE` varchar(255) default NULL,
  PRIMARY KEY  (`NAME`,`USER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `temp_vars`
-- 

INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('pnode', '1', '100013');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('channels.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('channels.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('categories.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('categories.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('user_general.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('user_general.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('overview.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('overview.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('clt', '1', '100167');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('install.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('install.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('sitepage_master.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('sitepage_master.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('edit_template.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('edit_template.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('mid', '1', '0');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('sitepagebrowser.phpview', '1', '1');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('panelmenu', '1', '1x-1');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('menu', '1', '1x0');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('variations.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('variations.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('compound_groups.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('compound_groups.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('category.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('category.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('texts.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('texts.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('sdateview', '1', 'predefined');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('sitf', '1', 'today');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('sstartdate', '1', '2003-01-01');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('senddate', '1', '2010-01-01');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('chsel', '1', '100154');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('quickpanel', '1', '');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('edit.phpview', '1', '1');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('clusterbrowser.phpview', '1', '1');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('lastaction', '1', '0');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('metascheme.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('metascheme.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('meta.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('meta.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES ('linkset', '1', '');

-- --------------------------------------------------------

-- 
-- Table structure for table `tickets`
-- 

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

INSERT INTO `user_session` (`USER_ID`, `LAST_LOGIN`, `SESSION_ID`, `REMOTE_ADDRESS`) VALUES ('1', '2006-08-14 12:19:29', '34cd2d1e867ba26d9a02a0672d691fca', '127.0.0.1');

-- --------------------------------------------------------

-- 
-- Table structure for table `users`
-- 

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

INSERT INTO `users` (`USER_ID`, `USER_NAME`, `FULL_NAME`, `PASSWORD`, `EMAIL`, `ACTIVE`, `REGISTRATION_DATE`, `BACKEND_LANGUAGE`, `LANGID`, `USE_JAVASCRIPT`, `USE_AGENT`) VALUES (1, 'Administrator', 'Administrator', '7b7bc2512ee1fedcd76bdc68926d4f7b', 'pleaseEnterM@il', 1, '2006-08-11 11:49:09', 1, 'EN', 0, '0');

-- --------------------------------------------------------

-- 
-- Table structure for table `var_log`
-- 

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

INSERT INTO `variations` (`VARIATION_ID`, `NAME`, `SHORTTEXT`, `DESCRIPTION`, `DELETED`) VALUES (1, 'English', 'en', 'English language version of website', 0);
