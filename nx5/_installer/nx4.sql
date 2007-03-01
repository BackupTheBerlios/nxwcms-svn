-- phpMyAdmin SQL Dump
-- version 2.9.1.1
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Erstellungszeit: 01. März 2007 um 19:37
-- Server Version: 5.0.27
-- PHP-Version: 5.2.0
-- 
-- Datenbank: `nxhpnew`
-- 

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `acl_management`
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
-- Daten für Tabelle `acl_management`
-- 

INSERT INTO `acl_management` VALUES (1, 1, 0, 0, 0, 0, 1, NULL, NULL);
INSERT INTO `acl_management` VALUES (0, 0, 0, 0, 0, 0, 1, NULL, NULL);
INSERT INTO `acl_management` VALUES (100001, 0, 0, 0, 0, 1, 1, NULL, NULL);

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `acl_relations`
-- 

CREATE TABLE `acl_relations` (
  `GUID` bigint(20) NOT NULL default '0',
  `ACCESSOR_GUID` bigint(20) NOT NULL default '0',
  `ROLE_ID` bigint(20) NOT NULL default '0',
  KEY `ACCESSOR_GUID` (`ACCESSOR_GUID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Daten für Tabelle `acl_relations`
-- 

INSERT INTO `acl_relations` VALUES (1, 101587, 1);
INSERT INTO `acl_relations` VALUES (0, 101587, 1);

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `address`
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
-- Daten für Tabelle `address`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `categories`
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
-- Daten für Tabelle `categories`
-- 

INSERT INTO `categories` VALUES (100013, 'CStructures', 0, 0);
INSERT INTO `categories` VALUES (100012, 'CArticles', 0, 0);
INSERT INTO `categories` VALUES (100011, 'CPages', 0, 0);
INSERT INTO `categories` VALUES (100001, 'Header', 100000, 0);
INSERT INTO `categories` VALUES (100000, 'Layout', 0, 0);
INSERT INTO `categories` VALUES (100045, 'Sidebar', 100000, 0);
INSERT INTO `categories` VALUES (100893, 'test', 11, 0);
INSERT INTO `categories` VALUES (100960, 'Pictures', 0, 0);
INSERT INTO `categories` VALUES (101481, 'Ads', 0, 0);
INSERT INTO `categories` VALUES (101626, 'Menu', 0, 0);

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `categories_info`
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
-- Daten für Tabelle `categories_info`
-- 

INSERT INTO `categories_info` VALUES (100893, 1, 0, '', '', '', 0, '2006-08-13 20:04:49');

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `centerstage`
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
-- Daten für Tabelle `centerstage`
-- 

INSERT INTO `centerstage` VALUES (100149, 100154, NULL, 1, 999, NULL);
INSERT INTO `centerstage` VALUES (100179, 100154, NULL, 1, 999, NULL);
INSERT INTO `centerstage` VALUES (100225, NULL, NULL, 1, 3, NULL);
INSERT INTO `centerstage` VALUES (100242, 100154, NULL, 1, 50, NULL);
INSERT INTO `centerstage` VALUES (100248, 100154, NULL, 1, 50, NULL);
INSERT INTO `centerstage` VALUES (100419, NULL, NULL, 1, 3, NULL);
INSERT INTO `centerstage` VALUES (100511, NULL, NULL, 1, 3, NULL);
INSERT INTO `centerstage` VALUES (101091, 100154, NULL, 1, 50, NULL);

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `channel_articles`
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
-- Daten für Tabelle `channel_articles`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `channel_categories`
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
-- Daten für Tabelle `channel_categories`
-- 

INSERT INTO `channel_categories` VALUES (100155, 100154, 101099, 'General News');

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `channel_cluster_templates`
-- 

CREATE TABLE `channel_cluster_templates` (
  `CHID` bigint(20) NOT NULL default '0',
  `CLT_ID` bigint(20) NOT NULL default '0',
  `POSITION` bigint(20) NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Daten für Tabelle `channel_cluster_templates`
-- 

INSERT INTO `channel_cluster_templates` VALUES (100154, 100134, 1);

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `channels`
-- 

CREATE TABLE `channels` (
  `CHID` bigint(20) NOT NULL default '0',
  `NAME` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`CHID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Daten für Tabelle `channels`
-- 

INSERT INTO `channels` VALUES (100154, 'News');

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `cluster_content`
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
-- Daten für Tabelle `cluster_content`
-- 

INSERT INTO `cluster_content` VALUES (100179, 100176, 100174, 1, '', 100179, 0);
INSERT INTO `cluster_content` VALUES (100178, 100176, 100173, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100177, 100176, 100172, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100199, 100198, 100184, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102334, 102331, 100399, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102333, 102331, 100400, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102332, 102331, 100401, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102305, 102303, 100035, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102304, 102303, 100036, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102298, 102296, 100035, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102297, 102296, 100036, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102288, 102286, 100035, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102287, 102286, 100036, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102144, 102142, 100016, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102143, 102142, 100015, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102047, 102045, 100016, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102046, 102045, 100015, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102030, 102028, 100016, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102029, 102028, 100015, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101963, 101961, 101938, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101962, 101961, 101936, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101957, 101955, 101938, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101956, 101955, 101936, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101951, 101949, 101938, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101950, 101949, 101936, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101942, 101940, 101938, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101941, 101940, 101936, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101847, 101845, 101782, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101846, 101845, 101796, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101838, 101836, 101782, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101837, 101836, 101796, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101829, 101827, 101782, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101828, 101827, 101796, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101820, 101818, 101782, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101819, 101818, 101796, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101507, 101504, 101502, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101506, 101504, 101501, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101505, 101504, 101500, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101416, 101413, 101356, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101415, 101413, 101354, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101414, 101413, 101352, 1, '', 0, 0);

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `cluster_node`
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
-- Daten für Tabelle `cluster_node`
-- 

INSERT INTO `cluster_node` VALUES (102330, 101177, 'Development Blog', 0, 0);
INSERT INTO `cluster_node` VALUES (102302, 100033, 'Highlights', 0, 10);
INSERT INTO `cluster_node` VALUES (102295, 100033, 'Introduction to CMS', 0, 10);
INSERT INTO `cluster_node` VALUES (102285, 100033, 'API to Google Maps', 0, 10);
INSERT INTO `cluster_node` VALUES (100175, 100171, 'News', 0, 10);
INSERT INTO `cluster_node` VALUES (100197, 100183, 'Articles', 0, 10);
INSERT INTO `cluster_node` VALUES (102141, 100014, 'API to Google Maps', 0, 0);
INSERT INTO `cluster_node` VALUES (102044, 100014, 'Highlights', 0, 0);
INSERT INTO `cluster_node` VALUES (101960, 101935, 'PHP Classes', 0, 10);
INSERT INTO `cluster_node` VALUES (101954, 101935, 'Developer Ressources', 0, 10);
INSERT INTO `cluster_node` VALUES (102027, 100014, 'Introduction to CMS', 0, 0);
INSERT INTO `cluster_node` VALUES (101948, 101935, 'Information Center', 0, 10);
INSERT INTO `cluster_node` VALUES (101939, 101935, 'Evaluation', 0, 10);
INSERT INTO `cluster_node` VALUES (101844, 101776, 'PHP Classes', 0, 0);
INSERT INTO `cluster_node` VALUES (101835, 101776, 'Developer Ressources', 0, 0);
INSERT INTO `cluster_node` VALUES (101826, 101776, 'Evaluation', 0, 0);
INSERT INTO `cluster_node` VALUES (101817, 101776, 'Information Center', 0, 0);
INSERT INTO `cluster_node` VALUES (101721, 100033, 'Disclaimer', 0, 10);
INSERT INTO `cluster_node` VALUES (101717, 100110, 'Sitemap', 0, 10);
INSERT INTO `cluster_node` VALUES (101710, 101691, 'Contact', 0, 10);
INSERT INTO `cluster_node` VALUES (101686, 100104, 'Servicepages', 0, 10);
INSERT INTO `cluster_node` VALUES (101588, 100014, 'Disclaimer', 0, 0);
INSERT INTO `cluster_node` VALUES (101581, 100063, 'Sitemap', 0, 0);
INSERT INTO `cluster_node` VALUES (101574, 100554, 'Contact', 0, 0);
INSERT INTO `cluster_node` VALUES (101564, 100078, 'Servicepages', 0, 0);
INSERT INTO `cluster_node` VALUES (101412, 101348, 'Start', 0, 0);
INSERT INTO `cluster_node` VALUES (101503, 101496, 'Start', 0, 10);

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `cluster_template_item_types`
-- 

CREATE TABLE `cluster_template_item_types` (
  `CLTITYPE_ID` tinyint(4) NOT NULL default '0',
  `NAME` varchar(32) NOT NULL default '',
  `DESCRIPTION` varchar(255) default NULL,
  PRIMARY KEY  (`CLTITYPE_ID`),
  UNIQUE KEY `CLTITYPE_ID` (`CLTITYPE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Daten für Tabelle `cluster_template_item_types`
-- 

INSERT INTO `cluster_template_item_types` VALUES (1, '5. Static Content', 'Standard input-fields. Static content is defined once for all objects of a class. So all objects have the same content (static content).');
INSERT INTO `cluster_template_item_types` VALUES (2, '1. Content', 'Contents are standard input fields. Authors can fill content in these fields. (e.g. textfields, HTML-Fields, ....)');
INSERT INTO `cluster_template_item_types` VALUES (3, '6. Static Object-Link', 'Objects can be linked with others. For example you may want to link an object "engine" with an object "car". Static object links are the same for all objects of an class.');
INSERT INTO `cluster_template_item_types` VALUES (4, '2. Object Link', 'Objects can be linked with others. For example you may want to link an object "engine" with an object "car".');
INSERT INTO `cluster_template_item_types` VALUES (5, '3. Library Content', 'This field allows to link content from the Library. This is the prefered placeholder for images, flash-films ....');
INSERT INTO `cluster_template_item_types` VALUES (6, '7. Layout-Object Link', 'Layout objects are objects which are based on a class having its own layout defined. This placeholder is about the same as the Object-Link, except there must be the layout.');
INSERT INTO `cluster_template_item_types` VALUES (7, '8. Object Group Link', 'This placeholder makes the content of object-groups accessible. Object-Groubs are defined in Templates/Object Groups');
INSERT INTO `cluster_template_item_types` VALUES (8, '4. Channel Link', 'Use this placeholder, if you want to access articles from channels on your webpage.');

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `cluster_template_items`
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
-- Daten für Tabelle `cluster_template_items`
-- 

INSERT INTO `cluster_template_items` VALUES (100015, 100014, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100016, 100014, 'Body', 2, 1, 1, 100024, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100051, 100050, 'URL', 1, 1, 1, 0, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100064, 100063, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100065, 100063, 'Commented Sitemap', 2, 1, 1, 100062, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (101709, 101691, 'Mailbody', 4, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (101705, 101691, 'Trouble Email', 17, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (101502, 101496, 'Image', 1, 1, 1, 100012, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100135, 100134, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100136, 100134, 'Body', 2, 1, 1, 100024, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100139, 100138, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100140, 100138, 'Body', 2, 1, 1, 100024, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100141, 100138, 'Articles', 3, 1, 1, 1, 8, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100168, 100167, 'Backlink Title', 1, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100174, 100171, 'Articles', 3, 1, 1, 1, 8, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100173, 100171, 'Body', 2, 1, 1, 100024, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100172, 100171, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100184, 100183, 'Backlink Title', 1, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (101708, 101691, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (101501, 101496, 'BodyText', 2, 1, 1, 100024, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100267, 100554, 'Body', 3, 1, 1, 100024, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100268, 100554, 'Name', 5, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100269, 100554, 'Christian Name', 6, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100270, 100554, 'Street', 7, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100271, 100554, 'ZIP', 8, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100272, 100554, 'City', 9, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100273, 100554, 'TEL', 10, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100274, 100554, 'FAX', 11, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100275, 100554, 'E-Mail', 12, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100276, 100554, 'Submit', 13, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100277, 100554, 'Reset', 14, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100278, 100554, 'Success', 15, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100279, 100554, 'Validation', 16, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100280, 100554, 'Trouble Email', 17, 1, 1, 100018, 2, 1, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100281, 100554, 'Category', 18, 1, 1, 100018, 2, 1, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100282, 100554, 'Subject', 2, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100283, 100554, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100284, 100554, 'Mailbody', 4, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100336, 100335, 'Body', 5, 1, 1, 100024, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100337, 100335, 'Name', 6, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100338, 100335, 'Christian Name', 7, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100339, 100335, 'Street', 8, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100340, 100335, 'ZIP', 9, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100341, 100335, 'City', 10, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100342, 100335, 'TEL', 11, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100343, 100335, 'FAX', 12, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100344, 100335, 'E-Mail', 13, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100345, 100335, 'SUBMIT', 14, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100346, 100335, 'Reset', 15, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100347, 100335, 'success', 16, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100348, 100335, 'Validation', 17, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100349, 100335, 'EMail Recipient', 18, 1, 1, 100018, 2, 1, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100350, 100335, 'EMail Subject', 19, 1, 1, 100018, 2, 1, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100351, 100335, 'Subject', 3, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100352, 100335, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100353, 100335, 'Mailbody', 4, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100487, 100511, 'Feedname', 4, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100399, 101177, 'Address', 3, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100400, 101177, 'Body', 2, 1, 1, 100024, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100401, 101177, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100402, 100511, 'Channel', 3, 1, 1, 1, 8, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100429, 100428, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100430, 100428, 'Body', 2, 1, 1, 100024, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100431, 100428, 'Gallery', 3, 1, 1, 100427, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100454, 100511, 'Feed Title', 1, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100456, 100511, 'Feed Description', 2, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (101500, 101496, 'SideTeaser', 3, 1, 1, 101385, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (101356, 101348, 'SideTeaser', 3, 1, 1, 101385, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (101354, 101348, 'BodyText', 2, 1, 1, 100024, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (101352, 101348, 'Image', 1, 1, 1, 100012, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100564, 100560, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100566, 100560, 'Body', 2, 1, 1, 100024, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100568, 100560, 'URL', 3, 1, 1, 0, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100616, 100612, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100618, 100612, 'Body', 2, 1, 1, 100024, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100620, 100612, 'Address', 3, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100622, 100612, 'ShowControls', 4, 1, 1, 100062, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100645, 100612, 'Google-API-Key', 6, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100647, 100612, 'Address Description', 5, 1, 1, 100024, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100720, 100716, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100722, 100716, 'Body', 2, 1, 1, 100024, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100724, 100716, 'Search Button', 3, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100726, 100716, 'No Results Text', 4, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (101707, 101691, 'Subject', 2, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (101706, 101691, 'Category', 18, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (101704, 101691, 'Validation', 16, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (101703, 101691, 'Success', 15, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (101702, 101691, 'Reset', 14, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (101701, 101691, 'Submit', 13, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (101700, 101691, 'E-Mail', 12, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (101699, 101691, 'FAX', 11, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (101698, 101691, 'TEL', 10, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (101697, 101691, 'City', 9, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100111, 100110, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100112, 100110, 'Commented Sitemap', 2, 1, 1, 100062, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100035, 100033, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (101696, 101691, 'ZIP', 8, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (101695, 101691, 'Street', 7, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100036, 100033, 'Body', 2, 1, 1, 100024, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (101693, 101691, 'Name', 5, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (101782, 101776, 'Body', 2, 1, 1, 100024, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (101784, 101776, 'Teaser', 3, 0, 15, 101385, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (101796, 101776, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (101938, 101935, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (101937, 101935, 'Teaser', 3, 0, 15, 101385, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (101936, 101935, 'Body', 2, 1, 1, 100024, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (101694, 101691, 'Christian Name', 6, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (101692, 101691, 'Body', 3, 1, 1, 100024, 2, 0, 0, 10);

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `cluster_templates`
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
  `IS_SHOP_PRODUCT` tinyint(4) default '0',
  `IS_SHOP_CATEGORY` tinyint(4) default '0',
  PRIMARY KEY  (`CLT_ID`),
  UNIQUE KEY `CLT_ID` (`CLT_ID`),
  KEY `MT_ID` (`MT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Daten für Tabelle `cluster_templates`
-- 

INSERT INTO `cluster_templates` VALUES (100014, 100432, 100011, 'Text', '', 0, '', 0, 0, 0, 0);
INSERT INTO `cluster_templates` VALUES (100050, 100432, 100011, 'URL', 'Stores an URL only', 0, '', 0, 0, 0, 0);
INSERT INTO `cluster_templates` VALUES (100063, 2, 100011, 'Sitemap', 'Class for building sitemap pages', 0, '', 0, 0, 0, 0);
INSERT INTO `cluster_templates` VALUES (100078, 2, 100011, 'Empty', 'Empty Class with no content.', 0, '', 0, 0, 0, 0);
INSERT INTO `cluster_templates` VALUES (101935, 101497, 100011, 'Overview', '', 0, '', 0, 10, 0, 0);
INSERT INTO `cluster_templates` VALUES (101776, 100432, 100011, 'Overview', '', 0, '', 0, 0, 0, 0);
INSERT INTO `cluster_templates` VALUES (100134, 2, 100012, 'Text Article', 'Standard article with Headline and Body.', 1, 'echo &#039;&lt;span class=&quot;head1&quot;&gt;&#039;.$me-&gt;content-&gt;get(&quot;Headline&quot;).&#039;&lt;/span&gt;&#039;;\r\nbr();\r\necho $me-&gt;content-&gt;get(&quot;Body&quot;);', 0, 0, 0, 0);
INSERT INTO `cluster_templates` VALUES (100138, 100432, 100011, 'Articles Overview', 'Wrapper Class for showing the overview of a channel.', 0, '', 0, 0, 0, 0);
INSERT INTO `cluster_templates` VALUES (100167, 100432, 100011, 'Article Page', '', 0, '', 0, 0, 0, 0);
INSERT INTO `cluster_templates` VALUES (100171, 100034, 100011, 'Articles Overview', 'Wrapper Class for showing the overview of a channel.', 0, '', 0, 10, 0, 0);
INSERT INTO `cluster_templates` VALUES (100183, 100034, 100011, 'Article Page', '', 0, '', 0, 10, 0, 0);
INSERT INTO `cluster_templates` VALUES (100104, 100034, 100011, 'Empty', 'Empty Class with no content.', 0, '', 0, 10, 0, 0);
INSERT INTO `cluster_templates` VALUES (101691, 101497, 100011, 'Contact  (Mailing System)', '', 0, '', 0, 10, 0, 0);
INSERT INTO `cluster_templates` VALUES (100110, 100034, 100011, 'Sitemap', 'Class for building sitemap pages', 0, '', 0, 10, 0, 0);
INSERT INTO `cluster_templates` VALUES (100554, 100432, 100011, 'Contact  (Mailing System)', '', 0, '', 0, 0, 0, 0);
INSERT INTO `cluster_templates` VALUES (100335, 100432, 100011, 'Contact (Email)', '', 0, '', 0, 0, 0, 0);
INSERT INTO `cluster_templates` VALUES (100511, 2, 100011, 'RSS Creator', '', 0, '', 0, 0, 0, 0);
INSERT INTO `cluster_templates` VALUES (101177, 100432, 100011, 'RSS Reader', '', 0, '', 0, 0, 0, 0);
INSERT INTO `cluster_templates` VALUES (100428, 100432, 100011, 'Gallery', 'Class which is used to build a Gallery', 0, '', 0, 0, 0, 0);
INSERT INTO `cluster_templates` VALUES (101496, 101497, 100011, 'Startpage', '', 0, '', 0, 10, 0, 0);
INSERT INTO `cluster_templates` VALUES (100560, 2, 100011, 'Internal Frame', '', 0, '', 0, 0, 0, 0);
INSERT INTO `cluster_templates` VALUES (100612, 100432, 100011, 'Map Page', '', 0, '', 0, 0, 0, 0);
INSERT INTO `cluster_templates` VALUES (100716, 2, 100011, 'Search engine', 'Content definition for the search page.', 0, '', 0, 0, 0, 0);
INSERT INTO `cluster_templates` VALUES (100033, 101497, 100011, 'Text', '', 0, '', 0, 10, 0, 0);
INSERT INTO `cluster_templates` VALUES (101348, 100432, 100011, 'Startpage', '', 0, '', 0, 0, 0, 0);

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `cluster_variations`
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
-- Daten für Tabelle `cluster_variations`
-- 

INSERT INTO `cluster_variations` VALUES (100175, 1, 100176, 0, 20060811140730, 20060811140431, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (100197, 1, 100198, 0, 20060811150340, 20060811150326, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102302, 1, 102303, 0, 20070118234147, 20070118234125, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102295, 1, 102296, 0, 20070118234111, 20070118234020, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102285, 1, 102286, 0, 20070214183749, 20070212185526, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102141, 1, 102142, 0, 20070214183749, 20070212185526, 'Administrator', 'Administrator', 20070214193504, 'Administrator');
INSERT INTO `cluster_variations` VALUES (102044, 1, 102045, 0, 20070118234147, 20070118234125, 'Administrator', 'Administrator', 20070214192649, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101960, 1, 101961, 0, NULL, 20070116195026, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (101954, 1, 101955, 0, NULL, 20070116195008, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (101948, 1, 101949, 0, 20070116195051, 20070116194933, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (101939, 1, 101940, 0, NULL, 20070116194950, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102027, 1, 102028, 0, 20070118234111, 20070118234020, 'Administrator', 'Administrator', 20070214192649, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101835, 1, 101836, 0, NULL, 20070116195008, NULL, 'Administrator', 20070214192649, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101826, 1, 101827, 0, NULL, 20070116194950, NULL, 'Administrator', 20070214192649, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101817, 1, 101818, 0, 20070116195051, 20070116194933, 'Administrator', 'Administrator', 20070214192649, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101721, 1, 101722, 0, NULL, 20070115183653, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (101717, 1, 101718, 0, NULL, 20070115183627, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (101710, 1, 101711, 0, NULL, 20070115183604, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (101686, 1, 101687, 0, NULL, 20070115183540, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (101588, 1, 101589, 0, NULL, 20070115183653, NULL, 'Administrator', 20070214192649, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101581, 1, 101582, 0, NULL, 20070115183627, NULL, 'Administrator', 20070214192649, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101574, 1, 101575, 0, NULL, 20070115183604, NULL, 'Administrator', 20070214192649, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101564, 1, 101565, 0, NULL, 20070115183540, NULL, 'Administrator', 20070214192649, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101503, 1, 101504, 0, 20070116195405, 20070114121954, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (101412, 1, 101413, 0, 20070116195405, 20070114121954, 'Administrator', 'Administrator', 20070214192649, 'Administrator');
INSERT INTO `cluster_variations` VALUES (102330, 1, 102331, 0, 20070215185807, 20070215185226, 'Administrator', 'Administrator', NULL, NULL);
INSERT INTO `cluster_variations` VALUES (101844, 1, 101845, 0, NULL, 20070116195026, NULL, 'Administrator', 20070214192649, 'Administrator');

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `compound_group_members`
-- 

CREATE TABLE `compound_group_members` (
  `CGID` bigint(20) NOT NULL default '0',
  `CGMID` bigint(20) NOT NULL default '0',
  `POSITION` bigint(20) NOT NULL default '0',
  KEY `CGMID` (`CGMID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Daten für Tabelle `compound_group_members`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `compound_groups`
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
-- Daten für Tabelle `compound_groups`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `content`
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
-- Daten für Tabelle `content`
-- 

INSERT INTO `content` VALUES (101662, 101617, 101626, 100034, 'menu4', 'Menu4', '', '', '2007-01-16 22:28:19', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (101657, 101617, 101626, 2, 'menu4', 'Menu4', '', '', '2007-01-15 19:54:07', '2007-01-15 19:53:49', 'Administrator', 0, 0);
INSERT INTO `content` VALUES (101653, 101617, 101626, 100034, 'menu3', 'menu3', '', '', '2007-01-15 19:54:16', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (101860, 100012, 101626, 2, 'icon1', 'Icon1', '', '', '2007-01-16 22:00:17', '2007-01-16 22:00:07', 'Administrator', 0, 0);
INSERT INTO `content` VALUES (100126, 100007, 100045, 100034, 'side2', 'side2', '', '', '2006-08-11 15:07:14', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (100124, 100012, 100001, 100034, 'Logo', 'Logo', '', '', '2006-08-11 15:07:09', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (100132, 100018, 100001, 100034, 'homepagetitle', 'Homepage Title', '', '', '2007-02-11 10:08:13', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (100130, 100018, 100001, 2, 'homepagetitle', 'Homepage Title', '', '', '2006-08-11 11:24:11', '2006-08-11 11:23:43', 'Administrator', 0, 0);
INSERT INTO `content` VALUES (100122, 100007, 100001, 100034, 'Banner1', 'Banner', '', '', '2006-08-11 15:07:05', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (100128, 100007, 100045, 100034, 'side1', 'SideAd1', '', '', '2006-08-11 15:07:16', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (100538, 100048, 100001, 2, 'rssfeed', 'Standard RSS Feed', '', '', '2006-08-13 12:58:23', '2006-08-13 12:58:15', 'Administrator', 0, 0);
INSERT INTO `content` VALUES (100543, 100048, 100001, 100034, 'rssfeed', 'Standard RSS Feed', '', '', '2006-08-13 12:58:29', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (101644, 101617, 101626, 100034, 'menu1', 'Menu1', '', '', '2007-01-16 22:28:23', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (101641, 101617, 101626, 100034, 'menu2', 'Menu2', '', '', '2007-01-15 19:59:51', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (101629, 101617, 101626, 2, 'menu1', 'Menu1', '', '', '2007-01-15 19:51:40', '2007-01-15 19:51:16', 'Administrator', 0, 0);
INSERT INTO `content` VALUES (101600, 100018, 100000, 100034, 'footertext', 'footertext', '', '', '2007-01-15 21:54:12', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (101595, 100018, 100000, 2, 'footertext', 'footertext', '', '', '2007-01-15 18:42:15', '2007-01-15 18:41:43', 'Administrator', 0, 0);
INSERT INTO `content` VALUES (101489, 100007, 101481, 100034, 'adfooter', 'AdFooter', '', '', '2007-01-18 20:22:46', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (101484, 100007, 101481, 2, 'adfooter', 'AdFooter', '', '', '2007-01-14 19:19:31', '2007-01-14 19:19:24', 'Administrator', 0, 0);
INSERT INTO `content` VALUES (101464, 100012, 100000, 100034, 'pfeil', 'Pfeil', '', '', '2007-01-15 20:07:25', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (101459, 100012, 100000, 2, 'pfeil', 'Pfeil', '', '', '2007-01-14 18:56:01', '2007-01-14 18:53:59', 'Administrator', 0, 0);
INSERT INTO `content` VALUES (101648, 101617, 101626, 2, 'menu3', 'menu3', '', '', '2007-01-15 19:53:35', '2007-01-15 19:53:08', 'Administrator', 0, 0);
INSERT INTO `content` VALUES (101636, 101617, 101626, 2, 'menu2', 'Menu2', '', '', '2007-01-15 19:52:53', '2007-01-15 19:52:27', 'Administrator', 0, 0);
INSERT INTO `content` VALUES (101866, 100012, 101626, 2, 'icon2', 'Icon2', '', '', '2007-01-16 22:00:34', '2007-01-16 22:00:26', 'Administrator', 0, 0);
INSERT INTO `content` VALUES (101872, 100012, 101626, 2, 'icon3', 'Icon3', '', '', '2007-01-16 22:00:54', '2007-01-16 22:00:44', 'Administrator', 0, 0);
INSERT INTO `content` VALUES (101878, 100012, 101626, 2, 'icon4', 'Icon4', '', '', '2007-01-16 22:01:16', '2007-01-16 22:01:08', 'Administrator', 0, 0);
INSERT INTO `content` VALUES (101887, 100012, 101626, 2, 'icon5', 'Icon5', '', '', '2007-01-16 22:12:26', '2007-01-16 22:02:44', 'Administrator', 0, 0);
INSERT INTO `content` VALUES (101910, 100012, 101626, 100034, 'icon1', 'Icon1', '', '', '2007-01-19 19:23:11', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (101913, 100012, 101626, 100034, 'icon2', 'Icon2', '', '', '2007-01-19 19:23:21', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (101916, 100012, 101626, 100034, 'icon3', 'Icon3', '', '', '2007-01-19 19:23:31', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (101919, 100012, 101626, 100034, 'icon4', 'Icon4', '', '', '2007-01-19 19:23:43', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (101922, 100012, 101626, 100034, 'icon5', 'Icon5', '', '', '2007-01-19 19:23:54', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (102002, 100007, 101481, 2, 'adside', 'Ad Side', '', '', '2007-01-18 20:22:42', '2007-01-18 20:22:35', 'Administrator', 0, 0);
INSERT INTO `content` VALUES (102070, 102064, 101481, 2, 'search', 'Search', '', '', '2007-01-19 18:30:53', '2007-01-19 18:30:42', 'Administrator', 0, 0);
INSERT INTO `content` VALUES (102075, 102064, 101481, 100034, 'search', 'Search', '', '', '2007-02-14 19:26:28', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (102122, 100018, 100001, 2, 'keywords', 'Keywords', '', '', '2007-02-11 10:13:01', '2007-02-11 10:08:52', 'Administrator', 0, 0);
INSERT INTO `content` VALUES (102127, 100018, 100001, 100034, 'keywords', 'Keywords', '', '', '2007-02-11 10:13:04', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (102269, 100012, 100960, 2, 'gmap', 'Google Maps API', '', '', '2007-02-14 18:31:15', '2007-02-14 18:19:42', 'Administrator', 0, 0);
INSERT INTO `content` VALUES (102318, 100012, 100000, 102319, 'pfeil', 'Pfeil', '', '', '2007-02-14 19:35:03', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (102321, 100012, 100960, 100034, 'gmap', 'Google Maps API', '', '', '2007-02-14 19:35:03', '0000-00-00 00:00:00', 'Administrator', 0, 10);

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `content_variations`
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
-- Daten für Tabelle `content_variations`
-- 

INSERT INTO `content_variations` VALUES (101919, 1, 101920, 0);
INSERT INTO `content_variations` VALUES (101916, 1, 101917, 0);
INSERT INTO `content_variations` VALUES (101913, 1, 101914, 0);
INSERT INTO `content_variations` VALUES (101910, 1, 101911, 0);
INSERT INTO `content_variations` VALUES (100128, 1, 100129, 0);
INSERT INTO `content_variations` VALUES (100126, 1, 100127, 0);
INSERT INTO `content_variations` VALUES (100124, 1, 100125, 0);
INSERT INTO `content_variations` VALUES (100132, 1, 100133, 0);
INSERT INTO `content_variations` VALUES (100130, 1, 100131, 0);
INSERT INTO `content_variations` VALUES (100122, 1, 100123, 0);
INSERT INTO `content_variations` VALUES (100538, 1, 100539, 0);
INSERT INTO `content_variations` VALUES (100543, 1, 100544, 0);
INSERT INTO `content_variations` VALUES (101887, 1, 101888, 0);
INSERT INTO `content_variations` VALUES (101878, 1, 101879, 0);
INSERT INTO `content_variations` VALUES (101872, 1, 101873, 0);
INSERT INTO `content_variations` VALUES (101866, 1, 101867, 0);
INSERT INTO `content_variations` VALUES (101860, 1, 101861, 0);
INSERT INTO `content_variations` VALUES (101662, 1, 101663, 0);
INSERT INTO `content_variations` VALUES (101657, 1, 101658, 0);
INSERT INTO `content_variations` VALUES (101653, 1, 101654, 0);
INSERT INTO `content_variations` VALUES (101648, 1, 101649, 0);
INSERT INTO `content_variations` VALUES (101644, 1, 101645, 0);
INSERT INTO `content_variations` VALUES (101641, 1, 101642, 0);
INSERT INTO `content_variations` VALUES (101636, 1, 101637, 0);
INSERT INTO `content_variations` VALUES (101629, 1, 101630, 0);
INSERT INTO `content_variations` VALUES (101600, 1, 101601, 0);
INSERT INTO `content_variations` VALUES (101595, 1, 101596, 0);
INSERT INTO `content_variations` VALUES (101489, 1, 101490, 0);
INSERT INTO `content_variations` VALUES (101484, 1, 101485, 0);
INSERT INTO `content_variations` VALUES (101464, 1, 101465, 0);
INSERT INTO `content_variations` VALUES (101459, 1, 101460, 0);
INSERT INTO `content_variations` VALUES (101922, 1, 101923, 0);
INSERT INTO `content_variations` VALUES (102002, 1, 102003, 0);
INSERT INTO `content_variations` VALUES (102070, 1, 102071, 0);
INSERT INTO `content_variations` VALUES (102075, 1, 102076, 0);
INSERT INTO `content_variations` VALUES (102122, 1, 102123, 0);
INSERT INTO `content_variations` VALUES (102127, 1, 102128, 0);
INSERT INTO `content_variations` VALUES (102269, 1, 102270, 0);
INSERT INTO `content_variations` VALUES (102318, 1, 102320, 0);
INSERT INTO `content_variations` VALUES (102321, 1, 102322, 0);

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `dig_clicks`
-- 

CREATE TABLE `dig_clicks` (
  `c_num` mediumint(9) NOT NULL default '0',
  `c_url` varchar(255) collate latin1_general_ci NOT NULL default '',
  `c_val` varchar(255) collate latin1_general_ci NOT NULL default '',
  `c_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- Daten für Tabelle `dig_clicks`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `dig_engine`
-- 

CREATE TABLE `dig_engine` (
  `spider_id` mediumint(9) NOT NULL default '0',
  `key_id` mediumint(9) NOT NULL default '0',
  `weight` smallint(4) NOT NULL default '0',
  KEY `key_id` (`key_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- Daten für Tabelle `dig_engine`
-- 

INSERT INTO `dig_engine` VALUES (1, 1, 1);
INSERT INTO `dig_engine` VALUES (1, 2, 1);
INSERT INTO `dig_engine` VALUES (1, 3, 1);
INSERT INTO `dig_engine` VALUES (1, 4, 1);

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `dig_excludes`
-- 

CREATE TABLE `dig_excludes` (
  `ex_id` mediumint(11) NOT NULL auto_increment,
  `ex_site_id` mediumint(9) NOT NULL default '0',
  `ex_path` text collate latin1_general_ci NOT NULL,
  PRIMARY KEY  (`ex_id`),
  KEY `ex_site_id` (`ex_site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- 
-- Daten für Tabelle `dig_excludes`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `dig_includes`
-- 

CREATE TABLE `dig_includes` (
  `in_id` mediumint(11) NOT NULL auto_increment,
  `in_site_id` mediumint(9) NOT NULL default '0',
  `in_path` text collate latin1_general_ci NOT NULL,
  PRIMARY KEY  (`in_id`),
  KEY `in_site_id` (`in_site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- 
-- Daten für Tabelle `dig_includes`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `dig_keywords`
-- 

CREATE TABLE `dig_keywords` (
  `key_id` int(9) NOT NULL auto_increment,
  `twoletters` char(2) collate latin1_general_ci NOT NULL default '',
  `keyword` varchar(64) collate latin1_general_ci NOT NULL default '',
  PRIMARY KEY  (`key_id`),
  UNIQUE KEY `keyword` (`keyword`),
  KEY `twoletters` (`twoletters`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=5 ;

-- 
-- Daten für Tabelle `dig_keywords`
-- 

INSERT INTO `dig_keywords` VALUES (1, 'ho', 'home');
INSERT INTO `dig_keywords` VALUES (2, 'ti', 'title');
INSERT INTO `dig_keywords` VALUES (3, 'pa', 'page');
INSERT INTO `dig_keywords` VALUES (4, 'de', 'demotext');

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `dig_logs`
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=8 ;

-- 
-- Daten für Tabelle `dig_logs`
-- 

INSERT INTO `dig_logs` VALUES (1, 'sven', '', 0, 'a', '2006-08-13 17:08:25', 0);
INSERT INTO `dig_logs` VALUES (2, 'sven', '', 0, 'a', '2006-08-13 17:10:31', 0);
INSERT INTO `dig_logs` VALUES (3, 'sven', '', 0, 'a', '2006-08-13 17:10:34', 0);
INSERT INTO `dig_logs` VALUES (4, 'sven', '', 0, 'a', '2006-08-13 17:10:35', 0);
INSERT INTO `dig_logs` VALUES (5, '', '', 0, 'a', '2006-08-13 17:10:58', 0);
INSERT INTO `dig_logs` VALUES (6, 'home', '', 1, 'a', '2006-08-13 17:12:26', 0.01);
INSERT INTO `dig_logs` VALUES (7, 'hello', '', 0, 'a', '2006-08-15 21:53:24', 0);

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `dig_site_page`
-- 

CREATE TABLE `dig_site_page` (
  `site_id` int(4) NOT NULL default '0',
  `days` int(4) NOT NULL default '0',
  `links` int(4) NOT NULL default '5',
  `depth` int(4) NOT NULL default '5',
  PRIMARY KEY  (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- Daten für Tabelle `dig_site_page`
-- 

INSERT INTO `dig_site_page` VALUES (1, 0, 0, 20);

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `dig_sites`
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=2 ;

-- 
-- Daten für Tabelle `dig_sites`
-- 

INSERT INTO `dig_sites` VALUES (1, 'http://localhost/', '2006-08-13 17:13:05', '', '', 0, 0, 0);

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `dig_spider`
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=2 ;

-- 
-- Daten für Tabelle `dig_spider`
-- 

INSERT INTO `dig_spider` VALUES (1, '', 'test\n Home Title of this page This is a demotext ...', '2006-08-20 17:11:41', 'a2b2d66938b1f023dec6394f12b782b5_4169', 1, 'corps/www/en/test/', 5, '2006-08-13 17:11:41', 4169);

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `dig_tempspider`
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=3 ;

-- 
-- Daten für Tabelle `dig_tempspider`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `groups`
-- 

CREATE TABLE `groups` (
  `GROUP_ID` bigint(20) NOT NULL default '0',
  `GROUP_NAME` varchar(32) NOT NULL default '',
  `DESCRIPTION` varchar(255) default NULL,
  PRIMARY KEY  (`GROUP_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Daten für Tabelle `groups`
-- 

INSERT INTO `groups` VALUES (1, 'System', 'internal use');

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `internal_resources`
-- 

CREATE TABLE `internal_resources` (
  `RESID` varchar(32) NOT NULL default '',
  `LANGID` char(3) NOT NULL default '',
  `VALUE` text,
  `TOOLTIP` text,
  PRIMARY KEY  (`RESID`,`LANGID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Daten für Tabelle `internal_resources`
-- 

INSERT INTO `internal_resources` VALUES ('SEARCH_EXPIRED_ARTICLES', 'DE', 'ZurÃƒÂ¼ckgezogene Artikel', '');
INSERT INTO `internal_resources` VALUES ('ROLE_PERMISSION', 'DE', 'Rollen-Berechtigungen bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('ROLE_GENERAL', 'DE', 'Eigenschaften', '');
INSERT INTO `internal_resources` VALUES ('PREV_AVAIL', 'DE', 'Sie haben einen Inhalt ausgewÃƒÂ¤hlt. Die Vorschau wird nach dem Speichern verfÃƒÂ¼gbar sein.', '');
INSERT INTO `internal_resources` VALUES ('OBJLAUNCH_SUCCESS', 'DE', 'Das Objekt wurde erfolgreich verÃƒÂ¶ffentlicht', '');
INSERT INTO `internal_resources` VALUES ('NOT_SPECIFIED', 'DE', 'Alle Typen', '');
INSERT INTO `internal_resources` VALUES ('NO_OBJ', 'DE', 'Kein Inhalt ausgewÃƒÂ¤hlt.', '');
INSERT INTO `internal_resources` VALUES ('NOT_SELECTED', 'DE', 'Kein Element ausgewÃƒÂ¤hlt.', '');
INSERT INTO `internal_resources` VALUES ('MT_SYNC_CL', 'DE', 'Objekte synchronisieren', '');
INSERT INTO `internal_resources` VALUES ('MULTIPAGE', 'DE', 'Multipage', '');
INSERT INTO `internal_resources` VALUES ('MH_GLOSSARY', 'DE', 'Glossar', '');
INSERT INTO `internal_resources` VALUES ('LEAVE_EMPTY', 'DE', 'leer lassen', '');
INSERT INTO `internal_resources` VALUES ('INSTANCES_CREATED', 'DE', 'Neue Instanzen des Elements wurden erzeugt.', '');
INSERT INTO `internal_resources` VALUES ('KEEP_CLUSTER', 'DE', 'Originalobjekt beibehalten', '');
INSERT INTO `internal_resources` VALUES ('HIDE', 'DE', 'SchlieÃƒÅ¸en', '');
INSERT INTO `internal_resources` VALUES ('HELP_VARIATION', 'DE', 'Inhalte kÃƒÂ¶nnen in verschiedenen Variationen vorliegen. Variationen kÃƒÂ¶nnen z.B. verschiedene Sprachen oder unterschiedliche Inhaltsprofile darstellen.', '');
INSERT INTO `internal_resources` VALUES ('HELP_SYNCCL', 'DE', 'Eine Einrichtung zur Synchronisation von Clustern, nachdem eine Cluster-Vorlage verÃƒÂ¤ndert wurde.', '');
INSERT INTO `internal_resources` VALUES ('HELP_PURGE', 'DE', 'LÃƒÂ¶scht ÃƒÂ¼berflÃƒÂ¼ssige Daten aus der Datenbank', '');
INSERT INTO `internal_resources` VALUES ('HELP_DW', 'DE', 'Erzeugt eine Konfigurations-Datei fÃƒÂ¼r das N/X Dreamweaver-PlugIn. Mit Hilfe dieses Plug-Ins kÃƒÂ¶nnen N/X-Vorlagen benutzerfreundlich mit Dreamweaver entwickelt werden.', '');
INSERT INTO `internal_resources` VALUES ('HELP_BACKUP', 'DE', 'Die untenstehende Liste zeigt eine Liste von Sicherungen an. Sie kÃƒÂ¶nnen hier einzelne Sicherungen lÃƒÂ¶schen. Um eine Sicherung zurÃƒÂ¼ckzuspielen, mÃƒÂ¼ssen Sie sich manuell auf Ihrem Server anmelden und die Dateien selbst wiederherstellen', '');
INSERT INTO `internal_resources` VALUES ('CONFIRM_UNSAVED_CHANGES', 'DE', 'Achtung: Ungesicherte Ãƒâ€žnderungen gehen verloren, wenn Sie fortfahren. MÃƒÂ¶chten Sie dies tun?', '');
INSERT INTO `internal_resources` VALUES ('GOTO_CL', 'DE', 'Gehe zu Objekt', '');
INSERT INTO `internal_resources` VALUES ('FIND_OBJ', 'DE', 'Finde Objekt', '');
INSERT INTO `internal_resources` VALUES ('EXPL_SEL_SPM', 'DE', 'Bitte wÃƒÂ¤hlen Sie eine Seiten-Vorlage aus.', '');
INSERT INTO `internal_resources` VALUES ('ENDTIME', 'DE', 'Endzeit', '');
INSERT INTO `internal_resources` VALUES ('EXPL_SEL_CH', 'DE', 'Bitte wÃƒÂ¤hlen Sie einen Kanal.', '');
INSERT INTO `internal_resources` VALUES ('ENDATE', 'DE', 'Enddatum', '');
INSERT INTO `internal_resources` VALUES ('DELETE_PAGE', 'DE', 'LÃƒÂ¶schen', '');
INSERT INTO `internal_resources` VALUES ('DISABLE', 'DE', 'Deaktivieren', '');
INSERT INTO `internal_resources` VALUES ('DWEXT_CONTENTFIELDINFO', 'DE', 'Inhalts-Feld-Informationen erzeugen', '');
INSERT INTO `internal_resources` VALUES ('DWEXT_CONTENTFIELDINFO_MES', 'DE', 'erzeugt Inhalts-Feld-Informationen fÃƒÂ¼r Dreamweaver MX', '');
INSERT INTO `internal_resources` VALUES ('CLT', 'DE', 'Klasse', '');
INSERT INTO `internal_resources` VALUES ('CMPTYPE', 'DE', 'Layout-Klassen-Typ:', '');
INSERT INTO `internal_resources` VALUES ('COPY_CLUSTER', 'DE', 'Objekt kopieren', '');
INSERT INTO `internal_resources` VALUES ('CLEAR', 'DE', 'LÃƒÂ¶schen', '');
INSERT INTO `internal_resources` VALUES ('CHANNEL_IMPORTARTICLES', 'DE', 'Artikel importieren', '');
INSERT INTO `internal_resources` VALUES ('CAL_BTO', 'DE', 'ZurÃƒÂ¼ck zur ÃƒÅ“bersicht', '');
INSERT INTO `internal_resources` VALUES ('AUTH_GROUP', 'DE', 'Autentifizierung', '');
INSERT INTO `internal_resources` VALUES ('ARTICLE_VARIATION_MISSING', 'DE', 'Sprachversion dieses Artikels existiert noch nicht', '');
INSERT INTO `internal_resources` VALUES ('ARTICLE_IS_LIVE', 'DE', 'Artikel ist verÃƒÂ¶ffentlicht', '');
INSERT INTO `internal_resources` VALUES ('ARTICLE_IS_EXPIRED', 'DE', 'Artikel ist nicht verÃƒÂ¶ffentlicht', '');
INSERT INTO `internal_resources` VALUES ('ADD_LINK', 'DE', 'Link hinzufÃƒÂ¼gen', '');
INSERT INTO `internal_resources` VALUES ('ADDITIONAL_LINK', 'DE', 'ZusÃƒÂ¤tzlicher Link', '');
INSERT INTO `internal_resources` VALUES ('ADDITIONAL_IMAGE', 'DE', 'ZusÃƒÂ¤tzliches Bild', '');
INSERT INTO `internal_resources` VALUES ('HELP_ACCESS', 'DE', 'Eine Einrichtung zum Erstellen und Verwalten von Benutzerprofilen in N/X', '');
INSERT INTO `internal_resources` VALUES ('NUM_OF_ART', 'DE', 'Anzahl Artikel (999 = unendlich)', '');
INSERT INTO `internal_resources` VALUES ('ORDERART', 'DE', 'Sortierung von Artikeln', '');
INSERT INTO `internal_resources` VALUES ('ALL', 'DE', 'Alles', '');
INSERT INTO `internal_resources` VALUES ('READY_TO_USE', 'DE', 'fertig', '');
INSERT INTO `internal_resources` VALUES ('CH_CAT2', 'DE', 'Kanal und Kategorie', '');
INSERT INTO `internal_resources` VALUES ('SEL_CHANNEL_CAT', 'DE', 'Kanal und Kategorie auswÃƒÂ¤hlen', '');
INSERT INTO `internal_resources` VALUES ('O_DBLINK_ADDWHERE', 'DE', 'Additional WHERE-clause', '');
INSERT INTO `internal_resources` VALUES ('NO_CONTENT', 'DE', '<leer>', '');
INSERT INTO `internal_resources` VALUES ('O_DBLINK_SRCHVALUE', 'DE', 'Search for value', '');
INSERT INTO `internal_resources` VALUES ('O_DBLINK_EXTERNALDB', 'DE', 'External Database', '');
INSERT INTO `internal_resources` VALUES ('CL_EXPIRE', 'DE', 'Objekt zurÃƒÂ¼ckziehen', '');
INSERT INTO `internal_resources` VALUES ('BACK_TO_CV', 'DE', 'ZurÃƒÂ¼ck zur ObjektÃƒÂ¼bersicht', '');
INSERT INTO `internal_resources` VALUES ('CL_LAUNCH', 'DE', 'Objekt verÃƒÂ¶ffentlichen', '');
INSERT INTO `internal_resources` VALUES ('CHANNEL_GRABMP', 'DE', 'grab from Multipage', '');
INSERT INTO `internal_resources` VALUES ('AR_EXPIRE', 'DE', 'Artikel zurÃƒÂ¼ckziehen', '');
INSERT INTO `internal_resources` VALUES ('HELP_PGN', 'DE', 'Plug-Ins erlauben Ihnen, N/X ÃƒÂ¼her seine Standard-FunktionalitÃƒÂ¤ten hinaus zu erweitern. ÃƒÅ“blicherweise werden Plug-Ins dazu verwendet, neue Objekttypen zu den Standard-Typen Text und Bild hinzuzufÃƒÂ¼gen.', '');
INSERT INTO `internal_resources` VALUES ('O_TEXT_NOBREAK', 'DE', 'Ignore New-Lines', '');
INSERT INTO `internal_resources` VALUES ('DEL_ARTICLE', 'DE', 'MÃƒÂ¶chten Sie diesen Artikel wirklich in allen Sprachen lÃƒÂ¶schen?', '');
INSERT INTO `internal_resources` VALUES ('AR_LAUNCH', 'DE', 'Artikel verÃƒÂ¶ffentlichen', '');
INSERT INTO `internal_resources` VALUES ('CREATE_ARTICLE', 'DE', 'Neuen Artikel im Kanal erzeugen', '');
INSERT INTO `internal_resources` VALUES ('ED_PROPERTIES', 'DE', 'Eigenschaften', '');
INSERT INTO `internal_resources` VALUES ('ED_CLT', 'DE', 'Klasse bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('NODE_ACCESS', 'DE', 'Zugriffsrechte fÃƒÂ¼r Root-Seite setzen', '');
INSERT INTO `internal_resources` VALUES ('BACK_TO_OVERVIEW', 'DE', 'ZurÃƒÂ¼ck zur ÃƒÅ“bersicht', '');
INSERT INTO `internal_resources` VALUES ('NEW_ARTICLE', 'DE', 'Neuer Artikel', '');
INSERT INTO `internal_resources` VALUES ('DESTROY_EXCLUSIVE_CONTENT', 'DE', 'Exklusive Inhalte lÃƒÂ¶schen', '');
INSERT INTO `internal_resources` VALUES ('EDIT_ARTICLE', 'DE', 'Artikel bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('DESTROY_TREE', 'DE', 'Baum lÃƒÂ¶schen', '');
INSERT INTO `internal_resources` VALUES ('CONFIRM_DELETE', 'DE', 'MÃƒÂ¶chten Sie dieses Element wirklich lÃƒÂ¶schen?', '');
INSERT INTO `internal_resources` VALUES ('HELP_ROLLOUT', 'DE', 'Rollout ist eine Einrichtung in N/X, mit der Sie Kopien eines Teils Ihrer Website erstellen und diese an anderer Stelle mit oder ohne alte Inhalte weiderverwenden kÃƒÂ¶nnen.', '');
INSERT INTO `internal_resources` VALUES ('CHANNEL', 'DE', 'Kanal', '');
INSERT INTO `internal_resources` VALUES ('CLT_SELECT', 'DE', 'Klasse auswÃƒÂ¤hlen', '');
INSERT INTO `internal_resources` VALUES ('HELP_CHANNEL', 'DE', 'Themen-Kategorien fÃƒÂ¼r die Inhalte der von N/X erzeugten Artikel, z.B. Neuigkeiten, Personen', '');
INSERT INTO `internal_resources` VALUES ('CHANNELS', 'DE', 'KanÃƒÂ¤le', '');
INSERT INTO `internal_resources` VALUES ('SEL_FILE', 'DE', 'Datei auswÃƒÂ¤hlen', '');
INSERT INTO `internal_resources` VALUES ('WZT_IMPORTING', 'DE', 'Daten werden importiert', '');
INSERT INTO `internal_resources` VALUES ('WZE_IMPORTING', 'DE', 'Das System hat versucht, die Daten zu importieren. Bitten ÃƒÂ¼berprÃƒÂ¼fen Sie den Status auf der rechten Seite.', '');
INSERT INTO `internal_resources` VALUES ('WZE_IMPORT_VAL', 'DE', 'Das System hat die Korrektheit der hochgeladenen XML-Datei ÃƒÂ¼berprÃƒÂ¼ft. Im Bericht rechts finden Sie nÃƒÂ¤here Informationen.', '');
INSERT INTO `internal_resources` VALUES ('WZT_IMPORT_VAL', 'DE', 'Zusammenfassung des hochgeladenen XML', '');
INSERT INTO `internal_resources` VALUES ('WZE_IMPORT_FILE', 'DE', 'Bitte wÃƒÂ¤hlen Sie eine XML-Datei auf Ihrer Festplatte aus, die ins System geladen werden soll<br/><br/>Das System wird eine ÃƒÅ“berprÃƒÂ¼fung durchfÃƒÂ¼hren und den Status auf der rechten Seite ausgeben.', '');
INSERT INTO `internal_resources` VALUES ('WZT_IMPORT_FILE', 'DE', 'N/X-XML-Datei auswÃƒÂ¤hlen', '');
INSERT INTO `internal_resources` VALUES ('IMPORT_DATA', 'DE', 'N/X-XML-Daten importieren', '');
INSERT INTO `internal_resources` VALUES ('WZ_IMPORT_TITLE', 'DE', 'Dieser Assisten dient zum Import von Daten in N/X, die zuvor von einer anderen N/X-Installation exportiert wurden. Um eine Ressource erneut importieren zu kÃƒÂ¶nnen, mÃƒÂ¼ssen Sie sie zunÃƒÂ¤chst lÃƒÂ¶schen.', '');
INSERT INTO `internal_resources` VALUES ('EXPL_SEL_CLUSTER', 'DE', 'Nachdem Sie eine Klasse gewÃƒÂ¤hlt haben, erscheint eine Liste von Objekten, aus der Sie eins auswÃƒÂ¤hlen kÃƒÂ¶nnen.', '');
INSERT INTO `internal_resources` VALUES ('STEP', 'DE', 'Schritt', '');
INSERT INTO `internal_resources` VALUES ('NEXT', 'DE', 'Weiter', '');
INSERT INTO `internal_resources` VALUES ('EXP_REPORT', 'DE', 'Exportiere folgende Daten', '');
INSERT INTO `internal_resources` VALUES ('EXPL_EXEC_EXPORT', 'DE', 'Das System erzeugt gerade eine XML-Datei fÃƒÂ¼r den Export..<br/><br/>In ein paar Sekunden wird ein PopUp erscheinen. Klicken Sie "Speichern", um die Daten auf Ihre Festplatte zu sichern.', '');
INSERT INTO `internal_resources` VALUES ('EXEC_EXPORT', 'DE', 'Quelle wird exportiert', '');
INSERT INTO `internal_resources` VALUES ('PAGE_TEMPLATE', 'DE', 'Seiten Vorlage', '');
INSERT INTO `internal_resources` VALUES ('WZT_SEL_EXP_RES', 'DE', 'Ressource fÃƒÂ¼r den Export auswÃƒÂ¤hlen', '');
INSERT INTO `internal_resources` VALUES ('WZT_DESCR', 'DE', 'Beschreibung hinzufÃƒÂ¼gen', '');
INSERT INTO `internal_resources` VALUES ('WZT_DESCR_EXPL', 'DE', 'Sie sollten eine kurze Beschreibung zu den exportierten Daten hinzufÃƒÂ¼gen.<br><br>Jeder, der die Daten importiert, wird leichter verstehen, was er importiert.', '');
INSERT INTO `internal_resources` VALUES ('CLUSTER', 'DE', 'Objekt', '');
INSERT INTO `internal_resources` VALUES ('CLUSTER_TEMPLATE', 'DE', 'Klasse', '');
INSERT INTO `internal_resources` VALUES ('WZE_EXPORT_TYPE', 'DE', 'Bitte wÃƒÂ¤hlen Sie rechts den Typ von Daten aus, den Sie exportieren mÃƒÂ¶chten. Cluster speichern Inhalte. Wenn Sie Cluser exportieren, werden automatisch auch die zugehÃƒÂ¶rigen Vorlagen exportiert. Cluster-Vorlagen sind Schemata, um Cluster zu erstellen. seiten-Vorlagen werden benutzt, um Seiten zu erstellen.', '');
INSERT INTO `internal_resources` VALUES ('WZT_EXPORT_TYPE', 'DE', 'WÃƒÂ¤hlen Sie den Typ fÃƒÂ¼r den Export aus.', '');
INSERT INTO `internal_resources` VALUES ('WZ_EXPORT_TITLE', 'DE', 'Der Assistent dient zum Austausch von Objekten, Klassen und Seiten-Vorlagen zwischen Ihrer und anderen N/X-Installationen. Der Assistent erzeugt eine XML-Datei, die Sie auf Ihre lokale Festplatte speichern und mit anderen N/X-Nutzern austauschen kÃƒÂ¶nnen.', '');
INSERT INTO `internal_resources` VALUES ('EXPORT_DATA', 'DE', 'Inhalte- und Vorlagen-Export-Assistent', '');
INSERT INTO `internal_resources` VALUES ('LAST_LAUNCHED_AT', 'DE', 'Zuletzt verÃƒÂ¶ffentlicht am', '');
INSERT INTO `internal_resources` VALUES ('BY', 'DE', 'von', '');
INSERT INTO `internal_resources` VALUES ('LAST_MOD_AT', 'DE', 'Zuletzt geÃƒÂ¤ndert am', '');
INSERT INTO `internal_resources` VALUES ('CREATED_AT', 'DE', 'Erstellt am', '');
INSERT INTO `internal_resources` VALUES ('CLUSTER_INFORMATION', 'DE', 'Informationen ÃƒÂ¼ber diesen Datensatz', '');
INSERT INTO `internal_resources` VALUES ('TT_RSTCI', 'DE', 'Jede Seite in N/X besitzt ein Objekt. Duch Klicken auf "Objekt zurÃƒÂ¼cksetzen" kÃƒÂ¶nnen Sie der Seite eine neues Objekt zuweisen.', '');
INSERT INTO `internal_resources` VALUES ('HELP_METATEMP', 'DE', 'Eine Meta-Schablone wird benutzt, um festzulegen, welche Metadaten-Felder eine Seite erhalten soll. Wenn Sie in einer Vorlage ein neues Metadaten-Feld erstellen, wird jede auf dieser Vorlage basierende Seite dieses Feld besitzen.', '');
INSERT INTO `internal_resources` VALUES ('NO_CLUSTER', 'DE', 'Keine Inhalte.', '');
INSERT INTO `internal_resources` VALUES ('USER_AGENT', 'DE', 'Agent verwenden', '');
INSERT INTO `internal_resources` VALUES ('HELP_CLB', 'DE', 'Ein Cluster ist eine Ansammlung von statischen und dynamischen Inhalts-Platzhaltern, die entweder von einem Entwickler oder einem Editor einer Website gefÃƒÂ¼llt werden. Die Grundstruktur in N/X besteht aus Daten-Clustern', '');
INSERT INTO `internal_resources` VALUES ('PROMPTDELETE', 'DE', 'MÃƒÂ¶chten Sie diesen Datensatz wirklich lÃƒÂ¶schen?', '');
INSERT INTO `internal_resources` VALUES ('CREATENEW', 'DE', 'Es wurde ein neuer Datensatz erzeugt.', '');
INSERT INTO `internal_resources` VALUES ('SELECTONE', 'DE', 'Sie mÃƒÂ¼ssen hier eine Auswahl treffen!', '');
INSERT INTO `internal_resources` VALUES ('SAVESUCCESS', 'DE', 'Die Daten wurden erfolgreich in die Datenbank geschrieben.', '');
INSERT INTO `internal_resources` VALUES ('DELETESUCCESS', 'DE', 'Die unten aufgefÃƒÂ¼hrten Daten wurden erfolgreich gelÃƒÂ¶scht.', '');
INSERT INTO `internal_resources` VALUES ('SAVEERROR', 'DE', 'WÃƒÂ¤hrend des Speicherns der Daten in die Datenbank ist ein Fehler aufgetreten. Bitte stellen Sie sicher, dass die Datenbank verbunden ist, oder benachrichtigen Sie Ihren Administrator.', '');
INSERT INTO `internal_resources` VALUES ('PROCERROR', 'DE', 'WÃƒÂ¤hrend der Verarbeitung des Formulars ist ein Fehler aufgetreten. Bitte ÃƒÂ¼berprÃƒÂ¼fen Sie die markierten Felder und lesen Sie die dortigen Anweisungen fÃƒÂ¼r weitergehende Informationen.', '');
INSERT INTO `internal_resources` VALUES ('PWDTOOSHORT', 'DE', 'Das Passwort muss mindestens 6 Zeichen lang sein!', '');
INSERT INTO `internal_resources` VALUES ('PWDNOTMATCH', 'DE', 'Die von Ihnen eingegebene PasswÃƒÂ¶rter stimmen nicht ÃƒÂ¼berein!', '');
INSERT INTO `internal_resources` VALUES ('DATEFORMAT', 'DE', 'Das Datumsformat ist nicht korrekt!', NULL);
INSERT INTO `internal_resources` VALUES ('WRONGDATE', 'DE', 'Das von Ihnen eingegebene Datum existiert nicht!', '');
INSERT INTO `internal_resources` VALUES ('NOTNUMBER', 'DE', 'Sie kÃƒÂ¶nnen in dieses Feld nur Zahlenwerte eingeben!', '');
INSERT INTO `internal_resources` VALUES ('MANDATORY', 'DE', 'Dieses Feld darf nicht leer sein!', '');
INSERT INTO `internal_resources` VALUES ('UNIQUE', 'DE', 'Dieser Wert muss eindeutig sein!', '');
INSERT INTO `internal_resources` VALUES ('STATUS', 'DE', 'Status:', '');
INSERT INTO `internal_resources` VALUES ('EMPTY', 'DE', '<leer>', '');
INSERT INTO `internal_resources` VALUES ('SELECT_CL', 'DE', 'WÃƒÂ¤hlen Sie ein Objekt aus', '');
INSERT INTO `internal_resources` VALUES ('SELECT_CI', 'DE', 'WÃƒÂ¤hlen Sie ein Inhalts-Element aus', '');
INSERT INTO `internal_resources` VALUES ('CONFIG', 'DE', 'Anpassen', '');
INSERT INTO `internal_resources` VALUES ('CONFIGURED', 'DE', 'fertig', '');
INSERT INTO `internal_resources` VALUES ('NOTCONFIGURED', 'DE', 'Noch nicht konfiguriert.', '');
INSERT INTO `internal_resources` VALUES ('CHOOSEFILE', 'DE', 'WÃƒÂ¤hlen Sie eine Datei aus', '');
INSERT INTO `internal_resources` VALUES ('PREVIEW', 'DE', 'Vorschau', '');
INSERT INTO `internal_resources` VALUES ('ED_CONTENT', 'DE', 'Inhalt bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('ED_META', 'DE', 'META-Daten', '');
INSERT INTO `internal_resources` VALUES ('ED_DISPATCHER', 'DE', 'Benutzen Sie diese SchaltflÃƒÂ¤che, um zwischen der Bearbeitung der META-Daten und der Bearbeitung der Inhalte umherzuschlaten.', '');
INSERT INTO `internal_resources` VALUES ('ACTIVE_VARIATION', 'DE', 'AusgewÃƒÂ¤hlte Sprache:', '');
INSERT INTO `internal_resources` VALUES ('NO_VARIATIONS', 'DE', 'Es wurden noch keine Sprachversionen fÃƒÂ¼r dieses Objekt erzeugt.<br>Bitten Sie einen Entwickler, die Konfiguration des gewÃƒÂ¤hlten Elements zu ÃƒÂ¼berprÃƒÂ¼fen!', '');
INSERT INTO `internal_resources` VALUES ('SELECT_VARIATION', 'DE', 'Sprache auswÃƒÂ¤hlen', '');
INSERT INTO `internal_resources` VALUES ('METATEMPLATE', 'DE', 'ZusÃƒÂ¤tzliche META-Vorlage', '');
INSERT INTO `internal_resources` VALUES ('POSITION', 'DE', 'Position', '');
INSERT INTO `internal_resources` VALUES ('DELETE', 'DE', 'LÃƒÂ¶schen', '');
INSERT INTO `internal_resources` VALUES ('TYPE', 'DE', 'Typ', '');
INSERT INTO `internal_resources` VALUES ('KEYWORDS', 'DE', 'SchlÃƒÂ¼sselwÃƒÂ¶rter', '');
INSERT INTO `internal_resources` VALUES ('SELECTOBJECT', 'DE', 'Bitte wÃƒÂ¤hlen Sie eine Klasse aus und geben Sie eine Position und einen Namen an, um das Objekt zu erzeugen.<br>Geben Sie als Position 0 an, um das neue Objekt am Anfang einzufÃƒÂ¼gen, 999, um es am Ende anzufÃƒÂ¼gen und jede beliebige andere Numm', '');
INSERT INTO `internal_resources` VALUES ('CONTAINERNAME', 'DE', 'Vorlage', '');
INSERT INTO `internal_resources` VALUES ('DOWN', 'DE', 'Ab', '');
INSERT INTO `internal_resources` VALUES ('UP', 'DE', 'Auf', '');
INSERT INTO `internal_resources` VALUES ('EDIT', 'DE', 'Bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('DOSOMETHING', 'DE', 'Bitte wÃƒÂ¤hlen Sie aus, was Sie tun mÃƒÂ¶chten. Sie kÃƒÂ¶nnen neue Elemente einfÃƒÂ¼gen, bestehende Elemente bearbeiten oder lÃƒÂ¶schen und die Reihenfolge bestehender Elemente verÃƒÂ¤ndern.', '');
INSERT INTO `internal_resources` VALUES ('DESCRIPTION', 'DE', 'Beschreibung', '');
INSERT INTO `internal_resources` VALUES ('NAME', 'DE', 'Name', '');
INSERT INTO `internal_resources` VALUES ('NEW', 'DE', 'Neu', '');
INSERT INTO `internal_resources` VALUES ('NO', 'DE', 'Nein', '');
INSERT INTO `internal_resources` VALUES ('YES', 'DE', 'Ja', '');
INSERT INTO `internal_resources` VALUES ('CANCEL', 'DE', 'Abbrechen', '');
INSERT INTO `internal_resources` VALUES ('COMMIT', 'DE', 'ÃƒÅ“bernehmen', '');
INSERT INTO `internal_resources` VALUES ('USER_PROFILE', 'DE', 'Mein Profil', '');
INSERT INTO `internal_resources` VALUES ('ERROR_SEL_ROLE', 'DE', 'Sie mÃƒÂ¼ssen mindestens eine Rolle auswÃƒÂ¤hlen!', '');
INSERT INTO `internal_resources` VALUES ('ERROR_SEL_GROUP', 'DE', 'Sie mÃƒÂ¼ssen eine Gruppe auswÃƒÂ¤hlen!', '');
INSERT INTO `internal_resources` VALUES ('USER_TO_GROUP', 'DE', 'Bneutzer zur Gruppe hinzufÃƒÂ¼gen', '');
INSERT INTO `internal_resources` VALUES ('ROLE_DESCRIPTION', 'DE', 'Beschreibung', '');
INSERT INTO `internal_resources` VALUES ('ROLE_FILTERMENU', 'DE', 'Rollen-Verwaltung', '');
INSERT INTO `internal_resources` VALUES ('USER_PERMISSIONS', 'DE', 'Benutzer-Rechte', '');
INSERT INTO `internal_resources` VALUES ('UP_INTRO', 'DE', 'Bitte wÃƒÂ¤hlen Sie die Gruppe und die Rollen in der Gruppe, die Sie diesem User zuweisen mÃƒÂ¶chten.', '');
INSERT INTO `internal_resources` VALUES ('ROLE_LINK', 'DE', 'Rollen-Profile', '');
INSERT INTO `internal_resources` VALUES ('ROLE_HEAD', 'DE', 'Rollen-Profil', '');
INSERT INTO `internal_resources` VALUES ('ROLE_NAME', 'DE', 'Rollen-Name', '');
INSERT INTO `internal_resources` VALUES ('GROUP_FILTERMENU', 'DE', 'Gruppen-Verwaltung', '');
INSERT INTO `internal_resources` VALUES ('GROUP_DESCRIPTIO', 'DE', 'Beschreibung', '');
INSERT INTO `internal_resources` VALUES ('GROUP_NAME', 'DE', 'Gruppen-Name', '');
INSERT INTO `internal_resources` VALUES ('USER_PERMGRID', 'DE', 'Berechtigungs-Gitter', '');
INSERT INTO `internal_resources` VALUES ('GROUP_LINK', 'DE', 'Gruppen-Profile', '');
INSERT INTO `internal_resources` VALUES ('GROUP_HEAD', 'DE', 'Gruppen-Profil', '');
INSERT INTO `internal_resources` VALUES ('USER_FILTERMENU', 'DE', 'Benutzeraverwaltung', '');
INSERT INTO `internal_resources` VALUES ('USER_SETPERM', 'DE', 'Setzen Sie hier die User-Rechte. Um einen User aus einer Gruppe zu entfernen, entfernen Sie einfach alle Gruppen von ihm.', '');
INSERT INTO `internal_resources` VALUES ('USER_EMAIL', 'DE', 'eMail', '');
INSERT INTO `internal_resources` VALUES ('USER_ACTIVE', 'DE', 'Konto aktiv', '');
INSERT INTO `internal_resources` VALUES ('PASSWORD', 'DE', 'Passwort', '');
INSERT INTO `internal_resources` VALUES ('FULL_NAME', 'DE', 'Voller Name', '');
INSERT INTO `internal_resources` VALUES ('USER_LINK', 'DE', 'Benutzer-Profile', '');
INSERT INTO `internal_resources` VALUES ('USER_NAME', 'DE', 'Benutzername', '');
INSERT INTO `internal_resources` VALUES ('USER_HEAD', 'DE', 'Benutzer-Profil', '');
INSERT INTO `internal_resources` VALUES ('LOGIN_FAILED', 'DE', 'Die Login-Daten, die Sie eingegeben haben, konnten nicht verifiziert werden. Bitte versuchen Sie es erneut.', '');
INSERT INTO `internal_resources` VALUES ('V_EDIT', 'DE', 'Sprachen bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('MT_BASE', 'DE', 'Basis META-Daten', '');
INSERT INTO `internal_resources` VALUES ('MT_MODULE', 'DE', 'Inhaltstyp-spezifische META-Daten', '');
INSERT INTO `internal_resources` VALUES ('VARIATIONS', 'DE', 'VerfÃƒÂ¼gbare Variationen', '');
INSERT INTO `internal_resources` VALUES ('V_NAME', 'DE', 'Name', '');
INSERT INTO `internal_resources` VALUES ('V_SHORT', 'DE', 'KÃƒÂ¼rzel', '');
INSERT INTO `internal_resources` VALUES ('MT_ADDITIONAL', 'DE', 'ZusÃƒÂ¤tzliche META-Daten', '');
INSERT INTO `internal_resources` VALUES ('MT_DELETE', 'DE', 'MÃƒÂ¶chten Sie diesen Teil der Meta-Vorlage wirklich lÃƒÂ¶schen? Alle Informationen, die im CMS in irgend ein mit diesem Teil verknÃƒÂ¼pften META-Eingabefeld eingegeben wurden, werden gelÃƒÂ¶scht. Die Daten kÃƒÂ¶nnen anschliessend nicht wiederhe', '');
INSERT INTO `internal_resources` VALUES ('MT_SCHEME', 'DE', 'Meta-Vorlage bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('MT_PROPERTIES', 'DE', 'Eigenschaften bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('METATEMPLATES', 'DE', 'Meta-Vorlagen', '');
INSERT INTO `internal_resources` VALUES ('R_PARENT', 'DE', 'ÃƒÅ“bergeordneter Ordner', '');
INSERT INTO `internal_resources` VALUES ('R_DELFOLDER', 'DE', 'Ordner und alle untergeordneten Objekte lÃƒÂ¶schen', '');
INSERT INTO `internal_resources` VALUES ('R_MOVEOBJECTS', 'DE', 'Alle Objekte zur nÃƒÂ¤chst hÃƒÂ¶heren Ebene verschieben', '');
INSERT INTO `internal_resources` VALUES ('R_FOLDERNOTEMPTY', 'DE', 'Der Ordner ist nicht leer, Sie kÃƒÂ¶nnen ihn also nicht lÃƒÂ¶schen! Bitte ÃƒÂ¼berprÃƒÂ¼fen Sie alle Objekte und Inhalte!', '');
INSERT INTO `internal_resources` VALUES ('R_DELFOLDERMES', 'DE', 'Sie sind im Begriff einen Ordner zu lÃƒÂ¶schen. Bitte wÃƒÂ¤hlen Sie eine Aktion aus.', '');
INSERT INTO `internal_resources` VALUES ('R_DELETEFOLDER', 'DE', 'Ordner lÃƒÂ¶schen', '');
INSERT INTO `internal_resources` VALUES ('R_FOLDERNAME', 'DE', 'Ordner-Name', '');
INSERT INTO `internal_resources` VALUES ('R_EDITFOLDER', 'DE', 'Ordner-Eigenschaften bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('O_TEXT', 'DE', 'Text', '');
INSERT INTO `internal_resources` VALUES ('O_ALT', 'DE', 'ALT-Tag', '');
INSERT INTO `internal_resources` VALUES ('O_COPYRIGHT', 'DE', 'Copyright', '');
INSERT INTO `internal_resources` VALUES ('O_BROWSE', 'DE', 'Objekte', '');
INSERT INTO `internal_resources` VALUES ('R_HOME', 'DE', 'Start', '');
INSERT INTO `internal_resources` VALUES ('R_NEWFOLDER', 'DE', 'Neuer Ordner', '');
INSERT INTO `internal_resources` VALUES ('O_PREVIEW', 'DE', 'Vorschau von', '');
INSERT INTO `internal_resources` VALUES ('O_EDIT', 'DE', 'Objekt bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('O_DEL', 'DE', 'Objekt lÃƒÂ¶schen', '');
INSERT INTO `internal_resources` VALUES ('O_DELMES', 'DE', 'Sie sind im Begriff ein Objekt zu lÃƒÂ¶schen.<b>Beachten Sie dass hierbei alle  Sprachversionen und META-DATEN gelÃƒÂ¶scht werden!</b>', '');
INSERT INTO `internal_resources` VALUES ('O_PROPERTIES', 'DE', 'Objekt-Eigenschaften', '');
INSERT INTO `internal_resources` VALUES ('O_NAME', 'DE', 'Objekt-Name', '');
INSERT INTO `internal_resources` VALUES ('O_NEW', 'DE', 'Neues Objekt', '');
INSERT INTO `internal_resources` VALUES ('PG_UNINSTALLDELE', 'DE', 'Plugin entfernen,<br> Alle zugehÃƒÂ¶rigen Inhalte lÃƒÂ¶schen.', '');
INSERT INTO `internal_resources` VALUES ('PG_UNINSTALLMES', 'DE', 'Sie sind im Begriff, ein Plugin zu entfernen. Das Entfernen eines Moduls lÃƒÂ¶scht nicht nur den Inhalts-Typ sondern lÃƒÂ¶scht auch jeden einzelnen Inhalt, der in der Datenbank gespeichert ist.', '');
INSERT INTO `internal_resources` VALUES ('PG_UNINSTALL', 'DE', 'PlugIn deinstallieren', '');
INSERT INTO `internal_resources` VALUES ('PG_INSTALL', 'DE', 'PlugIn installieren', '');
INSERT INTO `internal_resources` VALUES ('PG_TITLE', 'DE', 'PlugIns', '');
INSERT INTO `internal_resources` VALUES ('PG_NEWERINSTALLE', 'DE', 'Eine neuere Version des PlugIns ist bereits installiert!', '');
INSERT INTO `internal_resources` VALUES ('PG_ALREADYINSTAL', 'DE', 'Das PlugIn ist bereits installiert!', '');
INSERT INTO `internal_resources` VALUES ('PG_ERROR', 'DE', 'WÃƒÂ¤hrend der Installation des PlugIns ist ein Fehler aufgetreten!', '');
INSERT INTO `internal_resources` VALUES ('PG_UPGRADED', 'DE', 'Das PlugIn wurde erfolgreich aktualisiert!', '');
INSERT INTO `internal_resources` VALUES ('PG_INSTALLED', 'DE', 'Das PlugIn wurde erfolgreich installiert!', '');
INSERT INTO `internal_resources` VALUES ('CLASS_WRONG', 'DE', 'Die von Ihnen angegebene Datei hat keine gÃƒÂ¼ltige Klassen-Signatur!', '');
INSERT INTO `internal_resources` VALUES ('PG_FILEWRONG', 'DE', 'Der von Ihnen eingegebene Dateiname konnte auf dem Server nicht gefunden werden!', '');
INSERT INTO `internal_resources` VALUES ('PG_CHOOSE', 'DE', 'PlugIn: Ã‚Â  /plugin/', '');
INSERT INTO `internal_resources` VALUES ('CLT_MINCARD', 'DE', 'minimale Anzahl', '');
INSERT INTO `internal_resources` VALUES ('CLT_MAXCARD', 'DE', 'maximale Anzahl', '');
INSERT INTO `internal_resources` VALUES ('LINKED', 'DE', 'VerknÃƒÂ¼pft mit', '');
INSERT INTO `internal_resources` VALUES ('PG_INSTALLDESC', 'DE', 'Bitte stellen Sie sicher, dass Sie alle benÃƒÂ¶tigten Dateien ins Verzeichnis kopiert haben, bevor Sie fortfahren. Geben Sie in das untenstehende Eingabefeld den korrekten Pfad zum PlugIn ein. Das System wird das PlugIn dann automatisch installieren.', '');
INSERT INTO `internal_resources` VALUES ('CLT_SCHEME', 'DE', 'Klasse bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('CLTI_DELETE', 'DE', 'MÃƒÂ¶chten Sie dieses Element wirklich lÃƒÂ¶schen? SÃƒÂ¤mtliche Instanzen dieses Elements werden ebenfalls gelÃƒÂ¶scht!', '');
INSERT INTO `internal_resources` VALUES ('CLT_DELMES', 'DE', 'Sie sind im Begriff eine Klasse zu lÃƒÂ¶schen. Dies wird den Verlust aller(!) Ihnhalte zur Folge haben, die mit dieser Klasse als Vorlage erstellt wurden. Sind Sie sicher, dass Sie forfahren mÃƒÂ¶chten?', '');
INSERT INTO `internal_resources` VALUES ('CLT_DELETE', 'DE', 'Klasse lÃƒÂ¶schen', '');
INSERT INTO `internal_resources` VALUES ('CLT_NAME', 'DE', 'Klassenname', '');
INSERT INTO `internal_resources` VALUES ('CLT_PROPERTIES', 'DE', 'Klassen-Eigenschaften', '');
INSERT INTO `internal_resources` VALUES ('CLT_BROWSE', 'DE', 'Klassen', '');
INSERT INTO `internal_resources` VALUES ('CLT_NEW', 'DE', 'Neue Klasse', '');
INSERT INTO `internal_resources` VALUES ('M_PGN', 'DE', 'Plugin-Verwaltung', '');
INSERT INTO `internal_resources` VALUES ('M_PURGE', 'DE', 'Datenbank bereinigen', '');
INSERT INTO `internal_resources` VALUES ('M_VAR', 'DE', 'Sprachen', '');
INSERT INTO `internal_resources` VALUES ('M_UMAN', 'DE', 'Benutzer-Verwaltung', '');
INSERT INTO `internal_resources` VALUES ('M_CLTB', 'DE', 'Klassen-Browser', '');
INSERT INTO `internal_resources` VALUES ('M_CLB', 'DE', 'Objekte', '');
INSERT INTO `internal_resources` VALUES ('M_LOGOUT', 'DE', 'Abmelden', '');
INSERT INTO `internal_resources` VALUES ('M_MYPROFILE', 'DE', 'Mein Profil', '');
INSERT INTO `internal_resources` VALUES ('M_MYPRT', 'DE', 'Meine Portale', '');
INSERT INTO `internal_resources` VALUES ('M_PRTMAN', 'DE', 'Portal-Manager', '');
INSERT INTO `internal_resources` VALUES ('M_ES', 'DE', 'Website', '');
INSERT INTO `internal_resources` VALUES ('M_SPM', 'DE', 'Seiten Vorlagen', '');
INSERT INTO `internal_resources` VALUES ('M_INSTALLPLUGIN', 'DE', 'PlugIns', '');
INSERT INTO `internal_resources` VALUES ('SELECTEDOBJECT', 'DE', 'Derzeit ausgewÃƒÂ¤hltes Inhalts-Element', '');
INSERT INTO `internal_resources` VALUES ('SELECTEDINSTANCE', 'DE', 'AusgewÃƒÂ¤hltes Objekt', '');
INSERT INTO `internal_resources` VALUES ('M_META', 'DE', 'Meta-Vorlagen', '');
INSERT INTO `internal_resources` VALUES ('M_BROWSER', 'DE', 'Objekt-Browser', '');
INSERT INTO `internal_resources` VALUES ('SEARCH', 'DE', 'Suchen', '');
INSERT INTO `internal_resources` VALUES ('SEARCHIN', 'DE', 'Suchen nach', '');
INSERT INTO `internal_resources` VALUES ('SEARCHRESULTS', 'DE', 'Such-Ergebnisse, bitte treffen Sie Ihre Auswahl', '');
INSERT INTO `internal_resources` VALUES ('CONTENTTYPE', 'DE', 'Typ', '');
INSERT INTO `internal_resources` VALUES ('CONTENTITEM', 'DE', 'Inhalt', '');
INSERT INTO `internal_resources` VALUES ('FOLDER', 'DE', 'Ordner', '');
INSERT INTO `internal_resources` VALUES ('SR_SELECTCLI', 'DE', 'Bitte wÃƒÂ¤hlen Sie eine Klasse. AnschlieÃƒÅ¸end kÃƒÂ¶nnen Sie ein Objekt auswÃƒÂ¤hlen.', '');
INSERT INTO `internal_resources` VALUES ('SR_SELECTCI', 'DE', 'Sie kÃƒÂ¶nnen hier nach einem beliebigen Inhalts-Element suchen. Wenn Sie ein Inhalts-Element selektieren mÃƒÂ¶chten, wÃƒÂ¤hlen Sie es aus und klicken Sie die Aktualisieren-SchaltflÃƒÂ¤che! Wenn sie neuen Inhalt mit diesem Feld verbinden mÃƒÂ¶chten, erstellen Sie es bitte zunÃƒÂ¤chst in der Bibliothek.', '');
INSERT INTO `internal_resources` VALUES ('CLI', 'DE', 'Objekt:', '');
INSERT INTO `internal_resources` VALUES ('CLI_NOTDELETED', 'DE', 'Dieses Objekt kann nicht gelÃƒÂ¶scht werden!', '');
INSERT INTO `internal_resources` VALUES ('CLI_DELETED', 'DE', 'Das Objekt wurde gelÃƒÂ¶scht.', '');
INSERT INTO `internal_resources` VALUES ('CLI_DELETEMES', 'DE', 'MÃƒÂ¶chten Sie dieses Objekt wirklich lÃƒÂ¶schen?', '');
INSERT INTO `internal_resources` VALUES ('CLI_DELETE', 'DE', 'Objekt lÃƒÂ¶schen', '');
INSERT INTO `internal_resources` VALUES ('CLI_EDIT', 'DE', 'Objekt-Figur bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('TITLE', 'DE', 'Titel', '');
INSERT INTO `internal_resources` VALUES ('CL_NOTITLE', 'DE', 'Noch kein Titel angegeben', '');
INSERT INTO `internal_resources` VALUES ('PO_BROWSER', 'MND', 'ÃƒË†ÃƒÂ«Ã‚Â¿ÃƒÅ¡ÃƒÂ¤Ã‚Â¯Ãƒâ‚¬Ãƒâ‚¬Ãƒâ€ ÃƒÂ·', NULL);
INSERT INTO `internal_resources` VALUES ('PO_OWNER', 'MND', 'Ãƒâ€™Ã‚Â³ÃƒÆ’ÃƒÂ¦Master', NULL);
INSERT INTO `internal_resources` VALUES ('PO_CRSUCCEEDED', 'MND', 'Ã‚Â³Ãƒâ€°Ã‚Â¹Ã‚Â¦Ã‚Â´Ã‚Â´Ã‚Â½Ã‚Â¨ÃƒÂÃƒâ€šÃƒË†ÃƒÂ«Ã‚Â¿ÃƒÅ¡Ãƒâ€™Ã‚Â³ÃƒÆ’ÃƒÂ¦!', NULL);
INSERT INTO `internal_resources` VALUES ('PO_MYPORTAL', 'MND', 'ÃƒÅ½Ãƒâ€™Ã‚ÂµÃƒâ€žÃƒË†ÃƒÂ«Ã‚Â¿ÃƒÅ¡Ãƒâ€™Ã‚Â³ÃƒÆ’ÃƒÂ¦', NULL);
INSERT INTO `internal_resources` VALUES ('PO_EDIT', 'MND', 'Ã‚Â±ÃƒÂ Ã‚Â¼Ã‚Â­ÃƒË†ÃƒÂ«Ã‚Â¿ÃƒÅ¡Ãƒâ€™Ã‚Â³ÃƒÆ’ÃƒÂ¦', NULL);
INSERT INTO `internal_resources` VALUES ('SP_BROWSE', 'MND', 'ÃƒÂ¤Ã‚Â¯Ãƒâ‚¬Ãƒâ‚¬Ãƒâ€¢Ã‚Â¾Ã‚ÂµÃƒÂ£Ã‚ÂµÃƒËœÃƒÂÃ‚Â¼', NULL);
INSERT INTO `internal_resources` VALUES ('SP_NEWPAGE', 'MND', 'Ãƒâ€ÃƒÂ¶Ã‚Â¼Ãƒâ€œÃƒâ€¢Ã‚Â¾Ã‚ÂµÃƒÂ£Ãƒâ€™Ã‚Â³ÃƒÆ’ÃƒÂ¦', NULL);
INSERT INTO `internal_resources` VALUES ('SP_NEWINSTANCE', 'MND', 'Ãƒâ€ÃƒÂ¶Ã‚Â¼Ãƒâ€œÃƒâ€™Ã‚Â³ÃƒÆ’ÃƒÂ¦', NULL);
INSERT INTO `internal_resources` VALUES ('SP_IPROPERTIES', 'MND', 'Ãƒâ€™Ã‚Â³ÃƒÆ’ÃƒÂ¦ÃƒÅ ÃƒÂ´ÃƒÂÃƒâ€', NULL);
INSERT INTO `internal_resources` VALUES ('SP_PROPERTIES', 'MND', 'Ãƒâ€¢Ã‚Â¾Ã‚ÂµÃƒÂ£Ãƒâ€™Ã‚Â³ÃƒÆ’ÃƒÂ¦ÃƒÅ ÃƒÂ´ÃƒÂÃƒâ€', NULL);
INSERT INTO `internal_resources` VALUES ('SP_DELMES', 'MND', 'Ãƒâ€žÃƒÂºÃƒâ€¢ÃƒÂ½Ãƒâ€”Ã‚Â¼Ã‚Â±Ã‚Â¸Ãƒâ€°Ã‚Â¾Ã‚Â³ÃƒÂ½Ãƒâ€¢Ã‚Â¾Ã‚ÂµÃƒÂ£Ãƒâ€™Ã‚Â³ÃƒÆ’ÃƒÂ¦Ã‚Â¡Ã‚Â£Ãƒâ€¡ÃƒÂ«Ãƒâ€”Ã‚Â¢Ãƒâ€™ÃƒÂ¢Ã‚Â£Ã‚Â¬Ãƒâ€¢Ã‚Â¾Ã‚ÂµÃƒÂ£Ãƒâ€™Ã‚Â³ÃƒÆ’ÃƒÂ¦Ã‚ÂµÃƒâ€žÃƒÅ Ã‚ÂµÃƒâ‚¬ÃƒÂ½Ãƒâ€™Ã‚Â²Ã‚Â»ÃƒÂ¡Ã‚Â±Ã‚Â»Ãƒâ€°Ã‚Â¾Ã‚Â³ÃƒÂ½!', NULL);
INSERT INTO `internal_resources` VALUES ('SP_DELETE', 'MND', 'Ãƒâ€°Ã‚Â¾Ã‚Â³ÃƒÂ½Ãƒâ€¢Ã‚Â¾Ã‚ÂµÃƒÂ£Ãƒâ€™Ã‚Â³ÃƒÆ’ÃƒÂ¦', NULL);
INSERT INTO `internal_resources` VALUES ('SP_PDELMES', 'MND', 'Ãƒâ€žÃƒÂºÃƒâ€¢ÃƒÂ½Ãƒâ€”Ã‚Â¼Ã‚Â±Ã‚Â¸Ãƒâ€°Ã‚Â¾Ã‚Â³ÃƒÂ½Ãƒâ€™Ã‚Â³ÃƒÆ’ÃƒÂ¦Ã‚Â¡Ã‚Â£Ãƒâ€¡ÃƒÂ«Ãƒâ€”Ã‚Â¢Ãƒâ€™ÃƒÂ¢Ã‚Â£Ã‚Â¬Ãƒâ€™Ã‚Â³ÃƒÆ’ÃƒÂ¦Ã‚ÂµÃƒâ€žÃƒÅ Ã‚ÂµÃƒâ‚¬ÃƒÂ½Ãƒâ€™Ã‚Â²Ã‚Â»ÃƒÂ¡Ã‚Â±Ã‚Â»Ãƒâ€°Ã‚Â¾Ã‚Â³ÃƒÂ½!', NULL);
INSERT INTO `internal_resources` VALUES ('SP_PDELETE', 'MND', 'Ãƒâ€°Ã‚Â¾Ã‚Â³ÃƒÂ½Ãƒâ€™Ã‚Â³ÃƒÆ’ÃƒÂ¦', NULL);
INSERT INTO `internal_resources` VALUES ('SP_CONFIGURE', 'MND', 'Ãƒâ€¦ÃƒÂ¤Ãƒâ€“ÃƒÆ’Ãƒâ€™Ã‚Â³ÃƒÆ’ÃƒÂ¦', NULL);
INSERT INTO `internal_resources` VALUES ('SP_CONFDESC', 'MND', 'Ãƒâ€žÃƒÂºÃ‚Â¿Ãƒâ€°Ãƒâ€™Ãƒâ€Ã‚Â½Ã‚Â«Ã‚Â±Ã‚Â¾Ãƒâ€¢Ã‚Â¾Ã‚ÂµÃƒÂ£Ãƒâ€™Ã‚Â³ÃƒÆ’ÃƒÂ¦Ã‚Â¹ÃƒËœÃƒÂÃ‚ÂªÃƒâ€“ÃƒÂÃƒâ€™Ã‚Â»Ã‚Â¸ÃƒÂ¶Ãƒâ€™Ãƒâ€˜Ã‚Â´ÃƒÂ¦Ãƒâ€ÃƒÅ¡Ã‚ÂµÃƒâ€žÃ‚Â´ÃƒËœÃ‚ÂµÃƒâ€žÃƒâ‚¬ÃƒÂ½Ã‚Â³ÃƒÅ’Ã‚Â£Ã‚Â¬Ã‚Â»ÃƒÂ²Ãƒâ€¢ÃƒÅ¸Ãƒâ€žÃƒÂºÃƒâ€™Ã‚Â²Ã‚Â¿Ãƒâ€°Ãƒâ€™Ãƒâ€Ã‚Â´Ã‚Â´Ã‚Â½Ã‚Â¨Ãƒâ€™Ã‚Â»Ã‚Â¸ÃƒÂ¶ÃƒÂÃƒâ€šÃ‚ÂµÃƒâ€žÃƒâ‚¬ÃƒÂ½Ã‚Â³ÃƒÅ’Ã‚Â£Ã‚Â¬Ãƒâ€¡ÃƒÂ«Ã‚Â¾ÃƒÂ¶Ã‚Â¶Ã‚Â¨Ãƒâ€žÃƒÂºÃƒÂÃƒÂ«Ãƒâ€”ÃƒÂ¶ÃƒÅ Ã‚Â²ÃƒÆ’Ã‚Â´Ã‚Â¡Ã‚Â£', NULL);
INSERT INTO `internal_resources` VALUES ('SP_LINK', 'MND', 'Ã‚Â¹ÃƒËœÃƒÂÃ‚ÂªÃƒâ€“ÃƒÂÃƒâ€™Ãƒâ€˜Ã‚Â´ÃƒÂ¦Ãƒâ€ÃƒÅ¡Ã‚ÂµÃƒâ€žÃ‚Â´ÃƒËœÃ‚ÂµÃƒâ€žÃƒâ‚¬ÃƒÂ½Ã‚Â³ÃƒÅ’', NULL);
INSERT INTO `internal_resources` VALUES ('SP_CLNEW', 'MND', 'Ã‚Â´Ã‚Â´Ã‚Â½Ã‚Â¨ÃƒÂÃƒâ€šÃ‚ÂµÃƒâ€žÃ‚Â´ÃƒËœÃ‚ÂµÃƒâ€žÃƒâ‚¬ÃƒÂ½Ã‚Â³ÃƒÅ’', NULL);
INSERT INTO `internal_resources` VALUES ('SP_EDIT', 'MND', 'Ã‚Â±ÃƒÂ Ã‚Â¼Ã‚Â­Ãƒâ€¢Ã‚Â¾Ã‚ÂµÃƒÂ£Ãƒâ€™Ã‚Â³ÃƒÆ’ÃƒÂ¦', NULL);
INSERT INTO `internal_resources` VALUES ('SP_MENUPROPS', 'MND', 'Ã‚Â²Ãƒâ€¹Ã‚ÂµÃ‚Â¥ÃƒÆ’ÃƒÂ»Ãƒâ€œÃƒÂ«Ã‚Â°ÃƒÂ¯Ãƒâ€“ÃƒÂºÃƒÅ½Ãƒâ€žÃƒâ€”Ãƒâ€“', NULL);
INSERT INTO `internal_resources` VALUES ('SP_MENUNAME', 'MND', 'Ã‚Â²Ãƒâ€¹Ã‚ÂµÃ‚Â¥Ãƒâ€°ÃƒÂÃ‚ÂµÃƒâ€žÃƒÆ’ÃƒÂ»Ã‚Â³Ãƒâ€ ', NULL);
INSERT INTO `internal_resources` VALUES ('SP_MENUHELP', 'MND', 'Ã‚Â²Ãƒâ€¹Ã‚ÂµÃ‚Â¥Ãƒâ€°ÃƒÂÃ‚ÂµÃƒâ€žÃ‚Â°ÃƒÂ¯Ãƒâ€“ÃƒÂºÃƒÅ½Ãƒâ€žÃƒâ€”Ãƒâ€“', NULL);
INSERT INTO `internal_resources` VALUES ('SP_LAUNCHDATE', 'MND', 'Ã‚Â´Ãƒâ€œ...Ã‚Â¼Ã‚Â¤Ã‚Â»ÃƒÂ®', NULL);
INSERT INTO `internal_resources` VALUES ('SP_EXPIREDATE', 'MND', 'Ã‚Â´Ãƒâ€œ...ÃƒÅ Ã‚Â§ÃƒÂÃ‚Â§', NULL);
INSERT INTO `internal_resources` VALUES ('SP_LAUNCHDATES', 'MND', 'ÃƒÅ Ã‚ÂµÃƒÅ Ã‚Â±Ãƒâ€¦ÃƒÂ¤Ãƒâ€“ÃƒÆ’', NULL);
INSERT INTO `internal_resources` VALUES ('SP_PREVIEW', 'MND', 'Ãƒâ€Ã‚Â¤Ãƒâ‚¬Ãƒâ‚¬Ãƒâ€™Ã‚Â³ÃƒÆ’ÃƒÂ¦', NULL);
INSERT INTO `internal_resources` VALUES ('SP_LAUNCH', 'MND', 'Ãƒâ€ ÃƒÂ´Ã‚Â¶Ã‚Â¯Ãƒâ€™Ã‚Â³ÃƒÆ’ÃƒÂ¦', NULL);
INSERT INTO `internal_resources` VALUES ('SP_EXPIRE', 'MND', 'ÃƒÅ Ã‚Â§ÃƒÂÃ‚Â§Ãƒâ€™Ã‚Â³ÃƒÆ’ÃƒÂ¦', NULL);
INSERT INTO `internal_resources` VALUES ('NOSPTITLE', 'MND', 'Ãƒâ€ ÃƒÂ´Ã‚Â¶Ã‚Â¯Ãƒâ€™Ã‚Â³ÃƒÆ’ÃƒÂ¦Ãƒâ€“Ã‚Â®Ãƒâ€¡Ã‚Â°Ãƒâ€žÃƒÂºÃ‚Â±ÃƒËœÃƒÂÃƒÂ«Ã‚Â¶Ã‚Â¨Ãƒâ€™ÃƒÂ¥Ã‚Â²Ãƒâ€¹Ã‚ÂµÃ‚Â¥Ãƒâ€°ÃƒÂÃ‚ÂµÃƒâ€žÃƒÆ’ÃƒÂ»Ã‚Â³Ãƒâ€ !', NULL);
INSERT INTO `internal_resources` VALUES ('SPM', 'MND', 'Ãƒâ€¢Ã‚Â¾Ã‚ÂµÃƒÂ£Ãƒâ€™Ã‚Â³ÃƒÆ’ÃƒÂ¦Master', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_EDIT', 'MND', 'Ã‚Â±ÃƒÂ Ã‚Â¼Ã‚Â­Ãƒâ€¢Ã‚Â¾Ã‚ÂµÃƒÂ£Ãƒâ€™Ã‚Â³ÃƒÆ’ÃƒÂ¦Master', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_META', 'MND', 'META-KeyÃƒâ€žÃ‚Â£Ã‚Â°ÃƒÂ¥', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_VARIATIONS', 'MND', 'Ã‚Â¿Ãƒâ€°ÃƒÂÃƒâ€ÃƒÅ Ã‚Â¾Ã‚ÂµÃƒâ€žÃ‚Â±ÃƒÂ¤ÃƒÂÃ‚Â¿', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_TYPE', 'MND', 'Ãƒâ€™Ã‚Â³ÃƒÆ’ÃƒÂ¦Ãƒâ€“Ãƒâ€“Ãƒâ‚¬ÃƒÂ ', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_CLUSTER', 'MND', 'Ã‚Â´ÃƒËœÃƒâ€žÃ‚Â£Ã‚Â°ÃƒÂ¥', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_PATH', 'MND', 'Ãƒâ€žÃ‚Â£Ã‚Â°ÃƒÂ¥Ãƒâ€šÃ‚Â·Ã‚Â¾Ã‚Â¶', NULL);
INSERT INTO `internal_resources` VALUES ('CL_BROWSE', 'MND', 'ÃƒÂ¤Ã‚Â¯Ãƒâ‚¬Ãƒâ‚¬Ã‚Â´ÃƒËœ', NULL);
INSERT INTO `internal_resources` VALUES ('CL_NEW', 'MND', 'ÃƒÂÃƒâ€šÃƒâ‚¬ÃƒÂ½Ã‚Â³ÃƒÅ’', NULL);
INSERT INTO `internal_resources` VALUES ('CL_PROPERTIES', 'MND', 'Ãƒâ‚¬ÃƒÂ½Ã‚Â³ÃƒÅ’ÃƒÅ ÃƒÂ´ÃƒÂÃƒâ€', NULL);
INSERT INTO `internal_resources` VALUES ('CL_DEL', 'MND', 'Ãƒâ€°Ã‚Â¾Ã‚Â³ÃƒÂ½Ãƒâ‚¬ÃƒÂ½Ã‚Â³ÃƒÅ’', NULL);
INSERT INTO `internal_resources` VALUES ('CL_DELMES', 'MND', 'Ãƒâ€žÃƒÂºÃƒË†Ã‚Â·ÃƒÅ Ã‚ÂµÃƒÂÃƒÂ«Ãƒâ€°Ã‚Â¾Ã‚Â³ÃƒÂ½Ãƒâ€¢ÃƒÂ¢Ã‚Â¸ÃƒÂ¶Ã‚Â´ÃƒËœÃƒâ‚¬ÃƒÂ½Ã‚Â³ÃƒÅ’Ãƒâ€šÃƒÂ°.Ãƒâ€¹ÃƒÂ¹Ãƒâ€œÃƒÂÃƒâ€žÃƒÅ¡ÃƒË†ÃƒÂÃƒÅ ÃƒÂ½Ã‚Â¾ÃƒÂÃ‚Â»ÃƒÂ¡Ã‚Â¶Ã‚ÂªÃƒÅ Ã‚Â§!', NULL);
INSERT INTO `internal_resources` VALUES ('CL_EDIT', 'MND', 'Ã‚Â±ÃƒÂ Ã‚Â¼Ã‚Â­Ã‚Â´ÃƒËœÃƒâ‚¬ÃƒÂ½Ã‚Â³ÃƒÅ’', NULL);
INSERT INTO `internal_resources` VALUES ('CL_CREATEINSTANC', 'MND', 'Ã‚Â´Ã‚Â´Ã‚Â½Ã‚Â¨ÃƒÂÃƒâ€šÃƒâ‚¬ÃƒÂ½Ã‚Â³ÃƒÅ’', NULL);
INSERT INTO `internal_resources` VALUES ('CL_CREATEINSMES', 'MND', 'ÃƒË†Ãƒâ€Ãƒâ€œÃƒÂÃ‚Â¿Ãƒâ€¢Ã‚Â¼ÃƒÂ¤Ã‚Â¿Ãƒâ€°Ã‚Â´Ã‚Â´Ã‚Â½Ã‚Â¨Ãƒâ€¢ÃƒÂ¢Ã‚Â¸ÃƒÂ¶Ãƒâ€žÃƒÅ¡ÃƒË†ÃƒÂÃƒâ€”Ãƒâ€“Ã‚Â¶ÃƒÅ½Ã‚ÂµÃƒâ€žÃ‚Â¶ÃƒÂ®ÃƒÂÃƒÂ¢Ãƒâ‚¬ÃƒÂ½Ã‚Â³ÃƒÅ’. ÃƒË†ÃƒÂ§Ã‚Â¹ÃƒÂ»Ãƒâ€žÃƒÂºÃƒÂÃƒÂ«Ã‚Â´Ã‚Â´Ã‚Â½Ã‚Â¨ÃƒÂÃƒÂ­Ãƒâ€™Ã‚Â»Ã‚Â¸ÃƒÂ¶Ãƒâ‚¬ÃƒÂ½Ã‚Â³ÃƒÅ’Ã‚Â£Ã‚Â¬Ãƒâ€¡ÃƒÂ«Ãƒâ€ÃƒÅ¡ÃƒÂÃƒâ€šÃƒÆ’ÃƒÂ¦Ã‚ÂµÃƒâ€žÃƒÅ½Ãƒâ€žÃƒâ€”Ãƒâ€“Ã‚Â¿ÃƒÂ²Ãƒâ€“ÃƒÂÃƒÅ ÃƒÂ¤ÃƒË†ÃƒÂ«Ã‚Â±ÃƒÂªÃƒÅ’ÃƒÂ¢Ã‚Â£Ã‚Â¬Ã‚Â²Ã‚Â¢Ã‚Â°Ã‚Â´ÃƒÂÃƒâ€šCreatÃ‚Â°Ã‚Â´Ãƒâ€¦Ã‚Â¥.', NULL);
INSERT INTO `internal_resources` VALUES ('CL_NOTITLE', 'MND', 'Ã‚Â»Ã‚Â¹ÃƒÅ½Ã‚Â´Ã‚Â¶Ã‚Â¨Ãƒâ€™ÃƒÂ¥Ã‚Â±ÃƒÂªÃƒÅ’ÃƒÂ¢', NULL);
INSERT INTO `internal_resources` VALUES ('TITLE', 'MND', 'Ã‚Â±ÃƒÂªÃƒÅ’ÃƒÂ¢', NULL);
INSERT INTO `internal_resources` VALUES ('CLI_EDIT', 'MND', 'Ã‚Â±ÃƒÂ Ã‚Â¼Ã‚Â­Ã‚Â´ÃƒËœÃ‚ÂºÃƒâ€¦', NULL);
INSERT INTO `internal_resources` VALUES ('CLI_DELETE', 'MND', 'Ãƒâ€°Ã‚Â¾Ã‚Â³ÃƒÂ½Ã‚Â´ÃƒËœÃ‚ÂºÃƒâ€¦', NULL);
INSERT INTO `internal_resources` VALUES ('CLI_DELETEMES', 'MND', 'Ãƒâ€žÃƒÂºÃƒË†Ã‚Â·ÃƒÅ Ã‚ÂµÃƒÂÃƒÂ«Ãƒâ€°Ã‚Â¾Ã‚Â³ÃƒÂ½Ãƒâ€¢ÃƒÂ¢Ã‚Â¸ÃƒÂ¶Ãƒâ‚¬ÃƒÂ½Ã‚Â³ÃƒÅ’Ãƒâ€šÃƒÂ°. Ãƒâ€¹ÃƒÂ¼Ã‚Â»ÃƒÂ¡Ãƒâ€œÃƒâ‚¬Ãƒâ€Ã‚Â¶ÃƒÅ Ã‚Â§ÃƒË†Ã‚Â¥!', NULL);
INSERT INTO `internal_resources` VALUES ('CLI_DELETED', 'MND', 'Ãƒâ€¢ÃƒÂ¢Ã‚Â¸ÃƒÂ¶Ãƒâ‚¬ÃƒÂ½Ã‚Â³ÃƒÅ’Ãƒâ€™Ãƒâ€˜Ã‚Â±Ã‚Â»Ãƒâ€°Ã‚Â¾Ã‚Â³ÃƒÂ½!', NULL);
INSERT INTO `internal_resources` VALUES ('CLI_NOTDELETED', 'MND', 'Ãƒâ€¢ÃƒÂ¢Ã‚Â¸ÃƒÂ¶Ãƒâ‚¬ÃƒÂ½Ã‚Â³ÃƒÅ’Ã‚Â²Ã‚Â»Ãƒâ€žÃƒÅ“Ã‚Â±Ã‚Â»Ãƒâ€°Ã‚Â¾Ã‚Â³ÃƒÂ½!', NULL);
INSERT INTO `internal_resources` VALUES ('CLI', 'MND', 'Ã‚Â´ÃƒËœÃƒâ‚¬ÃƒÂ½Ã‚Â³ÃƒÅ’:', NULL);
INSERT INTO `internal_resources` VALUES ('SR_SELECTCI', 'MND', 'Ãƒâ€žÃƒÂºÃ‚Â¿Ãƒâ€°Ãƒâ€¹Ãƒâ€˜Ãƒâ€¹ÃƒÂ·ÃƒË†ÃƒÅ½Ã‚ÂºÃƒÅ½Ãƒâ€¢ÃƒÂ¢Ãƒâ‚¬ÃƒÂ¯Ã‚ÂµÃƒâ€žÃƒâ€žÃƒÅ¡ÃƒË†ÃƒÂÃƒÅ’ÃƒÂµÃƒâ€žÃ‚Â¿.ÃƒË†ÃƒÂ§Ã‚Â¹ÃƒÂ»Ãƒâ€žÃƒÂºÃƒÂÃƒÂ«Ãƒâ€˜Ã‚Â¡Ã‚Â¶Ã‚Â¨Ãƒâ€™Ã‚Â»Ã‚Â¸ÃƒÂ¶Ãƒâ€žÃƒÅ¡ÃƒË†ÃƒÂÃƒÅ’ÃƒÂµÃƒâ€žÃ‚Â¿, Ã‚Â¿Ãƒâ€°Ãƒâ€˜Ã‚Â¡Ãƒâ€“ÃƒÂÃƒâ€¹ÃƒÂ¼Ã‚Â²Ã‚Â¢Ã‚Â°Ã‚Â´ÃƒÂÃƒâ€šÃ‚Â²Ã‚Â¢Ã‚Â°Ã‚Â´ÃƒÂÃƒâ€šUpdateÃ‚Â°Ã‚Â´Ãƒâ€¦Ã‚Â¥! ÃƒË†ÃƒÂ§Ã‚Â¹ÃƒÂ»Ãƒâ€žÃƒÂºÃƒÂÃƒÂ«Ã‚Â¹ÃƒËœÃƒÂÃ‚ÂªÃƒÂÃƒâ€šÃƒâ€žÃƒÅ¡ÃƒË†ÃƒÂÃƒâ€“ÃƒÂÃƒâ€¢ÃƒÂ¢Ã‚Â¸ÃƒÂ¶Ãƒâ€”Ãƒâ€“Ã‚Â¶ÃƒÅ½, create the content in the Object Browser first.', NULL);
INSERT INTO `internal_resources` VALUES ('SR_SELECTCLI', 'MND', 'Ãƒâ€¡ÃƒÂ«Ãƒâ€˜Ã‚Â¡Ãƒâ€ÃƒÂ±Ãƒâ€™Ã‚Â»Ã‚Â¸ÃƒÂ¶Ã‚Â´ÃƒËœÃƒâ€žÃ‚Â£Ã‚Â°ÃƒÂ¥. ÃƒË†Ã‚Â»Ã‚ÂºÃƒÂ³Ãƒâ€žÃƒÂºÃ‚Â¿Ãƒâ€°Ãƒâ€˜Ã‚Â¡Ãƒâ€ÃƒÂ±Ãƒâ€™Ã‚Â»Ã‚Â¸ÃƒÂ¶Ãƒâ€žÃ‚Â£Ã‚Â°ÃƒÂ¥Ã‚ÂµÃƒâ€žÃƒâ‚¬ÃƒÂ½Ã‚Â³ÃƒÅ’Ãƒâ‚¬Ã‚Â´ÃƒÅ Ã‚Â¹Ãƒâ€œÃƒÆ’.', NULL);
INSERT INTO `internal_resources` VALUES ('FOLDER', 'MND', 'ÃƒÅ½Ãƒâ€žÃ‚Â¼ÃƒÂ¾Ã‚Â¼ÃƒÂ', NULL);
INSERT INTO `internal_resources` VALUES ('CONTENTTYPE', 'MND', 'Ãƒâ€žÃƒÅ¡ÃƒË†ÃƒÂÃƒâ‚¬ÃƒÂ ÃƒÂÃƒÂ', NULL);
INSERT INTO `internal_resources` VALUES ('CONTENTITEM', 'MND', 'Ãƒâ€žÃƒÅ¡ÃƒË†ÃƒÂÃƒÅ’ÃƒÂµÃƒâ€žÃ‚Â¿', NULL);
INSERT INTO `internal_resources` VALUES ('SEARCH', 'MND', 'Ã‚Â¿Ã‚ÂªÃƒÅ Ã‚Â¼Ãƒâ€¹Ãƒâ€˜Ãƒâ€¹ÃƒÂ·', NULL);
INSERT INTO `internal_resources` VALUES ('SEARCHIN', 'MND', 'Ãƒâ€¹Ãƒâ€˜Ãƒâ€¹ÃƒÂ·', NULL);
INSERT INTO `internal_resources` VALUES ('SEARCHRESULTS', 'MND', 'Ãƒâ€¹Ãƒâ€˜Ãƒâ€¹ÃƒÂ·Ã‚Â½ÃƒÂ¡Ã‚Â¹ÃƒÂ»Ã‚Â£Ã‚Â¬Ãƒâ€¡ÃƒÂ«Ãƒâ€˜Ã‚Â¡Ãƒâ€ÃƒÂ±', NULL);
INSERT INTO `internal_resources` VALUES ('SELECTEDOBJECT', 'MND', 'Ã‚ÂµÃ‚Â±Ãƒâ€¡Ã‚Â°Ãƒâ€˜Ã‚Â¡Ãƒâ€ÃƒÂ±Ã‚ÂµÃƒâ€žÃƒâ€žÃƒÅ¡ÃƒË†ÃƒÂÃƒÅ’ÃƒÂµÃƒâ€žÃ‚Â¿', NULL);
INSERT INTO `internal_resources` VALUES ('SELECTEDINSTANCE', 'MND', 'Ãƒâ€˜Ã‚Â¡Ãƒâ€ÃƒÂ±Ã‚Â´ÃƒËœÃƒâ‚¬ÃƒÂ½Ã‚Â³ÃƒÅ’', NULL);
INSERT INTO `internal_resources` VALUES ('M_META', 'MND', 'MetaÃƒâ€žÃ‚Â£Ã‚Â°ÃƒÂ¥', NULL);
INSERT INTO `internal_resources` VALUES ('M_BROWSER', 'MND', 'Ãƒâ€žÃ‚Â¿Ã‚Â±ÃƒÂªÃƒÂ¤Ã‚Â¯Ãƒâ‚¬Ãƒâ‚¬Ãƒâ€ ÃƒÂ·', NULL);
INSERT INTO `internal_resources` VALUES ('M_INSTALLPLUGIN', 'MND', 'Ã‚Â²ÃƒÂ¥Ã‚Â¼ÃƒÂ¾', NULL);
INSERT INTO `internal_resources` VALUES ('M_ES', 'MND', 'ÃƒÅ’Ã‚Â½Ãƒâ€¹ÃƒÂ·Ãƒâ€¢Ã‚Â¾Ã‚ÂµÃƒÂ£', NULL);
INSERT INTO `internal_resources` VALUES ('M_SPM', 'MND', 'Ãƒâ€¢Ã‚Â¾Ã‚ÂµÃƒÂ£Ãƒâ€™Ã‚Â³ÃƒÆ’ÃƒÂ¦Master', NULL);
INSERT INTO `internal_resources` VALUES ('M_PRTMAN', 'MND', 'ÃƒË†ÃƒÂ«Ã‚Â¿ÃƒÅ¡Ã‚Â¹ÃƒÅ“Ãƒâ‚¬ÃƒÂ­Ãƒâ€ ÃƒÂ·', NULL);
INSERT INTO `internal_resources` VALUES ('M_MYPRT', 'MND', 'ÃƒÅ½Ãƒâ€™Ã‚ÂµÃƒâ€žÃƒË†ÃƒÂ«Ã‚Â¿ÃƒÅ¡', NULL);
INSERT INTO `internal_resources` VALUES ('M_MYPROFILE', 'MND', 'ÃƒÅ½Ãƒâ€™Ã‚ÂµÃƒâ€žÃ‚Â´Ã‚Â«Ãƒâ€šÃƒâ€', NULL);
INSERT INTO `internal_resources` VALUES ('M_LOGOUT', 'MND', 'Ã‚ÂµÃƒâ€¡Ã‚Â³ÃƒÂ¶', NULL);
INSERT INTO `internal_resources` VALUES ('M_CLB', 'MND', 'Ã‚Â´ÃƒËœÃƒÂ¤Ã‚Â¯Ãƒâ‚¬Ãƒâ‚¬Ãƒâ€ ÃƒÂ·', NULL);
INSERT INTO `internal_resources` VALUES ('M_CLTB', 'MND', 'Ã‚Â´ÃƒËœÃƒâ€žÃ‚Â£Ã‚Â°ÃƒÂ¥ÃƒÂ¤Ã‚Â¯Ãƒâ‚¬Ãƒâ‚¬Ãƒâ€ ÃƒÂ·', NULL);
INSERT INTO `internal_resources` VALUES ('M_UMAN', 'MND', 'Ãƒâ€œÃƒÆ’Ã‚Â»Ã‚Â§Ã‚Â¹ÃƒÅ“Ãƒâ‚¬ÃƒÂ­', NULL);
INSERT INTO `internal_resources` VALUES ('M_VAR', 'MND', 'Ã‚Â±ÃƒÂ¤ÃƒÂÃ‚Â¿', NULL);
INSERT INTO `internal_resources` VALUES ('M_PURGE', 'MND', 'Ã‚Â¾Ã‚Â»Ã‚Â»Ã‚Â¯ÃƒÅ ÃƒÂ½Ã‚Â¾ÃƒÂÃ‚Â¿ÃƒÂ¢', NULL);
INSERT INTO `internal_resources` VALUES ('M_PGN', 'MND', 'Ã‚Â²ÃƒÂ¥Ã‚Â¼ÃƒÂ¾Ã‚Â¿ÃƒËœÃƒâ€“Ãƒâ€ ', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_NEW', 'MND', 'ÃƒÂÃƒâ€šÃ‚Â´ÃƒËœÃƒâ€žÃ‚Â£Ã‚Â°ÃƒÂ¥', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_BROWSE', 'MND', 'ÃƒÂ¤Ã‚Â¯Ãƒâ‚¬Ãƒâ‚¬Ã‚Â´ÃƒËœÃƒâ€žÃ‚Â£Ã‚Â°ÃƒÂ¥', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_NAME', 'MND', 'Ã‚Â´ÃƒËœÃƒâ€žÃ‚Â£Ã‚Â°ÃƒÂ¥ÃƒÆ’ÃƒÂ»Ã‚Â³Ãƒâ€ ', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_PROPERTIES', 'MND', 'Ã‚Â´ÃƒËœÃƒâ€žÃ‚Â£Ã‚Â°ÃƒÂ¥ÃƒÅ ÃƒÂ´ÃƒÂÃƒâ€', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_DELETE', 'MND', 'Ãƒâ€°Ã‚Â¾Ã‚Â³ÃƒÂ½Ã‚Â´ÃƒËœÃƒâ€žÃ‚Â£Ã‚Â°ÃƒÂ¥', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_DELMES', 'MND', 'Ãƒâ€žÃƒÂºÃƒâ€¢ÃƒÂ½Ãƒâ€”Ã‚Â¼Ã‚Â±Ã‚Â¸Ãƒâ€°Ã‚Â¾Ã‚Â³ÃƒÂ½Ãƒâ€™Ã‚Â»Ã‚Â¸ÃƒÂ¶Ã‚Â´ÃƒËœÃƒâ€žÃ‚Â£Ã‚Â°ÃƒÂ¥. Ãƒâ€¢ÃƒÂ¢Ã‚Â»ÃƒÂ¡Ã‚ÂµÃ‚Â¼Ãƒâ€“Ãƒâ€šÃƒâ€ÃƒÅ¡Ãƒâ€žÃƒâ€¡Ã‚Â¸ÃƒÂ¶Ã‚Â´ÃƒËœÃƒâ€žÃ‚Â£Ã‚Â°ÃƒÂ¥Ãƒâ€°ÃƒÂÃ‚Â´Ã‚Â´Ã‚Â½Ã‚Â¨Ã‚ÂµÃƒâ€žÃƒâ€¹ÃƒÂ¹Ãƒâ€œÃƒÂ(!)Ãƒâ€žÃƒÅ¡ÃƒË†ÃƒÂÃ‚Â¶Ã‚ÂªÃƒÅ Ã‚Â§. Ãƒâ€žÃƒÂºÃƒË†Ã‚Â·Ã‚Â¶Ã‚Â¨Ãƒâ€™Ã‚ÂªÃ‚Â¼ÃƒÅ’ÃƒÂÃƒÂ¸Ãƒâ€šÃƒÂ°?', NULL);
INSERT INTO `internal_resources` VALUES ('CLTI_DELETE', 'MND', 'Ãƒâ€žÃƒÂºÃƒÅ Ãƒâ€¡Ã‚Â·ÃƒÂ±Ãƒâ€¢ÃƒÂ¦ÃƒÂÃƒÂ«Ãƒâ€°Ã‚Â¾Ã‚Â³ÃƒÂ½Ãƒâ€¢ÃƒÂ¢Ã‚Â¸ÃƒÂ¶ÃƒÅ’ÃƒÂµÃƒâ€žÃ‚Â¿. Ãƒâ€¢ÃƒÂ¢Ã‚Â¸ÃƒÂ¶ÃƒÅ’ÃƒÂµÃƒâ€žÃ‚Â¿Ã‚ÂµÃƒâ€žÃƒâ€¹ÃƒÂ¹Ãƒâ€œÃƒÂÃƒâ‚¬ÃƒÂ½Ã‚Â³ÃƒÅ’Ãƒâ€™Ã‚Â²Ã‚Â»ÃƒÂ¡Ã‚Â¶Ã‚ÂªÃƒÅ Ã‚Â§!', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_SCHEME', 'MND', 'Ã‚Â±ÃƒÂ Ã‚Â¼Ã‚Â­Ã‚Â´ÃƒËœÃƒâ€žÃ‚Â£Ã‚Â°ÃƒÂ¥Ã‚Â·Ã‚Â½Ã‚Â°Ã‚Â¸', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_MINCARD', 'MND', 'Ãƒâ€”ÃƒÂ®Ãƒâ€°Ãƒâ„¢Ãƒâ‚¬ÃƒÂ½Ã‚Â³ÃƒÅ’ÃƒÅ ÃƒÂ½', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_MAXCARD', 'MND', 'Ãƒâ€”ÃƒÂ®Ã‚Â´ÃƒÂ³Ãƒâ‚¬ÃƒÂ½Ã‚Â³ÃƒÅ’ÃƒÅ ÃƒÂ½', NULL);
INSERT INTO `internal_resources` VALUES ('LINKED', 'MND', 'Ã‚Â¹ÃƒËœÃƒÂÃ‚ÂªÃƒâ€“ÃƒÂ', NULL);
INSERT INTO `internal_resources` VALUES ('PG_INSTALLDESC', 'MND', 'Ãƒâ€¡ÃƒÂ«ÃƒË†Ã‚Â·Ã‚Â¶Ã‚Â¨Ãƒâ€žÃƒÂºÃƒâ€™Ãƒâ€˜Ã‚Â½Ã‚Â«Ãƒâ€¹ÃƒÂ¹Ãƒâ€œÃƒÂÃ‚Â±ÃƒËœÃƒÂÃƒÂ¨Ã‚ÂµÃƒâ€žÃƒÅ½Ãƒâ€žÃ‚Â¼ÃƒÂ¾Ã‚Â¸Ã‚Â´Ãƒâ€“Ãƒâ€ Ã‚ÂµÃ‚Â½Ãƒâ€¢ÃƒÂ¢Ã‚Â¸ÃƒÂ¶ÃƒÅ½Ãƒâ€žÃ‚Â¼ÃƒÂ¾Ã‚Â¼ÃƒÂÃ‚Â£Ã‚Â¬Ã‚Â·ÃƒÂ±Ãƒâ€ÃƒÂ²Ã‚Â²Ã‚Â»Ãƒâ€žÃƒÅ“Ã‚Â³Ãƒâ€°Ã‚Â¹Ã‚Â¦. Ãƒâ€ÃƒÅ¡ÃƒÂÃƒâ€šÃƒÆ’ÃƒÂ¦Ã‚ÂµÃƒâ€žÃƒÅ ÃƒÂ¤ÃƒË†ÃƒÂ«Ã‚Â¿ÃƒÂ²Ãƒâ€“ÃƒÂÃƒÅ ÃƒÂ¤ÃƒË†ÃƒÂ«Ã‚Â²ÃƒÂ¥Ã‚Â¼ÃƒÂ¾Ã‚ÂµÃƒâ€žÃƒâ€¢ÃƒÂ½ÃƒË†Ã‚Â·Ãƒâ€šÃ‚Â·Ã‚Â¾Ã‚Â¶. ÃƒÂÃ‚ÂµÃƒÂÃ‚Â³Ã‚Â¼Ã‚Â´Ã‚Â»ÃƒÂ¡Ãƒâ€”Ãƒâ€Ã‚Â¶Ã‚Â¯Ã‚Â°Ã‚Â²Ãƒâ€”Ã‚Â°Ã‚Â²ÃƒÂ¥Ã‚Â¼ÃƒÂ¾.', NULL);
INSERT INTO `internal_resources` VALUES ('PG_CHOOSE', 'MND', 'Ã‚Â²ÃƒÂ¥Ã‚Â¼ÃƒÂ¾: &nbsp; /plugin/', NULL);
INSERT INTO `internal_resources` VALUES ('PG_FILEWRONG', 'MND', 'Ãƒâ€ÃƒÅ¡Ã‚Â·ÃƒÂ¾ÃƒÅ½ÃƒÂ±Ãƒâ€ ÃƒÂ·Ãƒâ€°ÃƒÂÃƒâ€¢Ãƒâ€™Ã‚Â²Ã‚Â»Ã‚ÂµÃ‚Â½Ãƒâ€žÃƒÂºÃƒÅ ÃƒÂ¤ÃƒË†ÃƒÂ«Ã‚ÂµÃƒâ€žÃƒÅ½Ãƒâ€žÃ‚Â¼ÃƒÂ¾ÃƒÆ’ÃƒÂ»!', NULL);
INSERT INTO `internal_resources` VALUES ('CLASS_WRONG', 'MND', 'Ãƒâ€žÃƒÂºÃƒâ€“Ã‚Â¸Ã‚Â¶Ã‚Â¨Ã‚ÂµÃƒâ€žÃƒÅ½Ãƒâ€žÃ‚Â¼ÃƒÂ¾ÃƒÆ’Ã‚Â»Ãƒâ€œÃƒÂÃ‚ÂºÃƒÂÃ‚Â·Ã‚Â¨Ã‚ÂµÃƒâ€žÃƒâ‚¬ÃƒÂ ÃƒÂÃƒÂÃƒâ€¡Ã‚Â©ÃƒÆ’ÃƒÂ»!', NULL);
INSERT INTO `internal_resources` VALUES ('PG_INSTALLED', 'MND', 'Ã‚Â³Ãƒâ€°Ã‚Â¹Ã‚Â¦Ã‚Â°Ã‚Â²Ãƒâ€”Ã‚Â°Ã‚Â²ÃƒÂ¥Ã‚Â¼ÃƒÂ¾!', NULL);
INSERT INTO `internal_resources` VALUES ('PG_UPGRADED', 'MND', 'Ã‚Â³Ãƒâ€°Ã‚Â¹Ã‚Â¦Ãƒâ€°ÃƒÂ½Ã‚Â¼Ã‚Â¶Ã‚Â²ÃƒÂ¥Ã‚Â¼ÃƒÂ¾!', NULL);
INSERT INTO `internal_resources` VALUES ('PG_ERROR', 'MND', 'Ã‚Â°Ã‚Â²Ãƒâ€”Ã‚Â°Ã‚Â²ÃƒÂ¥Ã‚Â¼ÃƒÂ¾ÃƒÅ Ã‚Â±Ãƒâ€œÃƒÂÃ‚Â´ÃƒÂ­ÃƒÅ½ÃƒÂ³!', NULL);
INSERT INTO `internal_resources` VALUES ('PG_ALREADYINSTAL', 'MND', 'Ã‚Â²ÃƒÂ¥Ã‚Â¼ÃƒÂ¾Ãƒâ€™Ãƒâ€˜Ã‚Â±Ã‚Â»Ã‚Â°Ã‚Â²Ãƒâ€”Ã‚Â°!', NULL);
INSERT INTO `internal_resources` VALUES ('PG_NEWERINSTALLE', 'MND', 'Ãƒâ€™Ãƒâ€˜Ã‚Â¾Ã‚Â­Ã‚Â°Ã‚Â²Ãƒâ€”Ã‚Â°Ãƒâ€œÃƒÂÃƒâ€¢ÃƒÂ¢Ã‚Â¸ÃƒÂ¶Ã‚Â²ÃƒÂ¥Ã‚Â¼ÃƒÂ¾Ã‚ÂµÃƒâ€žÃƒÂÃƒâ€šÃ‚Â°ÃƒÂ¦Ã‚Â±Ã‚Â¾!', NULL);
INSERT INTO `internal_resources` VALUES ('PG_TITLE', 'MND', 'Ã‚Â²ÃƒÂ¥Ã‚Â¼ÃƒÂ¾', NULL);
INSERT INTO `internal_resources` VALUES ('PG_INSTALL', 'MND', 'Ã‚Â°Ã‚Â²Ãƒâ€”Ã‚Â°Ã‚Â²ÃƒÂ¥Ã‚Â¼ÃƒÂ¾', NULL);
INSERT INTO `internal_resources` VALUES ('PG_UNINSTALL', 'MND', 'ÃƒÂÃ‚Â¶Ãƒâ€ÃƒËœÃ‚Â²ÃƒÂ¥Ã‚Â¼ÃƒÂ¾', NULL);
INSERT INTO `internal_resources` VALUES ('PG_UNINSTALLMES', 'MND', 'Ãƒâ€žÃƒÂºÃƒâ€¢ÃƒÂ½Ãƒâ€”Ã‚Â¼Ã‚Â±Ã‚Â¸ÃƒÂÃ‚Â¶Ãƒâ€ÃƒËœÃƒâ€™Ã‚Â»Ã‚Â¸ÃƒÂ¶Ãƒâ€žÃ‚Â£Ã‚Â¿ÃƒÂ©. ÃƒÂÃ‚Â¶Ãƒâ€ÃƒËœÃƒâ€™Ã‚Â»Ã‚Â¸ÃƒÂ¶Ãƒâ€žÃ‚Â£Ã‚Â¿ÃƒÂ©Ã‚Â²Ã‚Â»Ãƒâ€“Ã‚Â»Ãƒâ€°Ã‚Â¾Ã‚Â³ÃƒÂ½Ãƒâ€žÃƒÅ¡ÃƒË†ÃƒÂÃƒâ‚¬ÃƒÂ ÃƒÂÃƒÂÃ‚Â£Ã‚Â¬ÃƒÂÃ‚Â¬ÃƒÅ Ã‚Â±Ãƒâ€™Ã‚Â²Ãƒâ€°Ã‚Â¾Ã‚Â³ÃƒÂ½Ãƒâ€¢ÃƒÂ¢Ã‚Â¸ÃƒÂ¶Ãƒâ‚¬ÃƒÂ ÃƒÂÃƒÂÃ‚Â´Ã‚Â¢Ã‚Â´ÃƒÂ¦Ãƒâ€ÃƒÅ¡ÃƒÅ ÃƒÂ½Ã‚Â¾ÃƒÂÃ‚Â¿ÃƒÂ¢Ãƒâ€“ÃƒÂÃ‚ÂµÃƒâ€žÃƒÆ’Ã‚Â¿Ã‚Â¸ÃƒÂ¶Ã‚ÂµÃ‚Â¥Ã‚Â¸ÃƒÂ¶Ãƒâ€žÃ‚Â¿Ã‚Â±ÃƒÂª. ÃƒÂÃ‚Â¶Ãƒâ€ÃƒËœÃ‚Â½Ã‚Â«Ã‚Â»ÃƒÂ¡Ã‚Â¿ÃƒÂÃ‚Â¶Ã‚Â¨Ãƒâ€°Ã‚Â¾Ã‚Â³ÃƒÂ½Ãƒâ€¢ÃƒÂ¢Ã‚Â¸ÃƒÂ¶Ãƒâ€žÃ‚Â£Ã‚Â¿ÃƒÂ©Ã‚ÂµÃƒâ€žÃƒâ€¹ÃƒÂ¹Ãƒâ€œÃƒÂ(!)ÃƒÅ ÃƒÂ½Ã‚Â¾ÃƒÂ!', NULL);
INSERT INTO `internal_resources` VALUES ('PG_UNINSTALLDELE', 'MND', 'ÃƒÂÃ‚Â¶Ãƒâ€ÃƒËœÃƒâ€žÃ‚Â£Ã‚Â¿ÃƒÂ©,<br> Ãƒâ€°Ã‚Â¾Ã‚Â³ÃƒÂ½Ãƒâ€¹ÃƒÂ¹Ãƒâ€œÃƒÂÃ‚Â¶Ãƒâ€Ãƒâ€œÃ‚Â¦Ã‚ÂµÃƒâ€žÃƒâ€žÃƒÅ¡ÃƒË†ÃƒÂ.', NULL);
INSERT INTO `internal_resources` VALUES ('O_NEW', 'MND', 'ÃƒÂÃƒâ€šÃƒâ€žÃ‚Â¿Ã‚Â±ÃƒÂª', NULL);
INSERT INTO `internal_resources` VALUES ('O_NAME', 'MND', 'Ãƒâ€žÃ‚Â¿Ã‚Â±ÃƒÂªÃƒÆ’ÃƒÂ»Ã‚Â³Ãƒâ€ ', NULL);
INSERT INTO `internal_resources` VALUES ('O_PROPERTIES', 'MND', 'Ãƒâ€žÃ‚Â¿Ã‚Â±ÃƒÂªÃƒÅ ÃƒÂ´ÃƒÂÃƒâ€', NULL);
INSERT INTO `internal_resources` VALUES ('O_DELMES', 'MND', 'Ãƒâ€žÃƒÂºÃƒâ€¢ÃƒÂ½Ãƒâ€”Ã‚Â¼Ã‚Â±Ã‚Â¸Ãƒâ€°Ã‚Â¾Ã‚Â³ÃƒÂ½Ãƒâ€™Ã‚Â»Ã‚Â¸ÃƒÂ¶Ãƒâ€žÃ‚Â¿Ã‚Â±ÃƒÂª. <b>Ãƒâ€”Ã‚Â¢Ãƒâ€™ÃƒÂ¢Ã‚Â»ÃƒÂ¡Ã‚Â¶Ã‚ÂªÃƒÅ Ã‚Â§Ãƒâ€¹ÃƒÂ¹Ãƒâ€œÃƒÂÃ‚Â±ÃƒÂ¤ÃƒÂÃ‚Â¿Ãƒâ€œÃƒÂ«META-DATA!</b>', NULL);
INSERT INTO `internal_resources` VALUES ('O_DEL', 'MND', 'Ãƒâ€°Ã‚Â¾Ã‚Â³ÃƒÂ½Ãƒâ€žÃ‚Â¿Ã‚Â±ÃƒÂª', NULL);
INSERT INTO `internal_resources` VALUES ('O_EDIT', 'MND', 'Ã‚Â±ÃƒÂ Ã‚Â¼Ã‚Â­Ãƒâ€žÃ‚Â¿Ã‚Â±ÃƒÂª', NULL);
INSERT INTO `internal_resources` VALUES ('O_PREVIEW', 'MND', 'Ãƒâ€Ã‚Â¤Ãƒâ‚¬Ãƒâ‚¬', NULL);
INSERT INTO `internal_resources` VALUES ('O_TEXT', 'MND', 'ÃƒÅ½Ãƒâ€žÃ‚Â±Ã‚Â¾', NULL);
INSERT INTO `internal_resources` VALUES ('O_ALT', 'MND', 'ALT-Tag', NULL);
INSERT INTO `internal_resources` VALUES ('O_COPYRIGHT', 'MND', 'Ã‚Â°ÃƒÂ¦ÃƒË†Ã‚Â¨', NULL);
INSERT INTO `internal_resources` VALUES ('O_BROWSE', 'MND', 'ÃƒÂ¤Ã‚Â¯Ãƒâ‚¬Ãƒâ‚¬Ãƒâ€žÃ‚Â¿Ã‚Â±ÃƒÂª', NULL);
INSERT INTO `internal_resources` VALUES ('R_HOME', 'MND', 'Ã‚Â¿Ã‚ÂªÃƒÅ Ã‚Â¼', NULL);
INSERT INTO `internal_resources` VALUES ('R_NEWFOLDER', 'MND', 'ÃƒÂÃƒâ€šÃƒÅ½Ãƒâ€žÃ‚Â¼ÃƒÂ¾Ã‚Â¼ÃƒÂ', NULL);
INSERT INTO `internal_resources` VALUES ('R_EDITFOLDER', 'MND', 'Ã‚Â±ÃƒÂ Ã‚Â¼Ã‚Â­ÃƒÅ½Ãƒâ€žÃ‚Â¼ÃƒÂ¾Ã‚Â¼ÃƒÂÃƒÅ ÃƒÂ´ÃƒÂÃƒâ€', NULL);
INSERT INTO `internal_resources` VALUES ('R_FOLDERNAME', 'MND', 'ÃƒÅ½Ãƒâ€žÃ‚Â¼ÃƒÂ¾Ã‚Â¼ÃƒÂÃƒÆ’ÃƒÂ»', NULL);
INSERT INTO `internal_resources` VALUES ('R_DELETEFOLDER', 'MND', 'Ãƒâ€°Ã‚Â¾Ã‚Â³ÃƒÂ½ÃƒÅ½Ãƒâ€žÃ‚Â¼ÃƒÂ¾Ã‚Â¼ÃƒÂ', NULL);
INSERT INTO `internal_resources` VALUES ('R_DELFOLDERMES', 'MND', 'Ãƒâ€žÃƒÂºÃƒâ€¢ÃƒÂ½Ãƒâ€”Ã‚Â¼Ã‚Â±Ã‚Â¸Ãƒâ€°Ã‚Â¾Ã‚Â³ÃƒÂ½Ãƒâ€™Ã‚Â»Ã‚Â¸ÃƒÂ¶ÃƒÅ½Ãƒâ€žÃ‚Â¼ÃƒÂ¾Ã‚Â¼ÃƒÂ.  Ãƒâ€¡ÃƒÂ«Ãƒâ€˜Ã‚Â¡Ãƒâ€ÃƒÂ±Ãƒâ€™Ã‚Â»Ã‚Â¸ÃƒÂ¶Ã‚Â¶Ã‚Â¯Ãƒâ€”ÃƒÂ·.', NULL);
INSERT INTO `internal_resources` VALUES ('R_FOLDERNOTEMPTY', 'MND', 'ÃƒÅ½Ãƒâ€žÃ‚Â¼ÃƒÂ¾Ã‚Â¼ÃƒÂÃ‚Â²Ã‚Â»Ã‚Â¿Ãƒâ€¢. Ãƒâ€™ÃƒÂ²Ã‚Â´Ãƒâ€¹Ãƒâ€žÃƒÂºÃ‚Â²Ã‚Â»Ãƒâ€žÃƒÅ“Ãƒâ€°Ã‚Â¾Ã‚Â³ÃƒÂ½Ãƒâ€¹ÃƒÂ¼! Ãƒâ€¡ÃƒÂ«Ã‚Â¼ÃƒÂ¬Ã‚Â²ÃƒÂ©Ãƒâ€¹ÃƒÂ¹Ãƒâ€œÃƒÂÃƒâ€žÃ‚Â¿Ã‚Â±ÃƒÂªÃƒâ€œÃƒÂ«Ã‚Â´ÃƒËœ!', NULL);
INSERT INTO `internal_resources` VALUES ('R_DELFOLDER', 'MND', 'Ãƒâ€°Ã‚Â¾Ã‚Â³ÃƒÂ½ÃƒÅ½Ãƒâ€žÃ‚Â¼ÃƒÂ¾Ã‚Â¼ÃƒÂÃƒâ€œÃƒÂ«Ãƒâ€¹ÃƒÂ¹Ãƒâ€œÃƒÂÃƒâ€”Ãƒâ€œÃƒâ€žÃ‚Â¿Ã‚Â±ÃƒÂª', NULL);
INSERT INTO `internal_resources` VALUES ('R_MOVEOBJECTS', 'MND', 'Ã‚Â½Ã‚Â«Ãƒâ€¹ÃƒÂ¹Ãƒâ€œÃƒÂÃƒâ€žÃ‚Â¿Ã‚Â±ÃƒÂªÃƒâ€™Ãƒâ€ Ãƒâ€“ÃƒÂÃ‚Â¸Ã‚Â¸Ã‚Â½ÃƒÂ¡Ã‚ÂµÃƒÂ£', NULL);
INSERT INTO `internal_resources` VALUES ('R_PARENT', 'MND', 'Ã‚Â¸Ã‚Â¸ÃƒÅ½Ãƒâ€žÃ‚Â¼ÃƒÂ¾Ã‚Â¼ÃƒÂ', NULL);
INSERT INTO `internal_resources` VALUES ('METATEMPLATES', 'MND', 'MetaÃƒÅ ÃƒÂ½Ã‚Â¾ÃƒÂÃƒâ€žÃ‚Â£Ã‚Â°ÃƒÂ¥', NULL);
INSERT INTO `internal_resources` VALUES ('MT_PROPERTIES', 'MND', 'Ã‚Â±ÃƒÂ Ã‚Â¼Ã‚Â­MetaÃƒâ€žÃ‚Â£Ã‚Â°ÃƒÂ¥ÃƒÅ ÃƒÂ´ÃƒÂÃƒâ€', NULL);
INSERT INTO `internal_resources` VALUES ('MT_SCHEME', 'MND', 'Ã‚Â±ÃƒÂ Ã‚Â¼Ã‚Â­MetaÃƒâ€žÃ‚Â£Ã‚Â°ÃƒÂ¥Ã‚Â·Ã‚Â½Ã‚Â°Ã‚Â¸', NULL);
INSERT INTO `internal_resources` VALUES ('MT_DELETE', 'MND', 'Ãƒâ€žÃƒÂºÃƒÅ Ãƒâ€¡Ã‚Â·ÃƒÂ±Ãƒâ€¢ÃƒÂ¦ÃƒÂÃƒÂ«Ãƒâ€°Ã‚Â¾Ã‚Â³ÃƒÂ½metaÃƒâ€žÃ‚Â£Ã‚Â°ÃƒÂ¥Ã‚ÂµÃƒâ€žÃƒâ€¢ÃƒÂ¢Ã‚Â¸ÃƒÂ¶Ã‚Â²Ã‚Â¿Ã‚Â·Ãƒâ€“? Ãƒâ€¹ÃƒÂ¹Ãƒâ€œÃƒÂÃ‚Â¹ÃƒËœÃƒÂÃ‚ÂªÃ‚ÂµÃ‚Â½Ãƒâ€¢ÃƒÂ¢Ã‚Â¸ÃƒÂ¶Ã‚Â²Ã‚Â¿Ã‚Â·Ãƒâ€“Ã‚ÂµÃƒâ€žÃƒâ€ÃƒÅ¡CMS METAÃƒÅ ÃƒÂ¤ÃƒË†ÃƒÂ«Ãƒâ€“ÃƒÂÃƒÅ ÃƒÂ¤ÃƒË†ÃƒÂ«Ã‚ÂµÃƒâ€žÃƒÂÃƒâ€¦ÃƒÂÃ‚Â¢Ã‚Â½Ã‚Â«Ã‚Â»ÃƒÂ¡Ã‚Â±Ã‚Â»Ãƒâ€°Ã‚Â¾Ã‚Â³ÃƒÂ½. ÃƒÅ ÃƒÂ½Ã‚Â¾ÃƒÂÃ‚Â»ÃƒÂ¡Ãƒâ€œÃƒâ‚¬Ãƒâ€Ã‚Â¶Ã‚Â¶Ã‚ÂªÃƒÅ Ã‚Â§!', NULL);
INSERT INTO `internal_resources` VALUES ('MT_ADDITIONAL', 'MND', 'Ã‚Â¸Ã‚Â½Ã‚Â¼Ãƒâ€œÃ‚ÂµÃƒâ€žMETAÃƒÅ ÃƒÂ½Ã‚Â¾ÃƒÂ', NULL);
INSERT INTO `internal_resources` VALUES ('MT_BASE', 'MND', 'Ã‚Â»ÃƒÂ¹Ã‚Â±Ã‚Â¾Ã‚ÂµÃƒâ€žMETAÃƒÅ ÃƒÂ½Ã‚Â¾ÃƒÂ', NULL);
INSERT INTO `internal_resources` VALUES ('MT_MODULE', 'MND', 'Ãƒâ€žÃƒÅ¡ÃƒË†ÃƒÂÃƒâ‚¬ÃƒÂ ÃƒÂÃƒÂÃƒâ€“Ã‚Â¸Ã‚Â¶Ã‚Â¨Ã‚ÂµÃƒâ€žMETAÃƒÅ ÃƒÂ½Ã‚Â¾ÃƒÂ', NULL);
INSERT INTO `internal_resources` VALUES ('VARIATIONS', 'MND', 'Ã‚Â¿Ãƒâ€°Ãƒâ€œÃƒÆ’Ã‚ÂµÃƒâ€žÃ‚Â±ÃƒÂ¤ÃƒÂÃ‚Â¿', NULL);
INSERT INTO `internal_resources` VALUES ('V_NAME', 'MND', 'ÃƒÆ’ÃƒÂ»Ã‚Â³Ãƒâ€ ', NULL);
INSERT INTO `internal_resources` VALUES ('V_SHORT', 'MND', 'Short-Tag', NULL);
INSERT INTO `internal_resources` VALUES ('V_EDIT', 'MND', 'Ã‚Â±ÃƒÂ Ã‚Â¼Ã‚Â­Ã‚Â±ÃƒÂ¤ÃƒÂÃ‚Â¿', NULL);
INSERT INTO `internal_resources` VALUES ('LOGIN_FAILED', 'MND', 'Ãƒâ€žÃƒÂºÃƒÅ ÃƒÂ¤ÃƒË†ÃƒÂ«Ã‚ÂµÃƒâ€žÃ‚ÂµÃƒâ€¡Ãƒâ€šÃ‚Â¼ÃƒÅ ÃƒÂ½Ã‚Â¾ÃƒÂÃ‚Â²Ã‚Â»Ãƒâ€žÃƒÅ“Ã‚Â±Ã‚Â»Ãƒâ€˜ÃƒÂ©Ãƒâ€“Ã‚Â¤! Ãƒâ€¡ÃƒÂ«Ãƒâ€Ãƒâ„¢ÃƒÅ Ãƒâ€Ãƒâ€™Ã‚Â»Ã‚Â±ÃƒÂ©.', NULL);
INSERT INTO `internal_resources` VALUES ('USER_HEAD', 'MND', 'Ãƒâ€œÃƒÆ’Ã‚Â»Ã‚Â§Ã‚Â´Ã‚Â«Ãƒâ€šÃƒâ€', NULL);
INSERT INTO `internal_resources` VALUES ('USER_LINK', 'MND', 'Ãƒâ€œÃƒÆ’Ã‚Â»Ã‚Â§Ã‚Â´Ã‚Â«Ãƒâ€šÃƒâ€', NULL);
INSERT INTO `internal_resources` VALUES ('USER_NAME', 'MND', 'Ãƒâ€œÃƒÆ’Ã‚Â»Ã‚Â§ÃƒÆ’ÃƒÂ»', NULL);
INSERT INTO `internal_resources` VALUES ('FULL_NAME', 'MND', 'ÃƒË†Ã‚Â«ÃƒÆ’ÃƒÂ»', NULL);
INSERT INTO `internal_resources` VALUES ('PASSWORD', 'MND', 'ÃƒÆ’ÃƒÅ“Ãƒâ€šÃƒÂ«', NULL);
INSERT INTO `internal_resources` VALUES ('USER_EMAIL', 'MND', 'eMail', NULL);
INSERT INTO `internal_resources` VALUES ('USER_ACTIVE', 'MND', 'ÃƒÅ Ã‚Â¹Ãƒâ€¢ÃƒÅ Ã‚ÂºÃƒâ€¦Ã‚Â¿Ãƒâ€°Ãƒâ€œÃƒÆ’', NULL);
INSERT INTO `internal_resources` VALUES ('USER_FILTERMENU', 'MND', 'Ãƒâ€œÃƒÆ’Ã‚Â»Ã‚Â§Ã‚Â¹ÃƒÅ“Ãƒâ‚¬ÃƒÂ­', NULL);
INSERT INTO `internal_resources` VALUES ('USER_SETPERM', 'MND', 'Ãƒâ€ÃƒÅ¡ÃƒÂÃƒâ€šÃƒÆ’ÃƒÂ¦Ãƒâ€°ÃƒÂ¨Ãƒâ€“ÃƒÆ’Ãƒâ€œÃƒÆ’Ã‚Â»Ã‚Â§ÃƒË†Ã‚Â¨ÃƒÂÃƒÅ¾. Ãƒâ€™Ã‚ÂªÃ‚Â´Ãƒâ€œÃƒâ€”ÃƒÂ©Ãƒâ€“ÃƒÂÃƒâ€°Ã‚Â¾Ã‚Â³ÃƒÂ½Ãƒâ€™Ã‚Â»Ã‚Â¸ÃƒÂ¶Ãƒâ€œÃƒÆ’Ã‚Â»Ã‚Â§, Ã‚Â½Ã‚Â«Ãƒâ€¹ÃƒÂ»Ã‚Â´Ãƒâ€œÃƒâ€¹ÃƒÂ¹Ãƒâ€œÃƒÂÃ‚ÂµÃƒâ€žÃƒâ€”ÃƒÂ©Ãƒâ€“ÃƒÂÃ‚Â³Ã‚Â·ÃƒÂÃƒÂ»Ã‚Â¼Ã‚Â´Ã‚Â¿Ãƒâ€°.', NULL);
INSERT INTO `internal_resources` VALUES ('USER_PERMGRID', 'MND', 'ÃƒË†Ã‚Â¨ÃƒÂÃƒÅ¾Ã‚Â±ÃƒÂ­', NULL);
INSERT INTO `internal_resources` VALUES ('GROUP_LINK', 'MND', 'Ãƒâ€”ÃƒÂ©Ã‚Â´Ã‚Â«Ãƒâ€šÃƒâ€', NULL);
INSERT INTO `internal_resources` VALUES ('GROUP_HEAD', 'MND', 'Ãƒâ€”ÃƒÂ©Ã‚Â´Ã‚Â«Ãƒâ€šÃƒâ€', NULL);
INSERT INTO `internal_resources` VALUES ('GROUP_NAME', 'MND', 'Ãƒâ€”ÃƒÂ©ÃƒÆ’ÃƒÂ»', NULL);
INSERT INTO `internal_resources` VALUES ('GROUP_DESCRIPTIO', 'MND', 'ÃƒÆ’ÃƒÂ¨ÃƒÅ ÃƒÂ¶', NULL);
INSERT INTO `internal_resources` VALUES ('GROUP_FILTERMENU', 'MND', 'Ãƒâ€”ÃƒÂ©Ã‚Â¹ÃƒÅ“Ãƒâ‚¬ÃƒÂ­', NULL);
INSERT INTO `internal_resources` VALUES ('ROLE_LINK', 'MND', 'Ã‚Â½Ãƒâ€¡Ãƒâ€°Ã‚Â«Ã‚Â´Ã‚Â«Ãƒâ€šÃƒâ€', NULL);
INSERT INTO `internal_resources` VALUES ('ROLE_HEAD', 'MND', 'Ã‚Â½Ãƒâ€¡Ãƒâ€°Ã‚Â«Ã‚Â´Ã‚Â«Ãƒâ€šÃƒâ€', NULL);
INSERT INTO `internal_resources` VALUES ('ROLE_NAME', 'MND', 'Ã‚Â½Ãƒâ€¡Ãƒâ€°Ã‚Â«ÃƒÆ’ÃƒÂ»e', NULL);
INSERT INTO `internal_resources` VALUES ('ROLE_DESCRIPTION', 'MND', 'ÃƒÆ’ÃƒÂ¨ÃƒÅ ÃƒÂ¶', NULL);
INSERT INTO `internal_resources` VALUES ('ROLE_FILTERMENU', 'MND', 'Ã‚Â½Ãƒâ€¡Ãƒâ€°Ã‚Â«Ã‚Â¹ÃƒÅ“Ãƒâ‚¬ÃƒÂ­', NULL);
INSERT INTO `internal_resources` VALUES ('USER_PERMISSIONS', 'MND', 'Ãƒâ€œÃƒÆ’Ã‚Â»Ã‚Â§ÃƒË†Ã‚Â¨ÃƒÂÃƒÅ¾', NULL);
INSERT INTO `internal_resources` VALUES ('UP_INTRO', 'MND', 'Ãƒâ€¡ÃƒÂ«Ãƒâ€˜Ã‚Â¡Ãƒâ€ÃƒÂ±Ãƒâ€žÃƒÂºÃƒÂÃƒÂ«Ã‚Â¸Ã‚Â³Ãƒâ€œÃƒÂ¨Ãƒâ€œÃƒÆ’Ã‚Â»Ã‚Â§Ã‚ÂµÃƒâ€žÃƒâ€”ÃƒÂ©Ã‚Â¼Ã‚Â°Ãƒâ€ÃƒÅ¡Ãƒâ€”ÃƒÂ©Ãƒâ€“ÃƒÂÃ‚ÂµÃƒâ€žÃ‚Â½Ãƒâ€¡Ãƒâ€°Ã‚Â«.', NULL);
INSERT INTO `internal_resources` VALUES ('USER_TO_GROUP', 'MND', 'ÃƒÅ’ÃƒÂ­Ã‚Â¼Ãƒâ€œÃƒâ€œÃƒÆ’Ã‚Â»Ã‚Â§Ã‚ÂµÃ‚Â½Ãƒâ€”ÃƒÂ©Ãƒâ€“ÃƒÂ', NULL);
INSERT INTO `internal_resources` VALUES ('ERROR_SEL_GROUP', 'MND', 'Ãƒâ€žÃƒÂºÃ‚Â±ÃƒËœÃƒÂÃƒÂ«Ãƒâ€˜Ã‚Â¡Ãƒâ€ÃƒÂ±Ãƒâ€™Ã‚Â»Ã‚Â¸ÃƒÂ¶Ãƒâ€”ÃƒÂ©!', NULL);
INSERT INTO `internal_resources` VALUES ('ERROR_SEL_ROLE', 'MND', 'Ãƒâ€žÃƒÂºÃ‚Â±ÃƒËœÃƒÂÃƒÂ«Ãƒâ€“ÃƒÂÃƒâ€°Ãƒâ„¢Ãƒâ€˜Ã‚Â¡Ãƒâ€ÃƒÂ±Ãƒâ€™Ã‚Â»Ã‚Â¸ÃƒÂ¶Ã‚Â½Ãƒâ€¡Ãƒâ€°Ã‚Â«!', NULL);
INSERT INTO `internal_resources` VALUES ('USER_PROFILE', 'MND', 'ÃƒÅ½Ãƒâ€™Ã‚ÂµÃƒâ€žÃ‚Â´Ã‚Â«Ãƒâ€šÃƒâ€', NULL);
INSERT INTO `internal_resources` VALUES ('COMMIT', 'MND', 'ÃƒÅ½Ã‚Â¯ÃƒÂÃƒÂ', NULL);
INSERT INTO `internal_resources` VALUES ('CANCEL', 'MND', 'ÃƒË†Ã‚Â¡ÃƒÂÃƒÂ»', NULL);
INSERT INTO `internal_resources` VALUES ('YES', 'MND', 'ÃƒÅ Ãƒâ€¡', NULL);
INSERT INTO `internal_resources` VALUES ('NO', 'MND', 'Ã‚Â·ÃƒÂ±', NULL);
INSERT INTO `internal_resources` VALUES ('NEW', 'MND', 'Ã‚Â²ÃƒÂ¥ÃƒË†ÃƒÂ«ÃƒÂÃƒâ€šÃ‚ÂµÃƒâ€ž', NULL);
INSERT INTO `internal_resources` VALUES ('NAME', 'MND', 'ÃƒÆ’ÃƒÂ»Ã‚Â³Ãƒâ€ ', NULL);
INSERT INTO `internal_resources` VALUES ('DESCRIPTION', 'MND', 'ÃƒÆ’ÃƒÂ¨ÃƒÅ ÃƒÂ¶', NULL);
INSERT INTO `internal_resources` VALUES ('DOSOMETHING', 'MND', 'Ãƒâ€¡ÃƒÂ«Ãƒâ€˜Ã‚Â¡Ãƒâ€ÃƒÂ±Ãƒâ€žÃƒÂºÃƒâ€™Ã‚ÂªÃ‚Â½ÃƒÂ¸ÃƒÂÃƒÂÃ‚ÂµÃƒâ€žÃ‚Â¶Ã‚Â¯Ãƒâ€”ÃƒÂ·. Ãƒâ€žÃƒÂºÃ‚Â¿Ãƒâ€°Ã‚Â²ÃƒÂ¥ÃƒË†ÃƒÂ«ÃƒÂÃƒâ€šÃƒÅ’ÃƒÂµÃƒâ€žÃ‚Â¿, Ã‚Â±ÃƒÂ Ã‚Â¼Ã‚Â­ÃƒÅ’ÃƒÂµÃƒâ€žÃ‚Â¿, Ãƒâ€°Ã‚Â¾Ã‚Â³ÃƒÂ½ÃƒÅ’ÃƒÂµÃƒâ€žÃ‚Â¿Ã‚Â¼Ã‚Â°Ã‚Â¸Ãƒâ€žÃ‚Â±ÃƒÂ¤ÃƒÅ’ÃƒÂµÃƒâ€žÃ‚Â¿Ãƒâ€¹Ã‚Â³ÃƒÂÃƒÂ².', NULL);
INSERT INTO `internal_resources` VALUES ('EDIT', 'MND', 'Ã‚Â±ÃƒÂ Ã‚Â¼Ã‚Â­', NULL);
INSERT INTO `internal_resources` VALUES ('UP', 'MND', 'Ãƒâ€°ÃƒÂ', NULL);
INSERT INTO `internal_resources` VALUES ('DOWN', 'MND', 'ÃƒÂÃƒâ€š', NULL);
INSERT INTO `internal_resources` VALUES ('CONTAINERNAME', 'MND', 'Ãƒâ€žÃ‚Â£Ã‚Â°ÃƒÂ¥', NULL);
INSERT INTO `internal_resources` VALUES ('SELECTOBJECT', 'MND', 'Ãƒâ€¡ÃƒÂ«Ãƒâ€˜Ã‚Â¡Ãƒâ€ÃƒÂ±Ãƒâ€™Ã‚Â»Ã‚Â¸ÃƒÂ¶Ãƒâ‚¬ÃƒÂ ÃƒÂÃƒÂÃ‚Â²Ã‚Â¢Ãƒâ€“Ã‚Â¸Ã‚Â¶Ã‚Â¨Ãƒâ€™Ã‚Â»Ã‚Â¸ÃƒÂ¶ÃƒÅ½Ã‚Â»Ãƒâ€“ÃƒÆ’Ãƒâ€œÃƒÂ«ÃƒÆ’ÃƒÂ»Ã‚Â³Ãƒâ€ Ãƒâ€™Ãƒâ€Ã‚Â±ÃƒÂ£Ã‚Â´Ã‚Â´Ã‚Â½Ã‚Â¨Ãƒâ€™Ã‚Â»Ã‚Â¸ÃƒÂ¶ÃƒÂÃƒâ€šÃƒâ€žÃ‚Â¿Ã‚Â±ÃƒÂª.<br>Ã‚Â¶Ãƒâ€Ãƒâ€œÃƒÅ¡ÃƒÅ½Ã‚Â»Ãƒâ€“ÃƒÆ’Ã‚Â£Ã‚Â¬Ã‚Â°Ã‚Â´Ãƒâ€žÃƒÂºÃ‚ÂµÃƒâ€žÃƒÂÃƒÂ¨Ãƒâ€™Ã‚ÂªÃ‚Â£Ã‚Â¬ÃƒÅ Ã‚Â¹Ãƒâ€œÃƒÆ’ 0 Ã‚Â½Ã‚Â«Ã‚Â²ÃƒÂ¥Ãƒâ€ÃƒÅ¡Ã‚Â¿Ã‚ÂªÃƒÂÃ‚Â·Ã‚Â£Ã‚Â¬999 Ã‚Â½Ã‚Â«Ã‚Â²ÃƒÂ¥Ãƒâ€ÃƒÅ¡Ãƒâ€žÃ‚Â©ÃƒÅ½Ã‚Â²Ã‚Â£Ã‚Â¬Ãƒâ€™Ãƒâ€Ã‚Â¼Ã‚Â°Ãƒâ€ ÃƒÂ¤Ãƒâ€¹ÃƒÂ¼ÃƒÅ½Ã‚Â»Ãƒâ€“ÃƒÆ’.', NULL);
INSERT INTO `internal_resources` VALUES ('POSITION', 'MND', 'ÃƒÅ½Ã‚Â»Ãƒâ€“ÃƒÆ’', NULL);
INSERT INTO `internal_resources` VALUES ('DELETE', 'MND', 'Ãƒâ€°Ã‚Â¾Ã‚Â³ÃƒÂ½', NULL);
INSERT INTO `internal_resources` VALUES ('TYPE', 'MND', 'Ãƒâ‚¬ÃƒÂ ÃƒÂÃƒÂ', NULL);
INSERT INTO `internal_resources` VALUES ('KEYWORDS', 'MND', 'Ã‚Â¹ÃƒËœÃ‚Â¼ÃƒÂ¼Ãƒâ€”Ãƒâ€“', NULL);
INSERT INTO `internal_resources` VALUES ('METATEMPLATE', 'MND', 'Ã‚Â¸Ã‚Â½Ã‚Â¼Ãƒâ€œÃ‚ÂµÃƒâ€žMETA-KeyÃƒâ€žÃ‚Â£Ã‚Â°ÃƒÂ¥', NULL);
INSERT INTO `internal_resources` VALUES ('SELECT_VARIATION', 'MND', 'Ãƒâ€˜Ã‚Â¡Ãƒâ€ÃƒÂ±Ã‚Â±ÃƒÂ¤ÃƒÂÃ‚Â¿', NULL);
INSERT INTO `internal_resources` VALUES ('ACTIVE_VARIATION', 'MND', 'Ã‚Â¼Ã‚Â¤Ã‚Â»ÃƒÂ®Ã‚ÂµÃƒâ€žÃ‚Â±ÃƒÂ¤ÃƒÂÃ‚Â¿:', NULL);
INSERT INTO `internal_resources` VALUES ('NO_VARIATIONS', 'MND', 'Ãƒâ€žÃ‚Â¿Ãƒâ€¡Ã‚Â°Ãƒâ€¢ÃƒÂ¢Ã‚Â¸ÃƒÂ¶ÃƒÆ’Ã‚Â»Ãƒâ€œÃƒÂÃ‚Â¶Ã‚Â¨Ãƒâ€™ÃƒÂ¥Ã‚Â±ÃƒÂ¤ÃƒÂÃ‚Â¿!<br> Ãƒâ€¡ÃƒÂ«Ãƒâ€¢Ãƒâ€™Ãƒâ€™Ã‚Â»ÃƒÅ½Ã‚Â»Ã‚Â¿Ã‚ÂªÃ‚Â·Ã‚Â¢Ãƒâ€¢ÃƒÅ¸Ã‚Â¼ÃƒÂ¬Ã‚Â²ÃƒÂ©Ãƒâ€¹ÃƒÂ¹Ãƒâ€˜Ã‚Â¡Ã‚ÂµÃƒâ€žÃƒÅ’ÃƒÂµÃƒâ€žÃ‚Â¿Ã‚ÂµÃƒâ€žÃƒâ€¦ÃƒÂ¤Ãƒâ€“ÃƒÆ’!', NULL);
INSERT INTO `internal_resources` VALUES ('ED_CONTENT', 'MND', 'Ã‚Â±ÃƒÂ Ã‚Â¼Ã‚Â­Ãƒâ€žÃƒÅ¡ÃƒË†ÃƒÂ', NULL);
INSERT INTO `internal_resources` VALUES ('ED_META', 'MND', 'Ã‚Â±ÃƒÂ Ã‚Â¼Ã‚Â­METAÃƒÅ ÃƒÂ½Ã‚Â¾ÃƒÂ', NULL);
INSERT INTO `internal_resources` VALUES ('ED_DISPATCHER', 'MND', 'ÃƒÅ Ã‚Â¹Ãƒâ€œÃƒÆ’Ãƒâ€¢ÃƒÂ¢Ã‚Â¸ÃƒÂ¶Ã‚Â°Ã‚Â´Ãƒâ€¦Ã‚Â¥Ãƒâ€ÃƒÅ¡Ã‚Â±ÃƒÂ Ã‚Â¼Ã‚Â­METAÃƒÅ ÃƒÂ½Ã‚Â¾ÃƒÂÃƒâ€œÃƒÂ«Ã‚Â±ÃƒÂ Ã‚Â¼Ã‚Â­Ãƒâ€žÃƒÅ¡ÃƒË†ÃƒÂÃƒâ€“Ã‚Â®Ã‚Â¼ÃƒÂ¤Ãƒâ€¡ÃƒÂÃ‚Â»Ã‚Â».', NULL);
INSERT INTO `internal_resources` VALUES ('PREVIEW', 'MND', 'Ãƒâ€Ã‚Â¤Ãƒâ‚¬Ãƒâ‚¬', NULL);
INSERT INTO `internal_resources` VALUES ('CHOOSEFILE', 'MND', 'Ãƒâ€˜Ã‚Â¡Ãƒâ€ÃƒÂ±Ãƒâ€™Ã‚Â»Ã‚Â¸ÃƒÂ¶ÃƒÅ½Ãƒâ€žÃ‚Â¼ÃƒÂ¾', NULL);
INSERT INTO `internal_resources` VALUES ('CONFIGURED', 'MND', 'Ãƒâ€™Ãƒâ€˜Ãƒâ€”Ã‚Â¼Ã‚Â±Ã‚Â¸Ã‚ÂºÃƒÆ’ÃƒÅ Ã‚Â¹Ãƒâ€œÃƒÆ’.', NULL);
INSERT INTO `internal_resources` VALUES ('NOTCONFIGURED', 'MND', 'ÃƒÅ½Ã‚Â´Ãƒâ€¦ÃƒÂ¤Ãƒâ€“ÃƒÆ’.', NULL);
INSERT INTO `internal_resources` VALUES ('CONFIG', 'MND', 'Ãƒâ€¦ÃƒÂ¤Ãƒâ€“ÃƒÆ’', NULL);
INSERT INTO `internal_resources` VALUES ('SELECT_CI', 'MND', 'Ãƒâ€˜Ã‚Â¡Ãƒâ€ÃƒÂ±Ãƒâ€™Ã‚Â»Ã‚Â¸ÃƒÂ¶Ãƒâ€žÃƒÅ¡ÃƒË†ÃƒÂÃƒÅ’ÃƒÂµÃƒâ€žÃ‚Â¿', NULL);
INSERT INTO `internal_resources` VALUES ('SELECT_CL', 'MND', 'Ãƒâ€˜Ã‚Â¡Ãƒâ€ÃƒÂ±Ãƒâ€™Ã‚Â»Ã‚Â¸ÃƒÂ¶Ã‚Â´ÃƒËœÃƒâ‚¬ÃƒÂ½Ã‚Â³ÃƒÅ’', NULL);
INSERT INTO `internal_resources` VALUES ('EMPTY', 'MND', '&lt;Ã‚Â¿Ãƒâ€¢&gt;', NULL);
INSERT INTO `internal_resources` VALUES ('STATUS', 'MND', 'Ãƒâ€”Ã‚Â´ÃƒÅ’Ã‚Â¬:', NULL);
INSERT INTO `internal_resources` VALUES ('UNIQUE', 'MND', 'Ãƒâ€¢ÃƒÂ¢Ã‚Â¸ÃƒÂ¶Ãƒâ€”Ãƒâ€“Ã‚Â¶ÃƒÅ½Ã‚Â±ÃƒËœÃƒÂÃƒÂ«ÃƒÅ Ãƒâ€¡ÃƒÅ½Ã‚Â¨Ãƒâ€™Ã‚Â»Ã‚ÂµÃƒâ€ž!', NULL);
INSERT INTO `internal_resources` VALUES ('MANDATORY', 'MND', 'Ãƒâ€¢ÃƒÂ¢Ã‚Â¸ÃƒÂ¶Ãƒâ€”Ãƒâ€“Ã‚Â¶ÃƒÅ½Ã‚Â±ÃƒËœÃƒÂÃƒÂ«ÃƒÅ½Ã‚ÂªÃ‚Â¿Ãƒâ€¢!', NULL);
INSERT INTO `internal_resources` VALUES ('NOTNUMBER', 'MND', 'Ãƒâ€žÃƒÂºÃ‚Â±ÃƒËœÃƒÂÃƒÂ«ÃƒÅ ÃƒÂ¤ÃƒË†ÃƒÂ«Ãƒâ€™Ã‚Â»Ã‚Â¸ÃƒÂ¶ÃƒÅ ÃƒÂ½Ãƒâ€”Ãƒâ€“Ã‚ÂµÃ‚Â½Ãƒâ€¢ÃƒÂ¢Ã‚Â¸ÃƒÂ¶Ãƒâ€”Ãƒâ€“Ã‚Â¶ÃƒÅ½Ãƒâ€“ÃƒÂ!', NULL);
INSERT INTO `internal_resources` VALUES ('WRONGDATE', 'MND', 'Ãƒâ€žÃƒÂºÃƒÅ ÃƒÂ¤ÃƒË†ÃƒÂ«Ã‚ÂµÃƒâ€žÃƒÅ ÃƒÂ½Ã‚Â¾ÃƒÂÃ‚Â²Ã‚Â»Ã‚Â´ÃƒÂ¦Ãƒâ€ÃƒÅ¡!', NULL);
INSERT INTO `internal_resources` VALUES ('DATEFORMAT', 'MND', 'ÃƒÅ ÃƒÂ½Ã‚Â¾ÃƒÂÃ‚Â¸ÃƒÂ±ÃƒÅ Ã‚Â½Ã‚Â²Ã‚Â»Ã‚Â¶Ãƒâ€!', NULL);
INSERT INTO `internal_resources` VALUES ('PWDNOTMATCH', 'MND', 'Ãƒâ€žÃƒÂºÃƒÅ ÃƒÂ¤ÃƒË†ÃƒÂ«Ã‚ÂµÃƒâ€žÃƒÆ’ÃƒÅ“Ãƒâ€šÃƒÂ«Ã‚Â²Ã‚Â»Ã‚Â¶Ãƒâ€!', NULL);
INSERT INTO `internal_resources` VALUES ('PWDTOOSHORT', 'MND', 'ÃƒÆ’ÃƒÅ“Ãƒâ€šÃƒÂ«Ã‚Â±ÃƒËœÃƒÂÃƒÂ«Ãƒâ€“ÃƒÂÃƒâ€°Ãƒâ„¢Ãƒâ€œÃƒÂÃƒâ€“ÃƒÂº6Ã‚Â¸ÃƒÂ¶Ãƒâ€”Ãƒâ€“Ã‚Â·ÃƒÂ»!', NULL);
INSERT INTO `internal_resources` VALUES ('PROCERROR', 'MND', 'Ã‚Â´Ã‚Â¦Ãƒâ‚¬ÃƒÂ­Ã‚Â±ÃƒÂ­Ã‚ÂµÃ‚Â¥ÃƒÅ Ã‚Â±Ã‚Â³ÃƒÂ¶ÃƒÂÃƒâ€“Ã‚Â´ÃƒÂ­ÃƒÅ½ÃƒÂ³. Ãƒâ€¡ÃƒÂ«Ã‚Â¼ÃƒÂ¬Ã‚Â²ÃƒÂ©Ã‚Â±ÃƒÂªÃƒÅ½Ã‚ÂªÃƒâ‚¬Ã‚Â¶Ãƒâ€°Ã‚Â«Ã‚ÂµÃƒâ€žÃƒâ€”Ãƒâ€“Ã‚Â¶ÃƒÅ½Ã‚Â²Ã‚Â¢Ãƒâ€Ãƒâ€žÃ‚Â¶ÃƒÂÃƒâ€žÃƒâ€¡Ãƒâ‚¬ÃƒÂ¯ÃƒË†Ã‚Â¡Ã‚ÂµÃƒÆ’Ã‚Â½ÃƒÂ¸Ãƒâ€™Ã‚Â»Ã‚Â²Ã‚Â½Ã‚ÂµÃƒâ€žÃƒÂÃƒâ€¦ÃƒÂÃ‚Â¢.', NULL);
INSERT INTO `internal_resources` VALUES ('SAVEERROR', 'MND', 'Ã‚Â½Ã‚Â«ÃƒÅ ÃƒÂ½Ã‚Â¾ÃƒÂÃ‚Â´ÃƒÂ¦ÃƒË†ÃƒÂ«ÃƒÅ ÃƒÂ½Ã‚Â¾ÃƒÂÃ‚Â¿ÃƒÂ¢ÃƒÅ Ã‚Â±Ã‚Â³ÃƒÂ¶ÃƒÂÃƒâ€“Ã‚Â´ÃƒÂ­ÃƒÅ½ÃƒÂ³. Ãƒâ€¡ÃƒÂ«ÃƒË†Ã‚Â·Ã‚Â¶Ã‚Â¨ÃƒÅ ÃƒÂ½Ã‚Â¾ÃƒÂÃ‚Â¿ÃƒÂ¢Ãƒâ€™Ãƒâ€˜ÃƒÂÃ‚Â¬Ã‚Â½Ãƒâ€œÃ‚Â£Ã‚Â¬Ã‚Â»ÃƒÂ²Ãƒâ€¢Ãƒâ€™Ãƒâ€žÃƒÂºÃ‚ÂµÃƒâ€žÃ‚Â¹ÃƒÅ“Ãƒâ‚¬ÃƒÂ­Ãƒâ€Ã‚Â±.', NULL);
INSERT INTO `internal_resources` VALUES ('SAVESUCCESS', 'MND', 'ÃƒÅ ÃƒÂ½Ã‚Â¾ÃƒÂÃ‚Â³Ãƒâ€°Ã‚Â¹Ã‚Â¦ÃƒÂÃ‚Â´ÃƒË†ÃƒÂ«ÃƒÅ ÃƒÂ½Ã‚Â¾ÃƒÂÃ‚Â¿ÃƒÂ¢.', NULL);
INSERT INTO `internal_resources` VALUES ('DELETESUCCESS', 'MND', 'ÃƒÂÃƒâ€šÃƒÂÃƒÂÃƒÅ ÃƒÂ½Ã‚Â¾ÃƒÂÃƒâ€™Ãƒâ€˜Ã‚Â±Ã‚Â»Ã‚Â´Ãƒâ€œÃƒÅ ÃƒÂ½Ã‚Â¾ÃƒÂÃ‚Â¿ÃƒÂ¢Ãƒâ€“ÃƒÂÃ‚Â³Ãƒâ€°Ã‚Â¹Ã‚Â¦Ãƒâ€°Ã‚Â¾Ã‚Â³ÃƒÂ½. ÃƒÂÃƒâ€“Ãƒâ€ÃƒÅ¡Ãƒâ€¹ÃƒÂ¼Ãƒâ€™Ãƒâ€˜Ã‚Â¶Ã‚ÂªÃƒÅ Ã‚Â§!', NULL);
INSERT INTO `internal_resources` VALUES ('SELECTONE', 'MND', 'Ãƒâ€žÃƒÂºÃ‚Â±ÃƒËœÃƒÂÃƒÂ«Ãƒâ€ÃƒÅ¡Ãƒâ€¢ÃƒÂ¢Ãƒâ‚¬ÃƒÂ¯Ãƒâ€”ÃƒÂ¶Ã‚Â³ÃƒÂ¶Ãƒâ€™Ã‚Â»Ã‚Â¸ÃƒÂ¶Ãƒâ€˜Ã‚Â¡Ãƒâ€ÃƒÂ±!', NULL);
INSERT INTO `internal_resources` VALUES ('CREATENEW', 'MND', 'Ãƒâ€¢ÃƒÂ¢Ã‚Â¸ÃƒÂ¶Ãƒâ€žÃ‚Â£Ã‚Â°ÃƒÂ¥Ãƒâ€™Ãƒâ€˜Ã‚Â´Ã‚Â´Ã‚Â½Ã‚Â¨Ãƒâ€™Ã‚Â»Ã‚Â¸ÃƒÂ¶ÃƒÂÃƒâ€šÃ‚Â³Ãƒâ€°Ãƒâ€Ã‚Â±. Ãƒâ€¡ÃƒÂ«Ã‚Â²ÃƒÅ½Ã‚Â¼ÃƒÂ»ÃƒÂÃƒâ€šÃƒÂÃƒÂÃƒÅ ÃƒÂ½Ã‚Â¾ÃƒÂ.', NULL);
INSERT INTO `internal_resources` VALUES ('PROMPTDELETE', 'MND', 'Ãƒâ€žÃƒÂºÃƒÅ Ãƒâ€¡Ã‚Â·ÃƒÂ±Ãƒâ€¢ÃƒÂ¦ÃƒÂÃƒÂ«Ãƒâ€°Ã‚Â¾Ã‚Â³ÃƒÂ½Ãƒâ€¢ÃƒÂ¢Ã‚Â¸ÃƒÂ¶ÃƒÅ ÃƒÂ½Ã‚Â¾ÃƒÂÃ‚Â¼Ã‚Â¯? Ãƒâ€¢ÃƒÂ¢Ã‚Â¸ÃƒÂ¶Ã‚Â¶Ã‚Â¯Ãƒâ€”ÃƒÂ·Ã‚Â²Ã‚Â»Ãƒâ€žÃƒÅ“Ã‚Â·Ã‚Â´Ã‚Â»ÃƒÅ¡!', NULL);
INSERT INTO `internal_resources` VALUES ('RESET', 'MND', 'Ãƒâ€“ÃƒËœÃƒâ€“ÃƒÆ’Ã‚Â±ÃƒÂ­Ã‚ÂµÃ‚Â¥', NULL);
INSERT INTO `internal_resources` VALUES ('BACK', 'MND', 'ÃƒÂÃƒâ€¹Ã‚Â»ÃƒËœ', NULL);
INSERT INTO `internal_resources` VALUES ('CREATE', 'MND', 'Ã‚Â´Ã‚Â´Ã‚Â½Ã‚Â¨ÃƒÅ’ÃƒÂµÃƒâ€žÃ‚Â¿', NULL);
INSERT INTO `internal_resources` VALUES ('ERROR', 'MND', 'Ãƒâ€ÃƒÅ¡Ã‚Â½ÃƒÂ¸ÃƒÂÃƒÂÃƒâ€¹ÃƒÂ¹Ãƒâ€˜Ã‚Â¡Ã‚Â²Ãƒâ„¢Ãƒâ€”ÃƒÂ·ÃƒÅ Ã‚Â±Ã‚Â³ÃƒÂ¶Ã‚Â´ÃƒÂ­!', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE', 'MND', 'Ã‚Â¾Ã‚Â»Ã‚Â»Ã‚Â¯ÃƒÅ ÃƒÂ½Ã‚Â¾ÃƒÂÃ‚Â¿ÃƒÂ¢', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_MES', 'MND', 'Ãƒâ€¡ÃƒÂ«Ãƒâ€˜Ã‚Â¡Ãƒâ€ÃƒÂ±Ãƒâ€žÃƒÂºÃƒÂÃƒÂ«Ã‚Â¾Ã‚Â»Ã‚Â»Ã‚Â¯Ã‚ÂµÃƒâ€žÃƒÅ ÃƒÂ½Ã‚Â¾ÃƒÂÃ‚Â¿ÃƒÂ¢Ã‚Â²Ã‚Â¿Ã‚Â·Ãƒâ€“.', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_VAR', 'MND', 'Ã‚Â¾Ã‚Â»Ã‚Â»Ã‚Â¯Ã‚Â²ÃƒÅ½ÃƒÅ ÃƒÂ½', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_CONTENT', 'MND', 'Ã‚Â¾Ã‚Â»Ã‚Â»Ã‚Â¯Ãƒâ€žÃƒÅ¡ÃƒË†ÃƒÂ', NULL);
INSERT INTO `internal_resources` VALUES ('VAR_SUCCEEDED', 'MND', ' Ã‚Â³Ãƒâ€°Ã‚Â¹Ã‚Â¦!', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_FOLDER', 'MND', 'Ã‚Â¾Ã‚Â»Ã‚Â»Ã‚Â¯ÃƒÅ½Ãƒâ€žÃ‚Â¼ÃƒÂ¾Ã‚Â¼ÃƒÂ', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_CLUSTER', 'MND', 'Ã‚Â¾Ã‚Â»Ã‚Â»Ã‚Â¯Ã‚Â´ÃƒËœ', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_META', 'MND', 'Ã‚Â¾Ã‚Â»Ã‚Â»Ã‚Â¯Meta', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_CLT', 'MND', 'Ã‚Â¾Ã‚Â»Ã‚Â»Ã‚Â¯Ã‚Â´ÃƒËœÃƒâ€žÃ‚Â£Ã‚Â°ÃƒÂ¥', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_PAGES', 'MND', 'Ã‚Â¾Ã‚Â»Ã‚Â»Ã‚Â¯Ãƒâ€¢Ã‚Â¾Ã‚ÂµÃƒÂ£Ãƒâ€™Ã‚Â³ÃƒÆ’ÃƒÂ¦Ãƒâ€œÃƒÂ«Masters', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_EXPIRED', 'MND', 'Ã‚Â¾Ã‚Â»Ã‚Â»Ã‚Â¯ÃƒÅ Ã‚Â§ÃƒÂÃ‚Â§Ã‚ÂµÃƒâ€žÃƒâ€™Ã‚Â³ÃƒÆ’ÃƒÂ¦', NULL);
INSERT INTO `internal_resources` VALUES ('PO_BROWSER', 'IT', 'Esplora il portale', NULL);
INSERT INTO `internal_resources` VALUES ('PO_OWNER', 'IT', 'Proprietario della pagina', NULL);
INSERT INTO `internal_resources` VALUES ('PO_CRSUCCEEDED', 'IT', 'La creazione della nuova pagina del portale ÃƒÂ¨ avvenuta con successo!', NULL);
INSERT INTO `internal_resources` VALUES ('PO_MYPORTAL', 'IT', 'Mio Portale', NULL);
INSERT INTO `internal_resources` VALUES ('PO_EDIT', 'IT', 'Edita la pagine dal portale', NULL);
INSERT INTO `internal_resources` VALUES ('SP_BROWSE', 'IT', 'Esplora la mappa del sito', NULL);
INSERT INTO `internal_resources` VALUES ('SP_NEWPAGE', 'IT', 'Aggiungi la pagina del sito', NULL);
INSERT INTO `internal_resources` VALUES ('SP_NEWINSTANCE', 'IT', 'Aggiungere Pagina', NULL);
INSERT INTO `internal_resources` VALUES ('SP_IPROPERTIES', 'IT', 'PropietÃƒÂ  dalla pagina', NULL);
INSERT INTO `internal_resources` VALUES ('SP_PROPERTIES', 'IT', 'ProprietÃƒÂ  della pagina del sito', NULL);
INSERT INTO `internal_resources` VALUES ('SP_DELETE', 'IT', 'Cancella la pagina del sito', NULL);
INSERT INTO `internal_resources` VALUES ('SP_PDELETE', 'IT', 'Cancella Pagina', NULL);
INSERT INTO `internal_resources` VALUES ('SP_CONFIGURE', 'IT', 'Configura Pagina', NULL);
INSERT INTO `internal_resources` VALUES ('SP_CONFDESC', 'IT', 'Puoi collegare la pagina del sito a una istanza di gruppo esistente, o puoi creare una nuova istanza. Decidere cosa fare.', NULL);
INSERT INTO `internal_resources` VALUES ('SP_LINK', 'IT', 'Collegare a una istanza di gruppo esistente', NULL);
INSERT INTO `internal_resources` VALUES ('SP_CLNEW', 'IT', 'Creare una nuova istanza di gruppo', NULL);
INSERT INTO `internal_resources` VALUES ('SP_EDIT', 'IT', 'Edita la pagina del sito', NULL);
INSERT INTO `internal_resources` VALUES ('SP_MENUPROPS', 'IT', 'Nome del menÃƒÂ¹ e testo di aiuto', NULL);
INSERT INTO `internal_resources` VALUES ('SP_MENUNAME', 'IT', 'Nome nel MenÃƒÂ¹', NULL);
INSERT INTO `internal_resources` VALUES ('SP_MENUHELP', 'IT', 'Testo di aiuto per il MenÃƒÂ¹', NULL);
INSERT INTO `internal_resources` VALUES ('SP_LAUNCHDATE', 'IT', 'Attivata da', NULL);
INSERT INTO `internal_resources` VALUES ('SP_EXPIREDATE', 'IT', 'Scaduta da', NULL);
INSERT INTO `internal_resources` VALUES ('SP_LAUNCHDATES', 'IT', 'Configurazione del tempo di vita', NULL);
INSERT INTO `internal_resources` VALUES ('SP_PREVIEW', 'IT', 'Pagina Precedente', NULL);
INSERT INTO `internal_resources` VALUES ('SP_LAUNCH', 'IT', 'Aprire la Pagina', NULL);
INSERT INTO `internal_resources` VALUES ('SP_EXPIRE', 'IT', 'FÃƒÂ  scadere pagina', NULL);
INSERT INTO `internal_resources` VALUES ('SPM', 'IT', 'Pagina del sito principale', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_EDIT', 'IT', 'Edita pagina del sito principale', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_META', 'IT', 'Template di META-chiavi', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_VARIATIONS', 'IT', 'Variazioni visualizabili', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_TYPE', 'IT', 'Tipo di pagina', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_CLUSTER', 'IT', 'Gruppo di Template', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_PATH', 'IT', 'Percorso dei Template', NULL);
INSERT INTO `internal_resources` VALUES ('CL_BROWSE', 'IT', 'Esplora gruppo', NULL);
INSERT INTO `internal_resources` VALUES ('CL_NEW', 'IT', 'Nuova istanza', NULL);
INSERT INTO `internal_resources` VALUES ('CL_PROPERTIES', 'IT', 'ProprietÃƒÂ  del gruppo', NULL);
INSERT INTO `internal_resources` VALUES ('CL_DEL', 'IT', 'Cancella istanza', NULL);
INSERT INTO `internal_resources` VALUES ('CL_CREATEINSTANC', 'IT', 'Creare nuova istanza', NULL);
INSERT INTO `internal_resources` VALUES ('CL_NOTITLE', 'IT', 'Nessun titolo definito', NULL);
INSERT INTO `internal_resources` VALUES ('TITLE', 'IT', 'Titolo', NULL);
INSERT INTO `internal_resources` VALUES ('CLI_EDIT', 'IT', 'Edita membri del gruppo', NULL);
INSERT INTO `internal_resources` VALUES ('CLI_DELETE', 'IT', 'Cancella membri del gruppo', NULL);
INSERT INTO `internal_resources` VALUES ('CLI_DELETEMES', 'IT', 'Vuoi veramente cancellare questa istanza. SarÃƒÂ  persa per sempre!', NULL);
INSERT INTO `internal_resources` VALUES ('CLI', 'IT', 'Istanza di gruppo:', NULL);
INSERT INTO `internal_resources` VALUES ('SR_SELECTCI', 'IT', 'Puoi cercare quÃƒÂ¬ per ogni content-items . Se vuoi selezionare un content-item, sceglierlo e premere il pulsante di Update ! Se vuoi connettere un nuovo contenuto con questo campo, bisogna prima creare il contenuto nel navigatore di oggetti.', NULL);
INSERT INTO `internal_resources` VALUES ('SR_SELECTCLI', 'IT', 'Selezionare un cluster-template. DopodichÃƒÂ¨ puoi selezionare una istanza del template da assegnare.', NULL);
INSERT INTO `internal_resources` VALUES ('FOLDER', 'IT', 'Cartella', NULL);
INSERT INTO `internal_resources` VALUES ('CONTENTTYPE', 'IT', 'Content-Type', NULL);
INSERT INTO `internal_resources` VALUES ('CONTENTITEM', 'IT', 'Content-Item', NULL);
INSERT INTO `internal_resources` VALUES ('SEARCH', 'IT', 'Inizia ricerca', NULL);
INSERT INTO `internal_resources` VALUES ('SEARCHIN', 'IT', 'Ricerca per', NULL);
INSERT INTO `internal_resources` VALUES ('SEARCHRESULTS', 'IT', 'Risultati della ricerca, fare un scelta', NULL);
INSERT INTO `internal_resources` VALUES ('SELECTEDOBJECT', 'IT', 'Content-Item attualmente selezionato', NULL);
INSERT INTO `internal_resources` VALUES ('SELECTEDINSTANCE', 'IT', 'Seleziona una istanza Cluster', NULL);
INSERT INTO `internal_resources` VALUES ('M_META', 'IT', 'Meta Templates', NULL);
INSERT INTO `internal_resources` VALUES ('M_BROWSER', 'IT', 'Esplora oggetti', NULL);
INSERT INTO `internal_resources` VALUES ('M_INSTALLPLUGIN', 'IT', 'PlugIns', NULL);
INSERT INTO `internal_resources` VALUES ('M_ES', 'IT', 'Explora il  Sito', NULL);
INSERT INTO `internal_resources` VALUES ('M_SPM', 'IT', 'Pagina principale', NULL);
INSERT INTO `internal_resources` VALUES ('M_PRTMAN', 'IT', 'Manager del portale', NULL);
INSERT INTO `internal_resources` VALUES ('M_MYPRT', 'IT', 'Mio Portale', NULL);
INSERT INTO `internal_resources` VALUES ('M_MYPROFILE', 'IT', 'Mio Profilo', NULL);
INSERT INTO `internal_resources` VALUES ('M_LOGOUT', 'IT', 'Sconnettiti', NULL);
INSERT INTO `internal_resources` VALUES ('M_CLB', 'IT', 'Esplora i Cluster', NULL);
INSERT INTO `internal_resources` VALUES ('M_CLTB', 'IT', 'Esplora i Cluster-Template', NULL);
INSERT INTO `internal_resources` VALUES ('M_UMAN', 'IT', 'Manager utente', NULL);
INSERT INTO `internal_resources` VALUES ('M_VAR', 'IT', 'Variazioni', NULL);
INSERT INTO `internal_resources` VALUES ('M_PURGE', 'IT', 'Ripulisci Database', NULL);
INSERT INTO `internal_resources` VALUES ('M_PGN', 'IT', 'Controllo deiPlugin', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_NEW', 'IT', 'Nuovo CL-Template', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_BROWSE', 'IT', 'Esplora il CL-Templates', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_NAME', 'IT', 'Nome del CL-Template', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_PROPERTIES', 'IT', 'ProprietÃƒÂ  del Cluster-Template', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_DELETE', 'IT', 'Cancella il Cluster-Template', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_DELMES', 'IT', 'Vuoi candellare il cluster-template. Questo comporterÃƒÂ  la perdita di tutti(!) i contenuti creati su e con il cluster-template. Sei sicuro, vuoi proseguire?', NULL);
INSERT INTO `internal_resources` VALUES ('CLTI_DELETE', 'IT', 'Vuoi veramente cancellare questo oggetto. Tutte le istanza di questo oggetto saranno perse!', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_SCHEME', 'IT', 'Edita lo schema  Cluster-Template', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_MINCARD', 'IT', 'Minimo numero di istanze', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_MAXCARD', 'IT', 'Massimo numero di istanze', NULL);
INSERT INTO `internal_resources` VALUES ('LINKED', 'IT', 'Collegato  con', NULL);
INSERT INTO `internal_resources` VALUES ('PG_INSTALLDESC', 'IT', 'Essere sicuri di aver copiato tutti i necessari file nella cartella. Inserire il percorso corretto per i plugin nel campo sottostante. Il sistema istallerÃƒÂ  i the PlugIn automaticamente.', NULL);
INSERT INTO `internal_resources` VALUES ('PG_CHOOSE', 'IT', 'PlugIn: &nbsp; /plugin/', NULL);
INSERT INTO `internal_resources` VALUES ('PG_FILEWRONG', 'IT', 'Il file inserito non ÃƒÂ¨ stato trovato nel server!', NULL);
INSERT INTO `internal_resources` VALUES ('CLASS_WRONG', 'IT', 'Il file specificato non ha un firma di classe valida!', NULL);
INSERT INTO `internal_resources` VALUES ('PG_INSTALLED', 'IT', 'Il PlugIn ÃƒÂ¨ stato installato con successo!', NULL);
INSERT INTO `internal_resources` VALUES ('PG_UPGRADED', 'IT', 'Il PlugIn ÃƒÂ¨ stato aggiornato con successo!', NULL);
INSERT INTO `internal_resources` VALUES ('PG_ALREADYINSTAL', 'IT', 'Il PlugIn ÃƒÂ¨ giÃƒÂ  istallato!', NULL);
INSERT INTO `internal_resources` VALUES ('PG_TITLE', 'IT', 'PlugIns', NULL);
INSERT INTO `internal_resources` VALUES ('PG_INSTALL', 'IT', 'Aggiungi PlugIn', NULL);
INSERT INTO `internal_resources` VALUES ('PG_UNINSTALL', 'IT', 'Rimuovi PlugIn', NULL);
INSERT INTO `internal_resources` VALUES ('PG_UNINSTALLMES', 'IT', 'Stai per rimuovere un modulo. Rimuovere un modulo non solo rimuove i tipi contenuti ma anche cancella ogni singolo oggetto di questo tipo che sono immagazzinati nel database. La rimozione cancellerÃƒÂ  definitivamente tutti(!) i dati di questo modulo!', NULL);
INSERT INTO `internal_resources` VALUES ('PG_UNINSTALLDELE', 'IT', 'Rimuovi il modulo,<br> Cancella tutti i contenuti corrispondenti.', NULL);
INSERT INTO `internal_resources` VALUES ('O_NEW', 'IT', 'Nuovo oggetto', NULL);
INSERT INTO `internal_resources` VALUES ('O_PROPERTIES', 'IT', 'ProprietÃƒÂ  degli oggetti', NULL);
INSERT INTO `internal_resources` VALUES ('O_DELMES', 'IT', 'Stai per cancellare un oggetto. <b>Tutte le variazioni e i META-DATI saranno perse!</b>', NULL);
INSERT INTO `internal_resources` VALUES ('O_DEL', 'IT', 'Cancella oggetto', NULL);
INSERT INTO `internal_resources` VALUES ('O_EDIT', 'IT', 'Edita oggetto', NULL);
INSERT INTO `internal_resources` VALUES ('O_PREVIEW', 'IT', 'Anteprima di', NULL);
INSERT INTO `internal_resources` VALUES ('O_TEXT', 'IT', 'Testo', NULL);
INSERT INTO `internal_resources` VALUES ('O_ALT', 'IT', 'ALT-Tag', NULL);
INSERT INTO `internal_resources` VALUES ('O_COPYRIGHT', 'IT', 'Copyright', NULL);
INSERT INTO `internal_resources` VALUES ('O_BROWSE', 'IT', 'Esplora oggetti', NULL);
INSERT INTO `internal_resources` VALUES ('R_HOME', 'IT', 'Inizia', NULL);
INSERT INTO `internal_resources` VALUES ('R_NEWFOLDER', 'IT', 'Nuovo contenitore', NULL);
INSERT INTO `internal_resources` VALUES ('R_EDITFOLDER', 'IT', 'Edita le proprietÃƒÂ  del contenitore', NULL);
INSERT INTO `internal_resources` VALUES ('R_FOLDERNAME', 'IT', 'Nomina il contenitore', NULL);
INSERT INTO `internal_resources` VALUES ('R_DELETEFOLDER', 'IT', 'Cancella il contenitore', NULL);
INSERT INTO `internal_resources` VALUES ('R_FOLDERNOTEMPTY', 'IT', 'Il contenitore non ÃƒÂ¨ vuoto. Non ÃƒÂ¨ possibili cancellarlo! Controllare tutti gli oggetti e gruppi!', NULL);
INSERT INTO `internal_resources` VALUES ('R_DELFOLDER', 'IT', 'Cancellare il contenitore a tutti gli oggetti figli', NULL);
INSERT INTO `internal_resources` VALUES ('R_MOVEOBJECTS', 'IT', 'Spostare tutti gli oggetti nel nodo principale', NULL);
INSERT INTO `internal_resources` VALUES ('R_PARENT', 'IT', 'Contenitore principale', NULL);
INSERT INTO `internal_resources` VALUES ('METATEMPLATES', 'IT', 'Contenitori Meta-Dati', NULL);
INSERT INTO `internal_resources` VALUES ('MT_PROPERTIES', 'IT', 'Edita la proprietÃƒÂ  dei Meta-Contenitori', NULL);
INSERT INTO `internal_resources` VALUES ('MT_SCHEME', 'IT', 'Edita schemi dei Meta-Contenitori', NULL);
INSERT INTO `internal_resources` VALUES ('MT_DELETE', 'IT', 'Vuoi veramente cancellare questa parte di meta-contenitori? Tutte le informazioni inserite in ogni META-ingresso in CMS collegati con queste parti saranno cancellati. I dati saranno persi per sempre!', NULL);
INSERT INTO `internal_resources` VALUES ('MT_ADDITIONAL', 'IT', 'META-Dati addizionali', NULL);
INSERT INTO `internal_resources` VALUES ('MT_BASE', 'IT', 'META-Dati base', NULL);
INSERT INTO `internal_resources` VALUES ('MT_MODULE', 'IT', 'Specificare i META-Dati del modulo', NULL);
INSERT INTO `internal_resources` VALUES ('VARIATIONS', 'IT', 'Variazioni Disponibili', NULL);
INSERT INTO `internal_resources` VALUES ('V_NAME', 'IT', 'Nome', NULL);
INSERT INTO `internal_resources` VALUES ('V_SHORT', 'IT', 'Short-Tag', NULL);
INSERT INTO `internal_resources` VALUES ('V_EDIT', 'IT', 'Editare variazioni', NULL);
INSERT INTO `internal_resources` VALUES ('LOGIN_FAILED', 'IT', 'I dati di accesso inseriti non possono essere verificati! Riprovare.', NULL);
INSERT INTO `internal_resources` VALUES ('USER_HEAD', 'IT', 'Profilo Utente', NULL);
INSERT INTO `internal_resources` VALUES ('USER_LINK', 'IT', 'Profili Utente', NULL);
INSERT INTO `internal_resources` VALUES ('USER_NAME', 'IT', 'Nome utente', NULL);
INSERT INTO `internal_resources` VALUES ('FULL_NAME', 'IT', 'Name Completo', NULL);
INSERT INTO `internal_resources` VALUES ('PASSWORD', 'IT', 'Password', NULL);
INSERT INTO `internal_resources` VALUES ('USER_EMAIL', 'IT', 'eMail', NULL);
INSERT INTO `internal_resources` VALUES ('USER_ACTIVE', 'IT', 'Acconto Abilitato', NULL);
INSERT INTO `internal_resources` VALUES ('USER_FILTERMENU', 'IT', 'Amminisgtrazione utenti', NULL);
INSERT INTO `internal_resources` VALUES ('USER_PERMGRID', 'IT', 'Griglia dei permessi', NULL);
INSERT INTO `internal_resources` VALUES ('GROUP_LINK', 'IT', 'Profili del Gruppo', NULL);
INSERT INTO `internal_resources` VALUES ('GROUP_HEAD', 'IT', 'Profilo del Gruppo', NULL);
INSERT INTO `internal_resources` VALUES ('GROUP_NAME', 'IT', 'Nome del Gruppo', NULL);
INSERT INTO `internal_resources` VALUES ('GROUP_DESCRIPTIO', 'IT', 'Descrizione', NULL);
INSERT INTO `internal_resources` VALUES ('GROUP_FILTERMENU', 'IT', 'Amministrazione del Gruppo', NULL);
INSERT INTO `internal_resources` VALUES ('ROLE_LINK', 'IT', 'Profili delle regole', NULL);
INSERT INTO `internal_resources` VALUES ('ROLE_HEAD', 'IT', 'Profilo della regola', NULL);
INSERT INTO `internal_resources` VALUES ('ROLE_NAME', 'IT', 'Nome  della regola', NULL);
INSERT INTO `internal_resources` VALUES ('ROLE_DESCRIPTION', 'IT', 'Descrizione', NULL);
INSERT INTO `internal_resources` VALUES ('ROLE_FILTERMENU', 'IT', 'Regole di amministrazione', NULL);
INSERT INTO `internal_resources` VALUES ('USER_PERMISSIONS', 'IT', 'Permessi utente', NULL);
INSERT INTO `internal_resources` VALUES ('USER_TO_GROUP', 'IT', 'Aggiungi utente al gruppo', NULL);
INSERT INTO `internal_resources` VALUES ('ERROR_SEL_GROUP', 'IT', 'Devi selezionare un gruppo!', NULL);
INSERT INTO `internal_resources` VALUES ('ERROR_SEL_ROLE', 'IT', 'Devi selezionare almeno una regola!', NULL);
INSERT INTO `internal_resources` VALUES ('USER_PROFILE', 'IT', 'Mio profilo', NULL);
INSERT INTO `internal_resources` VALUES ('COMMIT', 'IT', 'Impegna', NULL);
INSERT INTO `internal_resources` VALUES ('CANCEL', 'IT', 'Cancella', NULL);
INSERT INTO `internal_resources` VALUES ('YES', 'IT', 'Si', NULL);
INSERT INTO `internal_resources` VALUES ('NO', 'IT', 'No', NULL);
INSERT INTO `internal_resources` VALUES ('NEW', 'IT', 'Inserire Nuovo', NULL);
INSERT INTO `internal_resources` VALUES ('NAME', 'IT', 'Nome', NULL);
INSERT INTO `internal_resources` VALUES ('DESCRIPTION', 'IT', 'Descrizione', NULL);
INSERT INTO `internal_resources` VALUES ('EDIT', 'IT', 'Editare', NULL);
INSERT INTO `internal_resources` VALUES ('UP', 'IT', 'SÃƒÂ¹', NULL);
INSERT INTO `internal_resources` VALUES ('DOWN', 'IT', 'GiÃƒÂ¹', NULL);
INSERT INTO `internal_resources` VALUES ('CONTAINERNAME', 'IT', 'Contenitori', NULL);
INSERT INTO `internal_resources` VALUES ('POSITION', 'IT', 'Posizione', NULL);
INSERT INTO `internal_resources` VALUES ('DELETE', 'IT', 'Cancellare', NULL);
INSERT INTO `internal_resources` VALUES ('TYPE', 'IT', 'Tipi', NULL);
INSERT INTO `internal_resources` VALUES ('KEYWORDS', 'IT', 'Parole chiavi', NULL);
INSERT INTO `internal_resources` VALUES ('METATEMPLATE', 'IT', 'Contenitori di META-chiavi addizionali', NULL);
INSERT INTO `internal_resources` VALUES ('SELECT_VARIATION', 'IT', 'Selezionare Variazioni', NULL);
INSERT INTO `internal_resources` VALUES ('ED_CONTENT', 'IT', 'Edita Contenuto', NULL);
INSERT INTO `internal_resources` VALUES ('ED_META', 'IT', 'Editare i META-Dati', NULL);
INSERT INTO `internal_resources` VALUES ('PREVIEW', 'IT', 'Anteprima', NULL);
INSERT INTO `internal_resources` VALUES ('CHOOSEFILE', 'IT', 'Sciegli un file', NULL);
INSERT INTO `internal_resources` VALUES ('NOTCONFIGURED', 'IT', 'Non ancora configurato.', NULL);
INSERT INTO `internal_resources` VALUES ('CONFIG', 'IT', 'Configura', NULL);
INSERT INTO `internal_resources` VALUES ('SELECT_CI', 'IT', 'Selezionare il contenuto degli oggetti', NULL);
INSERT INTO `internal_resources` VALUES ('SELECT_CL', 'IT', 'Selezionare un gruppo di istanze', NULL);
INSERT INTO `internal_resources` VALUES ('EMPTY', 'IT', '&lt;Vuoto&gt;', NULL);
INSERT INTO `internal_resources` VALUES ('STATUS', 'IT', 'Stato:', NULL);
INSERT INTO `internal_resources` VALUES ('UNIQUE', 'IT', 'Questo campo deve essere unico!', NULL);
INSERT INTO `internal_resources` VALUES ('MANDATORY', 'IT', 'Questo campo non puÃƒÂ² essere vuoto!', NULL);
INSERT INTO `internal_resources` VALUES ('NOTNUMBER', 'IT', 'Devi inserire un numero in questo campo!', NULL);
INSERT INTO `internal_resources` VALUES ('WRONGDATE', 'IT', 'La data inserita, non esiste!', NULL);
INSERT INTO `internal_resources` VALUES ('DATEFORMAT', 'IT', 'Il formato della data non ÃƒÂ¨ corretto!', NULL);
INSERT INTO `internal_resources` VALUES ('PWDNOTMATCH', 'IT', 'La passwords inserita non ÃƒÂ¨ corretta!', NULL);
INSERT INTO `internal_resources` VALUES ('PWDTOOSHORT', 'IT', 'La password deve essere di almeno 6 caratteri!', NULL);
INSERT INTO `internal_resources` VALUES ('PROCERROR', 'IT', 'Un errore ÃƒÂ¨ successo mentre si processava il form. Controllare il campo marcato di blu e leggere quÃƒÂ¬ per ulteriori informazioni.', NULL);
INSERT INTO `internal_resources` VALUES ('SAVEERROR', 'IT', 'Si ÃƒÂ¨ verificato un errore mentre si stavano salvando i dati nel database. Assicurarsi che il database sia connesso o contattare il proprio Amministratore.', NULL);
INSERT INTO `internal_resources` VALUES ('SAVESUCCESS', 'IT', 'I dati sono stati scritti correttamente nel database.', NULL);
INSERT INTO `internal_resources` VALUES ('DELETESUCCESS', 'IT', 'I dati elencati sotto sono stati correttamente cancellati dal database. Ora sono persi!', NULL);
INSERT INTO `internal_resources` VALUES ('SELECTONE', 'IT', 'Devi fare una scelta quÃƒÂ¬!', NULL);
INSERT INTO `internal_resources` VALUES ('CREATENEW', 'IT', 'Un nuovo membro di questo template ÃƒÂ¨ stato creato. Guardare i dati elencati sotto.', NULL);
INSERT INTO `internal_resources` VALUES ('PROMPTDELETE', 'IT', 'Vuoi veramente cancellare questo dataset? Questa azione non puÃƒÂ² essere ripristinata!', NULL);
INSERT INTO `internal_resources` VALUES ('RESET', 'IT', 'Resettare Form', NULL);
INSERT INTO `internal_resources` VALUES ('BACK', 'IT', 'Indietro', NULL);
INSERT INTO `internal_resources` VALUES ('CREATE', 'IT', 'Creare Oggetto', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE', 'IT', 'Ripulisci Database', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_MES', 'IT', 'Selezionare la parte di database, che si vuole ripulire.', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_VAR', 'IT', 'Ripulire Variazioni', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_CONTENT', 'IT', 'Ripulire Contenuto', NULL);
INSERT INTO `internal_resources` VALUES ('VAR_SUCCEEDED', 'IT', ' completato!', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_FOLDER', 'IT', 'Ripulire Cartelle', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_CLUSTER', 'IT', 'Ripulire Gruppo', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_META', 'IT', 'Ripulire Meta', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_CLT', 'IT', 'Ripulire Gruppo di Contenitori', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_PAGES', 'IT', 'Ripulire pagina del sito e quella principale', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_EXPIRED', 'IT', 'Ripulisci pagine scadute', NULL);
INSERT INTO `internal_resources` VALUES ('USER_JS', 'PL', 'UÃ‚Â¿yj Javascript', NULL);
INSERT INTO `internal_resources` VALUES ('USER_BL', 'PL', 'JÃƒÂªzyk systemu zarzÃ‚Â±dzania', NULL);
INSERT INTO `internal_resources` VALUES ('PO_BROWSER', 'PL', 'PrzeglÃ‚Â±danie Portali', NULL);
INSERT INTO `internal_resources` VALUES ('PO_OWNER', 'PL', 'WÃ‚Â³aÃ‚Â¶ciciel Strony', NULL);
INSERT INTO `internal_resources` VALUES ('PO_CRSUCCEEDED', 'PL', 'Utworzenie nowej strony portalu powiodÃ‚Â³o siÃƒÂª!', NULL);
INSERT INTO `internal_resources` VALUES ('PO_MYPORTAL', 'PL', 'Moje Portale', NULL);
INSERT INTO `internal_resources` VALUES ('PO_EDIT', 'PL', 'Edycja strony Portal-u', NULL);
INSERT INTO `internal_resources` VALUES ('SP_BROWSE', 'PL', 'PrzeglÃ‚Â±danie ukÃ‚Â³adu stron', NULL);
INSERT INTO `internal_resources` VALUES ('SP_NEWPAGE', 'PL', 'Dodanie strony serwisu', NULL);
INSERT INTO `internal_resources` VALUES ('SP_NEWINSTANCE', 'PL', 'Dodanie strony', NULL);
INSERT INTO `internal_resources` VALUES ('SP_IPROPERTIES', 'PL', 'WÃ‚Â³aÃ‚Â¶ciwoÃ‚Â¶ci strony', NULL);
INSERT INTO `internal_resources` VALUES ('SP_PROPERTIES', 'PL', 'WÃ‚Â³aÃ‚Â¶ciwoÃ‚Â¶ci strony serwisu', NULL);
INSERT INTO `internal_resources` VALUES ('SP_DELMES', 'PL', 'Zamierzasz usunÃ‚Â±ÃƒÂ¦ stronÃƒÂª serwisu. ProszÃƒÂª zauwaÃ‚Â¿yÃƒÂ¦, Ã‚Â¿e takÃ‚Â¿e czynna wersja tej strony serwisu zostanie usuniÃƒÂªta!', NULL);
INSERT INTO `internal_resources` VALUES ('SP_DELETE', 'PL', 'UsuniÃƒÂªcie strony serwisu', NULL);
INSERT INTO `internal_resources` VALUES ('SP_PDELMES', 'PL', 'Zamierzasz usunÃ‚Â±ÃƒÂ¦ stronÃƒÂª. ProszÃƒÂª zauwaÃ‚Â¿yÃƒÂ¦, Ã‚Â¿e takÃ‚Â¿e czynna wersja tej strony zostanie usuniÃƒÂªta!', NULL);
INSERT INTO `internal_resources` VALUES ('SP_PDELETE', 'PL', 'UsuniÃƒÂªcie strony', NULL);
INSERT INTO `internal_resources` VALUES ('SP_CONFIGURE', 'PL', 'Konfiguracja strony', NULL);
INSERT INTO `internal_resources` VALUES ('SP_CONFDESC', 'PL', 'MoÃ‚Â¿na poÃ‚Â³Ã‚Â±czyÃƒÂ¦ tÃ‚Â± stronÃƒÂª serwisu z instniejÃ‚Â±cym wystaÃ‚Â±pieniem klastra lub moÃ‚Â¿na utworzyÃƒÂ¦ nowÃ‚Â± instancjÃƒÂª. ProszÃƒÂª zadecydowaÃƒÂ¦ co zamierzsz zrobiÃƒÂ¦.', NULL);
INSERT INTO `internal_resources` VALUES ('SP_LINK', 'PL', 'UtworzyÃƒÂ¦ poÃ‚Â³Ã‚Â±czenie do istniejÃ‚Â±cego wystÃ‚Â±pienia klastra', NULL);
INSERT INTO `internal_resources` VALUES ('SP_CLNEW', 'PL', 'StworzyÃƒÂ¦ nowe wystÃ‚Â±pienie klastra', NULL);
INSERT INTO `internal_resources` VALUES ('SP_EDIT', 'PL', 'Edycja strony serwisu', NULL);
INSERT INTO `internal_resources` VALUES ('SP_MENUPROPS', 'PL', 'Nazwa menu i tekst pomocy', NULL);
INSERT INTO `internal_resources` VALUES ('SP_MENUNAME', 'PL', 'Nazwa w menu', NULL);
INSERT INTO `internal_resources` VALUES ('SP_MENUHELP', 'PL', 'Tekst pomocy dla menu', NULL);
INSERT INTO `internal_resources` VALUES ('SP_LAUNCHDATE', 'PL', 'WaÃ‚Â¿ne od', NULL);
INSERT INTO `internal_resources` VALUES ('SP_EXPIREDATE', 'PL', 'UpÃ‚Â³ywa od', NULL);
INSERT INTO `internal_resources` VALUES ('SP_LAUNCHDATES', 'PL', 'Konfiguracja czasu pracy', NULL);
INSERT INTO `internal_resources` VALUES ('SP_PREVIEW', 'PL', 'PodglÃ‚Â±d strony', NULL);
INSERT INTO `internal_resources` VALUES ('SP_LAUNCH', 'PL', 'Uruchom stronÃƒÂª', NULL);
INSERT INTO `internal_resources` VALUES ('SP_EXPIRE', 'PL', 'Przedawnij stronÃƒÂª', NULL);
INSERT INTO `internal_resources` VALUES ('NOSPTITLE', 'PL', 'NaleÃ‚Â¿y zdefiniowaÃƒÂ¦ nazwÃƒÂª w menu przed uruchomieniem strony!', NULL);
INSERT INTO `internal_resources` VALUES ('ACTIVE', 'PL', 'Aktywne', NULL);
INSERT INTO `internal_resources` VALUES ('SPM', 'PL', 'Wzorzec strony serwisu', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_EDIT', 'PL', 'Edycja wzorca strony serwisu', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_META', 'PL', 'Wzorzec meta kluczy', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_VARIATIONS', 'PL', 'WyÃ‚Â¶wietlane wersje', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_TYPE', 'PL', 'Rodzaj strony', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_CLUSTER', 'PL', 'Wzorzec klastra', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_PATH', 'PL', 'Ã‚Â¦cieÃ‚Â¿ka do wzorca', NULL);
INSERT INTO `internal_resources` VALUES ('CL_BROWSE', 'PL', 'PrzeglÃ‚Â±danie klastrÃƒÂ³w', NULL);
INSERT INTO `internal_resources` VALUES ('CL_NEW', 'PL', 'Nowe wystÃ‚Â±pienie', NULL);
INSERT INTO `internal_resources` VALUES ('CL_PROPERTIES', 'PL', 'WÃ‚Â³aÃ‚Â¶ciwoÃ‚Â¶ci klastra', NULL);
INSERT INTO `internal_resources` VALUES ('CL_DEL', 'PL', 'UsuÃƒÂ± wystÃ‚Â±pienie', NULL);
INSERT INTO `internal_resources` VALUES ('CL_DELMES', 'PL', 'Czy na pewno chcesz usunÃ‚Â±ÃƒÂ¦ to wystÃ‚Â±pienie klastra? Wszystkie dane zawartoÃ‚Â¶ci zostanÃ‚Â± stracone!', NULL);
INSERT INTO `internal_resources` VALUES ('CL_EDIT', 'PL', 'Edycja wystÃ‚Â±pienia klastra', NULL);
INSERT INTO `internal_resources` VALUES ('CL_CREATEINSTANC', 'PL', 'UtÃƒÂ³rzenie nowego wystÃ‚Â±pienia', NULL);
INSERT INTO `internal_resources` VALUES ('CL_CREATEINSMES', 'PL', 'Nadal zostajÃ‚Â± gniazda do utworzenia dodatkowych wystÃ‚Â±pieÃƒÂ± dla thych pÃƒÂ³l zawartoÃ‚Â¶ci. JeÃ‚Â¿eli chcesz utworzyÃƒÂ¦ dodatkowe wystÃ‚Â±pienie, wprowadÃ‚Â¼ tytuÃ‚Â³ w polu tekstowym poniÃ‚Â¿ej i naciÃ‚Â¶nij przycisk utwÃƒÂ³rz.', NULL);
INSERT INTO `internal_resources` VALUES ('CL_NOTITLE', 'PL', 'Nie zostaÃ‚Â³ jeszcze zdefiniowany tytuÃ‚Â³', NULL);
INSERT INTO `internal_resources` VALUES ('TITLE', 'PL', 'TytuÃ‚Â³', NULL);
INSERT INTO `internal_resources` VALUES ('CLI_EDIT', 'PL', 'Edycja czÃ‚Â³onka klastra', NULL);
INSERT INTO `internal_resources` VALUES ('CLI_DELETE', 'PL', 'UsuÃƒÂ± czÃ‚Â³onka klastra', NULL);
INSERT INTO `internal_resources` VALUES ('CLI_DELETEMES', 'PL', 'Czy na pewno chcesz usunÃ‚Â±ÃƒÂ¦ to wystÃ‚Â±pienie? Zostanie stracone na zawsze!', NULL);
INSERT INTO `internal_resources` VALUES ('CLI_DELETED', 'PL', 'WystÃ‚Â±pienie zostaÃ‚Â³o usuniÃƒÂªte!', NULL);
INSERT INTO `internal_resources` VALUES ('CLI_NOTDELETED', 'PL', 'To wystÃ‚Â±pienie nie moÃ‚Â¿e zostaÃƒÂ¦ usuniÃƒÂªte!', NULL);
INSERT INTO `internal_resources` VALUES ('CLI', 'PL', 'WystÃ‚Â±pienie klastra:', NULL);
INSERT INTO `internal_resources` VALUES ('SR_SELECTCI', 'PL', 'Tutaj moÃ‚Â¿na wyszukiwaÃƒÂ¦ dowolne elementy zawartoÃ‚Â¶ci. JeÃ‚Â¿eli chcemy wybraÃƒÂ¦ element zawartoÃ‚Â¶ci, naleÃ‚Â¿y nacisnÃ‚Â±ÃƒÂ¦ przycisk Aktualizuj! JeÃ‚Â¿eli chcemy podÃ‚Â³Ã‚Â±czyÃƒÂ¦ siÃƒÂª do nowej zawartoÃ‚Â¶ci za pomocÃ‚Â± tego pola - stwÃƒÂ³rz wczeÃ‚Â¶niej zawartoÃ‚Â¶ÃƒÂ¦ w PrzeglÃ‚Â±darce obiektÃƒÂ³w.', NULL);
INSERT INTO `internal_resources` VALUES ('SR_SELECTCLI', 'PL', 'ProszÃƒÂª wybraÃƒÂ¦ szablon klastra. NastÃƒÂªpnie moÃ‚Â¿na wybraÃƒÂ¦ wystÃ‚Â±pienie szablonu w celu dalszego uÃ‚Â¿ycia.', NULL);
INSERT INTO `internal_resources` VALUES ('FOLDER', 'PL', 'Folder', NULL);
INSERT INTO `internal_resources` VALUES ('CONTENTTYPE', 'PL', 'Rodzaj zawartoÃ‚Â¶ci', NULL);
INSERT INTO `internal_resources` VALUES ('CONTENTITEM', 'PL', 'Element zawartoÃ‚Â¶ci', NULL);
INSERT INTO `internal_resources` VALUES ('SEARCH', 'PL', 'PoczÃ‚Â±tek wyszukiwania', NULL);
INSERT INTO `internal_resources` VALUES ('SEARCHIN', 'PL', 'Szukaj', NULL);
INSERT INTO `internal_resources` VALUES ('SEARCHRESULTS', 'PL', 'Wyniki wyszukiwania, proszÃƒÂª wybraÃƒÂ¦', NULL);
INSERT INTO `internal_resources` VALUES ('SELECTEDOBJECT', 'PL', 'Aktualnie wybrany element zawartoÃ‚Â¶ci', NULL);
INSERT INTO `internal_resources` VALUES ('SELECTEDINSTANCE', 'PL', 'Wybrane wystÃ‚Â±pienie klastra', NULL);
INSERT INTO `internal_resources` VALUES ('M_META', 'PL', 'Szablony Meta', NULL);
INSERT INTO `internal_resources` VALUES ('M_BROWSER', 'PL', 'Przegladarka obiektÃƒÂ³w', NULL);
INSERT INTO `internal_resources` VALUES ('M_INSTALLPLUGIN', 'PL', 'Dodatki', NULL);
INSERT INTO `internal_resources` VALUES ('M_ES', 'PL', 'PrzeglÃ‚Â±darka serwisu', NULL);
INSERT INTO `internal_resources` VALUES ('M_SPM', 'PL', 'Wzorzec stron serwisu', NULL);
INSERT INTO `internal_resources` VALUES ('M_PRTMAN', 'PL', 'ZarzÃ‚Â±dzanie portalem', NULL);
INSERT INTO `internal_resources` VALUES ('M_MYPRT', 'PL', 'Moje portale', NULL);
INSERT INTO `internal_resources` VALUES ('M_MYPROFILE', 'PL', 'MÃƒÂ³j profil', NULL);
INSERT INTO `internal_resources` VALUES ('M_LOGOUT', 'PL', 'Wyloguj', NULL);
INSERT INTO `internal_resources` VALUES ('M_CLB', 'PL', 'PrzeglÃ‚Â±darka klastra', NULL);
INSERT INTO `internal_resources` VALUES ('M_CLTB', 'PL', 'PrzeglÃ‚Â±darka szablonÃƒÂ³w klastra', NULL);
INSERT INTO `internal_resources` VALUES ('M_UMAN', 'PL', 'ZarzÃ‚Â±dzanie uÃ‚Â¿ytkownikami', NULL);
INSERT INTO `internal_resources` VALUES ('M_VAR', 'PL', 'Odmiany', NULL);
INSERT INTO `internal_resources` VALUES ('M_PURGE', 'PL', 'UsuniÃƒÂªcie bazy danych', NULL);
INSERT INTO `internal_resources` VALUES ('M_PGN', 'PL', 'Kontrola dodatkÃƒÂ³w', NULL);
INSERT INTO `internal_resources` VALUES ('M_REPORT', 'PL', 'Raport serweisu', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_NEW', 'PL', 'Nowy szablon klastra', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_BROWSE', 'PL', 'PrzeglÃ‚Â±d. szabl.klas.', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_NAME', 'PL', 'Nazwa szabl.klas.', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_PROPERTIES', 'PL', 'WÃ‚Â³aÃ‚Â¶ciwoÃ‚Â¶ci szabl.klas.', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_DELETE', 'PL', 'UsuniÃƒÂªcie szabl.klas.', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_DELMES', 'PL', 'Zamierzasz usunÃ‚Â±ÃƒÂ¦ szablon klastra. Spowoduje to usuniÃƒÂªciÃƒÂª wszystkich(!) zawartoÃ‚Â¶ci stworzonych przy uÃ‚Â¿yciu szablonu klastra. Czy na pewno chcesz kontynuowaÃƒÂ¦?', NULL);
INSERT INTO `internal_resources` VALUES ('CLTI_DELETE', 'PL', 'Czy na pewno chesz usunÃ‚Â±ÃƒÂ¦ ten element? Wszystkie wystÃ‚Â±pienia tego elementu takÃ‚Â¿e zostanÃ‚Â± usuniÃƒÂªte!', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_SCHEME', 'PL', 'Edycja schematu szablonu klastra', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_MINCARD', 'PL', 'WystÃ‚Â±pienia', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_MAXCARD', 'PL', '-', NULL);
INSERT INTO `internal_resources` VALUES ('LINKED', 'PL', 'PoÃ‚Â³Ã‚Â±czone z', NULL);
INSERT INTO `internal_resources` VALUES ('PG_INSTALLDESC', 'PL', 'Prosze siÃƒÂª upewniÃƒÂ¦, Ã‚Â¿e zostaÃ‚Â³y skopiowane wszystkie niezbÃƒÂªdne pliki do katalogu przed kontynuacjÃ‚Â±. WprowadÃ‚Â¼ poprawnÃ‚Â± Ã‚Â¶cieÃ‚Â¿kÃƒÂª do dodatku w poniÃ‚Â¿szym polu. System zainstaluje dodatek automatycznie.', NULL);
INSERT INTO `internal_resources` VALUES ('PG_CHOOSE', 'PL', 'Dodatek: &nbsp; /plugin/', NULL);
INSERT INTO `internal_resources` VALUES ('PG_FILEWRONG', 'PL', 'Nazwa pliku, ktÃƒÂ³ra zostaÃ‚Â³a wprowadzona nie mogÃ‚Â³a zostaÃƒÂ¦ znaleziona na serwerze!', NULL);
INSERT INTO `internal_resources` VALUES ('CLASS_WRONG', 'PL', 'Plik, ktÃƒÂ³ry zostaÃ‚Â³ wprowadzony nie zawiera poprawnej sygnatury!', NULL);
INSERT INTO `internal_resources` VALUES ('PG_INSTALLED', 'PL', 'Dodatek zostaÃ‚Â³ poprawnie zainstalowany!', NULL);
INSERT INTO `internal_resources` VALUES ('PG_UPGRADED', 'PL', 'Dodatek zostaÃ‚Â³ porawnie zaktualizowany!', NULL);
INSERT INTO `internal_resources` VALUES ('PG_ERROR', 'PL', 'WystÃ‚Â±piÃ‚Â³ bÃ‚Â³Ã‚Â±d podczas instalacji dodatku!', NULL);
INSERT INTO `internal_resources` VALUES ('PG_ALREADYINSTAL', 'PL', 'Dodatek juÃ‚Â¿ zostaÃ‚Â³ zainstalowany!', NULL);
INSERT INTO `internal_resources` VALUES ('PG_NEWERINSTALLE', 'PL', 'JuÃ‚Â¿ jest zainstalowana nowsza wersja dodatku!', NULL);
INSERT INTO `internal_resources` VALUES ('PG_TITLE', 'PL', 'Dodatki', NULL);
INSERT INTO `internal_resources` VALUES ('PG_INSTALL', 'PL', 'Zainstaluj dodatek', NULL);
INSERT INTO `internal_resources` VALUES ('PG_UNINSTALL', 'PL', 'Odinstaluj dodatek', NULL);
INSERT INTO `internal_resources` VALUES ('PG_UNINSTALLMES', 'PL', 'Zamierzasz odinstalowaÃƒÂ¦ moduÃ‚Â³. Odinstalowanie moduÃ‚Â³u nie tylko usuwa rodzaj zawartoÃ‚Â¶ci ale takÃ‚Â¿e usuwa kaÃ‚Â¿dy obiekt tego typu przechowywany w bazie danych. Odinstalowanie definitywnie(!) usunie wszystkie dane dla tego moduÃ‚Â³u!', NULL);
INSERT INTO `internal_resources` VALUES ('PG_UNINSTALLDELE', 'PL', 'Odinstaluj moduÃ‚Â³,<br> UsuniÃƒÂªcie wszystkie zaleÃ‚Â¿ne zawartoÃ‚Â¶ci.', NULL);
INSERT INTO `internal_resources` VALUES ('O_NEW', 'PL', 'Nowy obiekt', NULL);
INSERT INTO `internal_resources` VALUES ('O_NAME', 'PL', 'Nazwa obiektu', NULL);
INSERT INTO `internal_resources` VALUES ('O_PROPERTIES', 'PL', 'WÃ‚Â³aÃ‚Â¶ciwoÃ‚Â¶ci obiektu', NULL);
INSERT INTO `internal_resources` VALUES ('O_DELMES', 'PL', 'Zamierzasz usunÃ‚Â±ÃƒÂ¦ obiekt. <b>NaleÃ‚Â¿y zauwaÃ‚Â¿yÃƒÂ¦, Ã‚Â¿e wszystkie odmiany i meta dane zostanÃ‚Â± utracone!</b>', NULL);
INSERT INTO `internal_resources` VALUES ('O_DEL', 'PL', 'UsuÃƒÂ± obiekt', NULL);
INSERT INTO `internal_resources` VALUES ('O_EDIT', 'PL', 'Edytuj obiekt', NULL);
INSERT INTO `internal_resources` VALUES ('O_PREVIEW', 'PL', 'PodglÃ‚Â±d', NULL);
INSERT INTO `internal_resources` VALUES ('O_TEXT', 'PL', 'Tekst', NULL);
INSERT INTO `internal_resources` VALUES ('O_ALT', 'PL', 'Opis rysunku', NULL);
INSERT INTO `internal_resources` VALUES ('O_COPYRIGHT', 'PL', 'Prawo autorskie', NULL);
INSERT INTO `internal_resources` VALUES ('O_BROWSE', 'PL', 'PrzeglÃ‚Â±d obiektÃƒÂ³w', NULL);
INSERT INTO `internal_resources` VALUES ('R_HOME', 'PL', 'Start', NULL);
INSERT INTO `internal_resources` VALUES ('R_NEWFOLDER', 'PL', 'Nowy folder', NULL);
INSERT INTO `internal_resources` VALUES ('R_EDITFOLDER', 'PL', 'Edycja wÃ‚Â³aÃ‚Â¶ciwoÃ‚Â¶ci folderu', NULL);
INSERT INTO `internal_resources` VALUES ('R_FOLDERNAME', 'PL', 'Nazwa folderu', NULL);
INSERT INTO `internal_resources` VALUES ('R_DELETEFOLDER', 'PL', 'UsuÃƒÂ± folder', NULL);
INSERT INTO `internal_resources` VALUES ('R_DELFOLDERMES', 'PL', 'Zamierzasz usunÃ‚Â±ÃƒÂ¦ folder. ProszÃƒÂª zaznaczyÃƒÂ¦ akcjÃƒÂª.', NULL);
INSERT INTO `internal_resources` VALUES ('R_FOLDERNOTEMPTY', 'PL', 'Folder nie jest pusty. Nie moÃ‚Â¿na go usunÃ‚Â±ÃƒÂ¦. ProszÃƒÂª sprawdziÃƒÂ¦ wszystkie obiekty i klastry!', NULL);
INSERT INTO `internal_resources` VALUES ('R_DELFOLDER', 'PL', 'UsuniÃƒÂªcie folderu i wszystkich podrzÃƒÂªdnych obiektÃƒÂ³w', NULL);
INSERT INTO `internal_resources` VALUES ('R_MOVEOBJECTS', 'PL', 'PrzesuniÃƒÂªcie wszystkich obiektÃƒÂ³w do nadrzÃƒÂªdnego wÃƒÂªzÃ‚Â³a', NULL);
INSERT INTO `internal_resources` VALUES ('R_PARENT', 'PL', 'NadrzÃƒÂªdny folder', NULL);
INSERT INTO `internal_resources` VALUES ('METATEMPLATES', 'PL', 'Szablon meta danych', NULL);
INSERT INTO `internal_resources` VALUES ('MT_PROPERTIES', 'PL', 'Edycja wÃ‚Â³aÃ‚Â¶ciwoÃ‚Â¶ci meta szablonu', NULL);
INSERT INTO `internal_resources` VALUES ('MT_SCHEME', 'PL', 'Edycja schematu meta szablonu', NULL);
INSERT INTO `internal_resources` VALUES ('MT_DELETE', 'PL', 'Czy rzeczywiÃ‚Â¶cie zamierzasz usunÃ‚Â±ÃƒÂ¦ tÃ‚Â± czÃƒÂªÃ‚Â¶ÃƒÂ¦ meta szablonu? Wszystkie informacje wprowadzone w dowolne meta pola w systemie CMS poÃ‚Â³Ã‚Â±czone do tej czÃƒÂªÃ‚Â¶ci zostanÃ‚Â± usuniÃƒÂªte. Dane zostanÃ‚Â± usuniÃƒÂªte caÃ‚Â³kowicie!', NULL);
INSERT INTO `internal_resources` VALUES ('MT_ADDITIONAL', 'PL', 'Dodatkowe meta dane', NULL);
INSERT INTO `internal_resources` VALUES ('MT_BASE', 'PL', 'Podstawowe meta dane', NULL);
INSERT INTO `internal_resources` VALUES ('MT_MODULE', 'PL', 'Meta dane specyficzne dla rodzaju zawrtoÃ‚Â¶ci', NULL);
INSERT INTO `internal_resources` VALUES ('VARIATIONS', 'PL', 'DostÃƒÂªpne odmiany', NULL);
INSERT INTO `internal_resources` VALUES ('V_NAME', 'PL', 'Nazwa', NULL);
INSERT INTO `internal_resources` VALUES ('V_SHORT', 'PL', 'KrÃƒÂ³tki znacznik', NULL);
INSERT INTO `internal_resources` VALUES ('V_EDIT', 'PL', 'Edycja odmian', NULL);
INSERT INTO `internal_resources` VALUES ('LOGIN_FAILED', 'PL', 'Wprowadzone dane uÃ‚Â¿ytkownika nie mogÃ‚Â± zostaÃƒÂ¦ potwierdzone! ProszÃƒÂª sprÃƒÂ³bowaÃƒÂ¦ ponownie.', NULL);
INSERT INTO `internal_resources` VALUES ('USER_HEAD', 'PL', 'Profil uÃ‚Â¿ytkownika', NULL);
INSERT INTO `internal_resources` VALUES ('USER_LINK', 'PL', 'Profile uÃ‚Â¿ytkownikÃƒÂ³w', NULL);
INSERT INTO `internal_resources` VALUES ('USER_NAME', 'PL', 'Nazwa uÃ‚Â¿ytkownika', NULL);
INSERT INTO `internal_resources` VALUES ('FULL_NAME', 'PL', 'PeÃ‚Â³na nazwa', NULL);
INSERT INTO `internal_resources` VALUES ('PASSWORD', 'PL', 'HasÃ‚Â³o', NULL);
INSERT INTO `internal_resources` VALUES ('USER_EMAIL', 'PL', 'eMail', NULL);
INSERT INTO `internal_resources` VALUES ('USER_ACTIVE', 'PL', 'Konto wÃ‚Â³Ã‚Â±czone', NULL);
INSERT INTO `internal_resources` VALUES ('USER_FILTERMENU', 'PL', 'Administracja uÃ‚Â¿ytkonikami', NULL);
INSERT INTO `internal_resources` VALUES ('USER_SETPERM', 'PL', 'Ustal prawa dostÃƒÂªpu uÃ‚Â¿ytkownika poniÃ‚Â¿ej. W celu usuniÃƒÂªcia uÃ‚Â¿ytkownika z grupy, po prostu odwoÃ‚Â³aj wszytkie grupy przynaleÃ‚Â¿ne do niego.', NULL);
INSERT INTO `internal_resources` VALUES ('USER_PERMGRID', 'PL', 'Siatka uprawnieÃƒÂ±', NULL);
INSERT INTO `internal_resources` VALUES ('GROUP_LINK', 'PL', 'Profile grupy', NULL);
INSERT INTO `internal_resources` VALUES ('GROUP_HEAD', 'PL', 'Profil grupy', NULL);
INSERT INTO `internal_resources` VALUES ('GROUP_NAME', 'PL', 'Nazwa grupy', NULL);
INSERT INTO `internal_resources` VALUES ('GROUP_DESCRIPTIO', 'PL', 'Opis', NULL);
INSERT INTO `internal_resources` VALUES ('GROUP_FILTERMENU', 'PL', 'Adminstracja grupÃ‚Â±', NULL);
INSERT INTO `internal_resources` VALUES ('ROLE_LINK', 'PL', 'Profile rÃƒÂ³l', NULL);
INSERT INTO `internal_resources` VALUES ('ROLE_HEAD', 'PL', 'Profil roli', NULL);
INSERT INTO `internal_resources` VALUES ('ROLE_NAME', 'PL', 'Nazwa roli', NULL);
INSERT INTO `internal_resources` VALUES ('ROLE_DESCRIPTION', 'PL', 'Opis', NULL);
INSERT INTO `internal_resources` VALUES ('ROLE_FILTERMENU', 'PL', 'Adminstracja rolami', NULL);
INSERT INTO `internal_resources` VALUES ('USER_PERMISSIONS', 'PL', 'Uprawnienia uÃ‚Â¿ytkownika', NULL);
INSERT INTO `internal_resources` VALUES ('UP_INTRO', 'PL', 'ProszÃƒÂª zaznaczyÃƒÂ¦ grupÃƒÂª i role w grupie, ktÃƒÂ³re checesz dodaÃƒÂ¦ dla uÃ‚Â¿ytkownika.', NULL);
INSERT INTO `internal_resources` VALUES ('USER_TO_GROUP', 'PL', 'Dodanie uÃ‚Â¿ytkownika do grupy', NULL);
INSERT INTO `internal_resources` VALUES ('ERROR_SEL_GROUP', 'PL', 'NaleÃ‚Â¿y wybraÃƒÂ¦ grupÃƒÂª!', NULL);
INSERT INTO `internal_resources` VALUES ('ERROR_SEL_ROLE', 'PL', 'NaleÃ‚Â¿y wybraÃƒÂ¦ co najmniej jednÃ‚Â± rolÃƒÂª!', NULL);
INSERT INTO `internal_resources` VALUES ('USER_PROFILE', 'PL', 'MÃƒÂ³j profil', NULL);
INSERT INTO `internal_resources` VALUES ('COMMIT', 'PL', 'PowieÃ‚Â¿', NULL);
INSERT INTO `internal_resources` VALUES ('CANCEL', 'PL', 'Anuluj', NULL);
INSERT INTO `internal_resources` VALUES ('YES', 'PL', 'Tak', NULL);
INSERT INTO `internal_resources` VALUES ('NO', 'PL', 'Nie', NULL);
INSERT INTO `internal_resources` VALUES ('NEW', 'PL', 'Wstaw nowy', NULL);
INSERT INTO `internal_resources` VALUES ('NAME', 'PL', 'Nazwa', NULL);
INSERT INTO `internal_resources` VALUES ('DESCRIPTION', 'PL', 'Opis', NULL);
INSERT INTO `internal_resources` VALUES ('DOSOMETHING', 'PL', 'ProszÃƒÂª wybraÃƒÂ¦ dziaÃ‚Â³anie, ktÃƒÂ³re chesz wykonaÃƒÂ¦. MoÃ‚Â¿esz wybraÃƒÂ¦ nowe elementy, edytowaÃƒÂ¦ elementy, usunÃ‚Â±ÃƒÂ¦ elementy lub zmieniÃƒÂ¦ kolejnoÃ‚Â¶ÃƒÂ¦ elementÃƒÂ³w.', NULL);
INSERT INTO `internal_resources` VALUES ('EDIT', 'PL', 'Edycja', NULL);
INSERT INTO `internal_resources` VALUES ('UP', 'PL', 'W gÃƒÂ³rÃƒÂª', NULL);
INSERT INTO `internal_resources` VALUES ('DOWN', 'PL', 'W dÃƒÂ³Ã‚Â³', NULL);
INSERT INTO `internal_resources` VALUES ('CONTAINERNAME', 'PL', 'Szablon', NULL);
INSERT INTO `internal_resources` VALUES ('SELECTOBJECT', 'PL', 'ProszÃƒÂª wybraÃƒÂ¦ klasÃƒÂª oraz okreÃ‚Â¶liÃƒÂ¦ pozycjÃƒÂª i nazwÃƒÂª dla tworzonego obiektu.<br> Dla pozycji uÃ‚Â¿yj 0 dla okreÃ‚Â¶lenia poczÃ‚Â±tkowej pozycji, 999 dla okreÃ‚Â¶lenie na koÃƒÂ±cu poza innymi pozycjami twojego wybory.', NULL);
INSERT INTO `internal_resources` VALUES ('POSITION', 'PL', 'Pozycja', NULL);
INSERT INTO `internal_resources` VALUES ('DELETE', 'PL', 'UsuÃƒÂ±', NULL);
INSERT INTO `internal_resources` VALUES ('TYPE', 'PL', 'Typ', NULL);
INSERT INTO `internal_resources` VALUES ('KEYWORDS', 'PL', 'SÃ‚Â³owa kluczowe', NULL);
INSERT INTO `internal_resources` VALUES ('METATEMPLATE', 'PL', 'Dodatkowe meta klucze szablonu', NULL);
INSERT INTO `internal_resources` VALUES ('SELECT_VARIATION', 'PL', 'Wybierz odmianÃƒÂª', NULL);
INSERT INTO `internal_resources` VALUES ('ACTIVE_VARIATION', 'PL', 'Aktywne odmiany:', NULL);
INSERT INTO `internal_resources` VALUES ('NO_VARIATIONS', 'PL', 'Nie ma obecnie zdefiniowanych odmian tego obiektu!<br>ProszÃƒÂª skonsultowaÃƒÂ¦ to z programistÃ‚Â± w celu sprawdzenia konfiguracji wybranego elementu!', NULL);
INSERT INTO `internal_resources` VALUES ('ED_CONTENT', 'PL', 'Edycja zawartoÃ‚Â¶ci', NULL);
INSERT INTO `internal_resources` VALUES ('ED_META', 'PL', 'Edycja meta danych', NULL);
INSERT INTO `internal_resources` VALUES ('ED_DISPATCHER', 'PL', 'UÃ‚Â¿yj tego przycisku w celu przeÃ‚Â³Ã‚Â±czenia siÃƒÂª pomiÃƒÂªdzy edytowaniem meta danych a edycjÃ‚Â± zawartoÃ‚Â¶ci.', NULL);
INSERT INTO `internal_resources` VALUES ('PREVIEW', 'PL', 'PodglÃ‚Â±d', NULL);
INSERT INTO `internal_resources` VALUES ('CHOOSEFILE', 'PL', 'Wybierz plik', NULL);
INSERT INTO `internal_resources` VALUES ('CONFIGURED', 'PL', 'Gotowy do uÃ‚Â¿ycia.', NULL);
INSERT INTO `internal_resources` VALUES ('NOTCONFIGURED', 'PL', 'Nie skonfigurowany jeszcze.', NULL);
INSERT INTO `internal_resources` VALUES ('CONFIG', 'PL', 'Konfiguracja', NULL);
INSERT INTO `internal_resources` VALUES ('SELECT_CI', 'PL', 'Wybierz element zawartoÃ‚Â¶ci', NULL);
INSERT INTO `internal_resources` VALUES ('SELECT_CL', 'PL', 'Wybierz element klastra', NULL);
INSERT INTO `internal_resources` VALUES ('EMPTY', 'PL', '&lt;pusty&gt;', NULL);
INSERT INTO `internal_resources` VALUES ('STATUS', 'PL', 'Status:', NULL);
INSERT INTO `internal_resources` VALUES ('UNIQUE', 'PL', 'To pole musi byÃƒÂ¦ unikalne!', NULL);
INSERT INTO `internal_resources` VALUES ('MANDATORY', 'PL', 'To pole nie moÃ‚Â¿e byÃƒÂ¦ puste!', NULL);
INSERT INTO `internal_resources` VALUES ('NOTNUMBER', 'PL', 'NaleÃ‚Â¿y wprowadziÃƒÂ¦ numer do tego pola!', NULL);
INSERT INTO `internal_resources` VALUES ('WRONGDATE', 'PL', 'Data, ktÃƒÂ³ra zostaÃ‚Â³a wprowadzone nie istnieje!', NULL);
INSERT INTO `internal_resources` VALUES ('DATEFORMAT', 'PL', 'Format daty jest nieprawidÃ‚Â³owy!', NULL);
INSERT INTO `internal_resources` VALUES ('PWDNOTMATCH', 'PL', 'HasÃ‚Â³a, ktÃƒÂ³re zostaÃ‚Â³y wprowadzone nie zgadzajÃ‚Â± siÃƒÂª!', NULL);
INSERT INTO `internal_resources` VALUES ('PWDTOOSHORT', 'PL', 'HasÃ‚Â³o musi zawieraÃƒÂ¦ co najmniej 6 znakÃƒÂ³w!', NULL);
INSERT INTO `internal_resources` VALUES ('PROCERROR', 'PL', 'WystÃ‚Â±piÃ‚Â³ bÃ‚Â³Ã‚Â±d podczas przetwarzania danych formularza. ProszÃƒÂª sprawdziÃƒÂ¦ pola zaznaczone na niebiesko i przeczytaÃƒÂ¦ dodatkowe informacje.', NULL);
INSERT INTO `internal_resources` VALUES ('SAVEERROR', 'PL', 'WystÃ‚Â±piÃ‚Â³ bÃ‚Â³Ã‚Â±d podczas zapisywania danych do bazy danych. ProszÃƒÂª sprawdziÃƒÂ¦ czy baza danych jest podÃ‚Â³Ã‚Â±czona lub zadzwoniÃƒÂ¦ do administratora.', NULL);
INSERT INTO `internal_resources` VALUES ('SAVESUCCESS', 'PL', 'Dane zostaÃ‚Â³y poprawnie zapisane do bazy danych.', NULL);
INSERT INTO `internal_resources` VALUES ('DELETESUCCESS', 'PL', 'Dane wypisane poniÃ‚Â¿ej zostaÃ‚Â³y poprawnie usuniÃƒÂªte z bazy danych. ZostaÃ‚Â³y caÃ‚Â³kowicie usuniÃƒÂªte!', NULL);
INSERT INTO `internal_resources` VALUES ('SELECTONE', 'PL', 'Tutaj naleÃ‚Â¿y dokonaÃƒÂ¦ wyboru!', NULL);
INSERT INTO `internal_resources` VALUES ('CREATENEW', 'PL', 'Nowy czÃ‚Â³onek tego szablonu zostaÃ‚Â³ utworzony zobacz dane wypisane poniÃ‚Â¿ej.', NULL);
INSERT INTO `internal_resources` VALUES ('PROMPTDELETE', 'PL', 'Czy na pewno chcesz usunÃ‚Â±ÃƒÂ¦ ten zestaw danych? Ta akcja nie moÃ‚Â¿e zostaÃƒÂ¦ cofniÃƒÂªta!', NULL);
INSERT INTO `internal_resources` VALUES ('RESET', 'PL', 'WyczyÃ‚Â¶ÃƒÂ¦ formularz', NULL);
INSERT INTO `internal_resources` VALUES ('BACK', 'PL', 'Wstecz', NULL);
INSERT INTO `internal_resources` VALUES ('CREATE', 'PL', 'UtwÃƒÂ³rz element', NULL);
INSERT INTO `internal_resources` VALUES ('ERROR', 'PL', 'WystÃ‚Â±piÃ‚Â³ bÃ‚Â³Ã‚Â±d podczas operacji wykonywania wyboru!', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE', 'PL', 'UsuniÃƒÂªcie bazy danych', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_MES', 'PL', 'ProszÃƒÂª wybraÃƒÂ¦ czÃƒÂªsci bazy danych, ktÃƒÂ³re zamierzasz usunÃ‚Â±ÃƒÂ¦.', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_VAR', 'PL', 'UsuniÃƒÂªcie odmian', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_CONTENT', 'PL', 'UsuniÃƒÂªcie zawartoÃ‚Â¶ci', NULL);
INSERT INTO `internal_resources` VALUES ('VAR_SUCCEEDED', 'PL', ' powiodÃ‚Â³o siÃƒÂª!', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_FOLDER', 'PL', 'UsuniÃƒÂªcie folderu', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_CLUSTER', 'PL', 'UsuniÃƒÂªcie klastra', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_META', 'PL', 'UsuniÃƒÂªcie Meta', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_CLT', 'PL', 'UsuniÃƒÂªcie szablonÃƒÂ³w klastra', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_PAGES', 'PL', 'UsuniÃƒÂªcie stron serwisu i wzorcÃƒÂ³w', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_EXPIRED', 'PL', 'UsuniÃƒÂªcie stron przedawnionych', NULL);
INSERT INTO `internal_resources` VALUES ('HELP_COMPGRP', 'DE', 'Verbund-Gruppen sind Gruppen von Clustern. Cluster-Vorlagen kÃƒÂ¶nnen ein eigenes Layout besitzen. Dies ermÃƒÂ¶glicht Ihnen, Ihre Homepage aus BlÃƒÂ¶cken zusammenzusezten, z.B. News, Umfrage, Bildergalerie - alles auf einer Seite und bei Bedarf.', '');
INSERT INTO `internal_resources` VALUES ('NO_CLUSTERTEMPLATES', 'DE', 'Keine Klassen.', '');
INSERT INTO `internal_resources` VALUES ('HELP_CLT', 'DE', 'Cluster-Vorlagen erlauben Ihnen, die Struktur fÃƒÂ¼r Ihre Site festzulegen und den Typ von Inhalten zu bestimmen. AnschlieÃƒÅ¸end werden Cluster-Vorlagen mit Seiten-Vorlagen verschmolzen, welche die Inhalte in der Web-Seite darstellen.', '');
INSERT INTO `internal_resources` VALUES ('SPM_SELECTTHUMB', 'DE', 'Vorschaubild auswÃƒÂ¤hlen', '');
INSERT INTO `internal_resources` VALUES ('TT_REFRESH', 'DE', 'Instanzen erneuern aktualisiert zwischengespeicherte Seiten mit den geÃƒÂ¤nderten Werten.', '');
INSERT INTO `internal_resources` VALUES ('HELP_PAGETEMP', 'DE', 'In Tabellenkalkulations- und Datenbank-Anwendungen ist eine Vorlage ein leeres Formular, das zeigt, welche Felder an welcher Position und in welcher LÃƒÂ¤nge existieren. In N/X sind Vorlage die Grundlage fÃƒÂ¼r jede Ausgabe. Eine Vorlage ist ein Formular, in dem alle Zellen definiert wurden, jedoch noch keine Inhalte hinterlegt wurden.', '');
INSERT INTO `internal_resources` VALUES ('CREATED', 'DE', 'Erstellt', '');
INSERT INTO `internal_resources` VALUES ('EDITED', 'DE', 'Bearbeitet', '');
INSERT INTO `internal_resources` VALUES ('IN_CHANNEL', 'DE', 'in Kanal', '');
INSERT INTO `internal_resources` VALUES ('AUTHOR', 'DE', 'Autor', '');
INSERT INTO `internal_resources` VALUES ('SEL_ARTICLE', 'DE', 'Artikel auswÃƒÂ¤hlen', '');
INSERT INTO `internal_resources` VALUES ('CH_CAT', 'DE', 'Kategorien bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('CH_ADMIN', 'DE', 'Kanal-Administration', '');
INSERT INTO `internal_resources` VALUES ('ARTICLES', 'DE', 'Artikel', '');
INSERT INTO `internal_resources` VALUES ('CHANNEL_SELECT', 'DE', 'Kanal auswÃƒÂ¤hlen', '');
INSERT INTO `internal_resources` VALUES ('HELP_OBJBROWSE', 'DE', 'Die Inhalts-Bibliothek enthÃƒÂ¤lt alle Inhalte der Site.', '');
INSERT INTO `internal_resources` VALUES ('HELP_SP', 'DE', 'Die Sitemap dient zum Bearbeiten von Seiten-Struktur und Seiten', '');
INSERT INTO `internal_resources` VALUES ('MH_GETSTART', 'DE', 'Erste Schritte', '');
INSERT INTO `internal_resources` VALUES ('M_HELP', 'DE', 'Hilfe', '');
INSERT INTO `internal_resources` VALUES ('M_CHANNELS', 'DE', 'KanÃƒÂ¤le', '');
INSERT INTO `internal_resources` VALUES ('M_EXPORT_WZ', 'DE', 'Export-Assistent', '');
INSERT INTO `internal_resources` VALUES ('M_IMPORT_WZ', 'DE', 'Import-Assistent', '');
INSERT INTO `internal_resources` VALUES ('SYNC_CLUSTERS', 'DE', 'Objekte synchronisieren', '');
INSERT INTO `internal_resources` VALUES ('AGENT_EXPLAINHOME', 'DE', 'You can find me by clicking the N/X-Logo in the upper-right corner of your browser.', '');
INSERT INTO `internal_resources` VALUES ('AGENT_LOGOUT', 'DE', 'I hope you enjoyed working with N/X. Have a nice day!', '');
INSERT INTO `internal_resources` VALUES ('AGENT_CALLED', 'DE', 'you asked for me?', '');
INSERT INTO `internal_resources` VALUES ('AGENT_NXHOMEPAGE', 'DE', 'Visit N/X Homepage!', '');
INSERT INTO `internal_resources` VALUES ('AGENT_GOAWAY', 'DE', 'Hide and stay away!', '');
INSERT INTO `internal_resources` VALUES ('AGENT_GOHOME', 'DE', 'Go home!', '');
INSERT INTO `internal_resources` VALUES ('AGENT_WELCOME', 'DE', 'Welcome to N/X.', '');
INSERT INTO `internal_resources` VALUES ('YESTERDAY', 'DE', 'Gestern', '');
INSERT INTO `internal_resources` VALUES ('WHEN', 'DE', 'Wann', '');
INSERT INTO `internal_resources` VALUES ('WEEKDAY', 'DE', 'Wochentage', '');
INSERT INTO `internal_resources` VALUES ('WEEKDAY_AS', 'DE', 'Wochentage-Analyse', '');
INSERT INTO `internal_resources` VALUES ('VIS_FIRST', 'DE', 'Erstmalige Besucher', '');
INSERT INTO `internal_resources` VALUES ('VIS_ONL', 'DE', 'Besucher online', '');
INSERT INTO `internal_resources` VALUES ('VIS_PER_VIS', 'DE', 'Durchschnittliche Besuche je Besucher', '');
INSERT INTO `internal_resources` VALUES ('VIS_RET', 'DE', 'Wiederkehrende Besucher', '');
INSERT INTO `internal_resources` VALUES ('WEBSITE', 'DE', 'Website', '');
INSERT INTO `internal_resources` VALUES ('VISITS_OVERVIEW', 'DE', 'Besucher-ÃƒÅ“bersicht', '');
INSERT INTO `internal_resources` VALUES ('VISITS', 'DE', 'Besuche', '');
INSERT INTO `internal_resources` VALUES ('VISITORS', 'DE', 'Besucher', '');
INSERT INTO `internal_resources` VALUES ('USER_PERMISSION', 'DE', 'Benutzerrechte bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('USER_JS', 'DE', 'Javascript verwenden', '');
INSERT INTO `internal_resources` VALUES ('USER_GENERAL', 'DE', 'Allgemeine Benutzerdaten bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('USER_BL', 'DE', 'Backoffice-Sprache', '');
INSERT INTO `internal_resources` VALUES ('USAGE', 'DE', 'Verwendung', '');
INSERT INTO `internal_resources` VALUES ('USERPERM_HEAD', 'DE', 'Benutzer-Rechte berabeiten', '');
INSERT INTO `internal_resources` VALUES ('TRANSLATION', 'DE', 'N/X ÃƒÅ“bersetzungs-System', '');
INSERT INTO `internal_resources` VALUES ('TOTAL', 'DE', 'Gesamt', '');
INSERT INTO `internal_resources` VALUES ('TOP_SKW', 'DE', 'Top Such-SchlÃƒÂ¼sselworte', '');
INSERT INTO `internal_resources` VALUES ('TOP_SI', 'DE', 'Top Suchmaschinen', '');
INSERT INTO `internal_resources` VALUES ('TOP_REFERER', 'DE', 'Top Referer', '');
INSERT INTO `internal_resources` VALUES ('TOP_PATHS', 'DE', 'Top Pfade', '');
INSERT INTO `internal_resources` VALUES ('TOP_OS', 'DE', 'Top Betriebssysteme', '');
INSERT INTO `internal_resources` VALUES ('TOP_EXITT', 'DE', 'Top Ausgangs-Ziele', '');
INSERT INTO `internal_resources` VALUES ('TOP_HOSTS', 'DE', 'Top Hosts', '');
INSERT INTO `internal_resources` VALUES ('TOP_BROWSER', 'DE', 'Top Browser', '');
INSERT INTO `internal_resources` VALUES ('TMPL_NAME', 'DE', 'Vorlage auswÃƒÂ¤hlen', '');
INSERT INTO `internal_resources` VALUES ('TODAY', 'DE', 'Heute', '');
INSERT INTO `internal_resources` VALUES ('TOP', 'DE', 'Daten einschrÃƒÂ¤nken', '');
INSERT INTO `internal_resources` VALUES ('TIPP_TEMPLATE_1', 'DE', 'Vorlagen sind die Basis jeder Ausgabe von N/X. Sie mÃƒÂ¼ssen zunÃƒÂ¤chst eine Klasse  erstellen, die die Struktur und die Art der Inhalte definiert. AnschlieÃƒÅ¸end kÃƒÂ¶nnen Sie die Seiten-Vorlage erstellen, indem Sie eine Klasse mit einer PHP-Datei verbinden.', '');
INSERT INTO `internal_resources` VALUES ('TIME_BETW_VISITS', 'DE', 'Durchschnittliche Zeit zwischen Besuchen', '');
INSERT INTO `internal_resources` VALUES ('THISYEAR', 'DE', 'Dieses Jahr', '');
INSERT INTO `internal_resources` VALUES ('THISWEEK', 'DE', 'Dieses Woche', '');
INSERT INTO `internal_resources` VALUES ('THISMONTH', 'DE', 'Dieser Monat', '');
INSERT INTO `internal_resources` VALUES ('TF', 'DE', 'Zeitrahmen', '');
INSERT INTO `internal_resources` VALUES ('TESTS', 'DE', 'N/X Unit-Tests', '');
INSERT INTO `internal_resources` VALUES ('TEMPLATE', 'DE', 'Vorlage', '');
INSERT INTO `internal_resources` VALUES ('STNAME', 'DE', 'WÃƒÂ¤hlen Sie einen Namen, um die Seite in der Sitemap zu identifizieren', '');
INSERT INTO `internal_resources` VALUES ('STATS_HEADER', 'DE', 'N/X 5.0 Statistiken', '');
INSERT INTO `internal_resources` VALUES ('STATS', 'DE', 'Statistiken', '');
INSERT INTO `internal_resources` VALUES ('START_BAK', 'DE', 'Datensicherung starten', '');
INSERT INTO `internal_resources` VALUES ('SP_RLTREE', 'DE', 'Baum erneut verÃƒÂ¶ffentlichen', '');
INSERT INTO `internal_resources` VALUES ('SP_MENUDIRECTTITLE', 'DE', 'Optionale URL auf dem Server fÃƒÂ¼r direkten Zugriff angeben', '');
INSERT INTO `internal_resources` VALUES ('SP_MENUDIRECT', 'DE', 'Seiten-URL auf Live-Server', '');
INSERT INTO `internal_resources` VALUES ('SP_MENUDIRECTTIT', 'DE', 'Optionale URL auf dem Server fÃƒÂ¼r direkten Zugriff angeben', '');
INSERT INTO `internal_resources` VALUES ('SPM_THUMBNAIL', 'DE', 'Vorschaubild', '');
INSERT INTO `internal_resources` VALUES ('SPM_RLAUNCH', 'DE', 'Seiten erneut verÃƒÂ¶ffentlichen', '');
INSERT INTO `internal_resources` VALUES ('SMA_EXT_EDIT', 'DE', 'Bearbeitungs-Fenster ÃƒÂ¶ffnen. Alle inline bearbeiteten Texte vorher speichern !', '');
INSERT INTO `internal_resources` VALUES ('SHORTEST_PATHS', 'DE', 'KÃƒÂ¼rzeste Pfade', '');
INSERT INTO `internal_resources` VALUES ('SET', 'DE', 'Setzen', '');
INSERT INTO `internal_resources` VALUES ('SEL_MEM', 'DE', 'GewÃƒÂ¤hlte Mitglieder', '');
INSERT INTO `internal_resources` VALUES ('SELMULTIPLE', 'DE', 'Halten Sie die STRG-Taste gedrÃƒÂ¼ckt, um mehrere Elemente auszuwÃƒÂ¤hlen', '');
INSERT INTO `internal_resources` VALUES ('SELECT', 'DE', 'AuswÃƒÂ¤hlen', '');
INSERT INTO `internal_resources` VALUES ('SEARCH_CLEAR', 'DE', 'Filter lÃƒÂ¶schen', '');
INSERT INTO `internal_resources` VALUES ('SAVE_BACK', 'DE', 'Speichern und ZurÃƒÂ¼ck', '');
INSERT INTO `internal_resources` VALUES ('SAVE', 'DE', 'Speichern', '');
INSERT INTO `internal_resources` VALUES ('RL_PERM', 'DE', 'Rollen-Berechtigungen', '');
INSERT INTO `internal_resources` VALUES ('RET_VIS', 'DE', 'Wiederkehrende Besucher', '');
INSERT INTO `internal_resources` VALUES ('RESET_FORM', 'DE', 'Reset', '');
INSERT INTO `internal_resources` VALUES ('REMAIN_POS', 'DE', 'Position beibehalten', '');
INSERT INTO `internal_resources` VALUES ('REFERER', 'DE', 'Referer', '');
INSERT INTO `internal_resources` VALUES ('RB_CACHE', 'DE', 'Zwischenspeichern neu aufbauen', '');
INSERT INTO `internal_resources` VALUES ('RATERES', 'DE', 'Ergebnisse bewerten', '');
INSERT INTO `internal_resources` VALUES ('RANK', 'DE', 'Rang', '');
INSERT INTO `internal_resources` VALUES ('PTEMPL', 'DE', 'Seiten-Vorlagen', '');
INSERT INTO `internal_resources` VALUES ('PROPERTIES', 'DE', 'Eigenschaften', '');
INSERT INTO `internal_resources` VALUES ('PRINT', 'DE', 'Drucken', '');
INSERT INTO `internal_resources` VALUES ('PREDEF_TIME', 'DE', 'Vordefinierter Zeitrahmen', '');
INSERT INTO `internal_resources` VALUES ('POS_IN_MENU', 'DE', 'Position in Ast', '');
INSERT INTO `internal_resources` VALUES ('PI_OVERVIEW', 'DE', 'Page Impressions ÃƒÅ“bersicht', '');
INSERT INTO `internal_resources` VALUES ('PI', 'DE', 'Page Impressions', '');
INSERT INTO `internal_resources` VALUES ('PGNTXT_SMA', 'DE', 'Alle bearbeiteten Texte auf der Seite speichern', '');
INSERT INTO `internal_resources` VALUES ('PERCENT', 'DE', 'Prozent', '');
INSERT INTO `internal_resources` VALUES ('PATHS', 'DE', 'Click-Pfade', '');
INSERT INTO `internal_resources` VALUES ('PAGE', 'DE', 'Seite', '');
INSERT INTO `internal_resources` VALUES ('PAGES', 'DE', 'Seiten', '');
INSERT INTO `internal_resources` VALUES ('PATH', 'DE', 'Pfad', '');
INSERT INTO `internal_resources` VALUES ('OVERVIEW', 'DE', 'ÃƒÅ“bersicht', '');
INSERT INTO `internal_resources` VALUES ('OTHERS', 'DE', 'Andere', '');
INSERT INTO `internal_resources` VALUES ('ORDERCOMP', 'DE', 'Sortierung von Layout-Klassen-Gruppen', '');
INSERT INTO `internal_resources` VALUES ('ORDER', 'DE', 'nach Position', '');
INSERT INTO `internal_resources` VALUES ('OK', 'DE', 'OK', '');
INSERT INTO `internal_resources` VALUES ('NUMBER_OF_INSTANCES', 'DE', 'Bitte geben Sie an, wie viele Slots Sie erzeugen mÃƒÂ¶chten.', '');
INSERT INTO `internal_resources` VALUES ('NO_CONTENTS', 'DE', 'In diesem Ordner existieren keine Inhalte', '');
INSERT INTO `internal_resources` VALUES ('NO_CLUSTER_SELECTED', 'DE', 'Kein Objekt ausgewÃƒÂ¤hlt', '');
INSERT INTO `internal_resources` VALUES ('NEW_FOLDER', 'DE', 'Ordner erstellen', '');
INSERT INTO `internal_resources` VALUES ('NEW_CONTENT', 'DE', 'Neuer Inhalt', '');
INSERT INTO `internal_resources` VALUES ('M_WWW', 'DE', 'Website', '');
INSERT INTO `internal_resources` VALUES ('M_TEMP', 'DE', 'Vorlagen', '');
INSERT INTO `internal_resources` VALUES ('M_TRANSLATION', 'DE', 'ÃƒÅ“bersetzung', '');
INSERT INTO `internal_resources` VALUES ('M_ROLLOUT', 'DE', 'Website kopieren', '');
INSERT INTO `internal_resources` VALUES ('M_REPORT', 'DE', 'Statistiken', '');
INSERT INTO `internal_resources` VALUES ('M_PTEMP', 'DE', 'Seiten Vorlagen', '');
INSERT INTO `internal_resources` VALUES ('M_MAINTENANCE', 'DE', 'Wartung', '');
INSERT INTO `internal_resources` VALUES ('M_LIB', 'DE', 'Bibliothek', '');
INSERT INTO `internal_resources` VALUES ('CL_CREATEINSMES', 'DE', 'Es stehen noch freie Platzhalter zur VerfÃƒÂ¼gung. Wenn Sie eine neue Instanz erzeugen mÃƒÂ¶chten, geben Sie den Titel in das untenstehende Textfeld ein und klicken Sie auf die Erzeugen.', '');
INSERT INTO `internal_resources` VALUES ('CL_CREATEINSTANC', 'DE', 'Neues Objekt erzeugen', '');
INSERT INTO `internal_resources` VALUES ('CL_EDIT', 'DE', 'Objekt bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('CL_DELMES', 'DE', 'MÃƒÂ¶chen Sie dieses Objekt wirklich lÃƒÂ¶schen? SÃƒÂ¤mtlicher Inhalte geht hiermit verloren!', '');
INSERT INTO `internal_resources` VALUES ('CL_DEL', 'DE', 'Objekt lÃƒÂ¶schen', '');
INSERT INTO `internal_resources` VALUES ('CL_PROPERTIES', 'DE', 'Objekt-Eigenschaften', '');
INSERT INTO `internal_resources` VALUES ('CL_NEW', 'DE', 'Neues Objekt', '');
INSERT INTO `internal_resources` VALUES ('CL_BROWSE', 'DE', 'Objekte', '');
INSERT INTO `internal_resources` VALUES ('SPM_PATH', 'DE', 'Dateipfad/Name', '');
INSERT INTO `internal_resources` VALUES ('SPM_CLUSTER', 'DE', 'Klasse', '');
INSERT INTO `internal_resources` VALUES ('SPM_TYPE', 'DE', 'Seiten-Typ', '');
INSERT INTO `internal_resources` VALUES ('SPM_VARIATIONS', 'DE', 'VerfÃƒÂ¼gbare Sprachen', '');
INSERT INTO `internal_resources` VALUES ('SPM_META', 'DE', 'META-Vorlage', '');
INSERT INTO `internal_resources` VALUES ('SPM_EDIT', 'DE', 'Vorlage bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('SPM', 'DE', 'Seiten-Vorlage', '');
INSERT INTO `internal_resources` VALUES ('ACTIVE', 'DE', 'Seite im MenÃƒÂ¼ zeigen', '');
INSERT INTO `internal_resources` VALUES ('NOSPTITLE', 'DE', 'Sie mÃƒÂ¼ssen einen MenÃƒÂ¼namen definieren, bevor Sie die Seite launchen kÃƒÂ¶nnen!', '');
INSERT INTO `internal_resources` VALUES ('SP_EXPIRE', 'DE', 'Seite zurÃƒÂ¼ckziehen', '');
INSERT INTO `internal_resources` VALUES ('SP_LAUNCH', 'DE', 'VerÃƒÂ¶ffentlichen', '');
INSERT INTO `internal_resources` VALUES ('SP_PREVIEW', 'DE', 'Vorschau', '');
INSERT INTO `internal_resources` VALUES ('SP_LAUNCHDATES', 'DE', 'Zeitgesteuertes VerÃƒÂ¶ffentlichen', '');
INSERT INTO `internal_resources` VALUES ('SP_EXPIREDATE', 'DE', 'ZurÃƒÂ¼ckziehen am', '');
INSERT INTO `internal_resources` VALUES ('SP_LAUNCHDATE', 'DE', 'VerÃƒÂ¶ffentlichen ab', '');
INSERT INTO `internal_resources` VALUES ('SP_MENUHELP', 'DE', 'Hilfetext fÃƒÂ¼r das MenÃƒÂ¼', '');
INSERT INTO `internal_resources` VALUES ('SP_MENUNAME', 'DE', 'Name im MenÃƒÂ¼', '');
INSERT INTO `internal_resources` VALUES ('SP_MENUPROPS', 'DE', 'MenÃƒÂ¼-Name', '');
INSERT INTO `internal_resources` VALUES ('SP_EDIT', 'DE', 'Seite bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('SP_CLNEW', 'DE', 'Neues Objekt', '');
INSERT INTO `internal_resources` VALUES ('SP_LINK', 'DE', 'Link zu Objekt', '');
INSERT INTO `internal_resources` VALUES ('SP_CONFDESC', 'DE', 'Sie kÃƒÂ¶nnen diese Seite mit einem Objekt verlinken oder ein neues Objekt fÃƒÂ¼r die Seite erzeugen.', '');
INSERT INTO `internal_resources` VALUES ('SP_CONFIGURE', 'DE', 'Seite konfigurieren', '');
INSERT INTO `internal_resources` VALUES ('SP_PDELETE', 'DE', 'Seite lÃƒÂ¶schen', '');
INSERT INTO `internal_resources` VALUES ('SP_PDELMES', 'DE', 'Sie sind im Begriff eine Seite zu lÃƒÂ¶schen. Bitte beachten Sie, dass auch die verÃƒÂ¶ffentliichte Seite gelÃƒÂ¶scht wird!', '');
INSERT INTO `internal_resources` VALUES ('SP_DELETE', 'DE', 'Seite lÃƒÂ¶schen', '');
INSERT INTO `internal_resources` VALUES ('SP_DELMES', 'DE', 'Sie sind im Begriff eine Seite zu lÃƒÂ¶schen. Bitte beachten Sie, dass auch die verÃƒÂ¶ffentliichte Seite gelÃƒÂ¶scht wird!', '');
INSERT INTO `internal_resources` VALUES ('SP_PROPERTIES', 'DE', 'Eigenschaften', '');
INSERT INTO `internal_resources` VALUES ('SP_IPROPERTIES', 'DE', 'Seiteneinstellungen', '');
INSERT INTO `internal_resources` VALUES ('SP_NEWINSTANCE', 'DE', 'Neue Seite', '');
INSERT INTO `internal_resources` VALUES ('SP_NEWPAGE', 'DE', 'Neue Seite', '');
INSERT INTO `internal_resources` VALUES ('SP_BROWSE', 'DE', 'Website', '');
INSERT INTO `internal_resources` VALUES ('PO_EDIT', 'DE', 'Portalseite bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('PO_MYPORTAL', 'DE', 'Meine Portale', '');
INSERT INTO `internal_resources` VALUES ('PO_CRSUCCEEDED', 'DE', 'Neues Portal erfolgreich erstellt!', '');
INSERT INTO `internal_resources` VALUES ('PO_OWNER', 'DE', 'Seiten-Besitzer', '');
INSERT INTO `internal_resources` VALUES ('PO_BROWSER', 'DE', 'Portal-Browser', '');
INSERT INTO `internal_resources` VALUES ('M_COMBOBJ', 'DE', 'kombinierte Inhalte (Objekte)', '');
INSERT INTO `internal_resources` VALUES ('M_CLUSTERS', 'DE', 'Objekte', '');
INSERT INTO `internal_resources` VALUES ('M_CLT', 'DE', 'Klassen', '');
INSERT INTO `internal_resources` VALUES ('M_BACKUP', 'DE', 'Datensicherung', '');
INSERT INTO `internal_resources` VALUES ('M_ADMIN', 'DE', 'Verwaltung', '');
INSERT INTO `internal_resources` VALUES ('M_ACCESS', 'DE', 'Benutzerverwaltung', '');
INSERT INTO `internal_resources` VALUES ('MT_TITLE', 'DE', 'Wartung', '');
INSERT INTO `internal_resources` VALUES ('MT_SPIDER', 'DE', 'Spider laufen lassen', '');
INSERT INTO `internal_resources` VALUES ('MT_GENERATE_DTA_SUCCEEDED', 'DE', '<br><br>Daten wurden erfolgreich generiert und in die Datei geschrieben.<br>', '');
INSERT INTO `internal_resources` VALUES ('MT_GENERATE_DTA_MES', 'DE', 'Datentypen generieren', '');
INSERT INTO `internal_resources` VALUES ('MT_GENERATE_DTA_', 'DE', 'Datentypen generieren', '');
INSERT INTO `internal_resources` VALUES ('MT_GENERATE_DTA', 'DE', 'Datentypen generieren', '');
INSERT INTO `internal_resources` VALUES ('MT_DW_CONTENTFIELDINFO', 'DE', 'Dreamweaver Inhalts-Feld-Info', '');
INSERT INTO `internal_resources` VALUES ('MT_DW_CONTENTFIE', 'DE', 'Dreamweaver Inhalts-Feld-Info', '');
INSERT INTO `internal_resources` VALUES ('MT_DW_CONTENT', 'DE', 'Dreamweaver PlugIn', '');
INSERT INTO `internal_resources` VALUES ('MINIMUMAT', 'DE', 'Minimum bei', '');
INSERT INTO `internal_resources` VALUES ('MINIMUM', 'DE', 'Minimum', '');
INSERT INTO `internal_resources` VALUES ('MENU', 'DE', 'MenÃƒÂ¼', '');
INSERT INTO `internal_resources` VALUES ('MEDIAN', 'DE', 'Median', '');
INSERT INTO `internal_resources` VALUES ('MAXIMUMAT', 'DE', 'Maximum bei', '');
INSERT INTO `internal_resources` VALUES ('MAXIMUM', 'DE', 'Maximum', '');
INSERT INTO `internal_resources` VALUES ('LONGEST_PATHS', 'DE', 'LÃƒÂ¤ngste Pfade', '');
INSERT INTO `internal_resources` VALUES ('LOGS', 'DE', 'Log-Datei Analyse', '');
INSERT INTO `internal_resources` VALUES ('LOGGED_AS', 'DE', 'Eingeloggt als', '');
INSERT INTO `internal_resources` VALUES ('LOCK_MENU', 'DE', 'Kinderseiten verbieten', '');
INSERT INTO `internal_resources` VALUES ('LOCATION', 'DE', 'Verweisziel, falls extern', '');
INSERT INTO `internal_resources` VALUES ('LIVE_AUTHORING', 'DE', 'WYSIWYG-Editor', '');
INSERT INTO `internal_resources` VALUES ('LIBRARY', 'DE', 'Inhalts-Bibliothek', '');
INSERT INTO `internal_resources` VALUES ('LAUNCH', 'DE', 'VerÃƒÂ¶ffentlichen', '');
INSERT INTO `internal_resources` VALUES ('EXP_TREE', 'EN', 'Unpublish Tree', '');
INSERT INTO `internal_resources` VALUES ('LASTYEAR', 'DE', 'Letztes Jahr', '');
INSERT INTO `internal_resources` VALUES ('LASTWEEK', 'DE', 'Letzte Woche', '');
INSERT INTO `internal_resources` VALUES ('LASTMONTH', 'DE', 'Letzter Monat', '');
INSERT INTO `internal_resources` VALUES ('I_AFTER', 'DE', 'EinfÃƒÂ¼gen nach', '');
INSERT INTO `internal_resources` VALUES ('IS_COMPOUND', 'DE', 'Layout-Klasse', '');
INSERT INTO `internal_resources` VALUES ('IS_FILTERED', 'DE', 'Hinweis: MÃƒÂ¶glicherweise werden nicht alle DatensÃƒÂ¤tze angezeigt, weil ein Filter verwendet wird.', '');
INSERT INTO `internal_resources` VALUES ('INSTANCE_CREATED', 'DE', 'Eine neue Instanz des Elements wurde erzeugt.', '');
INSERT INTO `internal_resources` VALUES ('INSNAME', 'DE', '<Objektname>', '');
INSERT INTO `internal_resources` VALUES ('IND_TIME', 'DE', 'Individuelles Intervall', '');
INSERT INTO `internal_resources` VALUES ('HOURS_AS', 'DE', 'Stunden-Analyse', '');
INSERT INTO `internal_resources` VALUES ('HOUR', 'DE', 'Stunden', '');
INSERT INTO `internal_resources` VALUES ('HELP', 'DE', 'Hilfe', '');
INSERT INTO `internal_resources` VALUES ('GO', 'DE', 'GO', '');
INSERT INTO `internal_resources` VALUES ('GROUP_DESCRIPTION', 'DE', 'Beschreibung', '');
INSERT INTO `internal_resources` VALUES ('FOLDER_DELMES', 'DE', 'MÃƒÂ¶chen Sie diesen Ordner wirklich lÃƒÂ¶schen ?', '');
INSERT INTO `internal_resources` VALUES ('ENVIRONMENT', 'DE', 'Umgebung', '');
INSERT INTO `internal_resources` VALUES ('EXPLORE', 'DE', 'Durchsuchen', '');
INSERT INTO `internal_resources` VALUES ('FILTER_COLUMN', 'DE', '...in', '');
INSERT INTO `internal_resources` VALUES ('FILTER_RULE', 'DE', 'Suche nach...', '');
INSERT INTO `internal_resources` VALUES ('ED_CPGROUPGENERAL', 'DE', 'Allgemeines', '');
INSERT INTO `internal_resources` VALUES ('ED_CPGROUP', 'DE', 'Layout-Klassen-Gruppe bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('EDIT_TEMPLATE', 'DE', 'Vorlage bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('EDIT_SPM', 'DE', 'Allgemeine Einstellungen', '');
INSERT INTO `internal_resources` VALUES ('EDIT_ALL', 'DE', 'Alles bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('EDIT_CONTENT', 'DE', 'Inhalt bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('EDIT_FOLDER', 'DE', 'Ordner bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('EDIT_ACCESS', 'DE', 'Rechte', '');
INSERT INTO `internal_resources` VALUES ('DWEXT_CONTENTFIE', 'DE', 'Inhalts-Feld-Informationen erzeugen', '');
INSERT INTO `internal_resources` VALUES ('DATE', 'DE', 'Datum', '');
INSERT INTO `internal_resources` VALUES ('DEL_FOLDER', 'DE', 'Ordner lÃƒÂ¶schen', '');
INSERT INTO `internal_resources` VALUES ('DESC', 'DE', 'Beschreibung', '');
INSERT INTO `internal_resources` VALUES ('DISPLAY', 'DE', 'Anzeigen', '');
INSERT INTO `internal_resources` VALUES ('CREATE_INSTANCES', 'DE', 'Slots erzeugen', '');
INSERT INTO `internal_resources` VALUES ('CR_CONTENT', 'DE', 'Inhalt fÃƒÂ¼r diese Seite erzeugen?', '');
INSERT INTO `internal_resources` VALUES ('COUNT', 'DE', 'Anzahl', '');
INSERT INTO `internal_resources` VALUES ('CPG_MEMBERS_SELECT', 'DE', 'Mitglieder dieser Layout-Klassen-Gruppe auswÃƒÂ¤hlen', '');
INSERT INTO `internal_resources` VALUES ('CP_GROUP', 'DE', 'Layout-Klassen-Gruppe', '');
INSERT INTO `internal_resources` VALUES ('COLOR', 'DE', 'Farbe', '');
INSERT INTO `internal_resources` VALUES ('COMB_ALL', 'DE', 'Alles auswÃƒÂ¤hlen', '');
INSERT INTO `internal_resources` VALUES ('COMB_NONE', 'DE', 'Auswahl lÃƒÂ¶schen', '');
INSERT INTO `internal_resources` VALUES ('COMMENT', 'DE', 'Kommentar', '');
INSERT INTO `internal_resources` VALUES ('CONTENT', 'DE', 'Inhalte', '');
INSERT INTO `internal_resources` VALUES ('CONTENT_DESC', 'DE', 'Beschreibung', '');
INSERT INTO `internal_resources` VALUES ('CL_NAME', 'DE', 'Objektname', '');
INSERT INTO `internal_resources` VALUES ('CAL_NAME', 'DE', 'Name', '');
INSERT INTO `internal_resources` VALUES ('CATEGORY', 'DE', 'Kategorie', '');
INSERT INTO `internal_resources` VALUES ('CAT_NAME', 'DE', 'Kategorie', '');
INSERT INTO `internal_resources` VALUES ('CLEAR_MEDIA', 'DE', 'Datei aus Datenbank entfernen', '');
INSERT INTO `internal_resources` VALUES ('CLK_PATHS', 'DE', 'Klick-Pfade', '');
INSERT INTO `internal_resources` VALUES ('CAL_EDIT', 'DE', 'Termin bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('CALENDAR_SELECT', 'DE', 'Kalender auswÃƒÂ¤hlen', '');
INSERT INTO `internal_resources` VALUES ('CALENDARS_EDIT', 'DE', 'Kalender bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('CALENDARS_TIPP', 'DE', 'Sie kÃƒÂ¶nnen hier verschiedene Kalender erstellen. Jeder Kalender hat seine eigenen Termine und Ereignisse.', '');
INSERT INTO `internal_resources` VALUES ('CALENDARS_DEFINE', 'DE', 'Kalender erstellen', '');
INSERT INTO `internal_resources` VALUES ('CALENDAR', 'DE', 'Kalender', '');
INSERT INTO `internal_resources` VALUES ('CALENDARS', 'DE', 'Kalender', '');
INSERT INTO `internal_resources` VALUES ('CALENDARS_CAT_DEFINE', 'DE', 'Kategorien bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('CACHED', 'DE', 'Seite cachen', '');
INSERT INTO `internal_resources` VALUES ('BEGIN', 'DE', 'Start', '');
INSERT INTO `internal_resources` VALUES ('BAK_FILE', 'DE', 'Sicherungs-Datei', '');
INSERT INTO `internal_resources` VALUES ('BACKUP', 'DE', 'Sicherung', '');
INSERT INTO `internal_resources` VALUES ('BACK_INFO', 'DE', 'Die untenstehende Liste zeigt die auf Ihrem Server verfÃƒÂ¼gbaren Sicherungen an. Sie kÃƒÂ¶nnen hier einzelne Sicherungen lÃƒÂ¶schen. Um eine Sicherung zurÃƒÂ¼ck zu spielen, mÃƒÂ¼ssen Sie sich manuell auf Ihrem Server einloggen und die Dateien wiederherstellen.', '');
INSERT INTO `internal_resources` VALUES ('AVG_VIS_LENGTH', 'DE', 'Durchschnittliche Besuchsdauer (Sekunden)', '');
INSERT INTO `internal_resources` VALUES ('AVG_VISIT_LENGTH', 'DE', 'Durchschnittliche Besuchsdauer (Klicks)', '');
INSERT INTO `internal_resources` VALUES ('AVG_CLICKSTREAM', 'DE', 'Durchschnittlicher Klick-Pfad', '');
INSERT INTO `internal_resources` VALUES ('AVAIL_VARIATIONS', 'DE', 'VerfÃƒÂ¼gbare Sprachen', '');
INSERT INTO `internal_resources` VALUES ('AVERAGE', 'DE', 'Durchschnitt', '');
INSERT INTO `internal_resources` VALUES ('ACL_PARENT', 'DE', 'Rechte geerbt von', '');
INSERT INTO `internal_resources` VALUES ('ACL_ROLE', 'DE', 'Rollen zu Gruppe zuordnen', '');
INSERT INTO `internal_resources` VALUES ('ACL_TITLE', 'DE', 'Setze Berechtigungen fÃƒÂ¼r', '');
INSERT INTO `internal_resources` VALUES ('AFTER', 'DE', 'Nach:', '');
INSERT INTO `internal_resources` VALUES ('ALC_OWNER', 'DE', 'EigentÃƒÂ¼mer bestimmen', '');
INSERT INTO `internal_resources` VALUES ('AVAIL_ITEMS', 'DE', 'VerfÃƒÂ¼gbare Elemente', '');
INSERT INTO `internal_resources` VALUES ('ACL_INHERIT_NOTE', 'DE', 'Hinweis: Wenn dieses Feld markiert ist, ist keine andere Konfiguration verfÃƒÂ¼gbar!', '');
INSERT INTO `internal_resources` VALUES ('ACL_OWNER', 'DE', 'EigentÃƒÂ¼mer', '');
INSERT INTO `internal_resources` VALUES ('ACL_GROUPS', 'DE', 'Gruppe auswÃƒÂ¤hlen und hinzufÃƒÂ¼gen', '');
INSERT INTO `internal_resources` VALUES ('ACL_GROUPSROLES', 'DE', 'Fremdzugriff', '');
INSERT INTO `internal_resources` VALUES ('ACL_INFO', 'DE', 'Zugriffsrechte vom Elternobjekt erben', '');
INSERT INTO `internal_resources` VALUES ('ACL_INHERIT', 'DE', 'Berechtigungen vom Elternobjekt erben', '');
INSERT INTO `internal_resources` VALUES ('PURGE_EXPIRED', 'DE', 'ZurÃƒÂ¼ckgezogene Seiten bereinigen', '');
INSERT INTO `internal_resources` VALUES ('ACL_ACCESS', 'DE', 'Rechte in Gruppen berabeiten', '');
INSERT INTO `internal_resources` VALUES ('ACL_GROUPEDIT', 'DE', 'Gruppe fÃƒÂ¼r Rollen-Bearbeitung auswÃƒÂ¤hlen', '');
INSERT INTO `internal_resources` VALUES ('PURGE_META', 'DE', 'Meta bereinigen', '');
INSERT INTO `internal_resources` VALUES ('PURGE_CLT', 'DE', 'Klassen bereinigen', '');
INSERT INTO `internal_resources` VALUES ('PURGE_PAGES', 'DE', 'Seiten und Vorlangen bereinigen', '');
INSERT INTO `internal_resources` VALUES ('PURGE_FOLDER', 'DE', 'Ordner bereinigen', '');
INSERT INTO `internal_resources` VALUES ('PURGE_CLUSTER', 'DE', 'Objekte bereinigen', '');
INSERT INTO `internal_resources` VALUES ('VAR_SUCCEEDED', 'DE', 'war erfolgreich.', '');
INSERT INTO `internal_resources` VALUES ('PURGE_VAR', 'DE', 'Sprachen bereinigen', '');
INSERT INTO `internal_resources` VALUES ('PURGE_CONTENT', 'DE', 'Inhalte bereinigen', '');
INSERT INTO `internal_resources` VALUES ('ERROR', 'DE', 'WÃƒÂ¤hrend der AusfÃƒÂ¼hrung der gewÃƒÂ¤hlten Operation ist ein Fehler aufgetreten!', '');
INSERT INTO `internal_resources` VALUES ('PURGE', 'DE', 'Datenbank bereinigen', '');
INSERT INTO `internal_resources` VALUES ('PURGE_MES', 'DE', 'Bitte wÃƒÂ¤hlen Sie die Teile der Datenbank, die Sie bereinigen mÃƒÂ¶chten.', '');
INSERT INTO `internal_resources` VALUES ('RESET', 'DE', 'Reset', '');
INSERT INTO `internal_resources` VALUES ('BACK', 'DE', 'ZurÃƒÂ¼ck', '');
INSERT INTO `internal_resources` VALUES ('CREATE', 'DE', 'Element erstellen', '');
INSERT INTO `internal_resources` VALUES ('SEARCH_LIVE_ACRTICLES', 'DE', 'VerÃƒÂ¶ffentlichte Artikel', '');
INSERT INTO `internal_resources` VALUES ('SEASRCH_MISSING_VARIATIONS', 'DE', 'Fehlende ÃƒÅ“bersetzungen', '');
INSERT INTO `internal_resources` VALUES ('SEL_CH', 'DE', 'Kanal auswÃƒÂ¤hlen', '');
INSERT INTO `internal_resources` VALUES ('SEL_CLUSTER', 'DE', 'Objekt auswÃƒÂ¤hlen', '');
INSERT INTO `internal_resources` VALUES ('SEL_EVENT', 'DE', 'Ereignis oder Termin speichern', '');
INSERT INTO `internal_resources` VALUES ('SEL_PTML', 'DE', 'Seiten-Vorlage auswÃƒÂ¤hlen', '');
INSERT INTO `internal_resources` VALUES ('SEL_VAR', 'DE', 'Sprache auswÃƒÂ¤hlen', '');
INSERT INTO `internal_resources` VALUES ('SHOW', 'DE', 'anzeigen', '');
INSERT INTO `internal_resources` VALUES ('SHOW_ADVANCED_SEARCH', 'DE', 'Erweiterte Suchoptionen anzeigen', '');
INSERT INTO `internal_resources` VALUES ('SHOW_ALL', 'DE', 'Alles anzeigen', '');
INSERT INTO `internal_resources` VALUES ('SHOW_PAGEWISE', 'DE', 'seitenweise', '');
INSERT INTO `internal_resources` VALUES ('STARTDATE', 'DE', 'Startdatum', '');
INSERT INTO `internal_resources` VALUES ('STARTTIME', 'DE', 'Startzeit', '');
INSERT INTO `internal_resources` VALUES ('SYNC_CLUSTERS_DESCR', 'DE', 'Wenn Sie eine Klasse ÃƒÂ¤ndern, werden die Objekte nicht automatisch synchronisiert. Sie werden synchronisiert, wenn Sie das nÃƒÂ¤chste mal mit ihnen arbeiten. Hier kÃƒÂ¶nnen Sie alle manuell synchronisieren.', '');
INSERT INTO `internal_resources` VALUES ('TOP_ENTRYPAGES', 'DE', 'Top Eingangsseiten', '');
INSERT INTO `internal_resources` VALUES ('TOP_EXITPAGES', 'DE', 'Top Ausgangsseiten', '');
INSERT INTO `internal_resources` VALUES ('TOP_PAGES', 'DE', 'Top Seiten', '');
INSERT INTO `internal_resources` VALUES ('TRANS_TEMPL', 'DE', 'ÃƒÅ“bersetzen von', '');
INSERT INTO `internal_resources` VALUES ('TRANS_THIS', 'DE', 'ÃƒÅ“bersetzen Sie:', '');
INSERT INTO `internal_resources` VALUES ('UPL_TEXT', 'DE', 'Text-Datei hochladen', '');
INSERT INTO `internal_resources` VALUES ('WZE_ARTICLEIMPORT_SRCTYPE', 'DE', 'Bitte geben Sie den Quellen-Typ an, aus dem Sie die Artikel importieren mÃƒÂ¶chten.', '');
INSERT INTO `internal_resources` VALUES ('WZE_ARTICLEIMPORT_TARGET', 'DE', 'Bitte wÃƒÂ¤hlen Sie rechts den Ziel-Kanal aus. Alle importierten Artikel werden in diesem Kanal gespeichert.', '');
INSERT INTO `internal_resources` VALUES ('WZT_ARTICLEIMPORT_SRCTYPE', 'DE', 'Quellen-Typ auswÃƒÂ¤hlen', '');
INSERT INTO `internal_resources` VALUES ('WZT_ARTICLEIMPORT_TARGET', 'DE', 'Ziel-Kanal auswÃƒÂ¤hlen', '');
INSERT INTO `internal_resources` VALUES ('WZT_KEEPCLUSTER', 'DE', 'Bestehende Objekte beibehalten?', '');
INSERT INTO `internal_resources` VALUES ('WZT_KEEPCLUSTER_EXPL', 'DE', 'Sie kÃƒÂ¶nnen festlegen, ob Sie die bestehenden Objekte beibehalten mÃƒÂ¶chten oder lieber Kopien von jedem Cluster anlegen wollen.<br><br>Beachten Sie: Wenn Sie die bestehenden Objekte beibehalten, teilen Sie sie sich mit der ursprÃƒÂ¼nglichen Quelle.', '');
INSERT INTO `internal_resources` VALUES ('WZ_ARTICLEIMPORT', 'DE', 'Artikel-Import Assistent', '');
INSERT INTO `internal_resources` VALUES ('WZ_ARTICLEIMPORT_TITLE', 'DE', 'Der Assistent hilft Ihnen, Artikel  aus unterschiedlichen Quellen in einen Kanal zu laden.', '');
INSERT INTO `internal_resources` VALUES ('USER_JS', 'EN', 'Use Javascript', '');
INSERT INTO `internal_resources` VALUES ('USER_BL', 'EN', 'Backend Language', '');
INSERT INTO `internal_resources` VALUES ('PO_BROWSER', 'EN', 'Portal Browser', '');
INSERT INTO `internal_resources` VALUES ('PO_OWNER', 'EN', 'Page Owner', '');
INSERT INTO `internal_resources` VALUES ('PO_CRSUCCEEDED', 'EN', 'The creation of a new portal page succeeded!', '');
INSERT INTO `internal_resources` VALUES ('PO_MYPORTAL', 'EN', 'My Portals', '');
INSERT INTO `internal_resources` VALUES ('PO_EDIT', 'EN', 'Edit Portalpage', '');
INSERT INTO `internal_resources` VALUES ('SP_BROWSE', 'EN', 'Browse Website', '');
INSERT INTO `internal_resources` VALUES ('SP_NEWPAGE', 'EN', 'Add Page', '');
INSERT INTO `internal_resources` VALUES ('SP_NEWINSTANCE', 'EN', 'Add Page', '');
INSERT INTO `internal_resources` VALUES ('SP_IPROPERTIES', 'EN', 'Page Properties', '');
INSERT INTO `internal_resources` VALUES ('SP_PROPERTIES', 'EN', 'Properties', '');
INSERT INTO `internal_resources` VALUES ('SP_DELMES', 'EN', 'You are about to delete a sitepage. Please note, that also already published pages will be deleted', '');
INSERT INTO `internal_resources` VALUES ('SP_DELETE', 'EN', 'Delete Page', '');
INSERT INTO `internal_resources` VALUES ('SP_PDELMES', 'EN', 'You are about to delete a page. Please note, that also the published page will be deleted!', '');
INSERT INTO `internal_resources` VALUES ('SP_PDELETE', 'EN', 'Delete Page', '');
INSERT INTO `internal_resources` VALUES ('SP_CONFIGURE', 'EN', 'Configure Page', '');
INSERT INTO `internal_resources` VALUES ('SP_CONFDESC', 'EN', 'You can link this sitepage with an object or you can create a new object.', '');
INSERT INTO `internal_resources` VALUES ('SP_LINK', 'EN', 'Link to object', '');
INSERT INTO `internal_resources` VALUES ('SP_CLNEW', 'EN', 'New Object', '');
INSERT INTO `internal_resources` VALUES ('SP_EDIT', 'EN', 'Edit Page', '');
INSERT INTO `internal_resources` VALUES ('SP_MENUPROPS', 'EN', 'Page Menu', '');
INSERT INTO `internal_resources` VALUES ('SP_MENUNAME', 'EN', 'Menu Title', '');
INSERT INTO `internal_resources` VALUES ('SP_MENUHELP', 'EN', 'Helptext for Menu', '');
INSERT INTO `internal_resources` VALUES ('SP_LAUNCHDATE', 'EN', 'Publish Date', 'Note: the page must be manually published in order to be published on a defined date!');
INSERT INTO `internal_resources` VALUES ('SP_EXPIREDATE', 'EN', 'Unpublish Date', '');
INSERT INTO `internal_resources` VALUES ('SP_LAUNCHDATES', 'EN', 'Automatic Publishing', '');
INSERT INTO `internal_resources` VALUES ('SP_PREVIEW', 'EN', 'Preview', '');
INSERT INTO `internal_resources` VALUES ('SP_LAUNCH', 'EN', 'Publish', '');
INSERT INTO `internal_resources` VALUES ('SP_EXPIRE', 'EN', 'Unpublish Page', '');
INSERT INTO `internal_resources` VALUES ('NOSPTITLE', 'EN', 'You have to define the menu title before you can launch the page!', '');
INSERT INTO `internal_resources` VALUES ('ACTIVE', 'EN', 'Show Page in Menu', 'When you uncheck this box, the page will no longer be displayed in the menu of the website.');
INSERT INTO `internal_resources` VALUES ('SPM', 'EN', 'Page Template', '');
INSERT INTO `internal_resources` VALUES ('SPM_EDIT', 'EN', 'Edit Template', '');
INSERT INTO `internal_resources` VALUES ('SPM_META', 'EN', 'META-Data Template', '');
INSERT INTO `internal_resources` VALUES ('SPM_VARIATIONS', 'EN', 'Displayable Languages', 'Select the langauges, this template is valid for.');
INSERT INTO `internal_resources` VALUES ('SPM_TYPE', 'EN', 'Page Type', 'Please select always singlepage. Multipage is mature and is there for compatiblity reasons only. Use channels instead.');
INSERT INTO `internal_resources` VALUES ('SPM_CLUSTER', 'EN', 'Class', '');
INSERT INTO `internal_resources` VALUES ('SPM_PATH', 'EN', 'Template Path', 'Filename of the php-file which will be called when you use the page. The file will be created in wwwdev and copied to www after launch.');
INSERT INTO `internal_resources` VALUES ('CL_BROWSE', 'EN', 'Browse Objects', '');
INSERT INTO `internal_resources` VALUES ('CL_NEW', 'EN', 'Create Object', '');
INSERT INTO `internal_resources` VALUES ('CL_PROPERTIES', 'EN', 'Object Properties', '');
INSERT INTO `internal_resources` VALUES ('CL_DEL', 'EN', 'Delete Instance', '');
INSERT INTO `internal_resources` VALUES ('CL_DELMES', 'EN', 'Do you really want to delete this instance of the object. All content data will be lost!', '');
INSERT INTO `internal_resources` VALUES ('CL_EDIT', 'EN', 'Edit Object', '');
INSERT INTO `internal_resources` VALUES ('CL_CREATEINSTANC', 'EN', 'Create new Instance', '');
INSERT INTO `internal_resources` VALUES ('CL_CREATEINSMES', 'EN', 'There are still slots left for creating additional instances of this content-field. If you want to create another instance, then enter a title in the textfield below and press the Create button.', '');
INSERT INTO `internal_resources` VALUES ('CL_NOTITLE', 'EN', 'No title defined yet', '');
INSERT INTO `internal_resources` VALUES ('TITLE', 'EN', 'Title', '');
INSERT INTO `internal_resources` VALUES ('CLI_EDIT', 'EN', 'Edit Object member', '');
INSERT INTO `internal_resources` VALUES ('CLI_DELETE', 'EN', 'Delete Object member', '');
INSERT INTO `internal_resources` VALUES ('CLI_DELETEMES', 'EN', 'Do you really want to delete this object?', '');
INSERT INTO `internal_resources` VALUES ('CLI_DELETED', 'EN', 'The object was successfully deleted.', '');
INSERT INTO `internal_resources` VALUES ('CLI_NOTDELETED', 'EN', 'This object cannot be deleted!', '');
INSERT INTO `internal_resources` VALUES ('CLI', 'EN', 'Object:', '');
INSERT INTO `internal_resources` VALUES ('SR_SELECTCI', 'EN', 'You can search for any content-items here. If you want to select a content-item, then choose it and press the Update button! If you want to connect new content with this field, create the content in the Object Browser first.', '');
INSERT INTO `internal_resources` VALUES ('SR_SELECTCLI', 'EN', 'Please select a class. Afterwards you can select an instance of the template for use.', '');
INSERT INTO `internal_resources` VALUES ('FOLDER', 'EN', 'Folder', '');
INSERT INTO `internal_resources` VALUES ('CONTENTTYPE', 'EN', 'Content-Type', '');
INSERT INTO `internal_resources` VALUES ('CONTENTITEM', 'EN', 'Content-Item', '');
INSERT INTO `internal_resources` VALUES ('SEARCH', 'EN', 'Start Search', '');
INSERT INTO `internal_resources` VALUES ('SEARCHIN', 'EN', 'Search for', '');
INSERT INTO `internal_resources` VALUES ('SEARCHRESULTS', 'EN', 'Search results, please select', '');
INSERT INTO `internal_resources` VALUES ('SELECTEDOBJECT', 'EN', 'Currently Selected Content-Item', '');
INSERT INTO `internal_resources` VALUES ('SELECTEDINSTANCE', 'EN', 'Selected Object', '');
INSERT INTO `internal_resources` VALUES ('M_META', 'EN', 'Meta-Data Templates', '');
INSERT INTO `internal_resources` VALUES ('M_BROWSER', 'EN', 'Object Browser', '');
INSERT INTO `internal_resources` VALUES ('M_INSTALLPLUGIN', 'EN', 'Plugins', '');
INSERT INTO `internal_resources` VALUES ('M_ES', 'EN', 'Explore Site', '');
INSERT INTO `internal_resources` VALUES ('M_SPM', 'EN', 'Page Templates', '');
INSERT INTO `internal_resources` VALUES ('M_PRTMAN', 'EN', 'Portal Manager', '');
INSERT INTO `internal_resources` VALUES ('M_MYPRT', 'EN', 'My Portals', '');
INSERT INTO `internal_resources` VALUES ('M_MYPROFILE', 'EN', 'Settings', '');
INSERT INTO `internal_resources` VALUES ('M_LOGOUT', 'EN', 'Sign Out', '');
INSERT INTO `internal_resources` VALUES ('M_CLB', 'EN', 'Browse Objects', '');
INSERT INTO `internal_resources` VALUES ('M_CLTB', 'EN', 'Class Browser', '');
INSERT INTO `internal_resources` VALUES ('M_UMAN', 'EN', 'User Mangement', '');
INSERT INTO `internal_resources` VALUES ('M_VAR', 'EN', 'Languages', '');
INSERT INTO `internal_resources` VALUES ('M_PURGE', 'EN', 'Clean up Database', '');
INSERT INTO `internal_resources` VALUES ('M_PGN', 'EN', 'Plugin Administration', '');
INSERT INTO `internal_resources` VALUES ('M_REPORT', 'EN', 'Statistics', '');
INSERT INTO `internal_resources` VALUES ('CLT_NEW', 'EN', 'New Class', '');
INSERT INTO `internal_resources` VALUES ('CLT_BROWSE', 'EN', 'Browse Classes', '');
INSERT INTO `internal_resources` VALUES ('CLT_NAME', 'EN', 'Class Name', '');
INSERT INTO `internal_resources` VALUES ('CLT_PROPERTIES', 'EN', 'Class Properties', '');
INSERT INTO `internal_resources` VALUES ('CLT_DELETE', 'EN', 'Delete Class', '');
INSERT INTO `internal_resources` VALUES ('CLT_DELMES', 'EN', 'You are about to delete a class. This will cause the loss of all(!) objects that are based on that class. Are you sure, you want to procceed?', '');
INSERT INTO `internal_resources` VALUES ('CLTI_DELETE', 'EN', 'Do you really want to delete this Item. All instances of this item will be lost also!', '');
INSERT INTO `internal_resources` VALUES ('CLT_SCHEME', 'EN', 'Edit Class', '');
INSERT INTO `internal_resources` VALUES ('CLT_MINCARD', 'EN', 'Instances', '');
INSERT INTO `internal_resources` VALUES ('CLT_MAXCARD', 'EN', '-', '');
INSERT INTO `internal_resources` VALUES ('LINKED', 'EN', 'Linked to', '');
INSERT INTO `internal_resources` VALUES ('PG_INSTALLDESC', 'EN', 'Please make sure that you copied all neccessary files into the folder, before succeeding. Insert the correct path to the plugin in the Input-field below. The system will then install the  plugin automatically.', '');
INSERT INTO `internal_resources` VALUES ('PG_CHOOSE', 'EN', 'Plugin: Ã‚Â  /plugin/', '');
INSERT INTO `internal_resources` VALUES ('PG_FILEWRONG', 'EN', 'The filename you entered could not be found on the server!', '');
INSERT INTO `internal_resources` VALUES ('CLASS_WRONG', 'EN', 'The file you specified has no valid class signature!', '');
INSERT INTO `internal_resources` VALUES ('PG_INSTALLED', 'EN', 'The Plugin was successfully installed!', '');
INSERT INTO `internal_resources` VALUES ('PG_UPGRADED', 'EN', 'The Plug-In was successfully upgraded!', '');
INSERT INTO `internal_resources` VALUES ('PG_ERROR', 'EN', 'There was an error while installing the plugin!', '');
INSERT INTO `internal_resources` VALUES ('PG_ALREADYINSTAL', 'EN', 'The PlugIn is already installed!', '');
INSERT INTO `internal_resources` VALUES ('PG_NEWERINSTALLE', 'EN', 'There is already a newer version of this Plugin installed!', '');
INSERT INTO `internal_resources` VALUES ('PG_TITLE', 'EN', 'Plugins', '');
INSERT INTO `internal_resources` VALUES ('PG_INSTALL', 'EN', 'Install Plugin', '');
INSERT INTO `internal_resources` VALUES ('PG_UNINSTALL', 'EN', 'Uninstall PlugIn', '');
INSERT INTO `internal_resources` VALUES ('PG_UNINSTALLMES', 'EN', 'You are about to uninstall a module. Uninstalling a module does not only remove the content-type but also deletes every single object of this type that is stored in the database. The uninstallation will definitely delete all data of this plugin!', '');
INSERT INTO `internal_resources` VALUES ('PG_UNINSTALLDELE', 'EN', 'Uninstall Plugin,<br> Delete all correspondig contents.', '');
INSERT INTO `internal_resources` VALUES ('O_NEW', 'EN', 'New Object', '');
INSERT INTO `internal_resources` VALUES ('O_NAME', 'EN', 'Object Name', '');
INSERT INTO `internal_resources` VALUES ('O_PROPERTIES', 'EN', 'Object Properties', '');
INSERT INTO `internal_resources` VALUES ('O_DELMES', 'EN', 'You are about to delete an object. <b>Note that all languages-versions and META-DATA will be lost!</b>', '');
INSERT INTO `internal_resources` VALUES ('O_DEL', 'EN', 'Delete object', '');
INSERT INTO `internal_resources` VALUES ('O_EDIT', 'EN', 'Edit Object', '');
INSERT INTO `internal_resources` VALUES ('O_PREVIEW', 'EN', 'Preview of', '');
INSERT INTO `internal_resources` VALUES ('O_TEXT', 'EN', 'Text', '');
INSERT INTO `internal_resources` VALUES ('O_ALT', 'EN', 'ALT-Tag', '');
INSERT INTO `internal_resources` VALUES ('O_COPYRIGHT', 'EN', 'Copyright', '');
INSERT INTO `internal_resources` VALUES ('O_BROWSE', 'EN', 'Browse Objects', '');
INSERT INTO `internal_resources` VALUES ('R_HOME', 'EN', 'Start', '');
INSERT INTO `internal_resources` VALUES ('R_NEWFOLDER', 'EN', 'New Folder', '');
INSERT INTO `internal_resources` VALUES ('R_EDITFOLDER', 'EN', 'Edit Folder Properties', '');
INSERT INTO `internal_resources` VALUES ('R_FOLDERNAME', 'EN', 'Folder Name', '');
INSERT INTO `internal_resources` VALUES ('R_DELETEFOLDER', 'EN', 'Delete Folder', '');
INSERT INTO `internal_resources` VALUES ('R_DELFOLDERMES', 'EN', 'You are about to delete a Folder.  Please select an action.', '');
INSERT INTO `internal_resources` VALUES ('R_FOLDERNOTEMPTY', 'EN', 'This folder is not empty. Only empty folders can be deleted in N/X! Please check all Objects and Contents!', '');
INSERT INTO `internal_resources` VALUES ('R_DELFOLDER', 'EN', 'Delete Folder and all contents', '');
INSERT INTO `internal_resources` VALUES ('R_MOVEOBJECTS', 'EN', 'Move all objects to parent node', '');
INSERT INTO `internal_resources` VALUES ('R_PARENT', 'EN', 'Parent Folder', '');
INSERT INTO `internal_resources` VALUES ('METATEMPLATES', 'EN', 'Meta-Data Templates', '');
INSERT INTO `internal_resources` VALUES ('MT_PROPERTIES', 'EN', 'Edit Properties', '');
INSERT INTO `internal_resources` VALUES ('MT_SCHEME', 'EN', 'Edit Meta-Template', '');
INSERT INTO `internal_resources` VALUES ('MT_DELETE', 'EN', 'Do you really want to delete this part of the meta-template? All information entered in any META-Input in CMS linked to this part will be deleted. The data is going to be lost forever!', '');
INSERT INTO `internal_resources` VALUES ('MT_ADDITIONAL', 'EN', 'Additional META-Data', '');
INSERT INTO `internal_resources` VALUES ('MT_BASE', 'EN', 'Basic META-Data', '');
INSERT INTO `internal_resources` VALUES ('MT_MODULE', 'EN', 'Content-Type specific META-Data', '');
INSERT INTO `internal_resources` VALUES ('VARIATIONS', 'EN', 'Available Languages', '');
INSERT INTO `internal_resources` VALUES ('V_NAME', 'EN', 'Name', '');
INSERT INTO `internal_resources` VALUES ('V_SHORT', 'EN', 'Short-Tag', '');
INSERT INTO `internal_resources` VALUES ('V_EDIT', 'EN', 'Edit Languages', '');
INSERT INTO `internal_resources` VALUES ('LOGIN_FAILED', 'EN', 'The login failed. Please check your username and password.', '');
INSERT INTO `internal_resources` VALUES ('USER_HEAD', 'EN', 'User profile', '');
INSERT INTO `internal_resources` VALUES ('USER_LINK', 'EN', 'User profiles', '');
INSERT INTO `internal_resources` VALUES ('USER_NAME', 'EN', 'Username', '');
INSERT INTO `internal_resources` VALUES ('FULL_NAME', 'EN', 'Full Name', '');
INSERT INTO `internal_resources` VALUES ('PASSWORD', 'EN', 'Password', '');
INSERT INTO `internal_resources` VALUES ('USER_EMAIL', 'EN', 'eMail', '');
INSERT INTO `internal_resources` VALUES ('USER_ACTIVE', 'EN', 'Enable Account', '');
INSERT INTO `internal_resources` VALUES ('USER_FILTERMENU', 'EN', 'User Administration', '');
INSERT INTO `internal_resources` VALUES ('USER_SETPERM', 'EN', 'Set User Permissions below. To remove a user form a group, just revoke all groups from him.', '');
INSERT INTO `internal_resources` VALUES ('USER_PERMGRID', 'EN', 'Permission Grid', '');
INSERT INTO `internal_resources` VALUES ('GROUP_LINK', 'EN', 'Group profiles', '');
INSERT INTO `internal_resources` VALUES ('GROUP_HEAD', 'EN', 'Group profile', '');
INSERT INTO `internal_resources` VALUES ('GROUP_NAME', 'EN', 'Group name', 'You can create groups of objcts, e.g. banners, and name these groups.');
INSERT INTO `internal_resources` VALUES ('GROUP_DESCRIPTIO', 'EN', 'Description', '');
INSERT INTO `internal_resources` VALUES ('GROUP_FILTERMENU', 'EN', 'Group Administration', '');
INSERT INTO `internal_resources` VALUES ('ROLE_LINK', 'EN', 'Role Profiles', '');
INSERT INTO `internal_resources` VALUES ('ROLE_HEAD', 'EN', 'Role Profile', '');
INSERT INTO `internal_resources` VALUES ('ROLE_NAME', 'EN', 'Role Name', '');
INSERT INTO `internal_resources` VALUES ('ROLE_DESCRIPTION', 'EN', 'Description', '');
INSERT INTO `internal_resources` VALUES ('ROLE_FILTERMENU', 'EN', 'Role Administration', '');
INSERT INTO `internal_resources` VALUES ('USER_PERMISSIONS', 'EN', 'User Permissions', '');
INSERT INTO `internal_resources` VALUES ('UP_INTRO', 'EN', 'Please select the group and afterwards the roles in the group, you want to add to the user.', '');
INSERT INTO `internal_resources` VALUES ('USER_TO_GROUP', 'EN', 'Add user to group', '');
INSERT INTO `internal_resources` VALUES ('ERROR_SEL_GROUP', 'EN', 'You must select a group!', '');
INSERT INTO `internal_resources` VALUES ('ERROR_SEL_ROLE', 'EN', 'You must select at least one role!', '');
INSERT INTO `internal_resources` VALUES ('USER_PROFILE', 'EN', 'Personal Settings', '');
INSERT INTO `internal_resources` VALUES ('COMMIT', 'EN', 'Commit', '');
INSERT INTO `internal_resources` VALUES ('CANCEL', 'EN', 'Cancel', '');
INSERT INTO `internal_resources` VALUES ('YES', 'EN', 'Yes', '');
INSERT INTO `internal_resources` VALUES ('NO', 'EN', 'No', '');
INSERT INTO `internal_resources` VALUES ('NEW', 'EN', 'Create New', '');
INSERT INTO `internal_resources` VALUES ('NAME', 'EN', 'Name', '');
INSERT INTO `internal_resources` VALUES ('DESCRIPTION', 'EN', 'Description', '');
INSERT INTO `internal_resources` VALUES ('DOSOMETHING', 'EN', 'Please select the action you want to apply. You can insert new items, edit items, delete items and change the order of items.', '');
INSERT INTO `internal_resources` VALUES ('EDIT', 'EN', 'Edit', '');
INSERT INTO `internal_resources` VALUES ('UP', 'EN', 'Up', '');
INSERT INTO `internal_resources` VALUES ('DOWN', 'EN', 'Down', '');
INSERT INTO `internal_resources` VALUES ('CONTAINERNAME', 'EN', 'Template', '');
INSERT INTO `internal_resources` VALUES ('SELECTOBJECT', 'EN', 'Please select a class and specify a position and a name for creating a new object.<br>For position use 0 for inserting at the begin, 999 for inserting at the end and any other position of your choice.', '');
INSERT INTO `internal_resources` VALUES ('POSITION', 'EN', 'Position', 'Pages are ordered by their position in the tree of the website.');
INSERT INTO `internal_resources` VALUES ('DELETE', 'EN', 'Delete', '');
INSERT INTO `internal_resources` VALUES ('TYPE', 'EN', 'Type', '');
INSERT INTO `internal_resources` VALUES ('KEYWORDS', 'EN', 'Keywords', '');
INSERT INTO `internal_resources` VALUES ('METATEMPLATE', 'EN', 'Additional META-Key-Template', 'Select a Meta-Template if you want to add meta-data to a cluster.');
INSERT INTO `internal_resources` VALUES ('SELECT_VARIATION', 'EN', 'Select Variation', '');
INSERT INTO `internal_resources` VALUES ('ACTIVE_VARIATION', 'EN', 'Active Language:', '');
INSERT INTO `internal_resources` VALUES ('NO_VARIATIONS', 'EN', 'There are actually no language-versions of this object defined!<br>Please call a developer for checking the configuration of the selected item!', '');
INSERT INTO `internal_resources` VALUES ('ED_CONTENT', 'EN', 'Content', '');
INSERT INTO `internal_resources` VALUES ('ED_META', 'EN', 'META-Data', '');
INSERT INTO `internal_resources` VALUES ('ED_DISPATCHER', 'EN', 'Use this button for switching between Editing of META-Data and Editing of Content.', '');
INSERT INTO `internal_resources` VALUES ('PREVIEW', 'EN', 'Preview', '');
INSERT INTO `internal_resources` VALUES ('CHOOSEFILE', 'EN', 'Choose a file', '');
INSERT INTO `internal_resources` VALUES ('CONFIGURED', 'EN', 'Ready to use.', '');
INSERT INTO `internal_resources` VALUES ('NOTCONFIGURED', 'EN', 'Not configured yet.', '');
INSERT INTO `internal_resources` VALUES ('CONFIG', 'EN', 'Configure', '');
INSERT INTO `internal_resources` VALUES ('SELECT_CI', 'EN', 'Select a Content-Item', '');
INSERT INTO `internal_resources` VALUES ('SELECT_CL', 'EN', 'Select a Cluster-Instance', '');
INSERT INTO `internal_resources` VALUES ('EMPTY', 'EN', '<empty>', '');
INSERT INTO `internal_resources` VALUES ('STATUS', 'EN', 'Status:', '');
INSERT INTO `internal_resources` VALUES ('UNIQUE', 'EN', 'The value you entered already exsists.', '');
INSERT INTO `internal_resources` VALUES ('MANDATORY', 'EN', 'This field cannot be empty!', '');
INSERT INTO `internal_resources` VALUES ('NOTNUMBER', 'EN', 'Please enter a valid number!', '');
INSERT INTO `internal_resources` VALUES ('WRONGDATE', 'EN', 'Wrong date!', '');
INSERT INTO `internal_resources` VALUES ('PWDNOTMATCH', 'EN', 'The passwords you entered do not match!', '');
INSERT INTO `internal_resources` VALUES ('PWDTOOSHORT', 'EN', 'The password must have a length of at least 6 chars!', '');
INSERT INTO `internal_resources` VALUES ('PROCERROR', 'EN', 'An error occured while processing the form. Please check the marked fields and read there for further information.', '');
INSERT INTO `internal_resources` VALUES ('SAVEERROR', 'EN', 'An error occured while saving the data to the database. Please make sure, the database is connected or call your Administrator.', '');
INSERT INTO `internal_resources` VALUES ('SAVESUCCESS', 'EN', 'The data was successfully written to the database.', '');
INSERT INTO `internal_resources` VALUES ('DELETESUCCESS', 'EN', 'The data listed below was successfully deleted from the database.', '');
INSERT INTO `internal_resources` VALUES ('SELECTONE', 'EN', 'Please make your choice.', '');
INSERT INTO `internal_resources` VALUES ('CREATENEW', 'EN', 'A new member of this template was created. See the data listed below.', '');
INSERT INTO `internal_resources` VALUES ('PROMPTDELETE', 'EN', 'Do you really want to delete this record?', '');
INSERT INTO `internal_resources` VALUES ('RESET', 'EN', 'Reset', '');
INSERT INTO `internal_resources` VALUES ('BACK', 'EN', 'Back', '');
INSERT INTO `internal_resources` VALUES ('CREATE', 'EN', 'Create Item', '');
INSERT INTO `internal_resources` VALUES ('ERROR', 'EN', 'An error occured while doing the selected operation!', '');
INSERT INTO `internal_resources` VALUES ('PURGE', 'EN', 'Clean Up Database', '');
INSERT INTO `internal_resources` VALUES ('PURGE_MES', 'EN', 'Please select the parts of the database, you want to clean up.', '');
INSERT INTO `internal_resources` VALUES ('PURGE_VAR', 'EN', 'Purge Languages', '');
INSERT INTO `internal_resources` VALUES ('PURGE_CONTENT', 'EN', 'Purge Content', '');
INSERT INTO `internal_resources` VALUES ('VAR_SUCCEEDED', 'EN', 'succeeded!', '');
INSERT INTO `internal_resources` VALUES ('PURGE_FOLDER', 'EN', 'Purge Folders', '');
INSERT INTO `internal_resources` VALUES ('PURGE_CLUSTER', 'EN', 'Purge Objects', '');
INSERT INTO `internal_resources` VALUES ('PURGE_META', 'EN', 'Purge Meta-Data', '');
INSERT INTO `internal_resources` VALUES ('PURGE_CLT', 'EN', 'Purge Classes', '');
INSERT INTO `internal_resources` VALUES ('PURGE_PAGES', 'EN', 'Purge Pages and Templates', '');
INSERT INTO `internal_resources` VALUES ('PURGE_EXPIRED', 'EN', 'Purge Expired Pages', '');
INSERT INTO `internal_resources` VALUES ('EDIT_ALL', 'EN', 'Edit All', '');
INSERT INTO `internal_resources` VALUES ('SAVE', 'EN', 'Save', '');
INSERT INTO `internal_resources` VALUES ('LIVE_AUTHORING', 'EN', 'Live Authoring', '');
INSERT INTO `internal_resources` VALUES ('INSTANCE_CREATED', 'EN', 'A new instance of the item was created.', '');
INSERT INTO `internal_resources` VALUES ('GO', 'EN', 'GO', '');
INSERT INTO `internal_resources` VALUES ('CACHED', 'EN', 'Cache Page', 'N/X is able to create static HTML-files for the website. Whenever the\r\ncheckbox is checked, the system will create a static HTML-page.');
INSERT INTO `internal_resources` VALUES ('MENU', 'EN', 'Menu', '');
INSERT INTO `internal_resources` VALUES ('RB_CACHE', 'EN', 'Rebuild Cache', '');
INSERT INTO `internal_resources` VALUES ('LOGGED_AS', 'EN', 'Logged in as', '');
INSERT INTO `internal_resources` VALUES ('M_ACCESS', 'EN', 'User Administration', '');
INSERT INTO `internal_resources` VALUES ('M_MAINTENANCE', 'EN', 'Maintenance', '');
INSERT INTO `internal_resources` VALUES ('M_WWW', 'EN', 'Website', '');
INSERT INTO `internal_resources` VALUES ('M_TEMP', 'EN', 'Templates', '');
INSERT INTO `internal_resources` VALUES ('M_ROLLOUT', 'EN', 'Copy Website', '');
INSERT INTO `internal_resources` VALUES ('M_LIB', 'EN', 'Content Library', '');
INSERT INTO `internal_resources` VALUES ('M_COMBOBJ', 'EN', 'Combined Contents (Cluster)', '');
INSERT INTO `internal_resources` VALUES ('M_CLT', 'EN', 'Classes', '');
INSERT INTO `internal_resources` VALUES ('RL_PERM', 'EN', 'Role Permissions', '');
INSERT INTO `internal_resources` VALUES ('MT_TITLE', 'EN', 'Maintenance', '');
INSERT INTO `internal_resources` VALUES ('MT_GENERATE_DTA', 'EN', 'Update DB-Info', '');
INSERT INTO `internal_resources` VALUES ('MT_DW_CONTENTFIE', 'EN', 'Dreamweaver Content-Field-Info', '');
INSERT INTO `internal_resources` VALUES ('MT_GENERATE_DTA_', 'EN', 'Generate database information', '');
INSERT INTO `internal_resources` VALUES ('DWEXT_CONTENTFIE', 'EN', 'Generate Content-Field-Information', '');
INSERT INTO `internal_resources` VALUES ('SPM_RLAUNCH', 'EN', 'Refresh Pages', '');
INSERT INTO `internal_resources` VALUES ('SP_RLTREE', 'EN', 'Republish Tree', '');
INSERT INTO `internal_resources` VALUES ('SP_MENUDIRECTTIT', 'EN', 'Define optinal URL on server for direct access', '');
INSERT INTO `internal_resources` VALUES ('SP_MENUDIRECT', 'EN', 'URL on Live Server', '');
INSERT INTO `internal_resources` VALUES ('TMPL_NAME', 'EN', 'Select a template', '');
INSERT INTO `internal_resources` VALUES ('STNAME', 'EN', 'Select a name to identify the page in the sitemap. The name you selected and the menu title can be different!', '');
INSERT INTO `internal_resources` VALUES ('POS_IN_MENU', 'EN', 'Position in sitemap', 'Pages are ordered by their position in the tree of the website.');
INSERT INTO `internal_resources` VALUES ('CR_CONTENT', 'EN', 'Create Content for this page?', '');
INSERT INTO `internal_resources` VALUES ('CLEAR_MEDIA', 'EN', 'Remove file from database', '');
INSERT INTO `internal_resources` VALUES ('DESC', 'EN', 'Description', '');
INSERT INTO `internal_resources` VALUES ('LOCATION', 'EN', 'Location, if external', '');
INSERT INTO `internal_resources` VALUES ('CONTENT', 'EN', 'Content', '');
INSERT INTO `internal_resources` VALUES ('M_CLUSTERS', 'EN', 'Objects', '');
INSERT INTO `internal_resources` VALUES ('M_PTEMP', 'EN', 'Page Templates', '');
INSERT INTO `internal_resources` VALUES ('MT_SPIDER', 'EN', 'Search Indexing', '');
INSERT INTO `internal_resources` VALUES ('MT_DW_CONTENTFIELDINFO', 'EN', 'Dreamweaver Content-Field-Info', '');
INSERT INTO `internal_resources` VALUES ('LOGS', 'EN', 'Logfile', '');
INSERT INTO `internal_resources` VALUES ('TESTS', 'EN', 'N/X Unit Tests', '');
INSERT INTO `internal_resources` VALUES ('M_ADMIN', 'EN', 'Administration', '');
INSERT INTO `internal_resources` VALUES ('M_BACKUP', 'EN', 'Backup', '');
INSERT INTO `internal_resources` VALUES ('M_TRANSLATION', 'EN', 'Backend Translation', '');
INSERT INTO `internal_resources` VALUES ('PTEMPL', 'EN', 'Page Template', '');
INSERT INTO `internal_resources` VALUES ('SP_MENUDIRECTTITLE', 'EN', 'Define optional Path on server for direct access.', 'Sometimes you may want to access a page with a name instead of an IP-address, e.g.\r\nwww.news.fi/oulu instead of www.news.fi/www/p100211_v1.html. You enter\r\nthe Path here.');
INSERT INTO `internal_resources` VALUES ('LIBRARY', 'EN', 'Content Library', '');
INSERT INTO `internal_resources` VALUES ('NEW_CONTENT', 'EN', 'New Content', '');
INSERT INTO `internal_resources` VALUES ('NEW_FOLDER', 'EN', 'Create Folder', '');
INSERT INTO `internal_resources` VALUES ('EDIT_FOLDER', 'EN', 'Edit Folder', '');
INSERT INTO `internal_resources` VALUES ('DEL_FOLDER', 'EN', 'Delete Folder', '');
INSERT INTO `internal_resources` VALUES ('EDIT_ACCESS', 'EN', 'Permissions', '');
INSERT INTO `internal_resources` VALUES ('USAGE', 'EN', 'Usage', '');
INSERT INTO `internal_resources` VALUES ('LAUNCH', 'EN', 'Publish', '');
INSERT INTO `internal_resources` VALUES ('AVAIL_VARIATIONS', 'EN', 'Available languages', '');
INSERT INTO `internal_resources` VALUES ('NO_CONTENTS', 'EN', 'No content available in this folder.', '');
INSERT INTO `internal_resources` VALUES ('EDIT_CONTENT', 'EN', 'Edit Content', '');
INSERT INTO `internal_resources` VALUES ('CONTENT_DESC', 'EN', 'Description of Content', '');
INSERT INTO `internal_resources` VALUES ('SAVE_BACK', 'EN', 'Save and Back', '');
INSERT INTO `internal_resources` VALUES ('PROPERTIES', 'EN', 'Properties', '');
INSERT INTO `internal_resources` VALUES ('RESET_FORM', 'EN', 'Reset', '');
INSERT INTO `internal_resources` VALUES ('NO_CLUSTER_SELECTED', 'EN', 'No object selected.', '');
INSERT INTO `internal_resources` VALUES ('CREATE_INSTANCES', 'EN', 'Create slots', '');
INSERT INTO `internal_resources` VALUES ('NUMBER_OF_INSTANCES', 'EN', 'Please specify how many slots you want to create', '');
INSERT INTO `internal_resources` VALUES ('TIPP_TEMPLATE_1', 'EN', 'Templates are the basis of every output with N/X. <br>You will need to create a class first, which defines the structure and the kind of contents. Afterwards you can create the page-templates here and assign a php-file to a class.<br><br>', '');
INSERT INTO `internal_resources` VALUES ('SPM_THUMBNAIL', 'EN', 'Thumbnail', '');
INSERT INTO `internal_resources` VALUES ('HELP', 'EN', 'Help', '');
INSERT INTO `internal_resources` VALUES ('EXPLORE', 'EN', 'Explore', '');
INSERT INTO `internal_resources` VALUES ('FILTER_RULE', 'EN', 'Search for...', '');
INSERT INTO `internal_resources` VALUES ('FILTER_COLUMN', 'EN', 'in', '');
INSERT INTO `internal_resources` VALUES ('SEARCH_CLEAR', 'EN', 'Reset Filter', '');
INSERT INTO `internal_resources` VALUES ('ED_CPGROUP', 'EN', 'Edit Layout-Class Group', '');
INSERT INTO `internal_resources` VALUES ('GROUP_DESCRIPTION', 'EN', 'Description', '');
INSERT INTO `internal_resources` VALUES ('ACCESS_VIOLATION', 'DE', 'Zugriffsverletzung', '');
INSERT INTO `internal_resources` VALUES ('WYSIWYG', 'EN', 'WYSIWYG Editor', '');
INSERT INTO `internal_resources` VALUES ('ORDER', 'EN', 'By order', '');
INSERT INTO `internal_resources` VALUES ('ORDERCOMP', 'EN', 'Order of Compounds', 'Set the order in which clusters, e.g. banners, appear.');
INSERT INTO `internal_resources` VALUES ('ED_CPGROUPGENERAL', 'EN', 'Edit common Data', '');
INSERT INTO `internal_resources` VALUES ('CPG_MEMBERS_SELECT', 'EN', 'Select members of this layout-class group', '');
INSERT INTO `internal_resources` VALUES ('AVAIL_ITEMS', 'EN', 'Available items', '');
INSERT INTO `internal_resources` VALUES ('SEL_MEM', 'EN', 'Selected members', '');
INSERT INTO `internal_resources` VALUES ('COMB_ALL', 'EN', 'Select All', '');
INSERT INTO `internal_resources` VALUES ('COMB_NONE', 'EN', 'Clear All', '');
INSERT INTO `internal_resources` VALUES ('MT_DW_CONTENT', 'EN', 'Dreamweaver Plugin', '');
INSERT INTO `internal_resources` VALUES ('MT_GENERATE_DTA_MES', 'EN', 'Generate database-information for automatic versioning.', '');
INSERT INTO `internal_resources` VALUES ('MT_GENERATE_DTA_SUCCEEDED', 'EN', 'DataTypes were successfully generated and file was written.', '');
INSERT INTO `internal_resources` VALUES ('START_BAK', 'EN', 'Start Backup', '');
INSERT INTO `internal_resources` VALUES ('BACKUP', 'EN', 'System Backup', '');
INSERT INTO `internal_resources` VALUES ('BACK_INFO', 'EN', 'The list below shows you the backups of N/X on your server. You can delete the backups here. To restore a backup,you need to manually log in your server and restore the files yourself.', '');
INSERT INTO `internal_resources` VALUES ('BAK_FILE', 'EN', 'Backup file', '');
INSERT INTO `internal_resources` VALUES ('IS_COMPOUND', 'EN', 'Layout-Class', 'Enable objects to have its own layout-template by checking this box.');
INSERT INTO `internal_resources` VALUES ('TEMPLATE', 'EN', 'Template', '');
INSERT INTO `internal_resources` VALUES ('OVERVIEW', 'EN', 'Overview', '');
INSERT INTO `internal_resources` VALUES ('VISITORS', 'EN', 'Visitors', '');
INSERT INTO `internal_resources` VALUES ('PAGES', 'EN', 'Pages', '');
INSERT INTO `internal_resources` VALUES ('WEEKDAY', 'EN', 'Weekdays', '');
INSERT INTO `internal_resources` VALUES ('HOUR', 'EN', 'Hours', '');
INSERT INTO `internal_resources` VALUES ('REFERER', 'EN', 'Referer', '');
INSERT INTO `internal_resources` VALUES ('ENVIRONMENT', 'EN', 'Environment', '');
INSERT INTO `internal_resources` VALUES ('PATHS', 'EN', 'Clickpaths', '');
INSERT INTO `internal_resources` VALUES ('STATS_HEADER', 'EN', 'N/X 5.0 Traffic Statistics', '');
INSERT INTO `internal_resources` VALUES ('VISITS_OVERVIEW', 'EN', 'Visitors overview', '');
INSERT INTO `internal_resources` VALUES ('VISITS', 'EN', 'Visitors', '');
INSERT INTO `internal_resources` VALUES ('TOTAL', 'EN', 'Total', '');
INSERT INTO `internal_resources` VALUES ('AVERAGE', 'EN', 'Average', '');
INSERT INTO `internal_resources` VALUES ('MEDIAN', 'EN', 'Median', '');
INSERT INTO `internal_resources` VALUES ('MAXIMUM', 'EN', 'Maximum', '');
INSERT INTO `internal_resources` VALUES ('MAXIMUMAT', 'EN', 'Maximum at', '');
INSERT INTO `internal_resources` VALUES ('MINIMUM', 'EN', 'Minimum', '');
INSERT INTO `internal_resources` VALUES ('MINIMUMAT', 'EN', 'Minimum at', '');
INSERT INTO `internal_resources` VALUES ('PI_OVERVIEW', 'EN', 'Page Impressions Overview', '');
INSERT INTO `internal_resources` VALUES ('PI', 'EN', 'Page Impressions', '');
INSERT INTO `internal_resources` VALUES ('TF', 'EN', 'Time Frame', '');
INSERT INTO `internal_resources` VALUES ('PREDEF_TIME', 'EN', 'Predefined Interval', '');
INSERT INTO `internal_resources` VALUES ('TODAY', 'EN', 'Today', '');
INSERT INTO `internal_resources` VALUES ('YESTERDAY', 'EN', 'Yesterday', '');
INSERT INTO `internal_resources` VALUES ('THISWEEK', 'EN', 'This Week', '');
INSERT INTO `internal_resources` VALUES ('LASTWEEK', 'EN', 'Last Week', '');
INSERT INTO `internal_resources` VALUES ('THISMONTH', 'EN', 'This Month', '');
INSERT INTO `internal_resources` VALUES ('LASTMONTH', 'EN', 'Last Month', '');
INSERT INTO `internal_resources` VALUES ('THISYEAR', 'EN', 'This Year', '');
INSERT INTO `internal_resources` VALUES ('LASTYEAR', 'EN', 'Last Year', '');
INSERT INTO `internal_resources` VALUES ('IND_TIME', 'EN', 'Individual interval', '');
INSERT INTO `internal_resources` VALUES ('SET', 'EN', 'Set', '');
INSERT INTO `internal_resources` VALUES ('PRINT', 'EN', 'Print', '');
INSERT INTO `internal_resources` VALUES ('ACL_TITLE', 'EN', 'Setting permissions for', '');
INSERT INTO `internal_resources` VALUES ('ACL_INHERIT', 'EN', 'Inherit permissions from parent', '');
INSERT INTO `internal_resources` VALUES ('ACL_INHERIT_NOTE', 'EN', 'Note: When the box is checked, there is no other configuration available!', '');
INSERT INTO `internal_resources` VALUES ('ACL_INFO', 'EN', 'Inherited Access from parent', '');
INSERT INTO `internal_resources` VALUES ('ACL_PARENT', 'EN', 'Permissions inherited from', '');
INSERT INTO `internal_resources` VALUES ('ACL_GROUPSROLES', 'EN', 'Foreign Access', 'Declare groups, who you allow to access this object.');
INSERT INTO `internal_resources` VALUES ('ALC_OWNER', 'EN', 'Set Owner', '');
INSERT INTO `internal_resources` VALUES ('ACL_OWNER', 'EN', 'Owner', 'The members of this group have Administrator role on this ressource');
INSERT INTO `internal_resources` VALUES ('ACL_ACCESS', 'EN', 'Edit permissions in groups on', '');
INSERT INTO `internal_resources` VALUES ('ACL_GROUPS', 'EN', 'Select Group to add', '');
INSERT INTO `internal_resources` VALUES ('ACL_GROUPEDIT', 'EN', 'Select group to edit roles', '');
INSERT INTO `internal_resources` VALUES ('ACL_ROLE', 'EN', 'Select roles for group', '');
INSERT INTO `internal_resources` VALUES ('SELMULTIPLE', 'EN', 'Hold down the CTRL-Key to select multiple items!', '');
INSERT INTO `internal_resources` VALUES ('SELECT', 'EN', 'Select', '');
INSERT INTO `internal_resources` VALUES ('CP_GROUP', 'EN', 'Layout-Class Group', '');
INSERT INTO `internal_resources` VALUES ('EDIT_TEMPLATE', 'EN', 'Edit Template', '');
INSERT INTO `internal_resources` VALUES ('EDIT_SPM', 'EN', 'Edit Template Properties', '');
INSERT INTO `internal_resources` VALUES ('OK', 'EN', 'Ok', '');
INSERT INTO `internal_resources` VALUES ('FOLDER_DELMES', 'EN', 'Do you really want to delete this folder?', '');
INSERT INTO `internal_resources` VALUES ('RATERES', 'EN', 'Rate Results', '');
INSERT INTO `internal_resources` VALUES ('DISPLAY', 'EN', 'Display', '');
INSERT INTO `internal_resources` VALUES ('PAGE', 'EN', 'Page', '');
INSERT INTO `internal_resources` VALUES ('COMMENT', 'EN', 'Comment', '');
INSERT INTO `internal_resources` VALUES ('DATE', 'EN', 'Date', '');
INSERT INTO `internal_resources` VALUES ('SMA_EXT_EDIT', 'EN', 'Open edit window. Save all inline edited texts before!', '');
INSERT INTO `internal_resources` VALUES ('PGNTXT_SMA', 'EN', 'Save all edited texts on the page', '');
INSERT INTO `internal_resources` VALUES ('AVG_VISIT_LENGTH', 'EN', 'Average Visit Length (clicks)', '');
INSERT INTO `internal_resources` VALUES ('AVG_CLICKSTREAM', 'EN', 'Average Clickstream', '');
INSERT INTO `internal_resources` VALUES ('VIS_ONL', 'EN', 'Visitors online', '');
INSERT INTO `internal_resources` VALUES ('WHEN', 'EN', 'When', '');
INSERT INTO `internal_resources` VALUES ('RET_VIS', 'EN', 'Returning visitors', '');
INSERT INTO `internal_resources` VALUES ('VIS_FIRST', 'EN', 'First time visitors', '');
INSERT INTO `internal_resources` VALUES ('VIS_RET', 'EN', 'Returning visitors', '');
INSERT INTO `internal_resources` VALUES ('TIME_BETW_VISITS', 'EN', 'Average time between visits', '');
INSERT INTO `internal_resources` VALUES ('VIS_PER_VIS', 'EN', 'Average visits per visitor', '');
INSERT INTO `internal_resources` VALUES ('AVG_VIS_LENGTH', 'EN', 'Average Visit Length (Seconds)', '');
INSERT INTO `internal_resources` VALUES ('TOP_BROWSER', 'EN', 'Top Browsers', '');
INSERT INTO `internal_resources` VALUES ('RANK', 'EN', 'Rank', '');
INSERT INTO `internal_resources` VALUES ('COUNT', 'EN', 'Count', '');
INSERT INTO `internal_resources` VALUES ('PERCENT', 'EN', 'Percent', '');
INSERT INTO `internal_resources` VALUES ('TOP_OS', 'EN', 'Top Operating Systems', '');
INSERT INTO `internal_resources` VALUES ('TOP_HOSTS', 'EN', 'Top Hosts', '');
INSERT INTO `internal_resources` VALUES ('TOP', 'EN', 'Restrict data', '');
INSERT INTO `internal_resources` VALUES ('OTHERS', 'EN', 'Others', '');
INSERT INTO `internal_resources` VALUES ('CLK_PATHS', 'EN', 'Clickpaths', '');
INSERT INTO `internal_resources` VALUES ('TOP_PATHS', 'EN', 'Top Paths', '');
INSERT INTO `internal_resources` VALUES ('PATH', 'EN', 'Path', '');
INSERT INTO `internal_resources` VALUES ('SHORTEST_PATHS', 'EN', 'Shortest Paths', '');
INSERT INTO `internal_resources` VALUES ('LONGEST_PATHS', 'EN', 'Longest Paths', '');
INSERT INTO `internal_resources` VALUES ('WEBSITE', 'EN', 'Website', '');
INSERT INTO `internal_resources` VALUES ('TRANSLATION', 'EN', 'N/X Translation System', '');
INSERT INTO `internal_resources` VALUES ('STATS', 'EN', 'Statistics', '');
INSERT INTO `internal_resources` VALUES ('LOCK_MENU', 'EN', 'Permit Childpages', 'By permitting childpages, a developer can prevent editors from creating sub pages for a page.');
INSERT INTO `internal_resources` VALUES ('USER_PERMISSION', 'EN', 'Edit user permissions', '');
INSERT INTO `internal_resources` VALUES ('USERPERM_HEAD', 'EN', 'Edit user permissions', '');
INSERT INTO `internal_resources` VALUES ('USER_GENERAL', 'EN', 'Edit general user data', '');
INSERT INTO `internal_resources` VALUES ('IS_FILTERED', 'EN', 'Note: Because you applied a filter, not all records are displayed.', '');
INSERT INTO `internal_resources` VALUES ('TOP_REFERER', 'EN', 'Top Referer', '');
INSERT INTO `internal_resources` VALUES ('TOP_SI', 'EN', 'Top Search Engines', '');
INSERT INTO `internal_resources` VALUES ('TOP_SKW', 'EN', 'Top Search Keywords', '');
INSERT INTO `internal_resources` VALUES ('TOP_EXITT', 'EN', 'Top Exit Targets', '');
INSERT INTO `internal_resources` VALUES ('HOURS_AS', 'EN', 'Hour Analysis', '');
INSERT INTO `internal_resources` VALUES ('WEEKDAY_AS', 'EN', 'Weekday Analysis', '');
INSERT INTO `internal_resources` VALUES ('I_AFTER', 'EN', 'Insert after', '');
INSERT INTO `internal_resources` VALUES ('AFTER', 'EN', 'After:', '');
INSERT INTO `internal_resources` VALUES ('REMAIN_POS', 'EN', 'Do not change position', '');
INSERT INTO `internal_resources` VALUES ('BEGIN', 'EN', 'Start', '');
INSERT INTO `internal_resources` VALUES ('CL_NAME', 'EN', 'Object Name', '');
INSERT INTO `internal_resources` VALUES ('INSNAME', 'EN', '&lt;Object Name&gt;', '');
INSERT INTO `internal_resources` VALUES ('CAL_NAME', 'EN', 'Calendar Name', '');
INSERT INTO `internal_resources` VALUES ('CALENDARS', 'EN', 'Calendars', '');
INSERT INTO `internal_resources` VALUES ('CALENDARS_DEFINE', 'EN', 'Define Calendars', '');
INSERT INTO `internal_resources` VALUES ('CALENDARS_TIPP', 'EN', 'You can create several calendars here. Each calendar will have its own events and dates.', '');
INSERT INTO `internal_resources` VALUES ('CALENDAR', 'EN', 'Calendar', '');
INSERT INTO `internal_resources` VALUES ('CALENDARS_EDIT', 'EN', 'Edit Calendar', '');
INSERT INTO `internal_resources` VALUES ('CALENDARS_CAT_DEFINE', 'EN', 'Define Categories', '');
INSERT INTO `internal_resources` VALUES ('CALENDAR_SELECT', 'EN', 'Select Calendar', '');
INSERT INTO `internal_resources` VALUES ('CAT_NAME', 'EN', 'Category', '');
INSERT INTO `internal_resources` VALUES ('CATEGORY', 'EN', 'Category', '');
INSERT INTO `internal_resources` VALUES ('COLOR', 'EN', 'Color', '');
INSERT INTO `internal_resources` VALUES ('CAL_EDIT', 'EN', 'Edit Appointment', '');
INSERT INTO `internal_resources` VALUES ('TOP_PAGES', 'EN', 'Top Pages', '');
INSERT INTO `internal_resources` VALUES ('TOP_ENTRYPAGES', 'EN', 'Top Entry Pages', '');
INSERT INTO `internal_resources` VALUES ('TOP_EXITPAGES', 'EN', 'Top Exit Pages', '');
INSERT INTO `internal_resources` VALUES ('SEL_EVENT', 'EN', 'Select Event or Appointment', '');
INSERT INTO `internal_resources` VALUES ('STARTDATE', 'EN', 'Startdate', '');
INSERT INTO `internal_resources` VALUES ('STARTTIME', 'EN', 'Starttime', '');
INSERT INTO `internal_resources` VALUES ('ENDATE', 'EN', 'Enddate', '');
INSERT INTO `internal_resources` VALUES ('ENDTIME', 'EN', 'Endtime', '');
INSERT INTO `internal_resources` VALUES ('CAL_BTO', 'EN', 'Back to Overview', '');
INSERT INTO `internal_resources` VALUES ('ROLE_PERMISSION', 'EN', 'Edit Role Permissions', '');
INSERT INTO `internal_resources` VALUES ('ROLE_GENERAL', 'EN', 'Edit Role General', '');
INSERT INTO `internal_resources` VALUES ('ADD_LINK', 'EN', 'Add Link', '');
INSERT INTO `internal_resources` VALUES ('ADDITIONAL_LINK', 'EN', 'Additional Link', '');
INSERT INTO `internal_resources` VALUES ('ADDITIONAL_IMAGE', 'EN', 'Additional Image', '');
INSERT INTO `internal_resources` VALUES ('NO_OBJ', 'EN', 'No content selected.', '');
INSERT INTO `internal_resources` VALUES ('CLEAR', 'EN', 'Clear', '');
INSERT INTO `internal_resources` VALUES ('FIND_OBJ', 'EN', 'Find Object', '');
INSERT INTO `internal_resources` VALUES ('PREV_AVAIL', 'EN', 'You sucessfully selected a content. A preview will be available after saving.', '');
INSERT INTO `internal_resources` VALUES ('NOT_SPECIFIED', 'EN', 'Any type', '');
INSERT INTO `internal_resources` VALUES ('CMPTYPE', 'EN', 'Layout-Class type:', '');
INSERT INTO `internal_resources` VALUES ('INSTANCES_CREATED', 'EN', 'New instances of the item have been created.', '');
INSERT INTO `internal_resources` VALUES ('CONFIRM_DELETE', 'EN', 'Do you really want to remove this item?', '');
INSERT INTO `internal_resources` VALUES ('NOT_SELECTED', 'EN', 'No item selected yet.', '');
INSERT INTO `internal_resources` VALUES ('NO_CONTENT', 'EN', 'No content entered yet.', '');
INSERT INTO `internal_resources` VALUES ('LEAVE_EMPTY', 'EN', 'Leave empty.', '');
INSERT INTO `internal_resources` VALUES ('GOTO_CL', 'EN', 'Goto Object', '');
INSERT INTO `internal_resources` VALUES ('CL_EXPIRE', 'EN', 'Unpublish Object', '');
INSERT INTO `internal_resources` VALUES ('CL_LAUNCH', 'EN', 'Publish Object', '');
INSERT INTO `internal_resources` VALUES ('OBJLAUNCH_SUCCESS', 'EN', 'The object was successfully launched.', '');
INSERT INTO `internal_resources` VALUES ('NO_CLUSTER', 'EN', 'No contents.', '');
INSERT INTO `internal_resources` VALUES ('BACK_TO_CV', 'EN', 'Back to object overview', '');
INSERT INTO `internal_resources` VALUES ('CREATED_AT', 'EN', 'Created at', '');
INSERT INTO `internal_resources` VALUES ('BY', 'EN', 'by', '');
INSERT INTO `internal_resources` VALUES ('LAST_MOD_AT', 'EN', 'Last modified:', '');
INSERT INTO `internal_resources` VALUES ('CLUSTER_INFORMATION', 'EN', 'Information about this record', '');
INSERT INTO `internal_resources` VALUES ('LAST_LAUNCHED_AT', 'EN', 'Last published:', '');
INSERT INTO `internal_resources` VALUES ('M_CHANNELS', 'EN', 'Channels', '');
INSERT INTO `internal_resources` VALUES ('ARTICLES', 'EN', 'Articles', '');
INSERT INTO `internal_resources` VALUES ('CH_ADMIN', 'EN', 'Channel Administration', '');
INSERT INTO `internal_resources` VALUES ('CH_CAT', 'EN', 'Define Categories', '');
INSERT INTO `internal_resources` VALUES ('CHANNELS', 'EN', 'Channels', '');
INSERT INTO `internal_resources` VALUES ('CHANNEL', 'EN', 'Channel', '');
INSERT INTO `internal_resources` VALUES ('CHANNEL_SELECT', 'EN', 'Select Channel', '');
INSERT INTO `internal_resources` VALUES ('AUTHOR', 'EN', 'Author', '');
INSERT INTO `internal_resources` VALUES ('EDITED', 'EN', 'Edited', '');
INSERT INTO `internal_resources` VALUES ('CREATED', 'EN', 'Created', '');
INSERT INTO `internal_resources` VALUES ('SEL_ARTICLE', 'EN', 'Select an Article', '');
INSERT INTO `internal_resources` VALUES ('IN_CHANNEL', 'EN', 'in channel', '');
INSERT INTO `internal_resources` VALUES ('EDIT_ARTICLE', 'EN', 'Edit Article', '');
INSERT INTO `internal_resources` VALUES ('BACK_TO_OVERVIEW', 'EN', 'Back to Overview', '');
INSERT INTO `internal_resources` VALUES ('CREATE_ARTICLE', 'EN', 'Create new Article in Channel', '');
INSERT INTO `internal_resources` VALUES ('AR_LAUNCH', 'EN', 'Publish Article', '');
INSERT INTO `internal_resources` VALUES ('CLT_SELECT', 'EN', 'Select Classes', '');
INSERT INTO `internal_resources` VALUES ('CLT', 'EN', 'Class', '');
INSERT INTO `internal_resources` VALUES ('NEW_ARTICLE', 'EN', 'New Article', '');
INSERT INTO `internal_resources` VALUES ('AR_EXPIRE', 'EN', 'Unpublish Article', '');
INSERT INTO `internal_resources` VALUES ('DWEXT_CONTENTFIELDINFO', 'EN', 'Generate Content-Field-Information', '');
INSERT INTO `internal_resources` VALUES ('DWEXT_CONTENTFIELDINFO_MES', 'EN', 'generates Content-Field-Information for Dreamweaver MX', '');
INSERT INTO `internal_resources` VALUES ('DEL_ARTICLE', 'EN', 'Do you really want to delete this article in all variations?', '');
INSERT INTO `internal_resources` VALUES ('READY_TO_USE', 'EN', 'Ready to use.', '');
INSERT INTO `internal_resources` VALUES ('SEL_CHANNEL_CAT', 'EN', 'Select a Channel and a Category', '');
INSERT INTO `internal_resources` VALUES ('ALL', 'EN', 'All', '');
INSERT INTO `internal_resources` VALUES ('ORDERART', 'EN', 'Order of Articles', '');
INSERT INTO `internal_resources` VALUES ('NUM_OF_ART', 'EN', 'Number of articles (999 = infinite)', '');
INSERT INTO `internal_resources` VALUES ('CH_CAT2', 'EN', 'Channel and Category', '');
INSERT INTO `internal_resources` VALUES ('DESTROY_TREE', 'EN', 'Delete Tree', '');
INSERT INTO `internal_resources` VALUES ('DESTROY_EXCLUSIVE_CONTENT', 'EN', 'Delete exclusive content', '');
INSERT INTO `internal_resources` VALUES ('AUTH_GROUP', 'EN', 'Authentication', '');
INSERT INTO `internal_resources` VALUES ('SYNC_CLUSTERS', 'EN', 'Synchronize Objects', '');
INSERT INTO `internal_resources` VALUES ('SYNC_CLUSTERS_DESCR', 'EN', 'After you modified a class, the objects are not automatically synched to the new structure. They are synched when you are working with them the next time. With this function you can sync all of them at once.', '');
INSERT INTO `internal_resources` VALUES ('M_EXPORT_WZ', 'EN', 'Export Wizzard', '');
INSERT INTO `internal_resources` VALUES ('M_IMPORT_WZ', 'EN', 'Import Wizzard', '');
INSERT INTO `internal_resources` VALUES ('M_HELP', 'EN', 'Help', '');
INSERT INTO `internal_resources` VALUES ('MH_GETSTART', 'EN', 'Getting Started', '');
INSERT INTO `internal_resources` VALUES ('MH_GLOSSARY', 'EN', 'Glossary', '');
INSERT INTO `internal_resources` VALUES ('DELETE_PAGE', 'EN', 'Delete', '');
INSERT INTO `internal_resources` VALUES ('TT_REFRESH', 'EN', 'Refresh Instances updates the changes made to a template to cached pages.', '');
INSERT INTO `internal_resources` VALUES ('TT_RSTCI', 'EN', 'Each page in N/X is linked to an object. By pressing Reset Object you can link a new object to the page.', '');
INSERT INTO `internal_resources` VALUES ('HELP_SP', 'EN', 'You can edit the site structure and pages here.', '');
INSERT INTO `internal_resources` VALUES ('HELP_OBJBROWSE', 'EN', 'Content library contains all content material of the site', '');
INSERT INTO `internal_resources` VALUES ('HELP_CLB', 'EN', 'Objects are a collection of placeholders, which are either to be filled in by a developer or an editor of a webpage. The structure-definition within N/X is done with classes.', '');
INSERT INTO `internal_resources` VALUES ('HELP_CHANNEL', 'EN', 'Topic categories defining the contents of articles created by N/X. i.e. News, Persons', '');
INSERT INTO `internal_resources` VALUES ('HELP_ROLLOUT', 'EN', 'Copy website is a feature of N/X that enables you to make copies of a section on your web page and re-use it with or without the old content.', '');
INSERT INTO `internal_resources` VALUES ('EXPORT_DATA', 'EN', 'Export Content and Templates Wizzard', '');
INSERT INTO `internal_resources` VALUES ('WZ_EXPORT_TITLE', 'EN', 'This wizard is used to exchange objects, classes and page-templates between your N/X installation and others. The wizard generates a XML File, which you can store on your local hard drive and exchange with other N/X-Users.', '');
INSERT INTO `internal_resources` VALUES ('WZT_EXPORT_TYPE', 'EN', 'Select type to export', '');
INSERT INTO `internal_resources` VALUES ('WZE_EXPORT_TYPE', 'EN', 'On the right you need to select the type of data you want to export. Content is stored in objects. When you export objects, the classes are automatically exported too. Classes are schemes for creating objects.', '');
INSERT INTO `internal_resources` VALUES ('CLUSTER', 'EN', 'Object', '');
INSERT INTO `internal_resources` VALUES ('CLUSTER_TEMPLATE', 'EN', 'Class', '');
INSERT INTO `internal_resources` VALUES ('PAGE_TEMPLATE', 'EN', 'Page Template', '');
INSERT INTO `internal_resources` VALUES ('WZT_SEL_EXP_RES', 'EN', 'Select Ressource for export', '');
INSERT INTO `internal_resources` VALUES ('WZT_DESCR', 'EN', 'Add description', '');
INSERT INTO `internal_resources` VALUES ('WZT_DESCR_EXPL', 'EN', 'Now you can add a short description to the exported data.<br/><br/> Anyone who will import the data will easier understand the content of the file.', '');
INSERT INTO `internal_resources` VALUES ('EXEC_EXPORT', 'EN', 'Exporting the ressource', '');
INSERT INTO `internal_resources` VALUES ('EXPL_EXEC_EXPORT', 'EN', 'The system is generating a XML-File for export now.<br/><br/>In a few seconds, a popup will appear. Press Save for storing the Ressource on your harddisk.', '');
INSERT INTO `internal_resources` VALUES ('EXP_REPORT', 'EN', 'Exporting following data', '');
INSERT INTO `internal_resources` VALUES ('NEXT', 'EN', 'Next', '');
INSERT INTO `internal_resources` VALUES ('STEP', 'EN', 'Step', '');
INSERT INTO `internal_resources` VALUES ('IMPORT_DATA', 'EN', 'Import N/X-XML Data', '');
INSERT INTO `internal_resources` VALUES ('WZ_IMPORT_TITLE', 'EN', 'This wizard is used for importing data to N/X, which has formerly been exported with another N/X installation. Note: You have to delete a resource before you can import it for a second time.', '');
INSERT INTO `internal_resources` VALUES ('WZT_IMPORT_FILE', 'EN', 'Select N/X-XML File', '');
INSERT INTO `internal_resources` VALUES ('WZE_IMPORT_FILE', 'EN', 'Please choose a N/X-XML file from your harddisk for upload into the system.<br/><br/>The system will perform a check and will display status information on the next page.', '');
INSERT INTO `internal_resources` VALUES ('WZT_IMPORT_VAL', 'EN', 'Summary of uploaded XML', '');
INSERT INTO `internal_resources` VALUES ('WZE_IMPORT_VAL', 'EN', 'The system has checked the correctness of the uploaded XML file. Read the report on the left for details.', '');
INSERT INTO `internal_resources` VALUES ('WZT_IMPORTING', 'EN', 'Importing data', '');
INSERT INTO `internal_resources` VALUES ('WZE_IMPORTING', 'EN', 'The system has tried to import the data. Check the status on the right.', '');
INSERT INTO `internal_resources` VALUES ('SEL_FILE', 'EN', 'Select a file', '');
INSERT INTO `internal_resources` VALUES ('HELP_PAGETEMP', 'EN', 'In spreadsheet and database applications, a template is a blank form that shows which fields exist, their locations, and their length. In N/X, templates are the basis of every output. A template is a form in which all the cells have been defined but no data has yet been entered.', '');
INSERT INTO `internal_resources` VALUES ('HELP_CLT', 'EN', 'Cluster template is a form that enables you to create structure for your site and define the type of contents. Afterwards, cluster template is merged with a page-template that includes the content of the web page.', '');
INSERT INTO `internal_resources` VALUES ('HELP_METATEMP', 'EN', 'A meta template is used for defining which metadata fields need to go on a new page. When you create a new metadata field in the template, each new page based on that template will contain that field.', '');
INSERT INTO `internal_resources` VALUES ('HELP_COMPGRP', 'EN', 'Layout-Class group is a group of objects.  This feature enables you to build your homepage out of blocks, e.g. News-Article, Poll, Image-Gallery all on one page and on demand.', '');
INSERT INTO `internal_resources` VALUES ('HELP_PURGE', 'EN', 'Deletes unnecessary information from the database.', '');
INSERT INTO `internal_resources` VALUES ('HELP_DW', 'EN', 'Creates a configuration-file for N/X Dreamweaver Plug-in. With the help of the Plug-in, templates can be developed with Dreamweaver.', '');
INSERT INTO `internal_resources` VALUES ('HELP_SYNCCL', 'EN', 'A feature used for synchronizing objects after having modified/changed a class.', '');
INSERT INTO `internal_resources` VALUES ('MT_SYNC_CL', 'EN', 'Synchronize Clusters', '');
INSERT INTO `internal_resources` VALUES ('HELP_PGN', 'EN', 'Plugins allow you to enhance N/X beyond its standard features. Typically, plugins are used to create new content types in addition to the two standard content types text and image.', '');
INSERT INTO `internal_resources` VALUES ('HELP_BACKUP', 'EN', 'The list below shows you the backups of N/X on your server. You can delete the backups here. To restore a backup ,you need to manually log in to your server and restore the files yourself.', '');
INSERT INTO `internal_resources` VALUES ('HELP_VARIATION', 'EN', 'Content may have different languages. You define the languages you can use in N/X here.', '');
INSERT INTO `internal_resources` VALUES ('HELP_ACCESS', 'EN', 'A feature used for creating and managing user profiles within N/X.', '');
INSERT INTO `internal_resources` VALUES ('SHOW_PAGEWISE', 'EN', 'show pagewise', '');
INSERT INTO `internal_resources` VALUES ('SHOW_ALL', 'EN', 'show all', '');
INSERT INTO `internal_resources` VALUES ('NODE_ACCESS', 'EN', 'Set access to the website', '');
INSERT INTO `internal_resources` VALUES ('SPM_SELECTTHUMB', 'EN', 'Select Thumbnail', 'Select a graphic which will be displayed if an editor creates a new page. You can upload your own icon-graphics to the folder cms/modules/sitepages/thumbnails.');
INSERT INTO `internal_resources` VALUES ('ED_PROPERTIES', 'EN', 'Edit Properties', '');
INSERT INTO `internal_resources` VALUES ('ED_CLT', 'EN', 'Edit Class', '');
INSERT INTO `internal_resources` VALUES ('EXPL_SEL_CLUSTER', 'EN', 'After selecting a class, a list with objects will appear, where you can select one.', '');
INSERT INTO `internal_resources` VALUES ('SEL_PTML', 'EN', 'Select Page-Template', '');
INSERT INTO `internal_resources` VALUES ('EXPL_SEL_SPM', 'EN', 'Please select a page-template.', '');
INSERT INTO `internal_resources` VALUES ('CHANNEL_IMPORTARTICLES', 'EN', 'Import articles', '');
INSERT INTO `internal_resources` VALUES ('WZ_ARTICLEIMPORT', 'EN', 'Article-Import Wizard', '');
INSERT INTO `internal_resources` VALUES ('WZ_ARTICLEIMPORT_TITLE', 'EN', 'This wizard is used to import article data to a channel from different sources. You can import from existing Multipages or other channels. You have to make sure that the corresponding templates are compatible.', '');
INSERT INTO `internal_resources` VALUES ('WZT_ARTICLEIMPORT_TARGET', 'EN', 'Select target channel', '');
INSERT INTO `internal_resources` VALUES ('WZE_ARTICLEIMPORT_TARGET', 'EN', 'On the right you need to select the target channel. All imported articles will be stored within this channel.', '');
INSERT INTO `internal_resources` VALUES ('SEL_CH', 'EN', 'Select a Channel', '');
INSERT INTO `internal_resources` VALUES ('EXPL_SEL_CH', 'EN', 'Please select a channel.', '');
INSERT INTO `internal_resources` VALUES ('WZT_ARTICLEIMPORT_SRCTYPE', 'EN', 'Select source type', '');
INSERT INTO `internal_resources` VALUES ('WZE_ARTICLEIMPORT_SRCTYPE', 'EN', 'Please select the type of source you want to import the articles from.', '');
INSERT INTO `internal_resources` VALUES ('MULTIPAGE', 'EN', 'Multipage', '');
INSERT INTO `internal_resources` VALUES ('COPY_CLUSTER', 'EN', 'Copy objects', '');
INSERT INTO `internal_resources` VALUES ('KEEP_CLUSTER', 'EN', 'Keep original object', '');
INSERT INTO `internal_resources` VALUES ('ARTICLE_IS_EXPIRED', 'EN', 'Article is unpublished', '');
INSERT INTO `internal_resources` VALUES ('ARTICLE_IS_LIVE', 'EN', 'Article is published', '');
INSERT INTO `internal_resources` VALUES ('DISABLE', 'EN', 'Disable', '');
INSERT INTO `internal_resources` VALUES ('TRANS_TEMPL', 'EN', 'Translate from', '');
INSERT INTO `internal_resources` VALUES ('TRANS_THIS', 'EN', 'Translate this:', '');
INSERT INTO `internal_resources` VALUES ('SEL_VAR', 'EN', 'Select Language', '');
INSERT INTO `internal_resources` VALUES ('ARTICLE_VARIATION_MISSING', 'EN', 'The language-version of this article does not exist yet.', '');
INSERT INTO `internal_resources` VALUES ('SHOW_ADVANCED_SEARCH', 'EN', 'Display advanced search options', '');
INSERT INTO `internal_resources` VALUES ('SEARCH_LIVE_ACRTICLES', 'EN', 'Published articles', '');
INSERT INTO `internal_resources` VALUES ('SHOW', 'EN', 'show', '');
INSERT INTO `internal_resources` VALUES ('HIDE', 'EN', 'Hide', '');
INSERT INTO `internal_resources` VALUES ('SEARCH_EXPIRED_ARTICLES', 'EN', 'Unpublished articles', '');
INSERT INTO `internal_resources` VALUES ('SEASRCH_MISSING_VARIATIONS', 'EN', 'Missing translations', '');
INSERT INTO `internal_resources` VALUES ('MAINT_MODE', 'EN', 'Offline Mode', '');
INSERT INTO `internal_resources` VALUES ('MAINT_BB', 'EN', 'Switch backend into maintenance.', '');
INSERT INTO `internal_resources` VALUES ('MAINT_WWW', 'EN', 'Switch published website into maintenance.', '');
INSERT INTO `internal_resources` VALUES ('UPL_TEXT', 'EN', 'Upload text file', '');
INSERT INTO `internal_resources` VALUES ('WZT_KEEPCLUSTER', 'EN', 'Keep existing objects?', '');
INSERT INTO `internal_resources` VALUES ('WZT_KEEPCLUSTER_EXPL', 'EN', 'You can specify whether you want to keep the existing objects or to create a copy of each object.<br><br>Keep in mind: if you keep the original objects you will share them with the original source.', '');
INSERT INTO `internal_resources` VALUES ('SEL_CLUSTER', 'EN', 'Select an Object', '');
INSERT INTO `internal_resources` VALUES ('NO_CLUSTERTEMPLATES', 'EN', 'There are no classes.', '');
INSERT INTO `internal_resources` VALUES ('RESET_LOGS', 'EN', 'Reset Logs', '');
INSERT INTO `internal_resources` VALUES ('LOGFILE', 'EN', 'View System Logs', '');
INSERT INTO `internal_resources` VALUES ('LOGS_INFO', 'EN', 'The list below shows you events that were logged by N/X WCMS.', '');
INSERT INTO `internal_resources` VALUES ('MESSAGE', 'EN', 'Message', '');
INSERT INTO `internal_resources` VALUES ('CHANGE', 'EN', 'Change', '');
INSERT INTO `internal_resources` VALUES ('AGENT_WELCOME', 'EN', 'Welcome to N/X.', '');
INSERT INTO `internal_resources` VALUES ('AGENT_GOHOME', 'EN', 'Go home!', '');
INSERT INTO `internal_resources` VALUES ('AGENT_GOAWAY', 'EN', 'Hide and stay away!', '');
INSERT INTO `internal_resources` VALUES ('AGENT_NXHOMEPAGE', 'EN', 'Visit N/X Homepage!', '');
INSERT INTO `internal_resources` VALUES ('AGENT_CALLED', 'EN', 'you asked for me?', '');
INSERT INTO `internal_resources` VALUES ('AGENT_LOGOUT', 'EN', 'I hope you enjoyed working with N/X. Have a nice day!', '');
INSERT INTO `internal_resources` VALUES ('AGENT_EXPLAINHOME', 'EN', 'You can find me by clicking the N/X-Logo in the upper-right corner of your browser.', '');
INSERT INTO `internal_resources` VALUES ('USER_AGENT', 'EN', 'Use Agent', '');
INSERT INTO `internal_resources` VALUES ('CLTPOSITION', 'EN', 'Position', '');
INSERT INTO `internal_resources` VALUES ('FONT', 'EN', 'Font Name', '');
INSERT INTO `internal_resources` VALUES ('FONTSIZE', 'EN', 'Font Size', '');
INSERT INTO `internal_resources` VALUES ('NUMBER', 'EN', 'Enter a number!', '');
INSERT INTO `internal_resources` VALUES ('TEXT_STYLE', 'EN', 'Text Style', '');
INSERT INTO `internal_resources` VALUES ('TEXT_ALIGN', 'EN', 'Text Align', '');
INSERT INTO `internal_resources` VALUES ('TEXT_COLOR', 'EN', 'Text Color', '');
INSERT INTO `internal_resources` VALUES ('BG_COLOR', 'EN', 'Background Color', '');
INSERT INTO `internal_resources` VALUES ('WIDTH', 'EN', 'Width', '');
INSERT INTO `internal_resources` VALUES ('HEIGHT', 'EN', 'Height', '');
INSERT INTO `internal_resources` VALUES ('INDIV_CONFIG', 'EN', 'Individual configuration for this item', '');
INSERT INTO `internal_resources` VALUES ('GR_TEXT', 'EN', 'Graphical Text', '');
INSERT INTO `internal_resources` VALUES ('SPM_LAUCH_SUCCESS', 'EN', 'The pages based on this master were relaunched successfully.<br>', '');
INSERT INTO `internal_resources` VALUES ('CONFIRM_UNSAVED_CHANGES', 'EN', 'Note: Unsaved changes will be lost if you proceed. If you have already edited something, you may cancel now and save your work. Proceed ?', '');
INSERT INTO `internal_resources` VALUES ('CL_SELECT', 'EN', 'Please select an object to link it with the class.', '');
INSERT INTO `internal_resources` VALUES ('M_HOME', 'EN', 'Home', '');
INSERT INTO `internal_resources` VALUES ('CLT_EXCLUSIVE', 'EN', 'Developer Content', '');
INSERT INTO `internal_resources` VALUES ('BACK_SP', 'EN', 'Back to Website', '');
INSERT INTO `internal_resources` VALUES ('CONFIRM_UNSAVED_CHANGES_LINKEDCL', 'EN', 'Note: When changing the linked object, any changes you apply on the currently linked object will be lost. If you want to save these canges, save your work first and change the linked object. Proceed ?', '');
INSERT INTO `internal_resources` VALUES ('CLLINK', 'EN', 'This slot is linked to', '');
INSERT INTO `internal_resources` VALUES ('BACK_SP', 'DE', 'ZurÃƒÂ¼ck', '');
INSERT INTO `internal_resources` VALUES ('BG_COLOR', 'DE', 'Hintergrundfarbe', '');
INSERT INTO `internal_resources` VALUES ('CLLINK', 'DE', 'Dieser Platzhalter ist verlinkt mit', '');
INSERT INTO `internal_resources` VALUES ('CLTPOSITION', 'DE', 'Position', '');
INSERT INTO `internal_resources` VALUES ('CLT_EXCLUSIVE', 'DE', 'Inhalt nur fÃƒÂ¼r Entwickler sichtbar', '');
INSERT INTO `internal_resources` VALUES ('CL_SELECT', 'DE', 'Bitte wÃƒÂ¤hlen Sie ein Objekt, um es mit der Klasse zu verlinken.', '');
INSERT INTO `internal_resources` VALUES ('CONFIRM_UNSAVED_CHANGES_LINKEDCL', 'DE', 'Achtung: Wenn Sie das verlinkte Objekt ÃƒÂ¤ndern, gehen alle ungespeicherten Ãƒâ€žnderungen am aktuellen Objekt verloren. MÃƒÂ¶chten sie fortfahren?', '');
INSERT INTO `internal_resources` VALUES ('FONT', 'DE', 'Schriftname', '');
INSERT INTO `internal_resources` VALUES ('FONTSIZE', 'DE', 'SchriftgrÃƒÂ¶ÃƒÅ¸e', '');
INSERT INTO `internal_resources` VALUES ('GR_TEXT', 'DE', 'Graphischer Text', '');
INSERT INTO `internal_resources` VALUES ('HEIGHT', 'DE', 'HÃƒÂ¶he', '');
INSERT INTO `internal_resources` VALUES ('MT_LW_SITE', 'EN', 'Launch website', '');
INSERT INTO `internal_resources` VALUES ('INDIV_CONFIG', 'DE', 'Individuelle Konfiguration', '');
INSERT INTO `internal_resources` VALUES ('LOGFILE', 'DE', 'Systemlogs zeigen', '');
INSERT INTO `internal_resources` VALUES ('LOGS_INFO', 'DE', 'Die Liste enthÃƒÂ¤lt alle geloggten Ereignisse.', '');
INSERT INTO `internal_resources` VALUES ('MESSAGE', 'DE', 'Nachricht', '');
INSERT INTO `internal_resources` VALUES ('M_HOME', 'DE', 'Home', '');
INSERT INTO `internal_resources` VALUES ('NUMBER', 'DE', 'Bitte geben Sie eine Zahl ein!', '');
INSERT INTO `internal_resources` VALUES ('RESET_LOGS', 'DE', 'Reset', '');
INSERT INTO `internal_resources` VALUES ('SPM_LAUCH_SUCCESS', 'DE', 'Die Seiten wurden neu verÃƒÂ¶ffentlicht.', '');
INSERT INTO `internal_resources` VALUES ('TEXT_ALIGN', 'DE', 'Textausrichtung', '');
INSERT INTO `internal_resources` VALUES ('TEXT_COLOR', 'DE', 'Textfarbe', '');
INSERT INTO `internal_resources` VALUES ('TEXT_STYLE', 'DE', 'Textformatierung', '');
INSERT INTO `internal_resources` VALUES ('WIDTH', 'DE', 'Breite', '');
INSERT INTO `internal_resources` VALUES ('MT_LWS_MESSAGES', 'EN', 'Do you really want to launch the whole website?', '');
INSERT INTO `internal_resources` VALUES ('CH_ARTICLE_DATE', 'EN', 'Article Date', '');
INSERT INTO `internal_resources` VALUES ('EXPIRE', 'EN', 'Unpublish', '');
INSERT INTO `internal_resources` VALUES ('CH_ARTICLE_DATE', 'DE', 'Artikeldatum', '');
INSERT INTO `internal_resources` VALUES ('EXPIRE', 'DE', 'ZurÃƒÂ¼ckziehen', '');
INSERT INTO `internal_resources` VALUES ('BY_ORDER', 'EN', 'By Position', '');
INSERT INTO `internal_resources` VALUES ('MT_LWS_MESSAGES', 'DE', 'MÃƒÂ¶chten Sie wirklich die gesamte Seite verÃƒÂ¶ffentlichen?', '');
INSERT INTO `internal_resources` VALUES ('MT_LW_SITE', 'DE', 'Ganze Website verÃƒÂ¶ffentlichen', '');
INSERT INTO `internal_resources` VALUES ('GALNAME', 'EN', 'Gallery Name', '');
INSERT INTO `internal_resources` VALUES ('GALDESC', 'EN', 'Gallery Description', '');
INSERT INTO `internal_resources` VALUES ('GAFOLDER', 'EN', 'Image-Folder', '');
INSERT INTO `internal_resources` VALUES ('GALROWS', 'EN', 'Rows', '');
INSERT INTO `internal_resources` VALUES ('GALCOLS', 'EN', 'Columns', '');
INSERT INTO `internal_resources` VALUES ('MEDIA_SUPPORTED', 'EN', 'The Media plugin supports the following file-types:<br>Macromedia Flash Films (.swf), Windows Media (.avi), Real Player (.rm), Apple Quicktime (.mov), MP3 over Windows Media (.mp3), PDF (.pdf)', '');
INSERT INTO `internal_resources` VALUES ('O_DELMES2', 'EN', 'Do you really want to delete this content? It may still be used in some objects.', '');
INSERT INTO `internal_resources` VALUES ('MISSING_PGN', 'EN', 'Missing Plugin:', '');
INSERT INTO `internal_resources` VALUES ('IMP_ERR', 'EN', 'You cannot import, because of the following errors:', '');
INSERT INTO `internal_resources` VALUES ('FILE_ALREADY_UPLOADED', 'EN', 'You have already uploaded a file. You can go on by pressing Next.', '');
INSERT INTO `internal_resources` VALUES ('GO_IMPORT', 'EN', 'Press Next to import this data now. If the data has already been imported, nothing will be changed.', '');
INSERT INTO `internal_resources` VALUES ('NUMB_IMPORTED', 'EN', 'Number of imported recordsets:', '');
INSERT INTO `internal_resources` VALUES ('PROC_DATA', 'EN', 'Processing Data...', '');
INSERT INTO `internal_resources` VALUES ('BAK_TIPP', 'EN', 'You can backup your database and www and wwwdev folder here. Make sure you have setup backup in settings.inc.php!', '');
INSERT INTO `internal_resources` VALUES ('COPYCLUSTERT', 'EN', 'Create Copy', '');
INSERT INTO `internal_resources` VALUES ('CREATECOPY', 'EN', 'Copy', '');
INSERT INTO `internal_resources` VALUES ('COPYCLT', 'EN', 'Copy class', '');
INSERT INTO `internal_resources` VALUES ('SOURCE', 'EN', 'Source', '');
INSERT INTO `internal_resources` VALUES ('NEWNAME', 'EN', 'New Name', '');
INSERT INTO `internal_resources` VALUES ('CHNLAUNCHED', 'EN', 'The channel was launched successfully.', '');
INSERT INTO `internal_resources` VALUES ('MT_LWC', 'EN', 'Launch all articles', '');
INSERT INTO `internal_resources` VALUES ('NO_XML', 'EN', 'The file you uploaded is not XML or your browser does not send the file correct!', '');
INSERT INTO `internal_resources` VALUES ('CHANGE_TEMPLATE', 'EN', 'Active Template', '');
INSERT INTO `internal_resources` VALUES ('CCONLAUNCH', 'EN', 'Clear Cache when Publishing', '');
INSERT INTO `internal_resources` VALUES ('CCONLAUNCH_LBL', 'EN', 'Dev-Page-IDs (commaseparated)', '');
INSERT INTO `internal_resources` VALUES ('ROLLOUT_SEL', 'EN', 'Source and Destination for Copy', '');
INSERT INTO `internal_resources` VALUES ('NEW_ROLLOUT', 'EN', 'Start another copy', '');
INSERT INTO `internal_resources` VALUES ('CR_BO_LANG', 'EN', 'Create a new backend language', '');
INSERT INTO `internal_resources` VALUES ('LANGUAGE', 'EN', 'Language', '');
INSERT INTO `internal_resources` VALUES ('ACL_ACCESS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('ACL_GROUPEDIT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('ACL_GROUPS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('ACL_GROUPSROLES', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('ACL_INFO', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('ACL_INHERIT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('ACL_INHERIT_NOTE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('ACL_OWNER', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('ACL_PARENT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('ACL_ROLE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('ACL_TITLE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('ACTIVE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('ACTIVE_VARIATION', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('ADDITIONAL_IMAGE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('ADDITIONAL_LINK', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('ADD_LINK', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('AFTER', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('AGENT_CALLED', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('AGENT_EXPLAINHOME', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('AGENT_GOAWAY', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('AGENT_GOHOME', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('AGENT_LOGOUT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('AGENT_NXHOMEPAGE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('AGENT_WELCOME', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('ALC_OWNER', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('ALL', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('ARTICLES', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('ARTICLE_IS_EXPIRED', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('ARTICLE_IS_LIVE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('ARTICLE_VARIATION_MISSING', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('AR_EXPIRE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('AR_LAUNCH', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('AUTHOR', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('AUTH_GROUP', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('AVAIL_ITEMS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('AVAIL_VARIATIONS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('AVERAGE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('AVG_CLICKSTREAM', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('AVG_VISIT_LENGTH', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('AVG_VIS_LENGTH', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('BACK', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('BACKUP', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('BACK_INFO', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('BACK_SP', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('BACK_TO_CV', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('BACK_TO_OVERVIEW', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('BAK_FILE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('BAK_TIPP', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('BEGIN', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('BG_COLOR', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('BY', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('BY_ORDER', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CACHED', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CALENDAR', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CALENDARS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CALENDARS_CAT_DEFINE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CALENDARS_DEFINE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CALENDARS_EDIT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CALENDARS_TIPP', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CALENDAR_SELECT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CAL_BTO', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CAL_EDIT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CAL_NAME', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CANCEL', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CATEGORY', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CAT_NAME', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CCONLAUNCH', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CCONLAUNCH_LBL', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CHANGE_TEMPLATE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CHANNEL', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CHANNELS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CHANNEL_IMPORTARTICLES', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CHANNEL_SELECT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CHNLAUNCHED', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CHOOSEFILE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CH_ADMIN', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CH_ARTICLE_DATE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CH_CAT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CH_CAT2', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CLASS_WRONG', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CLEAR', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CLEAR_MEDIA', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CLI', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CLI_DELETE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CLI_DELETED', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CLI_DELETEMES', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CLI_EDIT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CLI_NOTDELETED', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CLK_PATHS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CLLINK', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CLT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CLTI_DELETE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CLTPOSITION', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CLT_BROWSE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CLT_DELETE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CLT_DELMES', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CLT_EXCLUSIVE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CLT_MAXCARD', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CLT_MINCARD', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CLT_NAME', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CLT_NEW', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CLT_PROPERTIES', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CLT_SCHEME', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CLT_SELECT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CLUSTER', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CLUSTER_INFORMATION', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CLUSTER_TEMPLATE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CL_BROWSE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CL_CREATEINSMES', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CL_CREATEINSTANC', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CL_DEL', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CL_DELMES', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CL_EDIT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CL_EXPIRE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CL_LAUNCH', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CL_NAME', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CL_NEW', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CL_NOTITLE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CL_PROPERTIES', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CL_SELECT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CMPTYPE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('COLOR', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('COMB_ALL', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('COMB_NONE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('COMMENT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('COMMIT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CONFIG', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CONFIGURED', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CONFIRM_DELETE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CONFIRM_UNSAVED_CHANGES', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CONFIRM_UNSAVED_CHANGES_LINKEDCL', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CONTAINERNAME', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CONTENT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CONTENTITEM', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CONTENTTYPE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CONTENT_DESC', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('COPYCLT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('COPYCLUSTERT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('COPY_CLUSTER', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('COUNT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CPG_MEMBERS_SELECT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CP_GROUP', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CREATE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CREATECOPY', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CREATED', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CREATED_AT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CREATENEW', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CREATE_ARTICLE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CREATE_INSTANCES', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CR_BO_LANG', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CR_CONTENT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('DATE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('DELETE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('DELETESUCCESS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('DELETE_PAGE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('DEL_ARTICLE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('DEL_FOLDER', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('DESC', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('DESCRIPTION', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('DESTROY_EXCLUSIVE_CONTENT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('DESTROY_TREE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('DISABLE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('DISPLAY', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('DOSOMETHING', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('DOWN', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('DWEXT_CONTENTFIE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('DWEXT_CONTENTFIELDINFO', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('DWEXT_CONTENTFIELDINFO_MES', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('EDIT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('EDITED', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('EDIT_ACCESS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('EDIT_ALL', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('EDIT_ARTICLE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('EDIT_CONTENT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('EDIT_FOLDER', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('EDIT_SPM', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('EDIT_TEMPLATE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('ED_CLT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('ED_CONTENT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('ED_CPGROUP', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('ED_CPGROUPGENERAL', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('ED_DISPATCHER', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('ED_META', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('ED_PROPERTIES', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('EMPTY', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('ENDATE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('ENDTIME', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('ENVIRONMENT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('ERROR', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('ERROR_SEL_GROUP', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('ERROR_SEL_ROLE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('EXEC_EXPORT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('EXPIRE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('EXPLORE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('EXPL_EXEC_EXPORT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('EXPL_SEL_CH', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('EXPL_SEL_CLUSTER', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('EXPL_SEL_SPM', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('EXPORT_DATA', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('EXP_REPORT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('FILE_ALREADY_UPLOADED', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('FILTER_COLUMN', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('FILTER_RULE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('FIND_OBJ', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('FOLDER', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('FOLDER_DELMES', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('FONT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('FONTSIZE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('FULL_NAME', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('GAFOLDER', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('GALCOLS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('GALDESC', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('GALNAME', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('GALROWS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('GO', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('GOTO_CL', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('GO_IMPORT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('GROUP_DESCRIPTIO', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('GROUP_DESCRIPTION', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('GROUP_FILTERMENU', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('GROUP_HEAD', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('GROUP_LINK', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('GROUP_NAME', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('GR_TEXT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('HEIGHT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('HELP', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('HELP_ACCESS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PGN_INFO', 'EN', 'Plugin information', '');
INSERT INTO `internal_resources` VALUES ('HELP_BACKUP', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('HELP_CHANNEL', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('HELP_CLB', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('HELP_CLT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('HELP_COMPGRP', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('HELP_DW', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('HELP_METATEMP', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('HELP_OBJBROWSE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('HELP_PAGETEMP', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('HELP_PGN', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('HELP_PURGE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('HELP_ROLLOUT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('HELP_SP', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('HELP_SYNCCL', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('HELP_VARIATION', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('HIDE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('HOUR', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('HOURS_AS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('IMPORT_DATA', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('IMP_ERR', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('INDIV_CONFIG', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('IND_TIME', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('INSNAME', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('INSTANCES_CREATED', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('INSTANCE_CREATED', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('IN_CHANNEL', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('IS_COMPOUND', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('IS_FILTERED', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('I_AFTER', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('KEEP_CLUSTER', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('KEYWORDS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('LANGUAGE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('LASTMONTH', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('LASTWEEK', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('LASTYEAR', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('LAST_LAUNCHED_AT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('LAST_MOD_AT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('LAUNCH', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('LEAVE_EMPTY', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('LIBRARY', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('LINKED', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('LIVE_AUTHORING', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('LOCATION', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('LOCK_MENU', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('LOGFILE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('LOGGED_AS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('LOGIN_FAILED', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('LOGS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('LOGS_INFO', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('LONGEST_PATHS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('MANDATORY', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('MAXIMUM', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('MAXIMUMAT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('MEDIAN', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('MEDIA_SUPPORTED', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('MENU', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('MESSAGE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('METATEMPLATE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('METATEMPLATES', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('MH_GETSTART', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('MH_GLOSSARY', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('MINIMUM', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('MINIMUMAT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('MISSING_PGN', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('MT_ADDITIONAL', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('MT_BASE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('MT_DELETE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('MT_DW_CONTENT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('MT_DW_CONTENTFIE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('MT_DW_CONTENTFIELDINFO', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('MT_GENERATE_DTA', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('MT_GENERATE_DTA_', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('MT_GENERATE_DTA_MES', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('MT_GENERATE_DTA_SUCCEEDED', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('MT_LWC', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('MT_LWS_MESSAGES', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('MT_LW_SITE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('MT_MODULE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('MT_PROPERTIES', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('MT_SCHEME', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('MT_SPIDER', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('MT_SYNC_CL', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('MT_TITLE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('MULTIPAGE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('M_ACCESS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('M_ADMIN', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('M_BACKUP', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('M_BROWSER', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('M_CHANNELS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('M_CLB', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('M_CLT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('M_CLTB', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('M_CLUSTERS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('M_COMBOBJ', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('M_ES', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('M_EXPORT_WZ', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('M_HELP', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('M_HOME', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('M_IMPORT_WZ', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('M_INSTALLPLUGIN', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('M_LIB', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('M_LOGOUT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('M_MAINTENANCE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('M_META', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('M_MYPROFILE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('M_MYPRT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('M_PGN', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('M_PRTMAN', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('M_PTEMP', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('M_PURGE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('M_REPORT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('M_ROLLOUT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('M_SPM', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('M_TEMP', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('M_TRANSLATION', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('M_UMAN', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('M_VAR', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('M_WWW', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('NAME', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('NEW', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('NEWNAME', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('NEW_ARTICLE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('NEW_CONTENT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('NEW_FOLDER', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('NEW_ROLLOUT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('NEXT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('NO', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('NODE_ACCESS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('NOSPTITLE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('NOTCONFIGURED', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('NOTNUMBER', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('NOT_SELECTED', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('NOT_SPECIFIED', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('NO_CLUSTER', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('NO_CLUSTERTEMPLATES', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('NO_CLUSTER_SELECTED', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('NO_CONTENT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('NO_CONTENTS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('NO_OBJ', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('NO_VARIATIONS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('NO_XML', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('NUMBER', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('NUMBER_OF_INSTANCES', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('NUMB_IMPORTED', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('NUM_OF_ART', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('OBJLAUNCH_SUCCESS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('OK', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('LAUNCH_TREE', 'EN', 'Publish Tree', '');
INSERT INTO `internal_resources` VALUES ('ORDER', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('ORDERART', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('ORDERCOMP', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('OTHERS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('OVERVIEW', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('O_ALT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('O_BROWSE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('O_COPYRIGHT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('O_DEL', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('O_DELMES', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('O_DELMES2', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('O_EDIT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('O_NAME', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('O_NEW', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('O_PREVIEW', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('O_PROPERTIES', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('O_TEXT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PAGE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PAGES', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PAGE_TEMPLATE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PASSWORD', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PATH', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PATHS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PERCENT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PGNTXT_SMA', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PG_ALREADYINSTAL', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PG_CHOOSE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PG_ERROR', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PG_FILEWRONG', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PG_INSTALL', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PG_INSTALLDESC', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PG_INSTALLED', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PG_NEWERINSTALLE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PG_TITLE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PG_UNINSTALL', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PG_UNINSTALLDELE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PG_UNINSTALLMES', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PG_UPGRADED', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PI', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PI_OVERVIEW', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('POSITION', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('POS_IN_MENU', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PO_BROWSER', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PO_CRSUCCEEDED', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PO_EDIT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PO_MYPORTAL', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PO_OWNER', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PREDEF_TIME', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PREVIEW', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PREV_AVAIL', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PRINT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PROCERROR', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PROC_DATA', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PROMPTDELETE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PROPERTIES', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PTEMPL', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PURGE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_CLT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_CLUSTER', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_CONTENT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_EXPIRED', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_FOLDER', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_MES', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_META', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_PAGES', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_VAR', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PWDNOTMATCH', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PWDTOOSHORT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('RANK', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('RATERES', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('RB_CACHE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('READY_TO_USE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('REFERER', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('REMAIN_POS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('RESET', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('RESET_FORM', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('RESET_LOGS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('RET_VIS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('RL_PERM', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('ROLE_DESCRIPTION', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('ROLE_FILTERMENU', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('ROLE_GENERAL', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('ROLE_HEAD', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('ROLE_LINK', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('ROLE_NAME', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('ROLE_PERMISSION', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('ROLLOUT_SEL', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('R_DELETEFOLDER', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('R_DELFOLDER', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('R_DELFOLDERMES', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('R_EDITFOLDER', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('R_FOLDERNAME', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('R_FOLDERNOTEMPTY', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('R_HOME', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('R_MOVEOBJECTS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('R_NEWFOLDER', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('R_PARENT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SAVE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SAVEERROR', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SAVESUCCESS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SAVE_BACK', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SEARCH', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SEARCHIN', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SEARCHRESULTS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SEARCH_CLEAR', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SEARCH_EXPIRED_ARTICLES', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SEARCH_LIVE_ACRTICLES', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SEASRCH_MISSING_VARIATIONS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SELECT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SELECTEDINSTANCE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SELECTEDOBJECT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SELECTOBJECT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SELECTONE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SELECT_CI', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SELECT_CL', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SELECT_VARIATION', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SELMULTIPLE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SEL_ARTICLE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SEL_CH', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SEL_CHANNEL_CAT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SEL_CLUSTER', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SEL_EVENT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SEL_FILE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SEL_MEM', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SEL_PTML', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SEL_VAR', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SET', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SHORTEST_PATHS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SHOW', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SHOW_ADVANCED_SEARCH', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SHOW_ALL', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SHOW_PAGEWISE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SMA_EXT_EDIT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SOURCE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SPM', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SPM_CLUSTER', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SPM_EDIT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SPM_LAUCH_SUCCESS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SPM_META', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SPM_PATH', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SPM_RLAUNCH', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SPM_SELECTTHUMB', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SPM_THUMBNAIL', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SPM_TYPE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SPM_VARIATIONS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SP_BROWSE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SP_CLNEW', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SP_CONFDESC', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SP_CONFIGURE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SP_DELETE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SP_DELMES', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SP_EDIT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SP_EXPIRE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SP_EXPIREDATE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SP_IPROPERTIES', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SP_LAUNCH', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SP_LAUNCHDATE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SP_LAUNCHDATES', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SP_LINK', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SP_MENUDIRECT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SP_MENUDIRECTTIT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SP_MENUDIRECTTITLE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SP_MENUHELP', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SP_MENUNAME', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SP_MENUPROPS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SP_NEWINSTANCE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SP_NEWPAGE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SP_PDELETE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SP_PDELMES', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SP_PREVIEW', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SP_PROPERTIES', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SP_RLTREE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SR_SELECTCI', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SR_SELECTCLI', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('STARTDATE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('STARTTIME', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('START_BAK', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('STATS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('STATS_HEADER', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('STATUS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('STEP', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('STNAME', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SYNC_CLUSTERS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SYNC_CLUSTERS_DESCR', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('TEMPLATE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('TESTS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('TEXT_ALIGN', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('TEXT_COLOR', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('TEXT_STYLE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('TF', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('THISMONTH', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('THISWEEK', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('THISYEAR', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('TIME_BETW_VISITS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('TIPP_TEMPLATE_1', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('TITLE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('TMPL_NAME', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('TODAY', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('TOP', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('TOP_BROWSER', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('TOP_ENTRYPAGES', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('TOP_EXITPAGES', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('TOP_EXITT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('TOP_HOSTS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('TOP_OS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('TOP_PAGES', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('TOP_PATHS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('TOP_REFERER', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('TOP_SI', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('TOP_SKW', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('TOTAL', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('TRANSLATION', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('TRANS_TEMPL', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('TRANS_THIS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('TT_REFRESH', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('TT_RSTCI', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('TYPE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('UNIQUE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('UP', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('UPL_TEXT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('UP_INTRO', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('USAGE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('USERPERM_HEAD', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('USER_ACTIVE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('USER_AGENT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('USER_BL', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('USER_EMAIL', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('USER_FILTERMENU', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('USER_GENERAL', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('USER_HEAD', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('USER_JS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('USER_LINK', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('USER_NAME', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('USER_PERMGRID', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('USER_PERMISSION', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('USER_PERMISSIONS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('USER_PROFILE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('USER_SETPERM', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('USER_TO_GROUP', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('VARIATIONS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('VAR_SUCCEEDED', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('VISITORS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('VISITS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('VISITS_OVERVIEW', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('VIS_FIRST', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('VIS_ONL', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('VIS_PER_VIS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('VIS_RET', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('V_EDIT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('V_NAME', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('V_SHORT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('WEBSITE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('WEEKDAY', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('WEEKDAY_AS', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('WHEN', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('WIDTH', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('WRONGDATE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('WZE_ARTICLEIMPORT_SRCTYPE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('WZE_ARTICLEIMPORT_TARGET', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('WZE_EXPORT_TYPE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('WZE_IMPORTING', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('WZE_IMPORT_FILE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('WZE_IMPORT_VAL', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('WZT_ARTICLEIMPORT_SRCTYPE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('WZT_ARTICLEIMPORT_TARGET', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('WZT_DESCR', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('WZT_DESCR_EXPL', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('WZT_EXPORT_TYPE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('WZT_IMPORTING', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('WZT_IMPORT_FILE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('WZT_IMPORT_VAL', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('WZT_KEEPCLUSTER', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('WZT_KEEPCLUSTER_EXPL', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('WZT_SEL_EXP_RES', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('WZ_ARTICLEIMPORT', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('WZ_ARTICLEIMPORT_TITLE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('WZ_EXPORT_TITLE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('WZ_IMPORT_TITLE', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('YES', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('YESTERDAY', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('LANGID', 'EN', 'Language ID', '');
INSERT INTO `internal_resources` VALUES ('M_ARTICLES', 'EN', 'Articles', '');
INSERT INTO `internal_resources` VALUES ('PAGE_ID', 'EN', 'Page ID', '');
INSERT INTO `internal_resources` VALUES ('NOT_FOUND', 'EN', 'There was nothing found.', '');
INSERT INTO `internal_resources` VALUES ('PNF', 'EN', 'The page with the ID you entered was not found.', '');
INSERT INTO `internal_resources` VALUES ('MODTYPE', 'EN', 'Plugin Type', '');
INSERT INTO `internal_resources` VALUES ('VERSION', 'EN', 'Version', '');
INSERT INTO `internal_resources` VALUES ('SOURCEFILE', 'EN', 'Source file', '');
INSERT INTO `internal_resources` VALUES ('UNINSTALL', 'EN', 'Uninstall', '');
INSERT INTO `internal_resources` VALUES ('UNINSTCONF', 'EN', 'Uninstalling a plugin can cause damage to the website! Do you want to proceed?', '');
INSERT INTO `internal_resources` VALUES ('MT_RB_CACHE_MES', 'EN', 'Rebuild Cache of all published pages', '');
INSERT INTO `internal_resources` VALUES ('CL_GROUP', 'EN', 'Object Group', '');
INSERT INTO `internal_resources` VALUES ('ACL_ACCESS', 'FR', 'Editer les permissions dans les groupes', NULL);
INSERT INTO `internal_resources` VALUES ('ACL_GROUPEDIT', 'FR', 'SÃƒÂ©lectionner le groupe pour ÃƒÂ©diter les rÃƒÂ´les', NULL);
INSERT INTO `internal_resources` VALUES ('ACL_GROUPS', 'FR', 'SÃƒÂ©lectionner le groupe ÃƒÂ  ajouter', NULL);
INSERT INTO `internal_resources` VALUES ('ACL_GROUPSROLES', 'FR', 'AccÃƒÂ¨s ÃƒÂ©tranger', NULL);
INSERT INTO `internal_resources` VALUES ('ACL_INFO', 'FR', 'AccÃƒÂ¨s hÃƒÂ©ritÃƒÂ© du parent', NULL);
INSERT INTO `internal_resources` VALUES ('ACL_INHERIT', 'FR', 'HÃƒÂ©riter des permissions du parent', NULL);
INSERT INTO `internal_resources` VALUES ('ACL_INHERIT_NOTE', 'FR', 'Note : quand la case est cochÃƒÂ©e, il n''y a pas d''autre configuration disponible !', NULL);
INSERT INTO `internal_resources` VALUES ('ACL_OWNER', 'FR', 'PropriÃƒÂ©taire', NULL);
INSERT INTO `internal_resources` VALUES ('ACL_PARENT', 'FR', 'Permissions hÃƒÂ©ritÃƒÂ©es de', NULL);
INSERT INTO `internal_resources` VALUES ('ACL_ROLE', 'FR', 'SÃƒÂ©lectionner les rÃƒÂ´les pour le groupe', NULL);
INSERT INTO `internal_resources` VALUES ('ACL_TITLE', 'FR', 'Configuration des permissions pour', NULL);
INSERT INTO `internal_resources` VALUES ('ACTIVE', 'FR', 'Actif', NULL);
INSERT INTO `internal_resources` VALUES ('ACTIVE_VARIATION', 'FR', 'Variation active', NULL);
INSERT INTO `internal_resources` VALUES ('ADD_LINK', 'FR', 'Ajouter un lien', NULL);
INSERT INTO `internal_resources` VALUES ('ADDITIONAL_IMAGE', 'FR', 'Image additionnelle', NULL);
INSERT INTO `internal_resources` VALUES ('ADDITIONAL_LINK', 'FR', 'Lien additionnel', NULL);
INSERT INTO `internal_resources` VALUES ('AFTER', 'FR', 'AprÃƒÂ¨s :', NULL);
INSERT INTO `internal_resources` VALUES ('AGENT_CALLED', 'FR', 'Vous m''avez demandÃƒÂ© ?', NULL);
INSERT INTO `internal_resources` VALUES ('AGENT_EXPLAINHOME', 'FR', 'Vous pouvez me trouver en cliquant sur le logo N/X, en haut ÃƒÂ  droite de la fenÃƒÂªtre', NULL);
INSERT INTO `internal_resources` VALUES ('AGENT_GOAWAY', 'FR', 'Cachez-vous et restez ÃƒÂ©loignÃƒÂ© !', NULL);
INSERT INTO `internal_resources` VALUES ('AGENT_GOHOME', 'FR', 'Rentrez chez vous !', NULL);
INSERT INTO `internal_resources` VALUES ('AGENT_LOGOUT', 'FR', 'J''espÃƒÂ¨re que vous avez bien travaillÃƒÂ© avec N/X. Bonne journÃƒÂ©e !', NULL);
INSERT INTO `internal_resources` VALUES ('AGENT_NXHOMEPAGE', 'FR', 'Visitez le site de N/X', NULL);
INSERT INTO `internal_resources` VALUES ('AGENT_WELCOME', 'FR', 'Bienvenue sur N/X', NULL);
INSERT INTO `internal_resources` VALUES ('ALC_OWNER', 'FR', 'DÃƒÂ©finir le propriÃƒÂ©taire', NULL);
INSERT INTO `internal_resources` VALUES ('ALL', 'FR', 'Tous', NULL);
INSERT INTO `internal_resources` VALUES ('AR_EXPIRE', 'FR', 'Expirer l''article', NULL);
INSERT INTO `internal_resources` VALUES ('AR_LAUNCH', 'FR', 'Lancer l''article', NULL);
INSERT INTO `internal_resources` VALUES ('ARTICLE_IS_EXPIRED', 'FR', 'L''article a expirÃƒÂ©', NULL);
INSERT INTO `internal_resources` VALUES ('ARTICLE_IS_LIVE', 'FR', 'L''article est en ligne', NULL);
INSERT INTO `internal_resources` VALUES ('ARTICLE_VARIATION_MISSING', 'FR', 'La variation de cet article n''existe pas encore.', NULL);
INSERT INTO `internal_resources` VALUES ('ARTICLES', 'FR', 'Articles', NULL);
INSERT INTO `internal_resources` VALUES ('AUTH_GROUP', 'FR', 'Authentification', NULL);
INSERT INTO `internal_resources` VALUES ('AUTHOR', 'FR', 'Auteur', NULL);
INSERT INTO `internal_resources` VALUES ('AVAIL_ITEMS', 'FR', 'EntrÃƒÂ©es disponibles', NULL);
INSERT INTO `internal_resources` VALUES ('AVAIL_VARIATIONS', 'FR', 'Variations disponibles', NULL);
INSERT INTO `internal_resources` VALUES ('AVERAGE', 'FR', 'Moyenne', NULL);
INSERT INTO `internal_resources` VALUES ('AVG_CLICKSTREAM', 'FR', 'Taux de clics moyen', NULL);
INSERT INTO `internal_resources` VALUES ('AVG_VIS_LENGTH', 'FR', 'Temps moyen de visite (secondes)', NULL);
INSERT INTO `internal_resources` VALUES ('AVG_VISIT_LENGTH', 'FR', 'Temps moyen de visite', NULL);
INSERT INTO `internal_resources` VALUES ('BACK', 'FR', 'Retour', NULL);
INSERT INTO `internal_resources` VALUES ('BACK_INFO', 'FR', 'La liste ci-dessous montre les sauvegardes de N/X sur votre serveur. Vous pouvez supprimer les sauvegardes ici. Pour restaurer une sauvegarde, vous devez vous connecter manuellement au serveur et restaurer les fichiers.', NULL);
INSERT INTO `internal_resources` VALUES ('BACK_TO_CV', 'FR', 'Retour ÃƒÂ  la vue d''ensemble du cluster', NULL);
INSERT INTO `internal_resources` VALUES ('BACK_TO_OVERVIEW', 'FR', 'Retour ÃƒÂ  la vue d''ensemble', NULL);
INSERT INTO `internal_resources` VALUES ('BACKUP', 'FR', 'Sauvegarde systÃƒÂ¨me', NULL);
INSERT INTO `internal_resources` VALUES ('BAK_FILE', 'FR', 'Fichier de sauvegarde', NULL);
INSERT INTO `internal_resources` VALUES ('BAK_TIPP', 'FR', 'Vous pouvez sauvegarder votre base de donnÃƒÂ©es et les dossiers de site www et wwwdev ici. VÃƒÂ©rifiez que vous avez bien configurÃƒÂ© la sauvegarde dans settings.inc.php !', NULL);
INSERT INTO `internal_resources` VALUES ('BEGIN', 'FR', 'DÃƒÂ©marrer', NULL);
INSERT INTO `internal_resources` VALUES ('BY', 'FR', 'par', NULL);
INSERT INTO `internal_resources` VALUES ('BY_ORDER', 'FR', 'Par ordre', NULL);
INSERT INTO `internal_resources` VALUES ('CACHED', 'FR', 'Page de cache', NULL);
INSERT INTO `internal_resources` VALUES ('CAL_BTO', 'FR', 'Retour ÃƒÂ  la vue d''ensemble', NULL);
INSERT INTO `internal_resources` VALUES ('CAL_EDIT', 'FR', 'Editer le rendez-vous', NULL);
INSERT INTO `internal_resources` VALUES ('CAL_NAME', 'FR', 'Nom du calendrier', NULL);
INSERT INTO `internal_resources` VALUES ('CALENDAR', 'FR', 'Calendrier', NULL);
INSERT INTO `internal_resources` VALUES ('CALENDAR_SELECT', 'FR', 'SÃƒÂ©lectionner un calendrier', NULL);
INSERT INTO `internal_resources` VALUES ('CALENDARS', 'FR', 'Calendriers', NULL);
INSERT INTO `internal_resources` VALUES ('CALENDARS_CAT_DEFINE', 'FR', 'DÃƒÂ©finir les catÃƒÂ©gories', NULL);
INSERT INTO `internal_resources` VALUES ('CALENDARS_DEFINE', 'FR', 'DÃƒÂ©finir les calendriers', NULL);
INSERT INTO `internal_resources` VALUES ('CALENDARS_EDIT', 'FR', 'Editer le calendrier', NULL);
INSERT INTO `internal_resources` VALUES ('CALENDARS_TIPP', 'FR', 'Vous pouvez crÃƒÂ©er plusieurs calendriers ici. Chaque calendrier aura ses propres ÃƒÂ©vÃƒÂ©nements et dates.', NULL);
INSERT INTO `internal_resources` VALUES ('CANCEL', 'FR', 'Annuler', NULL);
INSERT INTO `internal_resources` VALUES ('CAT_NAME', 'FR', 'CatÃƒÂ©gorie', NULL);
INSERT INTO `internal_resources` VALUES ('CATEGORY', 'FR', 'CatÃƒÂ©gorie', NULL);
INSERT INTO `internal_resources` VALUES ('CH_ADMIN', 'FR', 'Administration du canal', NULL);
INSERT INTO `internal_resources` VALUES ('CH_ARTICLE_DATE', 'FR', 'Date de l''article', NULL);
INSERT INTO `internal_resources` VALUES ('CH_CAT', 'FR', 'DÃƒÂ©finir les catÃƒÂ©gories', NULL);
INSERT INTO `internal_resources` VALUES ('CH_CAT2', 'FR', 'Canal et catÃƒÂ©gorie', NULL);
INSERT INTO `internal_resources` VALUES ('CHANGE_TEMPLATE', 'FR', 'Changer de modÃƒÂ¨le', NULL);
INSERT INTO `internal_resources` VALUES ('CHANNEL', 'FR', 'Canal', NULL);
INSERT INTO `internal_resources` VALUES ('CHANNEL_GRABMP', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CHANNEL_IMPORTARTICLES', 'FR', 'Importer des articles', NULL);
INSERT INTO `internal_resources` VALUES ('CHANNEL_SELECT', 'FR', 'SÃƒÂ©lectionner un canal', NULL);
INSERT INTO `internal_resources` VALUES ('CHANNELS', 'FR', 'Canaux', NULL);
INSERT INTO `internal_resources` VALUES ('CHOOSEFILE', 'FR', 'Choisir un fichier', NULL);
INSERT INTO `internal_resources` VALUES ('CL_BROWSE', 'FR', 'Voir les clusters', NULL);
INSERT INTO `internal_resources` VALUES ('CL_CREATEINSMES', 'FR', 'Il reste des emplacements pour crÃƒÂ©er d''autres instances de ce champ de contenu. Si vous voulez crÃƒÂ©er une autre instance, entrez un titre dans le champ texte ci-dessous et appuyez sur CrÃƒÂ©er.', NULL);
INSERT INTO `internal_resources` VALUES ('CL_CREATEINSTANC', 'FR', 'CrÃƒÂ©er une nouvelle instance', NULL);
INSERT INTO `internal_resources` VALUES ('CL_DEL', 'FR', 'Supprimer l''instance', NULL);
INSERT INTO `internal_resources` VALUES ('CL_DELMES', 'FR', 'Voulez-vous vraiment supprimer cette instance de cluster ? Toutes les donnÃƒÂ©es seront perdues !', NULL);
INSERT INTO `internal_resources` VALUES ('CL_EDIT', 'FR', 'Modifier l''instance du cluster', NULL);
INSERT INTO `internal_resources` VALUES ('CL_EXPIRE', 'FR', 'Expirer le cluster', NULL);
INSERT INTO `internal_resources` VALUES ('CL_LAUNCH', 'FR', 'Lancer le cluster', NULL);
INSERT INTO `internal_resources` VALUES ('CL_NAME', 'FR', 'Nom du cluster', NULL);
INSERT INTO `internal_resources` VALUES ('CL_NEW', 'FR', 'Nouvelle instance', NULL);
INSERT INTO `internal_resources` VALUES ('CL_NOTITLE', 'FR', 'Aucun titre dÃƒÂ©fini', NULL);
INSERT INTO `internal_resources` VALUES ('CL_PROPERTIES', 'FR', 'PropriÃƒÂ©tÃƒÂ©s du cluster', NULL);
INSERT INTO `internal_resources` VALUES ('CL_SELECT', 'FR', 'SÃƒÂ©lectionnez un cluster pour le lier ÃƒÂ  un modÃƒÂ¨le de cluster', NULL);
INSERT INTO `internal_resources` VALUES ('CLASS_WRONG', 'FR', 'Le fichier spÃƒÂ©cifiÃƒÂ© n''a pas de signature de classe valide !', NULL);
INSERT INTO `internal_resources` VALUES ('CLEAR', 'FR', 'Effacer', NULL);
INSERT INTO `internal_resources` VALUES ('CLEAR_MEDIA', 'FR', 'Supprimer le fichier depuis la base de donnÃƒÂ©es', NULL);
INSERT INTO `internal_resources` VALUES ('CLI', 'FR', 'Instance de cluster', NULL);
INSERT INTO `internal_resources` VALUES ('CLI_DELETE', 'FR', 'Supprimer le membre de cluster', NULL);
INSERT INTO `internal_resources` VALUES ('CLI_DELETED', 'FR', 'L''instance a ÃƒÂ©tÃƒÂ© supprimÃƒÂ©e.', NULL);
INSERT INTO `internal_resources` VALUES ('CLI_DELETEMES', 'FR', 'Voulez-vous vraiment supprimer cette instance ? Elle sera perdue ÃƒÂ  jamais !', NULL);
INSERT INTO `internal_resources` VALUES ('CLI_EDIT', 'FR', 'Modifier le membre de cluster', NULL);
INSERT INTO `internal_resources` VALUES ('CLI_NOTDELETED', 'FR', 'Cette instance ne peut pas ÃƒÂªtre supprimÃƒÂ©e !', NULL);
INSERT INTO `internal_resources` VALUES ('CLK_PATHS', 'FR', 'Chemins des clics', NULL);
INSERT INTO `internal_resources` VALUES ('CLT', 'FR', 'ModÃƒÂ¨le de cluster', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_BROWSE', 'FR', 'Voir les modÃƒÂ¨les de clusters', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_DELETE', 'FR', 'Supprimer le modÃƒÂ¨le de cluster', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_DELMES', 'FR', 'Vous ÃƒÂªtes sur le point de supprimer un modÃƒÂ¨le de cluster. Cela entraÃƒÂ®nera la perte de toutes les donnÃƒÂ©es crÃƒÂ©ÃƒÂ©es avec ce modÃƒÂ¨le. Voulez-vous vraiment continuer ?', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_EXCLUSIVE', 'FR', 'Contenu dÃƒÂ©veloppeur', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_MAXCARD', 'FR', '', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_MINCARD', 'FR', 'Instances', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_NAME', 'FR', 'Nom du modÃƒÂ¨le de cluster', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_NEW', 'FR', 'Nouveau modÃƒÂ¨le de cluster', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_PROPERTIES', 'FR', 'PropriÃƒÂ©tÃƒÂ©s du modÃƒÂ¨le de cluster', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_SCHEME', 'FR', 'Modifier le schÃƒÂ©ma du modÃƒÂ¨le de cluster', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_SELECT', 'FR', 'SÃƒÂ©lectionner des modÃƒÂ¨les de clusters', NULL);
INSERT INTO `internal_resources` VALUES ('CLTI_DELETE', 'FR', 'Voulez-vous vraiment supprimer cette entrÃƒÂ©e ? Toutes les instances seront aussi perdues !', NULL);
INSERT INTO `internal_resources` VALUES ('CLTPOSITION', 'FR', 'Position', NULL);
INSERT INTO `internal_resources` VALUES ('CLUSTER', 'FR', 'Cluster', NULL);
INSERT INTO `internal_resources` VALUES ('CLUSTER_INFORMATION', 'FR', 'Informations de cet enregistrement', NULL);
INSERT INTO `internal_resources` VALUES ('CLUSTER_TEMPLATE', 'FR', 'ModÃƒÂ¨le de cluster', NULL);
INSERT INTO `internal_resources` VALUES ('CMPTYPE', 'FR', 'Type de composition', NULL);
INSERT INTO `internal_resources` VALUES ('COLOR', 'FR', 'Couleur', NULL);
INSERT INTO `internal_resources` VALUES ('COMB_ALL', 'FR', 'Tout sÃƒÂ©lectionner', NULL);
INSERT INTO `internal_resources` VALUES ('COMB_NONE', 'FR', 'Tout effacer', NULL);
INSERT INTO `internal_resources` VALUES ('COMMENT', 'FR', 'Commentaire', NULL);
INSERT INTO `internal_resources` VALUES ('COMMIT', 'FR', 'Proposer', NULL);
INSERT INTO `internal_resources` VALUES ('CONFIG', 'FR', 'Configurer', NULL);
INSERT INTO `internal_resources` VALUES ('CONFIGURED', 'FR', 'PrÃƒÂªt ÃƒÂ  l''utilisation', NULL);
INSERT INTO `internal_resources` VALUES ('CONFIRM_DELETE', 'FR', 'Voulez-vous vraiment supprimer cette entrÃƒÂ©e ?', NULL);
INSERT INTO `internal_resources` VALUES ('CONFIRM_UNSAVED_CHANGES', 'FR', 'Note : les modifications non enregistrÃƒÂ©es seront perdues si vous continuez. Si vous avez dÃƒÂ©jÃƒÂ  modifiÃƒÂ© quelque chose, vous pouvez annuler et enregistrer votre travail. On continue ? ', NULL);
INSERT INTO `internal_resources` VALUES ('CONTAINERNAME', 'FR', 'ModÃƒÂ¨le', NULL);
INSERT INTO `internal_resources` VALUES ('CONTENT', 'FR', 'Contenu', NULL);
INSERT INTO `internal_resources` VALUES ('CONTENT_DESC', 'FR', 'Description du contenu', NULL);
INSERT INTO `internal_resources` VALUES ('CONTENTITEM', 'FR', 'EntrÃƒÂ©e de contenu', NULL);
INSERT INTO `internal_resources` VALUES ('CONTENTTYPE', 'FR', 'Type de contenu', NULL);
INSERT INTO `internal_resources` VALUES ('COPY_CLUSTER', 'FR', 'Copier des clusters', NULL);
INSERT INTO `internal_resources` VALUES ('COUNT', 'FR', 'Compteur', NULL);
INSERT INTO `internal_resources` VALUES ('CP_GROUP', 'FR', 'Groupe composÃƒÂ©', NULL);
INSERT INTO `internal_resources` VALUES ('CPG_MEMBERS_SELECT', 'FR', 'SÃƒÂ©lectionner des membres de ce groupe de composition', NULL);
INSERT INTO `internal_resources` VALUES ('CR_CONTENT', 'FR', 'CrÃƒÂ©er du contenu pour cette page ?', NULL);
INSERT INTO `internal_resources` VALUES ('CREATE', 'FR', 'CrÃƒÂ©er un article', NULL);
INSERT INTO `internal_resources` VALUES ('CREATE_ARTICLE', 'FR', 'CrÃƒÂ©er un nouvel article dans le canal', NULL);
INSERT INTO `internal_resources` VALUES ('CREATE_INSTANCES', 'FR', 'CrÃƒÂ©er des instances', NULL);
INSERT INTO `internal_resources` VALUES ('CREATED', 'FR', 'CrÃƒÂ©ÃƒÂ©', NULL);
INSERT INTO `internal_resources` VALUES ('CREATED_AT', 'FR', 'CrÃƒÂ©ÃƒÂ© le', NULL);
INSERT INTO `internal_resources` VALUES ('CREATENEW', 'FR', 'Un nouveau membre de ce modÃƒÂ¨le a ÃƒÂ©tÃƒÂ© crÃƒÂ©ÃƒÂ©. Voir les donnÃƒÂ©es ci-dessous', NULL);
INSERT INTO `internal_resources` VALUES ('DATE', 'FR', 'Date', NULL);
INSERT INTO `internal_resources` VALUES ('DATEFORMAT', 'FR', 'Ce format de date n''est pas correct !', NULL);
INSERT INTO `internal_resources` VALUES ('DEL_ARTICLE', 'FR', 'Voulez-vous vraiment supprimer cet article dans toutes ses variations ?', NULL);
INSERT INTO `internal_resources` VALUES ('DEL_FOLDER', 'FR', 'Supprimer le dossier', NULL);
INSERT INTO `internal_resources` VALUES ('DELETE', 'FR', 'Supprimer', NULL);
INSERT INTO `internal_resources` VALUES ('DELETE_PAGE', 'FR', 'Supprimer la page', NULL);
INSERT INTO `internal_resources` VALUES ('DELETESUCCESS', 'FR', 'Les donnÃƒÂ©es ci-dessous ont ÃƒÂ©tÃƒÂ© supprimÃƒÂ©es de la base de donnÃƒÂ©es. Elles sont maintenant perdues !', NULL);
INSERT INTO `internal_resources` VALUES ('DESC', 'FR', 'Description', NULL);
INSERT INTO `internal_resources` VALUES ('DESCRIPTION', 'FR', 'Description', NULL);
INSERT INTO `internal_resources` VALUES ('DESTROY_EXCLUSIVE_CONTENT', 'FR', 'DÃƒÂ©truire le contenu exclusif', NULL);
INSERT INTO `internal_resources` VALUES ('DESTROY_TREE', 'FR', 'DÃƒÂ©truire l''arborescence', NULL);
INSERT INTO `internal_resources` VALUES ('DISABLE', 'FR', 'DÃƒÂ©sactiver', NULL);
INSERT INTO `internal_resources` VALUES ('DISPLAY', 'FR', 'Afficher', NULL);
INSERT INTO `internal_resources` VALUES ('DOSOMETHING', 'FR', 'SÃƒÂ©lectionnez l''action que vous souhaitez. Vous pouvez insÃƒÂ©rer des entrÃƒÂ©es, les modifier, les supprimer et changer leur ordre.', NULL);
INSERT INTO `internal_resources` VALUES ('DOWN', 'FR', 'Bas', NULL);
INSERT INTO `internal_resources` VALUES ('DWEXT_CONTENTFIE', 'FR', 'GÃƒÂ©nÃƒÂ©rer les informations du champ de contenu', NULL);
INSERT INTO `internal_resources` VALUES ('DWEXT_CONTENTFIELDINFO', 'FR', 'GÃƒÂ©nÃƒÂ©rer les informations du champ de contenu', NULL);
INSERT INTO `internal_resources` VALUES ('DWEXT_CONTENTFIELDINFO_MES', 'FR', 'GÃƒÂ©nÃƒÂ©rer les informations du champ de contenu pour Dreamweaver MX', NULL);
INSERT INTO `internal_resources` VALUES ('ED_CLT', 'FR', 'Modifier le modÃƒÂ¨le de cluster', NULL);
INSERT INTO `internal_resources` VALUES ('ED_CONTENT', 'FR', 'Modifier le contenu', NULL);
INSERT INTO `internal_resources` VALUES ('ED_CPGROUP', 'FR', 'Modifier le groupe de composition', NULL);
INSERT INTO `internal_resources` VALUES ('ED_CPGROUPGENERAL', 'FR', 'Modifier le groupe gÃƒÂ©nÃƒÂ©ral', NULL);
INSERT INTO `internal_resources` VALUES ('ED_DISPATCHER', 'FR', 'Utilisez ce bouton pour basculer entre la modification des mÃƒÂ©ta-donnÃƒÂ©es et la modification du contenu.', NULL);
INSERT INTO `internal_resources` VALUES ('ED_META', 'FR', 'Modifier les mÃƒÂ©ta-donnÃƒÂ©es', NULL);
INSERT INTO `internal_resources` VALUES ('ED_PROPERTIES', 'FR', 'Modifier les propriÃƒÂ©tÃƒÂ©s', NULL);
INSERT INTO `internal_resources` VALUES ('EDIT', 'FR', 'Modifier', NULL);
INSERT INTO `internal_resources` VALUES ('EDIT_ACCESS', 'FR', 'DÃƒÂ©finir les accÃƒÂ¨s', NULL);
INSERT INTO `internal_resources` VALUES ('EDIT_ALL', 'FR', 'Modifier tout', NULL);
INSERT INTO `internal_resources` VALUES ('EDIT_ARTICLE', 'FR', 'Modifier l''article', NULL);
INSERT INTO `internal_resources` VALUES ('EDIT_CONTENT', 'FR', 'Modifier le contenu', NULL);
INSERT INTO `internal_resources` VALUES ('EDIT_FOLDER', 'FR', 'Modifier le dossier', NULL);
INSERT INTO `internal_resources` VALUES ('EDIT_SPM', 'FR', 'Modifier les propriÃƒÂ©tÃƒÂ©s du modÃƒÂ¨le', NULL);
INSERT INTO `internal_resources` VALUES ('EDIT_TEMPLATE', 'FR', 'Modifier le modÃƒÂ¨le', NULL);
INSERT INTO `internal_resources` VALUES ('EDITED', 'FR', 'ModifiÃƒÂ©', NULL);
INSERT INTO `internal_resources` VALUES ('EMPTY', 'FR', '<vide>', NULL);
INSERT INTO `internal_resources` VALUES ('ENDATE', 'FR', 'Date de fin', NULL);
INSERT INTO `internal_resources` VALUES ('ENDTIME', 'FR', 'Heure de fin', NULL);
INSERT INTO `internal_resources` VALUES ('ENVIRONMENT', 'FR', 'Environnement', NULL);
INSERT INTO `internal_resources` VALUES ('ERROR', 'FR', 'Une erreur est apparue pendant l''opÃƒÂ©ration sÃƒÂ©lectionnÃƒÂ©e !', NULL);
INSERT INTO `internal_resources` VALUES ('ERROR_SEL_GROUP', 'FR', 'Vous devez choisir un groupe !', NULL);
INSERT INTO `internal_resources` VALUES ('ERROR_SEL_ROLE', 'FR', 'Vous devez choisir au moins un rÃƒÂ´le !', NULL);
INSERT INTO `internal_resources` VALUES ('EXEC_EXPORT', 'FR', 'Exportation de la ressource en cours', NULL);
INSERT INTO `internal_resources` VALUES ('EXP_REPORT', 'FR', 'Exportation des donnÃƒÂ©es suivantes en cours', NULL);
INSERT INTO `internal_resources` VALUES ('EXPIRE', 'FR', 'Expirer', NULL);
INSERT INTO `internal_resources` VALUES ('EXPL_EXEC_EXPORT', 'FR', 'Ce systÃƒÂ¨me gÃƒÂ©nÃƒÂ¨re actuellement un fichier XML d''exportation.<br/><br/>Dans quelques secondes, une fenÃƒÂªtre apparaÃƒÂ®tra. Cliquez sur Enregistrer pour placer la ressource sur votre disque.', NULL);
INSERT INTO `internal_resources` VALUES ('EXPL_SEL_CH', 'FR', 'Choisissez un canal.', NULL);
INSERT INTO `internal_resources` VALUES ('EXPL_SEL_CLUSTER', 'FR', 'AprÃƒÂ¨s avoir choisi un modÃƒÂ¨le de cluster, vous pourrez choisir un cluster dans la liste qui apparaÃƒÂ®tra.', NULL);
INSERT INTO `internal_resources` VALUES ('EXPL_SEL_SPM', 'FR', 'Choisissez un modÃƒÂ¨le de page.', NULL);
INSERT INTO `internal_resources` VALUES ('EXPLORE', 'FR', 'Explorer', NULL);
INSERT INTO `internal_resources` VALUES ('EXPORT_DATA', 'FR', 'Assistant d''exportation du contenu et des modÃƒÂ¨les', NULL);
INSERT INTO `internal_resources` VALUES ('FILTER_COLUMN', 'FR', 'Ã¢â‚¬Â¦dans', NULL);
INSERT INTO `internal_resources` VALUES ('FILTER_RULE', 'FR', 'ChercherÃ¢â‚¬Â¦', NULL);
INSERT INTO `internal_resources` VALUES ('FIND_OBJ', 'FR', 'Trouver l''objet', NULL);
INSERT INTO `internal_resources` VALUES ('FOLDER', 'FR', 'Dossier', NULL);
INSERT INTO `internal_resources` VALUES ('FOLDER_DELMES', 'FR', 'Voulez-vous vraiment supprimer ce dossier ?', NULL);
INSERT INTO `internal_resources` VALUES ('FULL_NAME', 'FR', 'Nom complet', NULL);
INSERT INTO `internal_resources` VALUES ('GO', 'FR', 'Allez !', NULL);
INSERT INTO `internal_resources` VALUES ('GOTO_CL', 'FR', 'Aller au cluster', NULL);
INSERT INTO `internal_resources` VALUES ('GROUP_DESCRIPTIO', 'FR', 'Description', NULL);
INSERT INTO `internal_resources` VALUES ('GROUP_DESCRIPTION', 'FR', 'Description', NULL);
INSERT INTO `internal_resources` VALUES ('GROUP_FILTERMENU', 'FR', 'Administration des groupes', NULL);
INSERT INTO `internal_resources` VALUES ('GROUP_HEAD', 'FR', 'Profil du groupe', NULL);
INSERT INTO `internal_resources` VALUES ('GROUP_LINK', 'FR', 'Profils des groupes', NULL);
INSERT INTO `internal_resources` VALUES ('GROUP_NAME', 'FR', 'Nom du groupe', NULL);
INSERT INTO `internal_resources` VALUES ('HELP', 'FR', 'Aide', NULL);
INSERT INTO `internal_resources` VALUES ('HELP_ACCESS', 'FR', 'Un dispositif existe pour crÃƒÂ©er et gÃƒÂ©rer des profils d''utilisateur dans N/X.', NULL);
INSERT INTO `internal_resources` VALUES ('HELP_ARTICLES', 'EN', 'The form displays articles.<br><br>The color codes are:<li>red: article not published<li>grey: article not translated<li>green: article published', '');
INSERT INTO `internal_resources` VALUES ('HELP_BACKUP', 'FR', 'La liste ci-dessous montre les sauvegardes de N/X sur votre serveur. Vous pouvez supprimer les sauvegardes ici. Pour restaurer une sauvegarde, vous devez vous connecter manuellement au serveur et restaurer les fichiers.', NULL);
INSERT INTO `internal_resources` VALUES ('HELP_CHANNEL', 'FR', 'CatÃƒÂ©gories de thÃƒÂ¨mes dÃƒÂ©finissant le contenu des articles crÃƒÂ©ÃƒÂ©s par N/X (par exemple, News, PersonnesÃ¢â‚¬Â¦).', NULL);
INSERT INTO `internal_resources` VALUES ('HELP_CLB', 'FR', 'Un cluster est une collection de champs de contenu dynamiques ou statiques, complÃƒÂ©tÃƒÂ©s par un dÃƒÂ©veloppeur ou un rÃƒÂ©dacteur de pages Web. La dÃƒÂ©finition de la structure dans N/X est faite avec des clusters de donnÃƒÂ©es.', NULL);
INSERT INTO `internal_resources` VALUES ('HELP_CLT', 'FR', 'Le modÃƒÂ¨le de cluster est un formulaire qui vous permet de crÃƒÂ©er la structure des donnÃƒÂ©es pour votre site et de dÃƒÂ©finir le type de contenu. Ensuite, le modÃƒÂ¨le de cluster est fusionnÃƒÂ© avec un modÃƒÂ¨le de page qui gÃƒÂ¨re le contenu de la page Web.', NULL);
INSERT INTO `internal_resources` VALUES ('HELP_COMPGRP', 'FR', 'Le groupe de composition est un groupe de clusters. Les modÃƒÂ¨les de clusters peuvent avoir leur propre disposition. Ceci vous permet de construire votre page Web hors de blocs (par exemple, articles de news, sondage, galerie de photos... le tout sur une page et sur demande).', NULL);
INSERT INTO `internal_resources` VALUES ('HELP_DW', 'FR', 'CrÃƒÂ©e un dossier de configuration pour l''extension N/X de Dreamweaver. A l''aide de cette extension, des modÃƒÂ¨les peuvent ÃƒÂªtre dÃƒÂ©veloppÃƒÂ©s avec Dreamweaver.', NULL);
INSERT INTO `internal_resources` VALUES ('HELP_METATEMP', 'FR', 'Un modÃƒÂ¨le de mÃƒÂ©ta-donnÃƒÂ©e est utilisÃƒÂ© pour dÃƒÂ©finir quels champs de mÃƒÂ©ta-donnÃƒÂ©es seront placÃƒÂ©s dans une nouvelle page. Quand vous crÃƒÂ©ez un nouveau champ de mÃƒÂ©ta-donnÃƒÂ©e dans le modÃƒÂ¨le, chaque nouvelle page basÃƒÂ©e sur ce modÃƒÂ¨le contiendra ce champ.', NULL);
INSERT INTO `internal_resources` VALUES ('HELP_OBJBROWSE', 'FR', 'La bibliothÃƒÂ¨que de contenu contient tous les ÃƒÂ©lÃƒÂ©ments de contenu du site', NULL);
INSERT INTO `internal_resources` VALUES ('HELP_PAGETEMP', 'FR', 'Dans les tableurs et les applications de base de donnÃƒÂ©es, un modÃƒÂ¨le est un formulaire vide qui montre quels champs existent, leur emplacement et leur longueur. Dans N/X, les modÃƒÂ¨les sont ÃƒÂ  la base de son fonctionnement. Un modÃƒÂ¨le est un formulaire dans lequel toutes les cellules ont ÃƒÂ©tÃƒÂ© dÃƒÂ©finies mais aucune donnÃƒÂ©e n''a encore ÃƒÂ©tÃƒÂ© saisie.', NULL);
INSERT INTO `internal_resources` VALUES ('HELP_PGN', 'FR', 'Les extensions vous permettent d''ÃƒÂ©tendre les fonctions de N/X. Typiquement, des extensions sont employÃƒÂ©es pour crÃƒÂ©er de nouveaux types d''objets, en plus des deux types d''objets standards Text et Image.', NULL);
INSERT INTO `internal_resources` VALUES ('HELP_PURGE', 'FR', 'Supprime les informations inutiles de la base de donnÃƒÂ©es.', NULL);
INSERT INTO `internal_resources` VALUES ('HELP_ROLLOUT', 'FR', 'Rollout est un dispositif de N/X qui permet de crÃƒÂ©er des copies d''une section de votre page Web et de les rÃƒÂ©utiliser avec ou sans l''ancien contenu.', NULL);
INSERT INTO `internal_resources` VALUES ('HELP_SP', 'FR', 'Le plan du site est utilisÃƒÂ© pour modifier la structure et les pages du site.', NULL);
INSERT INTO `internal_resources` VALUES ('HELP_SYNCCL', 'FR', 'Dispositif utilisÃƒÂ© pour synchroniser les clusters aprÃƒÂ¨s avoir modifiÃƒÂ© ou changÃƒÂ© un modÃƒÂ¨le de cluster.', NULL);
INSERT INTO `internal_resources` VALUES ('HELP_VARIATION', 'FR', 'Un contenu peut avoir plusieurs variations. Ces variations peuvent ÃƒÂªtre des langues diffÃƒÂ©rentes ou des profils de contenu diffÃƒÂ©rents.', NULL);
INSERT INTO `internal_resources` VALUES ('HIDE', 'FR', 'Cacher', NULL);
INSERT INTO `internal_resources` VALUES ('HOUR', 'FR', 'Heures', NULL);
INSERT INTO `internal_resources` VALUES ('HOURS_AS', 'FR', 'Analyse des heures', NULL);
INSERT INTO `internal_resources` VALUES ('I_AFTER', 'FR', 'InsÃƒÂ©rer aprÃƒÂ¨s', NULL);
INSERT INTO `internal_resources` VALUES ('IMPORT_DATA', 'FR', 'Importer des donnÃƒÂ©es N/X-XML', NULL);
INSERT INTO `internal_resources` VALUES ('IN_CHANNEL', 'FR', 'dans le canal', NULL);
INSERT INTO `internal_resources` VALUES ('IND_TIME', 'FR', 'Fuseau horaire individuel', NULL);
INSERT INTO `internal_resources` VALUES ('INDIV_CONFIG', 'FR', 'Configuration individuelle pour cette entrÃƒÂ©e', NULL);
INSERT INTO `internal_resources` VALUES ('INSNAME', 'FR', '<Nom du cluster>', NULL);
INSERT INTO `internal_resources` VALUES ('INSTANCE_CREATED', 'FR', 'Une nouvelle instance de cette entrÃƒÂ©e a ÃƒÂ©tÃƒÂ© crÃƒÂ©ÃƒÂ©e.', NULL);
INSERT INTO `internal_resources` VALUES ('INSTANCES_CREATED', 'FR', 'De nouvelles instances de cette entrÃƒÂ©e ont ÃƒÂ©tÃƒÂ© crÃƒÂ©ÃƒÂ©es.', NULL);
INSERT INTO `internal_resources` VALUES ('IS_COMPOUND', 'FR', 'ModÃƒÂ¨le de cluster de composition', NULL);
INSERT INTO `internal_resources` VALUES ('IS_FILTERED', 'FR', 'Note : vous ne pouvez pas afficher tous les enregistrements parce que vous utilisez un filtre !  ', NULL);
INSERT INTO `internal_resources` VALUES ('KEEP_CLUSTER', 'FR', 'Garder le cluster original', NULL);
INSERT INTO `internal_resources` VALUES ('KEYWORDS', 'FR', 'Mots-clÃƒÂ©s', NULL);
INSERT INTO `internal_resources` VALUES ('LAST_LAUNCHED_AT', 'FR', 'Dernier lancement ÃƒÂ ', NULL);
INSERT INTO `internal_resources` VALUES ('LAST_MOD_AT', 'FR', 'DerniÃƒÂ¨re modification ÃƒÂ ', NULL);
INSERT INTO `internal_resources` VALUES ('LASTMONTH', 'FR', 'Mois dernier', NULL);
INSERT INTO `internal_resources` VALUES ('LASTWEEK', 'FR', 'Semaine derniÃƒÂ¨re', NULL);
INSERT INTO `internal_resources` VALUES ('LASTYEAR', 'FR', 'AnnÃƒÂ©e derniÃƒÂ¨re', NULL);
INSERT INTO `internal_resources` VALUES ('LAUNCH', 'FR', 'Lancement', NULL);
INSERT INTO `internal_resources` VALUES ('LEAVE_EMPTY', 'FR', 'Laisser vide', NULL);
INSERT INTO `internal_resources` VALUES ('LIBRARY', 'FR', 'BibliothÃƒÂ¨que de contenu', NULL);
INSERT INTO `internal_resources` VALUES ('LINKED', 'FR', 'LiÃƒÂ© ÃƒÂ ', NULL);
INSERT INTO `internal_resources` VALUES ('LIVE_AUTHORING', 'FR', 'Gestion en direct', NULL);
INSERT INTO `internal_resources` VALUES ('LOCATION', 'FR', 'Emplacement, si externe', NULL);
INSERT INTO `internal_resources` VALUES ('LOCK_MENU', 'FR', 'Bloquer le menu', NULL);
INSERT INTO `internal_resources` VALUES ('LOGFILE', 'FR', 'Voir les logs systÃƒÂ¨me', NULL);
INSERT INTO `internal_resources` VALUES ('LOGGED_AS', 'FR', 'Utilisateur connectÃƒÂ©', NULL);
INSERT INTO `internal_resources` VALUES ('LOGIN_FAILED', 'FR', 'L''identifiant saisi ne peut pas ÃƒÂªtre vÃƒÂ©rifiÃƒÂ© ! Essayez de nouveau.', NULL);
INSERT INTO `internal_resources` VALUES ('LOGS', 'FR', 'Analyse du fichier de logs', NULL);
INSERT INTO `internal_resources` VALUES ('LOGS_INFO', 'FR', 'La liste ci-dessous montre les logs rÃƒÂ©alisÃƒÂ©s pendant que N/X fonctionne.', NULL);
INSERT INTO `internal_resources` VALUES ('LONGEST_PATHS', 'FR', 'Chemins les plus longs', NULL);
INSERT INTO `internal_resources` VALUES ('M_ACCESS', 'FR', 'AccÃƒÂ¨s', NULL);
INSERT INTO `internal_resources` VALUES ('M_ADMIN', 'FR', 'Administration', NULL);
INSERT INTO `internal_resources` VALUES ('M_BACKUP', 'FR', 'Sauvegarde', NULL);
INSERT INTO `internal_resources` VALUES ('M_BROWSER', 'FR', 'Navigateur d''objets', NULL);
INSERT INTO `internal_resources` VALUES ('M_CHANNELS', 'FR', 'Canaux', NULL);
INSERT INTO `internal_resources` VALUES ('M_CLB', 'FR', 'Navigateur de clusters', NULL);
INSERT INTO `internal_resources` VALUES ('M_CLT', 'FR', 'ModÃƒÂ¨les de clusters', NULL);
INSERT INTO `internal_resources` VALUES ('M_CLTB', 'FR', 'Navigateur de modÃƒÂ¨les de clusters', NULL);
INSERT INTO `internal_resources` VALUES ('M_CLUSTERS', 'FR', 'Clusters', NULL);
INSERT INTO `internal_resources` VALUES ('M_COMBOBJ', 'FR', 'Contenus combinÃƒÂ©s (cluster)', NULL);
INSERT INTO `internal_resources` VALUES ('M_ES', 'FR', 'Explorer le site', NULL);
INSERT INTO `internal_resources` VALUES ('M_EXPORT_WZ', 'FR', 'Assistant d''exportation', NULL);
INSERT INTO `internal_resources` VALUES ('M_HELP', 'FR', 'Aide', NULL);
INSERT INTO `internal_resources` VALUES ('M_HOME', 'FR', 'Accueil', NULL);
INSERT INTO `internal_resources` VALUES ('M_IMPORT_WZ', 'FR', 'Assistant d''importation', NULL);
INSERT INTO `internal_resources` VALUES ('M_INSTALLPLUGIN', 'FR', 'Extensions', NULL);
INSERT INTO `internal_resources` VALUES ('M_LIB', 'FR', 'BibliothÃƒÂ¨que', NULL);
INSERT INTO `internal_resources` VALUES ('M_LOGOUT', 'FR', 'Se dÃƒÂ©connecter', NULL);
INSERT INTO `internal_resources` VALUES ('M_MAINTENANCE', 'FR', 'Maintenance', NULL);
INSERT INTO `internal_resources` VALUES ('M_META', 'FR', 'ModÃƒÂ¨les de mÃƒÂ©ta', NULL);
INSERT INTO `internal_resources` VALUES ('M_MYPROFILE', 'FR', 'Mon profil', NULL);
INSERT INTO `internal_resources` VALUES ('M_MYPRT', 'FR', 'Mes portails', NULL);
INSERT INTO `internal_resources` VALUES ('M_PGN', 'FR', 'ContrÃƒÂ´le des extensions', NULL);
INSERT INTO `internal_resources` VALUES ('M_PRTMAN', 'FR', 'Gestionnaire de portail', NULL);
INSERT INTO `internal_resources` VALUES ('M_PTEMP', 'FR', 'ModÃƒÂ¨les de pages', NULL);
INSERT INTO `internal_resources` VALUES ('M_PURGE', 'FR', 'Nettoyer le base de donnÃƒÂ©es', NULL);
INSERT INTO `internal_resources` VALUES ('M_REPORT', 'FR', 'Rapport de site', NULL);
INSERT INTO `internal_resources` VALUES ('M_ROLLOUT', 'FR', 'Bascule', NULL);
INSERT INTO `internal_resources` VALUES ('M_SPM', 'FR', 'Page de site maÃƒÂ®tre', NULL);
INSERT INTO `internal_resources` VALUES ('M_TEMP', 'FR', 'ModÃƒÂ¨les', NULL);
INSERT INTO `internal_resources` VALUES ('M_TRANSLATION', 'FR', 'Traduction', NULL);
INSERT INTO `internal_resources` VALUES ('M_UMAN', 'FR', 'Gestion des utilisateurs', NULL);
INSERT INTO `internal_resources` VALUES ('M_VAR', 'FR', 'Variations', NULL);
INSERT INTO `internal_resources` VALUES ('M_WWW', 'FR', 'Site Web', NULL);
INSERT INTO `internal_resources` VALUES ('MANDATORY', 'FR', 'Ce champ ne peut pas ÃƒÂªtre vide !', NULL);
INSERT INTO `internal_resources` VALUES ('MAXIMUM', 'FR', 'Maximum', NULL);
INSERT INTO `internal_resources` VALUES ('MAXIMUMAT', 'FR', 'Maximum ÃƒÂ ', NULL);
INSERT INTO `internal_resources` VALUES ('MEDIAN', 'FR', 'MÃƒÂ©dian', NULL);
INSERT INTO `internal_resources` VALUES ('MENU', 'FR', 'Menu', NULL);
INSERT INTO `internal_resources` VALUES ('MESSAGE', 'FR', 'Message', NULL);
INSERT INTO `internal_resources` VALUES ('METATEMPLATE', 'FR', 'ModÃƒÂ¨le de mÃƒÂ©ta-clÃƒÂ© additionnel', NULL);
INSERT INTO `internal_resources` VALUES ('METATEMPLATES', 'FR', 'ModÃƒÂ¨les de mÃƒÂ©ta-donnÃƒÂ©es', NULL);
INSERT INTO `internal_resources` VALUES ('MH_GETSTART', 'FR', 'Pour commencer', NULL);
INSERT INTO `internal_resources` VALUES ('MH_GLOSSARY', 'FR', 'Lexique', NULL);
INSERT INTO `internal_resources` VALUES ('MINIMUM', 'FR', 'Minimum', NULL);
INSERT INTO `internal_resources` VALUES ('MINIMUMAT', 'FR', 'Minimum ÃƒÂ ', NULL);
INSERT INTO `internal_resources` VALUES ('MT_ADDITIONAL', 'FR', 'MÃƒÂ©ta-donnÃƒÂ©es additionnelles', NULL);
INSERT INTO `internal_resources` VALUES ('MT_BASE', 'FR', 'MÃƒÂ©ta-donnÃƒÂ©es basiques', NULL);
INSERT INTO `internal_resources` VALUES ('MT_DELETE', 'FR', 'Voulez-vous vraiment supprimer cette partie du modÃƒÂ¨le de mÃƒÂ©ta ? Toute les informations ÃƒÂ©crites dans n''importe quelle mÃƒÂ©ta-donnÃƒÂ©e liÃƒÂ©e ÃƒÂ  la prÃƒÂ©sente partie seront supprimÃƒÂ©es. Les donnÃƒÂ©es vont ÃƒÂªtre perdues ÃƒÂ  jamais ! ', NULL);
INSERT INTO `internal_resources` VALUES ('MT_DW_CONTENT', 'FR', 'Extension Dreamweaver', NULL);
INSERT INTO `internal_resources` VALUES ('MT_DW_CONTENTFIE', 'FR', 'Informations du champ de contenu Dreamweaver', NULL);
INSERT INTO `internal_resources` VALUES ('MT_DW_CONTENTFIELDINFO', 'FR', 'Informations du champ de contenu Dreamweaver', NULL);
INSERT INTO `internal_resources` VALUES ('MT_GENERATE_DTA', 'FR', 'GÃƒÂ©nÃƒÂ©rer les types de donnÃƒÂ©es', NULL);
INSERT INTO `internal_resources` VALUES ('MT_GENERATE_DTA_', 'FR', 'gÃƒÂ©nÃƒÂ¨re les types de donnÃƒÂ©es', NULL);
INSERT INTO `internal_resources` VALUES ('MT_GENERATE_DTA_MES', 'FR', 'gÃƒÂ©nÃƒÂ¨re les types de donnÃƒÂ©es', NULL);
INSERT INTO `internal_resources` VALUES ('MT_GENERATE_DTA_SUCCEEDED', 'FR', '<br><br>Les types de donnÃƒÂ©es ont ÃƒÂ©tÃƒÂ© gÃƒÂ©nÃƒÂ©rÃƒÂ©s avec succÃƒÂ¨s et le fichier ÃƒÂ©crit.<br>', NULL);
INSERT INTO `internal_resources` VALUES ('MT_LW_SITE', 'FR', 'Lancer le site entier', NULL);
INSERT INTO `internal_resources` VALUES ('MT_MODULE', 'FR', 'MÃƒÂ©ta-donnÃƒÂ©e de type de contenu spÃƒÂ©cifique', NULL);
INSERT INTO `internal_resources` VALUES ('MT_PROPERTIES', 'FR', 'Modifier les propriÃƒÂ©tÃƒÂ©s du modÃƒÂ¨le de mÃƒÂ©ta', NULL);
INSERT INTO `internal_resources` VALUES ('MT_SCHEME', 'FR', 'Modifier le schÃƒÂ©ma du modÃƒÂ¨le de mÃƒÂ©ta', NULL);
INSERT INTO `internal_resources` VALUES ('MT_SPIDER', 'FR', 'DÃƒÂ©marrer le spider', NULL);
INSERT INTO `internal_resources` VALUES ('MT_SYNC_CL', 'FR', 'Synchroniser les clusters', NULL);
INSERT INTO `internal_resources` VALUES ('MT_TITLE', 'FR', 'Maintenance', NULL);
INSERT INTO `internal_resources` VALUES ('MULTIPAGE', 'FR', 'Multipage', NULL);
INSERT INTO `internal_resources` VALUES ('NAME', 'FR', 'Nom', NULL);
INSERT INTO `internal_resources` VALUES ('NEW', 'FR', 'CrÃƒÂ©er un nouveau', NULL);
INSERT INTO `internal_resources` VALUES ('NEW_ARTICLE', 'FR', 'Nouvel article', NULL);
INSERT INTO `internal_resources` VALUES ('NEW_CONTENT', 'FR', 'Nouveau contenu', NULL);
INSERT INTO `internal_resources` VALUES ('NEW_FOLDER', 'FR', 'CrÃƒÂ©er un dossier', NULL);
INSERT INTO `internal_resources` VALUES ('NEXT', 'FR', 'Suivant', NULL);
INSERT INTO `internal_resources` VALUES ('NO', 'FR', 'Non', NULL);
INSERT INTO `internal_resources` VALUES ('NO_CLUSTER', 'FR', 'Il n''y a aucun cluster.', NULL);
INSERT INTO `internal_resources` VALUES ('NO_CLUSTER_SELECTED', 'FR', 'Aucun cluster sÃƒÂ©lectionnÃƒÂ©.', NULL);
INSERT INTO `internal_resources` VALUES ('NO_CLUSTERTEMPLATES', 'FR', 'Il n''y a aucun modÃƒÂ¨le de cluster.', NULL);
INSERT INTO `internal_resources` VALUES ('NO_CONTENT', 'FR', 'Aucun contenu dÃƒÂ©jÃƒÂ  saisi.', NULL);
INSERT INTO `internal_resources` VALUES ('NO_CONTENTS', 'FR', 'Aucun contenu disponible dans ce dossier.', NULL);
INSERT INTO `internal_resources` VALUES ('NO_OBJ', 'FR', 'Aucun objet sÃƒÂ©lectionnÃƒÂ©.', NULL);
INSERT INTO `internal_resources` VALUES ('NO_VARIATIONS', 'FR', 'Il n''y a actuellement aucune variation dÃƒÂ©finie pour cet objet<br>Demandez ÃƒÂ  un dÃƒÂ©veloppeur de vÃƒÂ©rifier la configuration de l''entrÃƒÂ©e sÃƒÂ©lectionnÃƒÂ©e.', NULL);
INSERT INTO `internal_resources` VALUES ('NODE_ACCESS', 'FR', 'DÃƒÂ©finir les accÃƒÂ¨s pour la racine du site', NULL);
INSERT INTO `internal_resources` VALUES ('NOSPTITLE', 'FR', 'Vous devez dÃƒÂ©finir le nom dans le menu avant de pouvoir lancer la page !', NULL);
INSERT INTO `internal_resources` VALUES ('NOT_SELECTED', 'FR', 'Aucune entrÃƒÂ©e encore sÃƒÂ©lectionnÃƒÂ©e.', NULL);
INSERT INTO `internal_resources` VALUES ('NOT_SPECIFIED', 'FR', 'N''importe quel type', NULL);
INSERT INTO `internal_resources` VALUES ('NOTCONFIGURED', 'FR', 'Pas encore configurÃƒÂ©.', NULL);
INSERT INTO `internal_resources` VALUES ('NOTNUMBER', 'FR', 'Vous devez entrer un nombre dans ce champ !', NULL);
INSERT INTO `internal_resources` VALUES ('NUM_OF_ART', 'FR', 'Nombre d''articles (999 = infini)', NULL);
INSERT INTO `internal_resources` VALUES ('NUMBER_OF_INSTANCES', 'FR', 'SpÃƒÂ©cifiez combien d''instances vous voulez crÃƒÂ©er.', NULL);
INSERT INTO `internal_resources` VALUES ('O_ALT', 'FR', 'LibellÃƒÂ© ALT', NULL);
INSERT INTO `internal_resources` VALUES ('O_BROWSE', 'FR', 'Naviguer dans les objets', NULL);
INSERT INTO `internal_resources` VALUES ('O_COPYRIGHT', 'FR', 'Copyright', NULL);
INSERT INTO `internal_resources` VALUES ('O_DBLINK_ADDWHERE', 'FR', 'Clause WHERE additionnelle', NULL);
INSERT INTO `internal_resources` VALUES ('O_DBLINK_EXTERNALDB', 'FR', 'Base de donnÃƒÂ©es externe', NULL);
INSERT INTO `internal_resources` VALUES ('O_DBLINK_SRCHVALUE', 'FR', 'Rechercher la valeur', NULL);
INSERT INTO `internal_resources` VALUES ('O_DEL', 'FR', 'Supprimer l''objet', NULL);
INSERT INTO `internal_resources` VALUES ('O_DELMES', 'FR', 'Vous ÃƒÂªtes sur le point de supprimer un objet.<b>Notez que toutes les variations et toutes les mÃƒÂ©ta-donnÃƒÂ©es seront perdues !</b>', NULL);
INSERT INTO `internal_resources` VALUES ('O_EDIT', 'FR', 'Modifier l''objet', NULL);
INSERT INTO `internal_resources` VALUES ('O_NAME', 'FR', 'Nom de l''objet', NULL);
INSERT INTO `internal_resources` VALUES ('O_NEW', 'FR', 'Nouvel objet', NULL);
INSERT INTO `internal_resources` VALUES ('O_PREVIEW', 'FR', 'PrÃƒÂ©visualisation de', NULL);
INSERT INTO `internal_resources` VALUES ('O_PROPERTIES', 'FR', 'PropriÃƒÂ©tÃƒÂ©s de l''objet', NULL);
INSERT INTO `internal_resources` VALUES ('O_TEXT', 'FR', 'Texte', NULL);
INSERT INTO `internal_resources` VALUES ('O_TEXT_NOBREAK', 'FR', 'Ignorer les nouvelles lignes', NULL);
INSERT INTO `internal_resources` VALUES ('OBJLAUNCH_SUCCESS', 'FR', 'L''objet a ÃƒÂ©tÃƒÂ© lancÃƒÂ© avec succÃƒÂ¨s.', NULL);
INSERT INTO `internal_resources` VALUES ('OK', 'FR', 'Ok', NULL);
INSERT INTO `internal_resources` VALUES ('ORDER', 'FR', 'Par ordre', NULL);
INSERT INTO `internal_resources` VALUES ('ORDERART', 'FR', 'Ordre des articles', NULL);
INSERT INTO `internal_resources` VALUES ('ORDERCOMP', 'FR', 'Ordres des compositions', NULL);
INSERT INTO `internal_resources` VALUES ('OTHERS', 'FR', 'Autres', NULL);
INSERT INTO `internal_resources` VALUES ('OVERVIEW', 'FR', 'Vue d''ensemble', NULL);
INSERT INTO `internal_resources` VALUES ('PAGE', 'FR', 'Page', NULL);
INSERT INTO `internal_resources` VALUES ('PAGE_TEMPLATE', 'FR', 'ModÃƒÂ¨le de page', NULL);
INSERT INTO `internal_resources` VALUES ('PAGES', 'FR', 'Pages', NULL);
INSERT INTO `internal_resources` VALUES ('PASSWORD', 'FR', 'Mot de passe', NULL);
INSERT INTO `internal_resources` VALUES ('PATH', 'FR', 'Chemin', NULL);
INSERT INTO `internal_resources` VALUES ('PATHS', 'FR', 'Chemin de clics', NULL);
INSERT INTO `internal_resources` VALUES ('PERCENT', 'FR', 'Pourcentage', NULL);
INSERT INTO `internal_resources` VALUES ('PG_ALREADYINSTAL', 'FR', 'L''extension est dÃƒÂ©jÃƒÂ  installÃƒÂ©e !', NULL);
INSERT INTO `internal_resources` VALUES ('PG_CHOOSE', 'FR', 'Extension : /plugin/', NULL);
INSERT INTO `internal_resources` VALUES ('PG_ERROR', 'FR', 'Il y a eu une erreur pendant l''installation de l''extension !', NULL);
INSERT INTO `internal_resources` VALUES ('PG_FILEWRONG', 'FR', 'Le nom de fichier entrÃƒÂ© ne peut pas ÃƒÂªtre trouvÃƒÂ© sur le serveur !', NULL);
INSERT INTO `internal_resources` VALUES ('PG_INSTALL', 'FR', 'Installer une extension', NULL);
INSERT INTO `internal_resources` VALUES ('PG_INSTALLDESC', 'FR', 'VÃƒÂ©rifiez que vous avez copiÃƒÂ© tous les fichiers nÃƒÂ©cessaires dans le dossier avant de procÃƒÂ©der. InsÃƒÂ©rez le chemin correct de l''extension dans le champ ci-dessous. Le systÃƒÂ¨me pourra alors installer l''extension automatiquement.', NULL);
INSERT INTO `internal_resources` VALUES ('PG_INSTALLED', 'FR', 'L''extension a ÃƒÂ©tÃƒÂ© installÃƒÂ©e avec succÃƒÂ¨s !', NULL);
INSERT INTO `internal_resources` VALUES ('PG_NEWERINSTALLE', 'FR', 'Il y a une version plus rÃƒÂ©cente de cette extension installÃƒÂ©e !', NULL);
INSERT INTO `internal_resources` VALUES ('PG_TITLE', 'FR', 'Extensions', NULL);
INSERT INTO `internal_resources` VALUES ('PG_UNINSTALL', 'FR', 'DÃƒÂ©sinstaller une extension', NULL);
INSERT INTO `internal_resources` VALUES ('PG_UNINSTALLDELE', 'FR', 'DÃƒÂ©sinstaller un module, <br> supprimer les contenus correspondants.', NULL);
INSERT INTO `internal_resources` VALUES ('PG_UNINSTALLMES', 'FR', 'Vous ÃƒÂªtes sur le point de dÃƒÂ©sinstaller un module.<b>La dÃƒÂ©sinstallation d''un module ne supprime pas seulement le type de contenu mais aussi chaque objet unique de ce type stockÃƒÂ© dans la base de donnÃƒÂ©es. La dÃƒÂ©sinstallation supprimera dÃƒÂ©finitivement toutes les donnÃƒÂ©es de ce module ! ', NULL);
INSERT INTO `internal_resources` VALUES ('PG_UPGRADED', 'FR', 'L''extension a ÃƒÂ©tÃƒÂ© mise ÃƒÂ  jour avec succÃƒÂ¨s !', NULL);
INSERT INTO `internal_resources` VALUES ('PGNTXT_SMA', 'FR', 'Enregistrer tous les textes modifiÃƒÂ©s sur cette page', NULL);
INSERT INTO `internal_resources` VALUES ('PI', 'FR', 'Pages demandÃƒÂ©es', NULL);
INSERT INTO `internal_resources` VALUES ('PI_OVERVIEW', 'FR', 'Vue d''ensemble des pages demandÃƒÂ©es', NULL);
INSERT INTO `internal_resources` VALUES ('PO_BROWSER', 'FR', 'Navigateur de portail', NULL);
INSERT INTO `internal_resources` VALUES ('PO_CRSUCCEEDED', 'FR', 'La crÃƒÂ©ation d''un nouveau portail a abouti !', NULL);
INSERT INTO `internal_resources` VALUES ('PO_EDIT', 'FR', 'Modifier la page du portail', NULL);
INSERT INTO `internal_resources` VALUES ('PO_MYPORTAL', 'FR', 'Mes portails', NULL);
INSERT INTO `internal_resources` VALUES ('PO_OWNER', 'FR', 'PropriÃƒÂ©taire de la page', NULL);
INSERT INTO `internal_resources` VALUES ('POS_IN_MENU', 'FR', 'Position dans le plan du site', NULL);
INSERT INTO `internal_resources` VALUES ('POSITION', 'FR', 'Position', NULL);
INSERT INTO `internal_resources` VALUES ('PREDEF_TIME', 'FR', 'Fuseau horaire prÃƒÂ©dÃƒÂ©fini', NULL);
INSERT INTO `internal_resources` VALUES ('PREV_AVAIL', 'FR', 'Vous avez sÃƒÂ©lectionnÃƒÂ© un objet. Une prÃƒÂ©visualisation sera disponible aprÃƒÂ¨s enregistrement.', NULL);
INSERT INTO `internal_resources` VALUES ('PREVIEW', 'FR', 'PrÃƒÂ©visualisation', NULL);
INSERT INTO `internal_resources` VALUES ('PRINT', 'FR', 'Imprimer', NULL);
INSERT INTO `internal_resources` VALUES ('PROCERROR', 'FR', 'Une erreur s''est produite pendant le traitement du formulaire. Regardez les champs marquÃƒÂ©s et lisez les commentaires pour plus d''information.', NULL);
INSERT INTO `internal_resources` VALUES ('PROMPTDELETE', 'FR', 'Voulez-vous vraiment supprimer ce jeu de donnÃƒÂ©es ? Cette action ne peut pas ÃƒÂªtre annulÃƒÂ©e !', NULL);
INSERT INTO `internal_resources` VALUES ('PROPERTIES', 'FR', 'PropriÃƒÂ©tÃƒÂ©s', NULL);
INSERT INTO `internal_resources` VALUES ('PTEMPL', 'FR', 'ModÃƒÂ¨le de page', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE', 'FR', 'Nettoyer la base de donnÃƒÂ©es', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_CLT', 'FR', 'Nettoyer les modÃƒÂ¨les de clusters', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_CLUSTER', 'FR', 'Nettoyer le cluster', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_CONTENT', 'FR', 'Nettoyer le contenu', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_EXPIRED', 'FR', 'Nettoyer les pages expirÃƒÂ©es', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_FOLDER', 'FR', 'Nettoyer les dossiers', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_MES', 'FR', 'SÃƒÂ©lectionnez les parties de la base de donnÃƒÂ©es que vous voulez nettoyer.', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_META', 'FR', 'Nettoyer les mÃƒÂ©ta-donnÃƒÂ©es', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_PAGES', 'FR', 'Nettoyer les pages du site et les maÃƒÂ®tres', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_VAR', 'FR', 'Nettoyer les variations', NULL);
INSERT INTO `internal_resources` VALUES ('PWDNOTMATCH', 'FR', 'Les mots de passe entrÃƒÂ©s ne correspondent pas !', NULL);
INSERT INTO `internal_resources` VALUES ('PWDTOOSHORT', 'FR', 'Le mot de passe doit ÃƒÂªtre d''au moins 6 caractÃƒÂ¨res !', NULL);
INSERT INTO `internal_resources` VALUES ('R_DELETEFOLDER', 'FR', 'Supprimer le dossier', NULL);
INSERT INTO `internal_resources` VALUES ('R_DELFOLDER', 'FR', 'Supprimer le dossier et tous les objets enfants', NULL);
INSERT INTO `internal_resources` VALUES ('R_DELFOLDERMES', 'FR', 'Vous ÃƒÂªtes sur le point de supprimer un dossier. SÃƒÂ©lectionnez une action.', NULL);
INSERT INTO `internal_resources` VALUES ('R_EDITFOLDER', 'FR', 'Modifier les propriÃƒÂ©tÃƒÂ©s du dossier', NULL);
INSERT INTO `internal_resources` VALUES ('R_FOLDERNAME', 'FR', 'Nom du dossier', NULL);
INSERT INTO `internal_resources` VALUES ('R_FOLDERNOTEMPTY', 'FR', 'Le dossier n''est pas vide. Vous ne pouvez donc pas le supprimer ! VÃƒÂ©rifier tous les objets et tous les clusters !', NULL);
INSERT INTO `internal_resources` VALUES ('R_HOME', 'FR', 'DÃƒÂ©marrer', NULL);
INSERT INTO `internal_resources` VALUES ('R_MOVEOBJECTS', 'FR', 'DÃƒÂ©placer tous les objets vers le nÃ…â€œud parent', NULL);
INSERT INTO `internal_resources` VALUES ('R_NEWFOLDER', 'FR', 'Nouveau dossier', NULL);
INSERT INTO `internal_resources` VALUES ('R_PARENT', 'FR', 'Dossier parent', NULL);
INSERT INTO `internal_resources` VALUES ('SEARCH WEBSITE', 'EN', 'Search Website', '');
INSERT INTO `internal_resources` VALUES ('RANK', 'FR', 'Rang', NULL);
INSERT INTO `internal_resources` VALUES ('RATERES', 'FR', 'RÃƒÂ©sultats des taux', NULL);
INSERT INTO `internal_resources` VALUES ('RB_CACHE', 'FR', 'Reconstruire le cache', NULL);
INSERT INTO `internal_resources` VALUES ('READY_TO_USE', 'FR', 'PrÃƒÂªt ÃƒÂ  l''utilisation.', NULL);
INSERT INTO `internal_resources` VALUES ('REFERER', 'FR', 'RÃƒÂ©fÃƒÂ©rent', NULL);
INSERT INTO `internal_resources` VALUES ('REMAIN_POS', 'FR', 'Ne pas changer la position', NULL);
INSERT INTO `internal_resources` VALUES ('RESET', 'FR', 'Remettre ÃƒÂ  zÃƒÂ©ro le formulaire', NULL);
INSERT INTO `internal_resources` VALUES ('RESET_FORM', 'FR', 'Remettre ÃƒÂ  zÃƒÂ©ro le formulaire', NULL);
INSERT INTO `internal_resources` VALUES ('RESET_LOGS', 'FR', 'Remettre ÃƒÂ  zÃƒÂ©ro les logs', NULL);
INSERT INTO `internal_resources` VALUES ('RET_VIS', 'FR', 'Visiteurs de renvoi', NULL);
INSERT INTO `internal_resources` VALUES ('RL_PERM', 'FR', 'Permissions des rÃƒÂ´les', NULL);
INSERT INTO `internal_resources` VALUES ('ROLE_DESCRIPTION', 'FR', 'Description', NULL);
INSERT INTO `internal_resources` VALUES ('ROLE_FILTERMENU', 'FR', 'Administration des rÃƒÂ´les', NULL);
INSERT INTO `internal_resources` VALUES ('ROLE_GENERAL', 'FR', 'Modifier les donnÃƒÂ©es gÃƒÂ©nÃƒÂ©rales du rÃƒÂ´le', NULL);
INSERT INTO `internal_resources` VALUES ('ROLE_HEAD', 'FR', 'Profil du rÃƒÂ´le', NULL);
INSERT INTO `internal_resources` VALUES ('ROLE_LINK', 'FR', 'Profils du rÃƒÂ´le', NULL);
INSERT INTO `internal_resources` VALUES ('ROLE_NAME', 'FR', 'Nom du rÃƒÂ´le', NULL);
INSERT INTO `internal_resources` VALUES ('ROLE_PERMISSION', 'FR', 'Modifier les permissions du rÃƒÂ´le', NULL);
INSERT INTO `internal_resources` VALUES ('SAVE', 'FR', 'Enregistrer', NULL);
INSERT INTO `internal_resources` VALUES ('SAVE_BACK', 'FR', 'Enregistrer et revenir', NULL);
INSERT INTO `internal_resources` VALUES ('SAVEERROR', 'FR', 'Une erreur s''est produite pendant l''enregistrement des donnÃƒÂ©es dans la base de donnÃƒÂ©es. VÃƒÂ©rifiez que la base de donnÃƒÂ©es est connectÃƒÂ©e ou appelez votre administrateur.', NULL);
INSERT INTO `internal_resources` VALUES ('SAVESUCCESS', 'FR', 'Les donnÃƒÂ©es ont ÃƒÂ©tÃƒÂ© ÃƒÂ©crites dans la base de donnÃƒÂ©es avec succÃƒÂ¨s.', NULL);
INSERT INTO `internal_resources` VALUES ('SEARCH', 'FR', 'DÃƒÂ©marrer la recherche', NULL);
INSERT INTO `internal_resources` VALUES ('SEARCH_CLEAR', 'FR', 'Remettre ÃƒÂ  zÃƒÂ©ro le filtre', NULL);
INSERT INTO `internal_resources` VALUES ('SEARCH_EXPIRED_ARTICLES', 'FR', 'Articles expirÃƒÂ©s', NULL);
INSERT INTO `internal_resources` VALUES ('SEARCH_LIVE_ACRTICLES', 'FR', 'Articles en cours', NULL);
INSERT INTO `internal_resources` VALUES ('SEARCHIN', 'FR', 'Rechercher', NULL);
INSERT INTO `internal_resources` VALUES ('SEARCHRESULTS', 'FR', 'RÃƒÂ©sultat de la recherche, veuillez faire votre choix', NULL);
INSERT INTO `internal_resources` VALUES ('SEASRCH_MISSING_VARIATIONS', 'FR', 'Variations manquantes', NULL);
INSERT INTO `internal_resources` VALUES ('SEL_ARTICLE', 'FR', 'SÃƒÂ©lectionner un article', NULL);
INSERT INTO `internal_resources` VALUES ('SEL_CH', 'FR', 'SÃƒÂ©lectionner un canal', NULL);
INSERT INTO `internal_resources` VALUES ('SEL_CHANNEL_CAT', 'FR', 'SÃƒÂ©lectionner un canal et une catÃƒÂ©gorie', NULL);
INSERT INTO `internal_resources` VALUES ('SEL_CLUSTER', 'FR', 'SÃƒÂ©lectionner un cluster', NULL);
INSERT INTO `internal_resources` VALUES ('SEL_EVENT', 'FR', 'SÃƒÂ©lectionner un ÃƒÂ©vÃƒÂ©nement ou un rendez-vous', NULL);
INSERT INTO `internal_resources` VALUES ('SEL_FILE', 'FR', 'SÃƒÂ©lectionner un fichier', NULL);
INSERT INTO `internal_resources` VALUES ('SEL_MEM', 'FR', 'SÃƒÂ©lectionner des membres', NULL);
INSERT INTO `internal_resources` VALUES ('SEL_PTML', 'FR', 'SÃƒÂ©lectionner un modÃƒÂ¨le de page', NULL);
INSERT INTO `internal_resources` VALUES ('SEL_VAR', 'FR', 'SÃƒÂ©lectionner une variation', NULL);
INSERT INTO `internal_resources` VALUES ('SELECT', 'FR', 'SÃƒÂ©lectionner', NULL);
INSERT INTO `internal_resources` VALUES ('SELECT_CI', 'FR', 'SÃƒÂ©lectionner une entrÃƒÂ©e de contenu', NULL);
INSERT INTO `internal_resources` VALUES ('SELECT_CL', 'FR', 'SÃƒÂ©lectionner une instance de cluster', NULL);
INSERT INTO `internal_resources` VALUES ('SELECT_VARIATION', 'FR', 'SÃƒÂ©lectionner une variation', NULL);
INSERT INTO `internal_resources` VALUES ('SELECTEDINSTANCE', 'FR', 'Instance de cluster sÃƒÂ©lectionnÃƒÂ©e', NULL);
INSERT INTO `internal_resources` VALUES ('SELECTEDOBJECT', 'FR', 'EntrÃƒÂ©e de contenu actuellement sÃƒÂ©lectionnÃƒÂ©e', NULL);
INSERT INTO `internal_resources` VALUES ('SELECTOBJECT', 'FR', 'SÃƒÂ©lectionnez une classe et spÃƒÂ©cifiez une position et un nom pour crÃƒÂ©er un nouvel objet.<br>Pour la position, utilisez 0 pour l''insÃƒÂ©rer au dÃƒÂ©but, 999 pour l''insÃƒÂ©rer ÃƒÂ  la fin ou n''importe quel autre position de votre choix.', NULL);
INSERT INTO `internal_resources` VALUES ('SELECTONE', 'FR', 'Vous devez faire un choix ici !', NULL);
INSERT INTO `internal_resources` VALUES ('SELMULTIPLE', 'FR', 'Maintenez la touche CTRL enfoncÃƒÂ©e pour sÃƒÂ©lectionner plusieurs entrÃƒÂ©es.', NULL);
INSERT INTO `internal_resources` VALUES ('SET', 'FR', 'DÃƒÂ©finir', NULL);
INSERT INTO `internal_resources` VALUES ('SHORTEST_PATHS', 'FR', 'Chemins les plus courts', NULL);
INSERT INTO `internal_resources` VALUES ('SHOW', 'FR', 'Montrer', NULL);
INSERT INTO `internal_resources` VALUES ('SHOW_ADVANCED_SEARCH', 'FR', 'Afficher les options de recherche avancÃƒÂ©es', NULL);
INSERT INTO `internal_resources` VALUES ('SHOW_ALL', 'FR', 'Tout montrer', NULL);
INSERT INTO `internal_resources` VALUES ('SHOW_PAGEWISE', 'FR', 'Montrer la mise en page', NULL);
INSERT INTO `internal_resources` VALUES ('SMA_EXT_EDIT', 'FR', 'Ouvrir une fenÃƒÂªtre d''ÃƒÂ©dition. Enregistrer d''abord tous les textes ÃƒÂ©ditÃƒÂ©s avant !', NULL);
INSERT INTO `internal_resources` VALUES ('SP_BROWSE', 'FR', 'Plan du site', NULL);
INSERT INTO `internal_resources` VALUES ('SP_CLNEW', 'FR', 'CrÃƒÂ©er une nouvelle instance de cluster', NULL);
INSERT INTO `internal_resources` VALUES ('SP_CONFDESC', 'FR', 'Vous pouvez lier cette page du site ÃƒÂ  une instance existante du cluster ou crÃƒÂ©er une nouvelle instance. DÃƒÂ©cidez ce que vous souhaitez faire.', NULL);
INSERT INTO `internal_resources` VALUES ('SP_CONFIGURE', 'FR', 'Configurer la page', NULL);
INSERT INTO `internal_resources` VALUES ('SP_DELETE', 'FR', 'Supprimer une page du site', NULL);
INSERT INTO `internal_resources` VALUES ('SP_DELMES', 'FR', 'Vous ÃƒÂªtes sur le point de supprimer une page du site. Notez que toutes les instances vivantes de cette page seront ÃƒÂ©galement supprimÃƒÂ©es !', NULL);
INSERT INTO `internal_resources` VALUES ('SP_EDIT', 'FR', 'Modifier une page du site', NULL);
INSERT INTO `internal_resources` VALUES ('SP_EXPIRE', 'FR', 'Expirer la page', NULL);
INSERT INTO `internal_resources` VALUES ('SP_EXPIREDATE', 'FR', 'ExpirÃƒÂ© depuis', NULL);
INSERT INTO `internal_resources` VALUES ('SP_IPROPERTIES', 'FR', 'PropriÃƒÂ©tÃƒÂ©s de la page', NULL);
INSERT INTO `internal_resources` VALUES ('SP_LAUNCH', 'FR', 'Lancer la page', NULL);
INSERT INTO `internal_resources` VALUES ('SP_LAUNCHDATE', 'FR', 'Actif depuis', NULL);
INSERT INTO `internal_resources` VALUES ('SP_LAUNCHDATES', 'FR', 'Configuration du temps de vie', NULL);
INSERT INTO `internal_resources` VALUES ('SP_LINK', 'FR', 'Lien vers une instance de cluster existante', NULL);
INSERT INTO `internal_resources` VALUES ('SP_MENUDIRECT', 'FR', 'URL directe sur le serveur en ligne', NULL);
INSERT INTO `internal_resources` VALUES ('SP_MENUDIRECTTIT', 'FR', 'DÃƒÂ©finir le chemin optionnel sur le serveur pour un accÃƒÂ¨s direct', NULL);
INSERT INTO `internal_resources` VALUES ('SP_MENUDIRECTTITLE', 'FR', 'DÃƒÂ©finir le chemin optionnel sur le serveur pour un accÃƒÂ¨s direct', NULL);
INSERT INTO `internal_resources` VALUES ('SP_MENUHELP', 'FR', 'Texte d''aide pour le menu', NULL);
INSERT INTO `internal_resources` VALUES ('SP_MENUNAME', 'FR', 'Nom dans le menu', NULL);
INSERT INTO `internal_resources` VALUES ('SP_MENUPROPS', 'FR', 'Nom du menu et texte d''aide', NULL);
INSERT INTO `internal_resources` VALUES ('SP_NEWINSTANCE', 'FR', 'Ajouter une page', NULL);
INSERT INTO `internal_resources` VALUES ('SP_NEWPAGE', 'FR', 'Ajouter une page', NULL);
INSERT INTO `internal_resources` VALUES ('SP_PDELETE', 'FR', 'Supprimer une page', NULL);
INSERT INTO `internal_resources` VALUES ('SP_PDELMES', 'FR', 'Vous ÃƒÂªtes sur le point de supprimer une page. Notez que toutes les instances vivantes de cette page seront ÃƒÂ©galement supprimÃƒÂ©es !', NULL);
INSERT INTO `internal_resources` VALUES ('SP_PREVIEW', 'FR', 'PrÃƒÂ©visualisation de la page', NULL);
INSERT INTO `internal_resources` VALUES ('SP_PROPERTIES', 'FR', 'PropriÃƒÂ©tÃƒÂ©s de la page', NULL);
INSERT INTO `internal_resources` VALUES ('SP_RLTREE', 'FR', 'RafraÃƒÂ®chir l''arborescence', NULL);
INSERT INTO `internal_resources` VALUES ('SPM', 'FR', 'Page de site maÃƒÂ®tre', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_CLUSTER', 'FR', 'ModÃƒÂ¨le de cluster', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_EDIT', 'FR', 'Modifier la page de site maÃƒÂ®tre', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_LAUCH_SUCCESS', 'FR', 'Les pages dÃƒÂ©finies sur le maÃƒÂ®tre ont ÃƒÂ©tÃƒÂ© relancÃƒÂ©es avec succÃƒÂ¨s.<br>', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_META', 'FR', 'ModÃƒÂ¨le de mÃƒÂ©ta-clÃƒÂ©', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_PATH', 'FR', 'Chemin du modÃƒÂ¨le', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_RLAUNCH', 'FR', 'RafraÃƒÂ®chir les instances', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_SELECTTHUMB', 'FR', 'SÃƒÂ©lectionner une vignette', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_THUMBNAIL', 'FR', 'Vignette', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_TYPE', 'FR', 'Type de page', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_VARIATIONS', 'FR', 'Variations affichables', NULL);
INSERT INTO `internal_resources` VALUES ('SR_SELECTCI', 'FR', 'Vous pouvez chercher n''importe quelle entrÃƒÂ©e de contenu ici. Si vous voulez sÃƒÂ©lectionner une entrÃƒÂ©e de contenu, choisissez-la et appuyez sur le bouton Mettre ÃƒÂ  jour. Si vous voulez relier un nouveau contenu ÃƒÂ  ce champ, crÃƒÂ©ez d''abord le contenu dans le navigateur d''objet. ', NULL);
INSERT INTO `internal_resources` VALUES ('SR_SELECTCLI', 'FR', 'SÃƒÂ©lectionnez un modÃƒÂ¨le de cluster. Ensuite, vous pourrez sÃƒÂ©lectionner une instance de ce modÃƒÂ¨le pour l''utiliser.', NULL);
INSERT INTO `internal_resources` VALUES ('START_BAK', 'FR', 'DÃƒÂ©marrer la sauvegarde', NULL);
INSERT INTO `internal_resources` VALUES ('STARTDATE', 'FR', 'Date de dÃƒÂ©marrage', NULL);
INSERT INTO `internal_resources` VALUES ('STARTTIME', 'FR', 'Heure de dÃƒÂ©marrage', NULL);
INSERT INTO `internal_resources` VALUES ('STATS', 'FR', 'Statistiques', NULL);
INSERT INTO `internal_resources` VALUES ('STATS_HEADER', 'FR', 'Statistiques de trafic N/X 2004', NULL);
INSERT INTO `internal_resources` VALUES ('STATUS', 'FR', 'Etat :', NULL);
INSERT INTO `internal_resources` VALUES ('STEP', 'FR', 'Etape', NULL);
INSERT INTO `internal_resources` VALUES ('STNAME', 'FR', 'SÃƒÂ©lectionner un nom pour identifier cette page dans le plan du site', NULL);
INSERT INTO `internal_resources` VALUES ('SYNC_CLUSTERS', 'FR', 'Synchroniser les clusters', NULL);
INSERT INTO `internal_resources` VALUES ('SYNC_CLUSTERS_DESCR', 'FR', 'Quand vous modifiez un modÃƒÂ¨le de cluster, les clusters ne sont pas automatiquement synchronisÃƒÂ©s. Ils sont synchronisÃƒÂ©s quand vous travaillez avec la fois suivante. Vous pouvez tous les synchroniser.', NULL);
INSERT INTO `internal_resources` VALUES ('TEMPLATE', 'FR', 'ModÃƒÂ¨le', NULL);
INSERT INTO `internal_resources` VALUES ('TESTS', 'FR', 'Tests unitaires N/X', NULL);
INSERT INTO `internal_resources` VALUES ('TF', 'FR', 'Fuseau horaire', NULL);
INSERT INTO `internal_resources` VALUES ('THISMONTH', 'FR', 'Ce mois-ci', NULL);
INSERT INTO `internal_resources` VALUES ('THISWEEK', 'FR', 'Cette semaine', NULL);
INSERT INTO `internal_resources` VALUES ('THISYEAR', 'FR', 'Cette annÃƒÂ©e', NULL);
INSERT INTO `internal_resources` VALUES ('TIME_BETW_VISITS', 'FR', 'Moyenne de temps entre les visites', NULL);
INSERT INTO `internal_resources` VALUES ('TIPP_TEMPLATE_1', 'FR', 'Les modÃƒÂ¨les sont ÃƒÂ  la base du fonctionnement de N/X. Vous aurez besoin de crÃƒÂ©er un modÃƒÂ¨le de cluster en premier qui dÃƒÂ©finira la structure et le type de contenu. Par la suite, vous pourrez crÃƒÂ©er les modÃƒÂ¨les de pages ici en fusionnant un modÃƒÂ¨le de cluster et un fichier PHP.<br><br>', NULL);
INSERT INTO `internal_resources` VALUES ('TITLE', 'FR', 'Titre', NULL);
INSERT INTO `internal_resources` VALUES ('TMPL_NAME', 'FR', 'SÃƒÂ©lectionner un modÃƒÂ¨le', NULL);
INSERT INTO `internal_resources` VALUES ('TODAY', 'FR', 'Aujourd''hui', NULL);
INSERT INTO `internal_resources` VALUES ('TOP', 'FR', 'Principales donnÃƒÂ©es', NULL);
INSERT INTO `internal_resources` VALUES ('TOP_BROWSER', 'FR', 'Principaux navigateurs', NULL);
INSERT INTO `internal_resources` VALUES ('TOP_ENTRYPAGES', 'FR', 'Principales pages d''entrÃƒÂ©es', NULL);
INSERT INTO `internal_resources` VALUES ('TOP_EXITPAGES', 'FR', 'Principales pages de sortie', NULL);
INSERT INTO `internal_resources` VALUES ('TOP_EXITT', 'FR', 'Principales cibles de sortie', NULL);
INSERT INTO `internal_resources` VALUES ('TOP_HOSTS', 'FR', 'Principaux hÃƒÂ©bergeurs', NULL);
INSERT INTO `internal_resources` VALUES ('TOP_OS', 'FR', 'Principaux systÃƒÂ¨mes d''exploitation', NULL);
INSERT INTO `internal_resources` VALUES ('TOP_PAGES', 'FR', 'Principales pages', NULL);
INSERT INTO `internal_resources` VALUES ('TOP_PATHS', 'FR', 'Principaux chemins', NULL);
INSERT INTO `internal_resources` VALUES ('TOP_REFERER', 'FR', 'Principaux rÃƒÂ©fÃƒÂ©rents', NULL);
INSERT INTO `internal_resources` VALUES ('TOP_SI', 'FR', 'Principaux moteurs de recherche', NULL);
INSERT INTO `internal_resources` VALUES ('TOP_SKW', 'FR', 'Principaux mots-clÃƒÂ©s de recherche', NULL);
INSERT INTO `internal_resources` VALUES ('TOTAL', 'FR', 'Total', NULL);
INSERT INTO `internal_resources` VALUES ('TRANS_TEMPL', 'FR', 'Traduit depuis', NULL);
INSERT INTO `internal_resources` VALUES ('TRANS_THIS', 'FR', 'Traduire ceci :', NULL);
INSERT INTO `internal_resources` VALUES ('TRANSLATION', 'FR', 'SystÃƒÂ¨me de traduction N/X', NULL);
INSERT INTO `internal_resources` VALUES ('TT_REFRESH', 'FR', 'RafraÃƒÂ®chir les instances met ÃƒÂ  jour les pages en cache dont le modÃƒÂ¨le a ÃƒÂ©tÃƒÂ© modifiÃƒÂ©.', NULL);
INSERT INTO `internal_resources` VALUES ('TT_RSTCI', 'FR', 'Dans N/X, chaque page a un cluster. En appuyant sur RedÃƒÂ©finir l''instance du cluster, vous pouvez assigner un nouveau cluster ÃƒÂ  la page et supprimer l''ancien.', NULL);
INSERT INTO `internal_resources` VALUES ('TYPE', 'FR', 'Type', NULL);
INSERT INTO `internal_resources` VALUES ('UNIQUE', 'FR', 'Ce champ doit ÃƒÂªtre unique !', NULL);
INSERT INTO `internal_resources` VALUES ('UP', 'FR', 'Haut', NULL);
INSERT INTO `internal_resources` VALUES ('UP_INTRO', 'FR', 'SÃƒÂ©lectionnez le groupe et ses rÃƒÂ´les ÃƒÂ  affecter ÃƒÂ  l''utilisateur.', NULL);
INSERT INTO `internal_resources` VALUES ('UPL_TEXT', 'FR', 'Charger un fichier texte', NULL);
INSERT INTO `internal_resources` VALUES ('USAGE', 'FR', 'Utilisation', NULL);
INSERT INTO `internal_resources` VALUES ('USER_ACTIVE', 'FR', 'Compte activÃƒÂ©', NULL);
INSERT INTO `internal_resources` VALUES ('USER_AGENT', 'FR', 'Utiliser l''agent', NULL);
INSERT INTO `internal_resources` VALUES ('USER_BL', 'FR', 'Langage de l''interface', NULL);
INSERT INTO `internal_resources` VALUES ('USER_EMAIL', 'FR', 'E-mail', NULL);
INSERT INTO `internal_resources` VALUES ('USER_FILTERMENU', 'FR', 'Administration des utilisateurs', NULL);
INSERT INTO `internal_resources` VALUES ('USER_GENERAL', 'FR', 'Modifier les donnÃƒÂ©es gÃƒÂ©nÃƒÂ©rales de l''utilisateur', NULL);
INSERT INTO `internal_resources` VALUES ('USER_HEAD', 'FR', 'Profil de l''utilisateur', NULL);
INSERT INTO `internal_resources` VALUES ('USER_JS', 'FR', 'Utiliser le Javascript', NULL);
INSERT INTO `internal_resources` VALUES ('USER_LINK', 'FR', 'Profils des utilisateurs', NULL);
INSERT INTO `internal_resources` VALUES ('USER_NAME', 'FR', 'Nom de l''utilisateur', NULL);
INSERT INTO `internal_resources` VALUES ('USER_PERMGRID', 'FR', 'Grille de permissions', NULL);
INSERT INTO `internal_resources` VALUES ('USER_PERMISSION', 'FR', 'Modifier les permissions de l''utilisateur', NULL);
INSERT INTO `internal_resources` VALUES ('USER_PERMISSIONS', 'FR', 'Permissions de l''utilisateur', NULL);
INSERT INTO `internal_resources` VALUES ('USER_PROFILE', 'FR', 'Mon profil', NULL);
INSERT INTO `internal_resources` VALUES ('USER_SETPERM', 'FR', 'DÃƒÂ©finir les permissions de l''utilisateur ci-dessous. Pour enlever un utilisateur d''un groupe, retirez tous les groupes depuis celui-ci.', NULL);
INSERT INTO `internal_resources` VALUES ('USER_TO_GROUP', 'FR', 'Ajouter un utilisateur au groupe', NULL);
INSERT INTO `internal_resources` VALUES ('USERPERM_HEAD', 'FR', 'Modifier les permissions de l''utilisateur', NULL);
INSERT INTO `internal_resources` VALUES ('V_EDIT', 'FR', 'Modifier les variations', NULL);
INSERT INTO `internal_resources` VALUES ('V_NAME', 'FR', 'Nom', NULL);
INSERT INTO `internal_resources` VALUES ('V_SHORT', 'FR', 'Balise courte', NULL);
INSERT INTO `internal_resources` VALUES ('VAR_SUCCEEDED', 'FR', 'rÃƒÂ©ussi !', NULL);
INSERT INTO `internal_resources` VALUES ('VARIATIONS', 'FR', 'Variations disponibles', NULL);
INSERT INTO `internal_resources` VALUES ('VIS_FIRST', 'FR', 'Visiteurs pour la premiÃƒÂ¨re fois', NULL);
INSERT INTO `internal_resources` VALUES ('VIS_ONL', 'FR', 'Visiteurs en ligne', NULL);
INSERT INTO `internal_resources` VALUES ('VIS_PER_VIS', 'FR', 'Moyenne des visites par visiteur', NULL);
INSERT INTO `internal_resources` VALUES ('VIS_RET', 'FR', 'Visiteurs pÃƒÂ©riodiques', NULL);
INSERT INTO `internal_resources` VALUES ('VISITORS', 'FR', 'Visiteurs', NULL);
INSERT INTO `internal_resources` VALUES ('VISITS', 'FR', 'Visites', NULL);
INSERT INTO `internal_resources` VALUES ('VISITS_OVERVIEW', 'FR', 'Vue d''ensemble des visites', NULL);
INSERT INTO `internal_resources` VALUES ('WEBSITE', 'FR', 'Site Web', NULL);
INSERT INTO `internal_resources` VALUES ('WEEKDAY', 'FR', 'Jours de la semaine', NULL);
INSERT INTO `internal_resources` VALUES ('WEEKDAY_AS', 'FR', 'Analyse des jours de la semaine', NULL);
INSERT INTO `internal_resources` VALUES ('WHEN', 'FR', 'Quand', NULL);
INSERT INTO `internal_resources` VALUES ('WRONGDATE', 'FR', 'La date saisie n''existe pas !', NULL);
INSERT INTO `internal_resources` VALUES ('WZ_ARTICLEIMPORT', 'FR', 'Assistant d''importation d''articles', NULL);
INSERT INTO `internal_resources` VALUES ('WZ_ARTICLEIMPORT_TITLE', 'FR', 'Cet assistant est utilisÃƒÂ© pour importer des donnÃƒÂ©es d''articles depuis diffÃƒÂ©rentes sources vers un canal. Vous pouvez importer depuis des multiples existantes ou d''autres canaux. Vous devez vous assurer que les modÃƒÂ¨les correspondants sont compatibles. ', NULL);
INSERT INTO `internal_resources` VALUES ('WZ_EXPORT_TITLE', 'FR', 'Cet assistant est utilisÃƒÂ© pour ÃƒÂ©changer des clusters, des modÃƒÂ¨les de clusters et des modÃƒÂ¨les de pages entre votre installation N/X et d''autres installations. L''assistant produit un fichier XML que vous pouvez stocker sur votre disque dur local et ÃƒÂ©changer avec d''autres utilisateurs de N/X.', NULL);
INSERT INTO `internal_resources` VALUES ('WZ_IMPORT_TITLE', 'FR', 'Cet assistant est utilisÃƒÂ© pour importer vers N/X des donnÃƒÂ©es qui ont ÃƒÂ©tÃƒÂ© prÃƒÂ©alablement exportÃƒÂ©es avec une autre installation de N/X. Vous devez supprimer une ressource avant de l''importer une deuxiÃƒÂ¨me fois.', NULL);
INSERT INTO `internal_resources` VALUES ('WZE_ARTICLEIMPORT_SRCTYPE', 'FR', 'SÃƒÂ©lectionnez depuis quel type de source vous voulez importer les articles.', NULL);
INSERT INTO `internal_resources` VALUES ('WZE_ARTICLEIMPORT_TARGET', 'FR', 'A droite, vous devez choisir le canal cible. Tous les articles importÃƒÂ©s seront stockÃƒÂ©s dans ce canal.', NULL);
INSERT INTO `internal_resources` VALUES ('WZE_EXPORT_TYPE', 'FR', 'A droite, vous devez choisir le type de donnÃƒÂ©es que vous voulez exporter. Les clusters stockent le contenu. Quand vous exportez des clusters, les modÃƒÂ¨les sont ÃƒÂ©galement automatiquement exportÃƒÂ©s. Les modÃƒÂ¨les de clusters dÃƒÂ©finissent la structure pour crÃƒÂ©er des clusters. Des modÃƒÂ¨les de pages dÃƒÂ©finissent la mise en page que les clusters vont utiliser en fonction de leur contenu.', NULL);
INSERT INTO `internal_resources` VALUES ('WZE_IMPORT_FILE', 'FR', 'Choisissez un fichier N/X-XML sur votre disque pour le charger dans le systÃƒÂ¨me.<br./><br./>Le systÃƒÂ¨me le contrÃƒÂ´lera et montrera l''information d''ÃƒÂ©tat sur la prochaine page.', NULL);
INSERT INTO `internal_resources` VALUES ('WZE_IMPORT_VAL', 'FR', 'Le systÃƒÂ¨me a vÃƒÂ©rifiÃƒÂ© l''exactitude du fichier XML chargÃƒÂ©. Lisez le rapport ÃƒÂ  gauche pour plus de dÃƒÂ©tails.', NULL);
INSERT INTO `internal_resources` VALUES ('WZE_IMPORTING', 'FR', 'Le systÃƒÂ¨me a tentÃƒÂ© d''importer les donnÃƒÂ©es. Lisez l''ÃƒÂ©tat ÃƒÂ  droite.', NULL);
INSERT INTO `internal_resources` VALUES ('WZT_ARTICLEIMPORT_SRCTYPE', 'FR', 'SÃƒÂ©lectionner le type de source', NULL);
INSERT INTO `internal_resources` VALUES ('WZT_ARTICLEIMPORT_TARGET', 'FR', 'SÃƒÂ©lectionner le canal cible', NULL);
INSERT INTO `internal_resources` VALUES ('WZT_DESCR', 'FR', 'Ajouter une description', NULL);
INSERT INTO `internal_resources` VALUES ('WZT_DESCR_EXPL', 'FR', 'Vous devriez ajouter une courte description aux donnÃƒÂ©es exportÃƒÂ©es.</br.></br.>Celui qui importera les donnÃƒÂ©es comprendra plus facilement ce qu''il a exportÃƒÂ©.', NULL);
INSERT INTO `internal_resources` VALUES ('WZT_EXPORT_TYPE', 'FR', 'SÃƒÂ©lectionner un type ÃƒÂ  exporter', NULL);
INSERT INTO `internal_resources` VALUES ('WZT_IMPORT_FILE', 'FR', 'SÃƒÂ©lectionner un fichier N/X-XML ', NULL);
INSERT INTO `internal_resources` VALUES ('WZT_IMPORT_VAL', 'FR', 'Sommaire du XML chargÃƒÂ©', NULL);
INSERT INTO `internal_resources` VALUES ('WZT_IMPORTING', 'FR', 'DonnÃƒÂ©es en cours d''importation', NULL);
INSERT INTO `internal_resources` VALUES ('WZT_KEEPCLUSTER', 'FR', 'Garder les clusters existants ?', NULL);
INSERT INTO `internal_resources` VALUES ('WZT_KEEPCLUSTER_EXPL', 'FR', 'Vous pouvez indiquer si vous voulez garder les clusters existants ou crÃƒÂ©er des copies de chaque cluster.<br.><br.>Garder ÃƒÂ  l''esprit que si vous gardez les clusters originaux vous les partagez avec la source originale.', NULL);
INSERT INTO `internal_resources` VALUES ('WZT_SEL_EXP_RES', 'FR', 'SÃƒÂ©lectionner une ressource ÃƒÂ  exporter', NULL);
INSERT INTO `internal_resources` VALUES ('YES', 'FR', 'Oui', NULL);
INSERT INTO `internal_resources` VALUES ('YESTERDAY', 'FR', 'Hier', NULL);
INSERT INTO `internal_resources` VALUES ('M_ARTICLES', 'FR', 'Articles', '');
INSERT INTO `internal_resources` VALUES ('CL_GROUP', 'FR', 'Cluster Group', '');
INSERT INTO `internal_resources` VALUES ('PAGE_ID', 'FR', 'Page ID', '');
INSERT INTO `internal_resources` VALUES ('PROC_DATA', 'FR', 'Processing Data...', '');
INSERT INTO `internal_resources` VALUES ('MAINT_WWWDEV', 'EN', 'Switch test website into maintenance.', '');
INSERT INTO `internal_resources` VALUES ('BB_IN_MM_MODE', 'EN', 'The backend is in maintenance at the moment. Only the Administrator can log in!', '');
INSERT INTO `internal_resources` VALUES ('POPUP_MENU', 'EN', 'Popup Window', '');
INSERT INTO `internal_resources` VALUES ('PAR_PAGE', 'EN', 'Parent Page', '');
INSERT INTO `internal_resources` VALUES ('IMP_IMAGES', 'EN', 'Import images', '');
INSERT INTO `internal_resources` VALUES ('SEL_IMP_FOLDER', 'EN', 'Select import folder', '');
INSERT INTO `internal_resources` VALUES ('IMP_IMPAGES', 'EN', 'Import Images', '');
INSERT INTO `internal_resources` VALUES ('WZ_IMPORT_IM_TITLE', 'EN', 'This wizard is used for importing importing images to N/X. Pack the images into a zip archive and upload them with this wizard. The wizard will extract the images and add them to the content library.', '');
INSERT INTO `internal_resources` VALUES ('WZT_ARCHIVE_FILE', 'EN', 'Select Archive', '');
INSERT INTO `internal_resources` VALUES ('WZE_ARCHIVE_FILE', 'EN', 'Please select the zip-archive you want to import. Do not use folders within the zip-archive!', '');
INSERT INTO `internal_resources` VALUES ('MUST_UPLOAD', 'EN', 'You must upload a file to proceed!', '');
INSERT INTO `internal_resources` VALUES ('ARCHERR', 'EN', 'The archive could not be properly imported. Check for php_zip extension!', '');
INSERT INTO `internal_resources` VALUES ('WZT_ACH_CHECK', 'EN', 'Check Archive', '');
INSERT INTO `internal_resources` VALUES ('NUMB_FILES', 'EN', 'Number of files found in archive:', '');
INSERT INTO `internal_resources` VALUES ('WZE_ARCH_CHECK', 'EN', 'Please control the result of the archive checks and press next if you want to continue.', '');
INSERT INTO `internal_resources` VALUES ('WZT_DEST_FOLDER', 'EN', 'Select destination folder', '');
INSERT INTO `internal_resources` VALUES ('WZE_DEST_FOLDER', 'EN', 'Please select the destiniation folder for the pictures.', '');
INSERT INTO `internal_resources` VALUES ('DEST_FOLDER', 'EN', 'Destination folder', '');
INSERT INTO `internal_resources` VALUES ('NUM_FILES', 'EN', 'Number of files found in archive:', '');
INSERT INTO `internal_resources` VALUES ('WZT_IMP_IMAG', 'EN', 'Importing images...', '');
INSERT INTO `internal_resources` VALUES ('NOFI', 'EN', 'Number of files imported:', '');
INSERT INTO `internal_resources` VALUES ('ACCESS_VIOLATION', 'EN', 'Access violation', '');
INSERT INTO `internal_resources` VALUES ('ACCESS_V_TEXT', 'EN', 'You have no rights to access this object!', '');
INSERT INTO `internal_resources` VALUES ('CLEAR_JPCACHE', 'EN', 'Clear Cache', '');
INSERT INTO `internal_resources` VALUES ('WAS_DELETED', 'EN', 'The referenced content was deleted from library!', '');
INSERT INTO `internal_resources` VALUES ('DEL_TREE', 'EN', 'Delete Tree', '');
INSERT INTO `internal_resources` VALUES ('MORE_ACT', 'EN', 'More actions...', '');
INSERT INTO `internal_resources` VALUES ('RESETCLI', 'EN', 'Change Object', '');
INSERT INTO `internal_resources` VALUES ('STATISTICS', 'EN', 'Statistics', '');
INSERT INTO `internal_resources` VALUES ('REFRESH', 'EN', 'Refresh', '');
INSERT INTO `internal_resources` VALUES ('ACCESS_V_TEXT', 'DE', 'Sie haben nicht die notwendigen Rechte um auf das Object zuzugreifen.', '');
INSERT INTO `internal_resources` VALUES ('ARCHERR', 'DE', 'Die Archivdatei konnte nicht entpackt werden. Stellen Sie sicher, dass die php_zip Erweiterung korrekt installiert ist.', '');
INSERT INTO `internal_resources` VALUES ('BAK_TIPP', 'DE', 'Sie kÃƒÂ¶nnen ihre www, wwwdev-Verzeichnisse sowie die Datenbank hier sichern. Bitte stellen Sie vorab sicher, dass die Sicherung korrekt konfiguriert wurde.', '');
INSERT INTO `internal_resources` VALUES ('BB_IN_MM_MODE', 'DE', 'Das Backoffice ist im Wartungsmodus. Nur der Administrator kann sich einloggen.', '');
INSERT INTO `internal_resources` VALUES ('BY_ORDER', 'DE', 'nach Position', '');
INSERT INTO `internal_resources` VALUES ('CCONLAUNCH', 'DE', 'Cache beim verÃƒÂ¶ffentlichen Leeren', '');
INSERT INTO `internal_resources` VALUES ('CCONLAUNCH_LBL', 'DE', 'kommaseparierte Seiten-IDs', '');
INSERT INTO `internal_resources` VALUES ('CHANGE', 'DE', 'Ãƒâ€žndern', '');
INSERT INTO `internal_resources` VALUES ('CHANGE_TEMPLATE', 'DE', 'AusgewÃƒÂ¤hlte Seitenvorlage', '');
INSERT INTO `internal_resources` VALUES ('CHNLAUNCHED', 'DE', 'Der Kanal wurde erfolgreich verÃƒÂ¶ffentlicht.', '');
INSERT INTO `internal_resources` VALUES ('CLEAR_JPCACHE', 'DE', 'Cache leeren', '');
INSERT INTO `internal_resources` VALUES ('CL_GROUP', 'DE', 'Objektgruppe', '');
INSERT INTO `internal_resources` VALUES ('COPYCLT', 'DE', 'Klasse Kopieren', '');
INSERT INTO `internal_resources` VALUES ('COPYCLUSTERT', 'DE', 'Kopieren', '');
INSERT INTO `internal_resources` VALUES ('CREATECOPY', 'DE', 'Kopieren', '');
INSERT INTO `internal_resources` VALUES ('CR_BO_LANG', 'DE', 'Neue Backoffice-Sprache erstellen', '');
INSERT INTO `internal_resources` VALUES ('DEL_TREE', 'DE', 'Baum lÃƒÂ¶schen', '');
INSERT INTO `internal_resources` VALUES ('DEST_FOLDER', 'DE', 'Zielordner', '');
INSERT INTO `internal_resources` VALUES ('EXP_TREE', 'DE', 'Baum zurÃƒÂ¼ckziehen', '');
INSERT INTO `internal_resources` VALUES ('FILE_ALREADY_UPLOADED', 'DE', 'Die Datei wurde bereits hochgeladen. Sie kÃƒÂ¶nnen fortfahren, indem sie auf Weiter klicken.', '');
INSERT INTO `internal_resources` VALUES ('GAFOLDER', 'DE', 'Bilder-Ordner', '');
INSERT INTO `internal_resources` VALUES ('GALCOLS', 'DE', 'Spalten', '');
INSERT INTO `internal_resources` VALUES ('GALDESC', 'DE', 'Beschreibung', '');
INSERT INTO `internal_resources` VALUES ('GALNAME', 'DE', 'Gallerie', '');
INSERT INTO `internal_resources` VALUES ('GALROWS', 'DE', 'Zeilen', '');
INSERT INTO `internal_resources` VALUES ('GO_IMPORT', 'DE', 'Klicken Sie auf weiter, um die Daten jetzt zu importieren.', '');
INSERT INTO `internal_resources` VALUES ('WZ_IMP_SELCL', 'EN', 'Please select the node you want to import.', '');
INSERT INTO `internal_resources` VALUES ('IMP_ERR', 'DE', 'Der Import ist aufgrund der folgenden Fehler fehlgeschlagen:', '');
INSERT INTO `internal_resources` VALUES ('IMP_IMAGES', 'DE', 'Bilder importieren', '');
INSERT INTO `internal_resources` VALUES ('IMP_IMPAGES', 'DE', 'Bilder importieren', '');
INSERT INTO `internal_resources` VALUES ('LANGID', 'DE', 'Sprachen ID', '');
INSERT INTO `internal_resources` VALUES ('LANGUAGE', 'DE', 'Sprache', '');
INSERT INTO `internal_resources` VALUES ('LAUNCH_TREE', 'DE', 'Launch Tree', '');
INSERT INTO `internal_resources` VALUES ('MAINT_BB', 'DE', 'Backoffice in Wartungsmodus schalten.', '');
INSERT INTO `internal_resources` VALUES ('MAINT_MODE', 'DE', 'Wartungsmodus', '');
INSERT INTO `internal_resources` VALUES ('MAINT_WWW', 'DE', 'Website in Wartungsmodus schalten.', '');
INSERT INTO `internal_resources` VALUES ('MAINT_WWWDEV', 'DE', 'Vorschau-Website in Wartungsmodus schalten.', '');
INSERT INTO `internal_resources` VALUES ('MEDIA_SUPPORTED', 'DE', 'Das Media-Plugin unterstÃƒÂ¼tzt folgende Dateitypen:Macromedia Flash Films (.swf), Windows Media (.avi), Real Player (.rm), Apple Quicktime (.mov), MP3 over Windows Media (.mp3), PDF (.pdf)', '');
INSERT INTO `internal_resources` VALUES ('MISSING_PGN', 'DE', 'Fehlendes Plugin:', '');
INSERT INTO `internal_resources` VALUES ('MODTYPE', 'DE', 'Plugin-Typ:', '');
INSERT INTO `internal_resources` VALUES ('MORE_ACT', 'DE', 'Weitere Aktionen...', '');
INSERT INTO `internal_resources` VALUES ('MT_LWC', 'DE', 'Alle Artikel verÃƒÂ¶ffentlichen', '');
INSERT INTO `internal_resources` VALUES ('MT_RB_CACHE_MES', 'DE', 'Cache aller verÃƒÂ¶ffentlichten Seiten neu aufbauen.', '');
INSERT INTO `internal_resources` VALUES ('MUST_UPLOAD', 'DE', 'Sie mÃƒÂ¼ssen eine Datei hochladen', '');
INSERT INTO `internal_resources` VALUES ('M_ARTICLES', 'DE', 'Artikel', '');
INSERT INTO `internal_resources` VALUES ('NEWNAME', 'DE', 'Neuer Name', '');
INSERT INTO `internal_resources` VALUES ('NEW_ROLLOUT', 'DE', 'Einen neuen Kopiervorgang starten', '');
INSERT INTO `internal_resources` VALUES ('NOFI', 'DE', 'Anzahl der importierten Dateien:', '');
INSERT INTO `internal_resources` VALUES ('NOT_FOUND', 'DE', 'Es wurde nichts gefunden.', '');
INSERT INTO `internal_resources` VALUES ('NO_XML', 'DE', 'Die hochgeladenen Datei ist kein korrektes XML.', '');
INSERT INTO `internal_resources` VALUES ('NUMB_FILES', 'DE', 'Anzahl von gefundenen Dateien im Archiv:', '');
INSERT INTO `internal_resources` VALUES ('NUMB_IMPORTED', 'DE', 'Importierte DatensÃƒÂ¤tze:', '');
INSERT INTO `internal_resources` VALUES ('NUM_FILES', 'DE', 'Anzahl von gefundenen Dateien im Archiv:', '');
INSERT INTO `internal_resources` VALUES ('O_DELMES2', 'DE', 'MÃƒÂ¶chten Sie diesen inhalt wirklich lÃƒÂ¶schen? Er kÃƒÂ¶nnte immer noch von einigen Objekten genutzt werden.', '');
INSERT INTO `internal_resources` VALUES ('PAGE_ID', 'DE', 'Page ID', '');
INSERT INTO `internal_resources` VALUES ('PAR_PAGE', 'DE', 'Elternseite', '');
INSERT INTO `internal_resources` VALUES ('PGN_INFO', 'DE', 'Informationen zum Plugin', '');
INSERT INTO `internal_resources` VALUES ('PNF', 'DE', 'Die Seiten-Id wurde nicht gefunden', '');
INSERT INTO `internal_resources` VALUES ('POPUP_MENU', 'DE', 'Popup', '');
INSERT INTO `internal_resources` VALUES ('PROC_DATA', 'DE', 'Verarbeite Daten....', '');
INSERT INTO `internal_resources` VALUES ('REFRESH', 'DE', 'Aktualisieren', '');
INSERT INTO `internal_resources` VALUES ('RESETCLI', 'DE', 'Objekt anpassen', '');
INSERT INTO `internal_resources` VALUES ('ROLLOUT_SEL', 'DE', 'Quelle und Ziel der Kopie', '');
INSERT INTO `internal_resources` VALUES ('SEARCH WEBSITE', 'DE', 'Search Website', '');
INSERT INTO `internal_resources` VALUES ('SEL_IMP_FOLDER', 'DE', 'Importverzeichnis auswÃƒÂ¤hlen', '');
INSERT INTO `internal_resources` VALUES ('SOURCE', 'DE', 'Quelle', '');
INSERT INTO `internal_resources` VALUES ('SOURCEFILE', 'DE', 'Quelldatei', '');
INSERT INTO `internal_resources` VALUES ('STATISTICS', 'DE', 'Statistiken', '');
INSERT INTO `internal_resources` VALUES ('UNINSTALL', 'DE', 'Deinstallieren', '');
INSERT INTO `internal_resources` VALUES ('UNINSTCONF', 'DE', 'Das Deinstallieren eines Plugins kann ihre Website zerstÃƒÂ¶ren. MÃƒÂ¶chten Sie wirklich fortfahren?', '');
INSERT INTO `internal_resources` VALUES ('VERSION', 'DE', 'Version', '');
INSERT INTO `internal_resources` VALUES ('WAS_DELETED', 'DE', 'Der Inhalt wurde aus der Bibliothek entfernt.', '');
INSERT INTO `internal_resources` VALUES ('WYSIWYG', 'DE', 'WYSIWYG Editor', '');
INSERT INTO `internal_resources` VALUES ('WZE_ARCHIVE_FILE', 'DE', 'Bitte wÃƒÂ¤hlen Sie das zu importierende ZIP-Archiv. Verwenden Sie keine Verzeichnisse innerhalb von Archiven!', '');
INSERT INTO `internal_resources` VALUES ('WZE_ARCH_CHECK', 'DE', 'Bitte kontrollieren Sie die ArchivprÃƒÂ¼fung.', '');
INSERT INTO `internal_resources` VALUES ('WZE_DEST_FOLDER', 'DE', 'Bitte wÃƒÂ¤hlen Sie den Zielordner fÃƒÂ¼r die Bilder.', '');
INSERT INTO `internal_resources` VALUES ('WZT_ACH_CHECK', 'DE', 'Archiv ÃƒÂ¼berprÃƒÂ¼fen', '');
INSERT INTO `internal_resources` VALUES ('WZT_ARCHIVE_FILE', 'DE', 'Archiv wÃƒÂ¤hlen', '');
INSERT INTO `internal_resources` VALUES ('WZT_DEST_FOLDER', 'DE', 'WÃƒÂ¤hlen Sie einen Zielordner', '');
INSERT INTO `internal_resources` VALUES ('WZT_IMP_IMAG', 'DE', 'Importiere Bilder...', '');
INSERT INTO `internal_resources` VALUES ('WZ_IMPORT_IM_TITLE', 'DE', 'Dieser Assistent dient zum importieren von Bildern. Packen Sie die Bilder in ein Archiv und laden Sie dies hier hoch.', '');
INSERT INTO `internal_resources` VALUES ('ACCESS_VIOLATION', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('ACCESS_V_TEXT', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('ARCHERR', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('BACK_SP', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('BB_IN_MM_MODE', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('BG_COLOR', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CCONLAUNCH', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CCONLAUNCH_LBL', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CHANGE', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CHNLAUNCHED', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CLEAR_JPCACHE', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CLLINK', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CONFIRM_UNSAVED_CHANGES_LINKEDCL', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('COPYCLT', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('COPYCLUSTERT', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CREATECOPY', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CR_BO_LANG', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('DEL_TREE', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('DEST_FOLDER', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('EXP_TREE', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('FILE_ALREADY_UPLOADED', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('FONT', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('FONTSIZE', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('GAFOLDER', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('GALCOLS', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('GALDESC', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('GALNAME', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('GALROWS', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('GO_IMPORT', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('GR_TEXT', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('HEIGHT', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('OF', 'EN', 'of', '');
INSERT INTO `internal_resources` VALUES ('IMP_ERR', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('IMP_IMAGES', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('IMP_IMPAGES', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('LANGID', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('LANGUAGE', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('LAUNCH_TREE', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('MAINT_BB', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('MAINT_MODE', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('MAINT_WWW', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('MAINT_WWWDEV', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('MEDIA_SUPPORTED', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('MISSING_PGN', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('MODTYPE', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('MORE_ACT', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('MT_LWC', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('MT_LWS_MESSAGES', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('MT_RB_CACHE_MES', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('MUST_UPLOAD', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('NEWNAME', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('NEW_ROLLOUT', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('NOFI', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('NOT_FOUND', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('NO_XML', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('NUMBER', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('NUMB_FILES', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('NUMB_IMPORTED', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('NUM_FILES', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('O_DELMES2', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PAR_PAGE', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PGN_INFO', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('PNF', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('POPUP_MENU', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('REFRESH', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('RESETCLI', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('ROLLOUT_SEL', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SEARCH WEBSITE', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SEL_IMP_FOLDER', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SOURCE', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('SOURCEFILE', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('STATISTICS', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('TEXT_ALIGN', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('TEXT_COLOR', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('TEXT_STYLE', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('UNINSTALL', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('UNINSTCONF', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('VERSION', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('WAS_DELETED', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('WIDTH', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('WYSIWYG', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('WZE_ARCHIVE_FILE', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('WZE_ARCH_CHECK', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('WZE_DEST_FOLDER', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('WZT_ACH_CHECK', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('WZT_ARCHIVE_FILE', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('WZT_DEST_FOLDER', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('WZT_IMP_IMAG', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('WZ_IMPORT_IM_TITLE', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('LATEST', 'EN', 'Latest changed first', '');
INSERT INTO `internal_resources` VALUES ('OLDEST', 'EN', 'Oldest changed first', '');
INSERT INTO `internal_resources` VALUES ('RANDOM', 'EN', 'Random', '');
INSERT INTO `internal_resources` VALUES ('LOGIN', 'EN', 'Sign In', '');
INSERT INTO `internal_resources` VALUES ('ROLL2', 'EN', 'You can change the names of the objects now. This is necessary because you cannot have duplicate names. If names are not too important for you, N/X will use its autonaming algorithm for resolving duplicate name constraints.', '');
INSERT INTO `internal_resources` VALUES ('SOURCE_NODE', 'EN', 'Source Node:', '');
INSERT INTO `internal_resources` VALUES ('DEST_NODE', 'EN', 'Destination node:', '');
INSERT INTO `internal_resources` VALUES ('SEARCH_REPL', 'EN', 'Search and replace object names', '');
INSERT INTO `internal_resources` VALUES ('SEARCHPHRASE', 'EN', 'Search phrase:', '');
INSERT INTO `internal_resources` VALUES ('REPLACEPHRASE', 'EN', 'Replace phrase:', '');
INSERT INTO `internal_resources` VALUES ('REPLACEALL', 'EN', 'Replace All', '');
INSERT INTO `internal_resources` VALUES ('MANEDIT', 'EN', 'Manual edit rollout names and properties', '');
INSERT INTO `internal_resources` VALUES ('SEARCHREPLACEVALID', 'EN', 'You must enter a search and a replace string!', '');
INSERT INTO `internal_resources` VALUES ('ROLLOUTSUCCESS', 'EN', 'The copy was successful!', '');
INSERT INTO `internal_resources` VALUES ('REFRESH_PAGES', 'EN', 'The pages which are based on this template were successfully republished.<br>', '');
INSERT INTO `internal_resources` VALUES ('CH_IMP_SUCCESS', 'EN', 'The data was successfully imported to the channel.', '');
INSERT INTO `internal_resources` VALUES ('NUM_IMP_PAGES', 'EN', 'Total number of imported pages:', '');
INSERT INTO `internal_resources` VALUES ('BACK_TO_CHANNELS', 'EN', 'Back to Article Overview', '');
INSERT INTO `internal_resources` VALUES ('BACKUP_CONFIG', 'EN', 'The backup directory was not found on the harddisc!', '');
INSERT INTO `internal_resources` VALUES ('DEL_BACKUP', 'EN', 'Delete backup file?', '');
INSERT INTO `internal_resources` VALUES ('DEL_BACKUP_MES', 'EN', 'Do you really want to delete this backup file?', '');
INSERT INTO `internal_resources` VALUES ('THEREISQUESTION', 'EN', 'Confirm action', '');
INSERT INTO `internal_resources` VALUES ('CREATED_ITEM', 'EN', 'The following Placeholder was created:', '');
INSERT INTO `internal_resources` VALUES ('SEARCH2', 'EN', 'Search', '');
INSERT INTO `internal_resources` VALUES ('WEBSITEPRV', 'EN', 'Website preview', '');
INSERT INTO `internal_resources` VALUES ('BACKUP_CONFIG', 'DE', 'Das Sicherungsverzeichnis wurde auf der Festplatte nicht gefunden.', '');
INSERT INTO `internal_resources` VALUES ('BACK_TO_CHANNELS', 'DE', 'ZurÃƒÂ¼ck zur ArtikelÃƒÂ¼bersicht', '');
INSERT INTO `internal_resources` VALUES ('CH_IMP_SUCCESS', 'DE', 'Die Daten wurden erfolgreich in den Kanal importiert.', '');
INSERT INTO `internal_resources` VALUES ('CREATED_ITEM', 'DE', 'Der Platzhalter wurde erzeugt:', '');
INSERT INTO `internal_resources` VALUES ('DEL_BACKUP', 'DE', 'Backupdatei lÃƒÂ¶schen?', '');
INSERT INTO `internal_resources` VALUES ('DEL_BACKUP_MES', 'DE', 'MÃƒÂ¶chten Sie die Backupdatei wirklich lÃƒÂ¶schen?', '');
INSERT INTO `internal_resources` VALUES ('DEST_NODE', 'DE', 'Zielknoten:', '');
INSERT INTO `internal_resources` VALUES ('LATEST', 'DE', 'zuletzt geÃƒÂ¤nderte zuerst', '');
INSERT INTO `internal_resources` VALUES ('LOGIN', 'DE', 'Anmelden', '');
INSERT INTO `internal_resources` VALUES ('MANEDIT', 'DE', 'Namen von Hand bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('NUM_IMP_PAGES', 'DE', 'Anzahl importierter Seiten:', '');
INSERT INTO `internal_resources` VALUES ('OF', 'DE', 'von', '');
INSERT INTO `internal_resources` VALUES ('OLDEST', 'DE', 'die ÃƒÂ¤ltesten zuerst', '');
INSERT INTO `internal_resources` VALUES ('RANDOM', 'DE', 'ZufÃƒÂ¤llig', '');
INSERT INTO `internal_resources` VALUES ('REFRESH_PAGES', 'DE', 'Die Seiten, die auf dieser Vorlage basieren wurden erfolgreich neu verÃƒÂ¶ffentlicht.', '');
INSERT INTO `internal_resources` VALUES ('REPLACEALL', 'DE', 'Alle ersetzen', '');
INSERT INTO `internal_resources` VALUES ('REPLACEPHRASE', 'DE', 'Ersetzungstext', '');
INSERT INTO `internal_resources` VALUES ('ROLL2', 'DE', 'Sie kÃƒÂ¶nnen die Namen der Objekte jetzt verÃƒÂ¤ndern. Dies ist wichtig, da N/X keine zwei Objekte mit dem selben Namen verwalten kann. Wenn Sie die Namen nicht ÃƒÂ¤ndern, wird N/X dies automatisch fÃƒÂ¼r Sie ÃƒÂ¼bernehmen.', '');
INSERT INTO `internal_resources` VALUES ('ROLLOUTSUCCESS', 'DE', 'Die Kopie war erfolgreich.', '');
INSERT INTO `internal_resources` VALUES ('SEARCH2', 'DE', 'Search', '');
INSERT INTO `internal_resources` VALUES ('SEARCHPHRASE', 'DE', 'Suchtext', '');
INSERT INTO `internal_resources` VALUES ('SEARCHREPLACEVALID', 'DE', 'Sie mÃƒÂ¼ssen einen Such- und einen Ersetzungstext eingeben.', '');
INSERT INTO `internal_resources` VALUES ('SEARCH_REPL', 'DE', 'Objektnamen Suchen und Ersetzen.', '');
INSERT INTO `internal_resources` VALUES ('SOURCE_NODE', 'DE', 'Quellknoten', '');
INSERT INTO `internal_resources` VALUES ('THEREISQUESTION', 'DE', 'Aktion bestÃƒÂ¤tigen', '');
INSERT INTO `internal_resources` VALUES ('WEBSITEPRV', 'DE', 'Entwicklungswebsite', '');
INSERT INTO `internal_resources` VALUES ('WZ_IMP_SELCL', 'DE', 'Bitte wÃƒÂ¤hlen Sie den Knoten in den Sie importieren mÃƒÂ¶chten.', '');
INSERT INTO `internal_resources` VALUES ('CR_VR', 'DE', 'Create variation', '');
INSERT INTO `internal_resources` VALUES ('CRCLV_MES', 'DE', 'The cluster does not exists in this variation. Do you want to create it?', '');
INSERT INTO `internal_resources` VALUES ('DESIGNS', 'EN', 'Layout Designs', '');
INSERT INTO `internal_resources` VALUES ('M_ESERVICES', 'EN', 'E-Services', '');
INSERT INTO `internal_resources` VALUES ('CONTACTS', 'EN', 'Contacts', '');
INSERT INTO `internal_resources` VALUES ('SHOP', 'EN', 'Shop', '');
INSERT INTO `internal_resources` VALUES ('NEWSLETTER', 'EN', 'Newsletter', '');
INSERT INTO `internal_resources` VALUES ('MAILINGS', 'EN', 'Mailings', '');
INSERT INTO `internal_resources` VALUES ('MENU_DESIGNS', 'EN', 'Menu Designs', '');
INSERT INTO `internal_resources` VALUES ('NOMENU', 'EN', 'No automatic menu drawing', '');
INSERT INTO `internal_resources` VALUES ('SEL_MENU', 'EN', 'Select Menu Layout', '');
INSERT INTO `internal_resources` VALUES ('SEL_MENUSTYLE', 'EN', 'Adjust Menu Type', '');
INSERT INTO `internal_resources` VALUES ('ACTIVECOLOR', 'EN', 'Active Background-Color', '');
INSERT INTO `internal_resources` VALUES ('ACTIVETCOLOR', 'EN', 'Active Text-Color', '');
INSERT INTO `internal_resources` VALUES ('ACTIVETSCOLOR', 'EN', 'Active SubText-Color', '');
INSERT INTO `internal_resources` VALUES ('INACTIVECOLOR', 'EN', 'Inactive Background-Color', '');
INSERT INTO `internal_resources` VALUES ('INACTIVETCOLOR', 'EN', 'Inactive Text-Color', '');
INSERT INTO `internal_resources` VALUES ('INSTALL_PGN', 'EN', 'Install a plugin', '');
INSERT INTO `internal_resources` VALUES ('NACTIVE', 'EN', 'Not active', '');
INSERT INTO `internal_resources` VALUES ('BACTIVE', 'EN', 'Active', '');
INSERT INTO `internal_resources` VALUES ('SP_MENUDESCRIPTION', 'EN', 'Page Description (for sitemap...)', '');
INSERT INTO `internal_resources` VALUES ('URL', 'EN', 'URL', '');
INSERT INTO `internal_resources` VALUES ('ACKEY', 'EN', 'Access Key', '');
INSERT INTO `internal_resources` VALUES ('ACCESS_KEY', 'EN', 'Access Key', '');
INSERT INTO `internal_resources` VALUES ('DESIGNS', 'DE', 'Layout Designs', '');
INSERT INTO `internal_resources` VALUES ('M_ESERVICES', 'DE', 'E-Services', '');
INSERT INTO `internal_resources` VALUES ('CONTACTS', 'DE', 'Contacts', '');
INSERT INTO `internal_resources` VALUES ('SHOP', 'DE', 'Shop', '');
INSERT INTO `internal_resources` VALUES ('NEWSLETTER', 'DE', 'Newsletter', '');
INSERT INTO `internal_resources` VALUES ('MAILINGS', 'DE', 'Mailings', '');
INSERT INTO `internal_resources` VALUES ('MENU_DESIGNS', 'DE', 'Menu Designs', '');
INSERT INTO `internal_resources` VALUES ('NOMENU', 'DE', 'No automatic menu drawing', '');
INSERT INTO `internal_resources` VALUES ('SEL_MENU', 'DE', 'Select Menu Layout', '');
INSERT INTO `internal_resources` VALUES ('SEL_MENUSTYLE', 'DE', 'Adjust Menu Type', '');
INSERT INTO `internal_resources` VALUES ('NACTIVE', 'DE', 'Not active', '');
INSERT INTO `internal_resources` VALUES ('BACTIVE', 'DE', 'Active', '');
INSERT INTO `internal_resources` VALUES ('CONTACTS_OVERVIEW', 'DE', 'Contacts Overview', '');
INSERT INTO `internal_resources` VALUES ('FIRSTNAME', 'DE', 'Firstname', '');
INSERT INTO `internal_resources` VALUES ('EMAIL', 'DE', 'E-Mail-Address', '');
INSERT INTO `internal_resources` VALUES ('CITY', 'DE', 'City', '');
INSERT INTO `internal_resources` VALUES ('LAST_MOD', 'DE', 'Last Modified', '');
INSERT INTO `internal_resources` VALUES ('INSTALL_PGN', 'DE', 'Install a plugin', '');
INSERT INTO `internal_resources` VALUES ('ACKEY', 'DE', 'Access Key', '');
INSERT INTO `internal_resources` VALUES ('EXPL_SEL_CLT', 'DE', 'Please Select a cluster-template.', '');
INSERT INTO `internal_resources` VALUES ('SEL_CLT', 'DE', 'Select Cluster-Template', '');
INSERT INTO `internal_resources` VALUES ('LATEST_CREATED', 'EN', 'Article Date, latest first', '');
INSERT INTO `internal_resources` VALUES ('OLDEST_CREATED', 'EN', 'Article Date, oldest first', '');
INSERT INTO `internal_resources` VALUES ('POS_ASC', 'EN', 'Position ascending', '');
INSERT INTO `internal_resources` VALUES ('POS_DESC', 'EN', 'Position descending', '');
INSERT INTO `internal_resources` VALUES ('OUTPUTPAGE', 'EN', 'Output Page', '');
INSERT INTO `internal_resources` VALUES ('ART_URL', 'EN', 'Article URL', '');
INSERT INTO `internal_resources` VALUES ('URL_DISP_LATER', 'EN', 'The URL will be displayed after the linked template was launched.', '');
INSERT INTO `internal_resources` VALUES ('CHNLAUNCHEDERR', 'EN', 'An error occured while launching the channel.', '');
INSERT INTO `internal_resources` VALUES ('DISP_DOC', 'EN', 'Display Documentation', '');
INSERT INTO `internal_resources` VALUES ('CONTACTS_OVERVIEW', 'EN', 'Contacts Overview', '');
INSERT INTO `internal_resources` VALUES ('FIRSTNAME', 'EN', 'Firstname', '');
INSERT INTO `internal_resources` VALUES ('EMAIL', 'EN', 'E-Mail-Address', '');
INSERT INTO `internal_resources` VALUES ('CITY', 'EN', 'City', '');
INSERT INTO `internal_resources` VALUES ('LAST_MOD', 'EN', 'Last Modified', '');
INSERT INTO `internal_resources` VALUES ('NO_PREVIEW', 'EN', 'No preview available.', '');
INSERT INTO `internal_resources` VALUES ('FLASHGAL', 'EN', 'Flash Gallery', '');
INSERT INTO `internal_resources` VALUES ('CONFIG_SHOP', 'EN', 'Configure Shop', '');
INSERT INTO `internal_resources` VALUES ('CATALOG', 'EN', 'Catalog', '');
INSERT INTO `internal_resources` VALUES ('TAXES', 'EN', 'Tax Setup', '');
INSERT INTO `internal_resources` VALUES ('SHOPCAT', 'EN', 'Shop Categories', '');
INSERT INTO `internal_resources` VALUES ('SHOPOVERVIEW', 'EN', 'Shop Categoy Overview', '');
INSERT INTO `internal_resources` VALUES ('NEW_PRODUCT', 'EN', 'New Product', '');
INSERT INTO `internal_resources` VALUES ('NEW_CATEGORY', 'EN', 'New Category', '');
INSERT INTO `internal_resources` VALUES ('EDIT_CAT', 'EN', 'Edit Category', '');
INSERT INTO `internal_resources` VALUES ('AVAIL_SUBCAT', 'EN', 'Subcategories in this category', '');
INSERT INTO `internal_resources` VALUES ('DEL_CAT', 'EN', 'Delete Category', '');
INSERT INTO `internal_resources` VALUES ('PARENT_CAT', 'EN', 'Parent Category', '');
INSERT INTO `internal_resources` VALUES ('DISPTITLE', 'EN', 'Display Name', '');
INSERT INTO `internal_resources` VALUES ('SEL_IMAGE', 'EN', 'Select image', '');
INSERT INTO `internal_resources` VALUES ('HEADER', 'EN', 'Header', '');
INSERT INTO `internal_resources` VALUES ('FOOTER', 'EN', 'Footer', '');
INSERT INTO `internal_resources` VALUES ('TAX', 'EN', 'Tax', '');
INSERT INTO `internal_resources` VALUES ('EDIT_TAX', 'EN', 'Edit tax', '');
INSERT INTO `internal_resources` VALUES ('NEWSLETTERS', 'EN', 'Newsletters', '');
INSERT INTO `internal_resources` VALUES ('SUBSCRIPTIONS', 'EN', 'Subscriptions', '');
INSERT INTO `internal_resources` VALUES ('NO_ARCHIVE', 'EN', 'The file you uploaded is not an zip-archive or your browser does not send the file correct!', '');
INSERT INTO `internal_resources` VALUES ('ARCHEMPTY', 'EN', 'The archive seems to empty or could not be unzipped successfully.', '');
INSERT INTO `internal_resources` VALUES ('IS_SHOP_CAT_CLASS', 'EN', 'Enable for Use as Shop Category Template', '');
INSERT INTO `internal_resources` VALUES ('IS_SHOP_CAT_PRODUCT', 'EN', 'Enable for Use as Shop Product Template', '');
INSERT INTO `internal_resources` VALUES ('ADTEXTAS', 'EN', 'AD-Javascript (copy from Google Adsense Homepage)', '');
INSERT INTO `internal_resources` VALUES ('CHOOSELOWLIGHT', 'EN', 'Choose lowlight image', '');
INSERT INTO `internal_resources` VALUES ('CHOOSEHIGHLIGHT', 'EN', 'Choose highlight image', '');
INSERT INTO `internal_resources` VALUES ('SNIP_TYPE', 'EN', 'Sniplet Type', '');
INSERT INTO `internal_resources` VALUES ('SNIP_CODE', 'EN', 'Sniplet-Code', '');
INSERT INTO `internal_resources` VALUES ('SECEDIT', 'EN', 'Please note: Due to security concerns, the comination " will always be replaced with ".', '');
INSERT INTO `internal_resources` VALUES ('BODY', 'EN', 'Body', '');
INSERT INTO `internal_resources` VALUES ('IMAGETEASER', 'EN', 'Only display Image', '');
INSERT INTO `internal_resources` VALUES ('INTPAGE', 'EN', 'Internal Page', '');
INSERT INTO `internal_resources` VALUES ('RESOLVECP', 'EN', 'Display all childs', '');
INSERT INTO `internal_resources` VALUES ('HREFTOOR', 'EN', 'WWW (overrides internal)', '');
INSERT INTO `internal_resources` VALUES ('LINKTEXT', 'EN', 'Link Text (optional)', '');
INSERT INTO `internal_resources` VALUES ('CONFIGSTRING', 'EN', 'Configuration String (optional)', '');

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `internal_resources_languages`
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
-- Daten für Tabelle `internal_resources_languages`
-- 

INSERT INTO `internal_resources_languages` VALUES ('EN', 'English', '0x0409', 'B8F2846E-CE36-11D0-AC83-00C04FD97575', '6,0,0,0');
INSERT INTO `internal_resources_languages` VALUES ('DE', 'Deutsch', '0x0407', '1D87F5B5-05F1-11d2-AD7C-0000F8799342', '1,0,0,0');
INSERT INTO `internal_resources_languages` VALUES ('IT', 'Italian', '0x0410', '1D87F5B6-05F1-11d2-AD7C-0000F8799342', '1,0,0,0');
INSERT INTO `internal_resources_languages` VALUES ('MND', 'Chineese (Mandarin)', '', '', '');
INSERT INTO `internal_resources_languages` VALUES ('PL', 'Polish', '12', '32', '65');
INSERT INTO `internal_resources_languages` VALUES ('FR', 'French', '', '', '');

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `log`
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
-- Daten für Tabelle `log`
-- 

INSERT INTO `log` VALUES (100082, 'LAUNCH', 'C:Web\nxhp/cms/plugin/teaser/d could not be found for launch.', 1, NULL, NULL, '2007-01-14 12:16:49');
INSERT INTO `log` VALUES (100083, 'LAUNCH', 'C:Web\nxhp/www/sys/d could not be deleted.', 1, NULL, NULL, '2007-01-14 12:17:05');
INSERT INTO `log` VALUES (100084, 'LAUNCH', 'C:Web\nxhp/www/images/101465.gif could not be deleted.', 1, NULL, NULL, '2007-01-14 18:56:07');
INSERT INTO `log` VALUES (100085, 'LAUNCH', 'C:Web\nxhp/www/images/t101465.gif could not be deleted.', 1, NULL, NULL, '2007-01-14 18:56:07');
INSERT INTO `log` VALUES (100086, 'LAUNCH', 'C:Web\nxhp/www/start.php could not be deleted.', 1, NULL, NULL, '2007-01-14 19:24:22');
INSERT INTO `log` VALUES (100087, 'LAUNCH', 'C:Web\nxhp/www/images/101507.jpg could not be deleted.', 1, NULL, NULL, '2007-01-14 19:24:22');
INSERT INTO `log` VALUES (100088, 'LAUNCH', 'C:Web\nxhp/www/images/t101507.jpg could not be deleted.', 1, NULL, NULL, '2007-01-14 19:24:22');
INSERT INTO `log` VALUES (100089, 'LAUNCH', 'C:Web\nxhp/www/en/index.php could not be deleted.', 1, NULL, NULL, '2007-01-14 19:24:22');
INSERT INTO `log` VALUES (100090, 'LAUNCH', 'C:Web\nxhp/www/en/index.html could not be deleted.', 1, NULL, NULL, '2007-01-14 19:24:22');
INSERT INTO `log` VALUES (100091, 'LAUNCH', 'C:Web\nxhp/www/en/start/index.php could not be deleted.', 1, NULL, NULL, '2007-01-14 19:24:32');
INSERT INTO `log` VALUES (100092, 'LAUNCH', 'C:Web\nxhp/www/en/start/index.html could not be deleted.', 1, NULL, NULL, '2007-01-14 19:24:32');
INSERT INTO `log` VALUES (100093, 'LAUNCH', 'C:Web\nxhp/www/en/start/index.html could not be deleted.', 1, NULL, NULL, '2007-01-14 19:24:32');
INSERT INTO `log` VALUES (100094, 'LAUNCH', 'C:Web\nxhp/www/en/start/index.php could not be deleted.', 1, NULL, NULL, '2007-01-14 19:26:31');
INSERT INTO `log` VALUES (100095, 'LAUNCH', 'C:Web\nxhp/www/en/start/index.html could not be deleted.', 1, NULL, NULL, '2007-01-14 19:26:32');
INSERT INTO `log` VALUES (100096, 'LAUNCH', 'C:Web\nxhp/www/en/start/index.php could not be deleted.', 1, NULL, NULL, '2007-01-14 19:27:46');
INSERT INTO `log` VALUES (100097, 'LAUNCH', 'C:Web\nxhp/www/en/start/index.html could not be deleted.', 1, NULL, NULL, '2007-01-14 19:27:46');
INSERT INTO `log` VALUES (100098, 'LAUNCH', 'C:Web\nxhp/www/en/start/index.php could not be deleted.', 1, NULL, NULL, '2007-01-14 19:30:50');
INSERT INTO `log` VALUES (100099, 'LAUNCH', 'C:Web\nxhp/www/en/start/index.html could not be deleted.', 1, NULL, NULL, '2007-01-14 19:30:50');
INSERT INTO `log` VALUES (100100, 'LAUNCH', 'C:Web\nxhp/www/en/start/index.php could not be deleted.', 1, NULL, NULL, '2007-01-14 19:32:27');
INSERT INTO `log` VALUES (100101, 'LAUNCH', 'C:Web\nxhp/www/en/start/index.html could not be deleted.', 1, NULL, NULL, '2007-01-14 19:32:28');
INSERT INTO `log` VALUES (100102, 'AUTH', 'Login failed for user Administrator with IP 127.0.0.1', 0, NULL, NULL, '2007-01-15 18:35:10');
INSERT INTO `log` VALUES (100103, 'LAUNCH', 'C:Web\nxhp/www/images/101642FILENAME1.jpg could not be deleted.', 1, NULL, NULL, '2007-01-15 19:52:55');
INSERT INTO `log` VALUES (100104, 'LAUNCH', 'C:Web\nxhp/www/images/t101642FILENAME1.jpg could not be deleted.', 1, NULL, NULL, '2007-01-15 19:52:55');
INSERT INTO `log` VALUES (100105, 'LAUNCH', 'C:Web\nxhp/www/images/101642FILENAME2.jpg could not be deleted.', 1, NULL, NULL, '2007-01-15 19:52:55');
INSERT INTO `log` VALUES (100106, 'LAUNCH', 'C:Web\nxhp/www/images/t101642FILENAME2.jpg could not be deleted.', 1, NULL, NULL, '2007-01-15 19:52:55');
INSERT INTO `log` VALUES (100107, 'LAUNCH', 'C:Web\nxhp/www/images/101645FILENAME1.jpg could not be deleted.', 1, NULL, NULL, '2007-01-15 19:52:57');
INSERT INTO `log` VALUES (100108, 'LAUNCH', 'C:Web\nxhp/www/images/t101645FILENAME1.jpg could not be deleted.', 1, NULL, NULL, '2007-01-15 19:52:57');
INSERT INTO `log` VALUES (100109, 'LAUNCH', 'C:Web\nxhp/www/images/101645FILENAME2.jpg could not be deleted.', 1, NULL, NULL, '2007-01-15 19:52:57');
INSERT INTO `log` VALUES (100110, 'LAUNCH', 'C:Web\nxhp/www/images/t101645FILENAME2.jpg could not be deleted.', 1, NULL, NULL, '2007-01-15 19:52:57');
INSERT INTO `log` VALUES (100111, 'LAUNCH', 'C:Web\nxhp/www/images/101654FILENAME1.jpg could not be deleted.', 1, NULL, NULL, '2007-01-15 19:53:37');
INSERT INTO `log` VALUES (100112, 'LAUNCH', 'C:Web\nxhp/www/images/t101654FILENAME1.jpg could not be deleted.', 1, NULL, NULL, '2007-01-15 19:53:37');
INSERT INTO `log` VALUES (100113, 'LAUNCH', 'C:Web\nxhp/www/images/101654FILENAME2.jpg could not be deleted.', 1, NULL, NULL, '2007-01-15 19:53:37');
INSERT INTO `log` VALUES (100114, 'LAUNCH', 'C:Web\nxhp/www/images/t101654FILENAME2.jpg could not be deleted.', 1, NULL, NULL, '2007-01-15 19:53:37');
INSERT INTO `log` VALUES (100115, 'LAUNCH', 'C:Web\nxhp/www/images/101663FILENAME1.jpg could not be deleted.', 1, NULL, NULL, '2007-01-15 19:54:11');
INSERT INTO `log` VALUES (100116, 'LAUNCH', 'C:Web\nxhp/www/images/t101663FILENAME1.jpg could not be deleted.', 1, NULL, NULL, '2007-01-15 19:54:11');
INSERT INTO `log` VALUES (100117, 'LAUNCH', 'C:Web\nxhp/www/images/101663FILENAME2.jpg could not be deleted.', 1, NULL, NULL, '2007-01-15 19:54:11');
INSERT INTO `log` VALUES (100118, 'LAUNCH', 'C:Web\nxhp/www/images/t101663FILENAME2.jpg could not be deleted.', 1, NULL, NULL, '2007-01-15 19:54:11');
INSERT INTO `log` VALUES (100119, 'LAUNCH', 'C:Web\nxhp/www/en/start/index.php could not be deleted.', 1, NULL, NULL, '2007-01-15 20:04:58');
INSERT INTO `log` VALUES (100120, 'LAUNCH', 'C:Web\nxhp/www/en/start/index.html could not be deleted.', 1, NULL, NULL, '2007-01-15 20:04:59');
INSERT INTO `log` VALUES (100121, 'LAUNCH', 'C:Web\nxhp/www/en/index.html could not be deleted.', 1, NULL, NULL, '2007-01-15 20:05:03');
INSERT INTO `log` VALUES (100122, 'LAUNCH', 'C:Web\nxhp/www/contact2.php could not be deleted.', 1, NULL, NULL, '2007-01-15 20:05:04');
INSERT INTO `log` VALUES (100123, 'LAUNCH', 'C:Web\nxhp/www/en/index.html could not be deleted.', 1, NULL, NULL, '2007-01-15 20:05:04');
INSERT INTO `log` VALUES (100124, 'LAUNCH', 'C:Web\nxhp/www/en/index.html could not be deleted.', 1, NULL, NULL, '2007-01-15 20:05:04');
INSERT INTO `log` VALUES (100125, 'LAUNCH', 'C:Web\nxhp/www/en/index.html could not be deleted.', 1, NULL, NULL, '2007-01-15 20:05:04');
INSERT INTO `log` VALUES (100126, 'LAUNCH', 'C:Web\nxhp/www/en/servicepages/index.php could not be deleted.', 1, NULL, NULL, '2007-01-15 20:06:24');
INSERT INTO `log` VALUES (100127, 'LAUNCH', 'C:Web\nxhp/www/en/servicepages/index.html could not be deleted.', 1, NULL, NULL, '2007-01-15 20:06:24');
INSERT INTO `log` VALUES (100128, 'LAUNCH', 'C:Web\nxhp/www/en/servicepages/contact/index.php could not be deleted.', 1, NULL, NULL, '2007-01-15 20:06:24');
INSERT INTO `log` VALUES (100129, 'LAUNCH', 'C:Web\nxhp/www/en/servicepages/contact/index.html could not be deleted.', 1, NULL, NULL, '2007-01-15 20:06:24');
INSERT INTO `log` VALUES (100130, 'LAUNCH', 'C:Web\nxhp/www/en/servicepages/contact/index.html could not be deleted.', 1, NULL, NULL, '2007-01-15 20:06:25');
INSERT INTO `log` VALUES (100131, 'LAUNCH', 'C:Web\nxhp/www/en/servicepages/sitemap/index.php could not be deleted.', 1, NULL, NULL, '2007-01-15 20:06:25');
INSERT INTO `log` VALUES (100132, 'LAUNCH', 'C:Web\nxhp/www/en/servicepages/sitemap/index.html could not be deleted.', 1, NULL, NULL, '2007-01-15 20:06:25');
INSERT INTO `log` VALUES (100133, 'LAUNCH', 'C:Web\nxhp/www/en/servicepages/sitemap/index.html could not be deleted.', 1, NULL, NULL, '2007-01-15 20:06:25');
INSERT INTO `log` VALUES (100134, 'LAUNCH', 'C:Web\nxhp/www/en/servicepages/disclaimer/index.php could not be deleted.', 1, NULL, NULL, '2007-01-15 20:06:25');
INSERT INTO `log` VALUES (100135, 'LAUNCH', 'C:Web\nxhp/www/en/servicepages/disclaimer/index.html could not be deleted.', 1, NULL, NULL, '2007-01-15 20:06:25');
INSERT INTO `log` VALUES (100136, 'LAUNCH', 'C:Web\nxhp/www/en/servicepages/disclaimer/index.html could not be deleted.', 1, NULL, NULL, '2007-01-15 20:06:26');
INSERT INTO `log` VALUES (100137, 'LAUNCH', 'C:Web\nxhp/www/en/start/index.php could not be deleted.', 1, NULL, NULL, '2007-01-15 20:06:26');
INSERT INTO `log` VALUES (100138, 'LAUNCH', 'C:Web\nxhp/www/en/start/index.html could not be deleted.', 1, NULL, NULL, '2007-01-15 20:06:27');
INSERT INTO `log` VALUES (100139, 'LAUNCH', 'C:Web\nxhp/www/en/servicepages/index.html could not be deleted.', 1, NULL, NULL, '2007-01-15 20:07:37');
INSERT INTO `log` VALUES (100140, 'LAUNCH', 'C:Web\nxhp/www/en/servicepages/contact/index.php could not be deleted.', 1, NULL, NULL, '2007-01-15 20:07:38');
INSERT INTO `log` VALUES (100141, 'LAUNCH', 'C:Web\nxhp/www/en/servicepages/contact/index.html could not be deleted.', 1, NULL, NULL, '2007-01-15 20:07:38');
INSERT INTO `log` VALUES (100142, 'LAUNCH', 'C:Web\nxhp/www/en/servicepages/sitemap/index.php could not be deleted.', 1, NULL, NULL, '2007-01-15 20:07:38');
INSERT INTO `log` VALUES (100143, 'LAUNCH', 'C:Web\nxhp/www/en/servicepages/sitemap/index.html could not be deleted.', 1, NULL, NULL, '2007-01-15 20:07:39');
INSERT INTO `log` VALUES (100144, 'LAUNCH', 'C:Web\nxhp/www/en/servicepages/disclaimer/index.php could not be deleted.', 1, NULL, NULL, '2007-01-15 20:07:39');
INSERT INTO `log` VALUES (100145, 'LAUNCH', 'C:Web\nxhp/www/en/servicepages/disclaimer/index.html could not be deleted.', 1, NULL, NULL, '2007-01-15 20:07:39');
INSERT INTO `log` VALUES (100146, 'LAUNCH', 'C:Web\nxhp/www/en/start/index.php could not be deleted.', 1, NULL, NULL, '2007-01-15 20:07:40');
INSERT INTO `log` VALUES (100147, 'LAUNCH', 'C:Web\nxhp/www/en/start/index.html could not be deleted.', 1, NULL, NULL, '2007-01-15 20:07:40');
INSERT INTO `log` VALUES (100148, 'LAUNCH', 'C:Web\nxhp/www/images/101911.jpg could not be deleted.', 1, NULL, NULL, '2007-01-16 22:28:05');
INSERT INTO `log` VALUES (100149, 'LAUNCH', 'C:Web\nxhp/www/images/t101911.jpg could not be deleted.', 1, NULL, NULL, '2007-01-16 22:28:05');
INSERT INTO `log` VALUES (100150, 'LAUNCH', 'C:Web\nxhp/www/images/101914.jpg could not be deleted.', 1, NULL, NULL, '2007-01-16 22:28:06');
INSERT INTO `log` VALUES (100151, 'LAUNCH', 'C:Web\nxhp/www/images/t101914.jpg could not be deleted.', 1, NULL, NULL, '2007-01-16 22:28:06');
INSERT INTO `log` VALUES (100152, 'LAUNCH', 'C:Web\nxhp/www/images/101917.jpg could not be deleted.', 1, NULL, NULL, '2007-01-16 22:28:08');
INSERT INTO `log` VALUES (100153, 'LAUNCH', 'C:Web\nxhp/www/images/t101917.jpg could not be deleted.', 1, NULL, NULL, '2007-01-16 22:28:08');
INSERT INTO `log` VALUES (100154, 'LAUNCH', 'C:Web\nxhp/www/images/101920.jpg could not be deleted.', 1, NULL, NULL, '2007-01-16 22:28:12');
INSERT INTO `log` VALUES (100155, 'LAUNCH', 'C:Web\nxhp/www/images/t101920.jpg could not be deleted.', 1, NULL, NULL, '2007-01-16 22:28:12');
INSERT INTO `log` VALUES (100156, 'LAUNCH', 'C:Web\nxhp/www/images/101923.jpg could not be deleted.', 1, NULL, NULL, '2007-01-16 22:28:15');
INSERT INTO `log` VALUES (100157, 'LAUNCH', 'C:Web\nxhp/www/images/t101923.jpg could not be deleted.', 1, NULL, NULL, '2007-01-16 22:28:15');
INSERT INTO `log` VALUES (100158, 'LAUNCH', 'C:Web\nxhp/www/en/start/index.php could not be deleted.', 1, NULL, NULL, '2007-01-16 22:28:37');
INSERT INTO `log` VALUES (100159, 'LAUNCH', 'C:Web\nxhp/www/en/start/index.html could not be deleted.', 1, NULL, NULL, '2007-01-16 22:28:37');
INSERT INTO `log` VALUES (100160, 'LAUNCH', 'C:Web\nxhp/www/overview.php could not be deleted.', 1, NULL, NULL, '2007-01-16 22:28:37');
INSERT INTO `log` VALUES (100161, 'LAUNCH', 'C:Web\nxhp/www/en/index.html could not be deleted.', 1, NULL, NULL, '2007-01-16 22:28:37');
INSERT INTO `log` VALUES (100162, 'LAUNCH', 'C:Web\nxhp/www/en/index.html could not be deleted.', 1, NULL, NULL, '2007-01-16 22:28:38');
INSERT INTO `log` VALUES (100163, 'LAUNCH', 'C:Web\nxhp/www/en/index.html could not be deleted.', 1, NULL, NULL, '2007-01-16 22:28:38');
INSERT INTO `log` VALUES (100164, 'LAUNCH', 'C:Web\nxhp/www/en/index.html could not be deleted.', 1, NULL, NULL, '2007-01-16 22:28:38');
INSERT INTO `log` VALUES (100165, 'LAUNCH', 'C:Web\nxhp/www/en/start/index.php could not be deleted.', 1, NULL, NULL, '2007-01-16 22:29:45');
INSERT INTO `log` VALUES (100166, 'LAUNCH', 'C:Web\nxhp/www/en/start/index.html could not be deleted.', 1, NULL, NULL, '2007-01-16 22:29:46');
INSERT INTO `log` VALUES (100167, 'LAUNCH', 'C:Web\nxhp/www/en/start/evaluation/index.php could not be deleted.', 1, NULL, NULL, '2007-01-16 22:29:46');
INSERT INTO `log` VALUES (100168, 'LAUNCH', 'C:Web\nxhp/www/en/start/evaluation/index.html could not be deleted.', 1, NULL, NULL, '2007-01-16 22:29:46');
INSERT INTO `log` VALUES (100169, 'LAUNCH', 'C:Web\nxhp/www/en/start/evaluation/index.html could not be deleted.', 1, NULL, NULL, '2007-01-16 22:29:47');
INSERT INTO `log` VALUES (100170, 'LAUNCH', 'C:Web\nxhp/www/en/start/information_center/index.php could not be deleted.', 1, NULL, NULL, '2007-01-16 22:29:47');
INSERT INTO `log` VALUES (100171, 'LAUNCH', 'C:Web\nxhp/www/en/start/information_center/index.html could not be deleted.', 1, NULL, NULL, '2007-01-16 22:29:47');
INSERT INTO `log` VALUES (100172, 'LAUNCH', 'C:Web\nxhp/www/en/start/information_center/index.html could not be deleted.', 1, NULL, NULL, '2007-01-16 22:29:47');
INSERT INTO `log` VALUES (100173, 'LAUNCH', 'C:Web\nxhp/www/en/start/developer_ressources/index.php could not be deleted.', 1, NULL, NULL, '2007-01-16 22:29:47');
INSERT INTO `log` VALUES (100174, 'LAUNCH', 'C:Web\nxhp/www/en/start/developer_ressources/index.html could not be deleted.', 1, NULL, NULL, '2007-01-16 22:29:47');
INSERT INTO `log` VALUES (100175, 'LAUNCH', 'C:Web\nxhp/www/en/start/developer_ressources/index.html could not be deleted.', 1, NULL, NULL, '2007-01-16 22:29:48');
INSERT INTO `log` VALUES (100176, 'LAUNCH', 'C:Web\nxhp/www/en/start/php_classes/index.php could not be deleted.', 1, NULL, NULL, '2007-01-16 22:29:48');
INSERT INTO `log` VALUES (100177, 'LAUNCH', 'C:Web\nxhp/www/en/start/php_classes/index.html could not be deleted.', 1, NULL, NULL, '2007-01-16 22:29:48');
INSERT INTO `log` VALUES (100178, 'LAUNCH', 'C:Web\nxhp/www/en/start/php_classes/index.html could not be deleted.', 1, NULL, NULL, '2007-01-16 22:29:49');
INSERT INTO `log` VALUES (100179, 'LAUNCH', 'C:Web\nxhp/www/en/start/index.php could not be deleted.', 1, NULL, NULL, '2007-01-16 22:31:15');
INSERT INTO `log` VALUES (100180, 'LAUNCH', 'C:Web\nxhp/www/en/start/index.html could not be deleted.', 1, NULL, NULL, '2007-01-16 22:31:16');
INSERT INTO `log` VALUES (100181, 'LAUNCH', 'C:Web\nxhp/www/en/start/index.html could not be deleted.', 1, NULL, NULL, '2007-01-16 22:33:12');
INSERT INTO `log` VALUES (100182, 'LAUNCH', 'C:Web\nxhp/www/en/start/evaluation/index.html could not be deleted.', 1, NULL, NULL, '2007-01-16 22:33:13');
INSERT INTO `log` VALUES (100183, 'LAUNCH', 'C:Web\nxhp/www/en/start/information_center/index.html could not be deleted.', 1, NULL, NULL, '2007-01-16 22:33:13');
INSERT INTO `log` VALUES (100184, 'LAUNCH', 'C:Web\nxhp/www/en/start/developer_ressources/index.html could not be deleted.', 1, NULL, NULL, '2007-01-16 22:33:14');
INSERT INTO `log` VALUES (100185, 'LAUNCH', 'C:Web\nxhp/www/en/start/php_classes/index.html could not be deleted.', 1, NULL, NULL, '2007-01-16 22:33:14');
INSERT INTO `log` VALUES (100186, 'LAUNCH', 'C:Web\nxhp/www/en/start/index.php could not be deleted.', 1, NULL, NULL, '2007-01-16 22:33:18');
INSERT INTO `log` VALUES (100187, 'LAUNCH', 'C:Web\nxhp/www/en/start/index.html could not be deleted.', 1, NULL, NULL, '2007-01-16 22:33:18');
INSERT INTO `log` VALUES (100188, 'LAUNCH', 'C:Web\nxhp/www/en/start/evaluation/index.php could not be deleted.', 1, NULL, NULL, '2007-01-16 22:33:18');
INSERT INTO `log` VALUES (100189, 'LAUNCH', 'C:Web\nxhp/www/en/start/evaluation/index.html could not be deleted.', 1, NULL, NULL, '2007-01-16 22:33:19');
INSERT INTO `log` VALUES (100190, 'LAUNCH', 'C:Web\nxhp/www/en/start/information_center/index.php could not be deleted.', 1, NULL, NULL, '2007-01-16 22:33:19');
INSERT INTO `log` VALUES (100191, 'LAUNCH', 'C:Web\nxhp/www/en/start/information_center/index.html could not be deleted.', 1, NULL, NULL, '2007-01-16 22:33:20');
INSERT INTO `log` VALUES (100192, 'LAUNCH', 'C:Web\nxhp/www/en/start/developer_ressources/index.php could not be deleted.', 1, NULL, NULL, '2007-01-16 22:33:20');
INSERT INTO `log` VALUES (100193, 'LAUNCH', 'C:Web\nxhp/www/en/start/developer_ressources/index.html could not be deleted.', 1, NULL, NULL, '2007-01-16 22:33:20');
INSERT INTO `log` VALUES (100194, 'LAUNCH', 'C:Web\nxhp/www/en/start/php_classes/index.php could not be deleted.', 1, NULL, NULL, '2007-01-16 22:33:20');
INSERT INTO `log` VALUES (100195, 'LAUNCH', 'C:Web\nxhp/www/en/start/php_classes/index.html could not be deleted.', 1, NULL, NULL, '2007-01-16 22:33:21');
INSERT INTO `log` VALUES (100196, 'LAUNCH', 'C:Web\nxhp/www/en/start/index.php could not be deleted.', 1, NULL, NULL, '2007-01-16 22:34:37');
INSERT INTO `log` VALUES (100197, 'LAUNCH', 'C:Web\nxhp/www/en/start/index.html could not be deleted.', 1, NULL, NULL, '2007-01-16 22:34:38');
INSERT INTO `log` VALUES (100198, 'LAUNCH', 'C:Web\nxhp/www/en/start/evaluation/index.php could not be deleted.', 1, NULL, NULL, '2007-01-16 22:34:38');
INSERT INTO `log` VALUES (100199, 'LAUNCH', 'C:Web\nxhp/www/en/start/evaluation/index.html could not be deleted.', 1, NULL, NULL, '2007-01-16 22:34:39');
INSERT INTO `log` VALUES (100200, 'LAUNCH', 'C:Web\nxhp/www/en/start/information_center/index.php could not be deleted.', 1, NULL, NULL, '2007-01-16 22:34:39');
INSERT INTO `log` VALUES (100201, 'LAUNCH', 'C:Web\nxhp/www/en/start/information_center/index.html could not be deleted.', 1, NULL, NULL, '2007-01-16 22:34:40');
INSERT INTO `log` VALUES (100202, 'LAUNCH', 'C:Web\nxhp/www/en/start/developer_ressources/index.php could not be deleted.', 1, NULL, NULL, '2007-01-16 22:34:40');
INSERT INTO `log` VALUES (100203, 'LAUNCH', 'C:Web\nxhp/www/en/start/developer_ressources/index.html could not be deleted.', 1, NULL, NULL, '2007-01-16 22:34:40');
INSERT INTO `log` VALUES (100204, 'LAUNCH', 'C:Web\nxhp/www/en/start/php_classes/index.php could not be deleted.', 1, NULL, NULL, '2007-01-16 22:34:40');
INSERT INTO `log` VALUES (100205, 'LAUNCH', 'C:Web\nxhp/www/en/start/php_classes/index.html could not be deleted.', 1, NULL, NULL, '2007-01-16 22:34:41');
INSERT INTO `log` VALUES (100206, 'LAUNCH', 'C:Web\nxhp/www/en/servicepages/index.html could not be deleted.', 1, NULL, NULL, '2007-01-16 22:36:50');
INSERT INTO `log` VALUES (100207, 'LAUNCH', 'C:Web\nxhp/www/en/servicepages/contact/index.php could not be deleted.', 1, NULL, NULL, '2007-01-16 22:36:50');
INSERT INTO `log` VALUES (100208, 'LAUNCH', 'C:Web\nxhp/www/en/servicepages/sitemap/index.php could not be deleted.', 1, NULL, NULL, '2007-01-16 22:36:50');
INSERT INTO `log` VALUES (100209, 'LAUNCH', 'C:Web\nxhp/www/en/servicepages/disclaimer/index.php could not be deleted.', 1, NULL, NULL, '2007-01-16 22:36:50');
INSERT INTO `log` VALUES (100210, 'LAUNCH', 'C:Web\nxhp/www/en/start/index.php could not be deleted.', 1, NULL, NULL, '2007-01-16 22:36:57');
INSERT INTO `log` VALUES (100211, 'LAUNCH', 'C:Web\nxhp/www/en/start/evaluation/index.php could not be deleted.', 1, NULL, NULL, '2007-01-16 22:36:57');
INSERT INTO `log` VALUES (100212, 'LAUNCH', 'C:Web\nxhp/www/en/start/information_center/index.php could not be deleted.', 1, NULL, NULL, '2007-01-16 22:36:57');
INSERT INTO `log` VALUES (100213, 'LAUNCH', 'C:Web\nxhp/www/en/start/developer_ressources/index.php could not be deleted.', 1, NULL, NULL, '2007-01-16 22:36:57');
INSERT INTO `log` VALUES (100214, 'LAUNCH', 'C:Web\nxhp/www/en/start/php_classes/index.php could not be deleted.', 1, NULL, NULL, '2007-01-16 22:36:57');
INSERT INTO `log` VALUES (100215, 'LAUNCH', 'C:Web\nxhp/www/en/servicepages/index.php could not be deleted.', 1, NULL, NULL, '2007-01-18 20:39:40');
INSERT INTO `log` VALUES (100216, 'LAUNCH', 'C:Web\nxhp/www/en/servicepages/index.html could not be deleted.', 1, NULL, NULL, '2007-01-18 20:39:40');
INSERT INTO `log` VALUES (100217, 'LAUNCH', 'C:Web\nxhp/www/en/servicepages/contact/index.php could not be deleted.', 1, NULL, NULL, '2007-01-18 20:39:40');
INSERT INTO `log` VALUES (100218, 'LAUNCH', 'C:Web\nxhp/www/en/servicepages/contact/index.html could not be deleted.', 1, NULL, NULL, '2007-01-18 20:39:40');
INSERT INTO `log` VALUES (100219, 'LAUNCH', 'C:Web\nxhp/www/en/servicepages/sitemap/index.php could not be deleted.', 1, NULL, NULL, '2007-01-18 20:39:40');
INSERT INTO `log` VALUES (100220, 'LAUNCH', 'C:Web\nxhp/www/en/servicepages/sitemap/index.html could not be deleted.', 1, NULL, NULL, '2007-01-18 20:39:40');
INSERT INTO `log` VALUES (100221, 'LAUNCH', 'C:Web\nxhp/www/en/servicepages/disclaimer/index.php could not be deleted.', 1, NULL, NULL, '2007-01-18 20:39:40');
INSERT INTO `log` VALUES (100222, 'LAUNCH', 'C:Web\nxhp/www/en/servicepages/disclaimer/index.html could not be deleted.', 1, NULL, NULL, '2007-01-18 20:39:40');
INSERT INTO `log` VALUES (100223, 'LAUNCH', 'C:Web\nxhp/www/en/start/index.php could not be deleted.', 1, NULL, NULL, '2007-01-18 20:39:41');
INSERT INTO `log` VALUES (100224, 'LAUNCH', 'C:Web\nxhp/www/en/start/index.html could not be deleted.', 1, NULL, NULL, '2007-01-18 20:39:41');
INSERT INTO `log` VALUES (100225, 'LAUNCH', 'C:Web\nxhp/www/en/start/evaluation/index.php could not be deleted.', 1, NULL, NULL, '2007-01-18 20:39:41');
INSERT INTO `log` VALUES (100226, 'LAUNCH', 'C:Web\nxhp/www/en/start/evaluation/index.html could not be deleted.', 1, NULL, NULL, '2007-01-18 20:39:41');
INSERT INTO `log` VALUES (100227, 'LAUNCH', 'C:Web\nxhp/www/en/start/information_center/index.php could not be deleted.', 1, NULL, NULL, '2007-01-18 20:39:41');
INSERT INTO `log` VALUES (100228, 'LAUNCH', 'C:Web\nxhp/www/en/start/information_center/index.html could not be deleted.', 1, NULL, NULL, '2007-01-18 20:39:41');
INSERT INTO `log` VALUES (100229, 'LAUNCH', 'C:Web\nxhp/www/en/start/developer_ressources/index.php could not be deleted.', 1, NULL, NULL, '2007-01-18 20:39:41');
INSERT INTO `log` VALUES (100230, 'LAUNCH', 'C:Web\nxhp/www/en/start/developer_ressources/index.html could not be deleted.', 1, NULL, NULL, '2007-01-18 20:39:41');
INSERT INTO `log` VALUES (100231, 'LAUNCH', 'C:Web\nxhp/www/en/start/php_classes/index.php could not be deleted.', 1, NULL, NULL, '2007-01-18 20:39:41');
INSERT INTO `log` VALUES (100232, 'LAUNCH', 'C:Web\nxhp/www/en/start/php_classes/index.html could not be deleted.', 1, NULL, NULL, '2007-01-18 20:39:41');
INSERT INTO `log` VALUES (100233, 'AUTH', 'Login failed for user Administrator with IP 127.0.0.1', 0, NULL, NULL, '2007-02-11 10:07:38');
INSERT INTO `log` VALUES (100234, 'AUTH', 'Login failed for user Administrator with IP 127.0.0.1', 0, NULL, NULL, '2007-02-12 18:54:09');
INSERT INTO `log` VALUES (100235, 'AUTH', 'Login failed for user Administrator with IP 127.0.0.1', 0, NULL, NULL, '2007-02-12 19:28:49');
INSERT INTO `log` VALUES (100236, 'LAUNCH', 'C:Web\nxhp/www/en/index.php could not be deleted.', 1, NULL, NULL, '2007-02-14 18:40:14');
INSERT INTO `log` VALUES (100237, 'LAUNCH', 'C:Web\nxhp/www/en/index.html could not be deleted.', 1, NULL, NULL, '2007-02-14 18:40:14');
INSERT INTO `log` VALUES (100238, 'LAUNCH', 'C:Web\nxhp/www/en/servicepages/index.html could not be deleted.', 1, NULL, NULL, '2007-02-14 19:23:36');
INSERT INTO `log` VALUES (100239, 'LAUNCH', 'C:Web\nxhp/www/en/servicepages/contact/index.html could not be deleted.', 1, NULL, NULL, '2007-02-14 19:23:36');
INSERT INTO `log` VALUES (100240, 'LAUNCH', 'C:Web\nxhp/www/en/servicepages/sitemap/index.html could not be deleted.', 1, NULL, NULL, '2007-02-14 19:23:37');
INSERT INTO `log` VALUES (100241, 'LAUNCH', 'C:Web\nxhp/www/en/servicepages/disclaimer/index.html could not be deleted.', 1, NULL, NULL, '2007-02-14 19:23:37');
INSERT INTO `log` VALUES (100242, 'LAUNCH', 'C:Web\nxhp/www/en/start/index.html could not be deleted.', 1, NULL, NULL, '2007-02-14 19:23:37');
INSERT INTO `log` VALUES (100243, 'LAUNCH', 'C:Web\nxhp/www/en/start/evaluation/index.html could not be deleted.', 1, NULL, NULL, '2007-02-14 19:23:37');
INSERT INTO `log` VALUES (100244, 'LAUNCH', 'C:Web\nxhp/www/en/start/information_center/index.html could not be deleted.', 1, NULL, NULL, '2007-02-14 19:23:37');
INSERT INTO `log` VALUES (100245, 'LAUNCH', 'C:Web\nxhp/www/en/index.html could not be deleted.', 1, NULL, NULL, '2007-02-14 19:23:37');
INSERT INTO `log` VALUES (100246, 'LAUNCH', 'C:Web\nxhp/www/en/index.html could not be deleted.', 1, NULL, NULL, '2007-02-14 19:23:37');
INSERT INTO `log` VALUES (100247, 'LAUNCH', 'C:Web\nxhp/www/en/start/developer_ressources/index.html could not be deleted.', 1, NULL, NULL, '2007-02-14 19:23:37');
INSERT INTO `log` VALUES (100248, 'LAUNCH', 'C:Web\nxhp/www/en/start/php_classes/index.html could not be deleted.', 1, NULL, NULL, '2007-02-14 19:23:37');
INSERT INTO `log` VALUES (100249, 'LAUNCH', 'C:Web\nxhp/www/en/start/php_classes/api_to_google_maps/index.php could not be deleted.', 1, NULL, NULL, '2007-02-14 19:23:37');
INSERT INTO `log` VALUES (100250, 'LAUNCH', 'C:Web\nxhp/www/en/start/php_classes/api_to_google_maps/index.html could not be deleted.', 1, NULL, NULL, '2007-02-14 19:23:38');
INSERT INTO `log` VALUES (100251, 'LAUNCH', 'C:Web\nxhp/www/en/servicepages/index.html could not be deleted.', 1, NULL, NULL, '2007-02-14 19:26:49');
INSERT INTO `log` VALUES (100252, 'LAUNCH', 'C:Web\nxhp/www/en/servicepages/contact/index.html could not be deleted.', 1, NULL, NULL, '2007-02-14 19:26:49');
INSERT INTO `log` VALUES (100253, 'LAUNCH', 'C:Web\nxhp/www/en/servicepages/sitemap/index.html could not be deleted.', 1, NULL, NULL, '2007-02-14 19:26:49');
INSERT INTO `log` VALUES (100254, 'LAUNCH', 'C:Web\nxhp/www/en/servicepages/disclaimer/index.html could not be deleted.', 1, NULL, NULL, '2007-02-14 19:26:49');
INSERT INTO `log` VALUES (100255, 'LAUNCH', 'C:Web\nxhp/www/en/start/index.html could not be deleted.', 1, NULL, NULL, '2007-02-14 19:26:49');
INSERT INTO `log` VALUES (100256, 'LAUNCH', 'C:Web\nxhp/www/en/start/evaluation/index.html could not be deleted.', 1, NULL, NULL, '2007-02-14 19:26:49');
INSERT INTO `log` VALUES (100257, 'LAUNCH', 'C:Web\nxhp/www/en/start/information_center/index.html could not be deleted.', 1, NULL, NULL, '2007-02-14 19:26:49');
INSERT INTO `log` VALUES (100258, 'LAUNCH', 'C:Web\nxhp/www/en/start/information_center/introduction_to_cms/index.php could not be deleted.', 1, NULL, NULL, '2007-02-14 19:26:49');
INSERT INTO `log` VALUES (100259, 'LAUNCH', 'C:Web\nxhp/www/en/start/information_center/introduction_to_cms/index.html could not be deleted.', 1, NULL, NULL, '2007-02-14 19:26:49');
INSERT INTO `log` VALUES (100260, 'LAUNCH', 'C:Web\nxhp/www/en/start/information_center/highlights/index.php could not be deleted.', 1, NULL, NULL, '2007-02-14 19:26:49');
INSERT INTO `log` VALUES (100261, 'LAUNCH', 'C:Web\nxhp/www/en/start/information_center/highlights/index.html could not be deleted.', 1, NULL, NULL, '2007-02-14 19:26:49');
INSERT INTO `log` VALUES (100262, 'LAUNCH', 'C:Web\nxhp/www/en/start/developer_ressources/index.html could not be deleted.', 1, NULL, NULL, '2007-02-14 19:26:49');
INSERT INTO `log` VALUES (100263, 'LAUNCH', 'C:Web\nxhp/www/en/start/php_classes/index.html could not be deleted.', 1, NULL, NULL, '2007-02-14 19:26:50');
INSERT INTO `log` VALUES (100264, 'LAUNCH', 'C:Web\nxhp/www/en/start/php_classes/api_to_google_maps/index.html could not be deleted.', 1, NULL, NULL, '2007-02-14 19:26:50');
INSERT INTO `log` VALUES (100265, 'LAUNCH', 'C:Web\nxhp/www/images/102320.gif could not be deleted.', 1, NULL, NULL, '2007-02-14 19:35:03');
INSERT INTO `log` VALUES (100266, 'LAUNCH', 'C:Web\nxhp/www/images/t102320.gif could not be deleted.', 1, NULL, NULL, '2007-02-14 19:35:03');
INSERT INTO `log` VALUES (100267, 'LAUNCH', 'C:Web\nxhp/wwwdev/images/101465.gif could not be found for launch.', 1, NULL, NULL, '2007-02-14 19:35:03');
INSERT INTO `log` VALUES (100268, 'LAUNCH', 'C:Web\nxhp/www/images/102322.jpg could not be deleted.', 1, NULL, NULL, '2007-02-14 19:35:03');
INSERT INTO `log` VALUES (100269, 'LAUNCH', 'C:Web\nxhp/www/images/t102322.jpg could not be deleted.', 1, NULL, NULL, '2007-02-14 19:35:03');
INSERT INTO `log` VALUES (100270, 'LAUNCH', 'C:Web\nxhp/www/en/start/php_classes/api_to_google_maps/index.html could not be deleted.', 1, NULL, NULL, '2007-02-14 19:35:04');

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `mailinglist`
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
-- Daten für Tabelle `mailinglist`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `messaging`
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
-- Daten für Tabelle `messaging`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `meta`
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
-- Daten für Tabelle `meta`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `meta_datatypes`
-- 

CREATE TABLE `meta_datatypes` (
  `MTYPE_ID` mediumint(9) NOT NULL default '0',
  `NAME` varchar(16) NOT NULL default '',
  `DESCRIPTION` varchar(255) default NULL,
  PRIMARY KEY  (`MTYPE_ID`),
  UNIQUE KEY `MTYPE_ID` (`MTYPE_ID`,`NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Daten für Tabelle `meta_datatypes`
-- 

INSERT INTO `meta_datatypes` VALUES (1, 'Text', 'Single Line Input with Maximum of 64 chars');
INSERT INTO `meta_datatypes` VALUES (2, 'Textarea', 'Four-Line Textarea with maximum of 255 chars of Input');
INSERT INTO `meta_datatypes` VALUES (3, 'Color', 'Special Inputfield for entering a color.');

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `meta_template_items`
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
-- Daten für Tabelle `meta_template_items`
-- 

INSERT INTO `meta_template_items` VALUES (100426, 100425, 'Keywords', 1, 2, 0);
INSERT INTO `meta_template_items` VALUES (100433, 100432, 'Description', 2, 2, 0);
INSERT INTO `meta_template_items` VALUES (100435, 100432, 'Keywords', 1, 2, 0);
INSERT INTO `meta_template_items` VALUES (101499, 101497, 'Keywords', 1, 2, 10);
INSERT INTO `meta_template_items` VALUES (101498, 101497, 'Description', 2, 2, 10);

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `meta_templates`
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
-- Daten für Tabelle `meta_templates`
-- 

INSERT INTO `meta_templates` VALUES (2, '-', NULL, 0, 0);
INSERT INTO `meta_templates` VALUES (100034, '-', '', 0, 10);
INSERT INTO `meta_templates` VALUES (100425, 'Gallery PlugIn-Scheme', 'internally used for assigning Gallery plugin meta data', 1, 0);
INSERT INTO `meta_templates` VALUES (100432, 'Standard', '', 0, 0);
INSERT INTO `meta_templates` VALUES (101497, 'Standard', '', 0, 10);
INSERT INTO `meta_templates` VALUES (102319, '-', '', 0, 10);

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `module_type`
-- 

CREATE TABLE `module_type` (
  `MODULE_TYPE_ID` tinyint(4) NOT NULL default '0',
  `NAME` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`MODULE_TYPE_ID`),
  UNIQUE KEY `NAME` (`NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Daten für Tabelle `module_type`
-- 

INSERT INTO `module_type` VALUES (1, 'Contenttype Extension');
INSERT INTO `module_type` VALUES (2, 'System Extension');
INSERT INTO `module_type` VALUES (3, 'CDS Extension');
INSERT INTO `module_type` VALUES (4, 'Textfilter Extension');

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `modules`
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
-- Daten für Tabelle `modules`
-- 

INSERT INTO `modules` VALUES (100012, 'Image', 'Image. Allowed formats are GIF, JPEG and PNG.', 1, 100010, 'pgnImage', 'image/pgn_image.php', 1);
INSERT INTO `modules` VALUES (100018, 'Label', 'Text-Content with one line for input.', 1, 100016, 'pgnLabel', 'label/pgn_label.php', 1);
INSERT INTO `modules` VALUES (100024, 'Text', 'Text-Content with any length and format.', 2, 100022, 'pgnText', 'text/pgn_text.php', 1);
INSERT INTO `modules` VALUES (100048, 'Link', 'Link to pages', 1, 100047, 'pgnLink', 'link/pgn_link.php', 1);
INSERT INTO `modules` VALUES (100506, 'RSSReader', 'CDS-API-Extension for reading rss feeds', 1, 100505, 'pgnRSSReader', 'rssreader/pgn_rssreader.php', 3);
INSERT INTO `modules` VALUES (100510, 'RSSCreator', 'CDS-API-Extension for creating RSS-Feeds', 1, 100509, 'pgnRSSCreator', 'rsscreator/pgn_rsscreator.php', 3);
INSERT INTO `modules` VALUES (100663, 'CMS', 'CDS-API-Extension for creating, launching and editing Clusters.', 1, 100662, 'pgnCMS', 'cms/pgn_cms.php', 3);
INSERT INTO `modules` VALUES (100711, 'FAQ', 'CDS-API-Extension for realizing a FAQ', 1, 100710, 'pgnFAQ', 'faq/pgn_faq.php', 3);
INSERT INTO `modules` VALUES (100007, 'Adsense', 'Google Adsense Ad-Management Plugin.', 1, 100006, 'pgnAdsense', 'adsense/pgn_adsense.php', 1);
INSERT INTO `modules` VALUES (100062, 'Boolean', 'Boolean Plugin', 1, 100061, 'pgnBoolean', 'boolean/pgn_boolean.php', 1);
INSERT INTO `modules` VALUES (100311, 'Captcha', 'CDS-API-Extension for creating Captchas', 1, 100310, 'pgnCaptcha', 'captcha/pgn_captcha.php', 3);
INSERT INTO `modules` VALUES (100427, 'Gallery', 'Gallery Plugin', 1, 100425, 'pgnGallery', 'gallery/pgn_gallery.php', 1);
INSERT INTO `modules` VALUES (100445, 'BulkImage', 'System-Extensions for importing images in archives.', 1, 0, 'pgnBulkImage', 'bulkimage/pgn_bulkimage.php', 3);
INSERT INTO `modules` VALUES (100606, 'Google Maps API', 'Google Maps API', 1, 100605, 'pgnGoogleMaps', 'googlemaps/pgn_googlemaps.php', 3);
INSERT INTO `modules` VALUES (101385, 'Teaser', 'Build teaser boxes', 1, 101384, 'pgnTeaser', 'teaser/pgn_teaser.php', 1);
INSERT INTO `modules` VALUES (101617, 'MouseoverImage', 'MouseOverImage. Allowed formats are GIF, JPEG and PNG.', 1, 101615, 'pgnMouseoverImage', 'mouseoverimage/pgn_mouseoverimage.php', 1);
INSERT INTO `modules` VALUES (102064, 'Code Sniplets', 'PHP, HTML or Javascript sniplets.', 1, 102062, 'pgnSniplet', 'sniplet/pgn_sniplet.php', 1);

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `pgn_adsense`
-- 

CREATE TABLE `pgn_adsense` (
  `FKID` bigint(20) NOT NULL default '0',
  `ADTEXT` text collate latin1_general_ci,
  `IMPRESSIONS` bigint(20) NOT NULL default '0',
  `CLICKS` bigint(20) NOT NULL default '0',
  PRIMARY KEY  (`FKID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- Daten für Tabelle `pgn_adsense`
-- 

INSERT INTO `pgn_adsense` VALUES (101490, '&lt;script type=&quot;text/javascript&quot;&gt;&lt;!--\r\ngoogle_ad_client = &quot;pub-9320408685906498&quot;;\r\ngoogle_ad_width = 468;\r\ngoogle_ad_height = 15;\r\ngoogle_ad_format = &quot;468x15_0ads_al&quot;;\r\n//2007-01-14: N/X Homepage Bottom Link\r\ngoogle_ad_channel = &quot;4865191082&quot;;\r\ngoogle_color_border = &quot;000000&quot;;\r\ngoogle_color_bg = &quot;000000&quot;;\r\ngoogle_color_link = &quot;ffffff&quot;;\r\ngoogle_color_text = &quot;333333&quot;;\r\ngoogle_color_url = &quot;999999&quot;;\r\n//--&gt;&lt;/script&gt;\r\n&lt;script type=&quot;text/javascript&quot;\r\n  src=&quot;http://pagead2.googlesyndication.com/pagead/show_ads.js&quot;&gt;\r\n&lt;/script&gt;', 0, 0);
INSERT INTO `pgn_adsense` VALUES (102003, '&lt;script type=&quot;text/javascript&quot;&gt;&lt;!--\r\ngoogle_ad_client = &quot;pub-9320408685906498&quot;;\r\ngoogle_ad_width = 160;\r\ngoogle_ad_height = 600;\r\ngoogle_ad_format = &quot;160x600_as&quot;;\r\ngoogle_ad_type = &quot;text_image&quot;;\r\n//2007-01-18: N/X Homepage Side\r\ngoogle_ad_channel = &quot;4291591064&quot;;\r\ngoogle_color_border = &quot;000000&quot;;\r\ngoogle_color_bg = &quot;000000&quot;;\r\ngoogle_color_link = &quot;ffffff&quot;;\r\ngoogle_color_text = &quot;f0f0f0&quot;;\r\ngoogle_color_url = &quot;e0e0e0&quot;;\r\n//--&gt;&lt;/script&gt;\r\n&lt;script type=&quot;text/javascript&quot;\r\n  src=&quot;http://pagead2.googlesyndication.com/pagead/show_ads.js&quot;&gt;\r\n&lt;/script&gt;', 0, 0);
INSERT INTO `pgn_adsense` VALUES (101485, '&lt;script type=&quot;text/javascript&quot;&gt;&lt;!--\r\ngoogle_ad_client = &quot;pub-9320408685906498&quot;;\r\ngoogle_ad_width = 468;\r\ngoogle_ad_height = 15;\r\ngoogle_ad_format = &quot;468x15_0ads_al&quot;;\r\n//2007-01-14: N/X Homepage Bottom Link\r\ngoogle_ad_channel = &quot;4865191082&quot;;\r\ngoogle_color_border = &quot;000000&quot;;\r\ngoogle_color_bg = &quot;000000&quot;;\r\ngoogle_color_link = &quot;ffffff&quot;;\r\ngoogle_color_text = &quot;333333&quot;;\r\ngoogle_color_url = &quot;999999&quot;;\r\n//--&gt;&lt;/script&gt;\r\n&lt;script type=&quot;text/javascript&quot;\r\n  src=&quot;http://pagead2.googlesyndication.com/pagead/show_ads.js&quot;&gt;\r\n&lt;/script&gt;', 0, 0);
INSERT INTO `pgn_adsense` VALUES (100129, '&lt;script type=&quot;text/javascript&quot;&gt;&lt;!--\r\ngoogle_ad_client = &quot;pub-9320408685906498&quot;;\r\ngoogle_ad_width = 160;\r\ngoogle_ad_height = 600;\r\ngoogle_ad_format = &quot;160x600_as&quot;;\r\ngoogle_ad_type = &quot;text_image&quot;;\r\ngoogle_ad_channel =&quot;3676843672&quot;;\r\ngoogle_color_border = &quot;FFFFFF&quot;;\r\ngoogle_color_bg = &quot;FFFFFF&quot;;\r\ngoogle_color_link = &quot;990000&quot;;\r\ngoogle_color_text = &quot;333333&quot;;\r\ngoogle_color_url = &quot;999999&quot;;\r\n//--&gt;&lt;/script&gt;\r\n&lt;script type=&quot;text/javascript&quot;\r\n  src=&quot;http://pagead2.googlesyndication.com/pagead/show_ads.js&quot;&gt;\r\n&lt;/script&gt;', 0, 0);
INSERT INTO `pgn_adsense` VALUES (100127, '&lt;script type=&quot;text/javascript&quot;&gt;&lt;!--\r\ngoogle_ad_client = &quot;pub-9320408685906498&quot;;\r\ngoogle_ad_width = 125;\r\ngoogle_ad_height = 125;\r\ngoogle_ad_format = &quot;125x125_as_rimg&quot;;\r\ngoogle_cpa_choice = &quot;CAAQsdyWhAIaCMvLJa9eDHjiKJ_D93M&quot;;\r\ngoogle_ad_channel = &quot;3608138593&quot;;\r\n//--&gt;&lt;/script&gt;\r\n&lt;script type=&quot;text/javascript&quot; src=&quot;http://pagead2.googlesyndication.com/pagead/show_ads.js&quot;&gt;\r\n&lt;/script&gt;', 0, 0);
INSERT INTO `pgn_adsense` VALUES (100123, '&lt;script type=&quot;text/javascript&quot;&gt;&lt;!--\r\ngoogle_ad_client = &quot;pub-9320408685906498&quot;;\r\ngoogle_ad_width = 468;\r\ngoogle_ad_height = 60;\r\ngoogle_ad_format = &quot;468x60_as&quot;;\r\ngoogle_ad_type = &quot;text_image&quot;;\r\ngoogle_ad_channel =&quot;3676843672&quot;;\r\ngoogle_color_border = &quot;FFFFFF&quot;;\r\ngoogle_color_bg = &quot;FFFFFF&quot;;\r\ngoogle_color_link = &quot;990000&quot;;\r\ngoogle_color_text = &quot;333333&quot;;\r\ngoogle_color_url = &quot;999999&quot;;\r\n//--&gt;&lt;/script&gt;\r\n&lt;script type=&quot;text/javascript&quot;\r\n  src=&quot;http://pagead2.googlesyndication.com/pagead/show_ads.js&quot;&gt;\r\n&lt;/script&gt;', 0, 0);

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `pgn_boolean`
-- 

CREATE TABLE `pgn_boolean` (
  `FKID` bigint(20) NOT NULL default '0',
  `VALUE` int(1) NOT NULL default '0',
  PRIMARY KEY  (`FKID`),
  UNIQUE KEY `FKID` (`FKID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Daten für Tabelle `pgn_boolean`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `pgn_config_store`
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
-- Daten für Tabelle `pgn_config_store`
-- 

INSERT INTO `pgn_config_store` VALUES (100002, 'h1', '#152B36', '#F4FEFD', 'Zrnic', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100111, 'head1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100123, 'h1', '#152b36', '#f4fefd', 'Zrnic', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100321, 'West', '#152b36', '#f4fefd', 'Zrnic', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100322, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100345, '', '#152b36', '#f4fefd', 'Zrnic', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100455, 'h1', '#152b36', '#f4fefd', 'Zrnic', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100527, '400', '80', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100556, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100598, 'h1', '#152b36', '#f4fefd', 'Zrnic', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100733, 'h1', '#152b36', '#f4fefd', 'Zrnic', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100714, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100832, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100341, 'h2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100398, 'h3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100401, 'head1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100400, 'h3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100399, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (101178, 'h1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100179, 'h1', '#152b36', '#f4fefd', 'Zrnic', '', '', '', '', '', '', '', '', '', '', '', 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100466, 'h3', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100467, 'h3', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100468, 'h3', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100469, 'h3', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100190, 'h2', '#152b36', '#f4fefd', 'Zrnic', '', '', '', '', '', '', '', '', '', '', '', 24, 200, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100021, 'h1', '#152B36', '#F4FEFD', 'Zrnic', '', '', '', '', '', '', '', '', '', '', '', 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (101905, 'h1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100479, 'h1', '#152b36', '#f4fefd', 'Zrnic', '', '', '', '', '', '', '', '', '', '', '', 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100606, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100622, 'h1', '#152b36', '#f4fefd', 'Zrnic', '', '', '', '', '', '', '', '', '', '', '', 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100778, 'h1', '#152b36', '#f4fefd', 'Zrnic', '', '', '', '', '', '', '', '', '', '', '', 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100491, 'h1', '#152b36', '#f4fefd', 'Zrnic', '', '', '', '', '', '', '', '', '', '', '', 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100350, 'h2', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100351, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100844, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100845, 'h2', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100015, 'head1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100016, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100035, 'head1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100036, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100064, 'head1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100135, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100139, 'head1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100140, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100163, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100172, 'head1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100173, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100168, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100184, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100283, 'head1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100280, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100281, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100278, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100276, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100429, 'head1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100564, 'head1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100616, 'head1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100720, 'head1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100352, 'head1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (101701, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (101703, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (101705, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (101706, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (101708, 'head1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `pgn_gallery`
-- 

CREATE TABLE `pgn_gallery` (
  `GALLERY_ID` bigint(20) NOT NULL,
  `NAME` varchar(64) collate latin1_general_ci NOT NULL,
  `DESCRIPTION` varchar(255) collate latin1_general_ci default NULL,
  `IMAGE_FOLDER_ID` bigint(20) NOT NULL,
  `COLS` tinyint(4) NOT NULL default '2',
  `ROWS` tinyint(4) NOT NULL default '4',
  `GALLERYTYPE` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`GALLERY_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- Daten für Tabelle `pgn_gallery`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `pgn_image`
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
-- Daten für Tabelle `pgn_image`
-- 

INSERT INTO `pgn_image` VALUES (100125, '100125.gif', 'Logo', 120, 60, '');
INSERT INTO `pgn_image` VALUES (102322, '102322.jpg', 'Google Maps API', 640, 620, '');
INSERT INTO `pgn_image` VALUES (102320, '102320.gif', '', 8, 15, '');
INSERT INTO `pgn_image` VALUES (102270, '102270.jpg', 'Google Maps API', 640, 620, '');
INSERT INTO `pgn_image` VALUES (101923, '101923.jpg', '', 90, 90, '');
INSERT INTO `pgn_image` VALUES (101920, '101920.jpg', '', 90, 90, '');
INSERT INTO `pgn_image` VALUES (101917, '101917.jpg', '', 90, 90, '');
INSERT INTO `pgn_image` VALUES (101914, '101914.jpg', '', 90, 90, '');
INSERT INTO `pgn_image` VALUES (101911, '101911.jpg', '', 90, 90, '');
INSERT INTO `pgn_image` VALUES (101888, '101888.jpg', '', 90, 90, '');
INSERT INTO `pgn_image` VALUES (101879, '101879.jpg', '', 90, 90, '');
INSERT INTO `pgn_image` VALUES (101873, '101873.jpg', '', 90, 90, '');
INSERT INTO `pgn_image` VALUES (101867, '101867.jpg', '', 90, 90, '');
INSERT INTO `pgn_image` VALUES (101861, '101861.jpg', '', 90, 90, '');
INSERT INTO `pgn_image` VALUES (101507, '101507.jpg', 'N/X Content Management System. Free and Open Source', 360, 210, '');
INSERT INTO `pgn_image` VALUES (101465, '101465.gif', '', 8, 15, '');
INSERT INTO `pgn_image` VALUES (101460, '101460.gif', '', 8, 15, '');
INSERT INTO `pgn_image` VALUES (101414, '101414.jpg', 'N/X Content Management System. Free and Open Source', 360, 210, '');

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `pgn_label`
-- 

CREATE TABLE `pgn_label` (
  `FKID` bigint(20) NOT NULL default '0',
  `CONTENT` varchar(255) default NULL,
  PRIMARY KEY  (`FKID`),
  UNIQUE KEY `FKID` (`FKID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Daten für Tabelle `pgn_label`
-- 

INSERT INTO `pgn_label` VALUES (100131, 'Free Content Managment - N/X WCMS - Open Source -');
INSERT INTO `pgn_label` VALUES (100177, 'News');
INSERT INTO `pgn_label` VALUES (100199, 'Back to news Overview');
INSERT INTO `pgn_label` VALUES (102334, 'http://nxwcms.blogspot.com/feeds/posts/default');
INSERT INTO `pgn_label` VALUES (102332, 'Sven&#039;s Development Blog');
INSERT INTO `pgn_label` VALUES (102305, 'Highlights');
INSERT INTO `pgn_label` VALUES (102298, 'Introduction to Content Management');
INSERT INTO `pgn_label` VALUES (102288, 'N/X API to Google Maps');
INSERT INTO `pgn_label` VALUES (102143, 'N/X API to Google Maps');
INSERT INTO `pgn_label` VALUES (102128, 'blog,cms,elearning,free,google maps,kompletter technischer support,mysql,online redaktionssysteme,php,search engine optimization,seo,web-redaktionssysteme,weblog blog');
INSERT INTO `pgn_label` VALUES (102123, 'blog,cms,elearning,free,google maps,kompletter technischer support,mysql,online redaktionssysteme,php,search engine optimization,seo,web-redaktionssysteme,weblog blog');
INSERT INTO `pgn_label` VALUES (102046, 'Highlights');
INSERT INTO `pgn_label` VALUES (102029, 'Introduction to Content Management');
INSERT INTO `pgn_label` VALUES (101963, '');
INSERT INTO `pgn_label` VALUES (101957, '');
INSERT INTO `pgn_label` VALUES (101951, 'Information Center');
INSERT INTO `pgn_label` VALUES (101942, '');
INSERT INTO `pgn_label` VALUES (101846, '');
INSERT INTO `pgn_label` VALUES (101837, '');
INSERT INTO `pgn_label` VALUES (101828, '');
INSERT INTO `pgn_label` VALUES (101819, 'Information Center');
INSERT INTO `pgn_label` VALUES (100133, 'Free Content Managment - N/X WCMS - Open Source -');
INSERT INTO `pgn_label` VALUES (101601, '2001-2007 by the N/X Systems Open Source Community');
INSERT INTO `pgn_label` VALUES (101596, '2001-2007 by the N/X Systems Open Source Community');

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `pgn_link`
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
-- Daten für Tabelle `pgn_link`
-- 

INSERT INTO `pgn_link` VALUES (100057, 'Forum', 0, 'http://www.nxsystems.org/xmb', 0, '');
INSERT INTO `pgn_link` VALUES (100092, 'Forum', 0, 'http://www.nxsystems.org/xmb', 100042, '');
INSERT INTO `pgn_link` VALUES (100418, '', 0, NULL, NULL, NULL);
INSERT INTO `pgn_link` VALUES (100421, '', 0, '', 100256, '');
INSERT INTO `pgn_link` VALUES (100539, 'rssfeed', 0, '', 100415, '');
INSERT INTO `pgn_link` VALUES (100544, '', 0, '', 100500, '');
INSERT INTO `pgn_link` VALUES (100593, '', 0, 'http://www.bild.de', 0, '');
INSERT INTO `pgn_link` VALUES (101208, 'N/X Forum', 0, 'http://www.nxsystems.org/xmb', 0, '');

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `pgn_mouseoverimage`
-- 

CREATE TABLE `pgn_mouseoverimage` (
  `FKID` bigint(20) NOT NULL default '0',
  `FILENAME1` varchar(32) collate latin1_general_ci default NULL,
  `FILENAME2` varchar(32) collate latin1_general_ci default NULL,
  `ALT` varchar(64) collate latin1_general_ci default NULL,
  `WIDTH` smallint(6) default NULL,
  `HEIGHT` smallint(6) default NULL,
  `COPYRIGHT` varchar(64) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`FKID`),
  UNIQUE KEY `FKID` (`FKID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- Daten für Tabelle `pgn_mouseoverimage`
-- 

INSERT INTO `pgn_mouseoverimage` VALUES (101630, '101630FILENAME1.jpg', '101630FILENAME2.jpg', 'Information Center', 215, 48, '');
INSERT INTO `pgn_mouseoverimage` VALUES (101637, '101637FILENAME1.jpg', '101637FILENAME2.jpg', 'Demo and Evaluation', 215, 45, '');
INSERT INTO `pgn_mouseoverimage` VALUES (101642, '101642FILENAME1.jpg', '101642FILENAME2.jpg', 'Demo and Evaluation', 215, 45, '');
INSERT INTO `pgn_mouseoverimage` VALUES (101645, '101645FILENAME1.jpg', '101645FILENAME2.jpg', 'Information Center', 215, 48, '');
INSERT INTO `pgn_mouseoverimage` VALUES (101649, '101649FILENAME1.jpg', '101649FILENAME2.jpg', 'Developer Ressources', 215, 45, '');
INSERT INTO `pgn_mouseoverimage` VALUES (101654, '101654FILENAME1.jpg', '101654FILENAME2.jpg', 'Developer Ressources', 215, 45, '');
INSERT INTO `pgn_mouseoverimage` VALUES (101658, '101658FILENAME1.jpg', '101658FILENAME2.jpg', 'PHP Classes', 215, 45, '');
INSERT INTO `pgn_mouseoverimage` VALUES (101663, '101663FILENAME1.jpg', '101663FILENAME2.jpg', 'PHP Classes', 215, 45, '');

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `pgn_sniplet`
-- 

CREATE TABLE `pgn_sniplet` (
  `FKID` bigint(20) NOT NULL,
  `SNIPLET` text collate latin1_general_ci,
  `SNIPLETTYPE` tinyint(4) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- Daten für Tabelle `pgn_sniplet`
-- 

INSERT INTO `pgn_sniplet` VALUES (102071, '&lt;!-- SiteSearch Google --&gt;\r\n&lt;form method=&quot;get&quot; action=&quot;http://www.google.com/custom&quot; target=&quot;google_window&quot;&gt;\r\n&lt;table border=&quot;0&quot;&gt;\r\n&lt;tr&gt;&lt;td nowrap=&quot;nowrap&quot; valign=&quot;top&quot; align=&quot;left&quot; height=&quot;32&quot;&gt;\r\n&lt;a href=&quot;http://www.google.com/&quot;&gt;\r\n&lt;img src=&quot;http://www.google.com/logos/Logo_25blk.gif&quot; border=&quot;0&quot; alt=&quot;Google&quot; align=&quot;middle&quot;&gt;&lt;/img&gt;&lt;/a&gt;\r\n&lt;/td&gt;\r\n&lt;td nowrap=&quot;nowrap&quot;&gt;\r\n&lt;input type=&quot;hidden&quot; name=&quot;domains&quot; value=&quot;www.nxsystems.org&quot;&gt;&lt;/input&gt;\r\n&lt;label for=&quot;sbi&quot; style=&quot;display: none&quot;&gt;Enter your search terms&lt;/label&gt;\r\n&lt;input type=&quot;text&quot; name=&quot;q&quot; size=&quot;20&quot; maxlength=&quot;255&quot; value=&quot;&quot; id=&quot;sbi&quot;&gt;&lt;/input&gt;\r\n&lt;label for=&quot;sbb&quot; style=&quot;display: none&quot;&gt;Submit search form&lt;/label&gt;\r\n&lt;input type=&quot;submit&quot; name=&quot;sa&quot; value=&quot;Search&quot; id=&quot;sbb&quot;&gt;&lt;/input&gt;\r\n&lt;/td&gt;&lt;/tr&gt;\r\n&lt;tr&gt;\r\n&lt;td&gt;&amp;nbsp;&lt;/td&gt;\r\n&lt;td nowrap=&quot;nowrap&quot;&gt;\r\n&lt;table&gt;\r\n&lt;tr&gt;\r\n&lt;td&gt;\r\n&lt;input type=&quot;radio&quot; name=&quot;sitesearch&quot; value=&quot;&quot; checked id=&quot;ss0&quot;&gt;&lt;/input&gt;\r\n&lt;label for=&quot;ss0&quot; title=&quot;Search the Web&quot;&gt;&lt;font size=&quot;-1&quot; color=&quot;white&quot;&gt;Web&lt;/font&gt;&lt;/label&gt;&lt;/td&gt;\r\n&lt;td&gt;\r\n&lt;input type=&quot;radio&quot; name=&quot;sitesearch&quot; value=&quot;www.nxsystems.org&quot; id=&quot;ss1&quot;&gt;&lt;/input&gt;\r\n&lt;label for=&quot;ss1&quot; title=&quot;Search www.nxsystems.org&quot;&gt;&lt;font size=&quot;-1&quot; color=&quot;white&quot;&gt;www.nxsystems.org&lt;/font&gt;&lt;/label&gt;&lt;/td&gt;\r\n&lt;/tr&gt;\r\n&lt;/table&gt;\r\n&lt;input type=&quot;hidden&quot; name=&quot;client&quot; value=&quot;pub-9320408685906498&quot;&gt;&lt;/input&gt;\r\n&lt;input type=&quot;hidden&quot; name=&quot;forid&quot; value=&quot;1&quot;&gt;&lt;/input&gt;\r\n&lt;input type=&quot;hidden&quot; name=&quot;ie&quot; value=&quot;ISO-8859-1&quot;&gt;&lt;/input&gt;\r\n&lt;input type=&quot;hidden&quot; name=&quot;oe&quot; value=&quot;ISO-8859-1&quot;&gt;&lt;/input&gt;\r\n&lt;input type=&quot;hidden&quot; name=&quot;cof&quot; value=&quot;GALT:#008000;GL:1;DIV:#336699;VLC:663399;AH:center;BGC:FFFFFF;LBGC:336699;ALC:0000FF;LC:0000FF;T:000000;GFNT:0000FF;GIMP:0000FF;FORID:1&quot;&gt;&lt;/input&gt;\r\n&lt;input type=&quot;hidden&quot; name=&quot;hl&quot; value=&quot;en&quot;&gt;&lt;/input&gt;\r\n&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;\r\n&lt;/form&gt;\r\n&lt;!-- SiteSearch Google --&gt;', 1);
INSERT INTO `pgn_sniplet` VALUES (102076, '&lt;!-- SiteSearch Google --&gt;\r\n&lt;form method=&quot;get&quot; action=&quot;http://www.google.com/custom&quot; target=&quot;google_window&quot;&gt;\r\n&lt;table border=&quot;0&quot;&gt;\r\n&lt;tr&gt;&lt;td nowrap=&quot;nowrap&quot; valign=&quot;top&quot; align=&quot;left&quot; height=&quot;32&quot;&gt;\r\n&lt;a href=&quot;http://www.google.com/&quot;&gt;\r\n&lt;img src=&quot;http://www.google.com/logos/Logo_25blk.gif&quot; border=&quot;0&quot; alt=&quot;Google&quot; align=&quot;middle&quot;&gt;&lt;/img&gt;&lt;/a&gt;\r\n&lt;/td&gt;\r\n&lt;td nowrap=&quot;nowrap&quot;&gt;\r\n&lt;input type=&quot;hidden&quot; name=&quot;domains&quot; value=&quot;www.nxsystems.org&quot;&gt;&lt;/input&gt;\r\n&lt;label for=&quot;sbi&quot; style=&quot;display: none&quot;&gt;Enter your search terms&lt;/label&gt;\r\n&lt;input type=&quot;text&quot; name=&quot;q&quot; size=&quot;20&quot; maxlength=&quot;255&quot; value=&quot;&quot; id=&quot;sbi&quot;&gt;&lt;/input&gt;\r\n&lt;label for=&quot;sbb&quot; style=&quot;display: none&quot;&gt;Submit search form&lt;/label&gt;\r\n&lt;input type=&quot;submit&quot; name=&quot;sa&quot; value=&quot;Search&quot; id=&quot;sbb&quot;&gt;&lt;/input&gt;\r\n&lt;/td&gt;&lt;/tr&gt;\r\n&lt;tr&gt;\r\n&lt;td&gt;&amp;nbsp;&lt;/td&gt;\r\n&lt;td nowrap=&quot;nowrap&quot;&gt;\r\n&lt;table&gt;\r\n&lt;tr&gt;\r\n&lt;td&gt;\r\n&lt;input type=&quot;radio&quot; name=&quot;sitesearch&quot; value=&quot;&quot; checked id=&quot;ss0&quot;&gt;&lt;/input&gt;\r\n&lt;label for=&quot;ss0&quot; title=&quot;Search the Web&quot;&gt;&lt;font size=&quot;-1&quot; color=&quot;white&quot;&gt;Web&lt;/font&gt;&lt;/label&gt;&lt;/td&gt;\r\n&lt;td&gt;\r\n&lt;input type=&quot;radio&quot; name=&quot;sitesearch&quot; value=&quot;www.nxsystems.org&quot; id=&quot;ss1&quot;&gt;&lt;/input&gt;\r\n&lt;label for=&quot;ss1&quot; title=&quot;Search www.nxsystems.org&quot;&gt;&lt;font size=&quot;-1&quot; color=&quot;white&quot;&gt;www.nxsystems.org&lt;/font&gt;&lt;/label&gt;&lt;/td&gt;\r\n&lt;/tr&gt;\r\n&lt;/table&gt;\r\n&lt;input type=&quot;hidden&quot; name=&quot;client&quot; value=&quot;pub-9320408685906498&quot;&gt;&lt;/input&gt;\r\n&lt;input type=&quot;hidden&quot; name=&quot;forid&quot; value=&quot;1&quot;&gt;&lt;/input&gt;\r\n&lt;input type=&quot;hidden&quot; name=&quot;ie&quot; value=&quot;ISO-8859-1&quot;&gt;&lt;/input&gt;\r\n&lt;input type=&quot;hidden&quot; name=&quot;oe&quot; value=&quot;ISO-8859-1&quot;&gt;&lt;/input&gt;\r\n&lt;input type=&quot;hidden&quot; name=&quot;cof&quot; value=&quot;GALT:#008000;GL:1;DIV:#336699;VLC:663399;AH:center;BGC:FFFFFF;LBGC:336699;ALC:0000FF;LC:0000FF;T:000000;GFNT:0000FF;GIMP:0000FF;FORID:1&quot;&gt;&lt;/input&gt;\r\n&lt;input type=&quot;hidden&quot; name=&quot;hl&quot; value=&quot;en&quot;&gt;&lt;/input&gt;\r\n&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;\r\n&lt;/form&gt;\r\n&lt;!-- SiteSearch Google --&gt;', 1);

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `pgn_teaser`
-- 

CREATE TABLE `pgn_teaser` (
  `FKID` bigint(20) NOT NULL,
  `HEADLINE` varchar(256) collate latin1_general_ci default NULL,
  `BODY` text collate latin1_general_ci,
  `IMAGEID` bigint(20) default NULL,
  `HREF` varchar(256) collate latin1_general_ci default NULL,
  `SPID` bigint(20) default NULL,
  `LINKTEXT` varchar(256) collate latin1_general_ci default NULL,
  `ISIMAGETEASER` tinyint(1) NOT NULL default '0',
  `RESOLVECHILDS` tinyint(1) NOT NULL default '0',
  `CONFIG` varchar(256) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`FKID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- Daten für Tabelle `pgn_teaser`
-- 

INSERT INTO `pgn_teaser` VALUES (101416, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `pgn_teaser` VALUES (101505, '', '', NULL, '', NULL, '', 0, 0, '');

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `pgn_text`
-- 

CREATE TABLE `pgn_text` (
  `FKID` bigint(20) NOT NULL default '0',
  `CONTENT` longtext,
  PRIMARY KEY  (`FKID`),
  UNIQUE KEY `FKID` (`FKID`),
  FULLTEXT KEY `CONTENT` (`CONTENT`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Daten für Tabelle `pgn_text`
-- 

INSERT INTO `pgn_text` VALUES (100178, '');
INSERT INTO `pgn_text` VALUES (102287, '<p>[pfeil] <a TARGET="_blank" HREF="http://www.nxsystems.org/downloads/nxgmap.zip">Download this class</a></p>\r\n<p>The N/X API for Google Maps is a php-class, which allows you to implement google maps on your website without the need to learn the javascript-code of google. The maps drawn with google maps api are looking about like this one, which is taken from the N/X WCMS backoffice:</p>\r\n<p>&nbsp;[gmap]</p>\r\n<p><strong>[adbanner]<br />\r\n<br />\r\nFeatures:</strong></p>\r\n<ul>\r\n    <li>Set Width, Height, Zoomlevel</li>\r\n    <li>Add all common controls of Google Maps</li>\r\n    <li>Geocoding of addresses via AJAX in Webbrowser</li>\r\n    <li>Add Addresses to Map</li>\r\n    <li>Add Points with Geocodes to Map</li>\r\n    <li>Add dragable marker to Map</li>\r\n    <li>Scroll to Points within the Map</li>\r\n    <li>....</li>\r\n</ul>\r\n<p><strong>API Documentation is included in the package.</strong></p>');
INSERT INTO `pgn_text` VALUES (102297, 'tex tex tex tex tex texttex tex tex tex tex text<br />tex tex tex tex tex text<br />tex tex tex tex tex text<br />tex tex tex tex tex text<br />tex tex tex tex tex texttex tex tex tex tex texttex tex tex tex tex text<br /><br /><br />tex tex tex tex tex texttex tex tex tex tex text<br />tex tex tex tex tex texttex tex tex tex tex text<br /><br /><br /><br />tex tex tex tex tex textv<br /><br />v<br />v<br />tex tex tex tex tex text');
INSERT INTO `pgn_text` VALUES (102304, 'HighlightsHighlightsHighlightsHighlights<br />HighlightsHighlightsHighlightsHighlights<br />Highlights Highlights Highlights Highlights Highlights<br />Highlights Highlights<br /><br /><br />Highlights Highlights Highlights Highlights Highlights Highlights');
INSERT INTO `pgn_text` VALUES (102333, 'Read what is ongoing in the N/X developments here. The Feed can be found at <a HREF="http://nxwcms.blogspot.com" TARGET="_blank">http://nxwcms.blogspot.com</a>.');
INSERT INTO `pgn_text` VALUES (101506, '<p>N/X Web Content Management is a Free Open Source Content Management System for managing all kind of websites. Check, if N/X is suitable for your website now!</p>\r\n<p>- N/X WCMS is Content Management for the Web and beyond.<br />- It is Open Source.<br />- It is free. <br />- It is licensed under GNU GPL<br />- It is based on PHP and mySQL<br />- The Open Source project was initially developed at Computer Science Research Center Karlsruhe, Germany<br />- It is a fully object oriented Content Management System.<br />- Integration of 3rd party software is quite easy.<br />- The core is highly extensible with plugins.</p>\r\n<p align="right">[pfeil]&nbsp;{NX:LINK PAGE="101931" GETVARS=""}<strong>learn more</strong></a></p>');
INSERT INTO `pgn_text` VALUES (101820, 'Information Center<br />Information Center<br />Information Center<br />Information Center<br />Information Center');
INSERT INTO `pgn_text` VALUES (101829, '');
INSERT INTO `pgn_text` VALUES (101838, '');
INSERT INTO `pgn_text` VALUES (101847, '');
INSERT INTO `pgn_text` VALUES (101941, '');
INSERT INTO `pgn_text` VALUES (101950, 'Information Center<br />Information Center<br />Information Center<br />Information Center<br />Information Center');
INSERT INTO `pgn_text` VALUES (101956, '');
INSERT INTO `pgn_text` VALUES (101962, '');
INSERT INTO `pgn_text` VALUES (102030, 'tex tex tex tex tex texttex tex tex tex tex text<br />tex tex tex tex tex text<br />tex tex tex tex tex text<br />tex tex tex tex tex text<br />tex tex tex tex tex texttex tex tex tex tex texttex tex tex tex tex text<br /><br /><br />tex tex tex tex tex texttex tex tex tex tex text<br />tex tex tex tex tex texttex tex tex tex tex text<br /><br /><br /><br />tex tex tex tex tex textv<br /><br />v<br />v<br />tex tex tex tex tex text');
INSERT INTO `pgn_text` VALUES (102047, 'HighlightsHighlightsHighlightsHighlights<br />HighlightsHighlightsHighlightsHighlights<br />Highlights Highlights Highlights Highlights Highlights<br />Highlights Highlights<br /><br /><br />Highlights Highlights Highlights Highlights Highlights Highlights');
INSERT INTO `pgn_text` VALUES (102144, '<p>[pfeil] <a TARGET="_blank" HREF="http://www.nxsystems.org/downloads/nxgmap.zip">Download this class</a></p>\r\n<p>The N/X API for Google Maps is a php-class, which allows you to implement google maps on your website without the need to learn the javascript-code of google. The maps drawn with google maps api are looking about like this one, which is taken from the N/X WCMS backoffice:</p>\r\n<p>&nbsp;[gmap]</p>\r\n<p><strong>[adbanner]<br />\r\n<br />\r\nFeatures:</strong></p>\r\n<ul>\r\n    <li>Set Width, Height, Zoomlevel</li>\r\n    <li>Add all common controls of Google Maps</li>\r\n    <li>Geocoding of addresses via AJAX in Webbrowser</li>\r\n    <li>Add Addresses to Map</li>\r\n    <li>Add Points with Geocodes to Map</li>\r\n    <li>Add dragable marker to Map</li>\r\n    <li>Scroll to Points within the Map</li>\r\n    <li>....</li>\r\n</ul>\r\n<p><strong>API Documentation is included in the package.</strong></p>');
INSERT INTO `pgn_text` VALUES (101415, '<p>N/X Web Content Management is a Free Open Source Content Management System for managing all kind of websites. Check, if N/X is suitable for your website now!</p>\r\n<p>- N/X WCMS is Content Management for the Web and beyond.<br />- It is Open Source.<br />- It is free. <br />- It is licensed under GNU GPL<br />- It is based on PHP and mySQL<br />- The Open Source project was initially developed at Computer Science Research Center Karlsruhe, Germany<br />- It is a fully object oriented Content Management System.<br />- Integration of 3rd party software is quite easy.<br />- The core is highly extensible with plugins.</p>\r\n<p align="right">[pfeil]&nbsp;{NX:LINK PAGE="101816" GETVARS=""}<strong>learn more</strong></a></p>');

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `pot_accesslog`
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
-- Daten für Tabelle `pot_accesslog`
-- 

INSERT INTO `pot_accesslog` VALUES (-1870975372, 1155287884, -1372539626, 0, 1);
INSERT INTO `pot_accesslog` VALUES (-1870975372, 1155288086, -50121658, 0, 0);
INSERT INTO `pot_accesslog` VALUES (-1870975372, 1155288162, -1372539626, 0, 0);
INSERT INTO `pot_accesslog` VALUES (-1870975372, 1155288185, -50121658, 0, 0);
INSERT INTO `pot_accesslog` VALUES (-1870975372, 1155288306, 1404213637, 0, 0);
INSERT INTO `pot_accesslog` VALUES (-1870975372, 1155288332, -50121658, 0, 0);
INSERT INTO `pot_accesslog` VALUES (-1870975372, 1155288438, -1372539626, 0, 0);
INSERT INTO `pot_accesslog` VALUES (-1870975372, 1155289117, -50121658, 0, 0);
INSERT INTO `pot_accesslog` VALUES (2059908099, 1155289162, -50121658, 0, 1);
INSERT INTO `pot_accesslog` VALUES (2059908099, 1155289239, 1404213637, 0, 0);
INSERT INTO `pot_accesslog` VALUES (123962545, 1155299363, -1372539626, 0, 1);
INSERT INTO `pot_accesslog` VALUES (123962545, 1155299374, -50121658, 0, 0);
INSERT INTO `pot_accesslog` VALUES (123962545, 1155300454, -597777578, 0, 0);
INSERT INTO `pot_accesslog` VALUES (123962545, 1155300487, 1275463402, 0, 0);
INSERT INTO `pot_accesslog` VALUES (123962545, 1155301489, -1372539626, 0, 0);
INSERT INTO `pot_accesslog` VALUES (123962545, 1155301494, -597777578, 0, 0);
INSERT INTO `pot_accesslog` VALUES (123962545, 1155301550, -881221112, 0, 0);
INSERT INTO `pot_accesslog` VALUES (123962545, 1155301647, -1372539626, 0, 0);
INSERT INTO `pot_accesslog` VALUES (123962545, 1155301651, -597777578, 0, 0);
INSERT INTO `pot_accesslog` VALUES (123962545, 1155301654, -881221112, 0, 0);
INSERT INTO `pot_accesslog` VALUES (123962545, 1155302736, -597777578, 0, 0);
INSERT INTO `pot_accesslog` VALUES (123962545, 1155302966, -1372539626, 0, 0);
INSERT INTO `pot_accesslog` VALUES (196928006, 1155319569, -1372539626, 0, 1);
INSERT INTO `pot_accesslog` VALUES (196928006, 1155319576, 217814675, 0, 0);
INSERT INTO `pot_accesslog` VALUES (196928006, 1155319580, -1480284757, 0, 0);
INSERT INTO `pot_accesslog` VALUES (196928006, 1155319590, -1372539626, 0, 0);
INSERT INTO `pot_accesslog` VALUES (196928006, 1155319715, 217814675, 0, 0);
INSERT INTO `pot_accesslog` VALUES (196928006, 1155319720, -1480284757, 0, 0);
INSERT INTO `pot_accesslog` VALUES (-1229904442, 1155466272, -1372539626, 0, 1);
INSERT INTO `pot_accesslog` VALUES (1237274194, 1155466337, -1372539626, 0, 1);
INSERT INTO `pot_accesslog` VALUES (1695662651, 1155481956, -1372539626, 0, 1);
INSERT INTO `pot_accesslog` VALUES (1153418208, 1155492450, 0, 0, 1);
INSERT INTO `pot_accesslog` VALUES (2114142998, 1168170093, 0, 0, 1);
INSERT INTO `pot_accesslog` VALUES (1361641012, 1168772927, 0, 0, 1);
INSERT INTO `pot_accesslog` VALUES (497783565, 1168799076, -1694472534, 0, 1);
INSERT INTO `pot_accesslog` VALUES (-817956038, 1168887916, -1694472534, 0, 1);
INSERT INTO `pot_accesslog` VALUES (-645231222, 1168888031, -1694472534, 0, 1);
INSERT INTO `pot_accesslog` VALUES (-1571097578, 1168894398, -1694472534, 0, 1);
INSERT INTO `pot_accesslog` VALUES (-325075151, 1168973033, -1694472534, 0, 1);
INSERT INTO `pot_accesslog` VALUES (-965142051, 1168982994, -1694472534, 0, 1);
INSERT INTO `pot_accesslog` VALUES (-965142051, 1168983091, 425585148, 0, 0);
INSERT INTO `pot_accesslog` VALUES (-965142051, 1168983100, -1593233578, 0, 0);
INSERT INTO `pot_accesslog` VALUES (-965142051, 1168983101, 1104987720, 0, 0);
INSERT INTO `pot_accesslog` VALUES (-965142051, 1168983287, -1694472534, 0, 0);
INSERT INTO `pot_accesslog` VALUES (-965142051, 1168983297, 425585148, 0, 0);
INSERT INTO `pot_accesslog` VALUES (-965142051, 1168983310, -145520432, 0, 0);
INSERT INTO `pot_accesslog` VALUES (-965142051, 1168983312, -1593233578, 0, 0);
INSERT INTO `pot_accesslog` VALUES (-965142051, 1168983313, 1104987720, 0, 0);
INSERT INTO `pot_accesslog` VALUES (-965142051, 1168983316, -1081003049, 0, 0);
INSERT INTO `pot_accesslog` VALUES (-965142051, 1168983321, 2111816993, 0, 0);
INSERT INTO `pot_accesslog` VALUES (-965142051, 1168983323, -13697224, 0, 0);
INSERT INTO `pot_accesslog` VALUES (-965142051, 1168983326, -1081003049, 0, 0);
INSERT INTO `pot_accesslog` VALUES (-965142051, 1168983327, 2111816993, 0, 0);
INSERT INTO `pot_accesslog` VALUES (-965142051, 1168983328, -1081003049, 0, 0);
INSERT INTO `pot_accesslog` VALUES (-965142051, 1168983329, -13697224, 0, 0);
INSERT INTO `pot_accesslog` VALUES (-965142051, 1168983388, -1694472534, 0, 0);
INSERT INTO `pot_accesslog` VALUES (-965142051, 1168983396, 2111816993, 0, 0);
INSERT INTO `pot_accesslog` VALUES (-965142051, 1168983425, -1081003049, 0, 0);
INSERT INTO `pot_accesslog` VALUES (-965142051, 1168983426, -13697224, 0, 0);
INSERT INTO `pot_accesslog` VALUES (-965142051, 1168983445, -1081003049, 0, 0);
INSERT INTO `pot_accesslog` VALUES (-965142051, 1168983451, 2111816993, 0, 0);
INSERT INTO `pot_accesslog` VALUES (-965142051, 1168983461, 425585148, 0, 0);
INSERT INTO `pot_accesslog` VALUES (-965142051, 1168983463, -145520432, 0, 0);
INSERT INTO `pot_accesslog` VALUES (-965142051, 1168983465, -1593233578, 0, 0);
INSERT INTO `pot_accesslog` VALUES (-965142051, 1168983466, 1104987720, 0, 0);
INSERT INTO `pot_accesslog` VALUES (-965142051, 1168983472, -1694472534, 0, 0);
INSERT INTO `pot_accesslog` VALUES (-965142051, 1168983476, -1593233578, 0, 0);
INSERT INTO `pot_accesslog` VALUES (-965142051, 1168983538, -145520432, 0, 0);
INSERT INTO `pot_accesslog` VALUES (-965142051, 1168983542, 425585148, 0, 0);
INSERT INTO `pot_accesslog` VALUES (-965142051, 1168983544, 1104987720, 0, 0);
INSERT INTO `pot_accesslog` VALUES (-965142051, 1168983548, -1081003049, 0, 0);
INSERT INTO `pot_accesslog` VALUES (872702994, 1168983564, -1081003049, 0, 1);
INSERT INTO `pot_accesslog` VALUES (872702994, 1168983585, -145520432, 0, 0);
INSERT INTO `pot_accesslog` VALUES (478247875, 1169148299, -1694472534, 0, 1);
INSERT INTO `pot_accesslog` VALUES (478247875, 1169149293, 425585148, 0, 0);
INSERT INTO `pot_accesslog` VALUES (478247875, 1169150736, -1694472534, 0, 0);
INSERT INTO `pot_accesslog` VALUES (478247875, 1169150742, -145520432, 0, 0);
INSERT INTO `pot_accesslog` VALUES (478247875, 1169150745, -1593233578, 0, 0);
INSERT INTO `pot_accesslog` VALUES (478247875, 1169150791, -145520432, 0, 0);
INSERT INTO `pot_accesslog` VALUES (478247875, 1169150792, -1593233578, 0, 0);
INSERT INTO `pot_accesslog` VALUES (-392168544, 1171182020, -1694472534, 0, 1);
INSERT INTO `pot_accesslog` VALUES (-261450714, 1171182028, 425585148, 0, 1);
INSERT INTO `pot_accesslog` VALUES (1483750085, 1171182036, -145520432, 0, 1);
INSERT INTO `pot_accesslog` VALUES (1238449750, 1171182039, -1593233578, 0, 1);
INSERT INTO `pot_accesslog` VALUES (317759927, 1171184847, -1694472534, 0, 1);
INSERT INTO `pot_accesslog` VALUES (-1180444038, 1171304918, -1694472534, 0, 1);
INSERT INTO `pot_accesslog` VALUES (-162883207, 1171474822, -1694472534, 0, 1);
INSERT INTO `pot_accesslog` VALUES (-162883207, 1171474823, 1104987720, 0, 0);
INSERT INTO `pot_accesslog` VALUES (-162883207, 1171477451, -1694472534, 0, 0);
INSERT INTO `pot_accesslog` VALUES (-162883207, 1171477461, -145520432, 0, 0);
INSERT INTO `pot_accesslog` VALUES (-162883207, 1171477504, 1104987720, 0, 0);
INSERT INTO `pot_accesslog` VALUES (-162883207, 1171477518, -1809611593, 0, 0);
INSERT INTO `pot_accesslog` VALUES (-162883207, 1171477626, -1593233578, 0, 0);
INSERT INTO `pot_accesslog` VALUES (-162883207, 1171477629, -145520432, 0, 0);
INSERT INTO `pot_accesslog` VALUES (-162883207, 1171477631, 425585148, 0, 0);
INSERT INTO `pot_accesslog` VALUES (-162883207, 1171477634, -145520432, 0, 0);
INSERT INTO `pot_accesslog` VALUES (-162883207, 1171477645, 1104987720, 0, 0);
INSERT INTO `pot_accesslog` VALUES (-162883207, 1171477648, -1809611593, 0, 0);
INSERT INTO `pot_accesslog` VALUES (-162883207, 1171478150, -145520432, 0, 0);
INSERT INTO `pot_accesslog` VALUES (-162883207, 1171478154, -1593233578, 0, 0);
INSERT INTO `pot_accesslog` VALUES (-162883207, 1171478159, 1104987720, 0, 0);

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `pot_add_data`
-- 

CREATE TABLE `pot_add_data` (
  `accesslog_id` int(11) NOT NULL default '0',
  `data_field` varchar(32) NOT NULL default '',
  `data_value` varchar(255) NOT NULL default '',
  KEY `accesslog_id` (`accesslog_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 DELAY_KEY_WRITE=1;

-- 
-- Daten für Tabelle `pot_add_data`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `pot_documents`
-- 

CREATE TABLE `pot_documents` (
  `data_id` int(11) NOT NULL default '0',
  `string` varchar(255) NOT NULL default '',
  `document_url` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`data_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 DELAY_KEY_WRITE=1;

-- 
-- Daten für Tabelle `pot_documents`
-- 

INSERT INTO `pot_documents` VALUES (-1372539626, '100031', 'http://localhost/nx5/www/en/test/');
INSERT INTO `pot_documents` VALUES (-50121658, '100108', 'http://localhost/nx5/www/en/serivepages/sitemap/');
INSERT INTO `pot_documents` VALUES (1404213637, '100095', 'http://localhost/nx5/www/en/test/forum/profiles/');
INSERT INTO `pot_documents` VALUES (-597777578, '100169', 'http://localhost/nx5/www/en/news/');
INSERT INTO `pot_documents` VALUES (1275463402, '100181', 'http://localhost/nx5/www/en/news/article/general_news/welcome/');
INSERT INTO `pot_documents` VALUES (-881221112, '100196', 'http://localhost/nx5/www/en/news/articles/general_news/welcome/');
INSERT INTO `pot_documents` VALUES (217814675, '100243', 'http://localhost/corps/www/en/news/');
INSERT INTO `pot_documents` VALUES (-1480284757, '100260', 'http://localhost/corps/www/en/news/article/general_news/welcome/');
INSERT INTO `pot_documents` VALUES (-1694472534, '101494', 'http://localhost/nxhp/www/en/start/');
INSERT INTO `pot_documents` VALUES (425585148, '101931', 'http://localhost/nxhp/www/en/start/information_center/');
INSERT INTO `pot_documents` VALUES (-1593233578, '101953', 'http://localhost/nxhp/www/en/start/developer_ressources/');
INSERT INTO `pot_documents` VALUES (1104987720, '101959', 'http://localhost/nxhp/www/en/start/php_classes/');
INSERT INTO `pot_documents` VALUES (-145520432, '101933', 'http://localhost/nxhp/www/en/start/evaluation/');
INSERT INTO `pot_documents` VALUES (-1081003049, '101716', 'http://localhost/nxhp/www/en/servicepages/sitemap/');
INSERT INTO `pot_documents` VALUES (2111816993, '101720', 'http://localhost/nxhp/www/en/servicepages/disclaimer/');
INSERT INTO `pot_documents` VALUES (-13697224, '101689', 'http://localhost/nxhp/www/en/servicepages/contact/');
INSERT INTO `pot_documents` VALUES (-1809611593, '102284', 'http://localhost/nxhp/www/en/start/php_classes/api_to_google_maps/');

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `pot_exit_targets`
-- 

CREATE TABLE `pot_exit_targets` (
  `data_id` int(11) NOT NULL default '0',
  `string` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`data_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 DELAY_KEY_WRITE=1;

-- 
-- Daten für Tabelle `pot_exit_targets`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `pot_hostnames`
-- 

CREATE TABLE `pot_hostnames` (
  `data_id` int(11) NOT NULL default '0',
  `string` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`data_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 DELAY_KEY_WRITE=1;

-- 
-- Daten für Tabelle `pot_hostnames`
-- 

INSERT INTO `pot_hostnames` VALUES (-1631451101, 'localhost');
INSERT INTO `pot_hostnames` VALUES (-1547679841, 'Jupiter');

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `pot_nxlog`
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
-- Daten für Tabelle `pot_nxlog`
-- 

INSERT INTO `pot_nxlog` VALUES (-1870975372, 5, 11, 1155287884, 1155289117, 8, 1233);
INSERT INTO `pot_nxlog` VALUES (2059908099, 5, 11, 1155289162, 1155289239, 2, 77);
INSERT INTO `pot_nxlog` VALUES (123962545, 5, 15, 1155299363, 1155302966, 12, 3603);
INSERT INTO `pot_nxlog` VALUES (196928006, 5, 20, 1155319569, 1155319720, 6, 151);
INSERT INTO `pot_nxlog` VALUES (-1229904442, 0, 12, 1155466272, 1155466272, 1, 0);
INSERT INTO `pot_nxlog` VALUES (1237274194, 0, 12, 1155466337, 1155466337, 1, 0);
INSERT INTO `pot_nxlog` VALUES (1695662651, 0, 17, 1155481956, 1155481956, 1, 0);
INSERT INTO `pot_nxlog` VALUES (1153418208, 0, 20, 1155492450, 1155492450, 1, 0);
INSERT INTO `pot_nxlog` VALUES (2114142998, 0, 12, 1168170093, 1168170093, 1, 0);
INSERT INTO `pot_nxlog` VALUES (1361641012, 0, 12, 1168772927, 1168772927, 1, 0);
INSERT INTO `pot_nxlog` VALUES (497783565, 0, 19, 1168799076, 1168799076, 1, 0);
INSERT INTO `pot_nxlog` VALUES (-817956038, 1, 20, 1168887916, 1168887916, 1, 0);
INSERT INTO `pot_nxlog` VALUES (-645231222, 1, 20, 1168888031, 1168888031, 1, 0);
INSERT INTO `pot_nxlog` VALUES (-1571097578, 1, 21, 1168894398, 1168894398, 1, 0);
INSERT INTO `pot_nxlog` VALUES (-325075151, 2, 19, 1168973033, 1168973033, 1, 0);
INSERT INTO `pot_nxlog` VALUES (-965142051, 2, 22, 1168982994, 1168983548, 32, 554);
INSERT INTO `pot_nxlog` VALUES (872702994, 2, 22, 1168983564, 1168983585, 2, 21);
INSERT INTO `pot_nxlog` VALUES (478247875, 4, 21, 1169148299, 1169150792, 7, 2493);
INSERT INTO `pot_nxlog` VALUES (-392168544, 0, 9, 1171182020, 1171182020, 1, 0);
INSERT INTO `pot_nxlog` VALUES (-261450714, 0, 9, 1171182028, 1171182028, 1, 0);
INSERT INTO `pot_nxlog` VALUES (1483750085, 0, 9, 1171182036, 1171182036, 1, 0);
INSERT INTO `pot_nxlog` VALUES (1238449750, 0, 9, 1171182039, 1171182039, 1, 0);
INSERT INTO `pot_nxlog` VALUES (317759927, 0, 10, 1171184847, 1171184847, 1, 0);
INSERT INTO `pot_nxlog` VALUES (-1180444038, 1, 19, 1171304918, 1171304918, 1, 0);
INSERT INTO `pot_nxlog` VALUES (-162883207, 3, 19, 1171474822, 1171478159, 15, 3337);

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `pot_operating_systems`
-- 

CREATE TABLE `pot_operating_systems` (
  `data_id` int(11) NOT NULL default '0',
  `string` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`data_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 DELAY_KEY_WRITE=1;

-- 
-- Daten für Tabelle `pot_operating_systems`
-- 

INSERT INTO `pot_operating_systems` VALUES (-114077417, 'Windows XP');
INSERT INTO `pot_operating_systems` VALUES (-490331943, 'Windows NT');

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `pot_referers`
-- 

CREATE TABLE `pot_referers` (
  `data_id` int(11) NOT NULL default '0',
  `string` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`data_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 DELAY_KEY_WRITE=1;

-- 
-- Daten für Tabelle `pot_referers`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `pot_search_engines`
-- 

CREATE TABLE `pot_search_engines` (
  `accesslog_id` int(11) NOT NULL default '0',
  `search_engine` varchar(64) NOT NULL default '',
  `keywords` varchar(254) NOT NULL default '',
  PRIMARY KEY  (`accesslog_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 DELAY_KEY_WRITE=1;

-- 
-- Daten für Tabelle `pot_search_engines`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `pot_user_agents`
-- 

CREATE TABLE `pot_user_agents` (
  `data_id` int(11) NOT NULL default '0',
  `string` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`data_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 DELAY_KEY_WRITE=1;

-- 
-- Daten für Tabelle `pot_user_agents`
-- 

INSERT INTO `pot_user_agents` VALUES (-520828167, 'MS Internet Explorer 6.0');
INSERT INTO `pot_user_agents` VALUES (-795004555, 'compatible Mozilla/5.0');
INSERT INTO `pot_user_agents` VALUES (-516513586, 'MS Internet Explorer 7.0');

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `pot_visitors`
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
-- Daten für Tabelle `pot_visitors`
-- 

INSERT INTO `pot_visitors` VALUES (-1870975372, 408395800, 1, -114077417, -520828167, -1631451101, 0, 1155287884, 1);
INSERT INTO `pot_visitors` VALUES (2059908099, -1380132645, 1, -114077417, -795004555, -1631451101, 0, 1155289162, 1);
INSERT INTO `pot_visitors` VALUES (123962545, -1380132645, 1, -114077417, -795004555, -1631451101, 0, 1155299363, 1);
INSERT INTO `pot_visitors` VALUES (196928006, 196928006, 1, -114077417, -516513586, -1631451101, 0, 1155319569, 0);
INSERT INTO `pot_visitors` VALUES (-1229904442, 196928006, 1, -114077417, -520828167, -1631451101, 0, 1155466272, 1);
INSERT INTO `pot_visitors` VALUES (1237274194, 1237274194, 1, -114077417, -795004555, -1631451101, 0, 1155466337, 0);
INSERT INTO `pot_visitors` VALUES (1695662651, 196928006, 1, -114077417, -520828167, -1631451101, 0, 1155481956, 1);
INSERT INTO `pot_visitors` VALUES (1153418208, 196928006, 1, -114077417, -520828167, -1631451101, 0, 1155492450, 1);
INSERT INTO `pot_visitors` VALUES (2114142998, 2114142998, 1, -114077417, -795004555, -1631451101, 0, 1168170093, 0);
INSERT INTO `pot_visitors` VALUES (1361641012, 1361641012, 1, -114077417, -520828167, -1631451101, 0, 1168772927, 0);
INSERT INTO `pot_visitors` VALUES (497783565, 1361641012, 1, -114077417, -520828167, -1631451101, 0, 1168799076, 1);
INSERT INTO `pot_visitors` VALUES (-817956038, -371316319, 1, -114077417, -795004555, -1631451101, 0, 1168887916, 1);
INSERT INTO `pot_visitors` VALUES (-645231222, 1361641012, 1, -114077417, -520828167, -1631451101, 0, 1168888031, 1);
INSERT INTO `pot_visitors` VALUES (-1571097578, -371316319, 1, -114077417, -795004555, -1631451101, 0, 1168894398, 1);
INSERT INTO `pot_visitors` VALUES (-325075151, -371316319, 1, -114077417, -795004555, -1631451101, 0, 1168973033, 1);
INSERT INTO `pot_visitors` VALUES (-965142051, -371316319, 1, -114077417, -795004555, -1631451101, 0, 1168982994, 1);
INSERT INTO `pot_visitors` VALUES (872702994, 1361641012, 1, -114077417, -520828167, -1631451101, 0, 1168983564, 1);
INSERT INTO `pot_visitors` VALUES (478247875, -371316319, 1, -114077417, -795004555, -1631451101, 0, 1169148299, 1);
INSERT INTO `pot_visitors` VALUES (-392168544, -392168544, 1, -490331943, -516513586, -1547679841, 0, 1171182020, 0);
INSERT INTO `pot_visitors` VALUES (-261450714, -392168544, 1, -490331943, -516513586, -1547679841, 0, 1171182028, 1);
INSERT INTO `pot_visitors` VALUES (1483750085, -392168544, 1, -490331943, -516513586, -1547679841, 0, 1171182036, 1);
INSERT INTO `pot_visitors` VALUES (1238449750, -392168544, 1, -490331943, -516513586, -1547679841, 0, 1171182039, 1);
INSERT INTO `pot_visitors` VALUES (317759927, -392168544, 1, -490331943, -516513586, -1547679841, 0, 1171184847, 1);
INSERT INTO `pot_visitors` VALUES (-1180444038, -392168544, 1, -490331943, -516513586, -1547679841, 0, 1171304918, 1);
INSERT INTO `pot_visitors` VALUES (-162883207, -392168544, 1, -490331943, -516513586, -1547679841, 0, 1171474822, 1);

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `registry`
-- 

CREATE TABLE `registry` (
  `REGID` bigint(20) NOT NULL default '0',
  `REGNAME` varchar(32) NOT NULL default '',
  `VALUE` varchar(255) NOT NULL default '',
  `PARENTREGID` bigint(20) NOT NULL default '0',
  PRIMARY KEY  (`REGID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Daten für Tabelle `registry`
-- 

INSERT INTO `registry` VALUES (100680, 'PLUGINS', '', 0);
INSERT INTO `registry` VALUES (100681, 'FAQ', '', 100680);
INSERT INTO `registry` VALUES (100682, 'CLT', '100712', 100681);
INSERT INTO `registry` VALUES (101146, 'SYSTEM', '', 0);
INSERT INTO `registry` VALUES (101147, 'MAINTENANCE', '', 101146);
INSERT INTO `registry` VALUES (101148, 'WWWDEV', '', 101147);
INSERT INTO `registry` VALUES (101149, 'WWW', '', 101147);
INSERT INTO `registry` VALUES (101150, 'BB', '', 101147);
INSERT INTO `registry` VALUES (100024, 'CDS', '', 0);
INSERT INTO `registry` VALUES (100025, 'MENU', '', 100024);
INSERT INTO `registry` VALUES (100026, 'COLORACTIVE', '#6699cc', 100025);
INSERT INTO `registry` VALUES (100027, 'COLORTACTIVE', '#cbe5ff', 100025);
INSERT INTO `registry` VALUES (100028, 'COLORSTACTIVE', '#ffffff', 100025);
INSERT INTO `registry` VALUES (100029, 'COLORINACTIVE', '#efefef', 100025);
INSERT INTO `registry` VALUES (100030, 'COLORTINACTIVE', '#0000ff', 100025);

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `role_sys_functions`
-- 

CREATE TABLE `role_sys_functions` (
  `ROLE_ID` bigint(20) NOT NULL default '0',
  `FUNCTION_ID` char(16) NOT NULL default '',
  KEY `ROLE_ID` (`ROLE_ID`,`FUNCTION_ID`),
  KEY `FUNCTION_ID` (`FUNCTION_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Daten für Tabelle `role_sys_functions`
-- 

INSERT INTO `role_sys_functions` VALUES (2, 'ADD_SITEPAGE');
INSERT INTO `role_sys_functions` VALUES (2, 'ADD_SP_MASTER');
INSERT INTO `role_sys_functions` VALUES (2, 'ADMINISTRATION_M');
INSERT INTO `role_sys_functions` VALUES (2, 'ALLOW_CMS_LOGIN');
INSERT INTO `role_sys_functions` VALUES (2, 'B_CL_EDIT_ALL');
INSERT INTO `role_sys_functions` VALUES (2, 'B_CL_USAGE');
INSERT INTO `role_sys_functions` VALUES (2, 'B_DESTROY_TREE');
INSERT INTO `role_sys_functions` VALUES (2, 'B_EDIT_ALL');
INSERT INTO `role_sys_functions` VALUES (2, 'B_LIVE_AUTHORING');
INSERT INTO `role_sys_functions` VALUES (2, 'B_PREVIEW_PAGE');
INSERT INTO `role_sys_functions` VALUES (2, 'B_RELAUNCH_INST');
INSERT INTO `role_sys_functions` VALUES (2, 'B_RELAUNCH_TREE');
INSERT INTO `role_sys_functions` VALUES (2, 'B_USAGE');
INSERT INTO `role_sys_functions` VALUES (2, 'CLEAR_CACHE');
INSERT INTO `role_sys_functions` VALUES (2, 'CL_BROWSER');
INSERT INTO `role_sys_functions` VALUES (2, 'CL_PROPS');
INSERT INTO `role_sys_functions` VALUES (2, 'CL_TEMP_BROWSER');
INSERT INTO `role_sys_functions` VALUES (2, 'CL_USAGE');
INSERT INTO `role_sys_functions` VALUES (2, 'C_ACTIVE');
INSERT INTO `role_sys_functions` VALUES (2, 'C_CACHE');
INSERT INTO `role_sys_functions` VALUES (2, 'DELETE_CL');
INSERT INTO `role_sys_functions` VALUES (2, 'DELETE_CL_TEMP');
INSERT INTO `role_sys_functions` VALUES (2, 'DELETE_FOLDER');
INSERT INTO `role_sys_functions` VALUES (2, 'DELETE_OBJECT');
INSERT INTO `role_sys_functions` VALUES (2, 'DELETE_SITEPAGE');
INSERT INTO `role_sys_functions` VALUES (2, 'DELETE_SP_MASTER');
INSERT INTO `role_sys_functions` VALUES (2, 'DIRECT_URL');
INSERT INTO `role_sys_functions` VALUES (2, 'EDIT_CL_CONTENT');
INSERT INTO `role_sys_functions` VALUES (2, 'EDIT_CL_TEMP');
INSERT INTO `role_sys_functions` VALUES (2, 'EDIT_CONTENT');
INSERT INTO `role_sys_functions` VALUES (2, 'EDIT_META_DATA');
INSERT INTO `role_sys_functions` VALUES (2, 'EDIT_OBJECT');
INSERT INTO `role_sys_functions` VALUES (2, 'ED_CL_TEMP_PROPS');
INSERT INTO `role_sys_functions` VALUES (2, 'ED_FOLDER_PROPS');
INSERT INTO `role_sys_functions` VALUES (2, 'EXPLORE_SITE_M');
INSERT INTO `role_sys_functions` VALUES (2, 'EXPLORE_SITE_S');
INSERT INTO `role_sys_functions` VALUES (2, 'MAINTENANCE');
INSERT INTO `role_sys_functions` VALUES (2, 'MENU');
INSERT INTO `role_sys_functions` VALUES (2, 'META_TEMP');
INSERT INTO `role_sys_functions` VALUES (2, 'MY_PORTALS');
INSERT INTO `role_sys_functions` VALUES (2, 'MY_PROFILE');
INSERT INTO `role_sys_functions` VALUES (2, 'NEW_CL_TEMP');
INSERT INTO `role_sys_functions` VALUES (2, 'NEW_FOLDER');
INSERT INTO `role_sys_functions` VALUES (2, 'NEW_OBJECT');
INSERT INTO `role_sys_functions` VALUES (2, 'OBJECT_BROWSER');
INSERT INTO `role_sys_functions` VALUES (2, 'OBJECT_PROPS');
INSERT INTO `role_sys_functions` VALUES (2, 'OBJ_USAGE');
INSERT INTO `role_sys_functions` VALUES (2, 'PORTAL_MANAGER');
INSERT INTO `role_sys_functions` VALUES (2, 'RESOURCES_M');
INSERT INTO `role_sys_functions` VALUES (2, 'ROLLOUT');
INSERT INTO `role_sys_functions` VALUES (2, 'SITEPAGE_MASTER');
INSERT INTO `role_sys_functions` VALUES (2, 'SITEPAGE_PROPS');
INSERT INTO `role_sys_functions` VALUES (2, 'VARIATIONS');
INSERT INTO `role_sys_functions` VALUES (3, 'ADD_SITEPAGE');
INSERT INTO `role_sys_functions` VALUES (3, 'ADMINISTRATION_M');
INSERT INTO `role_sys_functions` VALUES (3, 'ALLOW_CMS_LOGIN');
INSERT INTO `role_sys_functions` VALUES (3, 'B_CL_EDIT_ALL');
INSERT INTO `role_sys_functions` VALUES (3, 'B_CL_USAGE');
INSERT INTO `role_sys_functions` VALUES (3, 'B_EDIT_ALL');
INSERT INTO `role_sys_functions` VALUES (3, 'B_LIVE_AUTHORING');
INSERT INTO `role_sys_functions` VALUES (3, 'B_PREVIEW_PAGE');
INSERT INTO `role_sys_functions` VALUES (3, 'B_USAGE');
INSERT INTO `role_sys_functions` VALUES (3, 'CL_BROWSER');
INSERT INTO `role_sys_functions` VALUES (3, 'CL_PROPS');
INSERT INTO `role_sys_functions` VALUES (3, 'DELETE_OBJECT');
INSERT INTO `role_sys_functions` VALUES (3, 'DELETE_SITEPAGE');
INSERT INTO `role_sys_functions` VALUES (3, 'EDIT_CL_CONTENT');
INSERT INTO `role_sys_functions` VALUES (3, 'EDIT_CONTENT');
INSERT INTO `role_sys_functions` VALUES (3, 'EDIT_META_DATA');
INSERT INTO `role_sys_functions` VALUES (3, 'EDIT_OBJECT');
INSERT INTO `role_sys_functions` VALUES (3, 'EXPLORE_SITE_M');
INSERT INTO `role_sys_functions` VALUES (3, 'EXPLORE_SITE_S');
INSERT INTO `role_sys_functions` VALUES (3, 'MENU');
INSERT INTO `role_sys_functions` VALUES (3, 'MY_PORTALS');
INSERT INTO `role_sys_functions` VALUES (3, 'MY_PROFILE');
INSERT INTO `role_sys_functions` VALUES (3, 'NEW_FOLDER');
INSERT INTO `role_sys_functions` VALUES (3, 'NEW_OBJECT');
INSERT INTO `role_sys_functions` VALUES (3, 'OBJECT_BROWSER');
INSERT INTO `role_sys_functions` VALUES (3, 'OBJECT_PROPS');
INSERT INTO `role_sys_functions` VALUES (3, 'RESOURCES_M');
INSERT INTO `role_sys_functions` VALUES (3, 'SITEPAGE_PROPS');
INSERT INTO `role_sys_functions` VALUES (5, 'ADMINISTRATION_M');
INSERT INTO `role_sys_functions` VALUES (5, 'ALLOW_CMS_LOGIN');
INSERT INTO `role_sys_functions` VALUES (5, 'B_EDIT_ALL');
INSERT INTO `role_sys_functions` VALUES (5, 'B_LIVE_AUTHORING');
INSERT INTO `role_sys_functions` VALUES (5, 'B_PREVIEW_PAGE');
INSERT INTO `role_sys_functions` VALUES (5, 'B_RELAUNCH_TREE');
INSERT INTO `role_sys_functions` VALUES (5, 'B_USAGE');
INSERT INTO `role_sys_functions` VALUES (5, 'EDIT_CONTENT');
INSERT INTO `role_sys_functions` VALUES (5, 'EDIT_META_DATA');
INSERT INTO `role_sys_functions` VALUES (5, 'EXPLORE_SITE_M');
INSERT INTO `role_sys_functions` VALUES (5, 'EXPLORE_SITE_S');
INSERT INTO `role_sys_functions` VALUES (5, 'MENU');
INSERT INTO `role_sys_functions` VALUES (5, 'MY_PORTALS');
INSERT INTO `role_sys_functions` VALUES (5, 'MY_PROFILE');
INSERT INTO `role_sys_functions` VALUES (5, 'PLUGINS_M');
INSERT INTO `role_sys_functions` VALUES (5, 'SITEPAGE_PROPS');
INSERT INTO `role_sys_functions` VALUES (100255, 'COMMUNITY_LOGIN');
INSERT INTO `role_sys_functions` VALUES (100328, 'ADMINISTRATION_M');
INSERT INTO `role_sys_functions` VALUES (100328, 'ALLOW_CMS_LOGIN');
INSERT INTO `role_sys_functions` VALUES (100328, 'B_CL_EDIT_ALL');
INSERT INTO `role_sys_functions` VALUES (100328, 'B_EDIT_ALL');
INSERT INTO `role_sys_functions` VALUES (100328, 'B_EXPIRE_LAUNCH');
INSERT INTO `role_sys_functions` VALUES (100328, 'B_LIVE_AUTHORING');
INSERT INTO `role_sys_functions` VALUES (100328, 'B_PREVIEW_PAGE');
INSERT INTO `role_sys_functions` VALUES (100328, 'DELETE_OBJECT');
INSERT INTO `role_sys_functions` VALUES (100328, 'EDIT_CL_CONTENT');
INSERT INTO `role_sys_functions` VALUES (100328, 'EDIT_CONTENT');
INSERT INTO `role_sys_functions` VALUES (100328, 'EDIT_META_DATA');
INSERT INTO `role_sys_functions` VALUES (100328, 'EDIT_OBJECT');
INSERT INTO `role_sys_functions` VALUES (100328, 'EXPLORE_SITE_M');
INSERT INTO `role_sys_functions` VALUES (100328, 'MENU');
INSERT INTO `role_sys_functions` VALUES (100328, 'MY_PROFILE');
INSERT INTO `role_sys_functions` VALUES (100328, 'NEW_OBJECT');
INSERT INTO `role_sys_functions` VALUES (100328, 'OBJECT_BROWSER');
INSERT INTO `role_sys_functions` VALUES (100328, 'OBJECT_PROPS');
INSERT INTO `role_sys_functions` VALUES (100328, 'OBJ_USAGE');
INSERT INTO `role_sys_functions` VALUES (100328, 'RESOURCES_M');
INSERT INTO `role_sys_functions` VALUES (100329, 'ADMINISTRATION_M');
INSERT INTO `role_sys_functions` VALUES (100329, 'ALLOW_CMS_LOGIN');
INSERT INTO `role_sys_functions` VALUES (100329, 'MY_PROFILE');
INSERT INTO `role_sys_functions` VALUES (100329, 'TRAFFIC');

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `roles`
-- 

CREATE TABLE `roles` (
  `ROLE_ID` bigint(20) NOT NULL default '0',
  `ROLE_NAME` varchar(32) NOT NULL default '',
  `DESCRIPTION` varchar(255) default NULL,
  PRIMARY KEY  (`ROLE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Daten für Tabelle `roles`
-- 

INSERT INTO `roles` VALUES (1, 'Administrator', '');
INSERT INTO `roles` VALUES (2, 'Developer', '');
INSERT INTO `roles` VALUES (3, 'Editor', '');
INSERT INTO `roles` VALUES (5, 'Quality Manager', 'Checks, wether the quality of content is alright or not.');
INSERT INTO `roles` VALUES (100328, 'Portal Editor', '');
INSERT INTO `roles` VALUES (100329, 'Analyst', '');
INSERT INTO `roles` VALUES (100255, 'Community', '');

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `sequences`
-- 

CREATE TABLE `sequences` (
  `seq` varchar(32) NOT NULL default '',
  `val` bigint(20) NOT NULL default '1000'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Daten für Tabelle `sequences`
-- 

INSERT INTO `sequences` VALUES ('GUID', 102342);
INSERT INTO `sequences` VALUES ('log', 100271);

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `sessions2`
-- 

CREATE TABLE `sessions2` (
  `sesskey` varchar(64) collate latin1_general_ci NOT NULL default '',
  `expiry` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `expireref` varchar(250) collate latin1_general_ci default '',
  `created` timestamp NOT NULL default '0000-00-00 00:00:00',
  `modified` timestamp NOT NULL default '0000-00-00 00:00:00',
  `sessdata` longtext collate latin1_general_ci,
  PRIMARY KEY  (`sesskey`),
  KEY `sess2_expiry` (`expiry`),
  KEY `sess2_expireref` (`expireref`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- Daten für Tabelle `sessions2`
-- 

INSERT INTO `sessions2` VALUES ('b58c13f9942a43e1359f83987fd2fefa', '2007-02-14 19:59:59', '', '2007-02-14 18:40:22', '2007-02-14 19:35:59', '_phpOpenTracker_Config%7Ca%3A37%3A%7Bs%3A7%3A%22db_port%22%3Bs%3A7%3A%22default%22%3Bs%3A9%3A%22db_socket%22%3Bs%3A7%3A%22default%22%3Bs%3A21%3A%22additional_data_table%22%3Bs%3A12%3A%22pot_add_data%22%3Bs%3A15%3A%22accesslog_table%22%3Bs%3A13%3A%22pot_accesslog%22%3Bs%3A15%3A%22documents_table%22%3Bs%3A13%3A%22pot_documents%22%3Bs%3A18%3A%22exit_targets_table%22%3Bs%3A16%3A%22pot_exit_targets%22%3Bs%3A15%3A%22hostnames_table%22%3Bs%3A13%3A%22pot_hostnames%22%3Bs%3A23%3A%22operating_systems_table%22%3Bs%3A21%3A%22pot_operating_systems%22%3Bs%3A14%3A%22referers_table%22%3Bs%3A12%3A%22pot_referers%22%3Bs%3A17%3A%22user_agents_table%22%3Bs%3A15%3A%22pot_user_agents%22%3Bs%3A14%3A%22visitors_table%22%3Bs%3A12%3A%22pot_visitors%22%3Bs%3A16%3A%22document_env_var%22%3Bs%3A11%3A%22REQUEST_URI%22%3Bs%3A20%3A%22clean_referer_string%22%3Bs%3A1%3A%221%22%3Bs%3A18%3A%22clean_query_string%22%3Bs%3A1%3A%221%22%3Bs%3A20%3A%22get_parameter_filter%22%3Ba%3A0%3A%7B%7Ds%3A16%3A%22resolve_hostname%22%3Bs%3A1%3A%221%22%3Bs%3A15%3A%22group_hostnames%22%3Bs%3A1%3A%221%22%3Bs%3A17%3A%22group_user_agents%22%3Bs%3A1%3A%221%22%3Bs%3A24%3A%22track_returning_visitors%22%3Bs%3A1%3A%221%22%3Bs%3A25%3A%22returning_visitors_cookie%22%3Bs%3A14%3A%22pot_visitor_id%22%3Bs%3A34%3A%22returning_visitors_cookie_lifetime%22%3Bs%3A3%3A%22365%22%3Bs%3A7%3A%22locking%22%3Bs%3A0%3A%22%22%3Bs%3A10%3A%22log_reload%22%3Bs%3A0%3A%22%22%3Bs%3A12%3A%22jpgraph_path%22%3Bs%3A28%3A%22C%3A%5CWeb%5Cnxhp%2Fcms%2Fext%2Fjpgraph%2F%22%3Bs%3A22%3A%22merge_tables_threshold%22%3Bs%3A1%3A%226%22%3Bs%3A22%3A%22logging_engine_plugins%22%3Ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22nxlog%22%3Bi%3A1%3Bs%3A14%3A%22search_engines%22%3B%7Ds%3A11%3A%22query_cache%22%3Bs%3A0%3A%22%22%3Bs%3A15%3A%22query_cache_dir%22%3Bs%3A5%3A%22%2Ftmp%2F%22%3Bs%3A20%3A%22query_cache_lifetime%22%3Bs%3A4%3A%223600%22%3Bs%3A11%3A%22debug_level%22%3Bs%3A1%3A%221%22%3Bs%3A20%3A%22exit_on_fatal_errors%22%3Bs%3A0%3A%22%22%3Bs%3A10%3A%22log_errors%22%3Bs%3A0%3A%22%22%3Bs%3A7%3A%22db_type%22%3Bs%3A5%3A%22mysql%22%3Bs%3A7%3A%22db_host%22%3Bs%3A9%3A%22localhost%22%3Bs%3A7%3A%22db_user%22%3Bs%3A4%3A%22root%22%3Bs%3A11%3A%22db_password%22%3Bs%3A0%3A%22%22%3Bs%3A11%3A%22db_database%22%3Bs%3A7%3A%22nxhpnew%22%3B%7D_phpOpenTracker_Container%7Ca%3A22%3A%7Bs%3A13%3A%22first_request%22%3Bb%3A0%3Bs%3A9%3A%22client_id%22%3Bi%3A1%3Bs%3A12%3A%22accesslog_id%22%3Bi%3A-162883207%3Bs%3A10%3A%22ip_address%22%3Bs%3A9%3A%22127.0.0.1%22%3Bs%3A9%3A%22host_orig%22%3Bs%3A7%3A%22Jupiter%22%3Bs%3A4%3A%22host%22%3Bs%3A7%3A%22Jupiter%22%3Bs%3A15%3A%22user_agent_orig%22%3Bs%3A118%3A%22Mozilla%2F4.0%20%28compatible%3B%20MSIE%207.0%3B%20Windows%20NT%206.0%3B%20SLCC1%3B%20.NET%20CLR%202.0.50727%3B%20Media%20Center%20PC%205.0%3B%20.NET%20CLR%203.0.04506%29%22%3Bs%3A16%3A%22operating_system%22%3Bs%3A10%3A%22Windows%20NT%22%3Bs%3A10%3A%22user_agent%22%3Bs%3A24%3A%22MS%20Internet%20Explorer%207.0%22%3Bs%3A7%3A%22host_id%22%3Bi%3A-1547679841%3Bs%3A19%3A%22operating_system_id%22%3Bi%3A-490331943%3Bs%3A13%3A%22user_agent_id%22%3Bi%3A-516513586%3Bs%3A12%3A%22referer_orig%22%3Bs%3A0%3A%22%22%3Bs%3A7%3A%22referer%22%3Bs%3A0%3A%22%22%3Bs%3A10%3A%22referer_id%22%3Bi%3A0%3Bs%3A12%3A%22document_url%22%3Bs%3A47%3A%22http%3A%2F%2Flocalhost%2Fnxhp%2Fwww%2Fen%2Fstart%2Fphp_classes%2F%22%3Bs%3A8%3A%22document%22%3Bs%3A6%3A%22101959%22%3Bs%3A11%3A%22document_id%22%3Bi%3A1104987720%3Bs%3A9%3A%22timestamp%22%3Bi%3A1171478159%3Bs%3A10%3A%22visitor_id%22%3Bs%3A10%3A%22-392168544%22%3Bs%3A17%3A%22returning_visitor%22%3Bb%3A1%3Bs%3A13%3A%22last_document%22%3Bs%3A6%3A%22101953%22%3B%7D');

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `shop_configurator`
-- 

CREATE TABLE `shop_configurator` (
  `CONFIGURATOR_ID` bigint(20) NOT NULL,
  `NAME` varchar(64) collate latin1_general_ci NOT NULL,
  `DESCRIPTION` varchar(255) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`CONFIGURATOR_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- Daten für Tabelle `shop_configurator`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `shop_configurator_item`
-- 

CREATE TABLE `shop_configurator_item` (
  `GUID` bigint(20) NOT NULL,
  `CONFIGURATOR_ID` bigint(20) NOT NULL,
  `POSITION` int(3) NOT NULL,
  `TYPE` int(3) NOT NULL,
  `TITLE` varchar(255) collate latin1_general_ci NOT NULL,
  `VALUE` varchar(1024) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`GUID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- Daten für Tabelle `shop_configurator_item`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `shop_tax`
-- 

CREATE TABLE `shop_tax` (
  `TAX_ID` bigint(20) NOT NULL default '0',
  `NAME` varchar(128) collate latin1_general_ci NOT NULL default '',
  `PERCENT` float NOT NULL default '0',
  PRIMARY KEY  (`TAX_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- Daten für Tabelle `shop_tax`
-- 

INSERT INTO `shop_tax` VALUES (100902, 'MwSt normal', 19);
INSERT INTO `shop_tax` VALUES (100905, 'MWST Food', 7);

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `sitemap`
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
-- Daten für Tabelle `sitemap`
-- 

INSERT INTO `sitemap` VALUES (101824, 101410, 101807, 'Evaluation', 2, 0, 0, 0, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (101815, 101410, 101807, 'Information Center', 1, 0, 0, 0, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (101714, 101681, 100032, 'Disclaimer', 3, 0, 0, 10, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (101713, 101681, 100109, 'Sitemap', 2, 0, 0, 10, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (100180, 100042, 100170, 'News', 4, 0, 0, 10, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (101712, 101681, 101690, 'Contact', 1, 0, 0, 10, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (101562, 0, 100079, 'Servicepages', 2, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `sitemap` VALUES (101572, 101562, 100312, 'Contact', 1, 0, 0, 0, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (101579, 101562, 100058, 'Sitemap', 2, 0, 0, 0, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (101586, 101562, 100017, 'Disclaimer', 3, 0, 0, 0, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (101508, 100042, 101495, 'Start', 1, 0, 0, 10, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (101410, 0, 101397, 'Start', 1, 0, 0, 0, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (101681, 100042, 100103, 'Servicepages', 2, 0, 0, 10, 0, 0, 0, NULL);
INSERT INTO `sitemap` VALUES (101833, 101410, 101807, 'Developer Ressources', 3, 0, 0, 0, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (101842, 101410, 101807, 'PHP Classes', 4, 0, 0, 0, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (101943, 101508, 101934, 'Evaluation', 2, 0, 0, 10, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (101944, 101508, 101934, 'Information Center', 1, 0, 0, 10, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (101945, 101508, 101934, 'Developer Ressources', 3, 0, 0, 10, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (101946, 101508, 101934, 'PHP Classes', 4, 0, 0, 10, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (102025, 101815, 100017, 'Introduction to CMS', 2, 0, 0, 0, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (102042, 101815, 100017, 'Highlights', 3, 0, 0, 0, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (102139, 101842, 100017, 'API to Google Maps', 1, 0, 0, 0, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (102289, 101946, 100032, 'API to Google Maps', 1, 0, 0, 10, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (102299, 101944, 100032, 'Introduction to CMS', 1, 0, 0, 10, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (102300, 101944, 100032, 'Highlights', 2, 0, 0, 10, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (102328, 101815, 101212, 'Development Blog', 1, 0, 0, 0, 1, 1, 0, NULL);

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `sitepage`
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
-- Daten für Tabelle `sitepage`
-- 

INSERT INTO `sitepage` VALUES (101716, 100109, 101713, 1, 101717, NULL, NULL, 0, 0, 10);
INSERT INTO `sitepage` VALUES (101689, 101690, 101712, 1, 101710, NULL, NULL, 0, 0, 10);
INSERT INTO `sitepage` VALUES (101685, 100103, 101681, 1, 101686, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 10);
INSERT INTO `sitepage` VALUES (101587, 100017, 101586, 1, 101588, NULL, NULL, 0, 0, 0);
INSERT INTO `sitepage` VALUES (101580, 100058, 101579, 1, 101581, NULL, NULL, 0, 0, 0);
INSERT INTO `sitepage` VALUES (100144, 100142, 100143, 1, 100145, NULL, NULL, 0, 0, 0);
INSERT INTO `sitepage` VALUES (100196, 100182, 100200, 1, 100197, NULL, NULL, 0, 0, 10);
INSERT INTO `sitepage` VALUES (100169, 100170, 100180, 1, 100175, NULL, NULL, 0, 0, 10);
INSERT INTO `sitepage` VALUES (100192, 100137, 100191, 1, 100193, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0);
INSERT INTO `sitepage` VALUES (101953, 101934, 101945, 1, 101954, NULL, NULL, 0, 0, 10);
INSERT INTO `sitepage` VALUES (101573, 100312, 101572, 1, 101574, NULL, NULL, 0, 0, 0);
INSERT INTO `sitepage` VALUES (101959, 101934, 101946, 1, 101960, NULL, NULL, 0, 0, 10);
INSERT INTO `sitepage` VALUES (101563, 100079, 101562, 1, 101564, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0);
INSERT INTO `sitepage` VALUES (101933, 101934, 101943, 1, 101939, NULL, NULL, 0, 0, 10);
INSERT INTO `sitepage` VALUES (101843, 101807, 101842, 1, 101844, NULL, NULL, 0, 0, 0);
INSERT INTO `sitepage` VALUES (101834, 101807, 101833, 1, 101835, NULL, NULL, 0, 0, 0);
INSERT INTO `sitepage` VALUES (101931, 101934, 101944, 1, 101948, NULL, NULL, 0, 0, 10);
INSERT INTO `sitepage` VALUES (101720, 100032, 101714, 1, 101721, NULL, NULL, 0, 0, 10);
INSERT INTO `sitepage` VALUES (101494, 101495, 101508, 1, 101503, NULL, NULL, 0, 0, 10);
INSERT INTO `sitepage` VALUES (101411, 101397, 101410, 1, 101412, NULL, NULL, 0, 0, 0);
INSERT INTO `sitepage` VALUES (101816, 101807, 101815, 1, 101817, NULL, NULL, 0, 0, 0);
INSERT INTO `sitepage` VALUES (101825, 101807, 101824, 1, 101826, NULL, NULL, 0, 0, 0);
INSERT INTO `sitepage` VALUES (102026, 100017, 102025, 1, 102027, NULL, NULL, 0, 0, 0);
INSERT INTO `sitepage` VALUES (102043, 100017, 102042, 1, 102044, NULL, NULL, 0, 0, 0);
INSERT INTO `sitepage` VALUES (102140, 100017, 102139, 1, 102141, NULL, NULL, 0, 0, 0);
INSERT INTO `sitepage` VALUES (102284, 100032, 102289, 1, 102285, NULL, NULL, 0, 0, 10);
INSERT INTO `sitepage` VALUES (102294, 100032, 102299, 1, 102295, NULL, NULL, 0, 0, 10);
INSERT INTO `sitepage` VALUES (102301, 100032, 102300, 1, 102302, NULL, NULL, 0, 0, 10);
INSERT INTO `sitepage` VALUES (102329, 101212, 102328, 1, 102330, NULL, NULL, 0, 0, 0);

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `sitepage_master`
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
-- Daten für Tabelle `sitepage_master`
-- 

INSERT INTO `sitepage_master` VALUES (100017, 'Text', '- Headline\r\n- HTML-Text', 'text.php', 100014, 1, 0, 'HTML_Page.png', 0);
INSERT INTO `sitepage_master` VALUES (100052, 'External Page', 'Opens a new window and displays the URL which is stored in the template.', 'external.php', 100050, 1, 0, 'Popup.png', 0);
INSERT INTO `sitepage_master` VALUES (100058, 'Sitemap', 'Draws a sitemap for your homepage.', 'sitemap.php', 100063, 1, 0, 'Sitemap.png', 0);
INSERT INTO `sitepage_master` VALUES (100079, 'Menu Separator', 'Use for creating menu-sections with no content. If the page is clicked, the system does an automatic forwarding to the first childpage.', 'separator.php', 100078, 1, 0, 'X.png', 0);
INSERT INTO `sitepage_master` VALUES (101690, 'Contact  (Mailing System)', 'Contact form. The request are written to the database and can be anwered in E-Services/Mailings.', 'contact2.php', 101691, 1, 0, NULL, 10);
INSERT INTO `sitepage_master` VALUES (101495, 'Startpage', 'Startpage with image and teaser.', 'start.php', 101496, 1, 0, NULL, 10);
INSERT INTO `sitepage_master` VALUES (100103, 'Menu Separator', 'Use for creating menu-sections with no content. If the page is clicked, the system does an automatic forwarding to the first childpage.', 'separator.php', 100104, 1, 0, NULL, 10);
INSERT INTO `sitepage_master` VALUES (100137, 'Article Page', 'Special Template for displaying an article. Articles are grouped in channels. When you setup a channel, you can define a output page for each channel category. Output pages are based on this template', 'article.php', 100167, 1, 0, 'Article.png', 0);
INSERT INTO `sitepage_master` VALUES (100142, 'Article Overview', 'Displays a list with the selected articles from a channel. Use this template to create a overview page for News and other articles.', 'article_overview.php', 100138, 1, 0, 'Overview.png', 0);
INSERT INTO `sitepage_master` VALUES (100170, 'Article Overview', 'Displays a list with the selected articles from a channel. Use this template to create a overview page for News and other articles.', 'article_overview.php', 100171, 1, 0, NULL, 10);
INSERT INTO `sitepage_master` VALUES (100182, 'Article Page', 'Special Template for displaying an article. Articles are grouped in channels. When you setup a channel, you can define a output page for each channel category. Output pages are based on this template', 'article.php', 100183, 1, 0, NULL, 10);
INSERT INTO `sitepage_master` VALUES (100572, 'Contact (Send Email)', 'Contact form. The form is send to you by email.', 'contact.php', 100335, 1, 0, 'Form.png', 0);
INSERT INTO `sitepage_master` VALUES (100312, 'Contact  (Mailing System)', 'Contact form. The request are written to the database and can be anwered in E-Services/Mailings.', 'contact2.php', 100554, 1, 0, 'Form.png', 0);
INSERT INTO `sitepage_master` VALUES (100513, 'RSS Creator', 'Create a RSS-Feed out of a channel.', 'rss.php', 100511, 1, 0, 'XML.png', 0);
INSERT INTO `sitepage_master` VALUES (101212, 'RSS Reader', 'Load a RSS feed and display it on the homepage.', 'rssdisp.php', 101177, 1, 0, 'Overview2.png', 0);
INSERT INTO `sitepage_master` VALUES (100436, 'Gallery', 'Template for creating image galleries', 'gallery.php', 100428, 1, 0, 'Gallery.png', 0);
INSERT INTO `sitepage_master` VALUES (101397, 'Startpage', 'Startpage with image and teaser.', 'start.php', 101348, 1, 0, 'Overview.png', 0);
INSERT INTO `sitepage_master` VALUES (101182, 'Show In Frame', 'Use this template, to show the content of an URL in an embedded frame (iframe).', 'inline.php', 100560, 1, 0, 'IFrame.png', 0);
INSERT INTO `sitepage_master` VALUES (100639, 'Map', 'View a address with Google Maps.', 'map.php', 100612, 1, 0, 'Map.png', 0);
INSERT INTO `sitepage_master` VALUES (100743, 'Search Engine', 'This page implements a search engine in your website. You must run the spiders before you can use the integrated searchengine. Therefore go to Maintenance/Search Indexing.', 'search.php', 100716, 1, 0, 'Search.png', 0);
INSERT INTO `sitepage_master` VALUES (100109, 'Sitemap', 'Draws a sitemap for your homepage.', 'sitemap.php', 100110, 1, 0, NULL, 10);
INSERT INTO `sitepage_master` VALUES (100032, 'Text', '- Headline\r\n- HTML-Text', 'text.php', 100033, 1, 0, NULL, 10);
INSERT INTO `sitepage_master` VALUES (101807, 'Overview', 'Overview for section pages', 'overview.php', 101776, 1, 0, 'Overview2.png', 0);
INSERT INTO `sitepage_master` VALUES (101934, 'Overview', 'Overview for section pages', 'overview.php', 101935, 1, 0, NULL, 10);

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `sitepage_names`
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
-- Daten für Tabelle `sitepage_names`
-- 

INSERT INTO `sitepage_names` VALUES (101720, 1, 'Disclaimer', '', '', 0, 10);
INSERT INTO `sitepage_names` VALUES (101816, 1, 'Information Center', NULL, '', 0, 0);
INSERT INTO `sitepage_names` VALUES (101716, 1, 'Sitemap', '', '', 0, 10);
INSERT INTO `sitepage_names` VALUES (101689, 1, 'Contact', '', '', 0, 10);
INSERT INTO `sitepage_names` VALUES (101685, 1, 'Servicepages', '', '', 0, 10);
INSERT INTO `sitepage_names` VALUES (101587, 1, 'Disclaimer', NULL, '', 0, 0);
INSERT INTO `sitepage_names` VALUES (100144, 1, 'News', NULL, '', 0, 0);
INSERT INTO `sitepage_names` VALUES (100196, 1, 'Articles', '', '', 0, 10);
INSERT INTO `sitepage_names` VALUES (100169, 1, 'News', '', '', 0, 10);
INSERT INTO `sitepage_names` VALUES (100192, 1, 'Articles', NULL, '', 0, 0);
INSERT INTO `sitepage_names` VALUES (101580, 1, 'Sitemap', NULL, '', 0, 0);
INSERT INTO `sitepage_names` VALUES (101573, 1, 'Contact', NULL, '', 0, 0);
INSERT INTO `sitepage_names` VALUES (101834, 1, 'Developer Ressources', NULL, '', 0, 0);
INSERT INTO `sitepage_names` VALUES (101825, 1, 'Evaluation', NULL, '', 0, 0);
INSERT INTO `sitepage_names` VALUES (101411, 1, 'Start', NULL, '', 0, 0);
INSERT INTO `sitepage_names` VALUES (101494, 1, 'Start', '', '', 0, 10);
INSERT INTO `sitepage_names` VALUES (101563, 1, 'Servicepages', NULL, '', 0, 0);
INSERT INTO `sitepage_names` VALUES (101843, 1, 'PHP Classes', NULL, '', 0, 0);
INSERT INTO `sitepage_names` VALUES (101933, 1, 'Evaluation', '', '', 0, 10);
INSERT INTO `sitepage_names` VALUES (101931, 1, 'Information Center', '', '', 0, 10);
INSERT INTO `sitepage_names` VALUES (101953, 1, 'Developer Ressources', '', '', 0, 10);
INSERT INTO `sitepage_names` VALUES (101959, 1, 'PHP Classes', '', '', 0, 10);
INSERT INTO `sitepage_names` VALUES (102026, 1, 'Introduction to Content Management', '', '', 0, 0);
INSERT INTO `sitepage_names` VALUES (102043, 1, 'Highlights', NULL, '', 0, 0);
INSERT INTO `sitepage_names` VALUES (102140, 1, 'API to Google Maps', NULL, '', 0, 0);
INSERT INTO `sitepage_names` VALUES (102284, 1, 'API to Google Maps', '', '', 0, 10);
INSERT INTO `sitepage_names` VALUES (102294, 1, 'Introduction to Content Management', '', '', 0, 10);
INSERT INTO `sitepage_names` VALUES (102301, 1, 'Highlights', '', '', 0, 10);
INSERT INTO `sitepage_names` VALUES (102329, 1, 'Development Blog', NULL, '', 0, 0);

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `sitepage_owner`
-- 

CREATE TABLE `sitepage_owner` (
  `SPID` bigint(20) NOT NULL default '0',
  `GROUP_ID` bigint(20) NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Daten für Tabelle `sitepage_owner`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `sitepage_types`
-- 

CREATE TABLE `sitepage_types` (
  `SPMTYPE_ID` bigint(20) NOT NULL default '0',
  `NAME` varchar(16) NOT NULL default ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Daten für Tabelle `sitepage_types`
-- 

INSERT INTO `sitepage_types` VALUES (1, 'SINGLEPAGE');
INSERT INTO `sitepage_types` VALUES (2, 'MULTIPAGE');
INSERT INTO `sitepage_types` VALUES (3, 'PORTAL');

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `sitepage_variations`
-- 

CREATE TABLE `sitepage_variations` (
  `SPM_ID` bigint(20) NOT NULL default '0',
  `VARIATION_ID` bigint(20) NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Daten für Tabelle `sitepage_variations`
-- 

INSERT INTO `sitepage_variations` VALUES (100017, 1);
INSERT INTO `sitepage_variations` VALUES (100109, 1);
INSERT INTO `sitepage_variations` VALUES (100052, 1);
INSERT INTO `sitepage_variations` VALUES (100058, 1);
INSERT INTO `sitepage_variations` VALUES (100079, 1);
INSERT INTO `sitepage_variations` VALUES (101690, 1);
INSERT INTO `sitepage_variations` VALUES (100103, 1);
INSERT INTO `sitepage_variations` VALUES (101495, 1);
INSERT INTO `sitepage_variations` VALUES (100137, 1);
INSERT INTO `sitepage_variations` VALUES (100142, 1);
INSERT INTO `sitepage_variations` VALUES (100154, 1);
INSERT INTO `sitepage_variations` VALUES (100170, 1);
INSERT INTO `sitepage_variations` VALUES (100182, 1);
INSERT INTO `sitepage_variations` VALUES (100572, 1);
INSERT INTO `sitepage_variations` VALUES (100312, 1);
INSERT INTO `sitepage_variations` VALUES (100513, 1);
INSERT INTO `sitepage_variations` VALUES (101212, 1);
INSERT INTO `sitepage_variations` VALUES (100436, 1);
INSERT INTO `sitepage_variations` VALUES (101397, 1);
INSERT INTO `sitepage_variations` VALUES (101182, 1);
INSERT INTO `sitepage_variations` VALUES (100639, 1);
INSERT INTO `sitepage_variations` VALUES (100743, 1);
INSERT INTO `sitepage_variations` VALUES (100032, 1);
INSERT INTO `sitepage_variations` VALUES (101807, 1);
INSERT INTO `sitepage_variations` VALUES (101934, 1);

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `state_translation`
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
-- Daten für Tabelle `state_translation`
-- 

INSERT INTO `state_translation` VALUES (100019, 100031, 10, '2006-08-13 19:01:52', 1);
INSERT INTO `state_translation` VALUES (100017, 100032, 10, '2006-08-09 22:05:37', 0);
INSERT INTO `state_translation` VALUES (100014, 100033, 10, '2007-02-14 19:35:03', 0);
INSERT INTO `state_translation` VALUES (2, 100034, 10, '2007-02-14 19:35:03', 0);
INSERT INTO `state_translation` VALUES (100015, 100035, 10, '2007-02-14 19:35:03', 0);
INSERT INTO `state_translation` VALUES (100016, 100036, 10, '2007-02-14 19:35:03', 0);
INSERT INTO `state_translation` VALUES (100020, 100037, 10, '2006-08-11 20:06:03', 0);
INSERT INTO `state_translation` VALUES (100021, 100038, 10, '2006-08-13 19:01:52', 1);
INSERT INTO `state_translation` VALUES (100022, 100039, 10, '2006-08-11 20:06:03', 0);
INSERT INTO `state_translation` VALUES (100023, 100040, 10, '2006-08-11 20:06:03', 0);
INSERT INTO `state_translation` VALUES (100018, 100041, 10, '2006-08-13 19:01:52', 1);
INSERT INTO `state_translation` VALUES (0, 100042, 10, '2006-08-09 22:05:37', 0);
INSERT INTO `state_translation` VALUES (100080, 100084, 10, '2006-08-13 19:02:06', 1);
INSERT INTO `state_translation` VALUES (100054, 100086, 10, '2006-08-13 19:01:52', 1);
INSERT INTO `state_translation` VALUES (100052, 100087, 10, '2006-08-11 11:17:08', 0);
INSERT INTO `state_translation` VALUES (100050, 100088, 10, '2006-08-11 20:06:03', 0);
INSERT INTO `state_translation` VALUES (100051, 100089, 10, '2006-08-11 20:06:03', 0);
INSERT INTO `state_translation` VALUES (100055, 100090, 10, '2006-08-11 20:06:03', 0);
INSERT INTO `state_translation` VALUES (100056, 100091, 10, '2006-08-13 19:01:52', 1);
INSERT INTO `state_translation` VALUES (100057, 100092, 10, '2006-08-11 20:06:03', 0);
INSERT INTO `state_translation` VALUES (100053, 100093, 10, '2006-08-13 19:01:52', 1);
INSERT INTO `state_translation` VALUES (100073, 100095, 10, '2006-08-13 19:01:52', 1);
INSERT INTO `state_translation` VALUES (100074, 100096, 10, '2006-08-11 20:06:03', 0);
INSERT INTO `state_translation` VALUES (100075, 100097, 10, '2006-08-13 19:01:52', 1);
INSERT INTO `state_translation` VALUES (100076, 100098, 10, '2006-08-11 20:06:03', 0);
INSERT INTO `state_translation` VALUES (100077, 100099, 10, '2006-08-11 20:06:03', 0);
INSERT INTO `state_translation` VALUES (100072, 100100, 10, '2006-08-13 19:01:52', 1);
INSERT INTO `state_translation` VALUES (100081, 100102, 10, '2006-08-13 19:02:06', 1);
INSERT INTO `state_translation` VALUES (100079, 100103, 10, '2006-08-11 11:17:08', 0);
INSERT INTO `state_translation` VALUES (100078, 100104, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (100082, 100105, 10, '2006-08-11 20:06:03', 0);
INSERT INTO `state_translation` VALUES (100083, 100106, 10, '2006-08-13 19:02:06', 1);
INSERT INTO `state_translation` VALUES (100067, 100108, 10, '2006-08-13 19:02:06', 1);
INSERT INTO `state_translation` VALUES (100058, 100109, 10, '2006-08-11 11:17:08', 0);
INSERT INTO `state_translation` VALUES (100063, 100110, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (100064, 100111, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (100065, 100112, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (100068, 100113, 10, '2006-08-11 20:06:03', 0);
INSERT INTO `state_translation` VALUES (100069, 100114, 10, '2006-08-13 19:02:06', 1);
INSERT INTO `state_translation` VALUES (100070, 100115, 10, '2006-08-11 20:06:03', 0);
INSERT INTO `state_translation` VALUES (100071, 100116, 10, '2006-08-11 20:06:03', 0);
INSERT INTO `state_translation` VALUES (100066, 100117, 10, '2006-08-13 19:02:06', 1);
INSERT INTO `state_translation` VALUES (100008, 100122, 10, '2006-08-11 15:07:05', 0);
INSERT INTO `state_translation` VALUES (100009, 100123, 10, '2006-08-11 15:07:05', 0);
INSERT INTO `state_translation` VALUES (100002, 100124, 10, '2006-08-11 15:07:09', 0);
INSERT INTO `state_translation` VALUES (100003, 100125, 10, '2006-08-11 15:07:09', 0);
INSERT INTO `state_translation` VALUES (100048, 100126, 10, '2006-08-11 15:07:14', 0);
INSERT INTO `state_translation` VALUES (100049, 100127, 10, '2006-08-11 15:07:14', 0);
INSERT INTO `state_translation` VALUES (100046, 100128, 10, '2006-08-11 15:07:16', 0);
INSERT INTO `state_translation` VALUES (100047, 100129, 10, '2006-08-11 15:07:16', 0);
INSERT INTO `state_translation` VALUES (100130, 100132, 10, '2007-02-11 10:08:13', 0);
INSERT INTO `state_translation` VALUES (100131, 100133, 10, '2007-02-11 10:08:13', 0);
INSERT INTO `state_translation` VALUES (100157, 100160, 10, '2006-08-13 19:04:29', 1);
INSERT INTO `state_translation` VALUES (100156, 100161, 10, '2006-08-11 20:06:03', 0);
INSERT INTO `state_translation` VALUES (100134, 100162, 10, '2006-08-11 20:06:03', 0);
INSERT INTO `state_translation` VALUES (100135, 100163, 10, '2006-08-11 20:06:03', 0);
INSERT INTO `state_translation` VALUES (100136, 100164, 10, '2006-08-11 20:06:03', 0);
INSERT INTO `state_translation` VALUES (100158, 100165, 10, '2006-08-11 20:06:03', 0);
INSERT INTO `state_translation` VALUES (100159, 100166, 10, '2006-08-11 20:06:03', 0);
INSERT INTO `state_translation` VALUES (100144, 100169, 10, '2006-08-11 14:30:47', 0);
INSERT INTO `state_translation` VALUES (100142, 100170, 10, '2006-08-11 14:29:11', 0);
INSERT INTO `state_translation` VALUES (100138, 100171, 10, '2006-08-11 20:06:03', 0);
INSERT INTO `state_translation` VALUES (100139, 100172, 10, '2006-08-11 20:06:03', 0);
INSERT INTO `state_translation` VALUES (100140, 100173, 10, '2006-08-11 20:06:03', 0);
INSERT INTO `state_translation` VALUES (100141, 100174, 10, '2006-08-11 20:06:03', 0);
INSERT INTO `state_translation` VALUES (100145, 100175, 10, '2006-08-11 14:30:47', 0);
INSERT INTO `state_translation` VALUES (100146, 100176, 10, '2006-08-11 14:29:11', 0);
INSERT INTO `state_translation` VALUES (100147, 100177, 10, '2006-08-11 14:30:47', 0);
INSERT INTO `state_translation` VALUES (100148, 100178, 10, '2006-08-11 14:30:47', 0);
INSERT INTO `state_translation` VALUES (100149, 100179, 10, '2006-08-11 14:30:47', 0);
INSERT INTO `state_translation` VALUES (100143, 100180, 10, '2006-08-11 14:30:47', 0);
INSERT INTO `state_translation` VALUES (100151, 100181, 10, '2006-08-11 15:01:50', 1);
INSERT INTO `state_translation` VALUES (100137, 100182, 10, '2006-08-11 14:29:11', 0);
INSERT INTO `state_translation` VALUES (100167, 100183, 10, '2006-08-11 20:06:03', 0);
INSERT INTO `state_translation` VALUES (100168, 100184, 10, '2006-08-11 20:06:03', 0);
INSERT INTO `state_translation` VALUES (100152, 100185, 10, '2006-08-11 14:53:11', 0);
INSERT INTO `state_translation` VALUES (100153, 100186, 10, '2006-08-11 15:01:50', 1);
INSERT INTO `state_translation` VALUES (100150, 100187, 10, '2006-08-11 15:01:50', 1);
INSERT INTO `state_translation` VALUES (100188, 100189, 10, '2006-08-11 14:53:11', 0);
INSERT INTO `state_translation` VALUES (100192, 100196, 10, '2006-08-11 15:06:18', 0);
INSERT INTO `state_translation` VALUES (100193, 100197, 10, '2006-08-11 15:06:18', 0);
INSERT INTO `state_translation` VALUES (100194, 100198, 10, '2006-08-11 15:05:11', 0);
INSERT INTO `state_translation` VALUES (100195, 100199, 10, '2006-08-11 15:06:18', 0);
INSERT INTO `state_translation` VALUES (100191, 100200, 10, '2006-08-11 15:06:18', 0);
INSERT INTO `state_translation` VALUES (100202, 100207, 10, '2006-08-11 15:16:21', 1);
INSERT INTO `state_translation` VALUES (100203, 100208, 10, '2006-08-11 15:16:15', 0);
INSERT INTO `state_translation` VALUES (100204, 100209, 10, '2006-08-11 15:16:21', 1);
INSERT INTO `state_translation` VALUES (100205, 100210, 10, '2006-08-11 15:16:15', 0);
INSERT INTO `state_translation` VALUES (100206, 100211, 10, '2006-08-11 15:16:15', 0);
INSERT INTO `state_translation` VALUES (100201, 100212, 10, '2006-08-11 15:16:21', 1);
INSERT INTO `state_translation` VALUES (100237, 100243, 10, '2006-08-13 19:02:19', 1);
INSERT INTO `state_translation` VALUES (100238, 100244, 10, '2006-08-11 20:06:03', 0);
INSERT INTO `state_translation` VALUES (100239, 100245, 10, '2006-08-13 19:02:19', 1);
INSERT INTO `state_translation` VALUES (100240, 100246, 10, '2006-08-11 20:06:03', 0);
INSERT INTO `state_translation` VALUES (100241, 100247, 10, '2006-08-11 20:06:03', 0);
INSERT INTO `state_translation` VALUES (100242, 100248, 10, '2006-08-11 20:06:03', 0);
INSERT INTO `state_translation` VALUES (100236, 100249, 10, '2006-08-13 19:02:19', 1);
INSERT INTO `state_translation` VALUES (100256, 100260, 10, '2006-08-13 19:02:19', 1);
INSERT INTO `state_translation` VALUES (100257, 100261, 10, '2006-08-11 20:06:03', 0);
INSERT INTO `state_translation` VALUES (100258, 100262, 10, '2006-08-13 19:02:19', 1);
INSERT INTO `state_translation` VALUES (100259, 100263, 10, '2006-08-11 20:06:03', 0);
INSERT INTO `state_translation` VALUES (100255, 100264, 10, '2006-08-13 19:02:19', 1);
INSERT INTO `state_translation` VALUES (100234, 100265, 10, '2006-08-11 15:27:39', 1);
INSERT INTO `state_translation` VALUES (100415, 100500, 10, '2006-08-13 19:02:35', 1);
INSERT INTO `state_translation` VALUES (100513, 100501, 10, '2006-08-13 12:48:36', 0);
INSERT INTO `state_translation` VALUES (100511, 100502, 10, '2006-08-13 12:51:38', 0);
INSERT INTO `state_translation` VALUES (100487, 100503, 10, '2006-08-13 12:51:38', 0);
INSERT INTO `state_translation` VALUES (100402, 100504, 10, '2006-08-13 12:51:38', 0);
INSERT INTO `state_translation` VALUES (100454, 100505, 10, '2006-08-13 12:51:38', 0);
INSERT INTO `state_translation` VALUES (100456, 100506, 10, '2006-08-13 12:51:38', 0);
INSERT INTO `state_translation` VALUES (100416, 100507, 10, '2006-08-13 12:51:38', 0);
INSERT INTO `state_translation` VALUES (100417, 100508, 10, '2006-08-13 19:02:35', 1);
INSERT INTO `state_translation` VALUES (100418, 100509, 10, '2006-08-13 12:51:38', 0);
INSERT INTO `state_translation` VALUES (100397, 100510, 10, '2006-08-13 12:48:36', 0);
INSERT INTO `state_translation` VALUES (100419, 100511, 10, '2006-08-13 12:51:38', 0);
INSERT INTO `state_translation` VALUES (100421, 100512, 10, '2006-08-13 12:51:38', 0);
INSERT INTO `state_translation` VALUES (100420, 100513, 10, '2006-08-13 12:48:36', 0);
INSERT INTO `state_translation` VALUES (100467, 100514, 10, '2006-08-13 12:51:38', 0);
INSERT INTO `state_translation` VALUES (100468, 100515, 10, '2006-08-13 12:51:38', 0);
INSERT INTO `state_translation` VALUES (100494, 100516, 10, '2006-08-13 12:51:38', 0);
INSERT INTO `state_translation` VALUES (100414, 100517, 10, '2006-08-13 19:02:35', 1);
INSERT INTO `state_translation` VALUES (100403, 100518, 10, '2006-08-13 19:02:35', 1);
INSERT INTO `state_translation` VALUES (100407, 100519, 10, '2006-08-13 19:02:35', 1);
INSERT INTO `state_translation` VALUES (100404, 100526, 10, '2006-08-13 19:02:35', 1);
INSERT INTO `state_translation` VALUES (100405, 100527, 10, '2006-08-13 12:51:32', 0);
INSERT INTO `state_translation` VALUES (100406, 100528, 10, '2006-08-13 19:02:35', 1);
INSERT INTO `state_translation` VALUES (100437, 100529, 10, '2006-08-13 19:02:57', 1);
INSERT INTO `state_translation` VALUES (100538, 100543, 10, '2006-08-13 12:58:29', 0);
INSERT INTO `state_translation` VALUES (100539, 100544, 10, '2006-08-13 12:58:29', 0);
INSERT INTO `state_translation` VALUES (100287, 100794, 10, '2006-08-13 19:02:06', 1);
INSERT INTO `state_translation` VALUES (100355, 100796, 10, '2006-08-13 19:02:06', 1);
INSERT INTO `state_translation` VALUES (100408, 100810, 10, '2006-08-13 19:02:35', 1);
INSERT INTO `state_translation` VALUES (100438, 100817, 10, '2006-08-13 19:02:57', 1);
INSERT INTO `state_translation` VALUES (100588, 100819, 10, '2006-08-13 19:02:57', 1);
INSERT INTO `state_translation` VALUES (100664, 100825, 10, '2006-08-13 19:03:10', 1);
INSERT INTO `state_translation` VALUES (100316, 100838, 10, '2006-08-13 19:03:52', 1);
INSERT INTO `state_translation` VALUES (101067, 101234, 10, '2007-01-14 12:09:29', 1);
INSERT INTO `state_translation` VALUES (101179, 101236, 10, '2007-01-14 12:09:29', 1);
INSERT INTO `state_translation` VALUES (101191, 101238, 10, '2007-01-14 12:09:29', 1);
INSERT INTO `state_translation` VALUES (101124, 101244, 10, '2007-01-14 12:09:39', 1);
INSERT INTO `state_translation` VALUES (101205, 101246, 10, '2007-01-14 12:09:39', 1);
INSERT INTO `state_translation` VALUES (101165, 101248, 10, '2007-01-14 12:09:39', 1);
INSERT INTO `state_translation` VALUES (101137, 101250, 10, '2007-01-14 12:09:39', 1);
INSERT INTO `state_translation` VALUES (101079, 101256, 10, '2007-01-14 12:09:51', 1);
INSERT INTO `state_translation` VALUES (101086, 101258, 10, '2007-01-14 12:09:51', 1);
INSERT INTO `state_translation` VALUES (101099, 101260, 10, '2007-01-14 12:09:51', 1);
INSERT INTO `state_translation` VALUES (101459, 101464, 10, '2007-01-15 20:07:25', 0);
INSERT INTO `state_translation` VALUES (101460, 101465, 10, '2007-01-15 20:07:25', 0);
INSERT INTO `state_translation` VALUES (101484, 101489, 10, '2007-01-18 20:22:46', 0);
INSERT INTO `state_translation` VALUES (101485, 101490, 10, '2007-01-18 20:22:46', 0);
INSERT INTO `state_translation` VALUES (101411, 101494, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (101397, 101495, 10, '2007-01-14 19:24:22', 0);
INSERT INTO `state_translation` VALUES (101348, 101496, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (100432, 101497, 10, '2007-02-14 19:35:03', 0);
INSERT INTO `state_translation` VALUES (100433, 101498, 10, '2007-02-14 19:35:03', 0);
INSERT INTO `state_translation` VALUES (100435, 101499, 10, '2007-02-14 19:35:03', 0);
INSERT INTO `state_translation` VALUES (101356, 101500, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (101354, 101501, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (101352, 101502, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (101412, 101503, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (101413, 101504, 10, '2007-01-16 22:33:18', 0);
INSERT INTO `state_translation` VALUES (101416, 101505, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (101415, 101506, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (101414, 101507, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (101410, 101508, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (101595, 101600, 10, '2007-01-15 21:54:12', 0);
INSERT INTO `state_translation` VALUES (101596, 101601, 10, '2007-01-15 21:54:12', 0);
INSERT INTO `state_translation` VALUES (101636, 101641, 10, '2007-01-15 19:59:51', 0);
INSERT INTO `state_translation` VALUES (101637, 101642, 10, '2007-01-15 19:59:51', 0);
INSERT INTO `state_translation` VALUES (101629, 101644, 10, '2007-01-16 22:28:23', 0);
INSERT INTO `state_translation` VALUES (101630, 101645, 10, '2007-01-16 22:28:23', 0);
INSERT INTO `state_translation` VALUES (101648, 101653, 10, '2007-01-15 19:54:16', 0);
INSERT INTO `state_translation` VALUES (101649, 101654, 10, '2007-01-15 19:54:16', 0);
INSERT INTO `state_translation` VALUES (101657, 101662, 10, '2007-01-16 22:28:19', 0);
INSERT INTO `state_translation` VALUES (101658, 101663, 10, '2007-01-16 22:28:19', 0);
INSERT INTO `state_translation` VALUES (101562, 101681, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (101563, 101685, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (101564, 101686, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (101565, 101687, 10, '2007-01-15 20:05:03', 0);
INSERT INTO `state_translation` VALUES (101573, 101689, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (100312, 101690, 10, '2007-01-15 20:05:03', 0);
INSERT INTO `state_translation` VALUES (100554, 101691, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (100267, 101692, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (100268, 101693, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (100269, 101694, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (100270, 101695, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (100271, 101696, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (100272, 101697, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (100273, 101698, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (100274, 101699, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (100275, 101700, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (100276, 101701, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (100277, 101702, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (100278, 101703, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (100279, 101704, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (100280, 101705, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (100281, 101706, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (100282, 101707, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (100283, 101708, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (100284, 101709, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (101574, 101710, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (101575, 101711, 10, '2007-01-15 20:05:04', 0);
INSERT INTO `state_translation` VALUES (101572, 101712, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (101579, 101713, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (101586, 101714, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (101580, 101716, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (101581, 101717, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (101582, 101718, 10, '2007-01-15 20:05:04', 0);
INSERT INTO `state_translation` VALUES (101587, 101720, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (101588, 101721, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (101589, 101722, 10, '2007-01-15 20:05:04', 0);
INSERT INTO `state_translation` VALUES (101860, 101910, 10, '2007-01-19 19:23:11', 0);
INSERT INTO `state_translation` VALUES (101861, 101911, 10, '2007-01-19 19:23:11', 0);
INSERT INTO `state_translation` VALUES (101866, 101913, 10, '2007-01-19 19:23:21', 0);
INSERT INTO `state_translation` VALUES (101867, 101914, 10, '2007-01-19 19:23:21', 0);
INSERT INTO `state_translation` VALUES (101872, 101916, 10, '2007-01-19 19:23:31', 0);
INSERT INTO `state_translation` VALUES (101873, 101917, 10, '2007-01-19 19:23:31', 0);
INSERT INTO `state_translation` VALUES (101878, 101919, 10, '2007-01-19 19:23:43', 0);
INSERT INTO `state_translation` VALUES (101879, 101920, 10, '2007-01-19 19:23:43', 0);
INSERT INTO `state_translation` VALUES (101887, 101922, 10, '2007-01-19 19:23:54', 0);
INSERT INTO `state_translation` VALUES (101888, 101923, 10, '2007-01-19 19:23:54', 0);
INSERT INTO `state_translation` VALUES (101816, 101931, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (101825, 101933, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (101807, 101934, 10, '2007-01-16 22:28:37', 0);
INSERT INTO `state_translation` VALUES (101776, 101935, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (101782, 101936, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (101784, 101937, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (101796, 101938, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (101826, 101939, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (101827, 101940, 10, '2007-01-16 22:33:18', 0);
INSERT INTO `state_translation` VALUES (101829, 101941, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (101828, 101942, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (101824, 101943, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (101815, 101944, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (101833, 101945, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (101842, 101946, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (101817, 101948, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (101818, 101949, 10, '2007-01-16 22:33:19', 0);
INSERT INTO `state_translation` VALUES (101820, 101950, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (101819, 101951, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (101834, 101953, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (101835, 101954, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (101836, 101955, 10, '2007-01-16 22:33:20', 0);
INSERT INTO `state_translation` VALUES (101838, 101956, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (101837, 101957, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (101843, 101959, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (101844, 101960, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (101845, 101961, 10, '2007-01-16 22:33:20', 0);
INSERT INTO `state_translation` VALUES (101847, 101962, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (101846, 101963, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (102070, 102075, 10, '2007-02-14 19:26:28', 0);
INSERT INTO `state_translation` VALUES (102071, 102076, 10, '2007-02-14 19:26:28', 0);
INSERT INTO `state_translation` VALUES (102122, 102127, 10, '2007-02-11 10:13:04', 0);
INSERT INTO `state_translation` VALUES (102123, 102128, 10, '2007-02-11 10:13:04', 0);
INSERT INTO `state_translation` VALUES (102140, 102284, 10, '2007-02-14 19:35:03', 0);
INSERT INTO `state_translation` VALUES (102141, 102285, 10, '2007-02-14 19:35:03', 0);
INSERT INTO `state_translation` VALUES (102142, 102286, 10, '2007-02-14 18:40:14', 0);
INSERT INTO `state_translation` VALUES (102144, 102287, 10, '2007-02-14 19:35:03', 0);
INSERT INTO `state_translation` VALUES (102143, 102288, 10, '2007-02-14 19:35:04', 0);
INSERT INTO `state_translation` VALUES (102139, 102289, 10, '2007-02-14 19:35:04', 0);
INSERT INTO `state_translation` VALUES (102026, 102294, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (102027, 102295, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (102028, 102296, 10, '2007-02-14 19:23:37', 0);
INSERT INTO `state_translation` VALUES (102030, 102297, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (102029, 102298, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (102025, 102299, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (102042, 102300, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (102043, 102301, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (102044, 102302, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (102045, 102303, 10, '2007-02-14 19:23:37', 0);
INSERT INTO `state_translation` VALUES (102047, 102304, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (102046, 102305, 10, '2007-02-14 19:26:49', 0);
INSERT INTO `state_translation` VALUES (101464, 102318, 10, '2007-02-14 19:35:03', 0);
INSERT INTO `state_translation` VALUES (100034, 102319, 10, '2007-02-14 19:35:03', 0);
INSERT INTO `state_translation` VALUES (101465, 102320, 10, '2007-02-14 19:35:03', 0);
INSERT INTO `state_translation` VALUES (102269, 102321, 10, '2007-02-14 19:35:04', 0);
INSERT INTO `state_translation` VALUES (102270, 102322, 10, '2007-02-14 19:35:03', 0);

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `syndication`
-- 

CREATE TABLE `syndication` (
  `IN_ID` bigint(20) NOT NULL default '0',
  `OUT_ID` bigint(20) NOT NULL default '0',
  `PROVIDER` varchar(32) NOT NULL default '',
  UNIQUE KEY `OUT_ID` (`OUT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Daten für Tabelle `syndication`
-- 

INSERT INTO `syndication` VALUES (100366, 100551, 'WWW.ZOO-MUNICH.COM');
INSERT INTO `syndication` VALUES (101222, 100554, 'WWW.ZOO-MUNICH.COM');
INSERT INTO `syndication` VALUES (101237, 100572, 'WWW.ZOO-MUNICH.COM');

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `sys_functions`
-- 

CREATE TABLE `sys_functions` (
  `FUNCTION_ID` varchar(16) NOT NULL default '',
  `PARENT_ID` varchar(16) NOT NULL default '0',
  `NAME` varchar(32) NOT NULL default '',
  `DESCRIPTION` varchar(255) default NULL,
  PRIMARY KEY  (`FUNCTION_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Daten für Tabelle `sys_functions`
-- 

INSERT INTO `sys_functions` VALUES ('EXPLORE_SITE_M', '0', 'Content Menu', 'Content Menu');
INSERT INTO `sys_functions` VALUES ('EXPLORE_SITE_S', 'EXPLORE_SITE_M', 'Website', 'Content - Website');
INSERT INTO `sys_functions` VALUES ('EDIT_CONTENT', 'EXPLORE_SITE_S', 'Edit Content', 'Content - Edit Content');
INSERT INTO `sys_functions` VALUES ('B_EDIT_ALL', 'EDIT_CONTENT', 'Button Edit All', 'Content - Edit Content - Edit All');
INSERT INTO `sys_functions` VALUES ('B_USAGE', 'EDIT_CONTENT', 'Button Usage', 'Content - Usage');
INSERT INTO `sys_functions` VALUES ('B_LIVE_AUTHORING', 'EDIT_CONTENT', 'Live Authoring', 'Content - Live Authoring');
INSERT INTO `sys_functions` VALUES ('B_PREVIEW_PAGE', 'EDIT_CONTENT', 'Preview Page', 'Content - Preview Page');
INSERT INTO `sys_functions` VALUES ('B_EXPIRE_LAUNCH', 'EDIT_CONTENT', 'Button Expire/Launch Page', 'Content - Website - Expire/Launch Page');
INSERT INTO `sys_functions` VALUES ('B_LAUNCH_TREE', 'EDIT_CONTENT', 'Launch Tree', 'Content - Website - Launch Tree');
INSERT INTO `sys_functions` VALUES ('B_RELAUNCH_TREE', 'EDIT_CONTENT', 'Refresh Tree', 'Content - Website - Refresh Tree');
INSERT INTO `sys_functions` VALUES ('B_EXPIRE_TREE', 'EDIT_CONTENT', 'Expire Tree', 'Content - Website - Expire Tree');
INSERT INTO `sys_functions` VALUES ('B_DESTROY_TREE', 'EDIT_CONTENT', 'Destroy Tree', 'Content - Website - Destroy Tree');
INSERT INTO `sys_functions` VALUES ('EDIT_META_DATA', 'EDIT_CONTENT', 'Edit Meta Data', 'Content - Edit Meta Data');
INSERT INTO `sys_functions` VALUES ('SITEPAGE_PROPS', 'EXPLORE_SITE_S', 'Sitepage Properties', 'Content - Website  - Sitepage Properties');
INSERT INTO `sys_functions` VALUES ('B_RESET_CL_INST', 'SITEPAGE_PROPS', 'Reset Cluster Instance', 'Content - Website  - Sitepage Properties - Reset Cluster Instance');
INSERT INTO `sys_functions` VALUES ('C_ACTIVE', 'SITEPAGE_PROPS', 'Checkbox Active', 'Content - Website - Sitepage Properties - Active');
INSERT INTO `sys_functions` VALUES ('C_CACHE', 'SITEPAGE_PROPS', 'Checkbox Cache', 'Content - Website - Sitepage Properties - Cache');
INSERT INTO `sys_functions` VALUES ('CLEAR_CACHE', 'SITEPAGE_PROPS', 'Clear Cache on Launch', 'Content - Website - Sitepage Properties - Clear Cache on Launch');
INSERT INTO `sys_functions` VALUES ('MENU', 'EXPLORE_SITE_S', 'Menu', 'Allow editing of menu entries.');
INSERT INTO `sys_functions` VALUES ('DIRECT_URL', 'MENU', 'Direct URL', 'Content - Menues - Direct URL');
INSERT INTO `sys_functions` VALUES ('ADD_SITEPAGE', 'EXPLORE_SITE_S', 'Add Sitepage', 'Content - Add Sitepage');
INSERT INTO `sys_functions` VALUES ('DELETE_SITEPAGE', 'EXPLORE_SITE_S', 'Delete Sitepage', 'Content - Delete Sitepage');
INSERT INTO `sys_functions` VALUES ('PORTAL_MANAGER', 'EXPLORE_SITE_M', 'Portal Manager', 'Portal Manager');
INSERT INTO `sys_functions` VALUES ('SITEPAGE_MASTER', 'TEMPLATES_M', 'Page Templates', 'Enable access to page-templates');
INSERT INTO `sys_functions` VALUES ('B_RELAUNCH_INST', 'SITEPAGE_MASTER', 'Button Relaunch Instances', 'Sitepage Master - Relaunch Instances');
INSERT INTO `sys_functions` VALUES ('ADD_SP_MASTER', 'SITEPAGE_MASTER', 'Add Sitepage Master', 'Sitepage Master - Insert New');
INSERT INTO `sys_functions` VALUES ('DELETE_SP_MASTER', 'SITEPAGE_MASTER', 'Delete Sitepage Master', 'Sitepage Master - Delete');
INSERT INTO `sys_functions` VALUES ('ROLLOUT', 'EXPLORE_SITE_M', 'Rollout', 'Rollout');
INSERT INTO `sys_functions` VALUES ('OBJECT_BROWSER', 'EXPLORE_SITE_M', 'Library', 'Allow general access to content library');
INSERT INTO `sys_functions` VALUES ('NEW_FOLDER', 'GENERAL', 'New Folder', 'Allow to create folder');
INSERT INTO `sys_functions` VALUES ('NEW_OBJECT', 'OBJECT_BROWSER', 'Object Browser - New Object', 'Object Browser - New Object');
INSERT INTO `sys_functions` VALUES ('EDIT_OBJECT', 'OBJECT_BROWSER', 'Edit Object', 'Object Browser - Edit Object');
INSERT INTO `sys_functions` VALUES ('OBJECT_PROPS', 'OBJECT_BROWSER', 'Object Properties', 'Object Browser - Object Properties');
INSERT INTO `sys_functions` VALUES ('DELETE_OBJECT', 'OBJECT_BROWSER', 'Delete Object', 'Object Browser - Delete Object');
INSERT INTO `sys_functions` VALUES ('DELETE_FOLDER', 'GENERAL', 'Delete Folder', 'Allow delete folder');
INSERT INTO `sys_functions` VALUES ('CL_BROWSER', 'EXPLORE_SITE_M', 'Clusters', 'Allow general access to cluster browser.');
INSERT INTO `sys_functions` VALUES ('NEW_CL_TEMP', 'CL_TEMP_BROWSER', 'New CL-Template', 'Cluster Template Browser - New CL-Template');
INSERT INTO `sys_functions` VALUES ('NEW_INSTANCE', 'CL_BROWSER', 'Cluster Browser - New Instance', 'Cluster Browser - New Instance');
INSERT INTO `sys_functions` VALUES ('ED_FOLDER_PROPS', 'GENERAL', 'Edit Folder Properties', 'Allow edit folder ?roperties');
INSERT INTO `sys_functions` VALUES ('EDIT_CL_CONTENT', 'CL_BROWSER', 'Edit Cluster Content', 'Cluster Browser - Edit Cluster Content');
INSERT INTO `sys_functions` VALUES ('B_CL_EDIT_ALL', 'EDIT_CL_CONTENT', 'Button Cluster Edit All', 'Cluster Browser - Edit Content - Edit All');
INSERT INTO `sys_functions` VALUES ('B_CL_USAGE', 'EDIT_CL_CONTENT', 'Button Cluster Usage', 'Cluster Browser - Edit Content - Usage');
INSERT INTO `sys_functions` VALUES ('ED_CL_META_DATA', 'CL_EDIT_CONTENT', 'Edit Cluster Meta Data', 'Cluster Browser - Edit Meta Data');
INSERT INTO `sys_functions` VALUES ('CL_PROPS', 'CL_BROWSER', 'Cluster Properties', 'Cluster Browser - Cluster Properties');
INSERT INTO `sys_functions` VALUES ('DELETE_CL', 'CL_BROWSER', 'Delete Cluster', 'Cluster Browser - Delete Cluster');
INSERT INTO `sys_functions` VALUES ('CL_TEMP_BROWSER', 'TEMPLATES_M', 'Cluster Templates', 'Enable access to cluster-templates');
INSERT INTO `sys_functions` VALUES ('EDIT_CL_TEMP', 'CL_TEMP_BROWSER', 'Edit Cluster Template', 'Cluster Template Browser - Edit Cluster Template');
INSERT INTO `sys_functions` VALUES ('ED_CL_TEMP_PROPS', 'CL_TEMP_BROWSER', 'Edit CL-Template Props', 'Cluster Template Browser - Edit Cluster Template Properties');
INSERT INTO `sys_functions` VALUES ('DELETE_CL_TEMP', 'CL_BROWSER', 'Delete Cluster Template', 'Cluster Browser - Delete Cluster Template');
INSERT INTO `sys_functions` VALUES ('META_TEMP', 'TEMPLATES_M', 'Meta Templates', 'Enable access to meta-templates');
INSERT INTO `sys_functions` VALUES ('PLUGINS_M', '0', 'Plugins', 'Plugins');
INSERT INTO `sys_functions` VALUES ('PLUGIN_CONTROL', 'PLUGINS_M', 'Plugin Control', 'Plugin Control');
INSERT INTO `sys_functions` VALUES ('ADMINISTRATION_M', '0', 'Administration', 'Administration');
INSERT INTO `sys_functions` VALUES ('USER_MANAGEMENT', 'ADMINISTRATION_M', 'User Management', 'User Management');
INSERT INTO `sys_functions` VALUES ('VARIATIONS', 'ADMINISTRATION_M', 'Variations', 'Variations');
INSERT INTO `sys_functions` VALUES ('MAINTENANCE', '0', 'Maintenance Menu', 'Enable access to maintenance menu');
INSERT INTO `sys_functions` VALUES ('PURGE_DATABASE', 'MAINTENANCE', 'Purge Database', 'Purge Database');
INSERT INTO `sys_functions` VALUES ('MY_PROFILE', 'ADMINISTRATION_M', 'My Profile', 'My Profile');
INSERT INTO `sys_functions` VALUES ('OBJ_USAGE', 'OBJECT_BROWSER', 'Object Usage', 'Allow displaying usage of this object');
INSERT INTO `sys_functions` VALUES ('TRAFFIC', 'ADMINISTRATION_M', 'Page Traffic', 'Traffic Analysis of this Website');
INSERT INTO `sys_functions` VALUES ('CL_USAGE', 'CL_BROWSER', 'Cluster Usage', 'Displays usage of this cluster in pages.');
INSERT INTO `sys_functions` VALUES ('TESTS', 'MAINTENANCE', 'PHPUnit Tests', NULL);
INSERT INTO `sys_functions` VALUES ('LOGS', 'MAINTENANCE', 'Log Analysis', NULL);
INSERT INTO `sys_functions` VALUES ('ED_FOLDER_ACL', 'ED_FOLDER_PROPS', 'Set Access', 'Set Access to a folder an all object who reside within.');
INSERT INTO `sys_functions` VALUES ('BACKUP', 'ADMINISTRATION_M', 'Backup', 'Backup Database and Filesystem');
INSERT INTO `sys_functions` VALUES ('SearchEngineAdm', 'MAINTENANCE', 'Search Engine Admin', 'Can run spider and admin the search engine.');
INSERT INTO `sys_functions` VALUES ('LOCK_MENU', 'SITEPAGE_PROPS', 'Lock Menu', 'Allow user to lock the menu and disallow creating further page under one node.');
INSERT INTO `sys_functions` VALUES ('CALENDAR_CREATE', 'CALENDAR', 'Administration', 'Create Calendars and Categories');
INSERT INTO `sys_functions` VALUES ('CALENDAR_EDIT', 'CALENDAR', 'Edit', 'Edit the calendar');
INSERT INTO `sys_functions` VALUES ('CALENDAR', 'PLUGINS_M', 'Calendar', 'Calendar Plugin');
INSERT INTO `sys_functions` VALUES ('CHANNELS', 'EXPLORE_SITE_M', 'Channels', 'Allow general access to channels');
INSERT INTO `sys_functions` VALUES ('CHANNEL_ADMIN', 'CHANNELS', 'Channel Administration', 'Create, Modify and Delete Channels');
INSERT INTO `sys_functions` VALUES ('CHANNEL_EDIT', 'CHANNELS', 'Edit Content', 'Edit the content in a channel');
INSERT INTO `sys_functions` VALUES ('CHANNEL_DELETE', 'CHANNELS', 'Delete Article', 'Delete an article in a channel.');
INSERT INTO `sys_functions` VALUES ('CHANNEL_LAUNCH', 'CHANNELS', 'Launch Article', 'Launch an article in a channel.');
INSERT INTO `sys_functions` VALUES ('ALLOW_CMS_LOGIN', 'GENERAL', 'Allow Backend Login', 'Must be set, if user shall be able to login to the backend.');
INSERT INTO `sys_functions` VALUES ('COMMUNITY_LOGIN', 'GENERAL', 'Community Login', 'Use for building community portals.');
INSERT INTO `sys_functions` VALUES ('SYNC_CLUSTERS', 'MAINTENANCE', 'Synchronize All Clusters', NULL);
INSERT INTO `sys_functions` VALUES ('SYNDICATION', 'EXPLORE_SITE_M', 'Syndication', 'Allow import and export of data');
INSERT INTO `sys_functions` VALUES ('IMPORT', 'SYNDICATION', 'Import Data', 'Import Clusters, Templates and so on.');
INSERT INTO `sys_functions` VALUES ('EXPORT', 'SYNDICATION', 'Export Data', 'Export clusters, templates and so on.');
INSERT INTO `sys_functions` VALUES ('TEMPLATES_M', '0', 'Templates Menu', 'Enable the general Templates Menu');
INSERT INTO `sys_functions` VALUES ('COMPOUND_GROUPS', 'TEMPLATES_M', 'Compound Groups', 'Edit, create and delete compound groups');
INSERT INTO `sys_functions` VALUES ('GENERAL', '0', 'General functions', 'General functions of N/X');
INSERT INTO `sys_functions` VALUES ('SET_PAGE_ACCESS', 'EXPLORE_SITE_S', 'Set Access', 'Set Permissions for a page');
INSERT INTO `sys_functions` VALUES ('EDIT_EXCLUSIVE', 'EDIT_CL_CONTENT', 'Edit Developer Content', 'Allow user to edit Developer Content');
INSERT INTO `sys_functions` VALUES ('ESERVICES', '0', 'Menu E-Services', 'Allow the user to display the menu E-Services');
INSERT INTO `sys_functions` VALUES ('ADDRESS', 'ESERVICES', 'Address Editor', 'Allow displaying, editing and deleting Contacts');
INSERT INTO `sys_functions` VALUES ('SHOP', 'ESERVICES', 'Shop Access', 'Allow access to general shop backoffice');
INSERT INTO `sys_functions` VALUES ('SHOPADM', 'SHOP', 'Shop-Administrator', 'Technical Shop Administration');
INSERT INTO `sys_functions` VALUES ('SHOPPRODADM', 'SHOP', 'Product-Administrator', 'Edit categories, products.....');
INSERT INTO `sys_functions` VALUES ('ORDERPROC', 'SHOP', 'Order Processor', 'Account for processing orders');
INSERT INTO `sys_functions` VALUES ('NEWSLETTER', 'ESERVICES', 'Newsletter Access', 'Allow access to general newsletter backoffice');
INSERT INTO `sys_functions` VALUES ('NEWSLETTERADM', 'NEWSLETTER', 'Newsletter-Administrator', 'Technical Newsletter Administration');
INSERT INTO `sys_functions` VALUES ('NEWSLETTEREDITOR', 'NEWSLETTER', 'Newsletter-Editor', 'Edit and create newsletter');
INSERT INTO `sys_functions` VALUES ('NEWSLETTERSENDER', 'NEWSLETTER', 'Newsletter-Sender', 'Send Newsletters');
INSERT INTO `sys_functions` VALUES ('CUSTOMERCARE', 'ESERVICES', 'Customer Care Access', 'Allow reading and replying to messages.');
INSERT INTO `sys_functions` VALUES ('CUSTOMERCAREADMI', 'ESERVICES', 'Customer Care Admin', 'Allow technical adminstration of customer care.');
INSERT INTO `sys_functions` VALUES ('BULKIMAGE', 'PLUGINS_M', 'Bulk Image', 'Bulkimage Plugin');

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `temp_vars`
-- 

CREATE TABLE `temp_vars` (
  `NAME` varchar(128) NOT NULL default '',
  `USER_ID` varchar(16) NOT NULL default '',
  `VALUE` varchar(255) default NULL,
  PRIMARY KEY  (`NAME`,`USER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Daten für Tabelle `temp_vars`
-- 

INSERT INTO `temp_vars` VALUES ('pnode', '1', '101481');
INSERT INTO `temp_vars` VALUES ('channels.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` VALUES ('channels.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` VALUES ('categories.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` VALUES ('categories.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` VALUES ('user_general.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` VALUES ('user_general.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` VALUES ('overview.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` VALUES ('overview.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` VALUES ('clt', '1', '100167');
INSERT INTO `temp_vars` VALUES ('install.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` VALUES ('install.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` VALUES ('sitepage_master.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` VALUES ('sitepage_master.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` VALUES ('edit_template.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` VALUES ('edit_template.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` VALUES ('mid', '1', '101815');
INSERT INTO `temp_vars` VALUES ('sitepagebrowser.phpview', '1', '1');
INSERT INTO `temp_vars` VALUES ('panelmenu', '1', '1x-1');
INSERT INTO `temp_vars` VALUES ('variations.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` VALUES ('variations.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` VALUES ('compound_groups.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` VALUES ('compound_groups.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` VALUES ('category.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` VALUES ('category.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` VALUES ('texts.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` VALUES ('texts.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` VALUES ('sdateview', '1', 'predefined');
INSERT INTO `temp_vars` VALUES ('sitf', '1', 'today');
INSERT INTO `temp_vars` VALUES ('sstartdate', '1', '2003-01-01');
INSERT INTO `temp_vars` VALUES ('senddate', '1', '2010-01-01');
INSERT INTO `temp_vars` VALUES ('chsel', '1', '100154');
INSERT INTO `temp_vars` VALUES ('quickpanel', '1', '');
INSERT INTO `temp_vars` VALUES ('edit.phpview', '1', '1');
INSERT INTO `temp_vars` VALUES ('clusterbrowser.phpview', '1', '1');
INSERT INTO `temp_vars` VALUES ('metascheme.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` VALUES ('metascheme.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` VALUES ('meta.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` VALUES ('meta.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` VALUES ('snode', '1', '100893');
INSERT INTO `temp_vars` VALUES ('tax.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` VALUES ('tax.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` VALUES ('lastaction', '1', 'editobject');
INSERT INTO `temp_vars` VALUES ('menu', '1', '1x0');
INSERT INTO `temp_vars` VALUES ('linkset', '1', '');

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `tickets`
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
-- Daten für Tabelle `tickets`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `tickets_answers`
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
-- Daten für Tabelle `tickets_answers`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `tickets_categories`
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
-- Daten für Tabelle `tickets_categories`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `tickets_messages`
-- 

CREATE TABLE `tickets_messages` (
  `ID` int(7) NOT NULL auto_increment,
  `ticket` varchar(20) collate latin1_general_ci default NULL,
  `message` text collate latin1_general_ci,
  `timestamp` int(10) NOT NULL default '0',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=4 ;

-- 
-- Daten für Tabelle `tickets_messages`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `tickets_textblocks`
-- 

CREATE TABLE `tickets_textblocks` (
  `BLOCK_ID` bigint(20) NOT NULL default '0',
  `NAME` varchar(32) collate latin1_general_ci NOT NULL default '',
  `CONTENT` longtext collate latin1_general_ci,
  PRIMARY KEY  (`BLOCK_ID`),
  UNIQUE KEY `NAME` (`NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- Daten für Tabelle `tickets_textblocks`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `user_permissions`
-- 

CREATE TABLE `user_permissions` (
  `GROUP_ID` bigint(20) default NULL,
  `ROLE_ID` bigint(20) default NULL,
  `USER_ID` varchar(16) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Daten für Tabelle `user_permissions`
-- 

INSERT INTO `user_permissions` VALUES (1, 1, '1');

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `user_session`
-- 

CREATE TABLE `user_session` (
  `USER_ID` varchar(16) NOT NULL default '',
  `LAST_LOGIN` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `SESSION_ID` varchar(32) default NULL,
  `REMOTE_ADDRESS` varchar(64) default NULL,
  PRIMARY KEY  (`USER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Daten für Tabelle `user_session`
-- 

INSERT INTO `user_session` VALUES ('1', '2007-02-15 18:52:01', 'd63399303978fdba9a1b404e54db89e8', '127.0.0.1');

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `users`
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
-- Daten für Tabelle `users`
-- 

INSERT INTO `users` VALUES (1, 'Administrator', 'Administrator', '7b7bc2512ee1fedcd76bdc68926d4f7b', 'pleaseEnterM@il', 1, '2006-08-11 11:49:09', 1, 'EN', 0, '0');

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `var_log`
-- 

CREATE TABLE `var_log` (
  `NAME` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Daten für Tabelle `var_log`
-- 


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `variations`
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
-- Daten für Tabelle `variations`
-- 

INSERT INTO `variations` VALUES (1, 'English', 'en', 'English language version of website', 0);
