-- phpMyAdmin SQL Dump
-- version 2.9.0-rc1
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Erstellungszeit: 28. März 2007 um 16:29
-- Server Version: 4.1.11
-- PHP-Version: 5.0.4
-- 
-- Datenbank: `april06`
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

INSERT INTO `acl_management` (`GUID`, `TYPE_ID`, `SYSTEM`, `INTERNAL`, `DISABLED`, `INHERIT`, `OWNER_GUID`, `LOCKED_BY`, `LOCKED_AT`) VALUES 
(1, 1, 0, 0, 0, 0, 1, NULL, NULL),
(0, 0, 0, 0, 0, 0, 1, NULL, NULL),
(100001, 0, 0, 0, 0, 1, 1, NULL, NULL);

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

INSERT INTO `acl_relations` (`GUID`, `ACCESSOR_GUID`, `ROLE_ID`) VALUES 
(1, 101587, 1),
(0, 101587, 1);

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

INSERT INTO `categories` (`CATEGORY_ID`, `CATEGORY_NAME`, `PARENT_CATEGORY_ID`, `DELETED`) VALUES 
(100013, 'CStructures', 0, 0),
(100012, 'CArticles', 0, 0),
(100011, 'CPages', 0, 0),
(101310, 'Layout', 0, 0),
(100960, 'Pictures', 0, 0),
(101878, 'Tell a Friend', 101310, 0);

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

INSERT INTO `centerstage` (`STAGE_ID`, `CHID`, `CH_CAT_ID`, `SORT_ALGORITHM`, `MAXCARD`, `CLNID`) VALUES 
(100149, 100154, NULL, 1, 999, NULL),
(100179, 100154, NULL, 1, 999, NULL),
(100225, NULL, NULL, 1, 3, NULL),
(100242, 100154, NULL, 1, 50, NULL),
(100248, 100154, NULL, 1, 50, NULL),
(100419, NULL, NULL, 1, 3, NULL),
(100511, NULL, NULL, 1, 3, NULL),
(101091, 100154, NULL, 1, 50, NULL);

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

INSERT INTO `channel_articles` (`ARTICLE_ID`, `CHID`, `CH_CAT_ID`, `CLT_ID`, `POSITION`, `TITLE`, `ARTICLE_DATE`, `LAUNCH_DATE`, `EXPIRE_DATE`, `VERSION`) VALUES 
(100156, 100154, 100155, 100134, 1, 'Welcome', '2006-08-11 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(100161, 100154, 100155, 100162, 1, 'Welcome', '2006-08-11 00:00:00', NULL, NULL, 10);

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

INSERT INTO `channel_categories` (`CH_CAT_ID`, `CHID`, `PAGE_ID`, `NAME`) VALUES 
(100155, 100154, 101099, 'General News');

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

INSERT INTO `channel_cluster_templates` (`CHID`, `CLT_ID`, `POSITION`) VALUES 
(100154, 100134, 1);

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

INSERT INTO `channels` (`CHID`, `NAME`) VALUES 
(100154, 'News');

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

INSERT INTO `cluster_content` (`CLCID`, `CLID`, `CLTI_ID`, `POSITION`, `TITLE`, `FKID`, `DELETED`) VALUES 
(100158, 100157, 100135, 1, '', 0, 0),
(100159, 100157, 100136, 1, '', 0, 0),
(100179, 100176, 100174, 1, '', 100179, 0),
(100178, 100176, 100173, 1, '', 0, 0),
(100177, 100176, 100172, 1, '', 0, 0),
(100199, 100198, 100184, 1, '', 0, 0),
(101486, 101484, 100016, 1, '', 0, 0),
(101485, 101484, 100015, 1, '', 0, 0),
(101477, 101475, 100016, 1, '', 0, 0),
(101495, 101493, 100065, 1, '', 0, 0),
(101494, 101493, 100064, 1, '', 0, 0),
(101476, 101475, 100015, 1, '', 0, 0),
(101468, 101450, 100350, 1, '', 0, 0),
(101467, 101450, 100349, 1, '', 0, 0),
(101466, 101450, 100348, 1, '', 0, 0),
(101465, 101450, 100347, 1, '', 0, 0),
(101464, 101450, 100346, 1, '', 0, 0),
(101463, 101450, 100345, 1, '', 0, 0),
(101462, 101450, 100344, 1, '', 0, 0),
(101461, 101450, 100343, 1, '', 0, 0),
(101460, 101450, 100342, 1, '', 0, 0),
(101459, 101450, 100341, 1, '', 0, 0),
(101458, 101450, 100340, 1, '', 0, 0),
(101457, 101450, 100339, 1, '', 0, 0),
(101456, 101450, 100338, 1, '', 0, 0),
(101455, 101450, 100337, 1, '', 0, 0),
(101454, 101450, 100336, 1, '', 0, 0),
(101453, 101450, 100353, 1, '', 0, 0),
(101452, 101450, 100351, 1, '', 0, 0),
(101451, 101450, 100352, 1, '', 0, 0),
(101070, 101069, 100015, 1, '', 0, 0),
(101071, 101069, 100016, 1, '', 0, 0),
(101089, 101088, 100139, 1, '', 0, 0),
(101090, 101088, 100140, 1, '', 0, 0),
(101091, 101088, 100141, 1, '', 0, 0),
(101102, 101101, 100168, 1, '', 0, 0),
(101128, 101126, 100015, 1, '', 0, 0),
(101129, 101126, 100016, 1, '', 0, 0),
(101140, 101139, 100352, 1, '', 0, 0),
(101141, 101139, 100351, 1, '', 0, 0),
(101142, 101139, 100353, 1, '', 0, 0),
(101143, 101139, 100336, 1, '', 0, 0),
(101144, 101139, 100337, 1, '', 0, 0),
(101145, 101139, 100338, 1, '', 0, 0),
(101146, 101139, 100339, 1, '', 0, 0),
(101147, 101139, 100340, 1, '', 0, 0),
(101148, 101139, 100341, 1, '', 0, 0),
(101149, 101139, 100342, 1, '', 0, 0),
(101150, 101139, 100343, 1, '', 0, 0),
(101151, 101139, 100344, 1, '', 0, 0),
(101152, 101139, 100345, 1, '', 0, 0),
(101153, 101139, 100346, 1, '', 0, 0),
(101154, 101139, 100347, 1, '', 0, 0),
(101155, 101139, 100348, 1, '', 0, 0),
(101156, 101139, 100349, 1, '', 0, 0),
(101157, 101139, 100350, 1, '', 0, 0),
(101168, 101167, 100429, 1, '', 0, 0),
(101169, 101167, 100430, 1, '', 0, 0),
(101170, 101167, 100431, 1, '', 0, 0),
(101182, 101181, 100064, 1, '', 0, 0),
(101183, 101181, 100065, 1, '', 0, 0),
(101194, 101193, 100720, 1, '', 0, 0),
(101195, 101193, 100722, 1, '', 0, 0),
(101196, 101193, 100724, 1, '', 0, 0),
(101197, 101193, 100726, 1, '', 0, 0),
(101208, 101207, 100051, 1, '', 0, 0);

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

INSERT INTO `cluster_node` (`CLNID`, `CLT_ID`, `NAME`, `DELETED`, `VERSION`) VALUES 
(100156, 100134, 'Welcome', 0, 0),
(100175, 100171, 'News', 0, 10),
(100197, 100183, 'Articles', 0, 10),
(101492, 100063, 'Sitemap', 0, 0),
(101483, 100014, 'Privacy Statement', 0, 0),
(101474, 100014, 'Legal Notices and Terms', 0, 0),
(101449, 100335, 'Contact (2)', 0, 0),
(101442, 100078, 'Footerlinks', 0, 0),
(101435, 100078, 'Headerlinks', 0, 0),
(101068, 100014, 'Home', 0, 0),
(101080, 100078, 'News', 0, 0),
(101087, 100138, 'Overview', 0, 0),
(101100, 100167, 'News', 0, 0),
(101125, 100014, 'About', 0, 0),
(101138, 100335, 'Contact', 0, 0),
(101166, 100428, 'Gallery (2)', 0, 0),
(101180, 100063, 'Sitemap (2)', 0, 0),
(101192, 100716, 'Search Engine', 0, 0),
(101206, 100050, 'Forum (2)', 0, 0);

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

INSERT INTO `cluster_template_item_types` (`CLTITYPE_ID`, `NAME`, `DESCRIPTION`) VALUES 
(1, '5. Static Content', 'Standard input-fields. Static content is defined once for all objects of a class. So all objects have the same content (static content).'),
(2, '1. Content', 'Contents are standard input fields. Authors can fill content in these fields. (e.g. textfields, HTML-Fields, ....)'),
(3, '6. Static Object-Link', 'Objects can be linked with others. For example you may want to link an object "engine" with an object "car". Static object links are the same for all objects of an class.'),
(4, '2. Object Link', 'Objects can be linked with others. For example you may want to link an object "engine" with an object "car".'),
(5, '3. Library Content', 'This field allows to link content from the Library. This is the prefered placeholder for images, flash-films ....'),
(6, '7. Layout-Object Link', 'Layout objects are objects which are based on a class having its own layout defined. This placeholder is about the same as the Object-Link, except there must be the layout.'),
(7, '8. Object Group Link', 'This placeholder makes the content of object-groups accessible. Object-Groubs are defined in Templates/Object Groups'),
(8, '4. Channel Link', 'Use this placeholder, if you want to access articles from channels on your webpage.');

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

INSERT INTO `cluster_template_items` (`CLTI_ID`, `CLT_ID`, `NAME`, `POSITION`, `MINCARD`, `MAXCARD`, `FKID`, `CLTITYPE_ID`, `EXCLUSIVE`, `DELETED`, `VERSION`) VALUES 
(100015, 100014, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 0),
(100016, 100014, 'Body', 2, 1, 1, 100024, 2, 0, 0, 0),
(100051, 100050, 'URL', 1, 1, 1, 100018, 2, 0, 0, 0),
(100064, 100063, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 0),
(100065, 100063, 'Commented Sitemap', 2, 1, 1, 100062, 2, 0, 0, 0),
(100135, 100134, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 0),
(100136, 100134, 'Body', 2, 1, 1, 100024, 2, 0, 0, 0),
(100139, 100138, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 0),
(100140, 100138, 'Body', 2, 1, 1, 100024, 2, 0, 0, 0),
(100141, 100138, 'Articles', 3, 1, 1, 1, 8, 0, 0, 0),
(100168, 100167, 'Backlink Title', 1, 1, 1, 100018, 2, 0, 0, 0),
(100174, 100171, 'Articles', 3, 1, 1, 1, 8, 0, 0, 10),
(100173, 100171, 'Body', 2, 1, 1, 100024, 2, 0, 0, 10),
(100172, 100171, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 10),
(100184, 100183, 'Backlink Title', 1, 1, 1, 100018, 2, 0, 0, 10),
(100267, 100554, 'Body', 3, 1, 1, 100024, 2, 0, 0, 0),
(100268, 100554, 'Name', 5, 1, 1, 100018, 2, 0, 0, 0),
(100269, 100554, 'Christian Name', 6, 1, 1, 100018, 2, 0, 0, 0),
(100270, 100554, 'Street', 7, 1, 1, 100018, 2, 0, 0, 0),
(100271, 100554, 'ZIP', 8, 1, 1, 100018, 2, 0, 0, 0),
(100272, 100554, 'City', 9, 1, 1, 100018, 2, 0, 0, 0),
(100273, 100554, 'TEL', 10, 1, 1, 100018, 2, 0, 0, 0),
(100274, 100554, 'FAX', 11, 1, 1, 100018, 2, 0, 0, 0),
(100275, 100554, 'E-Mail', 12, 1, 1, 100018, 2, 0, 0, 0),
(100276, 100554, 'Submit', 13, 1, 1, 100018, 2, 0, 0, 0),
(100277, 100554, 'Reset', 14, 1, 1, 100018, 2, 0, 0, 0),
(100278, 100554, 'Success', 15, 1, 1, 100018, 2, 0, 0, 0),
(100279, 100554, 'Validation', 16, 1, 1, 100018, 2, 0, 0, 0),
(100280, 100554, 'Trouble Email', 17, 1, 1, 100018, 2, 1, 0, 0),
(100281, 100554, 'Category', 18, 1, 1, 100018, 2, 1, 0, 0),
(100282, 100554, 'Subject', 2, 1, 1, 100018, 2, 0, 0, 0),
(100283, 100554, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 0),
(100284, 100554, 'Mailbody', 4, 1, 1, 100018, 2, 0, 0, 0),
(100336, 100335, 'Body', 5, 1, 1, 100024, 2, 0, 0, 0),
(100337, 100335, 'Name', 6, 1, 1, 100018, 2, 0, 0, 0),
(100338, 100335, 'Christian Name', 7, 1, 1, 100018, 2, 0, 0, 0),
(100339, 100335, 'Street', 8, 1, 1, 100018, 2, 0, 0, 0),
(100340, 100335, 'ZIP', 9, 1, 1, 100018, 2, 0, 0, 0),
(100341, 100335, 'City', 10, 1, 1, 100018, 2, 0, 0, 0),
(100342, 100335, 'TEL', 11, 1, 1, 100018, 2, 0, 0, 0),
(100343, 100335, 'FAX', 12, 1, 1, 100018, 2, 0, 0, 0),
(100344, 100335, 'E-Mail', 13, 1, 1, 100018, 2, 0, 0, 0),
(100345, 100335, 'SUBMIT', 14, 1, 1, 100018, 2, 0, 0, 0),
(100346, 100335, 'Reset', 15, 1, 1, 100018, 2, 0, 0, 0),
(100347, 100335, 'success', 16, 1, 1, 100018, 2, 0, 0, 0),
(100348, 100335, 'Validation', 17, 1, 1, 100018, 2, 0, 0, 0),
(100349, 100335, 'EMail Recipient', 18, 1, 1, 100018, 2, 1, 0, 0),
(100350, 100335, 'EMail Subject', 19, 1, 1, 100018, 2, 1, 0, 0),
(100351, 100335, 'Subject', 3, 1, 1, 100018, 2, 0, 0, 0),
(100352, 100335, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 0),
(100353, 100335, 'Mailbody', 4, 1, 1, 100018, 2, 0, 0, 0),
(100487, 100511, 'Feedname', 4, 1, 1, 100018, 2, 0, 0, 0),
(100399, 101177, 'Address', 3, 1, 1, 100018, 2, 0, 0, 0),
(100400, 101177, 'Body', 2, 1, 1, 100024, 2, 0, 0, 0),
(100401, 101177, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 0),
(100402, 100511, 'Channel', 3, 1, 1, 1, 8, 0, 0, 0),
(100429, 100428, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 0),
(100430, 100428, 'Body', 2, 1, 1, 100024, 2, 0, 0, 0),
(100431, 100428, 'Gallery', 3, 1, 1, 100427, 2, 0, 0, 0),
(100454, 100511, 'Feed Title', 1, 1, 1, 100018, 2, 0, 0, 0),
(100456, 100511, 'Feed Description', 2, 1, 1, 100018, 2, 0, 0, 0),
(100564, 100560, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 0),
(100566, 100560, 'Body', 2, 1, 1, 100024, 2, 0, 0, 0),
(100568, 100560, 'URL', 3, 1, 1, 100018, 2, 0, 0, 0),
(100616, 100612, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 0),
(100618, 100612, 'Body', 2, 1, 1, 100024, 2, 0, 0, 0),
(100620, 100612, 'Address', 3, 1, 1, 100018, 2, 0, 0, 0),
(100622, 100612, 'ShowControls', 4, 1, 1, 100062, 2, 0, 0, 0),
(100645, 100612, 'Google-API-Key', 6, 1, 1, 100018, 2, 0, 0, 0),
(100647, 100612, 'Address Description', 5, 1, 1, 100024, 2, 0, 0, 0),
(100720, 100716, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 0),
(100722, 100716, 'Body', 2, 1, 1, 100024, 2, 0, 0, 0),
(100724, 100716, 'Search Button', 3, 1, 1, 100018, 2, 0, 0, 0),
(100726, 100716, 'No Results Text', 4, 1, 1, 100018, 2, 0, 0, 0);

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

INSERT INTO `cluster_templates` (`CLT_ID`, `MT_ID`, `CATEGORY_ID`, `NAME`, `DESCRIPTION`, `CLT_TYPE_ID`, `TEMPLATE`, `DELETED`, `VERSION`, `IS_SHOP_PRODUCT`, `IS_SHOP_CATEGORY`) VALUES 
(100014, 100432, 100011, 'Text', '', 0, '', 0, 0, 0, 0),
(100050, 100432, 100011, 'URL', 'Stores an URL only', 0, '', 0, 0, 0, 0),
(100063, 2, 100011, 'Sitemap', 'Class for building sitemap pages', 0, '', 0, 0, 0, 0),
(100078, 2, 100011, 'Empty', 'Empty Class with no content.', 0, '', 0, 0, 0, 0),
(100134, 2, 100012, 'Text Article', 'Standard article with Headline and Body.', 1, 'echo &#039;&lt;h1&gt;&#039;.$me-&gt;content-&gt;get(&quot;Headline&quot;).&#039;&lt;/h1&gt;&#039;;\r\nbr();\r\necho $me-&gt;content-&gt;get(&quot;Body&quot;);', 0, 0, 0, 0),
(100138, 100432, 100011, 'Articles Overview', 'Wrapper Class for showing the overview of a channel.', 0, '', 0, 0, 0, 0),
(100167, 100432, 100011, 'Article Page', '', 0, '', 0, 0, 0, 0),
(100171, 100034, 100011, 'Articles Overview', 'Wrapper Class for showing the overview of a channel.', 0, '', 0, 10, 0, 0),
(100183, 100034, 100011, 'Article Page', '', 0, '', 0, 10, 0, 0),
(100554, 100432, 100011, 'Contact  (Mailing System)', '', 0, '', 0, 0, 0, 0),
(100335, 100432, 100011, 'Contact (Email)', '', 0, '', 0, 0, 0, 0),
(100511, 2, 100011, 'RSS Creator', '', 0, '', 0, 0, 0, 0),
(101177, 100432, 100011, 'RSS Reader', '', 0, '', 0, 0, 0, 0),
(100428, 100432, 100011, 'Gallery', 'Class which is used to build a Gallery', 0, '', 0, 0, 0, 0),
(100560, 2, 100011, 'Internal Frame', '', 0, '', 0, 0, 0, 0),
(100612, 100432, 100011, 'Map Page', '', 0, '', 0, 0, 0, 0),
(100716, 2, 100011, 'Search engine', 'Content definition for the search page.', 0, '', 0, 0, 0, 0);

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

INSERT INTO `cluster_variations` (`CLNID`, `VARIATION_ID`, `CLID`, `DELETED`, `LAST_CHANGED`, `CREATED_AT`, `LAST_USER`, `CREATE_USER`, `LAUNCHED_AT`, `LAUNCH_USER`) VALUES 
(100156, 1, 100157, 0, 20060815214402, 20060811140618, 'Administrator', 'Administrator', 20060811200603, 'Administrator'),
(100175, 1, 100176, 0, 20060811140730, 20060811140431, NULL, NULL, NULL, NULL),
(100197, 1, 100198, 0, 20060811150340, 20060811150326, NULL, NULL, NULL, NULL),
(101492, 1, 101493, 0, 20070328150036, 20070225214810, 'Administrator', 'Administrator', NULL, NULL),
(101483, 1, 101484, 0, 20070328150245, 20070225214750, 'Administrator', 'Administrator', NULL, NULL),
(101449, 1, 101450, 0, 20070328150210, 20070225214619, 'Administrator', 'Administrator', NULL, NULL),
(101442, 1, 101443, 0, NULL, 20070225214546, NULL, 'Administrator', NULL, NULL),
(101435, 1, 101436, 0, NULL, 20070225214525, NULL, 'Administrator', NULL, NULL),
(101068, 1, 101069, 0, 20060815214029, 20060815213354, 'Administrator', 'Administrator', NULL, NULL),
(101080, 1, 101081, 0, NULL, 20060815214046, NULL, 'Administrator', NULL, NULL),
(101087, 1, 101088, 0, 20060815214118, 20060815214059, 'Administrator', 'Administrator', NULL, NULL),
(101100, 1, 101101, 0, 20060815214146, 20060815214132, 'Administrator', 'Administrator', NULL, NULL),
(101125, 1, 101126, 0, 20060815214537, 20060815214454, 'Administrator', 'Administrator', NULL, NULL),
(101138, 1, 101139, 0, 20060815214702, 20060815214552, 'Administrator', 'Administrator', NULL, NULL),
(101166, 1, 101167, 0, 20060815214839, 20060815214731, 'Administrator', 'Administrator', NULL, NULL),
(101180, 1, 101181, 0, 20060815214919, 20060815214908, 'Administrator', 'Administrator', NULL, NULL),
(101192, 1, 101193, 0, 20060815215008, 20060815214935, 'Administrator', 'Administrator', NULL, NULL),
(101206, 1, 101207, 0, 20060815215043, 20060815215028, 'Administrator', 'Administrator', NULL, NULL),
(101474, 1, 101475, 0, 20070328150227, 20070225214731, 'Administrator', 'Administrator', NULL, NULL);

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

INSERT INTO `content` (`CID`, `MODULE_ID`, `CATEGORY_ID`, `MT_ID`, `ACCESSKEY`, `NAME`, `DESCRIPTION`, `KEYWORDS`, `CREATED`, `LAST_MOD_DATE`, `LAST_MODIFIER`, `DELETED`, `VERSION`) VALUES 
(101364, 100018, 101310, 2, 'metakeywords', 'Meta Keywords', '', '', '2007-02-25 13:36:19', '2007-02-25 13:36:04', 'Administrator', 0, 0),
(101355, 100012, 101310, 2, 'logo', 'Logo', '', '', '2007-02-25 13:31:25', '2007-02-25 13:30:54', 'Administrator', 0, 0),
(101344, 100018, 101310, 2, 'subtitle', 'Homepage SubTitle', '', '', '2007-02-25 13:29:09', '2007-02-25 13:28:51', 'Administrator', 0, 0),
(101331, 100018, 101310, 100034, 'sitetitle', 'Site title', '', '', '2007-02-25 13:26:22', '0000-00-00 00:00:00', 'Administrator', 0, 10),
(101335, 100018, 101310, 2, 'title', 'Homepage Title', '', '', '2007-02-25 13:28:19', '2007-02-25 13:28:06', 'Administrator', 0, 0),
(101320, 100018, 101310, 2, 'side2', 'Side 2', '', '', '2007-02-25 13:23:47', '2007-02-25 13:23:22', 'Administrator', 0, 0),
(101326, 100018, 101310, 2, 'sitetitle', 'Site title', '', '', '2007-02-25 13:26:18', '2007-02-25 13:25:57', 'Administrator', 0, 0),
(101313, 100018, 101310, 2, 'side1', 'Side 1', '', '', '2007-02-25 13:23:06', '2007-02-25 13:20:51', 'Administrator', 0, 0),
(101340, 100018, 101310, 100034, 'title', 'Homepage Title', '', '', '2007-02-25 13:28:26', '0000-00-00 00:00:00', 'Administrator', 0, 10),
(100968, 100012, 100960, 0, '', 'Clouds.jpg', NULL, '', '2006-08-15 20:05:33', '0000-00-00 00:00:00', NULL, 0, 0),
(100970, 100012, 100960, 0, '', 'DenMark.jpg', NULL, '', '2006-08-15 20:06:03', '0000-00-00 00:00:00', NULL, 0, 0),
(100972, 100012, 100960, 0, '', 'Entre.jpg', NULL, '', '2006-08-15 20:06:36', '0000-00-00 00:00:00', NULL, 0, 0),
(100974, 100012, 100960, 0, '', 'FieldsOfGold.jpg', NULL, '', '2006-08-15 20:06:54', '0000-00-00 00:00:00', NULL, 0, 0),
(100976, 100012, 100960, 0, '', 'Flower.jpg', NULL, '', '2006-08-15 20:07:13', '0000-00-00 00:00:00', NULL, 0, 0),
(100978, 100012, 100960, 0, '', 'Kids.jpg', NULL, '', '2006-08-15 20:07:33', '0000-00-00 00:00:00', NULL, 0, 0),
(100980, 100012, 100960, 0, '', 'Lighthouse.jpg', NULL, '', '2006-08-15 20:08:29', '0000-00-00 00:00:00', NULL, 0, 0),
(100982, 100012, 100960, 0, '', 'MintMunchkin.jpg', NULL, '', '2006-08-15 20:08:50', '0000-00-00 00:00:00', NULL, 0, 0),
(100984, 100012, 100960, 0, '', 'Moon.jpg', NULL, '', '2006-08-15 20:09:08', '0000-00-00 00:00:00', NULL, 0, 0),
(100986, 100012, 100960, 0, '', 'OldHouse.jpg', NULL, '', '2006-08-15 20:09:32', '0000-00-00 00:00:00', NULL, 0, 0),
(100988, 100012, 100960, 0, '', 'RainbowWeb.jpg', NULL, '', '2006-08-15 20:10:00', '0000-00-00 00:00:00', NULL, 0, 0),
(100990, 100012, 100960, 0, '', 'Rippled.jpg', NULL, '', '2006-08-15 20:10:23', '0000-00-00 00:00:00', NULL, 0, 0),
(100992, 100012, 100960, 0, '', 'Shallow.jpg', NULL, '', '2006-08-15 20:10:33', '0000-00-00 00:00:00', NULL, 0, 0),
(100994, 100012, 100960, 0, NULL, 'SideView.jpg', NULL, NULL, '2006-08-15 20:04:35', '0000-00-00 00:00:00', NULL, 0, 0),
(100996, 100012, 100960, 0, '', 'Solitude.jpg', NULL, '', '2006-08-15 20:10:59', '0000-00-00 00:00:00', NULL, 0, 0),
(100998, 100012, 100960, 0, '', 'TakeASeat.jpg', NULL, '', '2006-08-15 20:11:14', '0000-00-00 00:00:00', NULL, 0, 0),
(101000, 100012, 100960, 0, '', 'Towering.jpg', NULL, '', '2006-08-15 20:11:59', '0000-00-00 00:00:00', NULL, 0, 0),
(101002, 100012, 100960, 0, '', 'Tranquility.jpg', NULL, '', '2006-08-15 20:11:35', '0000-00-00 00:00:00', NULL, 0, 0),
(101004, 100012, 100960, 0, '', 'WideWeb.jpg', NULL, '', '2006-08-15 20:11:25', '0000-00-00 00:00:00', NULL, 0, 0),
(101360, 100012, 101310, 100034, 'logo', 'Logo', '', '', '2007-02-25 13:31:30', '0000-00-00 00:00:00', 'Administrator', 0, 10),
(101386, 100018, 101310, 2, 'metadescription', 'Meta Description', '', '', '2007-02-25 13:37:40', '2007-02-25 13:37:25', 'Administrator', 0, 0),
(101411, 100018, 101310, 2, 'footermessage', 'Footertext', '', '', '2007-02-25 15:09:07', '2007-02-25 15:08:42', 'Administrator', 0, 0),
(101416, 100018, 101310, 100034, 'footermessage', 'Footertext', '', '', '2007-02-25 15:09:14', '0000-00-00 00:00:00', 'Administrator', 0, 10),
(101420, 100018, 101310, 2, 'submenutitle', 'Submenu Title', '', '', '2007-02-25 15:23:42', '2007-02-25 15:23:18', 'Administrator', 0, 0),
(101425, 100018, 101310, 100034, 'submenutitle', 'Submenu Title', '', '', '2007-02-25 15:23:50', '0000-00-00 00:00:00', 'Administrator', 0, 10),
(101621, 100018, 101310, 2, 'readmore', 'Read more', '', '', '2007-03-03 13:17:46', '2007-03-03 13:17:36', 'Administrator', 0, 0),
(101626, 100018, 101310, 100034, 'readmore', 'Read more', '', '', '2007-03-03 13:17:53', '0000-00-00 00:00:00', 'Administrator', 0, 10),
(101881, 100018, 101878, 2, 'taf_title', 'Title', '', '', '2007-03-28 15:54:37', '2007-03-28 15:54:08', 'Administrator', 0, 0),
(101886, 100018, 101878, 100034, 'taf_title', 'Title', '', '', '2007-03-28 15:56:24', '0000-00-00 00:00:00', 'Administrator', 0, 10),
(101890, 100018, 101878, 2, 'taf_yourname', 'Your Name', '', '', '2007-03-28 15:55:07', '2007-03-28 15:54:55', 'Administrator', 0, 0),
(101895, 100018, 101878, 100034, 'taf_yourname', 'Your Name', '', '', '2007-03-28 15:56:28', '0000-00-00 00:00:00', 'Administrator', 0, 10),
(101899, 100018, 101878, 2, 'taf_your_email', 'Your Email', '', '', '2007-03-28 15:55:40', '2007-03-28 15:55:24', 'Administrator', 0, 0),
(101905, 100018, 101878, 2, 'taf_recipients', 'Recipients', '', '', '2007-03-28 15:56:18', '2007-03-28 15:55:54', 'Administrator', 0, 0),
(101910, 100018, 101878, 100034, 'taf_recipients', 'Recipients', '', '', '2007-03-28 15:56:22', '0000-00-00 00:00:00', 'Administrator', 0, 10),
(101914, 100018, 101878, 100034, 'taf_your_email', 'Your Email', '', '', '2007-03-28 15:56:26', '0000-00-00 00:00:00', 'Administrator', 0, 10),
(101919, 100018, 101878, 2, 'taf_message', 'Message', '', '', '2007-03-28 15:56:59', '2007-03-28 15:56:45', 'Administrator', 0, 0),
(101924, 100018, 101878, 100034, 'taf_message', 'Message', '', '', '2007-03-28 15:57:05', '0000-00-00 00:00:00', 'Administrator', 0, 10),
(101928, 100018, 101878, 2, 'taf_send', 'Send', '', '', '2007-03-28 15:57:27', '2007-03-28 15:57:18', 'Administrator', 0, 0),
(101933, 100018, 101878, 100034, 'taf_send', 'Send', '', '', '2007-03-28 15:57:32', '0000-00-00 00:00:00', 'Administrator', 0, 10),
(101937, 100018, 101878, 2, 'taf_reset', 'Reset', '', '', '2007-03-28 15:57:53', '2007-03-28 15:57:43', 'Administrator', 0, 0),
(101942, 100018, 101878, 100034, 'taf_reset', 'Reset', '', '', '2007-03-28 15:57:59', '0000-00-00 00:00:00', 'Administrator', 0, 10),
(101946, 100018, 101878, 2, 'taf_close', 'Close', '', '', '2007-03-28 15:58:36', '2007-03-28 15:58:27', 'Administrator', 0, 0),
(101952, 100018, 101878, 2, 'taf_errors', 'Errors', '', '', '2007-03-28 16:04:30', '2007-03-28 16:04:16', 'Administrator', 0, 0),
(101957, 100018, 101878, 100034, 'taf_errors', 'Errors', '', '', '2007-03-28 16:04:41', '0000-00-00 00:00:00', 'Administrator', 0, 10),
(101961, 100018, 101878, 2, 'taf_mailsubject', 'Email Subject', '', '', '2007-03-28 16:05:36', '2007-03-28 16:05:15', 'Administrator', 0, 0),
(101967, 100018, 101878, 2, 'taf_mailmessage', 'Email Message', '', '', '2007-03-28 16:06:57', '2007-03-28 16:06:44', 'Administrator', 0, 0),
(101972, 100018, 101878, 100034, 'taf_mailmessage', 'Email Message', '', '', '2007-03-28 16:07:03', '0000-00-00 00:00:00', 'Administrator', 0, 10),
(101981, 100018, 101878, 2, 'taf_entermail', 'Error Enter Email', '', '', '2007-03-28 16:13:49', '2007-03-28 16:13:09', 'Administrator', 0, 0),
(101992, 100012, 101878, 2, NULL, 'Error Enter Name', '', '', '2007-03-28 16:14:21', '2007-03-28 16:14:01', 'Administrator', 1, 0),
(102000, 100018, 101878, 2, 'taf_entermail2', 'Error Email Proper', '', '', '2007-03-28 16:15:38', '2007-03-28 16:15:18', 'Administrator', 0, 0),
(102006, 100018, 101878, 2, 'taf_errorrec1', 'Error Recipients', '', '', '2007-03-28 16:16:49', '2007-03-28 16:16:23', 'Administrator', 0, 0),
(102012, 100018, 101878, 2, 'taf_errorrec2', 'Error Email Recipient proper', '', '', '2007-03-28 16:18:07', '2007-03-28 16:17:46', 'Administrator', 0, 0),
(102018, 100018, 101878, 2, 'taf_errname', 'Error Name', '', '', '2007-03-28 16:18:59', '2007-03-28 16:18:42', 'Administrator', 0, 0),
(102024, 100018, 101878, 2, 'taf_success', 'Success', '', '', '2007-03-28 16:20:12', '2007-03-28 16:19:49', 'Administrator', 0, 0),
(102030, 100018, 101878, 2, 'taf_failed', 'Failed', '', '', '2007-03-28 16:21:39', '2007-03-28 16:21:22', 'Administrator', 0, 0),
(102039, 100024, 101878, 2, NULL, 'Message Fotter', '', '', '2007-03-28 16:23:43', '2007-03-28 16:23:17', 'Administrator', 1, 0),
(102047, 100018, 101878, 2, 'taf_msgfooter', 'Message Footer', '', '', '2007-03-28 16:24:59', '2007-03-28 16:23:55', 'Administrator', 0, 0);

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

INSERT INTO `content_variations` (`CID`, `VARIATION_ID`, `FK_ID`, `DELETED`) VALUES 
(101340, 1, 101341, 0),
(101335, 1, 101336, 0),
(101331, 1, 101332, 0),
(101326, 1, 101327, 0),
(100128, 1, 100129, 0),
(100126, 1, 100127, 0),
(100124, 1, 100125, 0),
(100132, 1, 100133, 0),
(101320, 1, 101321, 0),
(100122, 1, 100123, 0),
(101313, 1, 101314, 0),
(100543, 1, 100544, 0),
(100968, 1, 100967, 0),
(100970, 1, 100969, 0),
(100972, 1, 100971, 0),
(100974, 1, 100973, 0),
(100976, 1, 100975, 0),
(100978, 1, 100977, 0),
(100980, 1, 100979, 0),
(100982, 1, 100981, 0),
(100984, 1, 100983, 0),
(100986, 1, 100985, 0),
(100988, 1, 100987, 0),
(100990, 1, 100989, 0),
(100992, 1, 100991, 0),
(100994, 1, 100993, 0),
(100996, 1, 100995, 0),
(100998, 1, 100997, 0),
(101000, 1, 100999, 0),
(101002, 1, 101001, 0),
(101004, 1, 101003, 0),
(101344, 1, 101345, 0),
(101355, 1, 101356, 0),
(101360, 1, 101361, 0),
(101364, 1, 101365, 0),
(101386, 1, 101387, 0),
(101411, 1, 101412, 0),
(101416, 1, 101417, 0),
(101420, 1, 101421, 0),
(101425, 1, 101426, 0),
(101621, 1, 101622, 0),
(101626, 1, 101627, 0),
(101881, 1, 101882, 0),
(101886, 1, 101887, 0),
(101890, 1, 101891, 0),
(101895, 1, 101896, 0),
(101899, 1, 101900, 0),
(101905, 1, 101906, 0),
(101910, 1, 101911, 0),
(101914, 1, 101915, 0),
(101919, 1, 101920, 0),
(101924, 1, 101925, 0),
(101928, 1, 101929, 0),
(101933, 1, 101934, 0),
(101937, 1, 101938, 0),
(101942, 1, 101943, 0),
(101946, 1, 101947, 0),
(101952, 1, 101953, 0),
(101957, 1, 101958, 0),
(101961, 1, 101962, 0),
(101967, 1, 101968, 0),
(101972, 1, 101973, 0),
(101981, 1, 101982, 0),
(101992, 1, 101993, 0),
(102000, 1, 102001, 0),
(102006, 1, 102007, 0),
(102012, 1, 102013, 0),
(102018, 1, 102019, 0),
(102024, 1, 102025, 0),
(102030, 1, 102031, 0),
(102039, 1, 102040, 0),
(102047, 1, 102048, 0);

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

INSERT INTO `dig_engine` (`spider_id`, `key_id`, `weight`) VALUES 
(1, 1, 1),
(1, 2, 1),
(1, 3, 1),
(1, 4, 1);

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=5 ;

-- 
-- Daten für Tabelle `dig_keywords`
-- 

INSERT INTO `dig_keywords` (`key_id`, `twoletters`, `keyword`) VALUES 
(1, 'ho', 'home'),
(2, 'ti', 'title'),
(3, 'pa', 'page'),
(4, 'de', 'demotext');

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=10 ;

-- 
-- Daten für Tabelle `dig_logs`
-- 

INSERT INTO `dig_logs` (`l_id`, `l_includes`, `l_excludes`, `l_num`, `l_mode`, `l_ts`, `l_time`) VALUES 
(1, 'sven', '', 0, 'a', '2006-08-13 17:08:25', 0),
(2, 'sven', '', 0, 'a', '2006-08-13 17:10:31', 0),
(3, 'sven', '', 0, 'a', '2006-08-13 17:10:34', 0),
(4, 'sven', '', 0, 'a', '2006-08-13 17:10:35', 0),
(5, '', '', 0, 'a', '2006-08-13 17:10:58', 0),
(6, 'home', '', 1, 'a', '2006-08-13 17:12:26', 0.01),
(7, 'hello', '', 0, 'a', '2006-08-15 21:53:24', 0),
(8, 'rwar', '', 0, 'a', '2007-03-01 19:35:39', 0),
(9, 'test', '', 0, 'a', '2007-03-03 13:23:04', 0);

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

INSERT INTO `dig_site_page` (`site_id`, `days`, `links`, `depth`) VALUES 
(1, 0, 0, 20);

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=2 ;

-- 
-- Daten für Tabelle `dig_sites`
-- 

INSERT INTO `dig_sites` (`site_id`, `site_url`, `upddate`, `username`, `password`, `port`, `locked`, `stopped`) VALUES 
(1, 'http://localhost/', '2006-08-13 17:13:05', '', '', 0, 0, 0);

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=2 ;

-- 
-- Daten für Tabelle `dig_spider`
-- 

INSERT INTO `dig_spider` (`spider_id`, `file`, `first_words`, `upddate`, `md5`, `site_id`, `path`, `num_words`, `last_modified`, `filesize`) VALUES 
(1, '', 'test\n Home Title of this page This is a demotext ...', '2006-08-20 17:11:41', 'a2b2d66938b1f023dec6394f12b782b5_4169', 1, 'corps/www/en/test/', 5, '2006-08-13 17:11:41', 4169);

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=3 ;

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

INSERT INTO `groups` (`GROUP_ID`, `GROUP_NAME`, `DESCRIPTION`) VALUES 
(1, 'System', 'internal use');

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `hits`
-- 

CREATE TABLE `hits` (
  `ID` bigint(20) NOT NULL default '0',
  `HIT` bigint(20) NOT NULL default '0',
  `SCOPE` char(8) NOT NULL default '',
  PRIMARY KEY  (`ID`),
  KEY `SCOPE` (`SCOPE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Daten für Tabelle `hits`
-- 


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

INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES 
('SEARCH_EXPIRED_ARTICLES', 'DE', 'ZurÃƒÆ’Ã‚Â¼ckgezogene Artikel', ''),
('ROLE_PERMISSION', 'DE', 'Rollen-Berechtigungen bearbeiten', ''),
('ROLE_GENERAL', 'DE', 'Eigenschaften', ''),
('PREV_AVAIL', 'DE', 'Sie haben einen Inhalt ausgewÃƒÆ’Ã‚Â¤hlt. Die Vorschau wird nach dem Speichern verfÃƒÆ’Ã‚Â¼gbar sein.', ''),
('OBJLAUNCH_SUCCESS', 'DE', 'Das Objekt wurde erfolgreich verÃƒÆ’Ã‚Â¶ffentlicht', ''),
('NOT_SPECIFIED', 'DE', 'Alle Typen', ''),
('NO_OBJ', 'DE', 'Kein Inhalt ausgewÃƒÆ’Ã‚Â¤hlt.', ''),
('NOT_SELECTED', 'DE', 'Kein Element ausgewÃƒÆ’Ã‚Â¤hlt.', ''),
('MT_SYNC_CL', 'DE', 'Objekte synchronisieren', ''),
('MULTIPAGE', 'DE', 'Multipage', ''),
('MH_GLOSSARY', 'DE', 'Glossar', ''),
('LEAVE_EMPTY', 'DE', 'leer lassen', ''),
('INSTANCES_CREATED', 'DE', 'Neue Instanzen des Elements wurden erzeugt.', ''),
('KEEP_CLUSTER', 'DE', 'Originalobjekt beibehalten', ''),
('HIDE', 'DE', 'SchlieÃƒÆ’Ã…Â¸en', ''),
('HELP_VARIATION', 'DE', 'Inhalte kÃƒÆ’Ã‚Â¶nnen in verschiedenen Variationen vorliegen. Variationen kÃƒÆ’Ã‚Â¶nnen z.B. verschiedene Sprachen oder unterschiedliche Inhaltsprofile darstellen.', ''),
('HELP_SYNCCL', 'DE', 'Eine Einrichtung zur Synchronisation von Clustern, nachdem eine Cluster-Vorlage verÃƒÆ’Ã‚Â¤ndert wurde.', ''),
('HELP_PURGE', 'DE', 'LÃƒÆ’Ã‚Â¶scht ÃƒÆ’Ã‚Â¼berflÃƒÆ’Ã‚Â¼ssige Daten aus der Datenbank', ''),
('HELP_DW', 'DE', 'Erzeugt eine Konfigurations-Datei fÃƒÆ’Ã‚Â¼r das N/X Dreamweaver-PlugIn. Mit Hilfe dieses Plug-Ins kÃƒÆ’Ã‚Â¶nnen N/X-Vorlagen benutzerfreundlich mit Dreamweaver entwickelt werden.', ''),
('HELP_BACKUP', 'DE', 'Die untenstehende Liste zeigt eine Liste von Sicherungen an. Sie kÃƒÆ’Ã‚Â¶nnen hier einzelne Sicherungen lÃƒÆ’Ã‚Â¶schen. Um eine Sicherung zurÃƒÆ’Ã‚Â¼ckzuspielen, mÃƒÆ’Ã‚Â¼ssen Sie sich manuell auf Ihrem Server anmelden und die Dateien selbst wiederherstellen', ''),
('CONFIRM_UNSAVED_CHANGES', 'DE', 'Achtung: Ungesicherte ÃƒÆ’Ã¢â‚¬Å¾nderungen gehen verloren, wenn Sie fortfahren. MÃƒÆ’Ã‚Â¶chten Sie dies tun?', ''),
('GOTO_CL', 'DE', 'Gehe zu Objekt', ''),
('FIND_OBJ', 'DE', 'Finde Objekt', ''),
('EXPL_SEL_SPM', 'DE', 'Bitte wÃƒÆ’Ã‚Â¤hlen Sie eine Seiten-Vorlage aus.', ''),
('ENDTIME', 'DE', 'Endzeit', ''),
('EXPL_SEL_CH', 'DE', 'Bitte wÃƒÆ’Ã‚Â¤hlen Sie einen Kanal.', ''),
('ENDATE', 'DE', 'Enddatum', ''),
('DELETE_PAGE', 'DE', 'LÃƒÆ’Ã‚Â¶schen', ''),
('DISABLE', 'DE', 'Deaktivieren', ''),
('DWEXT_CONTENTFIELDINFO', 'DE', 'Inhalts-Feld-Informationen erzeugen', ''),
('DWEXT_CONTENTFIELDINFO_MES', 'DE', 'erzeugt Inhalts-Feld-Informationen fÃƒÆ’Ã‚Â¼r Dreamweaver MX', ''),
('CLT', 'DE', 'Klasse', ''),
('CMPTYPE', 'DE', 'Layout-Klassen-Typ:', ''),
('COPY_CLUSTER', 'DE', 'Objekt kopieren', ''),
('CLEAR', 'DE', 'LÃƒÆ’Ã‚Â¶schen', ''),
('CHANNEL_IMPORTARTICLES', 'DE', 'Artikel importieren', ''),
('CAL_BTO', 'DE', 'ZurÃƒÆ’Ã‚Â¼ck zur ÃƒÆ’Ã…â€œbersicht', ''),
('AUTH_GROUP', 'DE', 'Autentifizierung', ''),
('ARTICLE_VARIATION_MISSING', 'DE', 'Sprachversion dieses Artikels existiert noch nicht', ''),
('ARTICLE_IS_LIVE', 'DE', 'Artikel ist verÃƒÆ’Ã‚Â¶ffentlicht', ''),
('ARTICLE_IS_EXPIRED', 'DE', 'Artikel ist nicht verÃƒÆ’Ã‚Â¶ffentlicht', ''),
('ADD_LINK', 'DE', 'Link hinzufÃƒÆ’Ã‚Â¼gen', ''),
('ADDITIONAL_LINK', 'DE', 'ZusÃƒÆ’Ã‚Â¤tzlicher Link', ''),
('ADDITIONAL_IMAGE', 'DE', 'ZusÃƒÆ’Ã‚Â¤tzliches Bild', ''),
('HELP_ACCESS', 'DE', 'Eine Einrichtung zum Erstellen und Verwalten von Benutzerprofilen in N/X', ''),
('NUM_OF_ART', 'DE', 'Anzahl Artikel (999 = unendlich)', ''),
('ORDERART', 'DE', 'Sortierung von Artikeln', ''),
('ALL', 'DE', 'Alles', ''),
('READY_TO_USE', 'DE', 'fertig', ''),
('CH_CAT2', 'DE', 'Kanal und Kategorie', ''),
('SEL_CHANNEL_CAT', 'DE', 'Kanal und Kategorie auswÃƒÆ’Ã‚Â¤hlen', ''),
('O_DBLINK_ADDWHERE', 'DE', 'Additional WHERE-clause', ''),
('NO_CONTENT', 'DE', '<leer>', ''),
('O_DBLINK_SRCHVALUE', 'DE', 'Search for value', ''),
('O_DBLINK_EXTERNALDB', 'DE', 'External Database', ''),
('CL_EXPIRE', 'DE', 'Objekt zurÃƒÆ’Ã‚Â¼ckziehen', ''),
('BACK_TO_CV', 'DE', 'ZurÃƒÆ’Ã‚Â¼ck zur ObjektÃƒÆ’Ã‚Â¼bersicht', ''),
('CL_LAUNCH', 'DE', 'Objekt verÃƒÆ’Ã‚Â¶ffentlichen', ''),
('CHANNEL_GRABMP', 'DE', 'grab from Multipage', ''),
('AR_EXPIRE', 'DE', 'Artikel zurÃƒÆ’Ã‚Â¼ckziehen', ''),
('HELP_PGN', 'DE', 'Plug-Ins erlauben Ihnen, N/X ÃƒÆ’Ã‚Â¼her seine Standard-FunktionalitÃƒÆ’Ã‚Â¤ten hinaus zu erweitern. ÃƒÆ’Ã…â€œblicherweise werden Plug-Ins dazu verwendet, neue Objekttypen zu den Standard-Typen Text und Bild hinzuzufÃƒÆ’Ã‚Â¼gen.', ''),
('O_TEXT_NOBREAK', 'DE', 'Ignore New-Lines', ''),
('DEL_ARTICLE', 'DE', 'MÃƒÆ’Ã‚Â¶chten Sie diesen Artikel wirklich in allen Sprachen lÃƒÆ’Ã‚Â¶schen?', ''),
('AR_LAUNCH', 'DE', 'Artikel verÃƒÆ’Ã‚Â¶ffentlichen', ''),
('CREATE_ARTICLE', 'DE', 'Neuen Artikel im Kanal erzeugen', ''),
('ED_PROPERTIES', 'DE', 'Eigenschaften', ''),
('ED_CLT', 'DE', 'Klasse bearbeiten', ''),
('NODE_ACCESS', 'DE', 'Zugriffsrechte fÃƒÆ’Ã‚Â¼r Root-Seite setzen', ''),
('BACK_TO_OVERVIEW', 'DE', 'ZurÃƒÆ’Ã‚Â¼ck zur ÃƒÆ’Ã…â€œbersicht', ''),
('NEW_ARTICLE', 'DE', 'Neuer Artikel', ''),
('DESTROY_EXCLUSIVE_CONTENT', 'DE', 'Exklusive Inhalte lÃƒÆ’Ã‚Â¶schen', ''),
('EDIT_ARTICLE', 'DE', 'Artikel bearbeiten', ''),
('DESTROY_TREE', 'DE', 'Baum lÃƒÆ’Ã‚Â¶schen', ''),
('CONFIRM_DELETE', 'DE', 'MÃƒÆ’Ã‚Â¶chten Sie dieses Element wirklich lÃƒÆ’Ã‚Â¶schen?', ''),
('HELP_ROLLOUT', 'DE', 'Rollout ist eine Einrichtung in N/X, mit der Sie Kopien eines Teils Ihrer Website erstellen und diese an anderer Stelle mit oder ohne alte Inhalte weiderverwenden kÃƒÆ’Ã‚Â¶nnen.', ''),
('CHANNEL', 'DE', 'Kanal', ''),
('CLT_SELECT', 'DE', 'Klasse auswÃƒÆ’Ã‚Â¤hlen', ''),
('HELP_CHANNEL', 'DE', 'Themen-Kategorien fÃƒÆ’Ã‚Â¼r die Inhalte der von N/X erzeugten Artikel, z.B. Neuigkeiten, Personen', ''),
('CHANNELS', 'DE', 'KanÃƒÆ’Ã‚Â¤le', ''),
('SEL_FILE', 'DE', 'Datei auswÃƒÆ’Ã‚Â¤hlen', ''),
('WZT_IMPORTING', 'DE', 'Daten werden importiert', ''),
('WZE_IMPORTING', 'DE', 'Das System hat versucht, die Daten zu importieren. Bitten ÃƒÆ’Ã‚Â¼berprÃƒÆ’Ã‚Â¼fen Sie den Status auf der rechten Seite.', ''),
('WZE_IMPORT_VAL', 'DE', 'Das System hat die Korrektheit der hochgeladenen XML-Datei ÃƒÆ’Ã‚Â¼berprÃƒÆ’Ã‚Â¼ft. Im Bericht rechts finden Sie nÃƒÆ’Ã‚Â¤here Informationen.', ''),
('WZT_IMPORT_VAL', 'DE', 'Zusammenfassung des hochgeladenen XML', ''),
('WZE_IMPORT_FILE', 'DE', 'Bitte wÃƒÆ’Ã‚Â¤hlen Sie eine XML-Datei auf Ihrer Festplatte aus, die ins System geladen werden soll<br/><br/>Das System wird eine ÃƒÆ’Ã…â€œberprÃƒÆ’Ã‚Â¼fung durchfÃƒÆ’Ã‚Â¼hren und den Status auf der rechten Seite ausgeben.', ''),
('WZT_IMPORT_FILE', 'DE', 'N/X-XML-Datei auswÃƒÆ’Ã‚Â¤hlen', ''),
('IMPORT_DATA', 'DE', 'N/X-XML-Daten importieren', ''),
('WZ_IMPORT_TITLE', 'DE', 'Dieser Assisten dient zum Import von Daten in N/X, die zuvor von einer anderen N/X-Installation exportiert wurden. Um eine Ressource erneut importieren zu kÃƒÆ’Ã‚Â¶nnen, mÃƒÆ’Ã‚Â¼ssen Sie sie zunÃƒÆ’Ã‚Â¤chst lÃƒÆ’Ã‚Â¶schen.', ''),
('EXPL_SEL_CLUSTER', 'DE', 'Nachdem Sie eine Klasse gewÃƒÆ’Ã‚Â¤hlt haben, erscheint eine Liste von Objekten, aus der Sie eins auswÃƒÆ’Ã‚Â¤hlen kÃƒÆ’Ã‚Â¶nnen.', ''),
('STEP', 'DE', 'Schritt', ''),
('NEXT', 'DE', 'Weiter', ''),
('EXP_REPORT', 'DE', 'Exportiere folgende Daten', ''),
('EXPL_EXEC_EXPORT', 'DE', 'Das System erzeugt gerade eine XML-Datei fÃƒÆ’Ã‚Â¼r den Export..<br/><br/>In ein paar Sekunden wird ein PopUp erscheinen. Klicken Sie "Speichern", um die Daten auf Ihre Festplatte zu sichern.', ''),
('EXEC_EXPORT', 'DE', 'Quelle wird exportiert', ''),
('PAGE_TEMPLATE', 'DE', 'Seiten Vorlage', ''),
('WZT_SEL_EXP_RES', 'DE', 'Ressource fÃƒÆ’Ã‚Â¼r den Export auswÃƒÆ’Ã‚Â¤hlen', ''),
('WZT_DESCR', 'DE', 'Beschreibung hinzufÃƒÆ’Ã‚Â¼gen', ''),
('WZT_DESCR_EXPL', 'DE', 'Sie sollten eine kurze Beschreibung zu den exportierten Daten hinzufÃƒÆ’Ã‚Â¼gen.<br><br>Jeder, der die Daten importiert, wird leichter verstehen, was er importiert.', ''),
('CLUSTER', 'DE', 'Objekt', ''),
('CLUSTER_TEMPLATE', 'DE', 'Klasse', ''),
('WZE_EXPORT_TYPE', 'DE', 'Bitte wÃƒÆ’Ã‚Â¤hlen Sie rechts den Typ von Daten aus, den Sie exportieren mÃƒÆ’Ã‚Â¶chten. Cluster speichern Inhalte. Wenn Sie Cluser exportieren, werden automatisch auch die zugehÃƒÆ’Ã‚Â¶rigen Vorlagen exportiert. Cluster-Vorlagen sind Schemata, um Cluster zu erstellen. seiten-Vorlagen werden benutzt, um Seiten zu erstellen.', ''),
('WZT_EXPORT_TYPE', 'DE', 'WÃƒÆ’Ã‚Â¤hlen Sie den Typ fÃƒÆ’Ã‚Â¼r den Export aus.', ''),
('WZ_EXPORT_TITLE', 'DE', 'Der Assistent dient zum Austausch von Objekten, Klassen und Seiten-Vorlagen zwischen Ihrer und anderen N/X-Installationen. Der Assistent erzeugt eine XML-Datei, die Sie auf Ihre lokale Festplatte speichern und mit anderen N/X-Nutzern austauschen kÃƒÆ’Ã‚Â¶nnen.', ''),
('EXPORT_DATA', 'DE', 'Inhalte- und Vorlagen-Export-Assistent', ''),
('LAST_LAUNCHED_AT', 'DE', 'Zuletzt verÃƒÆ’Ã‚Â¶ffentlicht am', ''),
('BY', 'DE', 'von', ''),
('LAST_MOD_AT', 'DE', 'Zuletzt geÃƒÆ’Ã‚Â¤ndert am', ''),
('CREATED_AT', 'DE', 'Erstellt am', ''),
('CLUSTER_INFORMATION', 'DE', 'Informationen ÃƒÆ’Ã‚Â¼ber diesen Datensatz', ''),
('TT_RSTCI', 'DE', 'Jede Seite in N/X besitzt ein Objekt. Duch Klicken auf "Objekt zurÃƒÆ’Ã‚Â¼cksetzen" kÃƒÆ’Ã‚Â¶nnen Sie der Seite eine neues Objekt zuweisen.', ''),
('HELP_METATEMP', 'DE', 'Eine Meta-Schablone wird benutzt, um festzulegen, welche Metadaten-Felder eine Seite erhalten soll. Wenn Sie in einer Vorlage ein neues Metadaten-Feld erstellen, wird jede auf dieser Vorlage basierende Seite dieses Feld besitzen.', ''),
('NO_CLUSTER', 'DE', 'Keine Inhalte.', ''),
('USER_AGENT', 'DE', 'Agent verwenden', ''),
('HELP_CLB', 'DE', 'Ein Cluster ist eine Ansammlung von statischen und dynamischen Inhalts-Platzhaltern, die entweder von einem Entwickler oder einem Editor einer Website gefÃƒÆ’Ã‚Â¼llt werden. Die Grundstruktur in N/X besteht aus Daten-Clustern', ''),
('PROMPTDELETE', 'DE', 'MÃƒÆ’Ã‚Â¶chten Sie diesen Datensatz wirklich lÃƒÆ’Ã‚Â¶schen?', ''),
('CREATENEW', 'DE', 'Es wurde ein neuer Datensatz erzeugt.', ''),
('SELECTONE', 'DE', 'Sie mÃƒÆ’Ã‚Â¼ssen hier eine Auswahl treffen!', ''),
('SAVESUCCESS', 'DE', 'Die Daten wurden erfolgreich in die Datenbank geschrieben.', ''),
('DELETESUCCESS', 'DE', 'Die unten aufgefÃƒÆ’Ã‚Â¼hrten Daten wurden erfolgreich gelÃƒÆ’Ã‚Â¶scht.', ''),
('SAVEERROR', 'DE', 'WÃƒÆ’Ã‚Â¤hrend des Speicherns der Daten in die Datenbank ist ein Fehler aufgetreten. Bitte stellen Sie sicher, dass die Datenbank verbunden ist, oder benachrichtigen Sie Ihren Administrator.', ''),
('PROCERROR', 'DE', 'WÃƒÆ’Ã‚Â¤hrend der Verarbeitung des Formulars ist ein Fehler aufgetreten. Bitte ÃƒÆ’Ã‚Â¼berprÃƒÆ’Ã‚Â¼fen Sie die markierten Felder und lesen Sie die dortigen Anweisungen fÃƒÆ’Ã‚Â¼r weitergehende Informationen.', ''),
('PWDTOOSHORT', 'DE', 'Das Passwort muss mindestens 6 Zeichen lang sein!', ''),
('PWDNOTMATCH', 'DE', 'Die von Ihnen eingegebene PasswÃƒÆ’Ã‚Â¶rter stimmen nicht ÃƒÆ’Ã‚Â¼berein!', ''),
('DATEFORMAT', 'DE', 'Das Datumsformat ist nicht korrekt!', NULL),
('WRONGDATE', 'DE', 'Das von Ihnen eingegebene Datum existiert nicht!', ''),
('NOTNUMBER', 'DE', 'Sie kÃƒÆ’Ã‚Â¶nnen in dieses Feld nur Zahlenwerte eingeben!', ''),
('MANDATORY', 'DE', 'Dieses Feld darf nicht leer sein!', ''),
('UNIQUE', 'DE', 'Dieser Wert muss eindeutig sein!', ''),
('STATUS', 'DE', 'Status:', ''),
('EMPTY', 'DE', '<leer>', ''),
('SELECT_CL', 'DE', 'WÃƒÆ’Ã‚Â¤hlen Sie ein Objekt aus', ''),
('SELECT_CI', 'DE', 'WÃƒÆ’Ã‚Â¤hlen Sie ein Inhalts-Element aus', ''),
('CONFIG', 'DE', 'Anpassen', ''),
('CONFIGURED', 'DE', 'fertig', ''),
('NOTCONFIGURED', 'DE', 'Noch nicht konfiguriert.', ''),
('CHOOSEFILE', 'DE', 'WÃƒÆ’Ã‚Â¤hlen Sie eine Datei aus', ''),
('PREVIEW', 'DE', 'Vorschau', ''),
('ED_CONTENT', 'DE', 'Inhalt bearbeiten', ''),
('ED_META', 'DE', 'META-Daten', ''),
('ED_DISPATCHER', 'DE', 'Benutzen Sie diese SchaltflÃƒÆ’Ã‚Â¤che, um zwischen der Bearbeitung der META-Daten und der Bearbeitung der Inhalte umherzuschlaten.', ''),
('ACTIVE_VARIATION', 'DE', 'AusgewÃƒÆ’Ã‚Â¤hlte Sprache:', ''),
('NO_VARIATIONS', 'DE', 'Es wurden noch keine Sprachversionen fÃƒÆ’Ã‚Â¼r dieses Objekt erzeugt.<br>Bitten Sie einen Entwickler, die Konfiguration des gewÃƒÆ’Ã‚Â¤hlten Elements zu ÃƒÆ’Ã‚Â¼berprÃƒÆ’Ã‚Â¼fen!', ''),
('SELECT_VARIATION', 'DE', 'Sprache auswÃƒÆ’Ã‚Â¤hlen', ''),
('METATEMPLATE', 'DE', 'ZusÃƒÆ’Ã‚Â¤tzliche META-Vorlage', ''),
('POSITION', 'DE', 'Position', ''),
('DELETE', 'DE', 'LÃƒÆ’Ã‚Â¶schen', ''),
('TYPE', 'DE', 'Typ', ''),
('KEYWORDS', 'DE', 'SchlÃƒÆ’Ã‚Â¼sselwÃƒÆ’Ã‚Â¶rter', ''),
('SELECTOBJECT', 'DE', 'Bitte wÃƒÆ’Ã‚Â¤hlen Sie eine Klasse aus und geben Sie eine Position und einen Namen an, um das Objekt zu erzeugen.<br>Geben Sie als Position 0 an, um das neue Objekt am Anfang einzufÃƒÆ’Ã‚Â¼gen, 999, um es am Ende anzufÃƒÆ’Ã‚Â¼gen und jede beliebige andere Numm', ''),
('CONTAINERNAME', 'DE', 'Vorlage', ''),
('DOWN', 'DE', 'Ab', ''),
('UP', 'DE', 'Auf', ''),
('EDIT', 'DE', 'Bearbeiten', ''),
('DOSOMETHING', 'DE', 'Bitte wÃƒÆ’Ã‚Â¤hlen Sie aus, was Sie tun mÃƒÆ’Ã‚Â¶chten. Sie kÃƒÆ’Ã‚Â¶nnen neue Elemente einfÃƒÆ’Ã‚Â¼gen, bestehende Elemente bearbeiten oder lÃƒÆ’Ã‚Â¶schen und die Reihenfolge bestehender Elemente verÃƒÆ’Ã‚Â¤ndern.', ''),
('DESCRIPTION', 'DE', 'Beschreibung', ''),
('NAME', 'DE', 'Name', ''),
('NEW', 'DE', 'Neu', ''),
('NO', 'DE', 'Nein', ''),
('YES', 'DE', 'Ja', ''),
('CANCEL', 'DE', 'Abbrechen', ''),
('COMMIT', 'DE', 'ÃƒÆ’Ã…â€œbernehmen', ''),
('USER_PROFILE', 'DE', 'Mein Profil', ''),
('ERROR_SEL_ROLE', 'DE', 'Sie mÃƒÆ’Ã‚Â¼ssen mindestens eine Rolle auswÃƒÆ’Ã‚Â¤hlen!', ''),
('ERROR_SEL_GROUP', 'DE', 'Sie mÃƒÆ’Ã‚Â¼ssen eine Gruppe auswÃƒÆ’Ã‚Â¤hlen!', ''),
('USER_TO_GROUP', 'DE', 'Bneutzer zur Gruppe hinzufÃƒÆ’Ã‚Â¼gen', ''),
('ROLE_DESCRIPTION', 'DE', 'Beschreibung', ''),
('ROLE_FILTERMENU', 'DE', 'Rollen-Verwaltung', ''),
('USER_PERMISSIONS', 'DE', 'Benutzer-Rechte', ''),
('UP_INTRO', 'DE', 'Bitte wÃƒÆ’Ã‚Â¤hlen Sie die Gruppe und die Rollen in der Gruppe, die Sie diesem User zuweisen mÃƒÆ’Ã‚Â¶chten.', ''),
('ROLE_LINK', 'DE', 'Rollen-Profile', ''),
('ROLE_HEAD', 'DE', 'Rollen-Profil', ''),
('ROLE_NAME', 'DE', 'Rollen-Name', ''),
('GROUP_FILTERMENU', 'DE', 'Gruppen-Verwaltung', ''),
('GROUP_DESCRIPTIO', 'DE', 'Beschreibung', ''),
('GROUP_NAME', 'DE', 'Gruppen-Name', ''),
('USER_PERMGRID', 'DE', 'Berechtigungs-Gitter', ''),
('GROUP_LINK', 'DE', 'Gruppen-Profile', ''),
('GROUP_HEAD', 'DE', 'Gruppen-Profil', ''),
('USER_FILTERMENU', 'DE', 'Benutzeraverwaltung', ''),
('USER_SETPERM', 'DE', 'Setzen Sie hier die User-Rechte. Um einen User aus einer Gruppe zu entfernen, entfernen Sie einfach alle Gruppen von ihm.', ''),
('USER_EMAIL', 'DE', 'eMail', ''),
('USER_ACTIVE', 'DE', 'Konto aktiv', ''),
('PASSWORD', 'DE', 'Passwort', ''),
('FULL_NAME', 'DE', 'Voller Name', ''),
('USER_LINK', 'DE', 'Benutzer-Profile', ''),
('USER_NAME', 'DE', 'Benutzername', ''),
('USER_HEAD', 'DE', 'Benutzer-Profil', ''),
('LOGIN_FAILED', 'DE', 'Die Login-Daten, die Sie eingegeben haben, konnten nicht verifiziert werden. Bitte versuchen Sie es erneut.', ''),
('V_EDIT', 'DE', 'Sprachen bearbeiten', ''),
('MT_BASE', 'DE', 'Basis META-Daten', ''),
('MT_MODULE', 'DE', 'Inhaltstyp-spezifische META-Daten', ''),
('VARIATIONS', 'DE', 'VerfÃƒÆ’Ã‚Â¼gbare Variationen', ''),
('V_NAME', 'DE', 'Name', ''),
('V_SHORT', 'DE', 'KÃƒÆ’Ã‚Â¼rzel', ''),
('MT_ADDITIONAL', 'DE', 'ZusÃƒÆ’Ã‚Â¤tzliche META-Daten', ''),
('MT_DELETE', 'DE', 'MÃƒÆ’Ã‚Â¶chten Sie diesen Teil der Meta-Vorlage wirklich lÃƒÆ’Ã‚Â¶schen? Alle Informationen, die im CMS in irgend ein mit diesem Teil verknÃƒÆ’Ã‚Â¼pften META-Eingabefeld eingegeben wurden, werden gelÃƒÆ’Ã‚Â¶scht. Die Daten kÃƒÆ’Ã‚Â¶nnen anschliessend nicht wiederhe', ''),
('MT_SCHEME', 'DE', 'Meta-Vorlage bearbeiten', ''),
('MT_PROPERTIES', 'DE', 'Eigenschaften bearbeiten', ''),
('METATEMPLATES', 'DE', 'Meta-Vorlagen', ''),
('R_PARENT', 'DE', 'ÃƒÆ’Ã…â€œbergeordneter Ordner', ''),
('R_DELFOLDER', 'DE', 'Ordner und alle untergeordneten Objekte lÃƒÆ’Ã‚Â¶schen', ''),
('R_MOVEOBJECTS', 'DE', 'Alle Objekte zur nÃƒÆ’Ã‚Â¤chst hÃƒÆ’Ã‚Â¶heren Ebene verschieben', ''),
('R_FOLDERNOTEMPTY', 'DE', 'Der Ordner ist nicht leer, Sie kÃƒÆ’Ã‚Â¶nnen ihn also nicht lÃƒÆ’Ã‚Â¶schen! Bitte ÃƒÆ’Ã‚Â¼berprÃƒÆ’Ã‚Â¼fen Sie alle Objekte und Inhalte!', ''),
('R_DELFOLDERMES', 'DE', 'Sie sind im Begriff einen Ordner zu lÃƒÆ’Ã‚Â¶schen. Bitte wÃƒÆ’Ã‚Â¤hlen Sie eine Aktion aus.', ''),
('R_DELETEFOLDER', 'DE', 'Ordner lÃƒÆ’Ã‚Â¶schen', ''),
('R_FOLDERNAME', 'DE', 'Ordner-Name', ''),
('R_EDITFOLDER', 'DE', 'Ordner-Eigenschaften bearbeiten', ''),
('O_TEXT', 'DE', 'Text', ''),
('O_ALT', 'DE', 'ALT-Tag', ''),
('O_COPYRIGHT', 'DE', 'Copyright', ''),
('O_BROWSE', 'DE', 'Objekte', ''),
('R_HOME', 'DE', 'Start', ''),
('R_NEWFOLDER', 'DE', 'Neuer Ordner', ''),
('O_PREVIEW', 'DE', 'Vorschau von', ''),
('O_EDIT', 'DE', 'Objekt bearbeiten', ''),
('O_DEL', 'DE', 'Objekt lÃƒÆ’Ã‚Â¶schen', ''),
('O_DELMES', 'DE', 'Sie sind im Begriff ein Objekt zu lÃƒÆ’Ã‚Â¶schen.<b>Beachten Sie dass hierbei alle  Sprachversionen und META-DATEN gelÃƒÆ’Ã‚Â¶scht werden!</b>', ''),
('O_PROPERTIES', 'DE', 'Objekt-Eigenschaften', ''),
('O_NAME', 'DE', 'Objekt-Name', ''),
('O_NEW', 'DE', 'Neues Objekt', ''),
('PG_UNINSTALLDELE', 'DE', 'Plugin entfernen,<br> Alle zugehÃƒÆ’Ã‚Â¶rigen Inhalte lÃƒÆ’Ã‚Â¶schen.', ''),
('PG_UNINSTALLMES', 'DE', 'Sie sind im Begriff, ein Plugin zu entfernen. Das Entfernen eines Moduls lÃƒÆ’Ã‚Â¶scht nicht nur den Inhalts-Typ sondern lÃƒÆ’Ã‚Â¶scht auch jeden einzelnen Inhalt, der in der Datenbank gespeichert ist.', ''),
('PG_UNINSTALL', 'DE', 'PlugIn deinstallieren', ''),
('PG_INSTALL', 'DE', 'PlugIn installieren', ''),
('PG_TITLE', 'DE', 'PlugIns', ''),
('PG_NEWERINSTALLE', 'DE', 'Eine neuere Version des PlugIns ist bereits installiert!', ''),
('PG_ALREADYINSTAL', 'DE', 'Das PlugIn ist bereits installiert!', ''),
('PG_ERROR', 'DE', 'WÃƒÆ’Ã‚Â¤hrend der Installation des PlugIns ist ein Fehler aufgetreten!', ''),
('PG_UPGRADED', 'DE', 'Das PlugIn wurde erfolgreich aktualisiert!', ''),
('PG_INSTALLED', 'DE', 'Das PlugIn wurde erfolgreich installiert!', ''),
('CLASS_WRONG', 'DE', 'Die von Ihnen angegebene Datei hat keine gÃƒÆ’Ã‚Â¼ltige Klassen-Signatur!', ''),
('PG_FILEWRONG', 'DE', 'Der von Ihnen eingegebene Dateiname konnte auf dem Server nicht gefunden werden!', ''),
('PG_CHOOSE', 'DE', 'PlugIn: Ãƒâ€šÃ‚Â  /plugin/', ''),
('CLT_MINCARD', 'DE', 'minimale Anzahl', ''),
('CLT_MAXCARD', 'DE', 'maximale Anzahl', ''),
('LINKED', 'DE', 'VerknÃƒÆ’Ã‚Â¼pft mit', ''),
('PG_INSTALLDESC', 'DE', 'Bitte stellen Sie sicher, dass Sie alle benÃƒÆ’Ã‚Â¶tigten Dateien ins Verzeichnis kopiert haben, bevor Sie fortfahren. Geben Sie in das untenstehende Eingabefeld den korrekten Pfad zum PlugIn ein. Das System wird das PlugIn dann automatisch installieren.', ''),
('CLT_SCHEME', 'DE', 'Klasse bearbeiten', ''),
('CLTI_DELETE', 'DE', 'MÃƒÆ’Ã‚Â¶chten Sie dieses Element wirklich lÃƒÆ’Ã‚Â¶schen? SÃƒÆ’Ã‚Â¤mtliche Instanzen dieses Elements werden ebenfalls gelÃƒÆ’Ã‚Â¶scht!', ''),
('CLT_DELMES', 'DE', 'Sie sind im Begriff eine Klasse zu lÃƒÆ’Ã‚Â¶schen. Dies wird den Verlust aller(!) Ihnhalte zur Folge haben, die mit dieser Klasse als Vorlage erstellt wurden. Sind Sie sicher, dass Sie forfahren mÃƒÆ’Ã‚Â¶chten?', ''),
('CLT_DELETE', 'DE', 'Klasse lÃƒÆ’Ã‚Â¶schen', ''),
('CLT_NAME', 'DE', 'Klassenname', ''),
('CLT_PROPERTIES', 'DE', 'Klassen-Eigenschaften', ''),
('CLT_BROWSE', 'DE', 'Klassen', ''),
('CLT_NEW', 'DE', 'Neue Klasse', ''),
('M_PGN', 'DE', 'Plugin-Verwaltung', ''),
('M_PURGE', 'DE', 'Datenbank bereinigen', ''),
('M_VAR', 'DE', 'Sprachen', ''),
('M_UMAN', 'DE', 'Benutzer-Verwaltung', ''),
('M_CLTB', 'DE', 'Klassen-Browser', ''),
('M_CLB', 'DE', 'Objekte', ''),
('M_LOGOUT', 'DE', 'Abmelden', ''),
('M_MYPROFILE', 'DE', 'Mein Profil', ''),
('M_MYPRT', 'DE', 'Meine Portale', ''),
('M_PRTMAN', 'DE', 'Portal-Manager', ''),
('M_ES', 'DE', 'Website', ''),
('M_SPM', 'DE', 'Seiten Vorlagen', ''),
('M_INSTALLPLUGIN', 'DE', 'PlugIns', ''),
('SELECTEDOBJECT', 'DE', 'Derzeit ausgewÃƒÆ’Ã‚Â¤hltes Inhalts-Element', ''),
('SELECTEDINSTANCE', 'DE', 'AusgewÃƒÆ’Ã‚Â¤hltes Objekt', ''),
('M_META', 'DE', 'Meta-Vorlagen', ''),
('M_BROWSER', 'DE', 'Objekt-Browser', ''),
('SEARCH', 'DE', 'Suchen', ''),
('SEARCHIN', 'DE', 'Suchen nach', ''),
('SEARCHRESULTS', 'DE', 'Such-Ergebnisse, bitte treffen Sie Ihre Auswahl', ''),
('CONTENTTYPE', 'DE', 'Typ', ''),
('CONTENTITEM', 'DE', 'Inhalt', ''),
('FOLDER', 'DE', 'Ordner', ''),
('SR_SELECTCLI', 'DE', 'Bitte wÃƒÆ’Ã‚Â¤hlen Sie eine Klasse. AnschlieÃƒÆ’Ã…Â¸end kÃƒÆ’Ã‚Â¶nnen Sie ein Objekt auswÃƒÆ’Ã‚Â¤hlen.', ''),
('SR_SELECTCI', 'DE', 'Sie kÃƒÆ’Ã‚Â¶nnen hier nach einem beliebigen Inhalts-Element suchen. Wenn Sie ein Inhalts-Element selektieren mÃƒÆ’Ã‚Â¶chten, wÃƒÆ’Ã‚Â¤hlen Sie es aus und klicken Sie die Aktualisieren-SchaltflÃƒÆ’Ã‚Â¤che! Wenn sie neuen Inhalt mit diesem Feld verbinden mÃƒÆ’Ã‚Â¶chten, erstellen Sie es bitte zunÃƒÆ’Ã‚Â¤chst in der Bibliothek.', ''),
('CLI', 'DE', 'Objekt:', ''),
('CLI_NOTDELETED', 'DE', 'Dieses Objekt kann nicht gelÃƒÆ’Ã‚Â¶scht werden!', ''),
('CLI_DELETED', 'DE', 'Das Objekt wurde gelÃƒÆ’Ã‚Â¶scht.', ''),
('CLI_DELETEMES', 'DE', 'MÃƒÆ’Ã‚Â¶chten Sie dieses Objekt wirklich lÃƒÆ’Ã‚Â¶schen?', ''),
('CLI_DELETE', 'DE', 'Objekt lÃƒÆ’Ã‚Â¶schen', ''),
('CLI_EDIT', 'DE', 'Objekt-Figur bearbeiten', ''),
('TITLE', 'DE', 'Titel', ''),
('CL_NOTITLE', 'DE', 'Noch kein Titel angegeben', ''),
('PO_BROWSER', 'MND', 'ÃƒÆ’Ã‹â€ ÃƒÆ’Ã‚Â«Ãƒâ€šÃ‚Â¿ÃƒÆ’Ã…Â¡ÃƒÆ’Ã‚Â¤Ãƒâ€šÃ‚Â¯ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã¢â‚¬Â ÃƒÆ’Ã‚Â·', NULL),
('PO_OWNER', 'MND', 'ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â³ÃƒÆ’Ã†â€™ÃƒÆ’Ã‚Â¦Master', NULL),
('PO_CRSUCCEEDED', 'MND', 'Ãƒâ€šÃ‚Â³ÃƒÆ’Ã¢â‚¬Â°Ãƒâ€šÃ‚Â¹Ãƒâ€šÃ‚Â¦Ãƒâ€šÃ‚Â´Ãƒâ€šÃ‚Â´Ãƒâ€šÃ‚Â½Ãƒâ€šÃ‚Â¨ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬Å¡ÃƒÆ’Ã‹â€ ÃƒÆ’Ã‚Â«Ãƒâ€šÃ‚Â¿ÃƒÆ’Ã…Â¡ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â³ÃƒÆ’Ã†â€™ÃƒÆ’Ã‚Â¦!', NULL),
('PO_MYPORTAL', 'MND', 'ÃƒÆ’Ã…Â½ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã‹â€ ÃƒÆ’Ã‚Â«Ãƒâ€šÃ‚Â¿ÃƒÆ’Ã…Â¡ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â³ÃƒÆ’Ã†â€™ÃƒÆ’Ã‚Â¦', NULL),
('PO_EDIT', 'MND', 'Ãƒâ€šÃ‚Â±ÃƒÆ’Ã‚Â Ãƒâ€šÃ‚Â¼Ãƒâ€šÃ‚Â­ÃƒÆ’Ã‹â€ ÃƒÆ’Ã‚Â«Ãƒâ€šÃ‚Â¿ÃƒÆ’Ã…Â¡ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â³ÃƒÆ’Ã†â€™ÃƒÆ’Ã‚Â¦', NULL),
('SP_BROWSE', 'MND', 'ÃƒÆ’Ã‚Â¤Ãƒâ€šÃ‚Â¯ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã¢â‚¬Â¢Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚ÂµÃƒÆ’Ã‚Â£Ãƒâ€šÃ‚ÂµÃƒÆ’Ã‹Å“ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â¼', NULL),
('SP_NEWPAGE', 'MND', 'ÃƒÆ’Ã¢â‚¬Â?ÃƒÆ’Ã‚Â¶Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã¢â‚¬Å“ÃƒÆ’Ã¢â‚¬Â¢Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚ÂµÃƒÆ’Ã‚Â£ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â³ÃƒÆ’Ã†â€™ÃƒÆ’Ã‚Â¦', NULL),
('SP_NEWINSTANCE', 'MND', 'ÃƒÆ’Ã¢â‚¬Â?ÃƒÆ’Ã‚Â¶Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã¢â‚¬Å“ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â³ÃƒÆ’Ã†â€™ÃƒÆ’Ã‚Â¦', NULL),
('SP_IPROPERTIES', 'MND', 'ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â³ÃƒÆ’Ã†â€™ÃƒÆ’Ã‚Â¦ÃƒÆ’Ã…Â ÃƒÆ’Ã‚Â´ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬Â?', NULL),
('SP_PROPERTIES', 'MND', 'ÃƒÆ’Ã¢â‚¬Â¢Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚ÂµÃƒÆ’Ã‚Â£ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â³ÃƒÆ’Ã†â€™ÃƒÆ’Ã‚Â¦ÃƒÆ’Ã…Â ÃƒÆ’Ã‚Â´ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬Â?', NULL),
('SP_DELMES', 'MND', 'ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã‚ÂºÃƒÆ’Ã¢â‚¬Â¢ÃƒÆ’Ã‚Â½ÃƒÆ’Ã¢â‚¬â€?Ãƒâ€šÃ‚Â¼Ãƒâ€šÃ‚Â±Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã¢â‚¬Â°Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚Â³ÃƒÆ’Ã‚Â½ÃƒÆ’Ã¢â‚¬Â¢Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚ÂµÃƒÆ’Ã‚Â£ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â³ÃƒÆ’Ã†â€™ÃƒÆ’Ã‚Â¦Ãƒâ€šÃ‚Â¡Ãƒâ€šÃ‚Â£ÃƒÆ’Ã¢â‚¬Â¡ÃƒÆ’Ã‚Â«ÃƒÆ’Ã¢â‚¬â€?Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã¢â‚¬â„¢ÃƒÆ’Ã‚Â¢Ãƒâ€šÃ‚Â£Ãƒâ€šÃ‚Â¬ÃƒÆ’Ã¢â‚¬Â¢Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚ÂµÃƒÆ’Ã‚Â£ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â³ÃƒÆ’Ã†â€™ÃƒÆ’Ã‚Â¦Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã…Â Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã‚Â½ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â²Ãƒâ€šÃ‚Â»ÃƒÆ’Ã‚Â¡Ãƒâ€šÃ‚Â±Ãƒâ€šÃ‚Â»ÃƒÆ’Ã¢â‚¬Â°Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚Â³ÃƒÆ’Ã‚Â½!', NULL),
('SP_DELETE', 'MND', 'ÃƒÆ’Ã¢â‚¬Â°Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚Â³ÃƒÆ’Ã‚Â½ÃƒÆ’Ã¢â‚¬Â¢Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚ÂµÃƒÆ’Ã‚Â£ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â³ÃƒÆ’Ã†â€™ÃƒÆ’Ã‚Â¦', NULL),
('SP_PDELMES', 'MND', 'ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã‚ÂºÃƒÆ’Ã¢â‚¬Â¢ÃƒÆ’Ã‚Â½ÃƒÆ’Ã¢â‚¬â€?Ãƒâ€šÃ‚Â¼Ãƒâ€šÃ‚Â±Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã¢â‚¬Â°Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚Â³ÃƒÆ’Ã‚Â½ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â³ÃƒÆ’Ã†â€™ÃƒÆ’Ã‚Â¦Ãƒâ€šÃ‚Â¡Ãƒâ€šÃ‚Â£ÃƒÆ’Ã¢â‚¬Â¡ÃƒÆ’Ã‚Â«ÃƒÆ’Ã¢â‚¬â€?Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã¢â‚¬â„¢ÃƒÆ’Ã‚Â¢Ãƒâ€šÃ‚Â£Ãƒâ€šÃ‚Â¬ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â³ÃƒÆ’Ã†â€™ÃƒÆ’Ã‚Â¦Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã…Â Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã‚Â½ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â²Ãƒâ€šÃ‚Â»ÃƒÆ’Ã‚Â¡Ãƒâ€šÃ‚Â±Ãƒâ€šÃ‚Â»ÃƒÆ’Ã¢â‚¬Â°Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚Â³ÃƒÆ’Ã‚Â½!', NULL),
('SP_PDELETE', 'MND', 'ÃƒÆ’Ã¢â‚¬Â°Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚Â³ÃƒÆ’Ã‚Â½ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â³ÃƒÆ’Ã†â€™ÃƒÆ’Ã‚Â¦', NULL),
('SP_CONFIGURE', 'MND', 'ÃƒÆ’Ã¢â‚¬Â¦ÃƒÆ’Ã‚Â¤ÃƒÆ’Ã¢â‚¬â€œÃƒÆ’Ã†â€™ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â³ÃƒÆ’Ã†â€™ÃƒÆ’Ã‚Â¦', NULL),
('SP_CONFDESC', 'MND', 'ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã‚ÂºÃƒâ€šÃ‚Â¿ÃƒÆ’Ã¢â‚¬Â°ÃƒÆ’Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬Â?Ãƒâ€šÃ‚Â½Ãƒâ€šÃ‚Â«Ãƒâ€šÃ‚Â±Ãƒâ€šÃ‚Â¾ÃƒÆ’Ã¢â‚¬Â¢Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚ÂµÃƒÆ’Ã‚Â£ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â³ÃƒÆ’Ã†â€™ÃƒÆ’Ã‚Â¦Ãƒâ€šÃ‚Â¹ÃƒÆ’Ã‹Å“ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚ÂªÃƒÆ’Ã¢â‚¬â€œÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â¶ÃƒÆ’Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬ËœÃƒâ€šÃ‚Â´ÃƒÆ’Ã‚Â¦ÃƒÆ’Ã¢â‚¬Â?ÃƒÆ’Ã…Â¡Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â´ÃƒÆ’Ã‹Å“Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã‚Â½Ãƒâ€šÃ‚Â³ÃƒÆ’Ã…â€™Ãƒâ€šÃ‚Â£Ãƒâ€šÃ‚Â¬Ãƒâ€šÃ‚Â»ÃƒÆ’Ã‚Â²ÃƒÆ’Ã¢â‚¬Â¢ÃƒÆ’Ã…Â¸ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã‚ÂºÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â²Ãƒâ€šÃ‚Â¿ÃƒÆ’Ã¢â‚¬Â°ÃƒÆ’Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬Â?Ãƒâ€šÃ‚Â´Ãƒâ€šÃ‚Â´Ãƒâ€šÃ‚Â½Ãƒâ€šÃ‚Â¨ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â¶ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã‚Â½Ãƒâ€šÃ‚Â³ÃƒÆ’Ã…â€™Ãƒâ€šÃ‚Â£Ãƒâ€šÃ‚Â¬ÃƒÆ’Ã¢â‚¬Â¡ÃƒÆ’Ã‚Â«Ãƒâ€šÃ‚Â¾ÃƒÆ’Ã‚Â¶Ãƒâ€šÃ‚Â¶Ãƒâ€šÃ‚Â¨ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã‚ÂºÃƒÆ’Ã‚Â?ÃƒÆ’Ã‚Â«ÃƒÆ’Ã¢â‚¬â€?ÃƒÆ’Ã‚Â¶ÃƒÆ’Ã…Â Ãƒâ€šÃ‚Â²ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â´Ãƒâ€šÃ‚Â¡Ãƒâ€šÃ‚Â£', NULL),
('SP_LINK', 'MND', 'Ãƒâ€šÃ‚Â¹ÃƒÆ’Ã‹Å“ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚ÂªÃƒÆ’Ã¢â‚¬â€œÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬ËœÃƒâ€šÃ‚Â´ÃƒÆ’Ã‚Â¦ÃƒÆ’Ã¢â‚¬Â?ÃƒÆ’Ã…Â¡Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â´ÃƒÆ’Ã‹Å“Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã‚Â½Ãƒâ€šÃ‚Â³ÃƒÆ’Ã…â€™', NULL),
('SP_CLNEW', 'MND', 'Ãƒâ€šÃ‚Â´Ãƒâ€šÃ‚Â´Ãƒâ€šÃ‚Â½Ãƒâ€šÃ‚Â¨ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â´ÃƒÆ’Ã‹Å“Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã‚Â½Ãƒâ€šÃ‚Â³ÃƒÆ’Ã…â€™', NULL),
('SP_EDIT', 'MND', 'Ãƒâ€šÃ‚Â±ÃƒÆ’Ã‚Â Ãƒâ€šÃ‚Â¼Ãƒâ€šÃ‚Â­ÃƒÆ’Ã¢â‚¬Â¢Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚ÂµÃƒÆ’Ã‚Â£ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â³ÃƒÆ’Ã†â€™ÃƒÆ’Ã‚Â¦', NULL),
('SP_MENUPROPS', 'MND', 'Ãƒâ€šÃ‚Â²ÃƒÆ’Ã¢â‚¬Â¹Ãƒâ€šÃ‚ÂµÃƒâ€šÃ‚Â¥ÃƒÆ’Ã†â€™ÃƒÆ’Ã‚Â»ÃƒÆ’Ã¢â‚¬Å“ÃƒÆ’Ã‚Â«Ãƒâ€šÃ‚Â°ÃƒÆ’Ã‚Â¯ÃƒÆ’Ã¢â‚¬â€œÃƒÆ’Ã‚ÂºÃƒÆ’Ã…Â½ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã¢â‚¬â€?ÃƒÆ’Ã¢â‚¬â€œ', NULL),
('SP_MENUNAME', 'MND', 'Ãƒâ€šÃ‚Â²ÃƒÆ’Ã¢â‚¬Â¹Ãƒâ€šÃ‚ÂµÃƒâ€šÃ‚Â¥ÃƒÆ’Ã¢â‚¬Â°ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã†â€™ÃƒÆ’Ã‚Â»Ãƒâ€šÃ‚Â³ÃƒÆ’Ã¢â‚¬Â ', NULL),
('SP_MENUHELP', 'MND', 'Ãƒâ€šÃ‚Â²ÃƒÆ’Ã¢â‚¬Â¹Ãƒâ€šÃ‚ÂµÃƒâ€šÃ‚Â¥ÃƒÆ’Ã¢â‚¬Â°ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â°ÃƒÆ’Ã‚Â¯ÃƒÆ’Ã¢â‚¬â€œÃƒÆ’Ã‚ÂºÃƒÆ’Ã…Â½ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã¢â‚¬â€?ÃƒÆ’Ã¢â‚¬â€œ', NULL),
('SP_LAUNCHDATE', 'MND', 'Ãƒâ€šÃ‚Â´ÃƒÆ’Ã¢â‚¬Å“...Ãƒâ€šÃ‚Â¼Ãƒâ€šÃ‚Â¤Ãƒâ€šÃ‚Â»ÃƒÆ’Ã‚Â®', NULL),
('SP_EXPIREDATE', 'MND', 'Ãƒâ€šÃ‚Â´ÃƒÆ’Ã¢â‚¬Å“...ÃƒÆ’Ã…Â Ãƒâ€šÃ‚Â§ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â§', NULL),
('SP_LAUNCHDATES', 'MND', 'ÃƒÆ’Ã…Â Ãƒâ€šÃ‚ÂµÃƒÆ’Ã…Â Ãƒâ€šÃ‚Â±ÃƒÆ’Ã¢â‚¬Â¦ÃƒÆ’Ã‚Â¤ÃƒÆ’Ã¢â‚¬â€œÃƒÆ’Ã†â€™', NULL),
('SP_PREVIEW', 'MND', 'ÃƒÆ’Ã¢â‚¬Â?Ãƒâ€šÃ‚Â¤ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â³ÃƒÆ’Ã†â€™ÃƒÆ’Ã‚Â¦', NULL),
('SP_LAUNCH', 'MND', 'ÃƒÆ’Ã¢â‚¬Â ÃƒÆ’Ã‚Â´Ãƒâ€šÃ‚Â¶Ãƒâ€šÃ‚Â¯ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â³ÃƒÆ’Ã†â€™ÃƒÆ’Ã‚Â¦', NULL),
('SP_EXPIRE', 'MND', 'ÃƒÆ’Ã…Â Ãƒâ€šÃ‚Â§ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â§ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â³ÃƒÆ’Ã†â€™ÃƒÆ’Ã‚Â¦', NULL),
('NOSPTITLE', 'MND', 'ÃƒÆ’Ã¢â‚¬Â ÃƒÆ’Ã‚Â´Ãƒâ€šÃ‚Â¶Ãƒâ€šÃ‚Â¯ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â³ÃƒÆ’Ã†â€™ÃƒÆ’Ã‚Â¦ÃƒÆ’Ã¢â‚¬â€œÃƒâ€šÃ‚Â®ÃƒÆ’Ã¢â‚¬Â¡Ãƒâ€šÃ‚Â°ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã‚ÂºÃƒâ€šÃ‚Â±ÃƒÆ’Ã‹Å“ÃƒÆ’Ã‚Â?ÃƒÆ’Ã‚Â«Ãƒâ€šÃ‚Â¶Ãƒâ€šÃ‚Â¨ÃƒÆ’Ã¢â‚¬â„¢ÃƒÆ’Ã‚Â¥Ãƒâ€šÃ‚Â²ÃƒÆ’Ã¢â‚¬Â¹Ãƒâ€šÃ‚ÂµÃƒâ€šÃ‚Â¥ÃƒÆ’Ã¢â‚¬Â°ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã†â€™ÃƒÆ’Ã‚Â»Ãƒâ€šÃ‚Â³ÃƒÆ’Ã¢â‚¬Â !', NULL),
('SPM', 'MND', 'ÃƒÆ’Ã¢â‚¬Â¢Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚ÂµÃƒÆ’Ã‚Â£ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â³ÃƒÆ’Ã†â€™ÃƒÆ’Ã‚Â¦Master', NULL),
('SPM_EDIT', 'MND', 'Ãƒâ€šÃ‚Â±ÃƒÆ’Ã‚Â Ãƒâ€šÃ‚Â¼Ãƒâ€šÃ‚Â­ÃƒÆ’Ã¢â‚¬Â¢Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚ÂµÃƒÆ’Ã‚Â£ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â³ÃƒÆ’Ã†â€™ÃƒÆ’Ã‚Â¦Master', NULL),
('SPM_META', 'MND', 'META-KeyÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â£Ãƒâ€šÃ‚Â°ÃƒÆ’Ã‚Â¥', NULL),
('SPM_VARIATIONS', 'MND', 'Ãƒâ€šÃ‚Â¿ÃƒÆ’Ã¢â‚¬Â°ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬Â?ÃƒÆ’Ã…Â Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â±ÃƒÆ’Ã‚Â¤ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â¿', NULL),
('SPM_TYPE', 'MND', 'ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â³ÃƒÆ’Ã†â€™ÃƒÆ’Ã‚Â¦ÃƒÆ’Ã¢â‚¬â€œÃƒÆ’Ã¢â‚¬â€œÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã‚Â ', NULL),
('SPM_CLUSTER', 'MND', 'Ãƒâ€šÃ‚Â´ÃƒÆ’Ã‹Å“ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â£Ãƒâ€šÃ‚Â°ÃƒÆ’Ã‚Â¥', NULL),
('SPM_PATH', 'MND', 'ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â£Ãƒâ€šÃ‚Â°ÃƒÆ’Ã‚Â¥ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â·Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚Â¶', NULL),
('CL_BROWSE', 'MND', 'ÃƒÆ’Ã‚Â¤Ãƒâ€šÃ‚Â¯ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã¢â€šÂ¬Ãƒâ€šÃ‚Â´ÃƒÆ’Ã‹Å“', NULL),
('CL_NEW', 'MND', 'ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬Å¡ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã‚Â½Ãƒâ€šÃ‚Â³ÃƒÆ’Ã…â€™', NULL),
('CL_PROPERTIES', 'MND', 'ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã‚Â½Ãƒâ€šÃ‚Â³ÃƒÆ’Ã…â€™ÃƒÆ’Ã…Â ÃƒÆ’Ã‚Â´ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬Â?', NULL),
('CL_DEL', 'MND', 'ÃƒÆ’Ã¢â‚¬Â°Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚Â³ÃƒÆ’Ã‚Â½ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã‚Â½Ãƒâ€šÃ‚Â³ÃƒÆ’Ã…â€™', NULL),
('CL_DELMES', 'MND', 'ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã‚ÂºÃƒÆ’Ã‹â€ Ãƒâ€šÃ‚Â·ÃƒÆ’Ã…Â Ãƒâ€šÃ‚ÂµÃƒÆ’Ã‚Â?ÃƒÆ’Ã‚Â«ÃƒÆ’Ã¢â‚¬Â°Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚Â³ÃƒÆ’Ã‚Â½ÃƒÆ’Ã¢â‚¬Â¢ÃƒÆ’Ã‚Â¢Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â¶Ãƒâ€šÃ‚Â´ÃƒÆ’Ã‹Å“ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã‚Â½Ãƒâ€šÃ‚Â³ÃƒÆ’Ã…â€™ÃƒÆ’Ã¢â‚¬Å¡ÃƒÆ’Ã‚Â°.ÃƒÆ’Ã¢â‚¬Â¹ÃƒÆ’Ã‚Â¹ÃƒÆ’Ã¢â‚¬Å“ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã…Â¡ÃƒÆ’Ã‹â€ ÃƒÆ’Ã‚Â?ÃƒÆ’Ã…Â ÃƒÆ’Ã‚Â½Ãƒâ€šÃ‚Â¾ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â»ÃƒÆ’Ã‚Â¡Ãƒâ€šÃ‚Â¶Ãƒâ€šÃ‚ÂªÃƒÆ’Ã…Â Ãƒâ€šÃ‚Â§!', NULL),
('CL_EDIT', 'MND', 'Ãƒâ€šÃ‚Â±ÃƒÆ’Ã‚Â Ãƒâ€šÃ‚Â¼Ãƒâ€šÃ‚Â­Ãƒâ€šÃ‚Â´ÃƒÆ’Ã‹Å“ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã‚Â½Ãƒâ€šÃ‚Â³ÃƒÆ’Ã…â€™', NULL),
('CL_CREATEINSTANC', 'MND', 'Ãƒâ€šÃ‚Â´Ãƒâ€šÃ‚Â´Ãƒâ€šÃ‚Â½Ãƒâ€šÃ‚Â¨ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬Å¡ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã‚Â½Ãƒâ€šÃ‚Â³ÃƒÆ’Ã…â€™', NULL),
('CL_CREATEINSMES', 'MND', 'ÃƒÆ’Ã‹â€ ÃƒÆ’Ã¢â‚¬Â?ÃƒÆ’Ã¢â‚¬Å“ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â¿ÃƒÆ’Ã¢â‚¬Â¢Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã‚Â¤Ãƒâ€šÃ‚Â¿ÃƒÆ’Ã¢â‚¬Â°Ãƒâ€šÃ‚Â´Ãƒâ€šÃ‚Â´Ãƒâ€šÃ‚Â½Ãƒâ€šÃ‚Â¨ÃƒÆ’Ã¢â‚¬Â¢ÃƒÆ’Ã‚Â¢Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â¶ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã…Â¡ÃƒÆ’Ã‹â€ ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬â€?ÃƒÆ’Ã¢â‚¬â€œÃƒâ€šÃ‚Â¶ÃƒÆ’Ã…Â½Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â¶ÃƒÆ’Ã‚Â®ÃƒÆ’Ã‚Â?ÃƒÆ’Ã‚Â¢ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã‚Â½Ãƒâ€šÃ‚Â³ÃƒÆ’Ã…â€™. ÃƒÆ’Ã‹â€ ÃƒÆ’Ã‚Â§Ãƒâ€šÃ‚Â¹ÃƒÆ’Ã‚Â»ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã‚ÂºÃƒÆ’Ã‚Â?ÃƒÆ’Ã‚Â«Ãƒâ€šÃ‚Â´Ãƒâ€šÃ‚Â´Ãƒâ€šÃ‚Â½Ãƒâ€šÃ‚Â¨ÃƒÆ’Ã‚Â?ÃƒÆ’Ã‚Â­ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â¶ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã‚Â½Ãƒâ€šÃ‚Â³ÃƒÆ’Ã…â€™Ãƒâ€šÃ‚Â£Ãƒâ€šÃ‚Â¬ÃƒÆ’Ã¢â‚¬Â¡ÃƒÆ’Ã‚Â«ÃƒÆ’Ã¢â‚¬Â?ÃƒÆ’Ã…Â¡ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬Å¡ÃƒÆ’Ã†â€™ÃƒÆ’Ã‚Â¦Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã…Â½ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã¢â‚¬â€?ÃƒÆ’Ã¢â‚¬â€œÃƒâ€šÃ‚Â¿ÃƒÆ’Ã‚Â²ÃƒÆ’Ã¢â‚¬â€œÃƒÆ’Ã‚Â?ÃƒÆ’Ã…Â ÃƒÆ’Ã‚Â¤ÃƒÆ’Ã‹â€ ÃƒÆ’Ã‚Â«Ãƒâ€šÃ‚Â±ÃƒÆ’Ã‚ÂªÃƒÆ’Ã…â€™ÃƒÆ’Ã‚Â¢Ãƒâ€šÃ‚Â£Ãƒâ€šÃ‚Â¬Ãƒâ€šÃ‚Â²Ãƒâ€šÃ‚Â¢Ãƒâ€šÃ‚Â°Ãƒâ€šÃ‚Â´ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬Å¡CreatÃƒâ€šÃ‚Â°Ãƒâ€šÃ‚Â´ÃƒÆ’Ã¢â‚¬Â¦Ãƒâ€šÃ‚Â¥.', NULL),
('CL_NOTITLE', 'MND', 'Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â¹ÃƒÆ’Ã…Â½Ãƒâ€šÃ‚Â´Ãƒâ€šÃ‚Â¶Ãƒâ€šÃ‚Â¨ÃƒÆ’Ã¢â‚¬â„¢ÃƒÆ’Ã‚Â¥Ãƒâ€šÃ‚Â±ÃƒÆ’Ã‚ÂªÃƒÆ’Ã…â€™ÃƒÆ’Ã‚Â¢', NULL),
('TITLE', 'MND', 'Ãƒâ€šÃ‚Â±ÃƒÆ’Ã‚ÂªÃƒÆ’Ã…â€™ÃƒÆ’Ã‚Â¢', NULL),
('CLI_EDIT', 'MND', 'Ãƒâ€šÃ‚Â±ÃƒÆ’Ã‚Â Ãƒâ€šÃ‚Â¼Ãƒâ€šÃ‚Â­Ãƒâ€šÃ‚Â´ÃƒÆ’Ã‹Å“Ãƒâ€šÃ‚ÂºÃƒÆ’Ã¢â‚¬Â¦', NULL),
('CLI_DELETE', 'MND', 'ÃƒÆ’Ã¢â‚¬Â°Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚Â³ÃƒÆ’Ã‚Â½Ãƒâ€šÃ‚Â´ÃƒÆ’Ã‹Å“Ãƒâ€šÃ‚ÂºÃƒÆ’Ã¢â‚¬Â¦', NULL),
('CLI_DELETEMES', 'MND', 'ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã‚ÂºÃƒÆ’Ã‹â€ Ãƒâ€šÃ‚Â·ÃƒÆ’Ã…Â Ãƒâ€šÃ‚ÂµÃƒÆ’Ã‚Â?ÃƒÆ’Ã‚Â«ÃƒÆ’Ã¢â‚¬Â°Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚Â³ÃƒÆ’Ã‚Â½ÃƒÆ’Ã¢â‚¬Â¢ÃƒÆ’Ã‚Â¢Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â¶ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã‚Â½Ãƒâ€šÃ‚Â³ÃƒÆ’Ã…â€™ÃƒÆ’Ã¢â‚¬Å¡ÃƒÆ’Ã‚Â°. ÃƒÆ’Ã¢â‚¬Â¹ÃƒÆ’Ã‚Â¼Ãƒâ€šÃ‚Â»ÃƒÆ’Ã‚Â¡ÃƒÆ’Ã¢â‚¬Å“ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã¢â‚¬Â?Ãƒâ€šÃ‚Â¶ÃƒÆ’Ã…Â Ãƒâ€šÃ‚Â§ÃƒÆ’Ã‹â€ Ãƒâ€šÃ‚Â¥!', NULL),
('CLI_DELETED', 'MND', 'ÃƒÆ’Ã¢â‚¬Â¢ÃƒÆ’Ã‚Â¢Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â¶ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã‚Â½Ãƒâ€šÃ‚Â³ÃƒÆ’Ã…â€™ÃƒÆ’Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬ËœÃƒâ€šÃ‚Â±Ãƒâ€šÃ‚Â»ÃƒÆ’Ã¢â‚¬Â°Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚Â³ÃƒÆ’Ã‚Â½!', NULL),
('CLI_NOTDELETED', 'MND', 'ÃƒÆ’Ã¢â‚¬Â¢ÃƒÆ’Ã‚Â¢Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â¶ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã‚Â½Ãƒâ€šÃ‚Â³ÃƒÆ’Ã…â€™Ãƒâ€šÃ‚Â²Ãƒâ€šÃ‚Â»ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã…â€œÃƒâ€šÃ‚Â±Ãƒâ€šÃ‚Â»ÃƒÆ’Ã¢â‚¬Â°Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚Â³ÃƒÆ’Ã‚Â½!', NULL),
('CLI', 'MND', 'Ãƒâ€šÃ‚Â´ÃƒÆ’Ã‹Å“ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã‚Â½Ãƒâ€šÃ‚Â³ÃƒÆ’Ã…â€™:', NULL),
('SR_SELECTCI', 'MND', 'ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã‚ÂºÃƒâ€šÃ‚Â¿ÃƒÆ’Ã¢â‚¬Â°ÃƒÆ’Ã¢â‚¬Â¹ÃƒÆ’Ã¢â‚¬ËœÃƒÆ’Ã¢â‚¬Â¹ÃƒÆ’Ã‚Â·ÃƒÆ’Ã‹â€ ÃƒÆ’Ã…Â½Ãƒâ€šÃ‚ÂºÃƒÆ’Ã…Â½ÃƒÆ’Ã¢â‚¬Â¢ÃƒÆ’Ã‚Â¢ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã‚Â¯Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã…Â¡ÃƒÆ’Ã‹â€ ÃƒÆ’Ã‚Â?ÃƒÆ’Ã…â€™ÃƒÆ’Ã‚ÂµÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â¿.ÃƒÆ’Ã‹â€ ÃƒÆ’Ã‚Â§Ãƒâ€šÃ‚Â¹ÃƒÆ’Ã‚Â»ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã‚ÂºÃƒÆ’Ã‚Â?ÃƒÆ’Ã‚Â«ÃƒÆ’Ã¢â‚¬ËœÃƒâ€šÃ‚Â¡Ãƒâ€šÃ‚Â¶Ãƒâ€šÃ‚Â¨ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â¶ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã…Â¡ÃƒÆ’Ã‹â€ ÃƒÆ’Ã‚Â?ÃƒÆ’Ã…â€™ÃƒÆ’Ã‚ÂµÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â¿, Ãƒâ€šÃ‚Â¿ÃƒÆ’Ã¢â‚¬Â°ÃƒÆ’Ã¢â‚¬ËœÃƒâ€šÃ‚Â¡ÃƒÆ’Ã¢â‚¬â€œÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬Â¹ÃƒÆ’Ã‚Â¼Ãƒâ€šÃ‚Â²Ãƒâ€šÃ‚Â¢Ãƒâ€šÃ‚Â°Ãƒâ€šÃ‚Â´ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â²Ãƒâ€šÃ‚Â¢Ãƒâ€šÃ‚Â°Ãƒâ€šÃ‚Â´ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬Å¡UpdateÃƒâ€šÃ‚Â°Ãƒâ€šÃ‚Â´ÃƒÆ’Ã¢â‚¬Â¦Ãƒâ€šÃ‚Â¥! ÃƒÆ’Ã‹â€ ÃƒÆ’Ã‚Â§Ãƒâ€šÃ‚Â¹ÃƒÆ’Ã‚Â»ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã‚ÂºÃƒÆ’Ã‚Â?ÃƒÆ’Ã‚Â«Ãƒâ€šÃ‚Â¹ÃƒÆ’Ã‹Å“ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚ÂªÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬Å¡ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã…Â¡ÃƒÆ’Ã‹â€ ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬â€œÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬Â¢ÃƒÆ’Ã‚Â¢Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â¶ÃƒÆ’Ã¢â‚¬â€?ÃƒÆ’Ã¢â‚¬â€œÃƒâ€šÃ‚Â¶ÃƒÆ’Ã…Â½, create the content in the Object Browser first.', NULL),
('SR_SELECTCLI', 'MND', 'ÃƒÆ’Ã¢â‚¬Â¡ÃƒÆ’Ã‚Â«ÃƒÆ’Ã¢â‚¬ËœÃƒâ€šÃ‚Â¡ÃƒÆ’Ã¢â‚¬Â?ÃƒÆ’Ã‚Â±ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â¶Ãƒâ€šÃ‚Â´ÃƒÆ’Ã‹Å“ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â£Ãƒâ€šÃ‚Â°ÃƒÆ’Ã‚Â¥. ÃƒÆ’Ã‹â€ Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚ÂºÃƒÆ’Ã‚Â³ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã‚ÂºÃƒâ€šÃ‚Â¿ÃƒÆ’Ã¢â‚¬Â°ÃƒÆ’Ã¢â‚¬ËœÃƒâ€šÃ‚Â¡ÃƒÆ’Ã¢â‚¬Â?ÃƒÆ’Ã‚Â±ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â¶ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â£Ãƒâ€šÃ‚Â°ÃƒÆ’Ã‚Â¥Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã‚Â½Ãƒâ€šÃ‚Â³ÃƒÆ’Ã…â€™ÃƒÆ’Ã¢â€šÂ¬Ãƒâ€šÃ‚Â´ÃƒÆ’Ã…Â Ãƒâ€šÃ‚Â¹ÃƒÆ’Ã¢â‚¬Å“ÃƒÆ’Ã†â€™.', NULL),
('FOLDER', 'MND', 'ÃƒÆ’Ã…Â½ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã‚Â¾Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã‚Â?', NULL),
('CONTENTTYPE', 'MND', 'ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã…Â¡ÃƒÆ’Ã‹â€ ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã‚Â ÃƒÆ’Ã‚Â?ÃƒÆ’Ã‚Â?', NULL),
('CONTENTITEM', 'MND', 'ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã…Â¡ÃƒÆ’Ã‹â€ ÃƒÆ’Ã‚Â?ÃƒÆ’Ã…â€™ÃƒÆ’Ã‚ÂµÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â¿', NULL),
('SEARCH', 'MND', 'Ãƒâ€šÃ‚Â¿Ãƒâ€šÃ‚ÂªÃƒÆ’Ã…Â Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã¢â‚¬Â¹ÃƒÆ’Ã¢â‚¬ËœÃƒÆ’Ã¢â‚¬Â¹ÃƒÆ’Ã‚Â·', NULL),
('SEARCHIN', 'MND', 'ÃƒÆ’Ã¢â‚¬Â¹ÃƒÆ’Ã¢â‚¬ËœÃƒÆ’Ã¢â‚¬Â¹ÃƒÆ’Ã‚Â·', NULL),
('SEARCHRESULTS', 'MND', 'ÃƒÆ’Ã¢â‚¬Â¹ÃƒÆ’Ã¢â‚¬ËœÃƒÆ’Ã¢â‚¬Â¹ÃƒÆ’Ã‚Â·Ãƒâ€šÃ‚Â½ÃƒÆ’Ã‚Â¡Ãƒâ€šÃ‚Â¹ÃƒÆ’Ã‚Â»Ãƒâ€šÃ‚Â£Ãƒâ€šÃ‚Â¬ÃƒÆ’Ã¢â‚¬Â¡ÃƒÆ’Ã‚Â«ÃƒÆ’Ã¢â‚¬ËœÃƒâ€šÃ‚Â¡ÃƒÆ’Ã¢â‚¬Â?ÃƒÆ’Ã‚Â±', NULL),
('SELECTEDOBJECT', 'MND', 'Ãƒâ€šÃ‚ÂµÃƒâ€šÃ‚Â±ÃƒÆ’Ã¢â‚¬Â¡Ãƒâ€šÃ‚Â°ÃƒÆ’Ã¢â‚¬ËœÃƒâ€šÃ‚Â¡ÃƒÆ’Ã¢â‚¬Â?ÃƒÆ’Ã‚Â±Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã…Â¡ÃƒÆ’Ã‹â€ ÃƒÆ’Ã‚Â?ÃƒÆ’Ã…â€™ÃƒÆ’Ã‚ÂµÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â¿', NULL),
('SELECTEDINSTANCE', 'MND', 'ÃƒÆ’Ã¢â‚¬ËœÃƒâ€šÃ‚Â¡ÃƒÆ’Ã¢â‚¬Â?ÃƒÆ’Ã‚Â±Ãƒâ€šÃ‚Â´ÃƒÆ’Ã‹Å“ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã‚Â½Ãƒâ€šÃ‚Â³ÃƒÆ’Ã…â€™', NULL),
('M_META', 'MND', 'MetaÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â£Ãƒâ€šÃ‚Â°ÃƒÆ’Ã‚Â¥', NULL),
('M_BROWSER', 'MND', 'ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â¿Ãƒâ€šÃ‚Â±ÃƒÆ’Ã‚ÂªÃƒÆ’Ã‚Â¤Ãƒâ€šÃ‚Â¯ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã¢â‚¬Â ÃƒÆ’Ã‚Â·', NULL),
('M_INSTALLPLUGIN', 'MND', 'Ãƒâ€šÃ‚Â²ÃƒÆ’Ã‚Â¥Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã‚Â¾', NULL),
('M_ES', 'MND', 'ÃƒÆ’Ã…â€™Ãƒâ€šÃ‚Â½ÃƒÆ’Ã¢â‚¬Â¹ÃƒÆ’Ã‚Â·ÃƒÆ’Ã¢â‚¬Â¢Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚ÂµÃƒÆ’Ã‚Â£', NULL),
('M_SPM', 'MND', 'ÃƒÆ’Ã¢â‚¬Â¢Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚ÂµÃƒÆ’Ã‚Â£ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â³ÃƒÆ’Ã†â€™ÃƒÆ’Ã‚Â¦Master', NULL),
('M_PRTMAN', 'MND', 'ÃƒÆ’Ã‹â€ ÃƒÆ’Ã‚Â«Ãƒâ€šÃ‚Â¿ÃƒÆ’Ã…Â¡Ãƒâ€šÃ‚Â¹ÃƒÆ’Ã…â€œÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã‚Â­ÃƒÆ’Ã¢â‚¬Â ÃƒÆ’Ã‚Â·', NULL),
('M_MYPRT', 'MND', 'ÃƒÆ’Ã…Â½ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã‹â€ ÃƒÆ’Ã‚Â«Ãƒâ€šÃ‚Â¿ÃƒÆ’Ã…Â¡', NULL),
('M_MYPROFILE', 'MND', 'ÃƒÆ’Ã…Â½ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â´Ãƒâ€šÃ‚Â«ÃƒÆ’Ã¢â‚¬Å¡ÃƒÆ’Ã¢â‚¬Â?', NULL),
('M_LOGOUT', 'MND', 'Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Â¡Ãƒâ€šÃ‚Â³ÃƒÆ’Ã‚Â¶', NULL),
('M_CLB', 'MND', 'Ãƒâ€šÃ‚Â´ÃƒÆ’Ã‹Å“ÃƒÆ’Ã‚Â¤Ãƒâ€šÃ‚Â¯ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã¢â‚¬Â ÃƒÆ’Ã‚Â·', NULL),
('M_CLTB', 'MND', 'Ãƒâ€šÃ‚Â´ÃƒÆ’Ã‹Å“ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â£Ãƒâ€šÃ‚Â°ÃƒÆ’Ã‚Â¥ÃƒÆ’Ã‚Â¤Ãƒâ€šÃ‚Â¯ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã¢â‚¬Â ÃƒÆ’Ã‚Â·', NULL),
('M_UMAN', 'MND', 'ÃƒÆ’Ã¢â‚¬Å“ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â§Ãƒâ€šÃ‚Â¹ÃƒÆ’Ã…â€œÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã‚Â­', NULL),
('M_VAR', 'MND', 'Ãƒâ€šÃ‚Â±ÃƒÆ’Ã‚Â¤ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â¿', NULL),
('M_PURGE', 'MND', 'Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â¯ÃƒÆ’Ã…Â ÃƒÆ’Ã‚Â½Ãƒâ€šÃ‚Â¾ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â¿ÃƒÆ’Ã‚Â¢', NULL),
('M_PGN', 'MND', 'Ãƒâ€šÃ‚Â²ÃƒÆ’Ã‚Â¥Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã‚Â¾Ãƒâ€šÃ‚Â¿ÃƒÆ’Ã‹Å“ÃƒÆ’Ã¢â‚¬â€œÃƒÆ’Ã¢â‚¬Â ', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES 
('CLT_NEW', 'MND', 'ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â´ÃƒÆ’Ã‹Å“ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â£Ãƒâ€šÃ‚Â°ÃƒÆ’Ã‚Â¥', NULL),
('CLT_BROWSE', 'MND', 'ÃƒÆ’Ã‚Â¤Ãƒâ€šÃ‚Â¯ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã¢â€šÂ¬Ãƒâ€šÃ‚Â´ÃƒÆ’Ã‹Å“ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â£Ãƒâ€šÃ‚Â°ÃƒÆ’Ã‚Â¥', NULL),
('CLT_NAME', 'MND', 'Ãƒâ€šÃ‚Â´ÃƒÆ’Ã‹Å“ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â£Ãƒâ€šÃ‚Â°ÃƒÆ’Ã‚Â¥ÃƒÆ’Ã†â€™ÃƒÆ’Ã‚Â»Ãƒâ€šÃ‚Â³ÃƒÆ’Ã¢â‚¬Â ', NULL),
('CLT_PROPERTIES', 'MND', 'Ãƒâ€šÃ‚Â´ÃƒÆ’Ã‹Å“ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â£Ãƒâ€šÃ‚Â°ÃƒÆ’Ã‚Â¥ÃƒÆ’Ã…Â ÃƒÆ’Ã‚Â´ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬Â?', NULL),
('CLT_DELETE', 'MND', 'ÃƒÆ’Ã¢â‚¬Â°Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚Â³ÃƒÆ’Ã‚Â½Ãƒâ€šÃ‚Â´ÃƒÆ’Ã‹Å“ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â£Ãƒâ€šÃ‚Â°ÃƒÆ’Ã‚Â¥', NULL),
('CLT_DELMES', 'MND', 'ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã‚ÂºÃƒÆ’Ã¢â‚¬Â¢ÃƒÆ’Ã‚Â½ÃƒÆ’Ã¢â‚¬â€?Ãƒâ€šÃ‚Â¼Ãƒâ€šÃ‚Â±Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã¢â‚¬Â°Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚Â³ÃƒÆ’Ã‚Â½ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â¶Ãƒâ€šÃ‚Â´ÃƒÆ’Ã‹Å“ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â£Ãƒâ€šÃ‚Â°ÃƒÆ’Ã‚Â¥. ÃƒÆ’Ã¢â‚¬Â¢ÃƒÆ’Ã‚Â¢Ãƒâ€šÃ‚Â»ÃƒÆ’Ã‚Â¡Ãƒâ€šÃ‚ÂµÃƒâ€šÃ‚Â¼ÃƒÆ’Ã¢â‚¬â€œÃƒÆ’Ã¢â‚¬Å¡ÃƒÆ’Ã¢â‚¬Â?ÃƒÆ’Ã…Â¡ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã¢â‚¬Â¡Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â¶Ãƒâ€šÃ‚Â´ÃƒÆ’Ã‹Å“ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â£Ãƒâ€šÃ‚Â°ÃƒÆ’Ã‚Â¥ÃƒÆ’Ã¢â‚¬Â°ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â´Ãƒâ€šÃ‚Â´Ãƒâ€šÃ‚Â½Ãƒâ€šÃ‚Â¨Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã¢â‚¬Â¹ÃƒÆ’Ã‚Â¹ÃƒÆ’Ã¢â‚¬Å“ÃƒÆ’Ã‚Â?(!)ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã…Â¡ÃƒÆ’Ã‹â€ ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â¶Ãƒâ€šÃ‚ÂªÃƒÆ’Ã…Â Ãƒâ€šÃ‚Â§. ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã‚ÂºÃƒÆ’Ã‹â€ Ãƒâ€šÃ‚Â·Ãƒâ€šÃ‚Â¶Ãƒâ€šÃ‚Â¨ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚ÂªÃƒâ€šÃ‚Â¼ÃƒÆ’Ã…â€™ÃƒÆ’Ã‚Â?ÃƒÆ’Ã‚Â¸ÃƒÆ’Ã¢â‚¬Å¡ÃƒÆ’Ã‚Â°?', NULL),
('CLTI_DELETE', 'MND', 'ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã‚ÂºÃƒÆ’Ã…Â ÃƒÆ’Ã¢â‚¬Â¡Ãƒâ€šÃ‚Â·ÃƒÆ’Ã‚Â±ÃƒÆ’Ã¢â‚¬Â¢ÃƒÆ’Ã‚Â¦ÃƒÆ’Ã‚Â?ÃƒÆ’Ã‚Â«ÃƒÆ’Ã¢â‚¬Â°Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚Â³ÃƒÆ’Ã‚Â½ÃƒÆ’Ã¢â‚¬Â¢ÃƒÆ’Ã‚Â¢Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â¶ÃƒÆ’Ã…â€™ÃƒÆ’Ã‚ÂµÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â¿. ÃƒÆ’Ã¢â‚¬Â¢ÃƒÆ’Ã‚Â¢Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â¶ÃƒÆ’Ã…â€™ÃƒÆ’Ã‚ÂµÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â¿Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã¢â‚¬Â¹ÃƒÆ’Ã‚Â¹ÃƒÆ’Ã¢â‚¬Å“ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã‚Â½Ãƒâ€šÃ‚Â³ÃƒÆ’Ã…â€™ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â²Ãƒâ€šÃ‚Â»ÃƒÆ’Ã‚Â¡Ãƒâ€šÃ‚Â¶Ãƒâ€šÃ‚ÂªÃƒÆ’Ã…Â Ãƒâ€šÃ‚Â§!', NULL),
('CLT_SCHEME', 'MND', 'Ãƒâ€šÃ‚Â±ÃƒÆ’Ã‚Â Ãƒâ€šÃ‚Â¼Ãƒâ€šÃ‚Â­Ãƒâ€šÃ‚Â´ÃƒÆ’Ã‹Å“ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â£Ãƒâ€šÃ‚Â°ÃƒÆ’Ã‚Â¥Ãƒâ€šÃ‚Â·Ãƒâ€šÃ‚Â½Ãƒâ€šÃ‚Â°Ãƒâ€šÃ‚Â¸', NULL),
('CLT_MINCARD', 'MND', 'ÃƒÆ’Ã¢â‚¬â€?ÃƒÆ’Ã‚Â®ÃƒÆ’Ã¢â‚¬Â°ÃƒÆ’Ã¢â€žÂ¢ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã‚Â½Ãƒâ€šÃ‚Â³ÃƒÆ’Ã…â€™ÃƒÆ’Ã…Â ÃƒÆ’Ã‚Â½', NULL),
('CLT_MAXCARD', 'MND', 'ÃƒÆ’Ã¢â‚¬â€?ÃƒÆ’Ã‚Â®Ãƒâ€šÃ‚Â´ÃƒÆ’Ã‚Â³ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã‚Â½Ãƒâ€šÃ‚Â³ÃƒÆ’Ã…â€™ÃƒÆ’Ã…Â ÃƒÆ’Ã‚Â½', NULL),
('LINKED', 'MND', 'Ãƒâ€šÃ‚Â¹ÃƒÆ’Ã‹Å“ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚ÂªÃƒÆ’Ã¢â‚¬â€œÃƒÆ’Ã‚Â?', NULL),
('PG_INSTALLDESC', 'MND', 'ÃƒÆ’Ã¢â‚¬Â¡ÃƒÆ’Ã‚Â«ÃƒÆ’Ã‹â€ Ãƒâ€šÃ‚Â·Ãƒâ€šÃ‚Â¶Ãƒâ€šÃ‚Â¨ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã‚ÂºÃƒÆ’Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬ËœÃƒâ€šÃ‚Â½Ãƒâ€šÃ‚Â«ÃƒÆ’Ã¢â‚¬Â¹ÃƒÆ’Ã‚Â¹ÃƒÆ’Ã¢â‚¬Å“ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â±ÃƒÆ’Ã‹Å“ÃƒÆ’Ã‚Â?ÃƒÆ’Ã‚Â¨Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã…Â½ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã‚Â¾Ãƒâ€šÃ‚Â¸Ãƒâ€šÃ‚Â´ÃƒÆ’Ã¢â‚¬â€œÃƒÆ’Ã¢â‚¬Â Ãƒâ€šÃ‚ÂµÃƒâ€šÃ‚Â½ÃƒÆ’Ã¢â‚¬Â¢ÃƒÆ’Ã‚Â¢Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â¶ÃƒÆ’Ã…Â½ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã‚Â¾Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â£Ãƒâ€šÃ‚Â¬Ãƒâ€šÃ‚Â·ÃƒÆ’Ã‚Â±ÃƒÆ’Ã¢â‚¬Â?ÃƒÆ’Ã‚Â²Ãƒâ€šÃ‚Â²Ãƒâ€šÃ‚Â»ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã…â€œÃƒâ€šÃ‚Â³ÃƒÆ’Ã¢â‚¬Â°Ãƒâ€šÃ‚Â¹Ãƒâ€šÃ‚Â¦. ÃƒÆ’Ã¢â‚¬Â?ÃƒÆ’Ã…Â¡ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬Å¡ÃƒÆ’Ã†â€™ÃƒÆ’Ã‚Â¦Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã…Â ÃƒÆ’Ã‚Â¤ÃƒÆ’Ã‹â€ ÃƒÆ’Ã‚Â«Ãƒâ€šÃ‚Â¿ÃƒÆ’Ã‚Â²ÃƒÆ’Ã¢â‚¬â€œÃƒÆ’Ã‚Â?ÃƒÆ’Ã…Â ÃƒÆ’Ã‚Â¤ÃƒÆ’Ã‹â€ ÃƒÆ’Ã‚Â«Ãƒâ€šÃ‚Â²ÃƒÆ’Ã‚Â¥Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã‚Â¾Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã¢â‚¬Â¢ÃƒÆ’Ã‚Â½ÃƒÆ’Ã‹â€ Ãƒâ€šÃ‚Â·ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â·Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚Â¶. ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚ÂµÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â³Ãƒâ€šÃ‚Â¼Ãƒâ€šÃ‚Â´Ãƒâ€šÃ‚Â»ÃƒÆ’Ã‚Â¡ÃƒÆ’Ã¢â‚¬â€?ÃƒÆ’Ã¢â‚¬Â?Ãƒâ€šÃ‚Â¶Ãƒâ€šÃ‚Â¯Ãƒâ€šÃ‚Â°Ãƒâ€šÃ‚Â²ÃƒÆ’Ã¢â‚¬â€?Ãƒâ€šÃ‚Â°Ãƒâ€šÃ‚Â²ÃƒÆ’Ã‚Â¥Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã‚Â¾.', NULL),
('PG_CHOOSE', 'MND', 'Ãƒâ€šÃ‚Â²ÃƒÆ’Ã‚Â¥Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã‚Â¾: &nbsp; /plugin/', NULL),
('PG_FILEWRONG', 'MND', 'ÃƒÆ’Ã¢â‚¬Â?ÃƒÆ’Ã…Â¡Ãƒâ€šÃ‚Â·ÃƒÆ’Ã‚Â¾ÃƒÆ’Ã…Â½ÃƒÆ’Ã‚Â±ÃƒÆ’Ã¢â‚¬Â ÃƒÆ’Ã‚Â·ÃƒÆ’Ã¢â‚¬Â°ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬Â¢ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â²Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚ÂµÃƒâ€šÃ‚Â½ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã‚ÂºÃƒÆ’Ã…Â ÃƒÆ’Ã‚Â¤ÃƒÆ’Ã‹â€ ÃƒÆ’Ã‚Â«Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã…Â½ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã‚Â¾ÃƒÆ’Ã†â€™ÃƒÆ’Ã‚Â»!', NULL),
('CLASS_WRONG', 'MND', 'ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã‚ÂºÃƒÆ’Ã¢â‚¬â€œÃƒâ€šÃ‚Â¸Ãƒâ€šÃ‚Â¶Ãƒâ€šÃ‚Â¨Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã…Â½ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã‚Â¾ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â»ÃƒÆ’Ã¢â‚¬Å“ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚ÂºÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â·Ãƒâ€šÃ‚Â¨Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã‚Â ÃƒÆ’Ã‚Â?ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬Â¡Ãƒâ€šÃ‚Â©ÃƒÆ’Ã†â€™ÃƒÆ’Ã‚Â»!', NULL),
('PG_INSTALLED', 'MND', 'Ãƒâ€šÃ‚Â³ÃƒÆ’Ã¢â‚¬Â°Ãƒâ€šÃ‚Â¹Ãƒâ€šÃ‚Â¦Ãƒâ€šÃ‚Â°Ãƒâ€šÃ‚Â²ÃƒÆ’Ã¢â‚¬â€?Ãƒâ€šÃ‚Â°Ãƒâ€šÃ‚Â²ÃƒÆ’Ã‚Â¥Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã‚Â¾!', NULL),
('PG_UPGRADED', 'MND', 'Ãƒâ€šÃ‚Â³ÃƒÆ’Ã¢â‚¬Â°Ãƒâ€šÃ‚Â¹Ãƒâ€šÃ‚Â¦ÃƒÆ’Ã¢â‚¬Â°ÃƒÆ’Ã‚Â½Ãƒâ€šÃ‚Â¼Ãƒâ€šÃ‚Â¶Ãƒâ€šÃ‚Â²ÃƒÆ’Ã‚Â¥Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã‚Â¾!', NULL),
('PG_ERROR', 'MND', 'Ãƒâ€šÃ‚Â°Ãƒâ€šÃ‚Â²ÃƒÆ’Ã¢â‚¬â€?Ãƒâ€šÃ‚Â°Ãƒâ€šÃ‚Â²ÃƒÆ’Ã‚Â¥Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã‚Â¾ÃƒÆ’Ã…Â Ãƒâ€šÃ‚Â±ÃƒÆ’Ã¢â‚¬Å“ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â´ÃƒÆ’Ã‚Â­ÃƒÆ’Ã…Â½ÃƒÆ’Ã‚Â³!', NULL),
('PG_ALREADYINSTAL', 'MND', 'Ãƒâ€šÃ‚Â²ÃƒÆ’Ã‚Â¥Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã‚Â¾ÃƒÆ’Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬ËœÃƒâ€šÃ‚Â±Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â°Ãƒâ€šÃ‚Â²ÃƒÆ’Ã¢â‚¬â€?Ãƒâ€šÃ‚Â°!', NULL),
('PG_NEWERINSTALLE', 'MND', 'ÃƒÆ’Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬ËœÃƒâ€šÃ‚Â¾Ãƒâ€šÃ‚Â­Ãƒâ€šÃ‚Â°Ãƒâ€šÃ‚Â²ÃƒÆ’Ã¢â‚¬â€?Ãƒâ€šÃ‚Â°ÃƒÆ’Ã¢â‚¬Å“ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬Â¢ÃƒÆ’Ã‚Â¢Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â¶Ãƒâ€šÃ‚Â²ÃƒÆ’Ã‚Â¥Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã‚Â¾Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â°ÃƒÆ’Ã‚Â¦Ãƒâ€šÃ‚Â±Ãƒâ€šÃ‚Â¾!', NULL),
('PG_TITLE', 'MND', 'Ãƒâ€šÃ‚Â²ÃƒÆ’Ã‚Â¥Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã‚Â¾', NULL),
('PG_INSTALL', 'MND', 'Ãƒâ€šÃ‚Â°Ãƒâ€šÃ‚Â²ÃƒÆ’Ã¢â‚¬â€?Ãƒâ€šÃ‚Â°Ãƒâ€šÃ‚Â²ÃƒÆ’Ã‚Â¥Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã‚Â¾', NULL),
('PG_UNINSTALL', 'MND', 'ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â¶ÃƒÆ’Ã¢â‚¬Â?ÃƒÆ’Ã‹Å“Ãƒâ€šÃ‚Â²ÃƒÆ’Ã‚Â¥Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã‚Â¾', NULL),
('PG_UNINSTALLMES', 'MND', 'ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã‚ÂºÃƒÆ’Ã¢â‚¬Â¢ÃƒÆ’Ã‚Â½ÃƒÆ’Ã¢â‚¬â€?Ãƒâ€šÃ‚Â¼Ãƒâ€šÃ‚Â±Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â¶ÃƒÆ’Ã¢â‚¬Â?ÃƒÆ’Ã‹Å“ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â¶ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â£Ãƒâ€šÃ‚Â¿ÃƒÆ’Ã‚Â©. ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â¶ÃƒÆ’Ã¢â‚¬Â?ÃƒÆ’Ã‹Å“ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â¶ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â£Ãƒâ€šÃ‚Â¿ÃƒÆ’Ã‚Â©Ãƒâ€šÃ‚Â²Ãƒâ€šÃ‚Â»ÃƒÆ’Ã¢â‚¬â€œÃƒâ€šÃ‚Â»ÃƒÆ’Ã¢â‚¬Â°Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚Â³ÃƒÆ’Ã‚Â½ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã…Â¡ÃƒÆ’Ã‹â€ ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã‚Â ÃƒÆ’Ã‚Â?ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â£Ãƒâ€šÃ‚Â¬ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â¬ÃƒÆ’Ã…Â Ãƒâ€šÃ‚Â±ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â²ÃƒÆ’Ã¢â‚¬Â°Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚Â³ÃƒÆ’Ã‚Â½ÃƒÆ’Ã¢â‚¬Â¢ÃƒÆ’Ã‚Â¢Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â¶ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã‚Â ÃƒÆ’Ã‚Â?ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â´Ãƒâ€šÃ‚Â¢Ãƒâ€šÃ‚Â´ÃƒÆ’Ã‚Â¦ÃƒÆ’Ã¢â‚¬Â?ÃƒÆ’Ã…Â¡ÃƒÆ’Ã…Â ÃƒÆ’Ã‚Â½Ãƒâ€šÃ‚Â¾ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â¿ÃƒÆ’Ã‚Â¢ÃƒÆ’Ã¢â‚¬â€œÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¿Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â¶Ãƒâ€šÃ‚ÂµÃƒâ€šÃ‚Â¥Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â¶ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â¿Ãƒâ€šÃ‚Â±ÃƒÆ’Ã‚Âª. ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â¶ÃƒÆ’Ã¢â‚¬Â?ÃƒÆ’Ã‹Å“Ãƒâ€šÃ‚Â½Ãƒâ€šÃ‚Â«Ãƒâ€šÃ‚Â»ÃƒÆ’Ã‚Â¡Ãƒâ€šÃ‚Â¿ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â¶Ãƒâ€šÃ‚Â¨ÃƒÆ’Ã¢â‚¬Â°Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚Â³ÃƒÆ’Ã‚Â½ÃƒÆ’Ã¢â‚¬Â¢ÃƒÆ’Ã‚Â¢Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â¶ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â£Ãƒâ€šÃ‚Â¿ÃƒÆ’Ã‚Â©Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã¢â‚¬Â¹ÃƒÆ’Ã‚Â¹ÃƒÆ’Ã¢â‚¬Å“ÃƒÆ’Ã‚Â?(!)ÃƒÆ’Ã…Â ÃƒÆ’Ã‚Â½Ãƒâ€šÃ‚Â¾ÃƒÆ’Ã‚Â?!', NULL),
('PG_UNINSTALLDELE', 'MND', 'ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â¶ÃƒÆ’Ã¢â‚¬Â?ÃƒÆ’Ã‹Å“ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â£Ãƒâ€šÃ‚Â¿ÃƒÆ’Ã‚Â©,<br> ÃƒÆ’Ã¢â‚¬Â°Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚Â³ÃƒÆ’Ã‚Â½ÃƒÆ’Ã¢â‚¬Â¹ÃƒÆ’Ã‚Â¹ÃƒÆ’Ã¢â‚¬Å“ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â¶ÃƒÆ’Ã¢â‚¬Â?ÃƒÆ’Ã¢â‚¬Å“Ãƒâ€šÃ‚Â¦Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã…Â¡ÃƒÆ’Ã‹â€ ÃƒÆ’Ã‚Â?.', NULL),
('O_NEW', 'MND', 'ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬Å¡ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â¿Ãƒâ€šÃ‚Â±ÃƒÆ’Ã‚Âª', NULL),
('O_NAME', 'MND', 'ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â¿Ãƒâ€šÃ‚Â±ÃƒÆ’Ã‚ÂªÃƒÆ’Ã†â€™ÃƒÆ’Ã‚Â»Ãƒâ€šÃ‚Â³ÃƒÆ’Ã¢â‚¬Â ', NULL),
('O_PROPERTIES', 'MND', 'ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â¿Ãƒâ€šÃ‚Â±ÃƒÆ’Ã‚ÂªÃƒÆ’Ã…Â ÃƒÆ’Ã‚Â´ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬Â?', NULL),
('O_DELMES', 'MND', 'ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã‚ÂºÃƒÆ’Ã¢â‚¬Â¢ÃƒÆ’Ã‚Â½ÃƒÆ’Ã¢â‚¬â€?Ãƒâ€šÃ‚Â¼Ãƒâ€šÃ‚Â±Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã¢â‚¬Â°Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚Â³ÃƒÆ’Ã‚Â½ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â¶ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â¿Ãƒâ€šÃ‚Â±ÃƒÆ’Ã‚Âª. <b>ÃƒÆ’Ã¢â‚¬â€?Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã¢â‚¬â„¢ÃƒÆ’Ã‚Â¢Ãƒâ€šÃ‚Â»ÃƒÆ’Ã‚Â¡Ãƒâ€šÃ‚Â¶Ãƒâ€šÃ‚ÂªÃƒÆ’Ã…Â Ãƒâ€šÃ‚Â§ÃƒÆ’Ã¢â‚¬Â¹ÃƒÆ’Ã‚Â¹ÃƒÆ’Ã¢â‚¬Å“ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â±ÃƒÆ’Ã‚Â¤ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â¿ÃƒÆ’Ã¢â‚¬Å“ÃƒÆ’Ã‚Â«META-DATA!</b>', NULL),
('O_DEL', 'MND', 'ÃƒÆ’Ã¢â‚¬Â°Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚Â³ÃƒÆ’Ã‚Â½ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â¿Ãƒâ€šÃ‚Â±ÃƒÆ’Ã‚Âª', NULL),
('O_EDIT', 'MND', 'Ãƒâ€šÃ‚Â±ÃƒÆ’Ã‚Â Ãƒâ€šÃ‚Â¼Ãƒâ€šÃ‚Â­ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â¿Ãƒâ€šÃ‚Â±ÃƒÆ’Ã‚Âª', NULL),
('O_PREVIEW', 'MND', 'ÃƒÆ’Ã¢â‚¬Â?Ãƒâ€šÃ‚Â¤ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã¢â€šÂ¬', NULL),
('O_TEXT', 'MND', 'ÃƒÆ’Ã…Â½ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â±Ãƒâ€šÃ‚Â¾', NULL),
('O_ALT', 'MND', 'ALT-Tag', NULL),
('O_COPYRIGHT', 'MND', 'Ãƒâ€šÃ‚Â°ÃƒÆ’Ã‚Â¦ÃƒÆ’Ã‹â€ Ãƒâ€šÃ‚Â¨', NULL),
('O_BROWSE', 'MND', 'ÃƒÆ’Ã‚Â¤Ãƒâ€šÃ‚Â¯ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â¿Ãƒâ€šÃ‚Â±ÃƒÆ’Ã‚Âª', NULL),
('R_HOME', 'MND', 'Ãƒâ€šÃ‚Â¿Ãƒâ€šÃ‚ÂªÃƒÆ’Ã…Â Ãƒâ€šÃ‚Â¼', NULL),
('R_NEWFOLDER', 'MND', 'ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬Å¡ÃƒÆ’Ã…Â½ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã‚Â¾Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã‚Â?', NULL),
('R_EDITFOLDER', 'MND', 'Ãƒâ€šÃ‚Â±ÃƒÆ’Ã‚Â Ãƒâ€šÃ‚Â¼Ãƒâ€šÃ‚Â­ÃƒÆ’Ã…Â½ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã‚Â¾Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã‚Â?ÃƒÆ’Ã…Â ÃƒÆ’Ã‚Â´ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬Â?', NULL),
('R_FOLDERNAME', 'MND', 'ÃƒÆ’Ã…Â½ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã‚Â¾Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã‚Â?ÃƒÆ’Ã†â€™ÃƒÆ’Ã‚Â»', NULL),
('R_DELETEFOLDER', 'MND', 'ÃƒÆ’Ã¢â‚¬Â°Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚Â³ÃƒÆ’Ã‚Â½ÃƒÆ’Ã…Â½ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã‚Â¾Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã‚Â?', NULL),
('R_DELFOLDERMES', 'MND', 'ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã‚ÂºÃƒÆ’Ã¢â‚¬Â¢ÃƒÆ’Ã‚Â½ÃƒÆ’Ã¢â‚¬â€?Ãƒâ€šÃ‚Â¼Ãƒâ€šÃ‚Â±Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã¢â‚¬Â°Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚Â³ÃƒÆ’Ã‚Â½ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â¶ÃƒÆ’Ã…Â½ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã‚Â¾Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã‚Â?.  ÃƒÆ’Ã¢â‚¬Â¡ÃƒÆ’Ã‚Â«ÃƒÆ’Ã¢â‚¬ËœÃƒâ€šÃ‚Â¡ÃƒÆ’Ã¢â‚¬Â?ÃƒÆ’Ã‚Â±ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â¶Ãƒâ€šÃ‚Â¶Ãƒâ€šÃ‚Â¯ÃƒÆ’Ã¢â‚¬â€?ÃƒÆ’Ã‚Â·.', NULL),
('R_FOLDERNOTEMPTY', 'MND', 'ÃƒÆ’Ã…Â½ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã‚Â¾Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â²Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â¿ÃƒÆ’Ã¢â‚¬Â¢. ÃƒÆ’Ã¢â‚¬â„¢ÃƒÆ’Ã‚Â²Ãƒâ€šÃ‚Â´ÃƒÆ’Ã¢â‚¬Â¹ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã‚ÂºÃƒâ€šÃ‚Â²Ãƒâ€šÃ‚Â»ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã…â€œÃƒÆ’Ã¢â‚¬Â°Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚Â³ÃƒÆ’Ã‚Â½ÃƒÆ’Ã¢â‚¬Â¹ÃƒÆ’Ã‚Â¼! ÃƒÆ’Ã¢â‚¬Â¡ÃƒÆ’Ã‚Â«Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã‚Â¬Ãƒâ€šÃ‚Â²ÃƒÆ’Ã‚Â©ÃƒÆ’Ã¢â‚¬Â¹ÃƒÆ’Ã‚Â¹ÃƒÆ’Ã¢â‚¬Å“ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â¿Ãƒâ€šÃ‚Â±ÃƒÆ’Ã‚ÂªÃƒÆ’Ã¢â‚¬Å“ÃƒÆ’Ã‚Â«Ãƒâ€šÃ‚Â´ÃƒÆ’Ã‹Å“!', NULL),
('R_DELFOLDER', 'MND', 'ÃƒÆ’Ã¢â‚¬Â°Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚Â³ÃƒÆ’Ã‚Â½ÃƒÆ’Ã…Â½ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã‚Â¾Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬Å“ÃƒÆ’Ã‚Â«ÃƒÆ’Ã¢â‚¬Â¹ÃƒÆ’Ã‚Â¹ÃƒÆ’Ã¢â‚¬Å“ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬â€?ÃƒÆ’Ã¢â‚¬Å“ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â¿Ãƒâ€šÃ‚Â±ÃƒÆ’Ã‚Âª', NULL),
('R_MOVEOBJECTS', 'MND', 'Ãƒâ€šÃ‚Â½Ãƒâ€šÃ‚Â«ÃƒÆ’Ã¢â‚¬Â¹ÃƒÆ’Ã‚Â¹ÃƒÆ’Ã¢â‚¬Å“ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â¿Ãƒâ€šÃ‚Â±ÃƒÆ’Ã‚ÂªÃƒÆ’Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬Â ÃƒÆ’Ã¢â‚¬â€œÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â¸Ãƒâ€šÃ‚Â¸Ãƒâ€šÃ‚Â½ÃƒÆ’Ã‚Â¡Ãƒâ€šÃ‚ÂµÃƒÆ’Ã‚Â£', NULL),
('R_PARENT', 'MND', 'Ãƒâ€šÃ‚Â¸Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã…Â½ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã‚Â¾Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã‚Â?', NULL),
('METATEMPLATES', 'MND', 'MetaÃƒÆ’Ã…Â ÃƒÆ’Ã‚Â½Ãƒâ€šÃ‚Â¾ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â£Ãƒâ€šÃ‚Â°ÃƒÆ’Ã‚Â¥', NULL),
('MT_PROPERTIES', 'MND', 'Ãƒâ€šÃ‚Â±ÃƒÆ’Ã‚Â Ãƒâ€šÃ‚Â¼Ãƒâ€šÃ‚Â­MetaÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â£Ãƒâ€šÃ‚Â°ÃƒÆ’Ã‚Â¥ÃƒÆ’Ã…Â ÃƒÆ’Ã‚Â´ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬Â?', NULL),
('MT_SCHEME', 'MND', 'Ãƒâ€šÃ‚Â±ÃƒÆ’Ã‚Â Ãƒâ€šÃ‚Â¼Ãƒâ€šÃ‚Â­MetaÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â£Ãƒâ€šÃ‚Â°ÃƒÆ’Ã‚Â¥Ãƒâ€šÃ‚Â·Ãƒâ€šÃ‚Â½Ãƒâ€šÃ‚Â°Ãƒâ€šÃ‚Â¸', NULL),
('MT_DELETE', 'MND', 'ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã‚ÂºÃƒÆ’Ã…Â ÃƒÆ’Ã¢â‚¬Â¡Ãƒâ€šÃ‚Â·ÃƒÆ’Ã‚Â±ÃƒÆ’Ã¢â‚¬Â¢ÃƒÆ’Ã‚Â¦ÃƒÆ’Ã‚Â?ÃƒÆ’Ã‚Â«ÃƒÆ’Ã¢â‚¬Â°Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚Â³ÃƒÆ’Ã‚Â½metaÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â£Ãƒâ€šÃ‚Â°ÃƒÆ’Ã‚Â¥Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã¢â‚¬Â¢ÃƒÆ’Ã‚Â¢Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â¶Ãƒâ€šÃ‚Â²Ãƒâ€šÃ‚Â¿Ãƒâ€šÃ‚Â·ÃƒÆ’Ã¢â‚¬â€œ? ÃƒÆ’Ã¢â‚¬Â¹ÃƒÆ’Ã‚Â¹ÃƒÆ’Ã¢â‚¬Å“ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â¹ÃƒÆ’Ã‹Å“ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚ÂªÃƒâ€šÃ‚ÂµÃƒâ€šÃ‚Â½ÃƒÆ’Ã¢â‚¬Â¢ÃƒÆ’Ã‚Â¢Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â¶Ãƒâ€šÃ‚Â²Ãƒâ€šÃ‚Â¿Ãƒâ€šÃ‚Â·ÃƒÆ’Ã¢â‚¬â€œÃƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã¢â‚¬Â?ÃƒÆ’Ã…Â¡CMS METAÃƒÆ’Ã…Â ÃƒÆ’Ã‚Â¤ÃƒÆ’Ã‹â€ ÃƒÆ’Ã‚Â«ÃƒÆ’Ã¢â‚¬â€œÃƒÆ’Ã‚Â?ÃƒÆ’Ã…Â ÃƒÆ’Ã‚Â¤ÃƒÆ’Ã‹â€ ÃƒÆ’Ã‚Â«Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬Â¦ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â¢Ãƒâ€šÃ‚Â½Ãƒâ€šÃ‚Â«Ãƒâ€šÃ‚Â»ÃƒÆ’Ã‚Â¡Ãƒâ€šÃ‚Â±Ãƒâ€šÃ‚Â»ÃƒÆ’Ã¢â‚¬Â°Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚Â³ÃƒÆ’Ã‚Â½. ÃƒÆ’Ã…Â ÃƒÆ’Ã‚Â½Ãƒâ€šÃ‚Â¾ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â»ÃƒÆ’Ã‚Â¡ÃƒÆ’Ã¢â‚¬Å“ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã¢â‚¬Â?Ãƒâ€šÃ‚Â¶Ãƒâ€šÃ‚Â¶Ãƒâ€šÃ‚ÂªÃƒÆ’Ã…Â Ãƒâ€šÃ‚Â§!', NULL),
('MT_ADDITIONAL', 'MND', 'Ãƒâ€šÃ‚Â¸Ãƒâ€šÃ‚Â½Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã¢â‚¬Å“Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾METAÃƒÆ’Ã…Â ÃƒÆ’Ã‚Â½Ãƒâ€šÃ‚Â¾ÃƒÆ’Ã‚Â?', NULL),
('MT_BASE', 'MND', 'Ãƒâ€šÃ‚Â»ÃƒÆ’Ã‚Â¹Ãƒâ€šÃ‚Â±Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾METAÃƒÆ’Ã…Â ÃƒÆ’Ã‚Â½Ãƒâ€šÃ‚Â¾ÃƒÆ’Ã‚Â?', NULL),
('MT_MODULE', 'MND', 'ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã…Â¡ÃƒÆ’Ã‹â€ ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã‚Â ÃƒÆ’Ã‚Â?ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬â€œÃƒâ€šÃ‚Â¸Ãƒâ€šÃ‚Â¶Ãƒâ€šÃ‚Â¨Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾METAÃƒÆ’Ã…Â ÃƒÆ’Ã‚Â½Ãƒâ€šÃ‚Â¾ÃƒÆ’Ã‚Â?', NULL),
('VARIATIONS', 'MND', 'Ãƒâ€šÃ‚Â¿ÃƒÆ’Ã¢â‚¬Â°ÃƒÆ’Ã¢â‚¬Å“ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â±ÃƒÆ’Ã‚Â¤ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â¿', NULL),
('V_NAME', 'MND', 'ÃƒÆ’Ã†â€™ÃƒÆ’Ã‚Â»Ãƒâ€šÃ‚Â³ÃƒÆ’Ã¢â‚¬Â ', NULL),
('V_SHORT', 'MND', 'Short-Tag', NULL),
('V_EDIT', 'MND', 'Ãƒâ€šÃ‚Â±ÃƒÆ’Ã‚Â Ãƒâ€šÃ‚Â¼Ãƒâ€šÃ‚Â­Ãƒâ€šÃ‚Â±ÃƒÆ’Ã‚Â¤ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â¿', NULL),
('LOGIN_FAILED', 'MND', 'ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã‚ÂºÃƒÆ’Ã…Â ÃƒÆ’Ã‚Â¤ÃƒÆ’Ã‹â€ ÃƒÆ’Ã‚Â«Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Â¡ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã…Â ÃƒÆ’Ã‚Â½Ãƒâ€šÃ‚Â¾ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â²Ãƒâ€šÃ‚Â»ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã…â€œÃƒâ€šÃ‚Â±Ãƒâ€šÃ‚Â»ÃƒÆ’Ã¢â‚¬ËœÃƒÆ’Ã‚Â©ÃƒÆ’Ã¢â‚¬â€œÃƒâ€šÃ‚Â¤! ÃƒÆ’Ã¢â‚¬Â¡ÃƒÆ’Ã‚Â«ÃƒÆ’Ã¢â‚¬Â?ÃƒÆ’Ã¢â€žÂ¢ÃƒÆ’Ã…Â ÃƒÆ’Ã¢â‚¬Â?ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â±ÃƒÆ’Ã‚Â©.', NULL),
('USER_HEAD', 'MND', 'ÃƒÆ’Ã¢â‚¬Å“ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â§Ãƒâ€šÃ‚Â´Ãƒâ€šÃ‚Â«ÃƒÆ’Ã¢â‚¬Å¡ÃƒÆ’Ã¢â‚¬Â?', NULL),
('USER_LINK', 'MND', 'ÃƒÆ’Ã¢â‚¬Å“ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â§Ãƒâ€šÃ‚Â´Ãƒâ€šÃ‚Â«ÃƒÆ’Ã¢â‚¬Å¡ÃƒÆ’Ã¢â‚¬Â?', NULL),
('USER_NAME', 'MND', 'ÃƒÆ’Ã¢â‚¬Å“ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â§ÃƒÆ’Ã†â€™ÃƒÆ’Ã‚Â»', NULL),
('FULL_NAME', 'MND', 'ÃƒÆ’Ã‹â€ Ãƒâ€šÃ‚Â«ÃƒÆ’Ã†â€™ÃƒÆ’Ã‚Â»', NULL),
('PASSWORD', 'MND', 'ÃƒÆ’Ã†â€™ÃƒÆ’Ã…â€œÃƒÆ’Ã¢â‚¬Å¡ÃƒÆ’Ã‚Â«', NULL),
('USER_EMAIL', 'MND', 'eMail', NULL),
('USER_ACTIVE', 'MND', 'ÃƒÆ’Ã…Â Ãƒâ€šÃ‚Â¹ÃƒÆ’Ã¢â‚¬Â¢ÃƒÆ’Ã…Â Ãƒâ€šÃ‚ÂºÃƒÆ’Ã¢â‚¬Â¦Ãƒâ€šÃ‚Â¿ÃƒÆ’Ã¢â‚¬Â°ÃƒÆ’Ã¢â‚¬Å“ÃƒÆ’Ã†â€™', NULL),
('USER_FILTERMENU', 'MND', 'ÃƒÆ’Ã¢â‚¬Å“ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â§Ãƒâ€šÃ‚Â¹ÃƒÆ’Ã…â€œÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã‚Â­', NULL),
('USER_SETPERM', 'MND', 'ÃƒÆ’Ã¢â‚¬Â?ÃƒÆ’Ã…Â¡ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬Å¡ÃƒÆ’Ã†â€™ÃƒÆ’Ã‚Â¦ÃƒÆ’Ã¢â‚¬Â°ÃƒÆ’Ã‚Â¨ÃƒÆ’Ã¢â‚¬â€œÃƒÆ’Ã†â€™ÃƒÆ’Ã¢â‚¬Å“ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â§ÃƒÆ’Ã‹â€ Ãƒâ€šÃ‚Â¨ÃƒÆ’Ã‚Â?ÃƒÆ’Ã…Â¾. ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚ÂªÃƒâ€šÃ‚Â´ÃƒÆ’Ã¢â‚¬Å“ÃƒÆ’Ã¢â‚¬â€?ÃƒÆ’Ã‚Â©ÃƒÆ’Ã¢â‚¬â€œÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬Â°Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚Â³ÃƒÆ’Ã‚Â½ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â¶ÃƒÆ’Ã¢â‚¬Å“ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â§, Ãƒâ€šÃ‚Â½Ãƒâ€šÃ‚Â«ÃƒÆ’Ã¢â‚¬Â¹ÃƒÆ’Ã‚Â»Ãƒâ€šÃ‚Â´ÃƒÆ’Ã¢â‚¬Å“ÃƒÆ’Ã¢â‚¬Â¹ÃƒÆ’Ã‚Â¹ÃƒÆ’Ã¢â‚¬Å“ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã¢â‚¬â€?ÃƒÆ’Ã‚Â©ÃƒÆ’Ã¢â‚¬â€œÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â³Ãƒâ€šÃ‚Â·ÃƒÆ’Ã‚Â?ÃƒÆ’Ã‚Â»Ãƒâ€šÃ‚Â¼Ãƒâ€šÃ‚Â´Ãƒâ€šÃ‚Â¿ÃƒÆ’Ã¢â‚¬Â°.', NULL),
('USER_PERMGRID', 'MND', 'ÃƒÆ’Ã‹â€ Ãƒâ€šÃ‚Â¨ÃƒÆ’Ã‚Â?ÃƒÆ’Ã…Â¾Ãƒâ€šÃ‚Â±ÃƒÆ’Ã‚Â­', NULL),
('GROUP_LINK', 'MND', 'ÃƒÆ’Ã¢â‚¬â€?ÃƒÆ’Ã‚Â©Ãƒâ€šÃ‚Â´Ãƒâ€šÃ‚Â«ÃƒÆ’Ã¢â‚¬Å¡ÃƒÆ’Ã¢â‚¬Â?', NULL),
('GROUP_HEAD', 'MND', 'ÃƒÆ’Ã¢â‚¬â€?ÃƒÆ’Ã‚Â©Ãƒâ€šÃ‚Â´Ãƒâ€šÃ‚Â«ÃƒÆ’Ã¢â‚¬Å¡ÃƒÆ’Ã¢â‚¬Â?', NULL),
('GROUP_NAME', 'MND', 'ÃƒÆ’Ã¢â‚¬â€?ÃƒÆ’Ã‚Â©ÃƒÆ’Ã†â€™ÃƒÆ’Ã‚Â»', NULL),
('GROUP_DESCRIPTIO', 'MND', 'ÃƒÆ’Ã†â€™ÃƒÆ’Ã‚Â¨ÃƒÆ’Ã…Â ÃƒÆ’Ã‚Â¶', NULL),
('GROUP_FILTERMENU', 'MND', 'ÃƒÆ’Ã¢â‚¬â€?ÃƒÆ’Ã‚Â©Ãƒâ€šÃ‚Â¹ÃƒÆ’Ã…â€œÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã‚Â­', NULL),
('ROLE_LINK', 'MND', 'Ãƒâ€šÃ‚Â½ÃƒÆ’Ã¢â‚¬Â¡ÃƒÆ’Ã¢â‚¬Â°Ãƒâ€šÃ‚Â«Ãƒâ€šÃ‚Â´Ãƒâ€šÃ‚Â«ÃƒÆ’Ã¢â‚¬Å¡ÃƒÆ’Ã¢â‚¬Â?', NULL),
('ROLE_HEAD', 'MND', 'Ãƒâ€šÃ‚Â½ÃƒÆ’Ã¢â‚¬Â¡ÃƒÆ’Ã¢â‚¬Â°Ãƒâ€šÃ‚Â«Ãƒâ€šÃ‚Â´Ãƒâ€šÃ‚Â«ÃƒÆ’Ã¢â‚¬Å¡ÃƒÆ’Ã¢â‚¬Â?', NULL),
('ROLE_NAME', 'MND', 'Ãƒâ€šÃ‚Â½ÃƒÆ’Ã¢â‚¬Â¡ÃƒÆ’Ã¢â‚¬Â°Ãƒâ€šÃ‚Â«ÃƒÆ’Ã†â€™ÃƒÆ’Ã‚Â»e', NULL),
('ROLE_DESCRIPTION', 'MND', 'ÃƒÆ’Ã†â€™ÃƒÆ’Ã‚Â¨ÃƒÆ’Ã…Â ÃƒÆ’Ã‚Â¶', NULL),
('ROLE_FILTERMENU', 'MND', 'Ãƒâ€šÃ‚Â½ÃƒÆ’Ã¢â‚¬Â¡ÃƒÆ’Ã¢â‚¬Â°Ãƒâ€šÃ‚Â«Ãƒâ€šÃ‚Â¹ÃƒÆ’Ã…â€œÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã‚Â­', NULL),
('USER_PERMISSIONS', 'MND', 'ÃƒÆ’Ã¢â‚¬Å“ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â§ÃƒÆ’Ã‹â€ Ãƒâ€šÃ‚Â¨ÃƒÆ’Ã‚Â?ÃƒÆ’Ã…Â¾', NULL),
('UP_INTRO', 'MND', 'ÃƒÆ’Ã¢â‚¬Â¡ÃƒÆ’Ã‚Â«ÃƒÆ’Ã¢â‚¬ËœÃƒâ€šÃ‚Â¡ÃƒÆ’Ã¢â‚¬Â?ÃƒÆ’Ã‚Â±ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã‚ÂºÃƒÆ’Ã‚Â?ÃƒÆ’Ã‚Â«Ãƒâ€šÃ‚Â¸Ãƒâ€šÃ‚Â³ÃƒÆ’Ã¢â‚¬Å“ÃƒÆ’Ã‚Â¨ÃƒÆ’Ã¢â‚¬Å“ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â§Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã¢â‚¬â€?ÃƒÆ’Ã‚Â©Ãƒâ€šÃ‚Â¼Ãƒâ€šÃ‚Â°ÃƒÆ’Ã¢â‚¬Â?ÃƒÆ’Ã…Â¡ÃƒÆ’Ã¢â‚¬â€?ÃƒÆ’Ã‚Â©ÃƒÆ’Ã¢â‚¬â€œÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â½ÃƒÆ’Ã¢â‚¬Â¡ÃƒÆ’Ã¢â‚¬Â°Ãƒâ€šÃ‚Â«.', NULL),
('USER_TO_GROUP', 'MND', 'ÃƒÆ’Ã…â€™ÃƒÆ’Ã‚Â­Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã¢â‚¬Å“ÃƒÆ’Ã¢â‚¬Å“ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â§Ãƒâ€šÃ‚ÂµÃƒâ€šÃ‚Â½ÃƒÆ’Ã¢â‚¬â€?ÃƒÆ’Ã‚Â©ÃƒÆ’Ã¢â‚¬â€œÃƒÆ’Ã‚Â?', NULL),
('ERROR_SEL_GROUP', 'MND', 'ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã‚ÂºÃƒâ€šÃ‚Â±ÃƒÆ’Ã‹Å“ÃƒÆ’Ã‚Â?ÃƒÆ’Ã‚Â«ÃƒÆ’Ã¢â‚¬ËœÃƒâ€šÃ‚Â¡ÃƒÆ’Ã¢â‚¬Â?ÃƒÆ’Ã‚Â±ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â¶ÃƒÆ’Ã¢â‚¬â€?ÃƒÆ’Ã‚Â©!', NULL),
('ERROR_SEL_ROLE', 'MND', 'ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã‚ÂºÃƒâ€šÃ‚Â±ÃƒÆ’Ã‹Å“ÃƒÆ’Ã‚Â?ÃƒÆ’Ã‚Â«ÃƒÆ’Ã¢â‚¬â€œÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬Â°ÃƒÆ’Ã¢â€žÂ¢ÃƒÆ’Ã¢â‚¬ËœÃƒâ€šÃ‚Â¡ÃƒÆ’Ã¢â‚¬Â?ÃƒÆ’Ã‚Â±ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â¶Ãƒâ€šÃ‚Â½ÃƒÆ’Ã¢â‚¬Â¡ÃƒÆ’Ã¢â‚¬Â°Ãƒâ€šÃ‚Â«!', NULL),
('USER_PROFILE', 'MND', 'ÃƒÆ’Ã…Â½ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â´Ãƒâ€šÃ‚Â«ÃƒÆ’Ã¢â‚¬Å¡ÃƒÆ’Ã¢â‚¬Â?', NULL),
('COMMIT', 'MND', 'ÃƒÆ’Ã…Â½Ãƒâ€šÃ‚Â¯ÃƒÆ’Ã‚Â?ÃƒÆ’Ã‚Â?', NULL),
('CANCEL', 'MND', 'ÃƒÆ’Ã‹â€ Ãƒâ€šÃ‚Â¡ÃƒÆ’Ã‚Â?ÃƒÆ’Ã‚Â»', NULL),
('YES', 'MND', 'ÃƒÆ’Ã…Â ÃƒÆ’Ã¢â‚¬Â¡', NULL),
('NO', 'MND', 'Ãƒâ€šÃ‚Â·ÃƒÆ’Ã‚Â±', NULL),
('NEW', 'MND', 'Ãƒâ€šÃ‚Â²ÃƒÆ’Ã‚Â¥ÃƒÆ’Ã‹â€ ÃƒÆ’Ã‚Â«ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾', NULL),
('NAME', 'MND', 'ÃƒÆ’Ã†â€™ÃƒÆ’Ã‚Â»Ãƒâ€šÃ‚Â³ÃƒÆ’Ã¢â‚¬Â ', NULL),
('DESCRIPTION', 'MND', 'ÃƒÆ’Ã†â€™ÃƒÆ’Ã‚Â¨ÃƒÆ’Ã…Â ÃƒÆ’Ã‚Â¶', NULL),
('DOSOMETHING', 'MND', 'ÃƒÆ’Ã¢â‚¬Â¡ÃƒÆ’Ã‚Â«ÃƒÆ’Ã¢â‚¬ËœÃƒâ€šÃ‚Â¡ÃƒÆ’Ã¢â‚¬Â?ÃƒÆ’Ã‚Â±ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã‚ÂºÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚ÂªÃƒâ€šÃ‚Â½ÃƒÆ’Ã‚Â¸ÃƒÆ’Ã‚Â?ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â¶Ãƒâ€šÃ‚Â¯ÃƒÆ’Ã¢â‚¬â€?ÃƒÆ’Ã‚Â·. ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã‚ÂºÃƒâ€šÃ‚Â¿ÃƒÆ’Ã¢â‚¬Â°Ãƒâ€šÃ‚Â²ÃƒÆ’Ã‚Â¥ÃƒÆ’Ã‹â€ ÃƒÆ’Ã‚Â«ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬Å¡ÃƒÆ’Ã…â€™ÃƒÆ’Ã‚ÂµÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â¿, Ãƒâ€šÃ‚Â±ÃƒÆ’Ã‚Â Ãƒâ€šÃ‚Â¼Ãƒâ€šÃ‚Â­ÃƒÆ’Ã…â€™ÃƒÆ’Ã‚ÂµÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â¿, ÃƒÆ’Ã¢â‚¬Â°Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚Â³ÃƒÆ’Ã‚Â½ÃƒÆ’Ã…â€™ÃƒÆ’Ã‚ÂµÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â¿Ãƒâ€šÃ‚Â¼Ãƒâ€šÃ‚Â°Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â±ÃƒÆ’Ã‚Â¤ÃƒÆ’Ã…â€™ÃƒÆ’Ã‚ÂµÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â¿ÃƒÆ’Ã¢â‚¬Â¹Ãƒâ€šÃ‚Â³ÃƒÆ’Ã‚Â?ÃƒÆ’Ã‚Â².', NULL),
('EDIT', 'MND', 'Ãƒâ€šÃ‚Â±ÃƒÆ’Ã‚Â Ãƒâ€šÃ‚Â¼Ãƒâ€šÃ‚Â­', NULL),
('UP', 'MND', 'ÃƒÆ’Ã¢â‚¬Â°ÃƒÆ’Ã‚Â?', NULL),
('DOWN', 'MND', 'ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬Å¡', NULL),
('CONTAINERNAME', 'MND', 'ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â£Ãƒâ€šÃ‚Â°ÃƒÆ’Ã‚Â¥', NULL),
('SELECTOBJECT', 'MND', 'ÃƒÆ’Ã¢â‚¬Â¡ÃƒÆ’Ã‚Â«ÃƒÆ’Ã¢â‚¬ËœÃƒâ€šÃ‚Â¡ÃƒÆ’Ã¢â‚¬Â?ÃƒÆ’Ã‚Â±ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â¶ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã‚Â ÃƒÆ’Ã‚Â?ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â²Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã¢â‚¬â€œÃƒâ€šÃ‚Â¸Ãƒâ€šÃ‚Â¶Ãƒâ€šÃ‚Â¨ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â¶ÃƒÆ’Ã…Â½Ãƒâ€šÃ‚Â»ÃƒÆ’Ã¢â‚¬â€œÃƒÆ’Ã†â€™ÃƒÆ’Ã¢â‚¬Å“ÃƒÆ’Ã‚Â«ÃƒÆ’Ã†â€™ÃƒÆ’Ã‚Â»Ãƒâ€šÃ‚Â³ÃƒÆ’Ã¢â‚¬Â ÃƒÆ’Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬Â?Ãƒâ€šÃ‚Â±ÃƒÆ’Ã‚Â£Ãƒâ€šÃ‚Â´Ãƒâ€šÃ‚Â´Ãƒâ€šÃ‚Â½Ãƒâ€šÃ‚Â¨ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â¶ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬Å¡ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â¿Ãƒâ€šÃ‚Â±ÃƒÆ’Ã‚Âª.<br>Ãƒâ€šÃ‚Â¶ÃƒÆ’Ã¢â‚¬Â?ÃƒÆ’Ã¢â‚¬Å“ÃƒÆ’Ã…Â¡ÃƒÆ’Ã…Â½Ãƒâ€šÃ‚Â»ÃƒÆ’Ã¢â‚¬â€œÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â£Ãƒâ€šÃ‚Â¬Ãƒâ€šÃ‚Â°Ãƒâ€šÃ‚Â´ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã‚ÂºÃƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã‚Â?ÃƒÆ’Ã‚Â¨ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚ÂªÃƒâ€šÃ‚Â£Ãƒâ€šÃ‚Â¬ÃƒÆ’Ã…Â Ãƒâ€šÃ‚Â¹ÃƒÆ’Ã¢â‚¬Å“ÃƒÆ’Ã†â€™ 0 Ãƒâ€šÃ‚Â½Ãƒâ€šÃ‚Â«Ãƒâ€šÃ‚Â²ÃƒÆ’Ã‚Â¥ÃƒÆ’Ã¢â‚¬Â?ÃƒÆ’Ã…Â¡Ãƒâ€šÃ‚Â¿Ãƒâ€šÃ‚ÂªÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â·Ãƒâ€šÃ‚Â£Ãƒâ€šÃ‚Â¬999 Ãƒâ€šÃ‚Â½Ãƒâ€šÃ‚Â«Ãƒâ€šÃ‚Â²ÃƒÆ’Ã‚Â¥ÃƒÆ’Ã¢â‚¬Â?ÃƒÆ’Ã…Â¡ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â©ÃƒÆ’Ã…Â½Ãƒâ€šÃ‚Â²Ãƒâ€šÃ‚Â£Ãƒâ€šÃ‚Â¬ÃƒÆ’Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬Â?Ãƒâ€šÃ‚Â¼Ãƒâ€šÃ‚Â°ÃƒÆ’Ã¢â‚¬Â ÃƒÆ’Ã‚Â¤ÃƒÆ’Ã¢â‚¬Â¹ÃƒÆ’Ã‚Â¼ÃƒÆ’Ã…Â½Ãƒâ€šÃ‚Â»ÃƒÆ’Ã¢â‚¬â€œÃƒÆ’Ã†â€™.', NULL),
('POSITION', 'MND', 'ÃƒÆ’Ã…Â½Ãƒâ€šÃ‚Â»ÃƒÆ’Ã¢â‚¬â€œÃƒÆ’Ã†â€™', NULL),
('DELETE', 'MND', 'ÃƒÆ’Ã¢â‚¬Â°Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚Â³ÃƒÆ’Ã‚Â½', NULL),
('TYPE', 'MND', 'ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã‚Â ÃƒÆ’Ã‚Â?ÃƒÆ’Ã‚Â?', NULL),
('KEYWORDS', 'MND', 'Ãƒâ€šÃ‚Â¹ÃƒÆ’Ã‹Å“Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã‚Â¼ÃƒÆ’Ã¢â‚¬â€?ÃƒÆ’Ã¢â‚¬â€œ', NULL),
('METATEMPLATE', 'MND', 'Ãƒâ€šÃ‚Â¸Ãƒâ€šÃ‚Â½Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã¢â‚¬Å“Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾META-KeyÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â£Ãƒâ€šÃ‚Â°ÃƒÆ’Ã‚Â¥', NULL),
('SELECT_VARIATION', 'MND', 'ÃƒÆ’Ã¢â‚¬ËœÃƒâ€šÃ‚Â¡ÃƒÆ’Ã¢â‚¬Â?ÃƒÆ’Ã‚Â±Ãƒâ€šÃ‚Â±ÃƒÆ’Ã‚Â¤ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â¿', NULL),
('ACTIVE_VARIATION', 'MND', 'Ãƒâ€šÃ‚Â¼Ãƒâ€šÃ‚Â¤Ãƒâ€šÃ‚Â»ÃƒÆ’Ã‚Â®Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â±ÃƒÆ’Ã‚Â¤ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â¿:', NULL),
('NO_VARIATIONS', 'MND', 'ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â¿ÃƒÆ’Ã¢â‚¬Â¡Ãƒâ€šÃ‚Â°ÃƒÆ’Ã¢â‚¬Â¢ÃƒÆ’Ã‚Â¢Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â¶ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â»ÃƒÆ’Ã¢â‚¬Å“ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â¶Ãƒâ€šÃ‚Â¨ÃƒÆ’Ã¢â‚¬â„¢ÃƒÆ’Ã‚Â¥Ãƒâ€šÃ‚Â±ÃƒÆ’Ã‚Â¤ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â¿!<br> ÃƒÆ’Ã¢â‚¬Â¡ÃƒÆ’Ã‚Â«ÃƒÆ’Ã¢â‚¬Â¢ÃƒÆ’Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â»ÃƒÆ’Ã…Â½Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â¿Ãƒâ€šÃ‚ÂªÃƒâ€šÃ‚Â·Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã¢â‚¬Â¢ÃƒÆ’Ã…Â¸Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã‚Â¬Ãƒâ€šÃ‚Â²ÃƒÆ’Ã‚Â©ÃƒÆ’Ã¢â‚¬Â¹ÃƒÆ’Ã‚Â¹ÃƒÆ’Ã¢â‚¬ËœÃƒâ€šÃ‚Â¡Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã…â€™ÃƒÆ’Ã‚ÂµÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â¿Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã¢â‚¬Â¦ÃƒÆ’Ã‚Â¤ÃƒÆ’Ã¢â‚¬â€œÃƒÆ’Ã†â€™!', NULL),
('ED_CONTENT', 'MND', 'Ãƒâ€šÃ‚Â±ÃƒÆ’Ã‚Â Ãƒâ€šÃ‚Â¼Ãƒâ€šÃ‚Â­ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã…Â¡ÃƒÆ’Ã‹â€ ÃƒÆ’Ã‚Â?', NULL),
('ED_META', 'MND', 'Ãƒâ€šÃ‚Â±ÃƒÆ’Ã‚Â Ãƒâ€šÃ‚Â¼Ãƒâ€šÃ‚Â­METAÃƒÆ’Ã…Â ÃƒÆ’Ã‚Â½Ãƒâ€šÃ‚Â¾ÃƒÆ’Ã‚Â?', NULL),
('ED_DISPATCHER', 'MND', 'ÃƒÆ’Ã…Â Ãƒâ€šÃ‚Â¹ÃƒÆ’Ã¢â‚¬Å“ÃƒÆ’Ã†â€™ÃƒÆ’Ã¢â‚¬Â¢ÃƒÆ’Ã‚Â¢Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â¶Ãƒâ€šÃ‚Â°Ãƒâ€šÃ‚Â´ÃƒÆ’Ã¢â‚¬Â¦Ãƒâ€šÃ‚Â¥ÃƒÆ’Ã¢â‚¬Â?ÃƒÆ’Ã…Â¡Ãƒâ€šÃ‚Â±ÃƒÆ’Ã‚Â Ãƒâ€šÃ‚Â¼Ãƒâ€šÃ‚Â­METAÃƒÆ’Ã…Â ÃƒÆ’Ã‚Â½Ãƒâ€šÃ‚Â¾ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬Å“ÃƒÆ’Ã‚Â«Ãƒâ€šÃ‚Â±ÃƒÆ’Ã‚Â Ãƒâ€šÃ‚Â¼Ãƒâ€šÃ‚Â­ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã…Â¡ÃƒÆ’Ã‹â€ ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬â€œÃƒâ€šÃ‚Â®Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã‚Â¤ÃƒÆ’Ã¢â‚¬Â¡ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â».', NULL),
('PREVIEW', 'MND', 'ÃƒÆ’Ã¢â‚¬Â?Ãƒâ€šÃ‚Â¤ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã¢â€šÂ¬', NULL),
('CHOOSEFILE', 'MND', 'ÃƒÆ’Ã¢â‚¬ËœÃƒâ€šÃ‚Â¡ÃƒÆ’Ã¢â‚¬Â?ÃƒÆ’Ã‚Â±ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â¶ÃƒÆ’Ã…Â½ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã‚Â¾', NULL),
('CONFIGURED', 'MND', 'ÃƒÆ’Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬ËœÃƒÆ’Ã¢â‚¬â€?Ãƒâ€šÃ‚Â¼Ãƒâ€šÃ‚Â±Ãƒâ€šÃ‚Â¸Ãƒâ€šÃ‚ÂºÃƒÆ’Ã†â€™ÃƒÆ’Ã…Â Ãƒâ€šÃ‚Â¹ÃƒÆ’Ã¢â‚¬Å“ÃƒÆ’Ã†â€™.', NULL),
('NOTCONFIGURED', 'MND', 'ÃƒÆ’Ã…Â½Ãƒâ€šÃ‚Â´ÃƒÆ’Ã¢â‚¬Â¦ÃƒÆ’Ã‚Â¤ÃƒÆ’Ã¢â‚¬â€œÃƒÆ’Ã†â€™.', NULL),
('CONFIG', 'MND', 'ÃƒÆ’Ã¢â‚¬Â¦ÃƒÆ’Ã‚Â¤ÃƒÆ’Ã¢â‚¬â€œÃƒÆ’Ã†â€™', NULL),
('SELECT_CI', 'MND', 'ÃƒÆ’Ã¢â‚¬ËœÃƒâ€šÃ‚Â¡ÃƒÆ’Ã¢â‚¬Â?ÃƒÆ’Ã‚Â±ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â¶ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã…Â¡ÃƒÆ’Ã‹â€ ÃƒÆ’Ã‚Â?ÃƒÆ’Ã…â€™ÃƒÆ’Ã‚ÂµÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â¿', NULL),
('SELECT_CL', 'MND', 'ÃƒÆ’Ã¢â‚¬ËœÃƒâ€šÃ‚Â¡ÃƒÆ’Ã¢â‚¬Â?ÃƒÆ’Ã‚Â±ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â¶Ãƒâ€šÃ‚Â´ÃƒÆ’Ã‹Å“ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã‚Â½Ãƒâ€šÃ‚Â³ÃƒÆ’Ã…â€™', NULL),
('EMPTY', 'MND', '&lt;Ãƒâ€šÃ‚Â¿ÃƒÆ’Ã¢â‚¬Â¢&gt;', NULL),
('STATUS', 'MND', 'ÃƒÆ’Ã¢â‚¬â€?Ãƒâ€šÃ‚Â´ÃƒÆ’Ã…â€™Ãƒâ€šÃ‚Â¬:', NULL),
('UNIQUE', 'MND', 'ÃƒÆ’Ã¢â‚¬Â¢ÃƒÆ’Ã‚Â¢Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â¶ÃƒÆ’Ã¢â‚¬â€?ÃƒÆ’Ã¢â‚¬â€œÃƒâ€šÃ‚Â¶ÃƒÆ’Ã…Â½Ãƒâ€šÃ‚Â±ÃƒÆ’Ã‹Å“ÃƒÆ’Ã‚Â?ÃƒÆ’Ã‚Â«ÃƒÆ’Ã…Â ÃƒÆ’Ã¢â‚¬Â¡ÃƒÆ’Ã…Â½Ãƒâ€šÃ‚Â¨ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾!', NULL),
('MANDATORY', 'MND', 'ÃƒÆ’Ã¢â‚¬Â¢ÃƒÆ’Ã‚Â¢Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â¶ÃƒÆ’Ã¢â‚¬â€?ÃƒÆ’Ã¢â‚¬â€œÃƒâ€šÃ‚Â¶ÃƒÆ’Ã…Â½Ãƒâ€šÃ‚Â±ÃƒÆ’Ã‹Å“ÃƒÆ’Ã‚Â?ÃƒÆ’Ã‚Â«ÃƒÆ’Ã…Â½Ãƒâ€šÃ‚ÂªÃƒâ€šÃ‚Â¿ÃƒÆ’Ã¢â‚¬Â¢!', NULL),
('NOTNUMBER', 'MND', 'ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã‚ÂºÃƒâ€šÃ‚Â±ÃƒÆ’Ã‹Å“ÃƒÆ’Ã‚Â?ÃƒÆ’Ã‚Â«ÃƒÆ’Ã…Â ÃƒÆ’Ã‚Â¤ÃƒÆ’Ã‹â€ ÃƒÆ’Ã‚Â«ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â¶ÃƒÆ’Ã…Â ÃƒÆ’Ã‚Â½ÃƒÆ’Ã¢â‚¬â€?ÃƒÆ’Ã¢â‚¬â€œÃƒâ€šÃ‚ÂµÃƒâ€šÃ‚Â½ÃƒÆ’Ã¢â‚¬Â¢ÃƒÆ’Ã‚Â¢Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â¶ÃƒÆ’Ã¢â‚¬â€?ÃƒÆ’Ã¢â‚¬â€œÃƒâ€šÃ‚Â¶ÃƒÆ’Ã…Â½ÃƒÆ’Ã¢â‚¬â€œÃƒÆ’Ã‚Â?!', NULL),
('WRONGDATE', 'MND', 'ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã‚ÂºÃƒÆ’Ã…Â ÃƒÆ’Ã‚Â¤ÃƒÆ’Ã‹â€ ÃƒÆ’Ã‚Â«Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã…Â ÃƒÆ’Ã‚Â½Ãƒâ€šÃ‚Â¾ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â²Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â´ÃƒÆ’Ã‚Â¦ÃƒÆ’Ã¢â‚¬Â?ÃƒÆ’Ã…Â¡!', NULL),
('DATEFORMAT', 'MND', 'ÃƒÆ’Ã…Â ÃƒÆ’Ã‚Â½Ãƒâ€šÃ‚Â¾ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â±ÃƒÆ’Ã…Â Ãƒâ€šÃ‚Â½Ãƒâ€šÃ‚Â²Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â¶ÃƒÆ’Ã¢â‚¬Â?!', NULL),
('PWDNOTMATCH', 'MND', 'ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã‚ÂºÃƒÆ’Ã…Â ÃƒÆ’Ã‚Â¤ÃƒÆ’Ã‹â€ ÃƒÆ’Ã‚Â«Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã†â€™ÃƒÆ’Ã…â€œÃƒÆ’Ã¢â‚¬Å¡ÃƒÆ’Ã‚Â«Ãƒâ€šÃ‚Â²Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â¶ÃƒÆ’Ã¢â‚¬Â?!', NULL),
('PWDTOOSHORT', 'MND', 'ÃƒÆ’Ã†â€™ÃƒÆ’Ã…â€œÃƒÆ’Ã¢â‚¬Å¡ÃƒÆ’Ã‚Â«Ãƒâ€šÃ‚Â±ÃƒÆ’Ã‹Å“ÃƒÆ’Ã‚Â?ÃƒÆ’Ã‚Â«ÃƒÆ’Ã¢â‚¬â€œÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬Â°ÃƒÆ’Ã¢â€žÂ¢ÃƒÆ’Ã¢â‚¬Å“ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬â€œÃƒÆ’Ã‚Âº6Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â¶ÃƒÆ’Ã¢â‚¬â€?ÃƒÆ’Ã¢â‚¬â€œÃƒâ€šÃ‚Â·ÃƒÆ’Ã‚Â»!', NULL),
('PROCERROR', 'MND', 'Ãƒâ€šÃ‚Â´Ãƒâ€šÃ‚Â¦ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã‚Â­Ãƒâ€šÃ‚Â±ÃƒÆ’Ã‚Â­Ãƒâ€šÃ‚ÂµÃƒâ€šÃ‚Â¥ÃƒÆ’Ã…Â Ãƒâ€šÃ‚Â±Ãƒâ€šÃ‚Â³ÃƒÆ’Ã‚Â¶ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬â€œÃƒâ€šÃ‚Â´ÃƒÆ’Ã‚Â­ÃƒÆ’Ã…Â½ÃƒÆ’Ã‚Â³. ÃƒÆ’Ã¢â‚¬Â¡ÃƒÆ’Ã‚Â«Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã‚Â¬Ãƒâ€šÃ‚Â²ÃƒÆ’Ã‚Â©Ãƒâ€šÃ‚Â±ÃƒÆ’Ã‚ÂªÃƒÆ’Ã…Â½Ãƒâ€šÃ‚ÂªÃƒÆ’Ã¢â€šÂ¬Ãƒâ€šÃ‚Â¶ÃƒÆ’Ã¢â‚¬Â°Ãƒâ€šÃ‚Â«Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã¢â‚¬â€?ÃƒÆ’Ã¢â‚¬â€œÃƒâ€šÃ‚Â¶ÃƒÆ’Ã…Â½Ãƒâ€šÃ‚Â²Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã¢â‚¬Â?ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â¶ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã¢â‚¬Â¡ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã‚Â¯ÃƒÆ’Ã‹â€ Ãƒâ€šÃ‚Â¡Ãƒâ€šÃ‚ÂµÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â½ÃƒÆ’Ã‚Â¸ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â²Ãƒâ€šÃ‚Â½Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬Â¦ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â¢.', NULL),
('SAVEERROR', 'MND', 'Ãƒâ€šÃ‚Â½Ãƒâ€šÃ‚Â«ÃƒÆ’Ã…Â ÃƒÆ’Ã‚Â½Ãƒâ€šÃ‚Â¾ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â´ÃƒÆ’Ã‚Â¦ÃƒÆ’Ã‹â€ ÃƒÆ’Ã‚Â«ÃƒÆ’Ã…Â ÃƒÆ’Ã‚Â½Ãƒâ€šÃ‚Â¾ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â¿ÃƒÆ’Ã‚Â¢ÃƒÆ’Ã…Â Ãƒâ€šÃ‚Â±Ãƒâ€šÃ‚Â³ÃƒÆ’Ã‚Â¶ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬â€œÃƒâ€šÃ‚Â´ÃƒÆ’Ã‚Â­ÃƒÆ’Ã…Â½ÃƒÆ’Ã‚Â³. ÃƒÆ’Ã¢â‚¬Â¡ÃƒÆ’Ã‚Â«ÃƒÆ’Ã‹â€ Ãƒâ€šÃ‚Â·Ãƒâ€šÃ‚Â¶Ãƒâ€šÃ‚Â¨ÃƒÆ’Ã…Â ÃƒÆ’Ã‚Â½Ãƒâ€šÃ‚Â¾ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â¿ÃƒÆ’Ã‚Â¢ÃƒÆ’Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬ËœÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â¬Ãƒâ€šÃ‚Â½ÃƒÆ’Ã¢â‚¬Å“Ãƒâ€šÃ‚Â£Ãƒâ€šÃ‚Â¬Ãƒâ€šÃ‚Â»ÃƒÆ’Ã‚Â²ÃƒÆ’Ã¢â‚¬Â¢ÃƒÆ’Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã‚ÂºÃƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â¹ÃƒÆ’Ã…â€œÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã‚Â­ÃƒÆ’Ã¢â‚¬Â?Ãƒâ€šÃ‚Â±.', NULL),
('SAVESUCCESS', 'MND', 'ÃƒÆ’Ã…Â ÃƒÆ’Ã‚Â½Ãƒâ€šÃ‚Â¾ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â³ÃƒÆ’Ã¢â‚¬Â°Ãƒâ€šÃ‚Â¹Ãƒâ€šÃ‚Â¦ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â´ÃƒÆ’Ã‹â€ ÃƒÆ’Ã‚Â«ÃƒÆ’Ã…Â ÃƒÆ’Ã‚Â½Ãƒâ€šÃ‚Â¾ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â¿ÃƒÆ’Ã‚Â¢.', NULL),
('DELETESUCCESS', 'MND', 'ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬Å¡ÃƒÆ’Ã‚Â?ÃƒÆ’Ã‚Â?ÃƒÆ’Ã…Â ÃƒÆ’Ã‚Â½Ãƒâ€šÃ‚Â¾ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬ËœÃƒâ€šÃ‚Â±Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â´ÃƒÆ’Ã¢â‚¬Å“ÃƒÆ’Ã…Â ÃƒÆ’Ã‚Â½Ãƒâ€šÃ‚Â¾ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â¿ÃƒÆ’Ã‚Â¢ÃƒÆ’Ã¢â‚¬â€œÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â³ÃƒÆ’Ã¢â‚¬Â°Ãƒâ€šÃ‚Â¹Ãƒâ€šÃ‚Â¦ÃƒÆ’Ã¢â‚¬Â°Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚Â³ÃƒÆ’Ã‚Â½. ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬â€œÃƒÆ’Ã¢â‚¬Â?ÃƒÆ’Ã…Â¡ÃƒÆ’Ã¢â‚¬Â¹ÃƒÆ’Ã‚Â¼ÃƒÆ’Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬ËœÃƒâ€šÃ‚Â¶Ãƒâ€šÃ‚ÂªÃƒÆ’Ã…Â Ãƒâ€šÃ‚Â§!', NULL),
('SELECTONE', 'MND', 'ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã‚ÂºÃƒâ€šÃ‚Â±ÃƒÆ’Ã‹Å“ÃƒÆ’Ã‚Â?ÃƒÆ’Ã‚Â«ÃƒÆ’Ã¢â‚¬Â?ÃƒÆ’Ã…Â¡ÃƒÆ’Ã¢â‚¬Â¢ÃƒÆ’Ã‚Â¢ÃƒÆ’Ã¢â€šÂ¬ÃƒÆ’Ã‚Â¯ÃƒÆ’Ã¢â‚¬â€?ÃƒÆ’Ã‚Â¶Ãƒâ€šÃ‚Â³ÃƒÆ’Ã‚Â¶ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â¶ÃƒÆ’Ã¢â‚¬ËœÃƒâ€šÃ‚Â¡ÃƒÆ’Ã¢â‚¬Â?ÃƒÆ’Ã‚Â±!', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES 
('CREATENEW', 'MND', 'ÃƒÆ’Ã¢â‚¬Â¢ÃƒÆ’Ã‚Â¢Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â¶ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â£Ãƒâ€šÃ‚Â°ÃƒÆ’Ã‚Â¥ÃƒÆ’Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬ËœÃƒâ€šÃ‚Â´Ãƒâ€šÃ‚Â´Ãƒâ€šÃ‚Â½Ãƒâ€šÃ‚Â¨ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â¶ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â³ÃƒÆ’Ã¢â‚¬Â°ÃƒÆ’Ã¢â‚¬Â?Ãƒâ€šÃ‚Â±. ÃƒÆ’Ã¢â‚¬Â¡ÃƒÆ’Ã‚Â«Ãƒâ€šÃ‚Â²ÃƒÆ’Ã…Â½Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã‚Â»ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬Å¡ÃƒÆ’Ã‚Â?ÃƒÆ’Ã‚Â?ÃƒÆ’Ã…Â ÃƒÆ’Ã‚Â½Ãƒâ€šÃ‚Â¾ÃƒÆ’Ã‚Â?.', NULL),
('PROMPTDELETE', 'MND', 'ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã‚ÂºÃƒÆ’Ã…Â ÃƒÆ’Ã¢â‚¬Â¡Ãƒâ€šÃ‚Â·ÃƒÆ’Ã‚Â±ÃƒÆ’Ã¢â‚¬Â¢ÃƒÆ’Ã‚Â¦ÃƒÆ’Ã‚Â?ÃƒÆ’Ã‚Â«ÃƒÆ’Ã¢â‚¬Â°Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚Â³ÃƒÆ’Ã‚Â½ÃƒÆ’Ã¢â‚¬Â¢ÃƒÆ’Ã‚Â¢Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â¶ÃƒÆ’Ã…Â ÃƒÆ’Ã‚Â½Ãƒâ€šÃ‚Â¾ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â¼Ãƒâ€šÃ‚Â¯? ÃƒÆ’Ã¢â‚¬Â¢ÃƒÆ’Ã‚Â¢Ãƒâ€šÃ‚Â¸ÃƒÆ’Ã‚Â¶Ãƒâ€šÃ‚Â¶Ãƒâ€šÃ‚Â¯ÃƒÆ’Ã¢â‚¬â€?ÃƒÆ’Ã‚Â·Ãƒâ€šÃ‚Â²Ãƒâ€šÃ‚Â»ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã…â€œÃƒâ€šÃ‚Â·Ãƒâ€šÃ‚Â´Ãƒâ€šÃ‚Â»ÃƒÆ’Ã…Â¡!', NULL),
('RESET', 'MND', 'ÃƒÆ’Ã¢â‚¬â€œÃƒÆ’Ã‹Å“ÃƒÆ’Ã¢â‚¬â€œÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â±ÃƒÆ’Ã‚Â­Ãƒâ€šÃ‚ÂµÃƒâ€šÃ‚Â¥', NULL),
('BACK', 'MND', 'ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬Â¹Ãƒâ€šÃ‚Â»ÃƒÆ’Ã‹Å“', NULL),
('CREATE', 'MND', 'Ãƒâ€šÃ‚Â´Ãƒâ€šÃ‚Â´Ãƒâ€šÃ‚Â½Ãƒâ€šÃ‚Â¨ÃƒÆ’Ã…â€™ÃƒÆ’Ã‚ÂµÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â¿', NULL),
('ERROR', 'MND', 'ÃƒÆ’Ã¢â‚¬Â?ÃƒÆ’Ã…Â¡Ãƒâ€šÃ‚Â½ÃƒÆ’Ã‚Â¸ÃƒÆ’Ã‚Â?ÃƒÆ’Ã‚Â?ÃƒÆ’Ã¢â‚¬Â¹ÃƒÆ’Ã‚Â¹ÃƒÆ’Ã¢â‚¬ËœÃƒâ€šÃ‚Â¡Ãƒâ€šÃ‚Â²ÃƒÆ’Ã¢â€žÂ¢ÃƒÆ’Ã¢â‚¬â€?ÃƒÆ’Ã‚Â·ÃƒÆ’Ã…Â Ãƒâ€šÃ‚Â±Ãƒâ€šÃ‚Â³ÃƒÆ’Ã‚Â¶Ãƒâ€šÃ‚Â´ÃƒÆ’Ã‚Â­!', NULL),
('PURGE', 'MND', 'Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â¯ÃƒÆ’Ã…Â ÃƒÆ’Ã‚Â½Ãƒâ€šÃ‚Â¾ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â¿ÃƒÆ’Ã‚Â¢', NULL),
('PURGE_MES', 'MND', 'ÃƒÆ’Ã¢â‚¬Â¡ÃƒÆ’Ã‚Â«ÃƒÆ’Ã¢â‚¬ËœÃƒâ€šÃ‚Â¡ÃƒÆ’Ã¢â‚¬Â?ÃƒÆ’Ã‚Â±ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã‚ÂºÃƒÆ’Ã‚Â?ÃƒÆ’Ã‚Â«Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â¯Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã…Â ÃƒÆ’Ã‚Â½Ãƒâ€šÃ‚Â¾ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â¿ÃƒÆ’Ã‚Â¢Ãƒâ€šÃ‚Â²Ãƒâ€šÃ‚Â¿Ãƒâ€šÃ‚Â·ÃƒÆ’Ã¢â‚¬â€œ.', NULL),
('PURGE_VAR', 'MND', 'Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â¯Ãƒâ€šÃ‚Â²ÃƒÆ’Ã…Â½ÃƒÆ’Ã…Â ÃƒÆ’Ã‚Â½', NULL),
('PURGE_CONTENT', 'MND', 'Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â¯ÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã…Â¡ÃƒÆ’Ã‹â€ ÃƒÆ’Ã‚Â?', NULL),
('VAR_SUCCEEDED', 'MND', ' Ãƒâ€šÃ‚Â³ÃƒÆ’Ã¢â‚¬Â°Ãƒâ€šÃ‚Â¹Ãƒâ€šÃ‚Â¦!', NULL),
('PURGE_FOLDER', 'MND', 'Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â¯ÃƒÆ’Ã…Â½ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã‚Â¾Ãƒâ€šÃ‚Â¼ÃƒÆ’Ã‚Â?', NULL),
('PURGE_CLUSTER', 'MND', 'Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â¯Ãƒâ€šÃ‚Â´ÃƒÆ’Ã‹Å“', NULL),
('PURGE_META', 'MND', 'Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â¯Meta', NULL),
('PURGE_CLT', 'MND', 'Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â¯Ãƒâ€šÃ‚Â´ÃƒÆ’Ã‹Å“ÃƒÆ’Ã¢â‚¬Å¾Ãƒâ€šÃ‚Â£Ãƒâ€šÃ‚Â°ÃƒÆ’Ã‚Â¥', NULL),
('PURGE_PAGES', 'MND', 'Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â¯ÃƒÆ’Ã¢â‚¬Â¢Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚ÂµÃƒÆ’Ã‚Â£ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â³ÃƒÆ’Ã†â€™ÃƒÆ’Ã‚Â¦ÃƒÆ’Ã¢â‚¬Å“ÃƒÆ’Ã‚Â«Masters', NULL),
('PURGE_EXPIRED', 'MND', 'Ãƒâ€šÃ‚Â¾Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â»Ãƒâ€šÃ‚Â¯ÃƒÆ’Ã…Â Ãƒâ€šÃ‚Â§ÃƒÆ’Ã‚Â?Ãƒâ€šÃ‚Â§Ãƒâ€šÃ‚ÂµÃƒÆ’Ã¢â‚¬Å¾ÃƒÆ’Ã¢â‚¬â„¢Ãƒâ€šÃ‚Â³ÃƒÆ’Ã†â€™ÃƒÆ’Ã‚Â¦', NULL),
('PO_BROWSER', 'IT', 'Esplora il portale', NULL),
('PO_OWNER', 'IT', 'Proprietario della pagina', NULL),
('PO_CRSUCCEEDED', 'IT', 'La creazione della nuova pagina del portale ÃƒÆ’Ã‚Â¨ avvenuta con successo!', NULL),
('PO_MYPORTAL', 'IT', 'Mio Portale', NULL),
('PO_EDIT', 'IT', 'Edita la pagine dal portale', NULL),
('SP_BROWSE', 'IT', 'Esplora la mappa del sito', NULL),
('SP_NEWPAGE', 'IT', 'Aggiungi la pagina del sito', NULL),
('SP_NEWINSTANCE', 'IT', 'Aggiungere Pagina', NULL),
('SP_IPROPERTIES', 'IT', 'PropietÃƒÆ’Ã‚Â  dalla pagina', NULL),
('SP_PROPERTIES', 'IT', 'ProprietÃƒÆ’Ã‚Â  della pagina del sito', NULL),
('SP_DELETE', 'IT', 'Cancella la pagina del sito', NULL),
('SP_PDELETE', 'IT', 'Cancella Pagina', NULL),
('SP_CONFIGURE', 'IT', 'Configura Pagina', NULL),
('SP_CONFDESC', 'IT', 'Puoi collegare la pagina del sito a una istanza di gruppo esistente, o puoi creare una nuova istanza. Decidere cosa fare.', NULL),
('SP_LINK', 'IT', 'Collegare a una istanza di gruppo esistente', NULL),
('SP_CLNEW', 'IT', 'Creare una nuova istanza di gruppo', NULL),
('SP_EDIT', 'IT', 'Edita la pagina del sito', NULL),
('SP_MENUPROPS', 'IT', 'Nome del menÃƒÆ’Ã‚Â¹ e testo di aiuto', NULL),
('SP_MENUNAME', 'IT', 'Nome nel MenÃƒÆ’Ã‚Â¹', NULL),
('SP_MENUHELP', 'IT', 'Testo di aiuto per il MenÃƒÆ’Ã‚Â¹', NULL),
('SP_LAUNCHDATE', 'IT', 'Attivata da', NULL),
('SP_EXPIREDATE', 'IT', 'Scaduta da', NULL),
('SP_LAUNCHDATES', 'IT', 'Configurazione del tempo di vita', NULL),
('SP_PREVIEW', 'IT', 'Pagina Precedente', NULL),
('SP_LAUNCH', 'IT', 'Aprire la Pagina', NULL),
('SP_EXPIRE', 'IT', 'FÃƒÆ’Ã‚Â  scadere pagina', NULL),
('SPM', 'IT', 'Pagina del sito principale', NULL),
('SPM_EDIT', 'IT', 'Edita pagina del sito principale', NULL),
('SPM_META', 'IT', 'Template di META-chiavi', NULL),
('SPM_VARIATIONS', 'IT', 'Variazioni visualizabili', NULL),
('SPM_TYPE', 'IT', 'Tipo di pagina', NULL),
('SPM_CLUSTER', 'IT', 'Gruppo di Template', NULL),
('SPM_PATH', 'IT', 'Percorso dei Template', NULL),
('CL_BROWSE', 'IT', 'Esplora gruppo', NULL),
('CL_NEW', 'IT', 'Nuova istanza', NULL),
('CL_PROPERTIES', 'IT', 'ProprietÃƒÆ’Ã‚Â  del gruppo', NULL),
('CL_DEL', 'IT', 'Cancella istanza', NULL),
('CL_CREATEINSTANC', 'IT', 'Creare nuova istanza', NULL),
('CL_NOTITLE', 'IT', 'Nessun titolo definito', NULL),
('TITLE', 'IT', 'Titolo', NULL),
('CLI_EDIT', 'IT', 'Edita membri del gruppo', NULL),
('CLI_DELETE', 'IT', 'Cancella membri del gruppo', NULL),
('CLI_DELETEMES', 'IT', 'Vuoi veramente cancellare questa istanza. SarÃƒÆ’Ã‚Â  persa per sempre!', NULL),
('CLI', 'IT', 'Istanza di gruppo:', NULL),
('SR_SELECTCI', 'IT', 'Puoi cercare quÃƒÆ’Ã‚Â¬ per ogni content-items . Se vuoi selezionare un content-item, sceglierlo e premere il pulsante di Update ! Se vuoi connettere un nuovo contenuto con questo campo, bisogna prima creare il contenuto nel navigatore di oggetti.', NULL),
('SR_SELECTCLI', 'IT', 'Selezionare un cluster-template. DopodichÃƒÆ’Ã‚Â¨ puoi selezionare una istanza del template da assegnare.', NULL),
('FOLDER', 'IT', 'Cartella', NULL),
('CONTENTTYPE', 'IT', 'Content-Type', NULL),
('CONTENTITEM', 'IT', 'Content-Item', NULL),
('SEARCH', 'IT', 'Inizia ricerca', NULL),
('SEARCHIN', 'IT', 'Ricerca per', NULL),
('SEARCHRESULTS', 'IT', 'Risultati della ricerca, fare un scelta', NULL),
('SELECTEDOBJECT', 'IT', 'Content-Item attualmente selezionato', NULL),
('SELECTEDINSTANCE', 'IT', 'Seleziona una istanza Cluster', NULL),
('M_META', 'IT', 'Meta Templates', NULL),
('M_BROWSER', 'IT', 'Esplora oggetti', NULL),
('M_INSTALLPLUGIN', 'IT', 'PlugIns', NULL),
('M_ES', 'IT', 'Explora il  Sito', NULL),
('M_SPM', 'IT', 'Pagina principale', NULL),
('M_PRTMAN', 'IT', 'Manager del portale', NULL),
('M_MYPRT', 'IT', 'Mio Portale', NULL),
('M_MYPROFILE', 'IT', 'Mio Profilo', NULL),
('M_LOGOUT', 'IT', 'Sconnettiti', NULL),
('M_CLB', 'IT', 'Esplora i Cluster', NULL),
('M_CLTB', 'IT', 'Esplora i Cluster-Template', NULL),
('M_UMAN', 'IT', 'Manager utente', NULL),
('M_VAR', 'IT', 'Variazioni', NULL),
('M_PURGE', 'IT', 'Ripulisci Database', NULL),
('M_PGN', 'IT', 'Controllo deiPlugin', NULL),
('CLT_NEW', 'IT', 'Nuovo CL-Template', NULL),
('CLT_BROWSE', 'IT', 'Esplora il CL-Templates', NULL),
('CLT_NAME', 'IT', 'Nome del CL-Template', NULL),
('CLT_PROPERTIES', 'IT', 'ProprietÃƒÆ’Ã‚Â  del Cluster-Template', NULL),
('CLT_DELETE', 'IT', 'Cancella il Cluster-Template', NULL),
('CLT_DELMES', 'IT', 'Vuoi candellare il cluster-template. Questo comporterÃƒÆ’Ã‚Â  la perdita di tutti(!) i contenuti creati su e con il cluster-template. Sei sicuro, vuoi proseguire?', NULL),
('CLTI_DELETE', 'IT', 'Vuoi veramente cancellare questo oggetto. Tutte le istanza di questo oggetto saranno perse!', NULL),
('CLT_SCHEME', 'IT', 'Edita lo schema  Cluster-Template', NULL),
('CLT_MINCARD', 'IT', 'Minimo numero di istanze', NULL),
('CLT_MAXCARD', 'IT', 'Massimo numero di istanze', NULL),
('LINKED', 'IT', 'Collegato  con', NULL),
('PG_INSTALLDESC', 'IT', 'Essere sicuri di aver copiato tutti i necessari file nella cartella. Inserire il percorso corretto per i plugin nel campo sottostante. Il sistema istallerÃƒÆ’Ã‚Â  i the PlugIn automaticamente.', NULL),
('PG_CHOOSE', 'IT', 'PlugIn: &nbsp; /plugin/', NULL),
('PG_FILEWRONG', 'IT', 'Il file inserito non ÃƒÆ’Ã‚Â¨ stato trovato nel server!', NULL),
('CLASS_WRONG', 'IT', 'Il file specificato non ha un firma di classe valida!', NULL),
('PG_INSTALLED', 'IT', 'Il PlugIn ÃƒÆ’Ã‚Â¨ stato installato con successo!', NULL),
('PG_UPGRADED', 'IT', 'Il PlugIn ÃƒÆ’Ã‚Â¨ stato aggiornato con successo!', NULL),
('PG_ALREADYINSTAL', 'IT', 'Il PlugIn ÃƒÆ’Ã‚Â¨ giÃƒÆ’Ã‚Â  istallato!', NULL),
('PG_TITLE', 'IT', 'PlugIns', NULL),
('PG_INSTALL', 'IT', 'Aggiungi PlugIn', NULL),
('PG_UNINSTALL', 'IT', 'Rimuovi PlugIn', NULL),
('PG_UNINSTALLMES', 'IT', 'Stai per rimuovere un modulo. Rimuovere un modulo non solo rimuove i tipi contenuti ma anche cancella ogni singolo oggetto di questo tipo che sono immagazzinati nel database. La rimozione cancellerÃƒÆ’Ã‚Â  definitivamente tutti(!) i dati di questo modulo!', NULL),
('PG_UNINSTALLDELE', 'IT', 'Rimuovi il modulo,<br> Cancella tutti i contenuti corrispondenti.', NULL),
('O_NEW', 'IT', 'Nuovo oggetto', NULL),
('O_PROPERTIES', 'IT', 'ProprietÃƒÆ’Ã‚Â  degli oggetti', NULL),
('O_DELMES', 'IT', 'Stai per cancellare un oggetto. <b>Tutte le variazioni e i META-DATI saranno perse!</b>', NULL),
('O_DEL', 'IT', 'Cancella oggetto', NULL),
('O_EDIT', 'IT', 'Edita oggetto', NULL),
('O_PREVIEW', 'IT', 'Anteprima di', NULL),
('O_TEXT', 'IT', 'Testo', NULL),
('O_ALT', 'IT', 'ALT-Tag', NULL),
('O_COPYRIGHT', 'IT', 'Copyright', NULL),
('O_BROWSE', 'IT', 'Esplora oggetti', NULL),
('R_HOME', 'IT', 'Inizia', NULL),
('R_NEWFOLDER', 'IT', 'Nuovo contenitore', NULL),
('R_EDITFOLDER', 'IT', 'Edita le proprietÃƒÆ’Ã‚Â  del contenitore', NULL),
('R_FOLDERNAME', 'IT', 'Nomina il contenitore', NULL),
('R_DELETEFOLDER', 'IT', 'Cancella il contenitore', NULL),
('R_FOLDERNOTEMPTY', 'IT', 'Il contenitore non ÃƒÆ’Ã‚Â¨ vuoto. Non ÃƒÆ’Ã‚Â¨ possibili cancellarlo! Controllare tutti gli oggetti e gruppi!', NULL),
('R_DELFOLDER', 'IT', 'Cancellare il contenitore a tutti gli oggetti figli', NULL),
('R_MOVEOBJECTS', 'IT', 'Spostare tutti gli oggetti nel nodo principale', NULL),
('R_PARENT', 'IT', 'Contenitore principale', NULL),
('METATEMPLATES', 'IT', 'Contenitori Meta-Dati', NULL),
('MT_PROPERTIES', 'IT', 'Edita la proprietÃƒÆ’Ã‚Â  dei Meta-Contenitori', NULL),
('MT_SCHEME', 'IT', 'Edita schemi dei Meta-Contenitori', NULL),
('MT_DELETE', 'IT', 'Vuoi veramente cancellare questa parte di meta-contenitori? Tutte le informazioni inserite in ogni META-ingresso in CMS collegati con queste parti saranno cancellati. I dati saranno persi per sempre!', NULL),
('MT_ADDITIONAL', 'IT', 'META-Dati addizionali', NULL),
('MT_BASE', 'IT', 'META-Dati base', NULL),
('MT_MODULE', 'IT', 'Specificare i META-Dati del modulo', NULL),
('VARIATIONS', 'IT', 'Variazioni Disponibili', NULL),
('V_NAME', 'IT', 'Nome', NULL),
('V_SHORT', 'IT', 'Short-Tag', NULL),
('V_EDIT', 'IT', 'Editare variazioni', NULL),
('LOGIN_FAILED', 'IT', 'I dati di accesso inseriti non possono essere verificati! Riprovare.', NULL),
('USER_HEAD', 'IT', 'Profilo Utente', NULL),
('USER_LINK', 'IT', 'Profili Utente', NULL),
('USER_NAME', 'IT', 'Nome utente', NULL),
('FULL_NAME', 'IT', 'Name Completo', NULL),
('PASSWORD', 'IT', 'Password', NULL),
('USER_EMAIL', 'IT', 'eMail', NULL),
('USER_ACTIVE', 'IT', 'Acconto Abilitato', NULL),
('USER_FILTERMENU', 'IT', 'Amminisgtrazione utenti', NULL),
('USER_PERMGRID', 'IT', 'Griglia dei permessi', NULL),
('GROUP_LINK', 'IT', 'Profili del Gruppo', NULL),
('GROUP_HEAD', 'IT', 'Profilo del Gruppo', NULL),
('GROUP_NAME', 'IT', 'Nome del Gruppo', NULL),
('GROUP_DESCRIPTIO', 'IT', 'Descrizione', NULL),
('GROUP_FILTERMENU', 'IT', 'Amministrazione del Gruppo', NULL),
('ROLE_LINK', 'IT', 'Profili delle regole', NULL),
('ROLE_HEAD', 'IT', 'Profilo della regola', NULL),
('ROLE_NAME', 'IT', 'Nome  della regola', NULL),
('ROLE_DESCRIPTION', 'IT', 'Descrizione', NULL),
('ROLE_FILTERMENU', 'IT', 'Regole di amministrazione', NULL),
('USER_PERMISSIONS', 'IT', 'Permessi utente', NULL),
('USER_TO_GROUP', 'IT', 'Aggiungi utente al gruppo', NULL),
('ERROR_SEL_GROUP', 'IT', 'Devi selezionare un gruppo!', NULL),
('ERROR_SEL_ROLE', 'IT', 'Devi selezionare almeno una regola!', NULL),
('USER_PROFILE', 'IT', 'Mio profilo', NULL),
('COMMIT', 'IT', 'Impegna', NULL),
('CANCEL', 'IT', 'Cancella', NULL),
('YES', 'IT', 'Si', NULL),
('NO', 'IT', 'No', NULL),
('NEW', 'IT', 'Inserire Nuovo', NULL),
('NAME', 'IT', 'Nome', NULL),
('DESCRIPTION', 'IT', 'Descrizione', NULL),
('EDIT', 'IT', 'Editare', NULL),
('UP', 'IT', 'SÃƒÆ’Ã‚Â¹', NULL),
('DOWN', 'IT', 'GiÃƒÆ’Ã‚Â¹', NULL),
('CONTAINERNAME', 'IT', 'Contenitori', NULL),
('POSITION', 'IT', 'Posizione', NULL),
('DELETE', 'IT', 'Cancellare', NULL),
('TYPE', 'IT', 'Tipi', NULL),
('KEYWORDS', 'IT', 'Parole chiavi', NULL),
('METATEMPLATE', 'IT', 'Contenitori di META-chiavi addizionali', NULL),
('SELECT_VARIATION', 'IT', 'Selezionare Variazioni', NULL),
('ED_CONTENT', 'IT', 'Edita Contenuto', NULL),
('ED_META', 'IT', 'Editare i META-Dati', NULL),
('PREVIEW', 'IT', 'Anteprima', NULL),
('CHOOSEFILE', 'IT', 'Sciegli un file', NULL),
('NOTCONFIGURED', 'IT', 'Non ancora configurato.', NULL),
('CONFIG', 'IT', 'Configura', NULL),
('SELECT_CI', 'IT', 'Selezionare il contenuto degli oggetti', NULL),
('SELECT_CL', 'IT', 'Selezionare un gruppo di istanze', NULL),
('EMPTY', 'IT', '&lt;Vuoto&gt;', NULL),
('STATUS', 'IT', 'Stato:', NULL),
('UNIQUE', 'IT', 'Questo campo deve essere unico!', NULL),
('MANDATORY', 'IT', 'Questo campo non puÃƒÆ’Ã‚Â² essere vuoto!', NULL),
('NOTNUMBER', 'IT', 'Devi inserire un numero in questo campo!', NULL),
('WRONGDATE', 'IT', 'La data inserita, non esiste!', NULL),
('DATEFORMAT', 'IT', 'Il formato della data non ÃƒÆ’Ã‚Â¨ corretto!', NULL),
('PWDNOTMATCH', 'IT', 'La passwords inserita non ÃƒÆ’Ã‚Â¨ corretta!', NULL),
('PWDTOOSHORT', 'IT', 'La password deve essere di almeno 6 caratteri!', NULL),
('PROCERROR', 'IT', 'Un errore ÃƒÆ’Ã‚Â¨ successo mentre si processava il form. Controllare il campo marcato di blu e leggere quÃƒÆ’Ã‚Â¬ per ulteriori informazioni.', NULL),
('SAVEERROR', 'IT', 'Si ÃƒÆ’Ã‚Â¨ verificato un errore mentre si stavano salvando i dati nel database. Assicurarsi che il database sia connesso o contattare il proprio Amministratore.', NULL),
('SAVESUCCESS', 'IT', 'I dati sono stati scritti correttamente nel database.', NULL),
('DELETESUCCESS', 'IT', 'I dati elencati sotto sono stati correttamente cancellati dal database. Ora sono persi!', NULL),
('SELECTONE', 'IT', 'Devi fare una scelta quÃƒÆ’Ã‚Â¬!', NULL),
('CREATENEW', 'IT', 'Un nuovo membro di questo template ÃƒÆ’Ã‚Â¨ stato creato. Guardare i dati elencati sotto.', NULL),
('PROMPTDELETE', 'IT', 'Vuoi veramente cancellare questo dataset? Questa azione non puÃƒÆ’Ã‚Â² essere ripristinata!', NULL),
('RESET', 'IT', 'Resettare Form', NULL),
('BACK', 'IT', 'Indietro', NULL),
('CREATE', 'IT', 'Creare Oggetto', NULL),
('PURGE', 'IT', 'Ripulisci Database', NULL),
('PURGE_MES', 'IT', 'Selezionare la parte di database, che si vuole ripulire.', NULL),
('PURGE_VAR', 'IT', 'Ripulire Variazioni', NULL),
('PURGE_CONTENT', 'IT', 'Ripulire Contenuto', NULL),
('VAR_SUCCEEDED', 'IT', ' completato!', NULL),
('PURGE_FOLDER', 'IT', 'Ripulire Cartelle', NULL),
('PURGE_CLUSTER', 'IT', 'Ripulire Gruppo', NULL),
('PURGE_META', 'IT', 'Ripulire Meta', NULL),
('PURGE_CLT', 'IT', 'Ripulire Gruppo di Contenitori', NULL),
('PURGE_PAGES', 'IT', 'Ripulire pagina del sito e quella principale', NULL),
('PURGE_EXPIRED', 'IT', 'Ripulisci pagine scadute', NULL),
('USER_JS', 'PL', 'UÃƒâ€šÃ‚Â¿yj Javascript', NULL),
('USER_BL', 'PL', 'JÃƒÆ’Ã‚Âªzyk systemu zarzÃƒâ€šÃ‚Â±dzania', NULL),
('PO_BROWSER', 'PL', 'PrzeglÃƒâ€šÃ‚Â±danie Portali', NULL),
('PO_OWNER', 'PL', 'WÃƒâ€šÃ‚Â³aÃƒâ€šÃ‚Â¶ciciel Strony', NULL),
('PO_CRSUCCEEDED', 'PL', 'Utworzenie nowej strony portalu powiodÃƒâ€šÃ‚Â³o siÃƒÆ’Ã‚Âª!', NULL),
('PO_MYPORTAL', 'PL', 'Moje Portale', NULL),
('PO_EDIT', 'PL', 'Edycja strony Portal-u', NULL),
('SP_BROWSE', 'PL', 'PrzeglÃƒâ€šÃ‚Â±danie ukÃƒâ€šÃ‚Â³adu stron', NULL),
('SP_NEWPAGE', 'PL', 'Dodanie strony serwisu', NULL),
('SP_NEWINSTANCE', 'PL', 'Dodanie strony', NULL),
('SP_IPROPERTIES', 'PL', 'WÃƒâ€šÃ‚Â³aÃƒâ€šÃ‚Â¶ciwoÃƒâ€šÃ‚Â¶ci strony', NULL),
('SP_PROPERTIES', 'PL', 'WÃƒâ€šÃ‚Â³aÃƒâ€šÃ‚Â¶ciwoÃƒâ€šÃ‚Â¶ci strony serwisu', NULL),
('SP_DELMES', 'PL', 'Zamierzasz usunÃƒâ€šÃ‚Â±ÃƒÆ’Ã‚Â¦ stronÃƒÆ’Ã‚Âª serwisu. ProszÃƒÆ’Ã‚Âª zauwaÃƒâ€šÃ‚Â¿yÃƒÆ’Ã‚Â¦, Ãƒâ€šÃ‚Â¿e takÃƒâ€šÃ‚Â¿e czynna wersja tej strony serwisu zostanie usuniÃƒÆ’Ã‚Âªta!', NULL),
('SP_DELETE', 'PL', 'UsuniÃƒÆ’Ã‚Âªcie strony serwisu', NULL),
('SP_PDELMES', 'PL', 'Zamierzasz usunÃƒâ€šÃ‚Â±ÃƒÆ’Ã‚Â¦ stronÃƒÆ’Ã‚Âª. ProszÃƒÆ’Ã‚Âª zauwaÃƒâ€šÃ‚Â¿yÃƒÆ’Ã‚Â¦, Ãƒâ€šÃ‚Â¿e takÃƒâ€šÃ‚Â¿e czynna wersja tej strony zostanie usuniÃƒÆ’Ã‚Âªta!', NULL),
('SP_PDELETE', 'PL', 'UsuniÃƒÆ’Ã‚Âªcie strony', NULL),
('SP_CONFIGURE', 'PL', 'Konfiguracja strony', NULL),
('SP_CONFDESC', 'PL', 'MoÃƒâ€šÃ‚Â¿na poÃƒâ€šÃ‚Â³Ãƒâ€šÃ‚Â±czyÃƒÆ’Ã‚Â¦ tÃƒâ€šÃ‚Â± stronÃƒÆ’Ã‚Âª serwisu z instniejÃƒâ€šÃ‚Â±cym wystaÃƒâ€šÃ‚Â±pieniem klastra lub moÃƒâ€šÃ‚Â¿na utworzyÃƒÆ’Ã‚Â¦ nowÃƒâ€šÃ‚Â± instancjÃƒÆ’Ã‚Âª. ProszÃƒÆ’Ã‚Âª zadecydowaÃƒÆ’Ã‚Â¦ co zamierzsz zrobiÃƒÆ’Ã‚Â¦.', NULL),
('SP_LINK', 'PL', 'UtworzyÃƒÆ’Ã‚Â¦ poÃƒâ€šÃ‚Â³Ãƒâ€šÃ‚Â±czenie do istniejÃƒâ€šÃ‚Â±cego wystÃƒâ€šÃ‚Â±pienia klastra', NULL),
('SP_CLNEW', 'PL', 'StworzyÃƒÆ’Ã‚Â¦ nowe wystÃƒâ€šÃ‚Â±pienie klastra', NULL),
('SP_EDIT', 'PL', 'Edycja strony serwisu', NULL),
('SP_MENUPROPS', 'PL', 'Nazwa menu i tekst pomocy', NULL),
('SP_MENUNAME', 'PL', 'Nazwa w menu', NULL),
('SP_MENUHELP', 'PL', 'Tekst pomocy dla menu', NULL),
('SP_LAUNCHDATE', 'PL', 'WaÃƒâ€šÃ‚Â¿ne od', NULL),
('SP_EXPIREDATE', 'PL', 'UpÃƒâ€šÃ‚Â³ywa od', NULL),
('SP_LAUNCHDATES', 'PL', 'Konfiguracja czasu pracy', NULL),
('SP_PREVIEW', 'PL', 'PodglÃƒâ€šÃ‚Â±d strony', NULL),
('SP_LAUNCH', 'PL', 'Uruchom stronÃƒÆ’Ã‚Âª', NULL),
('SP_EXPIRE', 'PL', 'Przedawnij stronÃƒÆ’Ã‚Âª', NULL),
('NOSPTITLE', 'PL', 'NaleÃƒâ€šÃ‚Â¿y zdefiniowaÃƒÆ’Ã‚Â¦ nazwÃƒÆ’Ã‚Âª w menu przed uruchomieniem strony!', NULL),
('ACTIVE', 'PL', 'Aktywne', NULL),
('SPM', 'PL', 'Wzorzec strony serwisu', NULL),
('SPM_EDIT', 'PL', 'Edycja wzorca strony serwisu', NULL),
('SPM_META', 'PL', 'Wzorzec meta kluczy', NULL),
('SPM_VARIATIONS', 'PL', 'WyÃƒâ€šÃ‚Â¶wietlane wersje', NULL),
('SPM_TYPE', 'PL', 'Rodzaj strony', NULL),
('SPM_CLUSTER', 'PL', 'Wzorzec klastra', NULL),
('SPM_PATH', 'PL', 'Ãƒâ€šÃ‚Â¦cieÃƒâ€šÃ‚Â¿ka do wzorca', NULL),
('CL_BROWSE', 'PL', 'PrzeglÃƒâ€šÃ‚Â±danie klastrÃƒÆ’Ã‚Â³w', NULL),
('CL_NEW', 'PL', 'Nowe wystÃƒâ€šÃ‚Â±pienie', NULL),
('CL_PROPERTIES', 'PL', 'WÃƒâ€šÃ‚Â³aÃƒâ€šÃ‚Â¶ciwoÃƒâ€šÃ‚Â¶ci klastra', NULL),
('CL_DEL', 'PL', 'UsuÃƒÆ’Ã‚Â± wystÃƒâ€šÃ‚Â±pienie', NULL),
('CL_DELMES', 'PL', 'Czy na pewno chcesz usunÃƒâ€šÃ‚Â±ÃƒÆ’Ã‚Â¦ to wystÃƒâ€šÃ‚Â±pienie klastra? Wszystkie dane zawartoÃƒâ€šÃ‚Â¶ci zostanÃƒâ€šÃ‚Â± stracone!', NULL),
('CL_EDIT', 'PL', 'Edycja wystÃƒâ€šÃ‚Â±pienia klastra', NULL),
('CL_CREATEINSTANC', 'PL', 'UtÃƒÆ’Ã‚Â³rzenie nowego wystÃƒâ€šÃ‚Â±pienia', NULL),
('CL_CREATEINSMES', 'PL', 'Nadal zostajÃƒâ€šÃ‚Â± gniazda do utworzenia dodatkowych wystÃƒâ€šÃ‚Â±pieÃƒÆ’Ã‚Â± dla thych pÃƒÆ’Ã‚Â³l zawartoÃƒâ€šÃ‚Â¶ci. JeÃƒâ€šÃ‚Â¿eli chcesz utworzyÃƒÆ’Ã‚Â¦ dodatkowe wystÃƒâ€šÃ‚Â±pienie, wprowadÃƒâ€šÃ‚Â¼ tytuÃƒâ€šÃ‚Â³ w polu tekstowym poniÃƒâ€šÃ‚Â¿ej i naciÃƒâ€šÃ‚Â¶nij przycisk utwÃƒÆ’Ã‚Â³rz.', NULL),
('CL_NOTITLE', 'PL', 'Nie zostaÃƒâ€šÃ‚Â³ jeszcze zdefiniowany tytuÃƒâ€šÃ‚Â³', NULL),
('TITLE', 'PL', 'TytuÃƒâ€šÃ‚Â³', NULL),
('CLI_EDIT', 'PL', 'Edycja czÃƒâ€šÃ‚Â³onka klastra', NULL),
('CLI_DELETE', 'PL', 'UsuÃƒÆ’Ã‚Â± czÃƒâ€šÃ‚Â³onka klastra', NULL),
('CLI_DELETEMES', 'PL', 'Czy na pewno chcesz usunÃƒâ€šÃ‚Â±ÃƒÆ’Ã‚Â¦ to wystÃƒâ€šÃ‚Â±pienie? Zostanie stracone na zawsze!', NULL),
('CLI_DELETED', 'PL', 'WystÃƒâ€šÃ‚Â±pienie zostaÃƒâ€šÃ‚Â³o usuniÃƒÆ’Ã‚Âªte!', NULL),
('CLI_NOTDELETED', 'PL', 'To wystÃƒâ€šÃ‚Â±pienie nie moÃƒâ€šÃ‚Â¿e zostaÃƒÆ’Ã‚Â¦ usuniÃƒÆ’Ã‚Âªte!', NULL),
('CLI', 'PL', 'WystÃƒâ€šÃ‚Â±pienie klastra:', NULL),
('SR_SELECTCI', 'PL', 'Tutaj moÃƒâ€šÃ‚Â¿na wyszukiwaÃƒÆ’Ã‚Â¦ dowolne elementy zawartoÃƒâ€šÃ‚Â¶ci. JeÃƒâ€šÃ‚Â¿eli chcemy wybraÃƒÆ’Ã‚Â¦ element zawartoÃƒâ€šÃ‚Â¶ci, naleÃƒâ€šÃ‚Â¿y nacisnÃƒâ€šÃ‚Â±ÃƒÆ’Ã‚Â¦ przycisk Aktualizuj! JeÃƒâ€šÃ‚Â¿eli chcemy podÃƒâ€šÃ‚Â³Ãƒâ€šÃ‚Â±czyÃƒÆ’Ã‚Â¦ siÃƒÆ’Ã‚Âª do nowej zawartoÃƒâ€šÃ‚Â¶ci za pomocÃƒâ€šÃ‚Â± tego pola - stwÃƒÆ’Ã‚Â³rz wczeÃƒâ€šÃ‚Â¶niej zawartoÃƒâ€šÃ‚Â¶ÃƒÆ’Ã‚Â¦ w PrzeglÃƒâ€šÃ‚Â±darce obiektÃƒÆ’Ã‚Â³w.', NULL),
('SR_SELECTCLI', 'PL', 'ProszÃƒÆ’Ã‚Âª wybraÃƒÆ’Ã‚Â¦ szablon klastra. NastÃƒÆ’Ã‚Âªpnie moÃƒâ€šÃ‚Â¿na wybraÃƒÆ’Ã‚Â¦ wystÃƒâ€šÃ‚Â±pienie szablonu w celu dalszego uÃƒâ€šÃ‚Â¿ycia.', NULL),
('FOLDER', 'PL', 'Folder', NULL),
('CONTENTTYPE', 'PL', 'Rodzaj zawartoÃƒâ€šÃ‚Â¶ci', NULL),
('CONTENTITEM', 'PL', 'Element zawartoÃƒâ€šÃ‚Â¶ci', NULL),
('SEARCH', 'PL', 'PoczÃƒâ€šÃ‚Â±tek wyszukiwania', NULL),
('SEARCHIN', 'PL', 'Szukaj', NULL),
('SEARCHRESULTS', 'PL', 'Wyniki wyszukiwania, proszÃƒÆ’Ã‚Âª wybraÃƒÆ’Ã‚Â¦', NULL),
('SELECTEDOBJECT', 'PL', 'Aktualnie wybrany element zawartoÃƒâ€šÃ‚Â¶ci', NULL),
('SELECTEDINSTANCE', 'PL', 'Wybrane wystÃƒâ€šÃ‚Â±pienie klastra', NULL),
('M_META', 'PL', 'Szablony Meta', NULL),
('M_BROWSER', 'PL', 'Przegladarka obiektÃƒÆ’Ã‚Â³w', NULL),
('M_INSTALLPLUGIN', 'PL', 'Dodatki', NULL),
('M_ES', 'PL', 'PrzeglÃƒâ€šÃ‚Â±darka serwisu', NULL),
('M_SPM', 'PL', 'Wzorzec stron serwisu', NULL),
('M_PRTMAN', 'PL', 'ZarzÃƒâ€šÃ‚Â±dzanie portalem', NULL),
('M_MYPRT', 'PL', 'Moje portale', NULL),
('M_MYPROFILE', 'PL', 'MÃƒÆ’Ã‚Â³j profil', NULL),
('M_LOGOUT', 'PL', 'Wyloguj', NULL),
('M_CLB', 'PL', 'PrzeglÃƒâ€šÃ‚Â±darka klastra', NULL),
('M_CLTB', 'PL', 'PrzeglÃƒâ€šÃ‚Â±darka szablonÃƒÆ’Ã‚Â³w klastra', NULL),
('M_UMAN', 'PL', 'ZarzÃƒâ€šÃ‚Â±dzanie uÃƒâ€šÃ‚Â¿ytkownikami', NULL),
('M_VAR', 'PL', 'Odmiany', NULL),
('M_PURGE', 'PL', 'UsuniÃƒÆ’Ã‚Âªcie bazy danych', NULL),
('M_PGN', 'PL', 'Kontrola dodatkÃƒÆ’Ã‚Â³w', NULL),
('M_REPORT', 'PL', 'Raport serweisu', NULL),
('CLT_NEW', 'PL', 'Nowy szablon klastra', NULL),
('CLT_BROWSE', 'PL', 'PrzeglÃƒâ€šÃ‚Â±d. szabl.klas.', NULL),
('CLT_NAME', 'PL', 'Nazwa szabl.klas.', NULL),
('CLT_PROPERTIES', 'PL', 'WÃƒâ€šÃ‚Â³aÃƒâ€šÃ‚Â¶ciwoÃƒâ€šÃ‚Â¶ci szabl.klas.', NULL),
('CLT_DELETE', 'PL', 'UsuniÃƒÆ’Ã‚Âªcie szabl.klas.', NULL),
('CLT_DELMES', 'PL', 'Zamierzasz usunÃƒâ€šÃ‚Â±ÃƒÆ’Ã‚Â¦ szablon klastra. Spowoduje to usuniÃƒÆ’Ã‚ÂªciÃƒÆ’Ã‚Âª wszystkich(!) zawartoÃƒâ€šÃ‚Â¶ci stworzonych przy uÃƒâ€šÃ‚Â¿yciu szablonu klastra. Czy na pewno chcesz kontynuowaÃƒÆ’Ã‚Â¦?', NULL),
('CLTI_DELETE', 'PL', 'Czy na pewno chesz usunÃƒâ€šÃ‚Â±ÃƒÆ’Ã‚Â¦ ten element? Wszystkie wystÃƒâ€šÃ‚Â±pienia tego elementu takÃƒâ€šÃ‚Â¿e zostanÃƒâ€šÃ‚Â± usuniÃƒÆ’Ã‚Âªte!', NULL),
('CLT_SCHEME', 'PL', 'Edycja schematu szablonu klastra', NULL),
('CLT_MINCARD', 'PL', 'WystÃƒâ€šÃ‚Â±pienia', NULL),
('CLT_MAXCARD', 'PL', '-', NULL),
('LINKED', 'PL', 'PoÃƒâ€šÃ‚Â³Ãƒâ€šÃ‚Â±czone z', NULL),
('PG_INSTALLDESC', 'PL', 'Prosze siÃƒÆ’Ã‚Âª upewniÃƒÆ’Ã‚Â¦, Ãƒâ€šÃ‚Â¿e zostaÃƒâ€šÃ‚Â³y skopiowane wszystkie niezbÃƒÆ’Ã‚Âªdne pliki do katalogu przed kontynuacjÃƒâ€šÃ‚Â±. WprowadÃƒâ€šÃ‚Â¼ poprawnÃƒâ€šÃ‚Â± Ãƒâ€šÃ‚Â¶cieÃƒâ€šÃ‚Â¿kÃƒÆ’Ã‚Âª do dodatku w poniÃƒâ€šÃ‚Â¿szym polu. System zainstaluje dodatek automatycznie.', NULL),
('PG_CHOOSE', 'PL', 'Dodatek: &nbsp; /plugin/', NULL),
('PG_FILEWRONG', 'PL', 'Nazwa pliku, ktÃƒÆ’Ã‚Â³ra zostaÃƒâ€šÃ‚Â³a wprowadzona nie mogÃƒâ€šÃ‚Â³a zostaÃƒÆ’Ã‚Â¦ znaleziona na serwerze!', NULL),
('CLASS_WRONG', 'PL', 'Plik, ktÃƒÆ’Ã‚Â³ry zostaÃƒâ€šÃ‚Â³ wprowadzony nie zawiera poprawnej sygnatury!', NULL),
('PG_INSTALLED', 'PL', 'Dodatek zostaÃƒâ€šÃ‚Â³ poprawnie zainstalowany!', NULL),
('PG_UPGRADED', 'PL', 'Dodatek zostaÃƒâ€šÃ‚Â³ porawnie zaktualizowany!', NULL),
('PG_ERROR', 'PL', 'WystÃƒâ€šÃ‚Â±piÃƒâ€šÃ‚Â³ bÃƒâ€šÃ‚Â³Ãƒâ€šÃ‚Â±d podczas instalacji dodatku!', NULL),
('PG_ALREADYINSTAL', 'PL', 'Dodatek juÃƒâ€šÃ‚Â¿ zostaÃƒâ€šÃ‚Â³ zainstalowany!', NULL),
('PG_NEWERINSTALLE', 'PL', 'JuÃƒâ€šÃ‚Â¿ jest zainstalowana nowsza wersja dodatku!', NULL),
('PG_TITLE', 'PL', 'Dodatki', NULL),
('PG_INSTALL', 'PL', 'Zainstaluj dodatek', NULL),
('PG_UNINSTALL', 'PL', 'Odinstaluj dodatek', NULL),
('PG_UNINSTALLMES', 'PL', 'Zamierzasz odinstalowaÃƒÆ’Ã‚Â¦ moduÃƒâ€šÃ‚Â³. Odinstalowanie moduÃƒâ€šÃ‚Â³u nie tylko usuwa rodzaj zawartoÃƒâ€šÃ‚Â¶ci ale takÃƒâ€šÃ‚Â¿e usuwa kaÃƒâ€šÃ‚Â¿dy obiekt tego typu przechowywany w bazie danych. Odinstalowanie definitywnie(!) usunie wszystkie dane dla tego moduÃƒâ€šÃ‚Â³u!', NULL),
('PG_UNINSTALLDELE', 'PL', 'Odinstaluj moduÃƒâ€šÃ‚Â³,<br> UsuniÃƒÆ’Ã‚Âªcie wszystkie zaleÃƒâ€šÃ‚Â¿ne zawartoÃƒâ€šÃ‚Â¶ci.', NULL),
('O_NEW', 'PL', 'Nowy obiekt', NULL),
('O_NAME', 'PL', 'Nazwa obiektu', NULL),
('O_PROPERTIES', 'PL', 'WÃƒâ€šÃ‚Â³aÃƒâ€šÃ‚Â¶ciwoÃƒâ€šÃ‚Â¶ci obiektu', NULL),
('O_DELMES', 'PL', 'Zamierzasz usunÃƒâ€šÃ‚Â±ÃƒÆ’Ã‚Â¦ obiekt. <b>NaleÃƒâ€šÃ‚Â¿y zauwaÃƒâ€šÃ‚Â¿yÃƒÆ’Ã‚Â¦, Ãƒâ€šÃ‚Â¿e wszystkie odmiany i meta dane zostanÃƒâ€šÃ‚Â± utracone!</b>', NULL),
('O_DEL', 'PL', 'UsuÃƒÆ’Ã‚Â± obiekt', NULL),
('O_EDIT', 'PL', 'Edytuj obiekt', NULL),
('O_PREVIEW', 'PL', 'PodglÃƒâ€šÃ‚Â±d', NULL),
('O_TEXT', 'PL', 'Tekst', NULL),
('O_ALT', 'PL', 'Opis rysunku', NULL),
('O_COPYRIGHT', 'PL', 'Prawo autorskie', NULL),
('O_BROWSE', 'PL', 'PrzeglÃƒâ€šÃ‚Â±d obiektÃƒÆ’Ã‚Â³w', NULL),
('R_HOME', 'PL', 'Start', NULL),
('R_NEWFOLDER', 'PL', 'Nowy folder', NULL),
('R_EDITFOLDER', 'PL', 'Edycja wÃƒâ€šÃ‚Â³aÃƒâ€šÃ‚Â¶ciwoÃƒâ€šÃ‚Â¶ci folderu', NULL),
('R_FOLDERNAME', 'PL', 'Nazwa folderu', NULL),
('R_DELETEFOLDER', 'PL', 'UsuÃƒÆ’Ã‚Â± folder', NULL),
('R_DELFOLDERMES', 'PL', 'Zamierzasz usunÃƒâ€šÃ‚Â±ÃƒÆ’Ã‚Â¦ folder. ProszÃƒÆ’Ã‚Âª zaznaczyÃƒÆ’Ã‚Â¦ akcjÃƒÆ’Ã‚Âª.', NULL),
('R_FOLDERNOTEMPTY', 'PL', 'Folder nie jest pusty. Nie moÃƒâ€šÃ‚Â¿na go usunÃƒâ€šÃ‚Â±ÃƒÆ’Ã‚Â¦. ProszÃƒÆ’Ã‚Âª sprawdziÃƒÆ’Ã‚Â¦ wszystkie obiekty i klastry!', NULL),
('R_DELFOLDER', 'PL', 'UsuniÃƒÆ’Ã‚Âªcie folderu i wszystkich podrzÃƒÆ’Ã‚Âªdnych obiektÃƒÆ’Ã‚Â³w', NULL),
('R_MOVEOBJECTS', 'PL', 'PrzesuniÃƒÆ’Ã‚Âªcie wszystkich obiektÃƒÆ’Ã‚Â³w do nadrzÃƒÆ’Ã‚Âªdnego wÃƒÆ’Ã‚ÂªzÃƒâ€šÃ‚Â³a', NULL),
('R_PARENT', 'PL', 'NadrzÃƒÆ’Ã‚Âªdny folder', NULL),
('METATEMPLATES', 'PL', 'Szablon meta danych', NULL),
('MT_PROPERTIES', 'PL', 'Edycja wÃƒâ€šÃ‚Â³aÃƒâ€šÃ‚Â¶ciwoÃƒâ€šÃ‚Â¶ci meta szablonu', NULL),
('MT_SCHEME', 'PL', 'Edycja schematu meta szablonu', NULL),
('MT_DELETE', 'PL', 'Czy rzeczywiÃƒâ€šÃ‚Â¶cie zamierzasz usunÃƒâ€šÃ‚Â±ÃƒÆ’Ã‚Â¦ tÃƒâ€šÃ‚Â± czÃƒÆ’Ã‚ÂªÃƒâ€šÃ‚Â¶ÃƒÆ’Ã‚Â¦ meta szablonu? Wszystkie informacje wprowadzone w dowolne meta pola w systemie CMS poÃƒâ€šÃ‚Â³Ãƒâ€šÃ‚Â±czone do tej czÃƒÆ’Ã‚ÂªÃƒâ€šÃ‚Â¶ci zostanÃƒâ€šÃ‚Â± usuniÃƒÆ’Ã‚Âªte. Dane zostanÃƒâ€šÃ‚Â± usuniÃƒÆ’Ã‚Âªte caÃƒâ€šÃ‚Â³kowicie!', NULL),
('MT_ADDITIONAL', 'PL', 'Dodatkowe meta dane', NULL),
('MT_BASE', 'PL', 'Podstawowe meta dane', NULL),
('MT_MODULE', 'PL', 'Meta dane specyficzne dla rodzaju zawrtoÃƒâ€šÃ‚Â¶ci', NULL),
('VARIATIONS', 'PL', 'DostÃƒÆ’Ã‚Âªpne odmiany', NULL),
('V_NAME', 'PL', 'Nazwa', NULL),
('V_SHORT', 'PL', 'KrÃƒÆ’Ã‚Â³tki znacznik', NULL),
('V_EDIT', 'PL', 'Edycja odmian', NULL),
('LOGIN_FAILED', 'PL', 'Wprowadzone dane uÃƒâ€šÃ‚Â¿ytkownika nie mogÃƒâ€šÃ‚Â± zostaÃƒÆ’Ã‚Â¦ potwierdzone! ProszÃƒÆ’Ã‚Âª sprÃƒÆ’Ã‚Â³bowaÃƒÆ’Ã‚Â¦ ponownie.', NULL),
('USER_HEAD', 'PL', 'Profil uÃƒâ€šÃ‚Â¿ytkownika', NULL),
('USER_LINK', 'PL', 'Profile uÃƒâ€šÃ‚Â¿ytkownikÃƒÆ’Ã‚Â³w', NULL),
('USER_NAME', 'PL', 'Nazwa uÃƒâ€šÃ‚Â¿ytkownika', NULL),
('FULL_NAME', 'PL', 'PeÃƒâ€šÃ‚Â³na nazwa', NULL),
('PASSWORD', 'PL', 'HasÃƒâ€šÃ‚Â³o', NULL),
('USER_EMAIL', 'PL', 'eMail', NULL),
('USER_ACTIVE', 'PL', 'Konto wÃƒâ€šÃ‚Â³Ãƒâ€šÃ‚Â±czone', NULL),
('USER_FILTERMENU', 'PL', 'Administracja uÃƒâ€šÃ‚Â¿ytkonikami', NULL),
('USER_SETPERM', 'PL', 'Ustal prawa dostÃƒÆ’Ã‚Âªpu uÃƒâ€šÃ‚Â¿ytkownika poniÃƒâ€šÃ‚Â¿ej. W celu usuniÃƒÆ’Ã‚Âªcia uÃƒâ€šÃ‚Â¿ytkownika z grupy, po prostu odwoÃƒâ€šÃ‚Â³aj wszytkie grupy przynaleÃƒâ€šÃ‚Â¿ne do niego.', NULL),
('USER_PERMGRID', 'PL', 'Siatka uprawnieÃƒÆ’Ã‚Â±', NULL),
('GROUP_LINK', 'PL', 'Profile grupy', NULL),
('GROUP_HEAD', 'PL', 'Profil grupy', NULL),
('GROUP_NAME', 'PL', 'Nazwa grupy', NULL),
('GROUP_DESCRIPTIO', 'PL', 'Opis', NULL),
('GROUP_FILTERMENU', 'PL', 'Adminstracja grupÃƒâ€šÃ‚Â±', NULL),
('ROLE_LINK', 'PL', 'Profile rÃƒÆ’Ã‚Â³l', NULL),
('ROLE_HEAD', 'PL', 'Profil roli', NULL),
('ROLE_NAME', 'PL', 'Nazwa roli', NULL),
('ROLE_DESCRIPTION', 'PL', 'Opis', NULL),
('ROLE_FILTERMENU', 'PL', 'Adminstracja rolami', NULL),
('USER_PERMISSIONS', 'PL', 'Uprawnienia uÃƒâ€šÃ‚Â¿ytkownika', NULL),
('UP_INTRO', 'PL', 'ProszÃƒÆ’Ã‚Âª zaznaczyÃƒÆ’Ã‚Â¦ grupÃƒÆ’Ã‚Âª i role w grupie, ktÃƒÆ’Ã‚Â³re checesz dodaÃƒÆ’Ã‚Â¦ dla uÃƒâ€šÃ‚Â¿ytkownika.', NULL),
('USER_TO_GROUP', 'PL', 'Dodanie uÃƒâ€šÃ‚Â¿ytkownika do grupy', NULL),
('ERROR_SEL_GROUP', 'PL', 'NaleÃƒâ€šÃ‚Â¿y wybraÃƒÆ’Ã‚Â¦ grupÃƒÆ’Ã‚Âª!', NULL),
('ERROR_SEL_ROLE', 'PL', 'NaleÃƒâ€šÃ‚Â¿y wybraÃƒÆ’Ã‚Â¦ co najmniej jednÃƒâ€šÃ‚Â± rolÃƒÆ’Ã‚Âª!', NULL),
('USER_PROFILE', 'PL', 'MÃƒÆ’Ã‚Â³j profil', NULL),
('COMMIT', 'PL', 'PowieÃƒâ€šÃ‚Â¿', NULL),
('CANCEL', 'PL', 'Anuluj', NULL),
('YES', 'PL', 'Tak', NULL),
('NO', 'PL', 'Nie', NULL),
('NEW', 'PL', 'Wstaw nowy', NULL),
('NAME', 'PL', 'Nazwa', NULL),
('DESCRIPTION', 'PL', 'Opis', NULL),
('DOSOMETHING', 'PL', 'ProszÃƒÆ’Ã‚Âª wybraÃƒÆ’Ã‚Â¦ dziaÃƒâ€šÃ‚Â³anie, ktÃƒÆ’Ã‚Â³re chesz wykonaÃƒÆ’Ã‚Â¦. MoÃƒâ€šÃ‚Â¿esz wybraÃƒÆ’Ã‚Â¦ nowe elementy, edytowaÃƒÆ’Ã‚Â¦ elementy, usunÃƒâ€šÃ‚Â±ÃƒÆ’Ã‚Â¦ elementy lub zmieniÃƒÆ’Ã‚Â¦ kolejnoÃƒâ€šÃ‚Â¶ÃƒÆ’Ã‚Â¦ elementÃƒÆ’Ã‚Â³w.', NULL),
('EDIT', 'PL', 'Edycja', NULL),
('UP', 'PL', 'W gÃƒÆ’Ã‚Â³rÃƒÆ’Ã‚Âª', NULL),
('DOWN', 'PL', 'W dÃƒÆ’Ã‚Â³Ãƒâ€šÃ‚Â³', NULL),
('CONTAINERNAME', 'PL', 'Szablon', NULL),
('SELECTOBJECT', 'PL', 'ProszÃƒÆ’Ã‚Âª wybraÃƒÆ’Ã‚Â¦ klasÃƒÆ’Ã‚Âª oraz okreÃƒâ€šÃ‚Â¶liÃƒÆ’Ã‚Â¦ pozycjÃƒÆ’Ã‚Âª i nazwÃƒÆ’Ã‚Âª dla tworzonego obiektu.<br> Dla pozycji uÃƒâ€šÃ‚Â¿yj 0 dla okreÃƒâ€šÃ‚Â¶lenia poczÃƒâ€šÃ‚Â±tkowej pozycji, 999 dla okreÃƒâ€šÃ‚Â¶lenie na koÃƒÆ’Ã‚Â±cu poza innymi pozycjami twojego wybory.', NULL),
('POSITION', 'PL', 'Pozycja', NULL),
('DELETE', 'PL', 'UsuÃƒÆ’Ã‚Â±', NULL),
('TYPE', 'PL', 'Typ', NULL),
('KEYWORDS', 'PL', 'SÃƒâ€šÃ‚Â³owa kluczowe', NULL),
('METATEMPLATE', 'PL', 'Dodatkowe meta klucze szablonu', NULL),
('SELECT_VARIATION', 'PL', 'Wybierz odmianÃƒÆ’Ã‚Âª', NULL),
('ACTIVE_VARIATION', 'PL', 'Aktywne odmiany:', NULL),
('NO_VARIATIONS', 'PL', 'Nie ma obecnie zdefiniowanych odmian tego obiektu!<br>ProszÃƒÆ’Ã‚Âª skonsultowaÃƒÆ’Ã‚Â¦ to z programistÃƒâ€šÃ‚Â± w celu sprawdzenia konfiguracji wybranego elementu!', NULL),
('ED_CONTENT', 'PL', 'Edycja zawartoÃƒâ€šÃ‚Â¶ci', NULL),
('ED_META', 'PL', 'Edycja meta danych', NULL),
('ED_DISPATCHER', 'PL', 'UÃƒâ€šÃ‚Â¿yj tego przycisku w celu przeÃƒâ€šÃ‚Â³Ãƒâ€šÃ‚Â±czenia siÃƒÆ’Ã‚Âª pomiÃƒÆ’Ã‚Âªdzy edytowaniem meta danych a edycjÃƒâ€šÃ‚Â± zawartoÃƒâ€šÃ‚Â¶ci.', NULL),
('PREVIEW', 'PL', 'PodglÃƒâ€šÃ‚Â±d', NULL),
('CHOOSEFILE', 'PL', 'Wybierz plik', NULL),
('CONFIGURED', 'PL', 'Gotowy do uÃƒâ€šÃ‚Â¿ycia.', NULL),
('NOTCONFIGURED', 'PL', 'Nie skonfigurowany jeszcze.', NULL),
('CONFIG', 'PL', 'Konfiguracja', NULL),
('SELECT_CI', 'PL', 'Wybierz element zawartoÃƒâ€šÃ‚Â¶ci', NULL),
('SELECT_CL', 'PL', 'Wybierz element klastra', NULL),
('EMPTY', 'PL', '&lt;pusty&gt;', NULL),
('STATUS', 'PL', 'Status:', NULL),
('UNIQUE', 'PL', 'To pole musi byÃƒÆ’Ã‚Â¦ unikalne!', NULL),
('MANDATORY', 'PL', 'To pole nie moÃƒâ€šÃ‚Â¿e byÃƒÆ’Ã‚Â¦ puste!', NULL),
('NOTNUMBER', 'PL', 'NaleÃƒâ€šÃ‚Â¿y wprowadziÃƒÆ’Ã‚Â¦ numer do tego pola!', NULL),
('WRONGDATE', 'PL', 'Data, ktÃƒÆ’Ã‚Â³ra zostaÃƒâ€šÃ‚Â³a wprowadzone nie istnieje!', NULL),
('DATEFORMAT', 'PL', 'Format daty jest nieprawidÃƒâ€šÃ‚Â³owy!', NULL),
('PWDNOTMATCH', 'PL', 'HasÃƒâ€šÃ‚Â³a, ktÃƒÆ’Ã‚Â³re zostaÃƒâ€šÃ‚Â³y wprowadzone nie zgadzajÃƒâ€šÃ‚Â± siÃƒÆ’Ã‚Âª!', NULL),
('PWDTOOSHORT', 'PL', 'HasÃƒâ€šÃ‚Â³o musi zawieraÃƒÆ’Ã‚Â¦ co najmniej 6 znakÃƒÆ’Ã‚Â³w!', NULL),
('PROCERROR', 'PL', 'WystÃƒâ€šÃ‚Â±piÃƒâ€šÃ‚Â³ bÃƒâ€šÃ‚Â³Ãƒâ€šÃ‚Â±d podczas przetwarzania danych formularza. ProszÃƒÆ’Ã‚Âª sprawdziÃƒÆ’Ã‚Â¦ pola zaznaczone na niebiesko i przeczytaÃƒÆ’Ã‚Â¦ dodatkowe informacje.', NULL),
('SAVEERROR', 'PL', 'WystÃƒâ€šÃ‚Â±piÃƒâ€šÃ‚Â³ bÃƒâ€šÃ‚Â³Ãƒâ€šÃ‚Â±d podczas zapisywania danych do bazy danych. ProszÃƒÆ’Ã‚Âª sprawdziÃƒÆ’Ã‚Â¦ czy baza danych jest podÃƒâ€šÃ‚Â³Ãƒâ€šÃ‚Â±czona lub zadzwoniÃƒÆ’Ã‚Â¦ do administratora.', NULL),
('SAVESUCCESS', 'PL', 'Dane zostaÃƒâ€šÃ‚Â³y poprawnie zapisane do bazy danych.', NULL),
('DELETESUCCESS', 'PL', 'Dane wypisane poniÃƒâ€šÃ‚Â¿ej zostaÃƒâ€šÃ‚Â³y poprawnie usuniÃƒÆ’Ã‚Âªte z bazy danych. ZostaÃƒâ€šÃ‚Â³y caÃƒâ€šÃ‚Â³kowicie usuniÃƒÆ’Ã‚Âªte!', NULL),
('SELECTONE', 'PL', 'Tutaj naleÃƒâ€šÃ‚Â¿y dokonaÃƒÆ’Ã‚Â¦ wyboru!', NULL),
('CREATENEW', 'PL', 'Nowy czÃƒâ€šÃ‚Â³onek tego szablonu zostaÃƒâ€šÃ‚Â³ utworzony zobacz dane wypisane poniÃƒâ€šÃ‚Â¿ej.', NULL),
('PROMPTDELETE', 'PL', 'Czy na pewno chcesz usunÃƒâ€šÃ‚Â±ÃƒÆ’Ã‚Â¦ ten zestaw danych? Ta akcja nie moÃƒâ€šÃ‚Â¿e zostaÃƒÆ’Ã‚Â¦ cofniÃƒÆ’Ã‚Âªta!', NULL),
('RESET', 'PL', 'WyczyÃƒâ€šÃ‚Â¶ÃƒÆ’Ã‚Â¦ formularz', NULL),
('BACK', 'PL', 'Wstecz', NULL),
('CREATE', 'PL', 'UtwÃƒÆ’Ã‚Â³rz element', NULL),
('ERROR', 'PL', 'WystÃƒâ€šÃ‚Â±piÃƒâ€šÃ‚Â³ bÃƒâ€šÃ‚Â³Ãƒâ€šÃ‚Â±d podczas operacji wykonywania wyboru!', NULL),
('PURGE', 'PL', 'UsuniÃƒÆ’Ã‚Âªcie bazy danych', NULL),
('PURGE_MES', 'PL', 'ProszÃƒÆ’Ã‚Âª wybraÃƒÆ’Ã‚Â¦ czÃƒÆ’Ã‚Âªsci bazy danych, ktÃƒÆ’Ã‚Â³re zamierzasz usunÃƒâ€šÃ‚Â±ÃƒÆ’Ã‚Â¦.', NULL),
('PURGE_VAR', 'PL', 'UsuniÃƒÆ’Ã‚Âªcie odmian', NULL),
('PURGE_CONTENT', 'PL', 'UsuniÃƒÆ’Ã‚Âªcie zawartoÃƒâ€šÃ‚Â¶ci', NULL),
('VAR_SUCCEEDED', 'PL', ' powiodÃƒâ€šÃ‚Â³o siÃƒÆ’Ã‚Âª!', NULL),
('PURGE_FOLDER', 'PL', 'UsuniÃƒÆ’Ã‚Âªcie folderu', NULL),
('PURGE_CLUSTER', 'PL', 'UsuniÃƒÆ’Ã‚Âªcie klastra', NULL),
('PURGE_META', 'PL', 'UsuniÃƒÆ’Ã‚Âªcie Meta', NULL),
('PURGE_CLT', 'PL', 'UsuniÃƒÆ’Ã‚Âªcie szablonÃƒÆ’Ã‚Â³w klastra', NULL),
('PURGE_PAGES', 'PL', 'UsuniÃƒÆ’Ã‚Âªcie stron serwisu i wzorcÃƒÆ’Ã‚Â³w', NULL),
('PURGE_EXPIRED', 'PL', 'UsuniÃƒÆ’Ã‚Âªcie stron przedawnionych', NULL),
('HELP_COMPGRP', 'DE', 'Verbund-Gruppen sind Gruppen von Clustern. Cluster-Vorlagen kÃƒÆ’Ã‚Â¶nnen ein eigenes Layout besitzen. Dies ermÃƒÆ’Ã‚Â¶glicht Ihnen, Ihre Homepage aus BlÃƒÆ’Ã‚Â¶cken zusammenzusezten, z.B. News, Umfrage, Bildergalerie - alles auf einer Seite und bei Bedarf.', ''),
('NO_CLUSTERTEMPLATES', 'DE', 'Keine Klassen.', ''),
('HELP_CLT', 'DE', 'Cluster-Vorlagen erlauben Ihnen, die Struktur fÃƒÆ’Ã‚Â¼r Ihre Site festzulegen und den Typ von Inhalten zu bestimmen. AnschlieÃƒÆ’Ã…Â¸end werden Cluster-Vorlagen mit Seiten-Vorlagen verschmolzen, welche die Inhalte in der Web-Seite darstellen.', ''),
('SPM_SELECTTHUMB', 'DE', 'Vorschaubild auswÃƒÆ’Ã‚Â¤hlen', ''),
('TT_REFRESH', 'DE', 'Instanzen erneuern aktualisiert zwischengespeicherte Seiten mit den geÃƒÆ’Ã‚Â¤nderten Werten.', ''),
('HELP_PAGETEMP', 'DE', 'In Tabellenkalkulations- und Datenbank-Anwendungen ist eine Vorlage ein leeres Formular, das zeigt, welche Felder an welcher Position und in welcher LÃƒÆ’Ã‚Â¤nge existieren. In N/X sind Vorlage die Grundlage fÃƒÆ’Ã‚Â¼r jede Ausgabe. Eine Vorlage ist ein Formular, in dem alle Zellen definiert wurden, jedoch noch keine Inhalte hinterlegt wurden.', ''),
('CREATED', 'DE', 'Erstellt', ''),
('EDITED', 'DE', 'Bearbeitet', ''),
('IN_CHANNEL', 'DE', 'in Kanal', ''),
('AUTHOR', 'DE', 'Autor', ''),
('SEL_ARTICLE', 'DE', 'Artikel auswÃƒÆ’Ã‚Â¤hlen', ''),
('CH_CAT', 'DE', 'Kategorien bearbeiten', ''),
('CH_ADMIN', 'DE', 'Kanal-Administration', ''),
('ARTICLES', 'DE', 'Artikel', ''),
('CHANNEL_SELECT', 'DE', 'Kanal auswÃƒÆ’Ã‚Â¤hlen', ''),
('HELP_OBJBROWSE', 'DE', 'Die Inhalts-Bibliothek enthÃƒÆ’Ã‚Â¤lt alle Inhalte der Site.', ''),
('HELP_SP', 'DE', 'Die Sitemap dient zum Bearbeiten von Seiten-Struktur und Seiten', ''),
('MH_GETSTART', 'DE', 'Erste Schritte', ''),
('M_HELP', 'DE', 'Hilfe', ''),
('M_CHANNELS', 'DE', 'KanÃƒÆ’Ã‚Â¤le', ''),
('M_EXPORT_WZ', 'DE', 'Export-Assistent', ''),
('M_IMPORT_WZ', 'DE', 'Import-Assistent', ''),
('SYNC_CLUSTERS', 'DE', 'Objekte synchronisieren', ''),
('AGENT_EXPLAINHOME', 'DE', 'You can find me by clicking the N/X-Logo in the upper-right corner of your browser.', ''),
('AGENT_LOGOUT', 'DE', 'I hope you enjoyed working with N/X. Have a nice day!', ''),
('AGENT_CALLED', 'DE', 'you asked for me?', ''),
('AGENT_NXHOMEPAGE', 'DE', 'Visit N/X Homepage!', ''),
('AGENT_GOAWAY', 'DE', 'Hide and stay away!', ''),
('AGENT_GOHOME', 'DE', 'Go home!', ''),
('AGENT_WELCOME', 'DE', 'Welcome to N/X.', ''),
('YESTERDAY', 'DE', 'Gestern', ''),
('WHEN', 'DE', 'Wann', ''),
('WEEKDAY', 'DE', 'Wochentage', ''),
('WEEKDAY_AS', 'DE', 'Wochentage-Analyse', ''),
('VIS_FIRST', 'DE', 'Erstmalige Besucher', ''),
('VIS_ONL', 'DE', 'Besucher online', ''),
('VIS_PER_VIS', 'DE', 'Durchschnittliche Besuche je Besucher', ''),
('VIS_RET', 'DE', 'Wiederkehrende Besucher', ''),
('WEBSITE', 'DE', 'Website', ''),
('VISITS_OVERVIEW', 'DE', 'Besucher-ÃƒÆ’Ã…â€œbersicht', ''),
('VISITS', 'DE', 'Besuche', ''),
('VISITORS', 'DE', 'Besucher', ''),
('USER_PERMISSION', 'DE', 'Benutzerrechte bearbeiten', ''),
('USER_JS', 'DE', 'Javascript verwenden', ''),
('USER_GENERAL', 'DE', 'Allgemeine Benutzerdaten bearbeiten', ''),
('USER_BL', 'DE', 'Backoffice-Sprache', ''),
('USAGE', 'DE', 'Verwendung', ''),
('USERPERM_HEAD', 'DE', 'Benutzer-Rechte berabeiten', ''),
('TRANSLATION', 'DE', 'N/X ÃƒÆ’Ã…â€œbersetzungs-System', ''),
('TOTAL', 'DE', 'Gesamt', ''),
('TOP_SKW', 'DE', 'Top Such-SchlÃƒÆ’Ã‚Â¼sselworte', ''),
('TOP_SI', 'DE', 'Top Suchmaschinen', ''),
('TOP_REFERER', 'DE', 'Top Referer', ''),
('TOP_PATHS', 'DE', 'Top Pfade', ''),
('TOP_OS', 'DE', 'Top Betriebssysteme', ''),
('TOP_EXITT', 'DE', 'Top Ausgangs-Ziele', ''),
('TOP_HOSTS', 'DE', 'Top Hosts', ''),
('TOP_BROWSER', 'DE', 'Top Browser', ''),
('TMPL_NAME', 'DE', 'Vorlage auswÃƒÆ’Ã‚Â¤hlen', ''),
('TODAY', 'DE', 'Heute', ''),
('TOP', 'DE', 'Daten einschrÃƒÆ’Ã‚Â¤nken', ''),
('TIPP_TEMPLATE_1', 'DE', 'Vorlagen sind die Basis jeder Ausgabe von N/X. Sie mÃƒÆ’Ã‚Â¼ssen zunÃƒÆ’Ã‚Â¤chst eine Klasse  erstellen, die die Struktur und die Art der Inhalte definiert. AnschlieÃƒÆ’Ã…Â¸end kÃƒÆ’Ã‚Â¶nnen Sie die Seiten-Vorlage erstellen, indem Sie eine Klasse mit einer PHP-Datei verbinden.', ''),
('TIME_BETW_VISITS', 'DE', 'Durchschnittliche Zeit zwischen Besuchen', ''),
('THISYEAR', 'DE', 'Dieses Jahr', ''),
('THISWEEK', 'DE', 'Dieses Woche', ''),
('THISMONTH', 'DE', 'Dieser Monat', ''),
('TF', 'DE', 'Zeitrahmen', ''),
('TESTS', 'DE', 'N/X Unit-Tests', ''),
('TEMPLATE', 'DE', 'Vorlage', ''),
('STNAME', 'DE', 'WÃƒÆ’Ã‚Â¤hlen Sie einen Namen, um die Seite in der Sitemap zu identifizieren', ''),
('STATS_HEADER', 'DE', 'N/X 5.0 Statistiken', ''),
('STATS', 'DE', 'Statistiken', ''),
('START_BAK', 'DE', 'Datensicherung starten', ''),
('SP_RLTREE', 'DE', 'Baum erneut verÃƒÆ’Ã‚Â¶ffentlichen', ''),
('SP_MENUDIRECTTITLE', 'DE', 'Optionale URL auf dem Server fÃƒÆ’Ã‚Â¼r direkten Zugriff angeben', ''),
('SP_MENUDIRECT', 'DE', 'Seiten-URL auf Live-Server', ''),
('SP_MENUDIRECTTIT', 'DE', 'Optionale URL auf dem Server fÃƒÆ’Ã‚Â¼r direkten Zugriff angeben', ''),
('SPM_THUMBNAIL', 'DE', 'Vorschaubild', ''),
('SPM_RLAUNCH', 'DE', 'Seiten erneut verÃƒÆ’Ã‚Â¶ffentlichen', ''),
('SMA_EXT_EDIT', 'DE', 'Bearbeitungs-Fenster ÃƒÆ’Ã‚Â¶ffnen. Alle inline bearbeiteten Texte vorher speichern !', ''),
('SHORTEST_PATHS', 'DE', 'KÃƒÆ’Ã‚Â¼rzeste Pfade', ''),
('SET', 'DE', 'Setzen', ''),
('SEL_MEM', 'DE', 'GewÃƒÆ’Ã‚Â¤hlte Mitglieder', ''),
('SELMULTIPLE', 'DE', 'Halten Sie die STRG-Taste gedrÃƒÆ’Ã‚Â¼ckt, um mehrere Elemente auszuwÃƒÆ’Ã‚Â¤hlen', ''),
('SELECT', 'DE', 'AuswÃƒÆ’Ã‚Â¤hlen', ''),
('SEARCH_CLEAR', 'DE', 'Filter lÃƒÆ’Ã‚Â¶schen', ''),
('SAVE_BACK', 'DE', 'Speichern und ZurÃƒÆ’Ã‚Â¼ck', ''),
('SAVE', 'DE', 'Speichern', ''),
('RL_PERM', 'DE', 'Rollen-Berechtigungen', ''),
('RET_VIS', 'DE', 'Wiederkehrende Besucher', ''),
('RESET_FORM', 'DE', 'Reset', ''),
('REMAIN_POS', 'DE', 'Position beibehalten', ''),
('REFERER', 'DE', 'Referer', ''),
('RB_CACHE', 'DE', 'Zwischenspeichern neu aufbauen', ''),
('RATERES', 'DE', 'Ergebnisse bewerten', ''),
('RANK', 'DE', 'Rang', ''),
('PTEMPL', 'DE', 'Seiten-Vorlagen', ''),
('PROPERTIES', 'DE', 'Eigenschaften', ''),
('PRINT', 'DE', 'Drucken', ''),
('PREDEF_TIME', 'DE', 'Vordefinierter Zeitrahmen', ''),
('POS_IN_MENU', 'DE', 'Position in Ast', ''),
('PI_OVERVIEW', 'DE', 'Page Impressions ÃƒÆ’Ã…â€œbersicht', ''),
('PI', 'DE', 'Page Impressions', ''),
('PGNTXT_SMA', 'DE', 'Alle bearbeiteten Texte auf der Seite speichern', ''),
('PERCENT', 'DE', 'Prozent', ''),
('PATHS', 'DE', 'Click-Pfade', ''),
('PAGE', 'DE', 'Seite', ''),
('PAGES', 'DE', 'Seiten', ''),
('PATH', 'DE', 'Pfad', ''),
('OVERVIEW', 'DE', 'ÃƒÆ’Ã…â€œbersicht', ''),
('OTHERS', 'DE', 'Andere', ''),
('ORDERCOMP', 'DE', 'Sortierung von Layout-Klassen-Gruppen', ''),
('ORDER', 'DE', 'nach Position', ''),
('OK', 'DE', 'OK', ''),
('NUMBER_OF_INSTANCES', 'DE', 'Bitte geben Sie an, wie viele Slots Sie erzeugen mÃƒÆ’Ã‚Â¶chten.', ''),
('NO_CONTENTS', 'DE', 'In diesem Ordner existieren keine Inhalte', ''),
('NO_CLUSTER_SELECTED', 'DE', 'Kein Objekt ausgewÃƒÆ’Ã‚Â¤hlt', ''),
('NEW_FOLDER', 'DE', 'Ordner erstellen', ''),
('NEW_CONTENT', 'DE', 'Neuer Inhalt', ''),
('M_WWW', 'DE', 'Website', ''),
('M_TEMP', 'DE', 'Vorlagen', ''),
('M_TRANSLATION', 'DE', 'ÃƒÆ’Ã…â€œbersetzung', ''),
('M_ROLLOUT', 'DE', 'Website kopieren', ''),
('M_REPORT', 'DE', 'Statistiken', ''),
('M_PTEMP', 'DE', 'Seiten Vorlagen', ''),
('M_MAINTENANCE', 'DE', 'Wartung', ''),
('M_LIB', 'DE', 'Bibliothek', ''),
('CL_CREATEINSMES', 'DE', 'Es stehen noch freie Platzhalter zur VerfÃƒÆ’Ã‚Â¼gung. Wenn Sie eine neue Instanz erzeugen mÃƒÆ’Ã‚Â¶chten, geben Sie den Titel in das untenstehende Textfeld ein und klicken Sie auf die Erzeugen.', ''),
('CL_CREATEINSTANC', 'DE', 'Neues Objekt erzeugen', ''),
('CL_EDIT', 'DE', 'Objekt bearbeiten', ''),
('CL_DELMES', 'DE', 'MÃƒÆ’Ã‚Â¶chen Sie dieses Objekt wirklich lÃƒÆ’Ã‚Â¶schen? SÃƒÆ’Ã‚Â¤mtlicher Inhalte geht hiermit verloren!', ''),
('CL_DEL', 'DE', 'Objekt lÃƒÆ’Ã‚Â¶schen', ''),
('CL_PROPERTIES', 'DE', 'Objekt-Eigenschaften', ''),
('CL_NEW', 'DE', 'Neues Objekt', ''),
('CL_BROWSE', 'DE', 'Objekte', ''),
('SPM_PATH', 'DE', 'Dateipfad/Name', ''),
('SPM_CLUSTER', 'DE', 'Klasse', ''),
('SPM_TYPE', 'DE', 'Seiten-Typ', ''),
('SPM_VARIATIONS', 'DE', 'VerfÃƒÆ’Ã‚Â¼gbare Sprachen', ''),
('SPM_META', 'DE', 'META-Vorlage', ''),
('SPM_EDIT', 'DE', 'Vorlage bearbeiten', ''),
('SPM', 'DE', 'Seiten-Vorlage', ''),
('ACTIVE', 'DE', 'Seite im MenÃƒÆ’Ã‚Â¼ zeigen', ''),
('NOSPTITLE', 'DE', 'Sie mÃƒÆ’Ã‚Â¼ssen einen MenÃƒÆ’Ã‚Â¼namen definieren, bevor Sie die Seite launchen kÃƒÆ’Ã‚Â¶nnen!', ''),
('SP_EXPIRE', 'DE', 'Seite zurÃƒÆ’Ã‚Â¼ckziehen', ''),
('SP_LAUNCH', 'DE', 'VerÃƒÆ’Ã‚Â¶ffentlichen', ''),
('SP_PREVIEW', 'DE', 'Vorschau', ''),
('SP_LAUNCHDATES', 'DE', 'Zeitgesteuertes VerÃƒÆ’Ã‚Â¶ffentlichen', ''),
('SP_EXPIREDATE', 'DE', 'ZurÃƒÆ’Ã‚Â¼ckziehen am', ''),
('SP_LAUNCHDATE', 'DE', 'VerÃƒÆ’Ã‚Â¶ffentlichen ab', ''),
('SP_MENUHELP', 'DE', 'Hilfetext fÃƒÆ’Ã‚Â¼r das MenÃƒÆ’Ã‚Â¼', ''),
('SP_MENUNAME', 'DE', 'Name im MenÃƒÆ’Ã‚Â¼', ''),
('SP_MENUPROPS', 'DE', 'MenÃƒÆ’Ã‚Â¼-Name', ''),
('SP_EDIT', 'DE', 'Seite bearbeiten', ''),
('SP_CLNEW', 'DE', 'Neues Objekt', ''),
('SP_LINK', 'DE', 'Link zu Objekt', ''),
('SP_CONFDESC', 'DE', 'Sie kÃƒÆ’Ã‚Â¶nnen diese Seite mit einem Objekt verlinken oder ein neues Objekt fÃƒÆ’Ã‚Â¼r die Seite erzeugen.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES 
('SP_CONFIGURE', 'DE', 'Seite konfigurieren', ''),
('SP_PDELETE', 'DE', 'Seite lÃƒÆ’Ã‚Â¶schen', ''),
('SP_PDELMES', 'DE', 'Sie sind im Begriff eine Seite zu lÃƒÆ’Ã‚Â¶schen. Bitte beachten Sie, dass auch die verÃƒÆ’Ã‚Â¶ffentliichte Seite gelÃƒÆ’Ã‚Â¶scht wird!', ''),
('SP_DELETE', 'DE', 'Seite lÃƒÆ’Ã‚Â¶schen', ''),
('SP_DELMES', 'DE', 'Sie sind im Begriff eine Seite zu lÃƒÆ’Ã‚Â¶schen. Bitte beachten Sie, dass auch die verÃƒÆ’Ã‚Â¶ffentliichte Seite gelÃƒÆ’Ã‚Â¶scht wird!', ''),
('SP_PROPERTIES', 'DE', 'Eigenschaften', ''),
('SP_IPROPERTIES', 'DE', 'Seiteneinstellungen', ''),
('SP_NEWINSTANCE', 'DE', 'Neue Seite', ''),
('SP_NEWPAGE', 'DE', 'Neue Seite', ''),
('SP_BROWSE', 'DE', 'Website', ''),
('PO_EDIT', 'DE', 'Portalseite bearbeiten', ''),
('PO_MYPORTAL', 'DE', 'Meine Portale', ''),
('PO_CRSUCCEEDED', 'DE', 'Neues Portal erfolgreich erstellt!', ''),
('PO_OWNER', 'DE', 'Seiten-Besitzer', ''),
('PO_BROWSER', 'DE', 'Portal-Browser', ''),
('M_COMBOBJ', 'DE', 'kombinierte Inhalte (Objekte)', ''),
('M_CLUSTERS', 'DE', 'Objekte', ''),
('M_CLT', 'DE', 'Klassen', ''),
('M_BACKUP', 'DE', 'Datensicherung', ''),
('M_ADMIN', 'DE', 'Verwaltung', ''),
('M_ACCESS', 'DE', 'Benutzerverwaltung', ''),
('MT_TITLE', 'DE', 'Wartung', ''),
('MT_SPIDER', 'DE', 'Spider laufen lassen', ''),
('MT_GENERATE_DTA_SUCCEEDED', 'DE', '<br><br>Daten wurden erfolgreich generiert und in die Datei geschrieben.<br>', ''),
('MT_GENERATE_DTA_MES', 'DE', 'Datentypen generieren', ''),
('MT_GENERATE_DTA_', 'DE', 'Datentypen generieren', ''),
('MT_GENERATE_DTA', 'DE', 'Datentypen generieren', ''),
('MT_DW_CONTENTFIELDINFO', 'DE', 'Dreamweaver Inhalts-Feld-Info', ''),
('MT_DW_CONTENTFIE', 'DE', 'Dreamweaver Inhalts-Feld-Info', ''),
('MT_DW_CONTENT', 'DE', 'Dreamweaver PlugIn', ''),
('MINIMUMAT', 'DE', 'Minimum bei', ''),
('MINIMUM', 'DE', 'Minimum', ''),
('MENU', 'DE', 'MenÃƒÆ’Ã‚Â¼', ''),
('MEDIAN', 'DE', 'Median', ''),
('MAXIMUMAT', 'DE', 'Maximum bei', ''),
('MAXIMUM', 'DE', 'Maximum', ''),
('LONGEST_PATHS', 'DE', 'LÃƒÆ’Ã‚Â¤ngste Pfade', ''),
('LOGS', 'DE', 'Log-Datei Analyse', ''),
('LOGGED_AS', 'DE', 'Eingeloggt als', ''),
('LOCK_MENU', 'DE', 'Kinderseiten verbieten', ''),
('LOCATION', 'DE', 'Verweisziel, falls extern', ''),
('LIVE_AUTHORING', 'DE', 'WYSIWYG-Editor', ''),
('LIBRARY', 'DE', 'Inhalts-Bibliothek', ''),
('LAUNCH', 'DE', 'VerÃƒÆ’Ã‚Â¶ffentlichen', ''),
('EXP_TREE', 'EN', 'Unpublish Tree', ''),
('LASTYEAR', 'DE', 'Letztes Jahr', ''),
('LASTWEEK', 'DE', 'Letzte Woche', ''),
('LASTMONTH', 'DE', 'Letzter Monat', ''),
('I_AFTER', 'DE', 'EinfÃƒÆ’Ã‚Â¼gen nach', ''),
('IS_COMPOUND', 'DE', 'Layout-Klasse', ''),
('IS_FILTERED', 'DE', 'Hinweis: MÃƒÆ’Ã‚Â¶glicherweise werden nicht alle DatensÃƒÆ’Ã‚Â¤tze angezeigt, weil ein Filter verwendet wird.', ''),
('INSTANCE_CREATED', 'DE', 'Eine neue Instanz des Elements wurde erzeugt.', ''),
('INSNAME', 'DE', '<Objektname>', ''),
('IND_TIME', 'DE', 'Individuelles Intervall', ''),
('HOURS_AS', 'DE', 'Stunden-Analyse', ''),
('HOUR', 'DE', 'Stunden', ''),
('HELP', 'DE', 'Hilfe', ''),
('GO', 'DE', 'GO', ''),
('GROUP_DESCRIPTION', 'DE', 'Beschreibung', ''),
('FOLDER_DELMES', 'DE', 'MÃƒÆ’Ã‚Â¶chen Sie diesen Ordner wirklich lÃƒÆ’Ã‚Â¶schen ?', ''),
('ENVIRONMENT', 'DE', 'Umgebung', ''),
('EXPLORE', 'DE', 'Durchsuchen', ''),
('FILTER_COLUMN', 'DE', '...in', ''),
('FILTER_RULE', 'DE', 'Suche nach...', ''),
('ED_CPGROUPGENERAL', 'DE', 'Allgemeines', ''),
('ED_CPGROUP', 'DE', 'Layout-Klassen-Gruppe bearbeiten', ''),
('EDIT_TEMPLATE', 'DE', 'Vorlage bearbeiten', ''),
('EDIT_SPM', 'DE', 'Allgemeine Einstellungen', ''),
('EDIT_ALL', 'DE', 'Alles bearbeiten', ''),
('EDIT_CONTENT', 'DE', 'Inhalt bearbeiten', ''),
('EDIT_FOLDER', 'DE', 'Ordner bearbeiten', ''),
('EDIT_ACCESS', 'DE', 'Rechte', ''),
('DWEXT_CONTENTFIE', 'DE', 'Inhalts-Feld-Informationen erzeugen', ''),
('DATE', 'DE', 'Datum', ''),
('DEL_FOLDER', 'DE', 'Ordner lÃƒÆ’Ã‚Â¶schen', ''),
('DESC', 'DE', 'Beschreibung', ''),
('DISPLAY', 'DE', 'Anzeigen', ''),
('CREATE_INSTANCES', 'DE', 'Slots erzeugen', ''),
('CR_CONTENT', 'DE', 'Inhalt fÃƒÆ’Ã‚Â¼r diese Seite erzeugen?', ''),
('COUNT', 'DE', 'Anzahl', ''),
('CPG_MEMBERS_SELECT', 'DE', 'Mitglieder dieser Layout-Klassen-Gruppe auswÃƒÆ’Ã‚Â¤hlen', ''),
('CP_GROUP', 'DE', 'Layout-Klassen-Gruppe', ''),
('COLOR', 'DE', 'Farbe', ''),
('COMB_ALL', 'DE', 'Alles auswÃƒÆ’Ã‚Â¤hlen', ''),
('COMB_NONE', 'DE', 'Auswahl lÃƒÆ’Ã‚Â¶schen', ''),
('COMMENT', 'DE', 'Kommentar', ''),
('CONTENT', 'DE', 'Inhalte', ''),
('CONTENT_DESC', 'DE', 'Beschreibung', ''),
('CL_NAME', 'DE', 'Objektname', ''),
('CAL_NAME', 'DE', 'Name', ''),
('CATEGORY', 'DE', 'Kategorie', ''),
('CAT_NAME', 'DE', 'Kategorie', ''),
('CLEAR_MEDIA', 'DE', 'Datei aus Datenbank entfernen', ''),
('CLK_PATHS', 'DE', 'Klick-Pfade', ''),
('CAL_EDIT', 'DE', 'Termin bearbeiten', ''),
('CALENDAR_SELECT', 'DE', 'Kalender auswÃƒÆ’Ã‚Â¤hlen', ''),
('CALENDARS_EDIT', 'DE', 'Kalender bearbeiten', ''),
('CALENDARS_TIPP', 'DE', 'Sie kÃƒÆ’Ã‚Â¶nnen hier verschiedene Kalender erstellen. Jeder Kalender hat seine eigenen Termine und Ereignisse.', ''),
('CALENDARS_DEFINE', 'DE', 'Kalender erstellen', ''),
('CALENDAR', 'DE', 'Kalender', ''),
('CALENDARS', 'DE', 'Kalender', ''),
('CALENDARS_CAT_DEFINE', 'DE', 'Kategorien bearbeiten', ''),
('CACHED', 'DE', 'Seite cachen', ''),
('BEGIN', 'DE', 'Start', ''),
('BAK_FILE', 'DE', 'Sicherungs-Datei', ''),
('BACKUP', 'DE', 'Sicherung', ''),
('BACK_INFO', 'DE', 'Die untenstehende Liste zeigt die auf Ihrem Server verfÃƒÆ’Ã‚Â¼gbaren Sicherungen an. Sie kÃƒÆ’Ã‚Â¶nnen hier einzelne Sicherungen lÃƒÆ’Ã‚Â¶schen. Um eine Sicherung zurÃƒÆ’Ã‚Â¼ck zu spielen, mÃƒÆ’Ã‚Â¼ssen Sie sich manuell auf Ihrem Server einloggen und die Dateien wiederherstellen.', ''),
('AVG_VIS_LENGTH', 'DE', 'Durchschnittliche Besuchsdauer (Sekunden)', ''),
('AVG_VISIT_LENGTH', 'DE', 'Durchschnittliche Besuchsdauer (Klicks)', ''),
('AVG_CLICKSTREAM', 'DE', 'Durchschnittlicher Klick-Pfad', ''),
('AVAIL_VARIATIONS', 'DE', 'VerfÃƒÆ’Ã‚Â¼gbare Sprachen', ''),
('AVERAGE', 'DE', 'Durchschnitt', ''),
('ACL_PARENT', 'DE', 'Rechte geerbt von', ''),
('ACL_ROLE', 'DE', 'Rollen zu Gruppe zuordnen', ''),
('ACL_TITLE', 'DE', 'Setze Berechtigungen fÃƒÆ’Ã‚Â¼r', ''),
('AFTER', 'DE', 'Nach:', ''),
('ALC_OWNER', 'DE', 'EigentÃƒÆ’Ã‚Â¼mer bestimmen', ''),
('AVAIL_ITEMS', 'DE', 'VerfÃƒÆ’Ã‚Â¼gbare Elemente', ''),
('ACL_INHERIT_NOTE', 'DE', 'Hinweis: Wenn dieses Feld markiert ist, ist keine andere Konfiguration verfÃƒÆ’Ã‚Â¼gbar!', ''),
('ACL_OWNER', 'DE', 'EigentÃƒÆ’Ã‚Â¼mer', ''),
('ACL_GROUPS', 'DE', 'Gruppe auswÃƒÆ’Ã‚Â¤hlen und hinzufÃƒÆ’Ã‚Â¼gen', ''),
('ACL_GROUPSROLES', 'DE', 'Fremdzugriff', ''),
('ACL_INFO', 'DE', 'Zugriffsrechte vom Elternobjekt erben', ''),
('ACL_INHERIT', 'DE', 'Berechtigungen vom Elternobjekt erben', ''),
('PURGE_EXPIRED', 'DE', 'ZurÃƒÆ’Ã‚Â¼ckgezogene Seiten bereinigen', ''),
('ACL_ACCESS', 'DE', 'Rechte in Gruppen berabeiten', ''),
('ACL_GROUPEDIT', 'DE', 'Gruppe fÃƒÆ’Ã‚Â¼r Rollen-Bearbeitung auswÃƒÆ’Ã‚Â¤hlen', ''),
('PURGE_META', 'DE', 'Meta bereinigen', ''),
('PURGE_CLT', 'DE', 'Klassen bereinigen', ''),
('PURGE_PAGES', 'DE', 'Seiten und Vorlangen bereinigen', ''),
('PURGE_FOLDER', 'DE', 'Ordner bereinigen', ''),
('PURGE_CLUSTER', 'DE', 'Objekte bereinigen', ''),
('VAR_SUCCEEDED', 'DE', 'war erfolgreich.', ''),
('PURGE_VAR', 'DE', 'Sprachen bereinigen', ''),
('PURGE_CONTENT', 'DE', 'Inhalte bereinigen', ''),
('ERROR', 'DE', 'WÃƒÆ’Ã‚Â¤hrend der AusfÃƒÆ’Ã‚Â¼hrung der gewÃƒÆ’Ã‚Â¤hlten Operation ist ein Fehler aufgetreten!', ''),
('PURGE', 'DE', 'Datenbank bereinigen', ''),
('PURGE_MES', 'DE', 'Bitte wÃƒÆ’Ã‚Â¤hlen Sie die Teile der Datenbank, die Sie bereinigen mÃƒÆ’Ã‚Â¶chten.', ''),
('RESET', 'DE', 'Reset', ''),
('BACK', 'DE', 'ZurÃƒÆ’Ã‚Â¼ck', ''),
('CREATE', 'DE', 'Element erstellen', ''),
('SEARCH_LIVE_ACRTICLES', 'DE', 'VerÃƒÆ’Ã‚Â¶ffentlichte Artikel', ''),
('SEASRCH_MISSING_VARIATIONS', 'DE', 'Fehlende ÃƒÆ’Ã…â€œbersetzungen', ''),
('SEL_CH', 'DE', 'Kanal auswÃƒÆ’Ã‚Â¤hlen', ''),
('SEL_CLUSTER', 'DE', 'Objekt auswÃƒÆ’Ã‚Â¤hlen', ''),
('SEL_EVENT', 'DE', 'Ereignis oder Termin speichern', ''),
('SEL_PTML', 'DE', 'Seiten-Vorlage auswÃƒÆ’Ã‚Â¤hlen', ''),
('SEL_VAR', 'DE', 'Sprache auswÃƒÆ’Ã‚Â¤hlen', ''),
('SHOW', 'DE', 'anzeigen', ''),
('SHOW_ADVANCED_SEARCH', 'DE', 'Erweiterte Suchoptionen anzeigen', ''),
('SHOW_ALL', 'DE', 'Alles anzeigen', ''),
('SHOW_PAGEWISE', 'DE', 'seitenweise', ''),
('STARTDATE', 'DE', 'Startdatum', ''),
('STARTTIME', 'DE', 'Startzeit', ''),
('SYNC_CLUSTERS_DESCR', 'DE', 'Wenn Sie eine Klasse ÃƒÆ’Ã‚Â¤ndern, werden die Objekte nicht automatisch synchronisiert. Sie werden synchronisiert, wenn Sie das nÃƒÆ’Ã‚Â¤chste mal mit ihnen arbeiten. Hier kÃƒÆ’Ã‚Â¶nnen Sie alle manuell synchronisieren.', ''),
('TOP_ENTRYPAGES', 'DE', 'Top Eingangsseiten', ''),
('TOP_EXITPAGES', 'DE', 'Top Ausgangsseiten', ''),
('TOP_PAGES', 'DE', 'Top Seiten', ''),
('TRANS_TEMPL', 'DE', 'ÃƒÆ’Ã…â€œbersetzen von', ''),
('TRANS_THIS', 'DE', 'ÃƒÆ’Ã…â€œbersetzen Sie:', ''),
('UPL_TEXT', 'DE', 'Text-Datei hochladen', ''),
('WZE_ARTICLEIMPORT_SRCTYPE', 'DE', 'Bitte geben Sie den Quellen-Typ an, aus dem Sie die Artikel importieren mÃƒÆ’Ã‚Â¶chten.', ''),
('WZE_ARTICLEIMPORT_TARGET', 'DE', 'Bitte wÃƒÆ’Ã‚Â¤hlen Sie rechts den Ziel-Kanal aus. Alle importierten Artikel werden in diesem Kanal gespeichert.', ''),
('WZT_ARTICLEIMPORT_SRCTYPE', 'DE', 'Quellen-Typ auswÃƒÆ’Ã‚Â¤hlen', ''),
('WZT_ARTICLEIMPORT_TARGET', 'DE', 'Ziel-Kanal auswÃƒÆ’Ã‚Â¤hlen', ''),
('WZT_KEEPCLUSTER', 'DE', 'Bestehende Objekte beibehalten?', ''),
('WZT_KEEPCLUSTER_EXPL', 'DE', 'Sie kÃƒÆ’Ã‚Â¶nnen festlegen, ob Sie die bestehenden Objekte beibehalten mÃƒÆ’Ã‚Â¶chten oder lieber Kopien von jedem Cluster anlegen wollen.<br><br>Beachten Sie: Wenn Sie die bestehenden Objekte beibehalten, teilen Sie sie sich mit der ursprÃƒÆ’Ã‚Â¼nglichen Quelle.', ''),
('WZ_ARTICLEIMPORT', 'DE', 'Artikel-Import Assistent', ''),
('WZ_ARTICLEIMPORT_TITLE', 'DE', 'Der Assistent hilft Ihnen, Artikel  aus unterschiedlichen Quellen in einen Kanal zu laden.', ''),
('USER_JS', 'EN', 'Use Javascript', ''),
('USER_BL', 'EN', 'Backend Language', ''),
('PO_BROWSER', 'EN', 'Portal Browser', ''),
('PO_OWNER', 'EN', 'Page Owner', ''),
('PO_CRSUCCEEDED', 'EN', 'The creation of a new portal page succeeded!', ''),
('PO_MYPORTAL', 'EN', 'My Portals', ''),
('PO_EDIT', 'EN', 'Edit Portalpage', ''),
('SP_BROWSE', 'EN', 'Browse Website', ''),
('SP_NEWPAGE', 'EN', 'Add Page', ''),
('SP_NEWINSTANCE', 'EN', 'Add Page', ''),
('SP_IPROPERTIES', 'EN', 'Page Properties', ''),
('SP_PROPERTIES', 'EN', 'Properties', ''),
('SP_DELMES', 'EN', 'You are about to delete a sitepage. Please note, that also already published pages will be deleted', ''),
('SP_DELETE', 'EN', 'Delete Page', ''),
('SP_PDELMES', 'EN', 'You are about to delete a page. Please note, that also the published page will be deleted!', ''),
('SP_PDELETE', 'EN', 'Delete Page', ''),
('SP_CONFIGURE', 'EN', 'Configure Page', ''),
('SP_CONFDESC', 'EN', 'You can link this sitepage with an object or you can create a new object.', ''),
('SP_LINK', 'EN', 'Link to object', ''),
('SP_CLNEW', 'EN', 'New Object', ''),
('SP_EDIT', 'EN', 'Edit Page', ''),
('SP_MENUPROPS', 'EN', 'Page Menu', ''),
('SP_MENUNAME', 'EN', 'Menu Title', ''),
('SP_MENUHELP', 'EN', 'Helptext for Menu', ''),
('SP_LAUNCHDATE', 'EN', 'Publish Date', 'Note: the page must be manually published in order to be published on a defined date!'),
('SP_EXPIREDATE', 'EN', 'Unpublish Date', ''),
('SP_LAUNCHDATES', 'EN', 'Automatic Publishing', ''),
('SP_PREVIEW', 'EN', 'Preview', ''),
('SP_LAUNCH', 'EN', 'Publish', ''),
('SP_EXPIRE', 'EN', 'Unpublish Page', ''),
('NOSPTITLE', 'EN', 'You have to define the menu title before you can launch the page!', ''),
('ACTIVE', 'EN', 'Show Page in Menu', 'When you uncheck this box, the page will no longer be displayed in the menu of the website.'),
('SPM', 'EN', 'Page Template', ''),
('SPM_EDIT', 'EN', 'Edit Template', ''),
('SPM_META', 'EN', 'META-Data Template', ''),
('SPM_VARIATIONS', 'EN', 'Displayable Languages', 'Select the langauges, this template is valid for.'),
('SPM_TYPE', 'EN', 'Page Type', 'Please select always singlepage. Multipage is mature and is there for compatiblity reasons only. Use channels instead.'),
('SPM_CLUSTER', 'EN', 'Class', ''),
('SPM_PATH', 'EN', 'Template Path', 'Filename of the php-file which will be called when you use the page. The file will be created in wwwdev and copied to www after launch.'),
('CL_BROWSE', 'EN', 'Browse Objects', ''),
('CL_NEW', 'EN', 'Create Object', ''),
('CL_PROPERTIES', 'EN', 'Object Properties', ''),
('CL_DEL', 'EN', 'Delete Instance', ''),
('CL_DELMES', 'EN', 'Do you really want to delete this instance of the object. All content data will be lost!', ''),
('CL_EDIT', 'EN', 'Edit Object', ''),
('CL_CREATEINSTANC', 'EN', 'Create new Instance', ''),
('CL_CREATEINSMES', 'EN', 'There are still slots left for creating additional instances of this content-field. If you want to create another instance, then enter a title in the textfield below and press the Create button.', ''),
('CL_NOTITLE', 'EN', 'No title defined yet', ''),
('TITLE', 'EN', 'Title', ''),
('CLI_EDIT', 'EN', 'Edit Object member', ''),
('CLI_DELETE', 'EN', 'Delete Object member', ''),
('CLI_DELETEMES', 'EN', 'Do you really want to delete this object?', ''),
('CLI_DELETED', 'EN', 'The object was successfully deleted.', ''),
('CLI_NOTDELETED', 'EN', 'This object cannot be deleted!', ''),
('CLI', 'EN', 'Object:', ''),
('SR_SELECTCI', 'EN', 'You can search for any content-items here. If you want to select a content-item, then choose it and press the Update button! If you want to connect new content with this field, create the content in the Object Browser first.', ''),
('SR_SELECTCLI', 'EN', 'Please select a class. Afterwards you can select an instance of the template for use.', ''),
('FOLDER', 'EN', 'Folder', ''),
('CONTENTTYPE', 'EN', 'Content-Type', ''),
('CONTENTITEM', 'EN', 'Content-Item', ''),
('SEARCH', 'EN', 'Start Search', ''),
('SEARCHIN', 'EN', 'Search for', ''),
('SEARCHRESULTS', 'EN', 'Search results, please select', ''),
('SELECTEDOBJECT', 'EN', 'Currently Selected Content-Item', ''),
('SELECTEDINSTANCE', 'EN', 'Selected Object', ''),
('M_META', 'EN', 'Meta-Data Templates', ''),
('M_BROWSER', 'EN', 'Object Browser', ''),
('M_INSTALLPLUGIN', 'EN', 'Plugins', ''),
('M_ES', 'EN', 'Explore Site', ''),
('M_SPM', 'EN', 'Page Templates', ''),
('M_PRTMAN', 'EN', 'Portal Manager', ''),
('M_MYPRT', 'EN', 'My Portals', ''),
('M_MYPROFILE', 'EN', 'Settings', ''),
('M_LOGOUT', 'EN', 'Sign Out', ''),
('M_CLB', 'EN', 'Browse Objects', ''),
('M_CLTB', 'EN', 'Class Browser', ''),
('M_UMAN', 'EN', 'User Mangement', ''),
('M_VAR', 'EN', 'Languages', ''),
('M_PURGE', 'EN', 'Clean up Database', ''),
('M_PGN', 'EN', 'Plugin Administration', ''),
('M_REPORT', 'EN', 'Statistics', ''),
('CLT_NEW', 'EN', 'New Class', ''),
('CLT_BROWSE', 'EN', 'Browse Classes', ''),
('CLT_NAME', 'EN', 'Class Name', ''),
('CLT_PROPERTIES', 'EN', 'Class Properties', ''),
('CLT_DELETE', 'EN', 'Delete Class', ''),
('CLT_DELMES', 'EN', 'You are about to delete a class. This will cause the loss of all(!) objects that are based on that class. Are you sure, you want to procceed?', ''),
('CLTI_DELETE', 'EN', 'Do you really want to delete this Item. All instances of this item will be lost also!', ''),
('CLT_SCHEME', 'EN', 'Edit Class', ''),
('CLT_MINCARD', 'EN', 'Instances', ''),
('CLT_MAXCARD', 'EN', '-', ''),
('LINKED', 'EN', 'Linked to', ''),
('PG_INSTALLDESC', 'EN', 'Please make sure that you copied all neccessary files into the folder, before succeeding. Insert the correct path to the plugin in the Input-field below. The system will then install the  plugin automatically.', ''),
('PG_CHOOSE', 'EN', 'Plugin: Ãƒâ€šÃ‚Â  /plugin/', ''),
('PG_FILEWRONG', 'EN', 'The filename you entered could not be found on the server!', ''),
('CLASS_WRONG', 'EN', 'The file you specified has no valid class signature!', ''),
('PG_INSTALLED', 'EN', 'The Plugin was successfully installed!', ''),
('PG_UPGRADED', 'EN', 'The Plug-In was successfully upgraded!', ''),
('PG_ERROR', 'EN', 'There was an error while installing the plugin!', ''),
('PG_ALREADYINSTAL', 'EN', 'The PlugIn is already installed!', ''),
('PG_NEWERINSTALLE', 'EN', 'There is already a newer version of this Plugin installed!', ''),
('PG_TITLE', 'EN', 'Plugins', ''),
('PG_INSTALL', 'EN', 'Install Plugin', ''),
('PG_UNINSTALL', 'EN', 'Uninstall PlugIn', ''),
('PG_UNINSTALLMES', 'EN', 'You are about to uninstall a module. Uninstalling a module does not only remove the content-type but also deletes every single object of this type that is stored in the database. The uninstallation will definitely delete all data of this plugin!', ''),
('PG_UNINSTALLDELE', 'EN', 'Uninstall Plugin,<br> Delete all correspondig contents.', ''),
('O_NEW', 'EN', 'New Object', ''),
('O_NAME', 'EN', 'Object Name', ''),
('O_PROPERTIES', 'EN', 'Object Properties', ''),
('O_DELMES', 'EN', 'You are about to delete an object. <b>Note that all languages-versions and META-DATA will be lost!</b>', ''),
('O_DEL', 'EN', 'Delete object', ''),
('O_EDIT', 'EN', 'Edit Object', ''),
('O_PREVIEW', 'EN', 'Preview of', ''),
('O_TEXT', 'EN', 'Text', ''),
('O_ALT', 'EN', 'ALT-Tag', ''),
('O_COPYRIGHT', 'EN', 'Copyright', ''),
('O_BROWSE', 'EN', 'Browse Objects', ''),
('R_HOME', 'EN', 'Start', ''),
('R_NEWFOLDER', 'EN', 'New Folder', ''),
('R_EDITFOLDER', 'EN', 'Edit Folder Properties', ''),
('R_FOLDERNAME', 'EN', 'Folder Name', ''),
('R_DELETEFOLDER', 'EN', 'Delete Folder', ''),
('R_DELFOLDERMES', 'EN', 'You are about to delete a Folder.  Please select an action.', ''),
('R_FOLDERNOTEMPTY', 'EN', 'This folder is not empty. Only empty folders can be deleted in N/X! Please check all Objects and Contents!', ''),
('R_DELFOLDER', 'EN', 'Delete Folder and all contents', ''),
('R_MOVEOBJECTS', 'EN', 'Move all objects to parent node', ''),
('R_PARENT', 'EN', 'Parent Folder', ''),
('METATEMPLATES', 'EN', 'Meta-Data Templates', ''),
('MT_PROPERTIES', 'EN', 'Edit Properties', ''),
('MT_SCHEME', 'EN', 'Edit Meta-Template', ''),
('MT_DELETE', 'EN', 'Do you really want to delete this part of the meta-template? All information entered in any META-Input in CMS linked to this part will be deleted. The data is going to be lost forever!', ''),
('MT_ADDITIONAL', 'EN', 'Additional META-Data', ''),
('MT_BASE', 'EN', 'Basic META-Data', ''),
('MT_MODULE', 'EN', 'Content-Type specific META-Data', ''),
('VARIATIONS', 'EN', 'Available Languages', ''),
('V_NAME', 'EN', 'Name', ''),
('V_SHORT', 'EN', 'Short-Tag', ''),
('V_EDIT', 'EN', 'Edit Languages', ''),
('LOGIN_FAILED', 'EN', 'The login failed. Please check your username and password.', ''),
('USER_HEAD', 'EN', 'User profile', ''),
('USER_LINK', 'EN', 'User profiles', ''),
('USER_NAME', 'EN', 'Username', ''),
('FULL_NAME', 'EN', 'Full Name', ''),
('PASSWORD', 'EN', 'Password', ''),
('USER_EMAIL', 'EN', 'eMail', ''),
('USER_ACTIVE', 'EN', 'Enable Account', ''),
('USER_FILTERMENU', 'EN', 'User Administration', ''),
('USER_SETPERM', 'EN', 'Set User Permissions below. To remove a user form a group, just revoke all groups from him.', ''),
('USER_PERMGRID', 'EN', 'Permission Grid', ''),
('GROUP_LINK', 'EN', 'Group profiles', ''),
('GROUP_HEAD', 'EN', 'Group profile', ''),
('GROUP_NAME', 'EN', 'Group name', 'You can create groups of objcts, e.g. banners, and name these groups.'),
('GROUP_DESCRIPTIO', 'EN', 'Description', ''),
('GROUP_FILTERMENU', 'EN', 'Group Administration', ''),
('ROLE_LINK', 'EN', 'Role Profiles', ''),
('ROLE_HEAD', 'EN', 'Role Profile', ''),
('ROLE_NAME', 'EN', 'Role Name', ''),
('ROLE_DESCRIPTION', 'EN', 'Description', ''),
('ROLE_FILTERMENU', 'EN', 'Role Administration', ''),
('USER_PERMISSIONS', 'EN', 'User Permissions', ''),
('UP_INTRO', 'EN', 'Please select the group and afterwards the roles in the group, you want to add to the user.', ''),
('USER_TO_GROUP', 'EN', 'Add user to group', ''),
('ERROR_SEL_GROUP', 'EN', 'You must select a group!', ''),
('ERROR_SEL_ROLE', 'EN', 'You must select at least one role!', ''),
('USER_PROFILE', 'EN', 'Personal Settings', ''),
('COMMIT', 'EN', 'Commit', ''),
('CANCEL', 'EN', 'Cancel', ''),
('YES', 'EN', 'Yes', ''),
('NO', 'EN', 'No', ''),
('NEW', 'EN', 'Create New', ''),
('NAME', 'EN', 'Name', ''),
('DESCRIPTION', 'EN', 'Description', ''),
('DOSOMETHING', 'EN', 'Please select the action you want to apply. You can insert new items, edit items, delete items and change the order of items.', ''),
('EDIT', 'EN', 'Edit', ''),
('UP', 'EN', 'Up', ''),
('DOWN', 'EN', 'Down', ''),
('CONTAINERNAME', 'EN', 'Template', ''),
('SELECTOBJECT', 'EN', 'Please select a class and specify a position and a name for creating a new object.<br>For position use 0 for inserting at the begin, 999 for inserting at the end and any other position of your choice.', ''),
('POSITION', 'EN', 'Position', 'Pages are ordered by their position in the tree of the website.'),
('DELETE', 'EN', 'Delete', ''),
('TYPE', 'EN', 'Type', ''),
('KEYWORDS', 'EN', 'Keywords', ''),
('METATEMPLATE', 'EN', 'Additional META-Key-Template', 'Select a Meta-Template if you want to add meta-data to a cluster.'),
('SELECT_VARIATION', 'EN', 'Select Variation', ''),
('ACTIVE_VARIATION', 'EN', 'Active Language:', ''),
('NO_VARIATIONS', 'EN', 'There are actually no language-versions of this object defined!<br>Please call a developer for checking the configuration of the selected item!', ''),
('ED_CONTENT', 'EN', 'Content', ''),
('ED_META', 'EN', 'META-Data', ''),
('ED_DISPATCHER', 'EN', 'Use this button for switching between Editing of META-Data and Editing of Content.', ''),
('PREVIEW', 'EN', 'Preview', ''),
('CHOOSEFILE', 'EN', 'Choose a file', ''),
('CONFIGURED', 'EN', 'Ready to use.', ''),
('NOTCONFIGURED', 'EN', 'Not configured yet.', ''),
('CONFIG', 'EN', 'Configure', ''),
('SELECT_CI', 'EN', 'Select a Content-Item', ''),
('SELECT_CL', 'EN', 'Select a Cluster-Instance', ''),
('EMPTY', 'EN', '<empty>', ''),
('STATUS', 'EN', 'Status:', ''),
('UNIQUE', 'EN', 'The value you entered already exsists.', ''),
('MANDATORY', 'EN', 'This field cannot be empty!', ''),
('NOTNUMBER', 'EN', 'Please enter a valid number!', ''),
('WRONGDATE', 'EN', 'Wrong date!', ''),
('PWDNOTMATCH', 'EN', 'The passwords you entered do not match!', ''),
('PWDTOOSHORT', 'EN', 'The password must have a length of at least 6 chars!', ''),
('PROCERROR', 'EN', 'An error occured while processing the form. Please check the marked fields and read there for further information.', ''),
('SAVEERROR', 'EN', 'An error occured while saving the data to the database. Please make sure, the database is connected or call your Administrator.', ''),
('SAVESUCCESS', 'EN', 'The data was successfully written to the database.', ''),
('DELETESUCCESS', 'EN', 'The data listed below was successfully deleted from the database.', ''),
('SELECTONE', 'EN', 'Please make your choice.', ''),
('CREATENEW', 'EN', 'A new member of this template was created. See the data listed below.', ''),
('PROMPTDELETE', 'EN', 'Do you really want to delete this record?', ''),
('RESET', 'EN', 'Reset', ''),
('BACK', 'EN', 'Back', ''),
('CREATE', 'EN', 'Create Item', ''),
('ERROR', 'EN', 'An error occured while doing the selected operation!', ''),
('PURGE', 'EN', 'Clean Up Database', ''),
('PURGE_MES', 'EN', 'Please select the parts of the database, you want to clean up.', ''),
('PURGE_VAR', 'EN', 'Purge Languages', ''),
('PURGE_CONTENT', 'EN', 'Purge Content', ''),
('VAR_SUCCEEDED', 'EN', 'succeeded!', ''),
('PURGE_FOLDER', 'EN', 'Purge Folders', ''),
('PURGE_CLUSTER', 'EN', 'Purge Objects', ''),
('PURGE_META', 'EN', 'Purge Meta-Data', ''),
('PURGE_CLT', 'EN', 'Purge Classes', ''),
('PURGE_PAGES', 'EN', 'Purge Pages and Templates', ''),
('PURGE_EXPIRED', 'EN', 'Purge Expired Pages', ''),
('EDIT_ALL', 'EN', 'Edit All', ''),
('SAVE', 'EN', 'Save', ''),
('LIVE_AUTHORING', 'EN', 'Live Authoring', ''),
('INSTANCE_CREATED', 'EN', 'A new instance of the item was created.', ''),
('GO', 'EN', 'GO', ''),
('CACHED', 'EN', 'Cache Page', 'N/X is able to create static HTML-files for the website. Whenever the\r\ncheckbox is checked, the system will create a static HTML-page.'),
('MENU', 'EN', 'Menu', ''),
('RB_CACHE', 'EN', 'Rebuild Cache', ''),
('LOGGED_AS', 'EN', 'Logged in as', ''),
('M_ACCESS', 'EN', 'User Administration', ''),
('M_MAINTENANCE', 'EN', 'Maintenance', ''),
('M_WWW', 'EN', 'Website', ''),
('M_TEMP', 'EN', 'Templates', ''),
('M_ROLLOUT', 'EN', 'Copy Website', ''),
('M_LIB', 'EN', 'Content Library', ''),
('M_COMBOBJ', 'EN', 'Combined Contents (Cluster)', ''),
('M_CLT', 'EN', 'Classes', ''),
('RL_PERM', 'EN', 'Role Permissions', ''),
('MT_TITLE', 'EN', 'Maintenance', ''),
('MT_GENERATE_DTA', 'EN', 'Update DB-Info', ''),
('MT_DW_CONTENTFIE', 'EN', 'Dreamweaver Content-Field-Info', ''),
('MT_GENERATE_DTA_', 'EN', 'Generate database information', ''),
('DWEXT_CONTENTFIE', 'EN', 'Generate Content-Field-Information', ''),
('SPM_RLAUNCH', 'EN', 'Refresh Pages', ''),
('SP_RLTREE', 'EN', 'Republish Tree', ''),
('SP_MENUDIRECTTIT', 'EN', 'Define optinal URL on server for direct access', ''),
('SP_MENUDIRECT', 'EN', 'URL on Live Server', ''),
('TMPL_NAME', 'EN', 'Select a template', ''),
('STNAME', 'EN', 'Select a name to identify the page in the sitemap. The name you selected and the menu title can be different!', ''),
('POS_IN_MENU', 'EN', 'Position in sitemap', 'Pages are ordered by their position in the tree of the website.'),
('CR_CONTENT', 'EN', 'Create Content for this page?', ''),
('CLEAR_MEDIA', 'EN', 'Remove file from database', ''),
('DESC', 'EN', 'Description', ''),
('LOCATION', 'EN', 'Location, if external', ''),
('CONTENT', 'EN', 'Content', ''),
('M_CLUSTERS', 'EN', 'Objects', ''),
('M_PTEMP', 'EN', 'Page Templates', ''),
('MT_SPIDER', 'EN', 'Search Indexing', ''),
('MT_DW_CONTENTFIELDINFO', 'EN', 'Dreamweaver Content-Field-Info', ''),
('LOGS', 'EN', 'Logfile', ''),
('TESTS', 'EN', 'N/X Unit Tests', ''),
('M_ADMIN', 'EN', 'Administration', ''),
('M_BACKUP', 'EN', 'Backup', ''),
('M_TRANSLATION', 'EN', 'Backend Translation', ''),
('PTEMPL', 'EN', 'Page Template', ''),
('SP_MENUDIRECTTITLE', 'EN', 'Define optional Path on server for direct access.', 'Sometimes you may want to access a page with a name instead of an IP-address, e.g.\r\nwww.news.fi/oulu instead of www.news.fi/www/p100211_v1.html. You enter\r\nthe Path here.'),
('LIBRARY', 'EN', 'Content Library', ''),
('NEW_CONTENT', 'EN', 'New Content', ''),
('NEW_FOLDER', 'EN', 'Create Folder', ''),
('EDIT_FOLDER', 'EN', 'Edit Folder', ''),
('DEL_FOLDER', 'EN', 'Delete Folder', ''),
('EDIT_ACCESS', 'EN', 'Permissions', ''),
('USAGE', 'EN', 'Usage', ''),
('LAUNCH', 'EN', 'Publish', ''),
('AVAIL_VARIATIONS', 'EN', 'Available languages', ''),
('NO_CONTENTS', 'EN', 'No content available in this folder.', ''),
('EDIT_CONTENT', 'EN', 'Edit Content', ''),
('CONTENT_DESC', 'EN', 'Description of Content', ''),
('SAVE_BACK', 'EN', 'Save and Back', ''),
('PROPERTIES', 'EN', 'Properties', ''),
('RESET_FORM', 'EN', 'Reset', ''),
('NO_CLUSTER_SELECTED', 'EN', 'No object selected.', ''),
('CREATE_INSTANCES', 'EN', 'Create slots', ''),
('NUMBER_OF_INSTANCES', 'EN', 'Please specify how many slots you want to create', ''),
('TIPP_TEMPLATE_1', 'EN', 'Templates are the basis of every output with N/X. <br>You will need to create a class first, which defines the structure and the kind of contents. Afterwards you can create the page-templates here and assign a php-file to a class.<br><br>', ''),
('SPM_THUMBNAIL', 'EN', 'Thumbnail', ''),
('HELP', 'EN', 'Help', ''),
('EXPLORE', 'EN', 'Explore', ''),
('FILTER_RULE', 'EN', 'Search for...', ''),
('FILTER_COLUMN', 'EN', 'in', ''),
('SEARCH_CLEAR', 'EN', 'Reset Filter', ''),
('ED_CPGROUP', 'EN', 'Edit Layout-Class Group', ''),
('GROUP_DESCRIPTION', 'EN', 'Description', ''),
('ACCESS_VIOLATION', 'DE', 'Zugriffsverletzung', ''),
('WYSIWYG', 'EN', 'WYSIWYG Editor', ''),
('ORDER', 'EN', 'By order', ''),
('ORDERCOMP', 'EN', 'Order of Compounds', 'Set the order in which clusters, e.g. banners, appear.'),
('ED_CPGROUPGENERAL', 'EN', 'Edit common Data', ''),
('CPG_MEMBERS_SELECT', 'EN', 'Select members of this layout-class group', ''),
('AVAIL_ITEMS', 'EN', 'Available items', ''),
('SEL_MEM', 'EN', 'Selected members', ''),
('COMB_ALL', 'EN', 'Select All', ''),
('COMB_NONE', 'EN', 'Clear All', ''),
('MT_DW_CONTENT', 'EN', 'Dreamweaver Plugin', ''),
('MT_GENERATE_DTA_MES', 'EN', 'Generate database-information for automatic versioning.', ''),
('MT_GENERATE_DTA_SUCCEEDED', 'EN', 'DataTypes were successfully generated and file was written.', ''),
('START_BAK', 'EN', 'Start Backup', ''),
('BACKUP', 'EN', 'System Backup', ''),
('BACK_INFO', 'EN', 'The list below shows you the backups of N/X on your server. You can delete the backups here. To restore a backup,you need to manually log in your server and restore the files yourself.', ''),
('BAK_FILE', 'EN', 'Backup file', ''),
('IS_COMPOUND', 'EN', 'Layout-Class', 'Enable objects to have its own layout-template by checking this box.'),
('TEMPLATE', 'EN', 'Template', ''),
('OVERVIEW', 'EN', 'Overview', ''),
('VISITORS', 'EN', 'Visitors', ''),
('PAGES', 'EN', 'Pages', ''),
('WEEKDAY', 'EN', 'Weekdays', ''),
('HOUR', 'EN', 'Hours', ''),
('REFERER', 'EN', 'Referer', ''),
('ENVIRONMENT', 'EN', 'Environment', ''),
('PATHS', 'EN', 'Clickpaths', ''),
('STATS_HEADER', 'EN', 'N/X 5.0 Traffic Statistics', ''),
('VISITS_OVERVIEW', 'EN', 'Visitors overview', ''),
('VISITS', 'EN', 'Visitors', ''),
('TOTAL', 'EN', 'Total', ''),
('AVERAGE', 'EN', 'Average', ''),
('MEDIAN', 'EN', 'Median', ''),
('MAXIMUM', 'EN', 'Maximum', ''),
('MAXIMUMAT', 'EN', 'Maximum at', ''),
('MINIMUM', 'EN', 'Minimum', ''),
('MINIMUMAT', 'EN', 'Minimum at', ''),
('PI_OVERVIEW', 'EN', 'Page Impressions Overview', ''),
('PI', 'EN', 'Page Impressions', ''),
('TF', 'EN', 'Time Frame', ''),
('PREDEF_TIME', 'EN', 'Predefined Interval', ''),
('TODAY', 'EN', 'Today', ''),
('YESTERDAY', 'EN', 'Yesterday', ''),
('THISWEEK', 'EN', 'This Week', ''),
('LASTWEEK', 'EN', 'Last Week', ''),
('THISMONTH', 'EN', 'This Month', ''),
('LASTMONTH', 'EN', 'Last Month', ''),
('THISYEAR', 'EN', 'This Year', ''),
('LASTYEAR', 'EN', 'Last Year', ''),
('IND_TIME', 'EN', 'Individual interval', ''),
('SET', 'EN', 'Set', ''),
('PRINT', 'EN', 'Print', ''),
('ACL_TITLE', 'EN', 'Setting permissions for', ''),
('ACL_INHERIT', 'EN', 'Inherit permissions from parent', ''),
('ACL_INHERIT_NOTE', 'EN', 'Note: When the box is checked, there is no other configuration available!', ''),
('ACL_INFO', 'EN', 'Inherited Access from parent', ''),
('ACL_PARENT', 'EN', 'Permissions inherited from', ''),
('ACL_GROUPSROLES', 'EN', 'Foreign Access', 'Declare groups, who you allow to access this object.'),
('ALC_OWNER', 'EN', 'Set Owner', ''),
('ACL_OWNER', 'EN', 'Owner', 'The members of this group have Administrator role on this ressource'),
('ACL_ACCESS', 'EN', 'Edit permissions in groups on', ''),
('ACL_GROUPS', 'EN', 'Select Group to add', ''),
('ACL_GROUPEDIT', 'EN', 'Select group to edit roles', ''),
('ACL_ROLE', 'EN', 'Select roles for group', ''),
('SELMULTIPLE', 'EN', 'Hold down the CTRL-Key to select multiple items!', ''),
('SELECT', 'EN', 'Select', ''),
('CP_GROUP', 'EN', 'Layout-Class Group', ''),
('EDIT_TEMPLATE', 'EN', 'Edit Template', ''),
('EDIT_SPM', 'EN', 'Edit Template Properties', ''),
('OK', 'EN', 'Ok', ''),
('FOLDER_DELMES', 'EN', 'Do you really want to delete this folder?', ''),
('RATERES', 'EN', 'Rate Results', ''),
('DISPLAY', 'EN', 'Display', ''),
('PAGE', 'EN', 'Page', ''),
('COMMENT', 'EN', 'Comment', ''),
('DATE', 'EN', 'Date', ''),
('SMA_EXT_EDIT', 'EN', 'Open edit window. Save all inline edited texts before!', ''),
('PGNTXT_SMA', 'EN', 'Save all edited texts on the page', ''),
('AVG_VISIT_LENGTH', 'EN', 'Average Visit Length (clicks)', ''),
('AVG_CLICKSTREAM', 'EN', 'Average Clickstream', ''),
('VIS_ONL', 'EN', 'Visitors online', ''),
('WHEN', 'EN', 'When', ''),
('RET_VIS', 'EN', 'Returning visitors', ''),
('VIS_FIRST', 'EN', 'First time visitors', ''),
('VIS_RET', 'EN', 'Returning visitors', ''),
('TIME_BETW_VISITS', 'EN', 'Average time between visits', ''),
('VIS_PER_VIS', 'EN', 'Average visits per visitor', ''),
('AVG_VIS_LENGTH', 'EN', 'Average Visit Length (Seconds)', ''),
('TOP_BROWSER', 'EN', 'Top Browsers', ''),
('RANK', 'EN', 'Rank', ''),
('COUNT', 'EN', 'Count', ''),
('PERCENT', 'EN', 'Percent', ''),
('TOP_OS', 'EN', 'Top Operating Systems', ''),
('TOP_HOSTS', 'EN', 'Top Hosts', ''),
('TOP', 'EN', 'Restrict data', ''),
('OTHERS', 'EN', 'Others', ''),
('CLK_PATHS', 'EN', 'Clickpaths', ''),
('TOP_PATHS', 'EN', 'Top Paths', ''),
('PATH', 'EN', 'Path', ''),
('SHORTEST_PATHS', 'EN', 'Shortest Paths', ''),
('LONGEST_PATHS', 'EN', 'Longest Paths', ''),
('WEBSITE', 'EN', 'Website', ''),
('TRANSLATION', 'EN', 'N/X Translation System', ''),
('STATS', 'EN', 'Statistics', ''),
('LOCK_MENU', 'EN', 'Permit Childpages', 'By permitting childpages, a developer can prevent editors from creating sub pages for a page.'),
('USER_PERMISSION', 'EN', 'Edit user permissions', ''),
('USERPERM_HEAD', 'EN', 'Edit user permissions', ''),
('USER_GENERAL', 'EN', 'Edit general user data', ''),
('IS_FILTERED', 'EN', 'Note: Because you applied a filter, not all records are displayed.', ''),
('TOP_REFERER', 'EN', 'Top Referer', ''),
('TOP_SI', 'EN', 'Top Search Engines', ''),
('TOP_SKW', 'EN', 'Top Search Keywords', ''),
('TOP_EXITT', 'EN', 'Top Exit Targets', ''),
('HOURS_AS', 'EN', 'Hour Analysis', ''),
('WEEKDAY_AS', 'EN', 'Weekday Analysis', ''),
('I_AFTER', 'EN', 'Insert after', ''),
('AFTER', 'EN', 'After:', ''),
('REMAIN_POS', 'EN', 'Do not change position', ''),
('BEGIN', 'EN', 'Start', ''),
('CL_NAME', 'EN', 'Object Name', ''),
('INSNAME', 'EN', '&lt;Object Name&gt;', ''),
('CAL_NAME', 'EN', 'Calendar Name', ''),
('CALENDARS', 'EN', 'Calendars', ''),
('CALENDARS_DEFINE', 'EN', 'Define Calendars', ''),
('CALENDARS_TIPP', 'EN', 'You can create several calendars here. Each calendar will have its own events and dates.', ''),
('CALENDAR', 'EN', 'Calendar', ''),
('CALENDARS_EDIT', 'EN', 'Edit Calendar', ''),
('CALENDARS_CAT_DEFINE', 'EN', 'Define Categories', ''),
('CALENDAR_SELECT', 'EN', 'Select Calendar', ''),
('CAT_NAME', 'EN', 'Category', ''),
('CATEGORY', 'EN', 'Category', ''),
('COLOR', 'EN', 'Color', ''),
('CAL_EDIT', 'EN', 'Edit Appointment', ''),
('TOP_PAGES', 'EN', 'Top Pages', ''),
('TOP_ENTRYPAGES', 'EN', 'Top Entry Pages', ''),
('TOP_EXITPAGES', 'EN', 'Top Exit Pages', ''),
('SEL_EVENT', 'EN', 'Select Event or Appointment', ''),
('STARTDATE', 'EN', 'Startdate', ''),
('STARTTIME', 'EN', 'Starttime', ''),
('ENDATE', 'EN', 'Enddate', ''),
('ENDTIME', 'EN', 'Endtime', ''),
('CAL_BTO', 'EN', 'Back to Overview', ''),
('ROLE_PERMISSION', 'EN', 'Edit Role Permissions', ''),
('ROLE_GENERAL', 'EN', 'Edit Role General', ''),
('ADD_LINK', 'EN', 'Add Link', ''),
('ADDITIONAL_LINK', 'EN', 'Additional Link', ''),
('ADDITIONAL_IMAGE', 'EN', 'Additional Image', ''),
('NO_OBJ', 'EN', 'No content selected.', ''),
('CLEAR', 'EN', 'Clear', ''),
('FIND_OBJ', 'EN', 'Find Object', ''),
('PREV_AVAIL', 'EN', 'You sucessfully selected a content. A preview will be available after saving.', ''),
('NOT_SPECIFIED', 'EN', 'Any type', ''),
('CMPTYPE', 'EN', 'Layout-Class type:', ''),
('INSTANCES_CREATED', 'EN', 'New instances of the item have been created.', ''),
('CONFIRM_DELETE', 'EN', 'Do you really want to remove this item?', ''),
('NOT_SELECTED', 'EN', 'No item selected yet.', ''),
('NO_CONTENT', 'EN', 'No content entered yet.', ''),
('LEAVE_EMPTY', 'EN', 'Leave empty.', ''),
('GOTO_CL', 'EN', 'Goto Object', ''),
('CL_EXPIRE', 'EN', 'Unpublish Object', ''),
('CL_LAUNCH', 'EN', 'Publish Object', ''),
('OBJLAUNCH_SUCCESS', 'EN', 'The object was successfully launched.', ''),
('NO_CLUSTER', 'EN', 'No contents.', ''),
('BACK_TO_CV', 'EN', 'Back to object overview', ''),
('CREATED_AT', 'EN', 'Created at', ''),
('BY', 'EN', 'by', ''),
('LAST_MOD_AT', 'EN', 'Last modified:', ''),
('CLUSTER_INFORMATION', 'EN', 'Information about this record', ''),
('LAST_LAUNCHED_AT', 'EN', 'Last published:', ''),
('M_CHANNELS', 'EN', 'Channels', ''),
('ARTICLES', 'EN', 'Articles', ''),
('CH_ADMIN', 'EN', 'Channel Administration', ''),
('CH_CAT', 'EN', 'Define Categories', ''),
('CHANNELS', 'EN', 'Channels', ''),
('CHANNEL', 'EN', 'Channel', ''),
('CHANNEL_SELECT', 'EN', 'Select Channel', ''),
('AUTHOR', 'EN', 'Author', ''),
('EDITED', 'EN', 'Edited', ''),
('CREATED', 'EN', 'Created', ''),
('SEL_ARTICLE', 'EN', 'Select an Article', ''),
('IN_CHANNEL', 'EN', 'in channel', ''),
('EDIT_ARTICLE', 'EN', 'Edit Article', ''),
('BACK_TO_OVERVIEW', 'EN', 'Back to Overview', ''),
('CREATE_ARTICLE', 'EN', 'Create new Article in Channel', ''),
('AR_LAUNCH', 'EN', 'Publish Article', ''),
('CLT_SELECT', 'EN', 'Select Classes', ''),
('CLT', 'EN', 'Class', ''),
('NEW_ARTICLE', 'EN', 'New Article', ''),
('AR_EXPIRE', 'EN', 'Unpublish Article', ''),
('DWEXT_CONTENTFIELDINFO', 'EN', 'Generate Content-Field-Information', ''),
('DWEXT_CONTENTFIELDINFO_MES', 'EN', 'generates Content-Field-Information for Dreamweaver MX', ''),
('DEL_ARTICLE', 'EN', 'Do you really want to delete this article in all variations?', ''),
('READY_TO_USE', 'EN', 'Ready to use.', ''),
('SEL_CHANNEL_CAT', 'EN', 'Select a Channel and a Category', ''),
('ALL', 'EN', 'All', ''),
('ORDERART', 'EN', 'Order of Articles', ''),
('NUM_OF_ART', 'EN', 'Number of articles (999 = infinite)', ''),
('CH_CAT2', 'EN', 'Channel and Category', ''),
('DESTROY_TREE', 'EN', 'Delete Tree', ''),
('DESTROY_EXCLUSIVE_CONTENT', 'EN', 'Delete exclusive content', ''),
('AUTH_GROUP', 'EN', 'Authentication', ''),
('SYNC_CLUSTERS', 'EN', 'Synchronize Objects', ''),
('SYNC_CLUSTERS_DESCR', 'EN', 'After you modified a class, the objects are not automatically synched to the new structure. They are synched when you are working with them the next time. With this function you can sync all of them at once.', ''),
('M_EXPORT_WZ', 'EN', 'Export Wizzard', ''),
('M_IMPORT_WZ', 'EN', 'Import Wizzard', ''),
('M_HELP', 'EN', 'Help', ''),
('MH_GETSTART', 'EN', 'Getting Started', ''),
('MH_GLOSSARY', 'EN', 'Glossary', ''),
('DELETE_PAGE', 'EN', 'Delete', ''),
('TT_REFRESH', 'EN', 'Refresh Instances updates the changes made to a template to cached pages.', ''),
('TT_RSTCI', 'EN', 'Each page in N/X is linked to an object. By pressing Reset Object you can link a new object to the page.', ''),
('HELP_SP', 'EN', 'You can edit the site structure and pages here.', ''),
('HELP_OBJBROWSE', 'EN', 'Content library contains all content material of the site', ''),
('HELP_CLB', 'EN', 'Objects are a collection of placeholders, which are either to be filled in by a developer or an editor of a webpage. The structure-definition within N/X is done with classes.', ''),
('HELP_CHANNEL', 'EN', 'Topic categories defining the contents of articles created by N/X. i.e. News, Persons', ''),
('HELP_ROLLOUT', 'EN', 'Copy website is a feature of N/X that enables you to make copies of a section on your web page and re-use it with or without the old content.', ''),
('EXPORT_DATA', 'EN', 'Export Content and Templates Wizzard', ''),
('WZ_EXPORT_TITLE', 'EN', 'This wizard is used to exchange objects, classes and page-templates between your N/X installation and others. The wizard generates a XML File, which you can store on your local hard drive and exchange with other N/X-Users.', ''),
('WZT_EXPORT_TYPE', 'EN', 'Select type to export', ''),
('WZE_EXPORT_TYPE', 'EN', 'On the right you need to select the type of data you want to export. Content is stored in objects. When you export objects, the classes are automatically exported too. Classes are schemes for creating objects.', ''),
('CLUSTER', 'EN', 'Object', ''),
('CLUSTER_TEMPLATE', 'EN', 'Class', ''),
('PAGE_TEMPLATE', 'EN', 'Page Template', ''),
('WZT_SEL_EXP_RES', 'EN', 'Select Ressource for export', ''),
('WZT_DESCR', 'EN', 'Add description', ''),
('WZT_DESCR_EXPL', 'EN', 'Now you can add a short description to the exported data.<br/><br/> Anyone who will import the data will easier understand the content of the file.', ''),
('EXEC_EXPORT', 'EN', 'Exporting the ressource', ''),
('EXPL_EXEC_EXPORT', 'EN', 'The system is generating a XML-File for export now.<br/><br/>In a few seconds, a popup will appear. Press Save for storing the Ressource on your harddisk.', ''),
('EXP_REPORT', 'EN', 'Exporting following data', ''),
('NEXT', 'EN', 'Next', ''),
('STEP', 'EN', 'Step', ''),
('IMPORT_DATA', 'EN', 'Import N/X-XML Data', ''),
('WZ_IMPORT_TITLE', 'EN', 'This wizard is used for importing data to N/X, which has formerly been exported with another N/X installation. Note: You have to delete a resource before you can import it for a second time.', ''),
('WZT_IMPORT_FILE', 'EN', 'Select N/X-XML File', ''),
('WZE_IMPORT_FILE', 'EN', 'Please choose a N/X-XML file from your harddisk for upload into the system.<br/><br/>The system will perform a check and will display status information on the next page.', ''),
('WZT_IMPORT_VAL', 'EN', 'Summary of uploaded XML', ''),
('WZE_IMPORT_VAL', 'EN', 'The system has checked the correctness of the uploaded XML file. Read the report on the left for details.', ''),
('WZT_IMPORTING', 'EN', 'Importing data', ''),
('WZE_IMPORTING', 'EN', 'The system has tried to import the data. Check the status on the right.', ''),
('SEL_FILE', 'EN', 'Select a file', ''),
('HELP_PAGETEMP', 'EN', 'In spreadsheet and database applications, a template is a blank form that shows which fields exist, their locations, and their length. In N/X, templates are the basis of every output. A template is a form in which all the cells have been defined but no data has yet been entered.', ''),
('HELP_CLT', 'EN', 'Cluster template is a form that enables you to create structure for your site and define the type of contents. Afterwards, cluster template is merged with a page-template that includes the content of the web page.', ''),
('HELP_METATEMP', 'EN', 'A meta template is used for defining which metadata fields need to go on a new page. When you create a new metadata field in the template, each new page based on that template will contain that field.', ''),
('HELP_COMPGRP', 'EN', 'Layout-Class group is a group of objects.  This feature enables you to build your homepage out of blocks, e.g. News-Article, Poll, Image-Gallery all on one page and on demand.', ''),
('HELP_PURGE', 'EN', 'Deletes unnecessary information from the database.', ''),
('HELP_DW', 'EN', 'Creates a configuration-file for N/X Dreamweaver Plug-in. With the help of the Plug-in, templates can be developed with Dreamweaver.', ''),
('HELP_SYNCCL', 'EN', 'A feature used for synchronizing objects after having modified/changed a class.', ''),
('MT_SYNC_CL', 'EN', 'Synchronize Clusters', ''),
('HELP_PGN', 'EN', 'Plugins allow you to enhance N/X beyond its standard features. Typically, plugins are used to create new content types in addition to the two standard content types text and image.', ''),
('HELP_BACKUP', 'EN', 'The list below shows you the backups of N/X on your server. You can delete the backups here. To restore a backup ,you need to manually log in to your server and restore the files yourself.', ''),
('HELP_VARIATION', 'EN', 'Content may have different languages. You define the languages you can use in N/X here.', ''),
('HELP_ACCESS', 'EN', 'A feature used for creating and managing user profiles within N/X.', ''),
('SHOW_PAGEWISE', 'EN', 'show pagewise', ''),
('SHOW_ALL', 'EN', 'show all', ''),
('NODE_ACCESS', 'EN', 'Set access to the website', ''),
('SPM_SELECTTHUMB', 'EN', 'Select Thumbnail', 'Select a graphic which will be displayed if an editor creates a new page. You can upload your own icon-graphics to the folder cms/modules/sitepages/thumbnails.'),
('ED_PROPERTIES', 'EN', 'Edit Properties', ''),
('ED_CLT', 'EN', 'Edit Class', ''),
('EXPL_SEL_CLUSTER', 'EN', 'After selecting a class, a list with objects will appear, where you can select one.', ''),
('SEL_PTML', 'EN', 'Select Page-Template', ''),
('EXPL_SEL_SPM', 'EN', 'Please select a page-template.', ''),
('CHANNEL_IMPORTARTICLES', 'EN', 'Import articles', ''),
('WZ_ARTICLEIMPORT', 'EN', 'Article-Import Wizard', ''),
('WZ_ARTICLEIMPORT_TITLE', 'EN', 'This wizard is used to import article data to a channel from different sources. You can import from existing Multipages or other channels. You have to make sure that the corresponding templates are compatible.', ''),
('WZT_ARTICLEIMPORT_TARGET', 'EN', 'Select target channel', ''),
('WZE_ARTICLEIMPORT_TARGET', 'EN', 'On the right you need to select the target channel. All imported articles will be stored within this channel.', ''),
('SEL_CH', 'EN', 'Select a Channel', ''),
('EXPL_SEL_CH', 'EN', 'Please select a channel.', ''),
('WZT_ARTICLEIMPORT_SRCTYPE', 'EN', 'Select source type', ''),
('WZE_ARTICLEIMPORT_SRCTYPE', 'EN', 'Please select the type of source you want to import the articles from.', ''),
('MULTIPAGE', 'EN', 'Multipage', ''),
('COPY_CLUSTER', 'EN', 'Copy objects', ''),
('KEEP_CLUSTER', 'EN', 'Keep original object', ''),
('ARTICLE_IS_EXPIRED', 'EN', 'Article is unpublished', ''),
('ARTICLE_IS_LIVE', 'EN', 'Article is published', ''),
('DISABLE', 'EN', 'Disable', ''),
('TRANS_TEMPL', 'EN', 'Translate from', ''),
('TRANS_THIS', 'EN', 'Translate this:', ''),
('SEL_VAR', 'EN', 'Select Language', ''),
('ARTICLE_VARIATION_MISSING', 'EN', 'The language-version of this article does not exist yet.', ''),
('SHOW_ADVANCED_SEARCH', 'EN', 'Display advanced search options', ''),
('SEARCH_LIVE_ACRTICLES', 'EN', 'Published articles', ''),
('SHOW', 'EN', 'show', ''),
('HIDE', 'EN', 'Hide', ''),
('SEARCH_EXPIRED_ARTICLES', 'EN', 'Unpublished articles', ''),
('SEASRCH_MISSING_VARIATIONS', 'EN', 'Missing translations', ''),
('MAINT_MODE', 'EN', 'Offline Mode', ''),
('MAINT_BB', 'EN', 'Switch backend into maintenance.', ''),
('MAINT_WWW', 'EN', 'Switch published website into maintenance.', ''),
('UPL_TEXT', 'EN', 'Upload text file', ''),
('WZT_KEEPCLUSTER', 'EN', 'Keep existing objects?', ''),
('WZT_KEEPCLUSTER_EXPL', 'EN', 'You can specify whether you want to keep the existing objects or to create a copy of each object.<br><br>Keep in mind: if you keep the original objects you will share them with the original source.', ''),
('SEL_CLUSTER', 'EN', 'Select an Object', ''),
('NO_CLUSTERTEMPLATES', 'EN', 'There are no classes.', ''),
('RESET_LOGS', 'EN', 'Reset Logs', ''),
('LOGFILE', 'EN', 'View System Logs', ''),
('LOGS_INFO', 'EN', 'The list below shows you events that were logged by N/X WCMS.', ''),
('MESSAGE', 'EN', 'Message', ''),
('CHANGE', 'EN', 'Change', ''),
('AGENT_WELCOME', 'EN', 'Welcome to N/X.', ''),
('AGENT_GOHOME', 'EN', 'Go home!', ''),
('AGENT_GOAWAY', 'EN', 'Hide and stay away!', ''),
('AGENT_NXHOMEPAGE', 'EN', 'Visit N/X Homepage!', ''),
('AGENT_CALLED', 'EN', 'you asked for me?', ''),
('AGENT_LOGOUT', 'EN', 'I hope you enjoyed working with N/X. Have a nice day!', ''),
('AGENT_EXPLAINHOME', 'EN', 'You can find me by clicking the N/X-Logo in the upper-right corner of your browser.', ''),
('USER_AGENT', 'EN', 'Use Agent', ''),
('CLTPOSITION', 'EN', 'Position', ''),
('FONT', 'EN', 'Font Name', ''),
('FONTSIZE', 'EN', 'Font Size', ''),
('NUMBER', 'EN', 'Enter a number!', ''),
('TEXT_STYLE', 'EN', 'Text Style', ''),
('TEXT_ALIGN', 'EN', 'Text Align', ''),
('TEXT_COLOR', 'EN', 'Text Color', ''),
('BG_COLOR', 'EN', 'Background Color', ''),
('WIDTH', 'EN', 'Width', ''),
('HEIGHT', 'EN', 'Height', ''),
('INDIV_CONFIG', 'EN', 'Individual configuration for this item', ''),
('GR_TEXT', 'EN', 'Graphical Text', ''),
('SPM_LAUCH_SUCCESS', 'EN', 'The pages based on this master were relaunched successfully.<br>', ''),
('CONFIRM_UNSAVED_CHANGES', 'EN', 'Note: Unsaved changes will be lost if you proceed. If you have already edited something, you may cancel now and save your work. Proceed ?', ''),
('CL_SELECT', 'EN', 'Please select an object to link it with the class.', ''),
('M_HOME', 'EN', 'Home', ''),
('CLT_EXCLUSIVE', 'EN', 'Developer Content', ''),
('BACK_SP', 'EN', 'Back to Website', ''),
('CONFIRM_UNSAVED_CHANGES_LINKEDCL', 'EN', 'Note: When changing the linked object, any changes you apply on the currently linked object will be lost. If you want to save these canges, save your work first and change the linked object. Proceed ?', ''),
('CLLINK', 'EN', 'This slot is linked to', ''),
('BACK_SP', 'DE', 'ZurÃƒÆ’Ã‚Â¼ck', ''),
('BG_COLOR', 'DE', 'Hintergrundfarbe', ''),
('CLLINK', 'DE', 'Dieser Platzhalter ist verlinkt mit', ''),
('CLTPOSITION', 'DE', 'Position', ''),
('CLT_EXCLUSIVE', 'DE', 'Inhalt nur fÃƒÆ’Ã‚Â¼r Entwickler sichtbar', ''),
('CL_SELECT', 'DE', 'Bitte wÃƒÆ’Ã‚Â¤hlen Sie ein Objekt, um es mit der Klasse zu verlinken.', ''),
('CONFIRM_UNSAVED_CHANGES_LINKEDCL', 'DE', 'Achtung: Wenn Sie das verlinkte Objekt ÃƒÆ’Ã‚Â¤ndern, gehen alle ungespeicherten ÃƒÆ’Ã¢â‚¬Å¾nderungen am aktuellen Objekt verloren. MÃƒÆ’Ã‚Â¶chten sie fortfahren?', ''),
('FONT', 'DE', 'Schriftname', ''),
('FONTSIZE', 'DE', 'SchriftgrÃƒÆ’Ã‚Â¶ÃƒÆ’Ã…Â¸e', ''),
('GR_TEXT', 'DE', 'Graphischer Text', ''),
('HEIGHT', 'DE', 'HÃƒÆ’Ã‚Â¶he', ''),
('MT_LW_SITE', 'EN', 'Launch website', ''),
('INDIV_CONFIG', 'DE', 'Individuelle Konfiguration', ''),
('LOGFILE', 'DE', 'Systemlogs zeigen', ''),
('LOGS_INFO', 'DE', 'Die Liste enthÃƒÆ’Ã‚Â¤lt alle geloggten Ereignisse.', ''),
('MESSAGE', 'DE', 'Nachricht', ''),
('M_HOME', 'DE', 'Home', ''),
('NUMBER', 'DE', 'Bitte geben Sie eine Zahl ein!', ''),
('RESET_LOGS', 'DE', 'Reset', ''),
('SPM_LAUCH_SUCCESS', 'DE', 'Die Seiten wurden neu verÃƒÆ’Ã‚Â¶ffentlicht.', ''),
('TEXT_ALIGN', 'DE', 'Textausrichtung', ''),
('TEXT_COLOR', 'DE', 'Textfarbe', ''),
('TEXT_STYLE', 'DE', 'Textformatierung', ''),
('WIDTH', 'DE', 'Breite', ''),
('MT_LWS_MESSAGES', 'EN', 'Do you really want to launch the whole website?', ''),
('CH_ARTICLE_DATE', 'EN', 'Article Date', ''),
('EXPIRE', 'EN', 'Unpublish', ''),
('CH_ARTICLE_DATE', 'DE', 'Artikeldatum', ''),
('EXPIRE', 'DE', 'ZurÃƒÆ’Ã‚Â¼ckziehen', ''),
('BY_ORDER', 'EN', 'By Position', ''),
('MT_LWS_MESSAGES', 'DE', 'MÃƒÆ’Ã‚Â¶chten Sie wirklich die gesamte Seite verÃƒÆ’Ã‚Â¶ffentlichen?', ''),
('MT_LW_SITE', 'DE', 'Ganze Website verÃƒÆ’Ã‚Â¶ffentlichen', ''),
('GALNAME', 'EN', 'Gallery Name', ''),
('GALDESC', 'EN', 'Gallery Description', ''),
('GAFOLDER', 'EN', 'Image-Folder', ''),
('GALROWS', 'EN', 'Rows', ''),
('GALCOLS', 'EN', 'Columns', ''),
('MEDIA_SUPPORTED', 'EN', 'The Media plugin supports the following file-types:<br>Macromedia Flash Films (.swf), Windows Media (.avi), Real Player (.rm), Apple Quicktime (.mov), MP3 over Windows Media (.mp3), PDF (.pdf)', ''),
('O_DELMES2', 'EN', 'Do you really want to delete this content? It may still be used in some objects.', '');
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES 
('MISSING_PGN', 'EN', 'Missing Plugin:', ''),
('IMP_ERR', 'EN', 'You cannot import, because of the following errors:', ''),
('FILE_ALREADY_UPLOADED', 'EN', 'You have already uploaded a file. You can go on by pressing Next.', ''),
('GO_IMPORT', 'EN', 'Press Next to import this data now. If the data has already been imported, nothing will be changed.', ''),
('NUMB_IMPORTED', 'EN', 'Number of imported recordsets:', ''),
('PROC_DATA', 'EN', 'Processing Data...', ''),
('BAK_TIPP', 'EN', 'You can backup your database and www and wwwdev folder here. Make sure you have setup backup in settings.inc.php!', ''),
('COPYCLUSTERT', 'EN', 'Create Copy', ''),
('CREATECOPY', 'EN', 'Copy', ''),
('COPYCLT', 'EN', 'Copy class', ''),
('SOURCE', 'EN', 'Source', ''),
('NEWNAME', 'EN', 'New Name', ''),
('CHNLAUNCHED', 'EN', 'The channel was launched successfully.', ''),
('MT_LWC', 'EN', 'Launch all articles', ''),
('NO_XML', 'EN', 'The file you uploaded is not XML or your browser does not send the file correct!', ''),
('CHANGE_TEMPLATE', 'EN', 'Active Template', ''),
('CCONLAUNCH', 'EN', 'Clear Cache when Publishing', ''),
('CCONLAUNCH_LBL', 'EN', 'Dev-Page-IDs (commaseparated)', ''),
('ROLLOUT_SEL', 'EN', 'Source and Destination for Copy', ''),
('NEW_ROLLOUT', 'EN', 'Start another copy', ''),
('CR_BO_LANG', 'EN', 'Create a new backend language', ''),
('LANGUAGE', 'EN', 'Language', ''),
('ACL_ACCESS', '100', NULL, NULL),
('ACL_GROUPEDIT', '100', NULL, NULL),
('ACL_GROUPS', '100', NULL, NULL),
('ACL_GROUPSROLES', '100', NULL, NULL),
('ACL_INFO', '100', NULL, NULL),
('ACL_INHERIT', '100', NULL, NULL),
('ACL_INHERIT_NOTE', '100', NULL, NULL),
('ACL_OWNER', '100', NULL, NULL),
('ACL_PARENT', '100', NULL, NULL),
('ACL_ROLE', '100', NULL, NULL),
('ACL_TITLE', '100', NULL, NULL),
('ACTIVE', '100', NULL, NULL),
('ACTIVE_VARIATION', '100', NULL, NULL),
('ADDITIONAL_IMAGE', '100', NULL, NULL),
('ADDITIONAL_LINK', '100', NULL, NULL),
('ADD_LINK', '100', NULL, NULL),
('AFTER', '100', NULL, NULL),
('AGENT_CALLED', '100', NULL, NULL),
('AGENT_EXPLAINHOME', '100', NULL, NULL),
('AGENT_GOAWAY', '100', NULL, NULL),
('AGENT_GOHOME', '100', NULL, NULL),
('AGENT_LOGOUT', '100', NULL, NULL),
('AGENT_NXHOMEPAGE', '100', NULL, NULL),
('AGENT_WELCOME', '100', NULL, NULL),
('ALC_OWNER', '100', NULL, NULL),
('ALL', '100', NULL, NULL),
('ARTICLES', '100', NULL, NULL),
('ARTICLE_IS_EXPIRED', '100', NULL, NULL),
('ARTICLE_IS_LIVE', '100', NULL, NULL),
('ARTICLE_VARIATION_MISSING', '100', NULL, NULL),
('AR_EXPIRE', '100', NULL, NULL),
('AR_LAUNCH', '100', NULL, NULL),
('AUTHOR', '100', NULL, NULL),
('AUTH_GROUP', '100', NULL, NULL),
('AVAIL_ITEMS', '100', NULL, NULL),
('AVAIL_VARIATIONS', '100', NULL, NULL),
('AVERAGE', '100', NULL, NULL),
('AVG_CLICKSTREAM', '100', NULL, NULL),
('AVG_VISIT_LENGTH', '100', NULL, NULL),
('AVG_VIS_LENGTH', '100', NULL, NULL),
('BACK', '100', NULL, NULL),
('BACKUP', '100', NULL, NULL),
('BACK_INFO', '100', NULL, NULL),
('BACK_SP', '100', NULL, NULL),
('BACK_TO_CV', '100', NULL, NULL),
('BACK_TO_OVERVIEW', '100', NULL, NULL),
('BAK_FILE', '100', NULL, NULL),
('BAK_TIPP', '100', NULL, NULL),
('BEGIN', '100', NULL, NULL),
('BG_COLOR', '100', NULL, NULL),
('BY', '100', NULL, NULL),
('BY_ORDER', '100', NULL, NULL),
('CACHED', '100', NULL, NULL),
('CALENDAR', '100', NULL, NULL),
('CALENDARS', '100', NULL, NULL),
('CALENDARS_CAT_DEFINE', '100', NULL, NULL),
('CALENDARS_DEFINE', '100', NULL, NULL),
('CALENDARS_EDIT', '100', NULL, NULL),
('CALENDARS_TIPP', '100', NULL, NULL),
('CALENDAR_SELECT', '100', NULL, NULL),
('CAL_BTO', '100', NULL, NULL),
('CAL_EDIT', '100', NULL, NULL),
('CAL_NAME', '100', NULL, NULL),
('CANCEL', '100', NULL, NULL),
('CATEGORY', '100', NULL, NULL),
('CAT_NAME', '100', NULL, NULL),
('CCONLAUNCH', '100', NULL, NULL),
('CCONLAUNCH_LBL', '100', NULL, NULL),
('CHANGE_TEMPLATE', '100', NULL, NULL),
('CHANNEL', '100', NULL, NULL),
('CHANNELS', '100', NULL, NULL),
('CHANNEL_IMPORTARTICLES', '100', NULL, NULL),
('CHANNEL_SELECT', '100', NULL, NULL),
('CHNLAUNCHED', '100', NULL, NULL),
('CHOOSEFILE', '100', NULL, NULL),
('CH_ADMIN', '100', NULL, NULL),
('CH_ARTICLE_DATE', '100', NULL, NULL),
('CH_CAT', '100', NULL, NULL),
('CH_CAT2', '100', NULL, NULL),
('CLASS_WRONG', '100', NULL, NULL),
('CLEAR', '100', NULL, NULL),
('CLEAR_MEDIA', '100', NULL, NULL),
('CLI', '100', NULL, NULL),
('CLI_DELETE', '100', NULL, NULL),
('CLI_DELETED', '100', NULL, NULL),
('CLI_DELETEMES', '100', NULL, NULL),
('CLI_EDIT', '100', NULL, NULL),
('CLI_NOTDELETED', '100', NULL, NULL),
('CLK_PATHS', '100', NULL, NULL),
('CLLINK', '100', NULL, NULL),
('CLT', '100', NULL, NULL),
('CLTI_DELETE', '100', NULL, NULL),
('CLTPOSITION', '100', NULL, NULL),
('CLT_BROWSE', '100', NULL, NULL),
('CLT_DELETE', '100', NULL, NULL),
('CLT_DELMES', '100', NULL, NULL),
('CLT_EXCLUSIVE', '100', NULL, NULL),
('CLT_MAXCARD', '100', NULL, NULL),
('CLT_MINCARD', '100', NULL, NULL),
('CLT_NAME', '100', NULL, NULL),
('CLT_NEW', '100', NULL, NULL),
('CLT_PROPERTIES', '100', NULL, NULL),
('CLT_SCHEME', '100', NULL, NULL),
('CLT_SELECT', '100', NULL, NULL),
('CLUSTER', '100', NULL, NULL),
('CLUSTER_INFORMATION', '100', NULL, NULL),
('CLUSTER_TEMPLATE', '100', NULL, NULL),
('CL_BROWSE', '100', NULL, NULL),
('CL_CREATEINSMES', '100', NULL, NULL),
('CL_CREATEINSTANC', '100', NULL, NULL),
('CL_DEL', '100', NULL, NULL),
('CL_DELMES', '100', NULL, NULL),
('CL_EDIT', '100', NULL, NULL),
('CL_EXPIRE', '100', NULL, NULL),
('CL_LAUNCH', '100', NULL, NULL),
('CL_NAME', '100', NULL, NULL),
('CL_NEW', '100', NULL, NULL),
('CL_NOTITLE', '100', NULL, NULL),
('CL_PROPERTIES', '100', NULL, NULL),
('CL_SELECT', '100', NULL, NULL),
('CMPTYPE', '100', NULL, NULL),
('COLOR', '100', NULL, NULL),
('COMB_ALL', '100', NULL, NULL),
('COMB_NONE', '100', NULL, NULL),
('COMMENT', '100', NULL, NULL),
('COMMIT', '100', NULL, NULL),
('CONFIG', '100', NULL, NULL),
('CONFIGURED', '100', NULL, NULL),
('CONFIRM_DELETE', '100', NULL, NULL),
('CONFIRM_UNSAVED_CHANGES', '100', NULL, NULL),
('CONFIRM_UNSAVED_CHANGES_LINKEDCL', '100', NULL, NULL),
('CONTAINERNAME', '100', NULL, NULL),
('CONTENT', '100', NULL, NULL),
('CONTENTITEM', '100', NULL, NULL),
('CONTENTTYPE', '100', NULL, NULL),
('CONTENT_DESC', '100', NULL, NULL),
('COPYCLT', '100', NULL, NULL),
('COPYCLUSTERT', '100', NULL, NULL),
('COPY_CLUSTER', '100', NULL, NULL),
('COUNT', '100', NULL, NULL),
('CPG_MEMBERS_SELECT', '100', NULL, NULL),
('CP_GROUP', '100', NULL, NULL),
('CREATE', '100', NULL, NULL),
('CREATECOPY', '100', NULL, NULL),
('CREATED', '100', NULL, NULL),
('CREATED_AT', '100', NULL, NULL),
('CREATENEW', '100', NULL, NULL),
('CREATE_ARTICLE', '100', NULL, NULL),
('CREATE_INSTANCES', '100', NULL, NULL),
('CR_BO_LANG', '100', NULL, NULL),
('CR_CONTENT', '100', NULL, NULL),
('DATE', '100', NULL, NULL),
('DELETE', '100', NULL, NULL),
('DELETESUCCESS', '100', NULL, NULL),
('DELETE_PAGE', '100', NULL, NULL),
('DEL_ARTICLE', '100', NULL, NULL),
('DEL_FOLDER', '100', NULL, NULL),
('DESC', '100', NULL, NULL),
('DESCRIPTION', '100', NULL, NULL),
('DESTROY_EXCLUSIVE_CONTENT', '100', NULL, NULL),
('DESTROY_TREE', '100', NULL, NULL),
('DISABLE', '100', NULL, NULL),
('DISPLAY', '100', NULL, NULL),
('DOSOMETHING', '100', NULL, NULL),
('DOWN', '100', NULL, NULL),
('DWEXT_CONTENTFIE', '100', NULL, NULL),
('DWEXT_CONTENTFIELDINFO', '100', NULL, NULL),
('DWEXT_CONTENTFIELDINFO_MES', '100', NULL, NULL),
('EDIT', '100', NULL, NULL),
('EDITED', '100', NULL, NULL),
('EDIT_ACCESS', '100', NULL, NULL),
('EDIT_ALL', '100', NULL, NULL),
('EDIT_ARTICLE', '100', NULL, NULL),
('EDIT_CONTENT', '100', NULL, NULL),
('EDIT_FOLDER', '100', NULL, NULL),
('EDIT_SPM', '100', NULL, NULL),
('EDIT_TEMPLATE', '100', NULL, NULL),
('ED_CLT', '100', NULL, NULL),
('ED_CONTENT', '100', NULL, NULL),
('ED_CPGROUP', '100', NULL, NULL),
('ED_CPGROUPGENERAL', '100', NULL, NULL),
('ED_DISPATCHER', '100', NULL, NULL),
('ED_META', '100', NULL, NULL),
('ED_PROPERTIES', '100', NULL, NULL),
('EMPTY', '100', NULL, NULL),
('ENDATE', '100', NULL, NULL),
('ENDTIME', '100', NULL, NULL),
('ENVIRONMENT', '100', NULL, NULL),
('ERROR', '100', NULL, NULL),
('ERROR_SEL_GROUP', '100', NULL, NULL),
('ERROR_SEL_ROLE', '100', NULL, NULL),
('EXEC_EXPORT', '100', NULL, NULL),
('EXPIRE', '100', NULL, NULL),
('EXPLORE', '100', NULL, NULL),
('EXPL_EXEC_EXPORT', '100', NULL, NULL),
('EXPL_SEL_CH', '100', NULL, NULL),
('EXPL_SEL_CLUSTER', '100', NULL, NULL),
('EXPL_SEL_SPM', '100', NULL, NULL),
('EXPORT_DATA', '100', NULL, NULL),
('EXP_REPORT', '100', NULL, NULL),
('FILE_ALREADY_UPLOADED', '100', NULL, NULL),
('FILTER_COLUMN', '100', NULL, NULL),
('FILTER_RULE', '100', NULL, NULL),
('FIND_OBJ', '100', NULL, NULL),
('FOLDER', '100', NULL, NULL),
('FOLDER_DELMES', '100', NULL, NULL),
('FONT', '100', NULL, NULL),
('FONTSIZE', '100', NULL, NULL),
('FULL_NAME', '100', NULL, NULL),
('GAFOLDER', '100', NULL, NULL),
('GALCOLS', '100', NULL, NULL),
('GALDESC', '100', NULL, NULL),
('GALNAME', '100', NULL, NULL),
('GALROWS', '100', NULL, NULL),
('GO', '100', NULL, NULL),
('GOTO_CL', '100', NULL, NULL),
('GO_IMPORT', '100', NULL, NULL),
('GROUP_DESCRIPTIO', '100', NULL, NULL),
('GROUP_DESCRIPTION', '100', NULL, NULL),
('GROUP_FILTERMENU', '100', NULL, NULL),
('GROUP_HEAD', '100', NULL, NULL),
('GROUP_LINK', '100', NULL, NULL),
('GROUP_NAME', '100', NULL, NULL),
('GR_TEXT', '100', NULL, NULL),
('HEIGHT', '100', NULL, NULL),
('HELP', '100', NULL, NULL),
('HELP_ACCESS', '100', NULL, NULL),
('PGN_INFO', 'EN', 'Plugin information', ''),
('HELP_BACKUP', '100', NULL, NULL),
('HELP_CHANNEL', '100', NULL, NULL),
('HELP_CLB', '100', NULL, NULL),
('HELP_CLT', '100', NULL, NULL),
('HELP_COMPGRP', '100', NULL, NULL),
('HELP_DW', '100', NULL, NULL),
('HELP_METATEMP', '100', NULL, NULL),
('HELP_OBJBROWSE', '100', NULL, NULL),
('HELP_PAGETEMP', '100', NULL, NULL),
('HELP_PGN', '100', NULL, NULL),
('HELP_PURGE', '100', NULL, NULL),
('HELP_ROLLOUT', '100', NULL, NULL),
('HELP_SP', '100', NULL, NULL),
('HELP_SYNCCL', '100', NULL, NULL),
('HELP_VARIATION', '100', NULL, NULL),
('HIDE', '100', NULL, NULL),
('HOUR', '100', NULL, NULL),
('HOURS_AS', '100', NULL, NULL),
('IMPORT_DATA', '100', NULL, NULL),
('IMP_ERR', '100', NULL, NULL),
('INDIV_CONFIG', '100', NULL, NULL),
('IND_TIME', '100', NULL, NULL),
('INSNAME', '100', NULL, NULL),
('INSTANCES_CREATED', '100', NULL, NULL),
('INSTANCE_CREATED', '100', NULL, NULL),
('IN_CHANNEL', '100', NULL, NULL),
('IS_COMPOUND', '100', NULL, NULL),
('IS_FILTERED', '100', NULL, NULL),
('I_AFTER', '100', NULL, NULL),
('KEEP_CLUSTER', '100', NULL, NULL),
('KEYWORDS', '100', NULL, NULL),
('LANGUAGE', '100', NULL, NULL),
('LASTMONTH', '100', NULL, NULL),
('LASTWEEK', '100', NULL, NULL),
('LASTYEAR', '100', NULL, NULL),
('LAST_LAUNCHED_AT', '100', NULL, NULL),
('LAST_MOD_AT', '100', NULL, NULL),
('LAUNCH', '100', NULL, NULL),
('LEAVE_EMPTY', '100', NULL, NULL),
('LIBRARY', '100', NULL, NULL),
('LINKED', '100', NULL, NULL),
('LIVE_AUTHORING', '100', NULL, NULL),
('LOCATION', '100', NULL, NULL),
('LOCK_MENU', '100', NULL, NULL),
('LOGFILE', '100', NULL, NULL),
('LOGGED_AS', '100', NULL, NULL),
('LOGIN_FAILED', '100', NULL, NULL),
('LOGS', '100', NULL, NULL),
('LOGS_INFO', '100', NULL, NULL),
('LONGEST_PATHS', '100', NULL, NULL),
('MANDATORY', '100', NULL, NULL),
('MAXIMUM', '100', NULL, NULL),
('MAXIMUMAT', '100', NULL, NULL),
('MEDIAN', '100', NULL, NULL),
('MEDIA_SUPPORTED', '100', NULL, NULL),
('MENU', '100', NULL, NULL),
('MESSAGE', '100', NULL, NULL),
('METATEMPLATE', '100', NULL, NULL),
('METATEMPLATES', '100', NULL, NULL),
('MH_GETSTART', '100', NULL, NULL),
('MH_GLOSSARY', '100', NULL, NULL),
('MINIMUM', '100', NULL, NULL),
('MINIMUMAT', '100', NULL, NULL),
('MISSING_PGN', '100', NULL, NULL),
('MT_ADDITIONAL', '100', NULL, NULL),
('MT_BASE', '100', NULL, NULL),
('MT_DELETE', '100', NULL, NULL),
('MT_DW_CONTENT', '100', NULL, NULL),
('MT_DW_CONTENTFIE', '100', NULL, NULL),
('MT_DW_CONTENTFIELDINFO', '100', NULL, NULL),
('MT_GENERATE_DTA', '100', NULL, NULL),
('MT_GENERATE_DTA_', '100', NULL, NULL),
('MT_GENERATE_DTA_MES', '100', NULL, NULL),
('MT_GENERATE_DTA_SUCCEEDED', '100', NULL, NULL),
('MT_LWC', '100', NULL, NULL),
('MT_LWS_MESSAGES', '100', NULL, NULL),
('MT_LW_SITE', '100', NULL, NULL),
('MT_MODULE', '100', NULL, NULL),
('MT_PROPERTIES', '100', NULL, NULL),
('MT_SCHEME', '100', NULL, NULL),
('MT_SPIDER', '100', NULL, NULL),
('MT_SYNC_CL', '100', NULL, NULL),
('MT_TITLE', '100', NULL, NULL),
('MULTIPAGE', '100', NULL, NULL),
('M_ACCESS', '100', NULL, NULL),
('M_ADMIN', '100', NULL, NULL),
('M_BACKUP', '100', NULL, NULL),
('M_BROWSER', '100', NULL, NULL),
('M_CHANNELS', '100', NULL, NULL),
('M_CLB', '100', NULL, NULL),
('M_CLT', '100', NULL, NULL),
('M_CLTB', '100', NULL, NULL),
('M_CLUSTERS', '100', NULL, NULL),
('M_COMBOBJ', '100', NULL, NULL),
('M_ES', '100', NULL, NULL),
('M_EXPORT_WZ', '100', NULL, NULL),
('M_HELP', '100', NULL, NULL),
('M_HOME', '100', NULL, NULL),
('M_IMPORT_WZ', '100', NULL, NULL),
('M_INSTALLPLUGIN', '100', NULL, NULL),
('M_LIB', '100', NULL, NULL),
('M_LOGOUT', '100', NULL, NULL),
('M_MAINTENANCE', '100', NULL, NULL),
('M_META', '100', NULL, NULL),
('M_MYPROFILE', '100', NULL, NULL),
('M_MYPRT', '100', NULL, NULL),
('M_PGN', '100', NULL, NULL),
('M_PRTMAN', '100', NULL, NULL),
('M_PTEMP', '100', NULL, NULL),
('M_PURGE', '100', NULL, NULL),
('M_REPORT', '100', NULL, NULL),
('M_ROLLOUT', '100', NULL, NULL),
('M_SPM', '100', NULL, NULL),
('M_TEMP', '100', NULL, NULL),
('M_TRANSLATION', '100', NULL, NULL),
('M_UMAN', '100', NULL, NULL),
('M_VAR', '100', NULL, NULL),
('M_WWW', '100', NULL, NULL),
('NAME', '100', NULL, NULL),
('NEW', '100', NULL, NULL),
('NEWNAME', '100', NULL, NULL),
('NEW_ARTICLE', '100', NULL, NULL),
('NEW_CONTENT', '100', NULL, NULL),
('NEW_FOLDER', '100', NULL, NULL),
('NEW_ROLLOUT', '100', NULL, NULL),
('NEXT', '100', NULL, NULL),
('NO', '100', NULL, NULL),
('NODE_ACCESS', '100', NULL, NULL),
('NOSPTITLE', '100', NULL, NULL),
('NOTCONFIGURED', '100', NULL, NULL),
('NOTNUMBER', '100', NULL, NULL),
('NOT_SELECTED', '100', NULL, NULL),
('NOT_SPECIFIED', '100', NULL, NULL),
('NO_CLUSTER', '100', NULL, NULL),
('NO_CLUSTERTEMPLATES', '100', NULL, NULL),
('NO_CLUSTER_SELECTED', '100', NULL, NULL),
('NO_CONTENT', '100', NULL, NULL),
('NO_CONTENTS', '100', NULL, NULL),
('NO_OBJ', '100', NULL, NULL),
('NO_VARIATIONS', '100', NULL, NULL),
('NO_XML', '100', NULL, NULL),
('NUMBER', '100', NULL, NULL),
('NUMBER_OF_INSTANCES', '100', NULL, NULL),
('NUMB_IMPORTED', '100', NULL, NULL),
('NUM_OF_ART', '100', NULL, NULL),
('OBJLAUNCH_SUCCESS', '100', NULL, NULL),
('OK', '100', NULL, NULL),
('LAUNCH_TREE', 'EN', 'Publish Tree', ''),
('ORDER', '100', NULL, NULL),
('ORDERART', '100', NULL, NULL),
('ORDERCOMP', '100', NULL, NULL),
('OTHERS', '100', NULL, NULL),
('OVERVIEW', '100', NULL, NULL),
('O_ALT', '100', NULL, NULL),
('O_BROWSE', '100', NULL, NULL),
('O_COPYRIGHT', '100', NULL, NULL),
('O_DEL', '100', NULL, NULL),
('O_DELMES', '100', NULL, NULL),
('O_DELMES2', '100', NULL, NULL),
('O_EDIT', '100', NULL, NULL),
('O_NAME', '100', NULL, NULL),
('O_NEW', '100', NULL, NULL),
('O_PREVIEW', '100', NULL, NULL),
('O_PROPERTIES', '100', NULL, NULL),
('O_TEXT', '100', NULL, NULL),
('PAGE', '100', NULL, NULL),
('PAGES', '100', NULL, NULL),
('PAGE_TEMPLATE', '100', NULL, NULL),
('PASSWORD', '100', NULL, NULL),
('PATH', '100', NULL, NULL),
('PATHS', '100', NULL, NULL),
('PERCENT', '100', NULL, NULL),
('PGNTXT_SMA', '100', NULL, NULL),
('PG_ALREADYINSTAL', '100', NULL, NULL),
('PG_CHOOSE', '100', NULL, NULL),
('PG_ERROR', '100', NULL, NULL),
('PG_FILEWRONG', '100', NULL, NULL),
('PG_INSTALL', '100', NULL, NULL),
('PG_INSTALLDESC', '100', NULL, NULL),
('PG_INSTALLED', '100', NULL, NULL),
('PG_NEWERINSTALLE', '100', NULL, NULL),
('PG_TITLE', '100', NULL, NULL),
('PG_UNINSTALL', '100', NULL, NULL),
('PG_UNINSTALLDELE', '100', NULL, NULL),
('PG_UNINSTALLMES', '100', NULL, NULL),
('PG_UPGRADED', '100', NULL, NULL),
('PI', '100', NULL, NULL),
('PI_OVERVIEW', '100', NULL, NULL),
('POSITION', '100', NULL, NULL),
('POS_IN_MENU', '100', NULL, NULL),
('PO_BROWSER', '100', NULL, NULL),
('PO_CRSUCCEEDED', '100', NULL, NULL),
('PO_EDIT', '100', NULL, NULL),
('PO_MYPORTAL', '100', NULL, NULL),
('PO_OWNER', '100', NULL, NULL),
('PREDEF_TIME', '100', NULL, NULL),
('PREVIEW', '100', NULL, NULL),
('PREV_AVAIL', '100', NULL, NULL),
('PRINT', '100', NULL, NULL),
('PROCERROR', '100', NULL, NULL),
('PROC_DATA', '100', NULL, NULL),
('PROMPTDELETE', '100', NULL, NULL),
('PROPERTIES', '100', NULL, NULL),
('PTEMPL', '100', NULL, NULL),
('PURGE', '100', NULL, NULL),
('PURGE_CLT', '100', NULL, NULL),
('PURGE_CLUSTER', '100', NULL, NULL),
('PURGE_CONTENT', '100', NULL, NULL),
('PURGE_EXPIRED', '100', NULL, NULL),
('PURGE_FOLDER', '100', NULL, NULL),
('PURGE_MES', '100', NULL, NULL),
('PURGE_META', '100', NULL, NULL),
('PURGE_PAGES', '100', NULL, NULL),
('PURGE_VAR', '100', NULL, NULL),
('PWDNOTMATCH', '100', NULL, NULL),
('PWDTOOSHORT', '100', NULL, NULL),
('RANK', '100', NULL, NULL),
('RATERES', '100', NULL, NULL),
('RB_CACHE', '100', NULL, NULL),
('READY_TO_USE', '100', NULL, NULL),
('REFERER', '100', NULL, NULL),
('REMAIN_POS', '100', NULL, NULL),
('RESET', '100', NULL, NULL),
('RESET_FORM', '100', NULL, NULL),
('RESET_LOGS', '100', NULL, NULL),
('RET_VIS', '100', NULL, NULL),
('RL_PERM', '100', NULL, NULL),
('ROLE_DESCRIPTION', '100', NULL, NULL),
('ROLE_FILTERMENU', '100', NULL, NULL),
('ROLE_GENERAL', '100', NULL, NULL),
('ROLE_HEAD', '100', NULL, NULL),
('ROLE_LINK', '100', NULL, NULL),
('ROLE_NAME', '100', NULL, NULL),
('ROLE_PERMISSION', '100', NULL, NULL),
('ROLLOUT_SEL', '100', NULL, NULL),
('R_DELETEFOLDER', '100', NULL, NULL),
('R_DELFOLDER', '100', NULL, NULL),
('R_DELFOLDERMES', '100', NULL, NULL),
('R_EDITFOLDER', '100', NULL, NULL),
('R_FOLDERNAME', '100', NULL, NULL),
('R_FOLDERNOTEMPTY', '100', NULL, NULL),
('R_HOME', '100', NULL, NULL),
('R_MOVEOBJECTS', '100', NULL, NULL),
('R_NEWFOLDER', '100', NULL, NULL),
('R_PARENT', '100', NULL, NULL),
('SAVE', '100', NULL, NULL),
('SAVEERROR', '100', NULL, NULL),
('SAVESUCCESS', '100', NULL, NULL),
('SAVE_BACK', '100', NULL, NULL),
('SEARCH', '100', NULL, NULL),
('SEARCHIN', '100', NULL, NULL),
('SEARCHRESULTS', '100', NULL, NULL),
('SEARCH_CLEAR', '100', NULL, NULL),
('SEARCH_EXPIRED_ARTICLES', '100', NULL, NULL),
('SEARCH_LIVE_ACRTICLES', '100', NULL, NULL),
('SEASRCH_MISSING_VARIATIONS', '100', NULL, NULL),
('SELECT', '100', NULL, NULL),
('SELECTEDINSTANCE', '100', NULL, NULL),
('SELECTEDOBJECT', '100', NULL, NULL),
('SELECTOBJECT', '100', NULL, NULL),
('SELECTONE', '100', NULL, NULL),
('SELECT_CI', '100', NULL, NULL),
('SELECT_CL', '100', NULL, NULL),
('SELECT_VARIATION', '100', NULL, NULL),
('SELMULTIPLE', '100', NULL, NULL),
('SEL_ARTICLE', '100', NULL, NULL),
('SEL_CH', '100', NULL, NULL),
('SEL_CHANNEL_CAT', '100', NULL, NULL),
('SEL_CLUSTER', '100', NULL, NULL),
('SEL_EVENT', '100', NULL, NULL),
('SEL_FILE', '100', NULL, NULL),
('SEL_MEM', '100', NULL, NULL),
('SEL_PTML', '100', NULL, NULL),
('SEL_VAR', '100', NULL, NULL),
('SET', '100', NULL, NULL),
('SHORTEST_PATHS', '100', NULL, NULL),
('SHOW', '100', NULL, NULL),
('SHOW_ADVANCED_SEARCH', '100', NULL, NULL),
('SHOW_ALL', '100', NULL, NULL),
('SHOW_PAGEWISE', '100', NULL, NULL),
('SMA_EXT_EDIT', '100', NULL, NULL),
('SOURCE', '100', NULL, NULL),
('SPM', '100', NULL, NULL),
('SPM_CLUSTER', '100', NULL, NULL),
('SPM_EDIT', '100', NULL, NULL),
('SPM_LAUCH_SUCCESS', '100', NULL, NULL),
('SPM_META', '100', NULL, NULL),
('SPM_PATH', '100', NULL, NULL),
('SPM_RLAUNCH', '100', NULL, NULL),
('SPM_SELECTTHUMB', '100', NULL, NULL),
('SPM_THUMBNAIL', '100', NULL, NULL),
('SPM_TYPE', '100', NULL, NULL),
('SPM_VARIATIONS', '100', NULL, NULL),
('SP_BROWSE', '100', NULL, NULL),
('SP_CLNEW', '100', NULL, NULL),
('SP_CONFDESC', '100', NULL, NULL),
('SP_CONFIGURE', '100', NULL, NULL),
('SP_DELETE', '100', NULL, NULL),
('SP_DELMES', '100', NULL, NULL),
('SP_EDIT', '100', NULL, NULL),
('SP_EXPIRE', '100', NULL, NULL),
('SP_EXPIREDATE', '100', NULL, NULL),
('SP_IPROPERTIES', '100', NULL, NULL),
('SP_LAUNCH', '100', NULL, NULL),
('SP_LAUNCHDATE', '100', NULL, NULL),
('SP_LAUNCHDATES', '100', NULL, NULL),
('SP_LINK', '100', NULL, NULL),
('SP_MENUDIRECT', '100', NULL, NULL),
('SP_MENUDIRECTTIT', '100', NULL, NULL),
('SP_MENUDIRECTTITLE', '100', NULL, NULL),
('SP_MENUHELP', '100', NULL, NULL),
('SP_MENUNAME', '100', NULL, NULL),
('SP_MENUPROPS', '100', NULL, NULL),
('SP_NEWINSTANCE', '100', NULL, NULL),
('SP_NEWPAGE', '100', NULL, NULL),
('SP_PDELETE', '100', NULL, NULL),
('SP_PDELMES', '100', NULL, NULL),
('SP_PREVIEW', '100', NULL, NULL),
('SP_PROPERTIES', '100', NULL, NULL),
('SP_RLTREE', '100', NULL, NULL),
('SR_SELECTCI', '100', NULL, NULL),
('SR_SELECTCLI', '100', NULL, NULL),
('STARTDATE', '100', NULL, NULL),
('STARTTIME', '100', NULL, NULL),
('START_BAK', '100', NULL, NULL),
('STATS', '100', NULL, NULL),
('STATS_HEADER', '100', NULL, NULL),
('STATUS', '100', NULL, NULL),
('STEP', '100', NULL, NULL),
('STNAME', '100', NULL, NULL),
('SYNC_CLUSTERS', '100', NULL, NULL),
('SYNC_CLUSTERS_DESCR', '100', NULL, NULL),
('TEMPLATE', '100', NULL, NULL),
('TESTS', '100', NULL, NULL),
('TEXT_ALIGN', '100', NULL, NULL),
('TEXT_COLOR', '100', NULL, NULL),
('TEXT_STYLE', '100', NULL, NULL),
('TF', '100', NULL, NULL),
('THISMONTH', '100', NULL, NULL),
('THISWEEK', '100', NULL, NULL),
('THISYEAR', '100', NULL, NULL),
('TIME_BETW_VISITS', '100', NULL, NULL),
('TIPP_TEMPLATE_1', '100', NULL, NULL),
('TITLE', '100', NULL, NULL),
('TMPL_NAME', '100', NULL, NULL),
('TODAY', '100', NULL, NULL),
('TOP', '100', NULL, NULL),
('TOP_BROWSER', '100', NULL, NULL),
('TOP_ENTRYPAGES', '100', NULL, NULL),
('TOP_EXITPAGES', '100', NULL, NULL),
('TOP_EXITT', '100', NULL, NULL),
('TOP_HOSTS', '100', NULL, NULL),
('TOP_OS', '100', NULL, NULL),
('TOP_PAGES', '100', NULL, NULL),
('TOP_PATHS', '100', NULL, NULL),
('TOP_REFERER', '100', NULL, NULL),
('TOP_SI', '100', NULL, NULL),
('TOP_SKW', '100', NULL, NULL),
('TOTAL', '100', NULL, NULL),
('TRANSLATION', '100', NULL, NULL),
('TRANS_TEMPL', '100', NULL, NULL),
('TRANS_THIS', '100', NULL, NULL),
('TT_REFRESH', '100', NULL, NULL),
('TT_RSTCI', '100', NULL, NULL),
('TYPE', '100', NULL, NULL),
('UNIQUE', '100', NULL, NULL),
('UP', '100', NULL, NULL),
('UPL_TEXT', '100', NULL, NULL),
('UP_INTRO', '100', NULL, NULL),
('USAGE', '100', NULL, NULL),
('USERPERM_HEAD', '100', NULL, NULL),
('USER_ACTIVE', '100', NULL, NULL),
('USER_AGENT', '100', NULL, NULL),
('USER_BL', '100', NULL, NULL),
('USER_EMAIL', '100', NULL, NULL),
('USER_FILTERMENU', '100', NULL, NULL),
('USER_GENERAL', '100', NULL, NULL),
('USER_HEAD', '100', NULL, NULL),
('USER_JS', '100', NULL, NULL),
('USER_LINK', '100', NULL, NULL),
('USER_NAME', '100', NULL, NULL),
('USER_PERMGRID', '100', NULL, NULL),
('USER_PERMISSION', '100', NULL, NULL),
('USER_PERMISSIONS', '100', NULL, NULL),
('USER_PROFILE', '100', NULL, NULL),
('USER_SETPERM', '100', NULL, NULL),
('USER_TO_GROUP', '100', NULL, NULL),
('VARIATIONS', '100', NULL, NULL),
('VAR_SUCCEEDED', '100', NULL, NULL),
('VISITORS', '100', NULL, NULL),
('VISITS', '100', NULL, NULL),
('VISITS_OVERVIEW', '100', NULL, NULL),
('VIS_FIRST', '100', NULL, NULL),
('VIS_ONL', '100', NULL, NULL),
('VIS_PER_VIS', '100', NULL, NULL),
('VIS_RET', '100', NULL, NULL),
('V_EDIT', '100', NULL, NULL),
('V_NAME', '100', NULL, NULL),
('V_SHORT', '100', NULL, NULL),
('WEBSITE', '100', NULL, NULL),
('WEEKDAY', '100', NULL, NULL),
('WEEKDAY_AS', '100', NULL, NULL),
('WHEN', '100', NULL, NULL),
('WIDTH', '100', NULL, NULL),
('WRONGDATE', '100', NULL, NULL),
('WZE_ARTICLEIMPORT_SRCTYPE', '100', NULL, NULL),
('WZE_ARTICLEIMPORT_TARGET', '100', NULL, NULL),
('WZE_EXPORT_TYPE', '100', NULL, NULL),
('WZE_IMPORTING', '100', NULL, NULL),
('WZE_IMPORT_FILE', '100', NULL, NULL),
('WZE_IMPORT_VAL', '100', NULL, NULL),
('WZT_ARTICLEIMPORT_SRCTYPE', '100', NULL, NULL),
('WZT_ARTICLEIMPORT_TARGET', '100', NULL, NULL),
('WZT_DESCR', '100', NULL, NULL),
('WZT_DESCR_EXPL', '100', NULL, NULL),
('WZT_EXPORT_TYPE', '100', NULL, NULL),
('WZT_IMPORTING', '100', NULL, NULL),
('WZT_IMPORT_FILE', '100', NULL, NULL),
('WZT_IMPORT_VAL', '100', NULL, NULL),
('WZT_KEEPCLUSTER', '100', NULL, NULL),
('WZT_KEEPCLUSTER_EXPL', '100', NULL, NULL),
('WZT_SEL_EXP_RES', '100', NULL, NULL),
('WZ_ARTICLEIMPORT', '100', NULL, NULL),
('WZ_ARTICLEIMPORT_TITLE', '100', NULL, NULL),
('WZ_EXPORT_TITLE', '100', NULL, NULL),
('WZ_IMPORT_TITLE', '100', NULL, NULL),
('YES', '100', NULL, NULL),
('YESTERDAY', '100', NULL, NULL),
('LANGID', 'EN', 'Language ID', ''),
('M_ARTICLES', 'EN', 'Articles', ''),
('PAGE_ID', 'EN', 'Page ID', ''),
('NOT_FOUND', 'EN', 'There was nothing found.', ''),
('PNF', 'EN', 'The page with the ID you entered was not found.', ''),
('MODTYPE', 'EN', 'Plugin Type', ''),
('VERSION', 'EN', 'Version', ''),
('SOURCEFILE', 'EN', 'Source file', ''),
('UNINSTALL', 'EN', 'Uninstall', ''),
('UNINSTCONF', 'EN', 'Uninstalling a plugin can cause damage to the website! Do you want to proceed?', ''),
('MT_RB_CACHE_MES', 'EN', 'Rebuild Cache of all published pages', ''),
('CL_GROUP', 'EN', 'Object Group', ''),
('ACL_ACCESS', 'FR', 'Editer les permissions dans les groupes', NULL),
('ACL_GROUPEDIT', 'FR', 'SÃƒÆ’Ã‚Â©lectionner le groupe pour ÃƒÆ’Ã‚Â©diter les rÃƒÆ’Ã‚Â´les', NULL),
('ACL_GROUPS', 'FR', 'SÃƒÆ’Ã‚Â©lectionner le groupe ÃƒÆ’Ã‚Â  ajouter', NULL),
('ACL_GROUPSROLES', 'FR', 'AccÃƒÆ’Ã‚Â¨s ÃƒÆ’Ã‚Â©tranger', NULL),
('ACL_INFO', 'FR', 'AccÃƒÆ’Ã‚Â¨s hÃƒÆ’Ã‚Â©ritÃƒÆ’Ã‚Â© du parent', NULL),
('ACL_INHERIT', 'FR', 'HÃƒÆ’Ã‚Â©riter des permissions du parent', NULL),
('ACL_INHERIT_NOTE', 'FR', 'Note : quand la case est cochÃƒÆ’Ã‚Â©e, il n''y a pas d''autre configuration disponible !', NULL),
('ACL_OWNER', 'FR', 'PropriÃƒÆ’Ã‚Â©taire', NULL),
('ACL_PARENT', 'FR', 'Permissions hÃƒÆ’Ã‚Â©ritÃƒÆ’Ã‚Â©es de', NULL),
('ACL_ROLE', 'FR', 'SÃƒÆ’Ã‚Â©lectionner les rÃƒÆ’Ã‚Â´les pour le groupe', NULL),
('ACL_TITLE', 'FR', 'Configuration des permissions pour', NULL),
('ACTIVE', 'FR', 'Actif', NULL),
('ACTIVE_VARIATION', 'FR', 'Variation active', NULL),
('ADD_LINK', 'FR', 'Ajouter un lien', NULL),
('ADDITIONAL_IMAGE', 'FR', 'Image additionnelle', NULL),
('ADDITIONAL_LINK', 'FR', 'Lien additionnel', NULL),
('AFTER', 'FR', 'AprÃƒÆ’Ã‚Â¨s :', NULL),
('AGENT_CALLED', 'FR', 'Vous m''avez demandÃƒÆ’Ã‚Â© ?', NULL),
('AGENT_EXPLAINHOME', 'FR', 'Vous pouvez me trouver en cliquant sur le logo N/X, en haut ÃƒÆ’Ã‚Â  droite de la fenÃƒÆ’Ã‚Âªtre', NULL),
('AGENT_GOAWAY', 'FR', 'Cachez-vous et restez ÃƒÆ’Ã‚Â©loignÃƒÆ’Ã‚Â© !', NULL),
('AGENT_GOHOME', 'FR', 'Rentrez chez vous !', NULL),
('AGENT_LOGOUT', 'FR', 'J''espÃƒÆ’Ã‚Â¨re que vous avez bien travaillÃƒÆ’Ã‚Â© avec N/X. Bonne journÃƒÆ’Ã‚Â©e !', NULL),
('AGENT_NXHOMEPAGE', 'FR', 'Visitez le site de N/X', NULL),
('AGENT_WELCOME', 'FR', 'Bienvenue sur N/X', NULL),
('ALC_OWNER', 'FR', 'DÃƒÆ’Ã‚Â©finir le propriÃƒÆ’Ã‚Â©taire', NULL),
('ALL', 'FR', 'Tous', NULL),
('AR_EXPIRE', 'FR', 'Expirer l''article', NULL),
('AR_LAUNCH', 'FR', 'Lancer l''article', NULL),
('ARTICLE_IS_EXPIRED', 'FR', 'L''article a expirÃƒÆ’Ã‚Â©', NULL),
('ARTICLE_IS_LIVE', 'FR', 'L''article est en ligne', NULL),
('ARTICLE_VARIATION_MISSING', 'FR', 'La variation de cet article n''existe pas encore.', NULL),
('ARTICLES', 'FR', 'Articles', NULL),
('AUTH_GROUP', 'FR', 'Authentification', NULL),
('AUTHOR', 'FR', 'Auteur', NULL),
('AVAIL_ITEMS', 'FR', 'EntrÃƒÆ’Ã‚Â©es disponibles', NULL),
('AVAIL_VARIATIONS', 'FR', 'Variations disponibles', NULL),
('AVERAGE', 'FR', 'Moyenne', NULL),
('AVG_CLICKSTREAM', 'FR', 'Taux de clics moyen', NULL),
('AVG_VIS_LENGTH', 'FR', 'Temps moyen de visite (secondes)', NULL),
('AVG_VISIT_LENGTH', 'FR', 'Temps moyen de visite', NULL),
('BACK', 'FR', 'Retour', NULL),
('BACK_INFO', 'FR', 'La liste ci-dessous montre les sauvegardes de N/X sur votre serveur. Vous pouvez supprimer les sauvegardes ici. Pour restaurer une sauvegarde, vous devez vous connecter manuellement au serveur et restaurer les fichiers.', NULL),
('BACK_TO_CV', 'FR', 'Retour ÃƒÆ’Ã‚Â  la vue d''ensemble du cluster', NULL),
('BACK_TO_OVERVIEW', 'FR', 'Retour ÃƒÆ’Ã‚Â  la vue d''ensemble', NULL),
('BACKUP', 'FR', 'Sauvegarde systÃƒÆ’Ã‚Â¨me', NULL),
('BAK_FILE', 'FR', 'Fichier de sauvegarde', NULL),
('BAK_TIPP', 'FR', 'Vous pouvez sauvegarder votre base de donnÃƒÆ’Ã‚Â©es et les dossiers de site www et wwwdev ici. VÃƒÆ’Ã‚Â©rifiez que vous avez bien configurÃƒÆ’Ã‚Â© la sauvegarde dans settings.inc.php !', NULL),
('BEGIN', 'FR', 'DÃƒÆ’Ã‚Â©marrer', NULL),
('BY', 'FR', 'par', NULL),
('BY_ORDER', 'FR', 'Par ordre', NULL),
('CACHED', 'FR', 'Page de cache', NULL),
('CAL_BTO', 'FR', 'Retour ÃƒÆ’Ã‚Â  la vue d''ensemble', NULL),
('CAL_EDIT', 'FR', 'Editer le rendez-vous', NULL),
('CAL_NAME', 'FR', 'Nom du calendrier', NULL),
('CALENDAR', 'FR', 'Calendrier', NULL),
('CALENDAR_SELECT', 'FR', 'SÃƒÆ’Ã‚Â©lectionner un calendrier', NULL),
('CALENDARS', 'FR', 'Calendriers', NULL),
('CALENDARS_CAT_DEFINE', 'FR', 'DÃƒÆ’Ã‚Â©finir les catÃƒÆ’Ã‚Â©gories', NULL),
('CALENDARS_DEFINE', 'FR', 'DÃƒÆ’Ã‚Â©finir les calendriers', NULL),
('CALENDARS_EDIT', 'FR', 'Editer le calendrier', NULL),
('CALENDARS_TIPP', 'FR', 'Vous pouvez crÃƒÆ’Ã‚Â©er plusieurs calendriers ici. Chaque calendrier aura ses propres ÃƒÆ’Ã‚Â©vÃƒÆ’Ã‚Â©nements et dates.', NULL),
('CANCEL', 'FR', 'Annuler', NULL),
('CAT_NAME', 'FR', 'CatÃƒÆ’Ã‚Â©gorie', NULL),
('CATEGORY', 'FR', 'CatÃƒÆ’Ã‚Â©gorie', NULL),
('CH_ADMIN', 'FR', 'Administration du canal', NULL),
('CH_ARTICLE_DATE', 'FR', 'Date de l''article', NULL),
('CH_CAT', 'FR', 'DÃƒÆ’Ã‚Â©finir les catÃƒÆ’Ã‚Â©gories', NULL),
('CH_CAT2', 'FR', 'Canal et catÃƒÆ’Ã‚Â©gorie', NULL),
('CHANGE_TEMPLATE', 'FR', 'Changer de modÃƒÆ’Ã‚Â¨le', NULL),
('CHANNEL', 'FR', 'Canal', NULL),
('CHANNEL_GRABMP', 'FR', NULL, NULL),
('CHANNEL_IMPORTARTICLES', 'FR', 'Importer des articles', NULL),
('CHANNEL_SELECT', 'FR', 'SÃƒÆ’Ã‚Â©lectionner un canal', NULL),
('CHANNELS', 'FR', 'Canaux', NULL),
('CHOOSEFILE', 'FR', 'Choisir un fichier', NULL),
('CL_BROWSE', 'FR', 'Voir les clusters', NULL),
('CL_CREATEINSMES', 'FR', 'Il reste des emplacements pour crÃƒÆ’Ã‚Â©er d''autres instances de ce champ de contenu. Si vous voulez crÃƒÆ’Ã‚Â©er une autre instance, entrez un titre dans le champ texte ci-dessous et appuyez sur CrÃƒÆ’Ã‚Â©er.', NULL),
('CL_CREATEINSTANC', 'FR', 'CrÃƒÆ’Ã‚Â©er une nouvelle instance', NULL),
('CL_DEL', 'FR', 'Supprimer l''instance', NULL),
('CL_DELMES', 'FR', 'Voulez-vous vraiment supprimer cette instance de cluster ? Toutes les donnÃƒÆ’Ã‚Â©es seront perdues !', NULL),
('CL_EDIT', 'FR', 'Modifier l''instance du cluster', NULL),
('CL_EXPIRE', 'FR', 'Expirer le cluster', NULL),
('CL_LAUNCH', 'FR', 'Lancer le cluster', NULL),
('CL_NAME', 'FR', 'Nom du cluster', NULL),
('CL_NEW', 'FR', 'Nouvelle instance', NULL),
('CL_NOTITLE', 'FR', 'Aucun titre dÃƒÆ’Ã‚Â©fini', NULL),
('CL_PROPERTIES', 'FR', 'PropriÃƒÆ’Ã‚Â©tÃƒÆ’Ã‚Â©s du cluster', NULL),
('CL_SELECT', 'FR', 'SÃƒÆ’Ã‚Â©lectionnez un cluster pour le lier ÃƒÆ’Ã‚Â  un modÃƒÆ’Ã‚Â¨le de cluster', NULL),
('CLASS_WRONG', 'FR', 'Le fichier spÃƒÆ’Ã‚Â©cifiÃƒÆ’Ã‚Â© n''a pas de signature de classe valide !', NULL),
('CLEAR', 'FR', 'Effacer', NULL),
('CLEAR_MEDIA', 'FR', 'Supprimer le fichier depuis la base de donnÃƒÆ’Ã‚Â©es', NULL),
('CLI', 'FR', 'Instance de cluster', NULL),
('CLI_DELETE', 'FR', 'Supprimer le membre de cluster', NULL),
('CLI_DELETED', 'FR', 'L''instance a ÃƒÆ’Ã‚Â©tÃƒÆ’Ã‚Â© supprimÃƒÆ’Ã‚Â©e.', NULL),
('CLI_DELETEMES', 'FR', 'Voulez-vous vraiment supprimer cette instance ? Elle sera perdue ÃƒÆ’Ã‚Â  jamais !', NULL),
('CLI_EDIT', 'FR', 'Modifier le membre de cluster', NULL),
('CLI_NOTDELETED', 'FR', 'Cette instance ne peut pas ÃƒÆ’Ã‚Âªtre supprimÃƒÆ’Ã‚Â©e !', NULL),
('CLK_PATHS', 'FR', 'Chemins des clics', NULL),
('CLT', 'FR', 'ModÃƒÆ’Ã‚Â¨le de cluster', NULL),
('CLT_BROWSE', 'FR', 'Voir les modÃƒÆ’Ã‚Â¨les de clusters', NULL),
('CLT_DELETE', 'FR', 'Supprimer le modÃƒÆ’Ã‚Â¨le de cluster', NULL),
('CLT_DELMES', 'FR', 'Vous ÃƒÆ’Ã‚Âªtes sur le point de supprimer un modÃƒÆ’Ã‚Â¨le de cluster. Cela entraÃƒÆ’Ã‚Â®nera la perte de toutes les donnÃƒÆ’Ã‚Â©es crÃƒÆ’Ã‚Â©ÃƒÆ’Ã‚Â©es avec ce modÃƒÆ’Ã‚Â¨le. Voulez-vous vraiment continuer ?', NULL),
('CLT_EXCLUSIVE', 'FR', 'Contenu dÃƒÆ’Ã‚Â©veloppeur', NULL),
('CLT_MAXCARD', 'FR', '', NULL),
('CLT_MINCARD', 'FR', 'Instances', NULL),
('CLT_NAME', 'FR', 'Nom du modÃƒÆ’Ã‚Â¨le de cluster', NULL),
('CLT_NEW', 'FR', 'Nouveau modÃƒÆ’Ã‚Â¨le de cluster', NULL),
('CLT_PROPERTIES', 'FR', 'PropriÃƒÆ’Ã‚Â©tÃƒÆ’Ã‚Â©s du modÃƒÆ’Ã‚Â¨le de cluster', NULL),
('CLT_SCHEME', 'FR', 'Modifier le schÃƒÆ’Ã‚Â©ma du modÃƒÆ’Ã‚Â¨le de cluster', NULL),
('CLT_SELECT', 'FR', 'SÃƒÆ’Ã‚Â©lectionner des modÃƒÆ’Ã‚Â¨les de clusters', NULL),
('CLTI_DELETE', 'FR', 'Voulez-vous vraiment supprimer cette entrÃƒÆ’Ã‚Â©e ? Toutes les instances seront aussi perdues !', NULL),
('CLTPOSITION', 'FR', 'Position', NULL),
('CLUSTER', 'FR', 'Cluster', NULL),
('CLUSTER_INFORMATION', 'FR', 'Informations de cet enregistrement', NULL),
('CLUSTER_TEMPLATE', 'FR', 'ModÃƒÆ’Ã‚Â¨le de cluster', NULL),
('CMPTYPE', 'FR', 'Type de composition', NULL),
('COLOR', 'FR', 'Couleur', NULL),
('COMB_ALL', 'FR', 'Tout sÃƒÆ’Ã‚Â©lectionner', NULL),
('COMB_NONE', 'FR', 'Tout effacer', NULL),
('COMMENT', 'FR', 'Commentaire', NULL),
('COMMIT', 'FR', 'Proposer', NULL),
('CONFIG', 'FR', 'Configurer', NULL),
('CONFIGURED', 'FR', 'PrÃƒÆ’Ã‚Âªt ÃƒÆ’Ã‚Â  l''utilisation', NULL),
('CONFIRM_DELETE', 'FR', 'Voulez-vous vraiment supprimer cette entrÃƒÆ’Ã‚Â©e ?', NULL),
('CONFIRM_UNSAVED_CHANGES', 'FR', 'Note : les modifications non enregistrÃƒÆ’Ã‚Â©es seront perdues si vous continuez. Si vous avez dÃƒÆ’Ã‚Â©jÃƒÆ’Ã‚Â  modifiÃƒÆ’Ã‚Â© quelque chose, vous pouvez annuler et enregistrer votre travail. On continue ? ', NULL),
('CONTAINERNAME', 'FR', 'ModÃƒÆ’Ã‚Â¨le', NULL),
('CONTENT', 'FR', 'Contenu', NULL),
('CONTENT_DESC', 'FR', 'Description du contenu', NULL),
('CONTENTITEM', 'FR', 'EntrÃƒÆ’Ã‚Â©e de contenu', NULL),
('CONTENTTYPE', 'FR', 'Type de contenu', NULL),
('COPY_CLUSTER', 'FR', 'Copier des clusters', NULL),
('COUNT', 'FR', 'Compteur', NULL),
('CP_GROUP', 'FR', 'Groupe composÃƒÆ’Ã‚Â©', NULL),
('CPG_MEMBERS_SELECT', 'FR', 'SÃƒÆ’Ã‚Â©lectionner des membres de ce groupe de composition', NULL),
('CR_CONTENT', 'FR', 'CrÃƒÆ’Ã‚Â©er du contenu pour cette page ?', NULL),
('CREATE', 'FR', 'CrÃƒÆ’Ã‚Â©er un article', NULL),
('CREATE_ARTICLE', 'FR', 'CrÃƒÆ’Ã‚Â©er un nouvel article dans le canal', NULL),
('CREATE_INSTANCES', 'FR', 'CrÃƒÆ’Ã‚Â©er des instances', NULL),
('CREATED', 'FR', 'CrÃƒÆ’Ã‚Â©ÃƒÆ’Ã‚Â©', NULL),
('CREATED_AT', 'FR', 'CrÃƒÆ’Ã‚Â©ÃƒÆ’Ã‚Â© le', NULL),
('CREATENEW', 'FR', 'Un nouveau membre de ce modÃƒÆ’Ã‚Â¨le a ÃƒÆ’Ã‚Â©tÃƒÆ’Ã‚Â© crÃƒÆ’Ã‚Â©ÃƒÆ’Ã‚Â©. Voir les donnÃƒÆ’Ã‚Â©es ci-dessous', NULL),
('DATE', 'FR', 'Date', NULL),
('DATEFORMAT', 'FR', 'Ce format de date n''est pas correct !', NULL),
('DEL_ARTICLE', 'FR', 'Voulez-vous vraiment supprimer cet article dans toutes ses variations ?', NULL),
('DEL_FOLDER', 'FR', 'Supprimer le dossier', NULL),
('DELETE', 'FR', 'Supprimer', NULL),
('DELETE_PAGE', 'FR', 'Supprimer la page', NULL),
('DELETESUCCESS', 'FR', 'Les donnÃƒÆ’Ã‚Â©es ci-dessous ont ÃƒÆ’Ã‚Â©tÃƒÆ’Ã‚Â© supprimÃƒÆ’Ã‚Â©es de la base de donnÃƒÆ’Ã‚Â©es. Elles sont maintenant perdues !', NULL),
('DESC', 'FR', 'Description', NULL),
('DESCRIPTION', 'FR', 'Description', NULL),
('DESTROY_EXCLUSIVE_CONTENT', 'FR', 'DÃƒÆ’Ã‚Â©truire le contenu exclusif', NULL),
('DESTROY_TREE', 'FR', 'DÃƒÆ’Ã‚Â©truire l''arborescence', NULL),
('DISABLE', 'FR', 'DÃƒÆ’Ã‚Â©sactiver', NULL),
('DISPLAY', 'FR', 'Afficher', NULL),
('DOSOMETHING', 'FR', 'SÃƒÆ’Ã‚Â©lectionnez l''action que vous souhaitez. Vous pouvez insÃƒÆ’Ã‚Â©rer des entrÃƒÆ’Ã‚Â©es, les modifier, les supprimer et changer leur ordre.', NULL),
('DOWN', 'FR', 'Bas', NULL),
('DWEXT_CONTENTFIE', 'FR', 'GÃƒÆ’Ã‚Â©nÃƒÆ’Ã‚Â©rer les informations du champ de contenu', NULL),
('DWEXT_CONTENTFIELDINFO', 'FR', 'GÃƒÆ’Ã‚Â©nÃƒÆ’Ã‚Â©rer les informations du champ de contenu', NULL),
('DWEXT_CONTENTFIELDINFO_MES', 'FR', 'GÃƒÆ’Ã‚Â©nÃƒÆ’Ã‚Â©rer les informations du champ de contenu pour Dreamweaver MX', NULL),
('ED_CLT', 'FR', 'Modifier le modÃƒÆ’Ã‚Â¨le de cluster', NULL),
('ED_CONTENT', 'FR', 'Modifier le contenu', NULL),
('ED_CPGROUP', 'FR', 'Modifier le groupe de composition', NULL),
('ED_CPGROUPGENERAL', 'FR', 'Modifier le groupe gÃƒÆ’Ã‚Â©nÃƒÆ’Ã‚Â©ral', NULL),
('ED_DISPATCHER', 'FR', 'Utilisez ce bouton pour basculer entre la modification des mÃƒÆ’Ã‚Â©ta-donnÃƒÆ’Ã‚Â©es et la modification du contenu.', NULL),
('ED_META', 'FR', 'Modifier les mÃƒÆ’Ã‚Â©ta-donnÃƒÆ’Ã‚Â©es', NULL),
('ED_PROPERTIES', 'FR', 'Modifier les propriÃƒÆ’Ã‚Â©tÃƒÆ’Ã‚Â©s', NULL),
('EDIT', 'FR', 'Modifier', NULL),
('EDIT_ACCESS', 'FR', 'DÃƒÆ’Ã‚Â©finir les accÃƒÆ’Ã‚Â¨s', NULL),
('EDIT_ALL', 'FR', 'Modifier tout', NULL),
('EDIT_ARTICLE', 'FR', 'Modifier l''article', NULL),
('EDIT_CONTENT', 'FR', 'Modifier le contenu', NULL),
('EDIT_FOLDER', 'FR', 'Modifier le dossier', NULL),
('EDIT_SPM', 'FR', 'Modifier les propriÃƒÆ’Ã‚Â©tÃƒÆ’Ã‚Â©s du modÃƒÆ’Ã‚Â¨le', NULL),
('EDIT_TEMPLATE', 'FR', 'Modifier le modÃƒÆ’Ã‚Â¨le', NULL),
('EDITED', 'FR', 'ModifiÃƒÆ’Ã‚Â©', NULL),
('EMPTY', 'FR', '<vide>', NULL),
('ENDATE', 'FR', 'Date de fin', NULL),
('ENDTIME', 'FR', 'Heure de fin', NULL),
('ENVIRONMENT', 'FR', 'Environnement', NULL),
('ERROR', 'FR', 'Une erreur est apparue pendant l''opÃƒÆ’Ã‚Â©ration sÃƒÆ’Ã‚Â©lectionnÃƒÆ’Ã‚Â©e !', NULL),
('ERROR_SEL_GROUP', 'FR', 'Vous devez choisir un groupe !', NULL),
('ERROR_SEL_ROLE', 'FR', 'Vous devez choisir au moins un rÃƒÆ’Ã‚Â´le !', NULL),
('EXEC_EXPORT', 'FR', 'Exportation de la ressource en cours', NULL),
('EXP_REPORT', 'FR', 'Exportation des donnÃƒÆ’Ã‚Â©es suivantes en cours', NULL),
('EXPIRE', 'FR', 'Expirer', NULL),
('EXPL_EXEC_EXPORT', 'FR', 'Ce systÃƒÆ’Ã‚Â¨me gÃƒÆ’Ã‚Â©nÃƒÆ’Ã‚Â¨re actuellement un fichier XML d''exportation.<br/><br/>Dans quelques secondes, une fenÃƒÆ’Ã‚Âªtre apparaÃƒÆ’Ã‚Â®tra. Cliquez sur Enregistrer pour placer la ressource sur votre disque.', NULL),
('EXPL_SEL_CH', 'FR', 'Choisissez un canal.', NULL),
('EXPL_SEL_CLUSTER', 'FR', 'AprÃƒÆ’Ã‚Â¨s avoir choisi un modÃƒÆ’Ã‚Â¨le de cluster, vous pourrez choisir un cluster dans la liste qui apparaÃƒÆ’Ã‚Â®tra.', NULL),
('EXPL_SEL_SPM', 'FR', 'Choisissez un modÃƒÆ’Ã‚Â¨le de page.', NULL),
('EXPLORE', 'FR', 'Explorer', NULL),
('EXPORT_DATA', 'FR', 'Assistant d''exportation du contenu et des modÃƒÆ’Ã‚Â¨les', NULL),
('FILTER_COLUMN', 'FR', 'ÃƒÂ¢Ã¢â€šÂ¬Ã‚Â¦dans', NULL),
('FILTER_RULE', 'FR', 'ChercherÃƒÂ¢Ã¢â€šÂ¬Ã‚Â¦', NULL),
('FIND_OBJ', 'FR', 'Trouver l''objet', NULL),
('FOLDER', 'FR', 'Dossier', NULL),
('FOLDER_DELMES', 'FR', 'Voulez-vous vraiment supprimer ce dossier ?', NULL),
('FULL_NAME', 'FR', 'Nom complet', NULL),
('GO', 'FR', 'Allez !', NULL),
('GOTO_CL', 'FR', 'Aller au cluster', NULL),
('GROUP_DESCRIPTIO', 'FR', 'Description', NULL),
('GROUP_DESCRIPTION', 'FR', 'Description', NULL),
('GROUP_FILTERMENU', 'FR', 'Administration des groupes', NULL),
('GROUP_HEAD', 'FR', 'Profil du groupe', NULL),
('GROUP_LINK', 'FR', 'Profils des groupes', NULL),
('GROUP_NAME', 'FR', 'Nom du groupe', NULL),
('HELP', 'FR', 'Aide', NULL),
('HELP_ACCESS', 'FR', 'Un dispositif existe pour crÃƒÆ’Ã‚Â©er et gÃƒÆ’Ã‚Â©rer des profils d''utilisateur dans N/X.', NULL),
('HELP_ARTICLES', 'EN', 'The form displays articles.<br><br>The color codes are:<li>red: article not published<li>grey: article not translated<li>green: article published', ''),
('HELP_BACKUP', 'FR', 'La liste ci-dessous montre les sauvegardes de N/X sur votre serveur. Vous pouvez supprimer les sauvegardes ici. Pour restaurer une sauvegarde, vous devez vous connecter manuellement au serveur et restaurer les fichiers.', NULL),
('HELP_CHANNEL', 'FR', 'CatÃƒÆ’Ã‚Â©gories de thÃƒÆ’Ã‚Â¨mes dÃƒÆ’Ã‚Â©finissant le contenu des articles crÃƒÆ’Ã‚Â©ÃƒÆ’Ã‚Â©s par N/X (par exemple, News, PersonnesÃƒÂ¢Ã¢â€šÂ¬Ã‚Â¦).', NULL),
('HELP_CLB', 'FR', 'Un cluster est une collection de champs de contenu dynamiques ou statiques, complÃƒÆ’Ã‚Â©tÃƒÆ’Ã‚Â©s par un dÃƒÆ’Ã‚Â©veloppeur ou un rÃƒÆ’Ã‚Â©dacteur de pages Web. La dÃƒÆ’Ã‚Â©finition de la structure dans N/X est faite avec des clusters de donnÃƒÆ’Ã‚Â©es.', NULL),
('HELP_CLT', 'FR', 'Le modÃƒÆ’Ã‚Â¨le de cluster est un formulaire qui vous permet de crÃƒÆ’Ã‚Â©er la structure des donnÃƒÆ’Ã‚Â©es pour votre site et de dÃƒÆ’Ã‚Â©finir le type de contenu. Ensuite, le modÃƒÆ’Ã‚Â¨le de cluster est fusionnÃƒÆ’Ã‚Â© avec un modÃƒÆ’Ã‚Â¨le de page qui gÃƒÆ’Ã‚Â¨re le contenu de la page Web.', NULL),
('HELP_COMPGRP', 'FR', 'Le groupe de composition est un groupe de clusters. Les modÃƒÆ’Ã‚Â¨les de clusters peuvent avoir leur propre disposition. Ceci vous permet de construire votre page Web hors de blocs (par exemple, articles de news, sondage, galerie de photos... le tout sur une page et sur demande).', NULL),
('HELP_DW', 'FR', 'CrÃƒÆ’Ã‚Â©e un dossier de configuration pour l''extension N/X de Dreamweaver. A l''aide de cette extension, des modÃƒÆ’Ã‚Â¨les peuvent ÃƒÆ’Ã‚Âªtre dÃƒÆ’Ã‚Â©veloppÃƒÆ’Ã‚Â©s avec Dreamweaver.', NULL),
('HELP_METATEMP', 'FR', 'Un modÃƒÆ’Ã‚Â¨le de mÃƒÆ’Ã‚Â©ta-donnÃƒÆ’Ã‚Â©e est utilisÃƒÆ’Ã‚Â© pour dÃƒÆ’Ã‚Â©finir quels champs de mÃƒÆ’Ã‚Â©ta-donnÃƒÆ’Ã‚Â©es seront placÃƒÆ’Ã‚Â©s dans une nouvelle page. Quand vous crÃƒÆ’Ã‚Â©ez un nouveau champ de mÃƒÆ’Ã‚Â©ta-donnÃƒÆ’Ã‚Â©e dans le modÃƒÆ’Ã‚Â¨le, chaque nouvelle page basÃƒÆ’Ã‚Â©e sur ce modÃƒÆ’Ã‚Â¨le contiendra ce champ.', NULL),
('HELP_OBJBROWSE', 'FR', 'La bibliothÃƒÆ’Ã‚Â¨que de contenu contient tous les ÃƒÆ’Ã‚Â©lÃƒÆ’Ã‚Â©ments de contenu du site', NULL),
('HELP_PAGETEMP', 'FR', 'Dans les tableurs et les applications de base de donnÃƒÆ’Ã‚Â©es, un modÃƒÆ’Ã‚Â¨le est un formulaire vide qui montre quels champs existent, leur emplacement et leur longueur. Dans N/X, les modÃƒÆ’Ã‚Â¨les sont ÃƒÆ’Ã‚Â  la base de son fonctionnement. Un modÃƒÆ’Ã‚Â¨le est un formulaire dans lequel toutes les cellules ont ÃƒÆ’Ã‚Â©tÃƒÆ’Ã‚Â© dÃƒÆ’Ã‚Â©finies mais aucune donnÃƒÆ’Ã‚Â©e n''a encore ÃƒÆ’Ã‚Â©tÃƒÆ’Ã‚Â© saisie.', NULL),
('HELP_PGN', 'FR', 'Les extensions vous permettent d''ÃƒÆ’Ã‚Â©tendre les fonctions de N/X. Typiquement, des extensions sont employÃƒÆ’Ã‚Â©es pour crÃƒÆ’Ã‚Â©er de nouveaux types d''objets, en plus des deux types d''objets standards Text et Image.', NULL),
('HELP_PURGE', 'FR', 'Supprime les informations inutiles de la base de donnÃƒÆ’Ã‚Â©es.', NULL),
('HELP_ROLLOUT', 'FR', 'Rollout est un dispositif de N/X qui permet de crÃƒÆ’Ã‚Â©er des copies d''une section de votre page Web et de les rÃƒÆ’Ã‚Â©utiliser avec ou sans l''ancien contenu.', NULL),
('HELP_SP', 'FR', 'Le plan du site est utilisÃƒÆ’Ã‚Â© pour modifier la structure et les pages du site.', NULL),
('HELP_SYNCCL', 'FR', 'Dispositif utilisÃƒÆ’Ã‚Â© pour synchroniser les clusters aprÃƒÆ’Ã‚Â¨s avoir modifiÃƒÆ’Ã‚Â© ou changÃƒÆ’Ã‚Â© un modÃƒÆ’Ã‚Â¨le de cluster.', NULL),
('HELP_VARIATION', 'FR', 'Un contenu peut avoir plusieurs variations. Ces variations peuvent ÃƒÆ’Ã‚Âªtre des langues diffÃƒÆ’Ã‚Â©rentes ou des profils de contenu diffÃƒÆ’Ã‚Â©rents.', NULL),
('HIDE', 'FR', 'Cacher', NULL),
('HOUR', 'FR', 'Heures', NULL),
('HOURS_AS', 'FR', 'Analyse des heures', NULL),
('I_AFTER', 'FR', 'InsÃƒÆ’Ã‚Â©rer aprÃƒÆ’Ã‚Â¨s', NULL),
('IMPORT_DATA', 'FR', 'Importer des donnÃƒÆ’Ã‚Â©es N/X-XML', NULL),
('IN_CHANNEL', 'FR', 'dans le canal', NULL),
('IND_TIME', 'FR', 'Fuseau horaire individuel', NULL),
('INDIV_CONFIG', 'FR', 'Configuration individuelle pour cette entrÃƒÆ’Ã‚Â©e', NULL),
('INSNAME', 'FR', '<Nom du cluster>', NULL),
('INSTANCE_CREATED', 'FR', 'Une nouvelle instance de cette entrÃƒÆ’Ã‚Â©e a ÃƒÆ’Ã‚Â©tÃƒÆ’Ã‚Â© crÃƒÆ’Ã‚Â©ÃƒÆ’Ã‚Â©e.', NULL),
('INSTANCES_CREATED', 'FR', 'De nouvelles instances de cette entrÃƒÆ’Ã‚Â©e ont ÃƒÆ’Ã‚Â©tÃƒÆ’Ã‚Â© crÃƒÆ’Ã‚Â©ÃƒÆ’Ã‚Â©es.', NULL),
('IS_COMPOUND', 'FR', 'ModÃƒÆ’Ã‚Â¨le de cluster de composition', NULL),
('IS_FILTERED', 'FR', 'Note : vous ne pouvez pas afficher tous les enregistrements parce que vous utilisez un filtre !  ', NULL),
('KEEP_CLUSTER', 'FR', 'Garder le cluster original', NULL),
('KEYWORDS', 'FR', 'Mots-clÃƒÆ’Ã‚Â©s', NULL),
('LAST_LAUNCHED_AT', 'FR', 'Dernier lancement ÃƒÆ’Ã‚Â ', NULL),
('LAST_MOD_AT', 'FR', 'DerniÃƒÆ’Ã‚Â¨re modification ÃƒÆ’Ã‚Â ', NULL),
('LASTMONTH', 'FR', 'Mois dernier', NULL),
('LASTWEEK', 'FR', 'Semaine derniÃƒÆ’Ã‚Â¨re', NULL),
('LASTYEAR', 'FR', 'AnnÃƒÆ’Ã‚Â©e derniÃƒÆ’Ã‚Â¨re', NULL),
('LAUNCH', 'FR', 'Lancement', NULL),
('LEAVE_EMPTY', 'FR', 'Laisser vide', NULL),
('LIBRARY', 'FR', 'BibliothÃƒÆ’Ã‚Â¨que de contenu', NULL),
('LINKED', 'FR', 'LiÃƒÆ’Ã‚Â© ÃƒÆ’Ã‚Â ', NULL),
('LIVE_AUTHORING', 'FR', 'Gestion en direct', NULL),
('LOCATION', 'FR', 'Emplacement, si externe', NULL),
('LOCK_MENU', 'FR', 'Bloquer le menu', NULL),
('LOGFILE', 'FR', 'Voir les logs systÃƒÆ’Ã‚Â¨me', NULL),
('LOGGED_AS', 'FR', 'Utilisateur connectÃƒÆ’Ã‚Â©', NULL),
('LOGIN_FAILED', 'FR', 'L''identifiant saisi ne peut pas ÃƒÆ’Ã‚Âªtre vÃƒÆ’Ã‚Â©rifiÃƒÆ’Ã‚Â© ! Essayez de nouveau.', NULL),
('LOGS', 'FR', 'Analyse du fichier de logs', NULL),
('LOGS_INFO', 'FR', 'La liste ci-dessous montre les logs rÃƒÆ’Ã‚Â©alisÃƒÆ’Ã‚Â©s pendant que N/X fonctionne.', NULL),
('LONGEST_PATHS', 'FR', 'Chemins les plus longs', NULL),
('M_ACCESS', 'FR', 'AccÃƒÆ’Ã‚Â¨s', NULL),
('M_ADMIN', 'FR', 'Administration', NULL),
('M_BACKUP', 'FR', 'Sauvegarde', NULL),
('M_BROWSER', 'FR', 'Navigateur d''objets', NULL),
('M_CHANNELS', 'FR', 'Canaux', NULL),
('M_CLB', 'FR', 'Navigateur de clusters', NULL),
('M_CLT', 'FR', 'ModÃƒÆ’Ã‚Â¨les de clusters', NULL),
('M_CLTB', 'FR', 'Navigateur de modÃƒÆ’Ã‚Â¨les de clusters', NULL),
('M_CLUSTERS', 'FR', 'Clusters', NULL),
('M_COMBOBJ', 'FR', 'Contenus combinÃƒÆ’Ã‚Â©s (cluster)', NULL),
('M_ES', 'FR', 'Explorer le site', NULL),
('M_EXPORT_WZ', 'FR', 'Assistant d''exportation', NULL),
('M_HELP', 'FR', 'Aide', NULL),
('M_HOME', 'FR', 'Accueil', NULL),
('M_IMPORT_WZ', 'FR', 'Assistant d''importation', NULL),
('M_INSTALLPLUGIN', 'FR', 'Extensions', NULL),
('M_LIB', 'FR', 'BibliothÃƒÆ’Ã‚Â¨que', NULL),
('M_LOGOUT', 'FR', 'Se dÃƒÆ’Ã‚Â©connecter', NULL),
('M_MAINTENANCE', 'FR', 'Maintenance', NULL),
('M_META', 'FR', 'ModÃƒÆ’Ã‚Â¨les de mÃƒÆ’Ã‚Â©ta', NULL),
('M_MYPROFILE', 'FR', 'Mon profil', NULL),
('M_MYPRT', 'FR', 'Mes portails', NULL),
('M_PGN', 'FR', 'ContrÃƒÆ’Ã‚Â´le des extensions', NULL),
('M_PRTMAN', 'FR', 'Gestionnaire de portail', NULL),
('M_PTEMP', 'FR', 'ModÃƒÆ’Ã‚Â¨les de pages', NULL),
('M_PURGE', 'FR', 'Nettoyer le base de donnÃƒÆ’Ã‚Â©es', NULL),
('M_REPORT', 'FR', 'Rapport de site', NULL),
('M_ROLLOUT', 'FR', 'Bascule', NULL),
('M_SPM', 'FR', 'Page de site maÃƒÆ’Ã‚Â®tre', NULL),
('M_TEMP', 'FR', 'ModÃƒÆ’Ã‚Â¨les', NULL),
('M_TRANSLATION', 'FR', 'Traduction', NULL),
('M_UMAN', 'FR', 'Gestion des utilisateurs', NULL),
('M_VAR', 'FR', 'Variations', NULL),
('M_WWW', 'FR', 'Site Web', NULL),
('MANDATORY', 'FR', 'Ce champ ne peut pas ÃƒÆ’Ã‚Âªtre vide !', NULL),
('MAXIMUM', 'FR', 'Maximum', NULL),
('MAXIMUMAT', 'FR', 'Maximum ÃƒÆ’Ã‚Â ', NULL),
('MEDIAN', 'FR', 'MÃƒÆ’Ã‚Â©dian', NULL),
('MENU', 'FR', 'Menu', NULL),
('MESSAGE', 'FR', 'Message', NULL),
('METATEMPLATE', 'FR', 'ModÃƒÆ’Ã‚Â¨le de mÃƒÆ’Ã‚Â©ta-clÃƒÆ’Ã‚Â© additionnel', NULL),
('METATEMPLATES', 'FR', 'ModÃƒÆ’Ã‚Â¨les de mÃƒÆ’Ã‚Â©ta-donnÃƒÆ’Ã‚Â©es', NULL),
('MH_GETSTART', 'FR', 'Pour commencer', NULL),
('MH_GLOSSARY', 'FR', 'Lexique', NULL),
('MINIMUM', 'FR', 'Minimum', NULL),
('MINIMUMAT', 'FR', 'Minimum ÃƒÆ’Ã‚Â ', NULL),
('MT_ADDITIONAL', 'FR', 'MÃƒÆ’Ã‚Â©ta-donnÃƒÆ’Ã‚Â©es additionnelles', NULL),
('MT_BASE', 'FR', 'MÃƒÆ’Ã‚Â©ta-donnÃƒÆ’Ã‚Â©es basiques', NULL),
('MT_DELETE', 'FR', 'Voulez-vous vraiment supprimer cette partie du modÃƒÆ’Ã‚Â¨le de mÃƒÆ’Ã‚Â©ta ? Toute les informations ÃƒÆ’Ã‚Â©crites dans n''importe quelle mÃƒÆ’Ã‚Â©ta-donnÃƒÆ’Ã‚Â©e liÃƒÆ’Ã‚Â©e ÃƒÆ’Ã‚Â  la prÃƒÆ’Ã‚Â©sente partie seront supprimÃƒÆ’Ã‚Â©es. Les donnÃƒÆ’Ã‚Â©es vont ÃƒÆ’Ã‚Âªtre perdues ÃƒÆ’Ã‚Â  jamais ! ', NULL),
('MT_DW_CONTENT', 'FR', 'Extension Dreamweaver', NULL),
('MT_DW_CONTENTFIE', 'FR', 'Informations du champ de contenu Dreamweaver', NULL),
('MT_DW_CONTENTFIELDINFO', 'FR', 'Informations du champ de contenu Dreamweaver', NULL),
('MT_GENERATE_DTA', 'FR', 'GÃƒÆ’Ã‚Â©nÃƒÆ’Ã‚Â©rer les types de donnÃƒÆ’Ã‚Â©es', NULL),
('MT_GENERATE_DTA_', 'FR', 'gÃƒÆ’Ã‚Â©nÃƒÆ’Ã‚Â¨re les types de donnÃƒÆ’Ã‚Â©es', NULL),
('MT_GENERATE_DTA_MES', 'FR', 'gÃƒÆ’Ã‚Â©nÃƒÆ’Ã‚Â¨re les types de donnÃƒÆ’Ã‚Â©es', NULL),
('MT_GENERATE_DTA_SUCCEEDED', 'FR', '<br><br>Les types de donnÃƒÆ’Ã‚Â©es ont ÃƒÆ’Ã‚Â©tÃƒÆ’Ã‚Â© gÃƒÆ’Ã‚Â©nÃƒÆ’Ã‚Â©rÃƒÆ’Ã‚Â©s avec succÃƒÆ’Ã‚Â¨s et le fichier ÃƒÆ’Ã‚Â©crit.<br>', NULL),
('MT_LW_SITE', 'FR', 'Lancer le site entier', NULL),
('MT_MODULE', 'FR', 'MÃƒÆ’Ã‚Â©ta-donnÃƒÆ’Ã‚Â©e de type de contenu spÃƒÆ’Ã‚Â©cifique', NULL);
INSERT INTO `internal_resources` (`RESID`, `LANGID`, `VALUE`, `TOOLTIP`) VALUES 
('MT_PROPERTIES', 'FR', 'Modifier les propriÃƒÆ’Ã‚Â©tÃƒÆ’Ã‚Â©s du modÃƒÆ’Ã‚Â¨le de mÃƒÆ’Ã‚Â©ta', NULL),
('MT_SCHEME', 'FR', 'Modifier le schÃƒÆ’Ã‚Â©ma du modÃƒÆ’Ã‚Â¨le de mÃƒÆ’Ã‚Â©ta', NULL),
('MT_SPIDER', 'FR', 'DÃƒÆ’Ã‚Â©marrer le spider', NULL),
('MT_SYNC_CL', 'FR', 'Synchroniser les clusters', NULL),
('MT_TITLE', 'FR', 'Maintenance', NULL),
('MULTIPAGE', 'FR', 'Multipage', NULL),
('NAME', 'FR', 'Nom', NULL),
('NEW', 'FR', 'CrÃƒÆ’Ã‚Â©er un nouveau', NULL),
('NEW_ARTICLE', 'FR', 'Nouvel article', NULL),
('NEW_CONTENT', 'FR', 'Nouveau contenu', NULL),
('NEW_FOLDER', 'FR', 'CrÃƒÆ’Ã‚Â©er un dossier', NULL),
('NEXT', 'FR', 'Suivant', NULL),
('NO', 'FR', 'Non', NULL),
('NO_CLUSTER', 'FR', 'Il n''y a aucun cluster.', NULL),
('NO_CLUSTER_SELECTED', 'FR', 'Aucun cluster sÃƒÆ’Ã‚Â©lectionnÃƒÆ’Ã‚Â©.', NULL),
('NO_CLUSTERTEMPLATES', 'FR', 'Il n''y a aucun modÃƒÆ’Ã‚Â¨le de cluster.', NULL),
('NO_CONTENT', 'FR', 'Aucun contenu dÃƒÆ’Ã‚Â©jÃƒÆ’Ã‚Â  saisi.', NULL),
('NO_CONTENTS', 'FR', 'Aucun contenu disponible dans ce dossier.', NULL),
('NO_OBJ', 'FR', 'Aucun objet sÃƒÆ’Ã‚Â©lectionnÃƒÆ’Ã‚Â©.', NULL),
('NO_VARIATIONS', 'FR', 'Il n''y a actuellement aucune variation dÃƒÆ’Ã‚Â©finie pour cet objet<br>Demandez ÃƒÆ’Ã‚Â  un dÃƒÆ’Ã‚Â©veloppeur de vÃƒÆ’Ã‚Â©rifier la configuration de l''entrÃƒÆ’Ã‚Â©e sÃƒÆ’Ã‚Â©lectionnÃƒÆ’Ã‚Â©e.', NULL),
('NODE_ACCESS', 'FR', 'DÃƒÆ’Ã‚Â©finir les accÃƒÆ’Ã‚Â¨s pour la racine du site', NULL),
('NOSPTITLE', 'FR', 'Vous devez dÃƒÆ’Ã‚Â©finir le nom dans le menu avant de pouvoir lancer la page !', NULL),
('NOT_SELECTED', 'FR', 'Aucune entrÃƒÆ’Ã‚Â©e encore sÃƒÆ’Ã‚Â©lectionnÃƒÆ’Ã‚Â©e.', NULL),
('NOT_SPECIFIED', 'FR', 'N''importe quel type', NULL),
('NOTCONFIGURED', 'FR', 'Pas encore configurÃƒÆ’Ã‚Â©.', NULL),
('NOTNUMBER', 'FR', 'Vous devez entrer un nombre dans ce champ !', NULL),
('NUM_OF_ART', 'FR', 'Nombre d''articles (999 = infini)', NULL),
('NUMBER_OF_INSTANCES', 'FR', 'SpÃƒÆ’Ã‚Â©cifiez combien d''instances vous voulez crÃƒÆ’Ã‚Â©er.', NULL),
('O_ALT', 'FR', 'LibellÃƒÆ’Ã‚Â© ALT', NULL),
('O_BROWSE', 'FR', 'Naviguer dans les objets', NULL),
('O_COPYRIGHT', 'FR', 'Copyright', NULL),
('O_DBLINK_ADDWHERE', 'FR', 'Clause WHERE additionnelle', NULL),
('O_DBLINK_EXTERNALDB', 'FR', 'Base de donnÃƒÆ’Ã‚Â©es externe', NULL),
('O_DBLINK_SRCHVALUE', 'FR', 'Rechercher la valeur', NULL),
('O_DEL', 'FR', 'Supprimer l''objet', NULL),
('O_DELMES', 'FR', 'Vous ÃƒÆ’Ã‚Âªtes sur le point de supprimer un objet.<b>Notez que toutes les variations et toutes les mÃƒÆ’Ã‚Â©ta-donnÃƒÆ’Ã‚Â©es seront perdues !</b>', NULL),
('O_EDIT', 'FR', 'Modifier l''objet', NULL),
('O_NAME', 'FR', 'Nom de l''objet', NULL),
('O_NEW', 'FR', 'Nouvel objet', NULL),
('O_PREVIEW', 'FR', 'PrÃƒÆ’Ã‚Â©visualisation de', NULL),
('O_PROPERTIES', 'FR', 'PropriÃƒÆ’Ã‚Â©tÃƒÆ’Ã‚Â©s de l''objet', NULL),
('O_TEXT', 'FR', 'Texte', NULL),
('O_TEXT_NOBREAK', 'FR', 'Ignorer les nouvelles lignes', NULL),
('OBJLAUNCH_SUCCESS', 'FR', 'L''objet a ÃƒÆ’Ã‚Â©tÃƒÆ’Ã‚Â© lancÃƒÆ’Ã‚Â© avec succÃƒÆ’Ã‚Â¨s.', NULL),
('OK', 'FR', 'Ok', NULL),
('ORDER', 'FR', 'Par ordre', NULL),
('ORDERART', 'FR', 'Ordre des articles', NULL),
('ORDERCOMP', 'FR', 'Ordres des compositions', NULL),
('OTHERS', 'FR', 'Autres', NULL),
('OVERVIEW', 'FR', 'Vue d''ensemble', NULL),
('PAGE', 'FR', 'Page', NULL),
('PAGE_TEMPLATE', 'FR', 'ModÃƒÆ’Ã‚Â¨le de page', NULL),
('PAGES', 'FR', 'Pages', NULL),
('PASSWORD', 'FR', 'Mot de passe', NULL),
('PATH', 'FR', 'Chemin', NULL),
('PATHS', 'FR', 'Chemin de clics', NULL),
('PERCENT', 'FR', 'Pourcentage', NULL),
('PG_ALREADYINSTAL', 'FR', 'L''extension est dÃƒÆ’Ã‚Â©jÃƒÆ’Ã‚Â  installÃƒÆ’Ã‚Â©e !', NULL),
('PG_CHOOSE', 'FR', 'Extension : /plugin/', NULL),
('PG_ERROR', 'FR', 'Il y a eu une erreur pendant l''installation de l''extension !', NULL),
('PG_FILEWRONG', 'FR', 'Le nom de fichier entrÃƒÆ’Ã‚Â© ne peut pas ÃƒÆ’Ã‚Âªtre trouvÃƒÆ’Ã‚Â© sur le serveur !', NULL),
('PG_INSTALL', 'FR', 'Installer une extension', NULL),
('PG_INSTALLDESC', 'FR', 'VÃƒÆ’Ã‚Â©rifiez que vous avez copiÃƒÆ’Ã‚Â© tous les fichiers nÃƒÆ’Ã‚Â©cessaires dans le dossier avant de procÃƒÆ’Ã‚Â©der. InsÃƒÆ’Ã‚Â©rez le chemin correct de l''extension dans le champ ci-dessous. Le systÃƒÆ’Ã‚Â¨me pourra alors installer l''extension automatiquement.', NULL),
('PG_INSTALLED', 'FR', 'L''extension a ÃƒÆ’Ã‚Â©tÃƒÆ’Ã‚Â© installÃƒÆ’Ã‚Â©e avec succÃƒÆ’Ã‚Â¨s !', NULL),
('PG_NEWERINSTALLE', 'FR', 'Il y a une version plus rÃƒÆ’Ã‚Â©cente de cette extension installÃƒÆ’Ã‚Â©e !', NULL),
('PG_TITLE', 'FR', 'Extensions', NULL),
('PG_UNINSTALL', 'FR', 'DÃƒÆ’Ã‚Â©sinstaller une extension', NULL),
('PG_UNINSTALLDELE', 'FR', 'DÃƒÆ’Ã‚Â©sinstaller un module, <br> supprimer les contenus correspondants.', NULL),
('PG_UNINSTALLMES', 'FR', 'Vous ÃƒÆ’Ã‚Âªtes sur le point de dÃƒÆ’Ã‚Â©sinstaller un module.<b>La dÃƒÆ’Ã‚Â©sinstallation d''un module ne supprime pas seulement le type de contenu mais aussi chaque objet unique de ce type stockÃƒÆ’Ã‚Â© dans la base de donnÃƒÆ’Ã‚Â©es. La dÃƒÆ’Ã‚Â©sinstallation supprimera dÃƒÆ’Ã‚Â©finitivement toutes les donnÃƒÆ’Ã‚Â©es de ce module ! ', NULL),
('PG_UPGRADED', 'FR', 'L''extension a ÃƒÆ’Ã‚Â©tÃƒÆ’Ã‚Â© mise ÃƒÆ’Ã‚Â  jour avec succÃƒÆ’Ã‚Â¨s !', NULL),
('PGNTXT_SMA', 'FR', 'Enregistrer tous les textes modifiÃƒÆ’Ã‚Â©s sur cette page', NULL),
('PI', 'FR', 'Pages demandÃƒÆ’Ã‚Â©es', NULL),
('PI_OVERVIEW', 'FR', 'Vue d''ensemble des pages demandÃƒÆ’Ã‚Â©es', NULL),
('PO_BROWSER', 'FR', 'Navigateur de portail', NULL),
('PO_CRSUCCEEDED', 'FR', 'La crÃƒÆ’Ã‚Â©ation d''un nouveau portail a abouti !', NULL),
('PO_EDIT', 'FR', 'Modifier la page du portail', NULL),
('PO_MYPORTAL', 'FR', 'Mes portails', NULL),
('PO_OWNER', 'FR', 'PropriÃƒÆ’Ã‚Â©taire de la page', NULL),
('POS_IN_MENU', 'FR', 'Position dans le plan du site', NULL),
('POSITION', 'FR', 'Position', NULL),
('PREDEF_TIME', 'FR', 'Fuseau horaire prÃƒÆ’Ã‚Â©dÃƒÆ’Ã‚Â©fini', NULL),
('PREV_AVAIL', 'FR', 'Vous avez sÃƒÆ’Ã‚Â©lectionnÃƒÆ’Ã‚Â© un objet. Une prÃƒÆ’Ã‚Â©visualisation sera disponible aprÃƒÆ’Ã‚Â¨s enregistrement.', NULL),
('PREVIEW', 'FR', 'PrÃƒÆ’Ã‚Â©visualisation', NULL),
('PRINT', 'FR', 'Imprimer', NULL),
('PROCERROR', 'FR', 'Une erreur s''est produite pendant le traitement du formulaire. Regardez les champs marquÃƒÆ’Ã‚Â©s et lisez les commentaires pour plus d''information.', NULL),
('PROMPTDELETE', 'FR', 'Voulez-vous vraiment supprimer ce jeu de donnÃƒÆ’Ã‚Â©es ? Cette action ne peut pas ÃƒÆ’Ã‚Âªtre annulÃƒÆ’Ã‚Â©e !', NULL),
('PROPERTIES', 'FR', 'PropriÃƒÆ’Ã‚Â©tÃƒÆ’Ã‚Â©s', NULL),
('PTEMPL', 'FR', 'ModÃƒÆ’Ã‚Â¨le de page', NULL),
('PURGE', 'FR', 'Nettoyer la base de donnÃƒÆ’Ã‚Â©es', NULL),
('PURGE_CLT', 'FR', 'Nettoyer les modÃƒÆ’Ã‚Â¨les de clusters', NULL),
('PURGE_CLUSTER', 'FR', 'Nettoyer le cluster', NULL),
('PURGE_CONTENT', 'FR', 'Nettoyer le contenu', NULL),
('PURGE_EXPIRED', 'FR', 'Nettoyer les pages expirÃƒÆ’Ã‚Â©es', NULL),
('PURGE_FOLDER', 'FR', 'Nettoyer les dossiers', NULL),
('PURGE_MES', 'FR', 'SÃƒÆ’Ã‚Â©lectionnez les parties de la base de donnÃƒÆ’Ã‚Â©es que vous voulez nettoyer.', NULL),
('PURGE_META', 'FR', 'Nettoyer les mÃƒÆ’Ã‚Â©ta-donnÃƒÆ’Ã‚Â©es', NULL),
('PURGE_PAGES', 'FR', 'Nettoyer les pages du site et les maÃƒÆ’Ã‚Â®tres', NULL),
('PURGE_VAR', 'FR', 'Nettoyer les variations', NULL),
('PWDNOTMATCH', 'FR', 'Les mots de passe entrÃƒÆ’Ã‚Â©s ne correspondent pas !', NULL),
('PWDTOOSHORT', 'FR', 'Le mot de passe doit ÃƒÆ’Ã‚Âªtre d''au moins 6 caractÃƒÆ’Ã‚Â¨res !', NULL),
('R_DELETEFOLDER', 'FR', 'Supprimer le dossier', NULL),
('R_DELFOLDER', 'FR', 'Supprimer le dossier et tous les objets enfants', NULL),
('R_DELFOLDERMES', 'FR', 'Vous ÃƒÆ’Ã‚Âªtes sur le point de supprimer un dossier. SÃƒÆ’Ã‚Â©lectionnez une action.', NULL),
('R_EDITFOLDER', 'FR', 'Modifier les propriÃƒÆ’Ã‚Â©tÃƒÆ’Ã‚Â©s du dossier', NULL),
('R_FOLDERNAME', 'FR', 'Nom du dossier', NULL),
('R_FOLDERNOTEMPTY', 'FR', 'Le dossier n''est pas vide. Vous ne pouvez donc pas le supprimer ! VÃƒÆ’Ã‚Â©rifier tous les objets et tous les clusters !', NULL),
('R_HOME', 'FR', 'DÃƒÆ’Ã‚Â©marrer', NULL),
('R_MOVEOBJECTS', 'FR', 'DÃƒÆ’Ã‚Â©placer tous les objets vers le nÃƒâ€¦Ã¢â‚¬Å“ud parent', NULL),
('R_NEWFOLDER', 'FR', 'Nouveau dossier', NULL),
('R_PARENT', 'FR', 'Dossier parent', NULL),
('SEARCH WEBSITE', 'EN', 'Search Website', ''),
('RANK', 'FR', 'Rang', NULL),
('RATERES', 'FR', 'RÃƒÆ’Ã‚Â©sultats des taux', NULL),
('RB_CACHE', 'FR', 'Reconstruire le cache', NULL),
('READY_TO_USE', 'FR', 'PrÃƒÆ’Ã‚Âªt ÃƒÆ’Ã‚Â  l''utilisation.', NULL),
('REFERER', 'FR', 'RÃƒÆ’Ã‚Â©fÃƒÆ’Ã‚Â©rent', NULL),
('REMAIN_POS', 'FR', 'Ne pas changer la position', NULL),
('RESET', 'FR', 'Remettre ÃƒÆ’Ã‚Â  zÃƒÆ’Ã‚Â©ro le formulaire', NULL),
('RESET_FORM', 'FR', 'Remettre ÃƒÆ’Ã‚Â  zÃƒÆ’Ã‚Â©ro le formulaire', NULL),
('RESET_LOGS', 'FR', 'Remettre ÃƒÆ’Ã‚Â  zÃƒÆ’Ã‚Â©ro les logs', NULL),
('RET_VIS', 'FR', 'Visiteurs de renvoi', NULL),
('RL_PERM', 'FR', 'Permissions des rÃƒÆ’Ã‚Â´les', NULL),
('ROLE_DESCRIPTION', 'FR', 'Description', NULL),
('ROLE_FILTERMENU', 'FR', 'Administration des rÃƒÆ’Ã‚Â´les', NULL),
('ROLE_GENERAL', 'FR', 'Modifier les donnÃƒÆ’Ã‚Â©es gÃƒÆ’Ã‚Â©nÃƒÆ’Ã‚Â©rales du rÃƒÆ’Ã‚Â´le', NULL),
('ROLE_HEAD', 'FR', 'Profil du rÃƒÆ’Ã‚Â´le', NULL),
('ROLE_LINK', 'FR', 'Profils du rÃƒÆ’Ã‚Â´le', NULL),
('ROLE_NAME', 'FR', 'Nom du rÃƒÆ’Ã‚Â´le', NULL),
('ROLE_PERMISSION', 'FR', 'Modifier les permissions du rÃƒÆ’Ã‚Â´le', NULL),
('SAVE', 'FR', 'Enregistrer', NULL),
('SAVE_BACK', 'FR', 'Enregistrer et revenir', NULL),
('SAVEERROR', 'FR', 'Une erreur s''est produite pendant l''enregistrement des donnÃƒÆ’Ã‚Â©es dans la base de donnÃƒÆ’Ã‚Â©es. VÃƒÆ’Ã‚Â©rifiez que la base de donnÃƒÆ’Ã‚Â©es est connectÃƒÆ’Ã‚Â©e ou appelez votre administrateur.', NULL),
('SAVESUCCESS', 'FR', 'Les donnÃƒÆ’Ã‚Â©es ont ÃƒÆ’Ã‚Â©tÃƒÆ’Ã‚Â© ÃƒÆ’Ã‚Â©crites dans la base de donnÃƒÆ’Ã‚Â©es avec succÃƒÆ’Ã‚Â¨s.', NULL),
('SEARCH', 'FR', 'DÃƒÆ’Ã‚Â©marrer la recherche', NULL),
('SEARCH_CLEAR', 'FR', 'Remettre ÃƒÆ’Ã‚Â  zÃƒÆ’Ã‚Â©ro le filtre', NULL),
('SEARCH_EXPIRED_ARTICLES', 'FR', 'Articles expirÃƒÆ’Ã‚Â©s', NULL),
('SEARCH_LIVE_ACRTICLES', 'FR', 'Articles en cours', NULL),
('SEARCHIN', 'FR', 'Rechercher', NULL),
('SEARCHRESULTS', 'FR', 'RÃƒÆ’Ã‚Â©sultat de la recherche, veuillez faire votre choix', NULL),
('SEASRCH_MISSING_VARIATIONS', 'FR', 'Variations manquantes', NULL),
('SEL_ARTICLE', 'FR', 'SÃƒÆ’Ã‚Â©lectionner un article', NULL),
('SEL_CH', 'FR', 'SÃƒÆ’Ã‚Â©lectionner un canal', NULL),
('SEL_CHANNEL_CAT', 'FR', 'SÃƒÆ’Ã‚Â©lectionner un canal et une catÃƒÆ’Ã‚Â©gorie', NULL),
('SEL_CLUSTER', 'FR', 'SÃƒÆ’Ã‚Â©lectionner un cluster', NULL),
('SEL_EVENT', 'FR', 'SÃƒÆ’Ã‚Â©lectionner un ÃƒÆ’Ã‚Â©vÃƒÆ’Ã‚Â©nement ou un rendez-vous', NULL),
('SEL_FILE', 'FR', 'SÃƒÆ’Ã‚Â©lectionner un fichier', NULL),
('SEL_MEM', 'FR', 'SÃƒÆ’Ã‚Â©lectionner des membres', NULL),
('SEL_PTML', 'FR', 'SÃƒÆ’Ã‚Â©lectionner un modÃƒÆ’Ã‚Â¨le de page', NULL),
('SEL_VAR', 'FR', 'SÃƒÆ’Ã‚Â©lectionner une variation', NULL),
('SELECT', 'FR', 'SÃƒÆ’Ã‚Â©lectionner', NULL),
('SELECT_CI', 'FR', 'SÃƒÆ’Ã‚Â©lectionner une entrÃƒÆ’Ã‚Â©e de contenu', NULL),
('SELECT_CL', 'FR', 'SÃƒÆ’Ã‚Â©lectionner une instance de cluster', NULL),
('SELECT_VARIATION', 'FR', 'SÃƒÆ’Ã‚Â©lectionner une variation', NULL),
('SELECTEDINSTANCE', 'FR', 'Instance de cluster sÃƒÆ’Ã‚Â©lectionnÃƒÆ’Ã‚Â©e', NULL),
('SELECTEDOBJECT', 'FR', 'EntrÃƒÆ’Ã‚Â©e de contenu actuellement sÃƒÆ’Ã‚Â©lectionnÃƒÆ’Ã‚Â©e', NULL),
('SELECTOBJECT', 'FR', 'SÃƒÆ’Ã‚Â©lectionnez une classe et spÃƒÆ’Ã‚Â©cifiez une position et un nom pour crÃƒÆ’Ã‚Â©er un nouvel objet.<br>Pour la position, utilisez 0 pour l''insÃƒÆ’Ã‚Â©rer au dÃƒÆ’Ã‚Â©but, 999 pour l''insÃƒÆ’Ã‚Â©rer ÃƒÆ’Ã‚Â  la fin ou n''importe quel autre position de votre choix.', NULL),
('SELECTONE', 'FR', 'Vous devez faire un choix ici !', NULL),
('SELMULTIPLE', 'FR', 'Maintenez la touche CTRL enfoncÃƒÆ’Ã‚Â©e pour sÃƒÆ’Ã‚Â©lectionner plusieurs entrÃƒÆ’Ã‚Â©es.', NULL),
('SET', 'FR', 'DÃƒÆ’Ã‚Â©finir', NULL),
('SHORTEST_PATHS', 'FR', 'Chemins les plus courts', NULL),
('SHOW', 'FR', 'Montrer', NULL),
('SHOW_ADVANCED_SEARCH', 'FR', 'Afficher les options de recherche avancÃƒÆ’Ã‚Â©es', NULL),
('SHOW_ALL', 'FR', 'Tout montrer', NULL),
('SHOW_PAGEWISE', 'FR', 'Montrer la mise en page', NULL),
('SMA_EXT_EDIT', 'FR', 'Ouvrir une fenÃƒÆ’Ã‚Âªtre d''ÃƒÆ’Ã‚Â©dition. Enregistrer d''abord tous les textes ÃƒÆ’Ã‚Â©ditÃƒÆ’Ã‚Â©s avant !', NULL),
('SP_BROWSE', 'FR', 'Plan du site', NULL),
('SP_CLNEW', 'FR', 'CrÃƒÆ’Ã‚Â©er une nouvelle instance de cluster', NULL),
('SP_CONFDESC', 'FR', 'Vous pouvez lier cette page du site ÃƒÆ’Ã‚Â  une instance existante du cluster ou crÃƒÆ’Ã‚Â©er une nouvelle instance. DÃƒÆ’Ã‚Â©cidez ce que vous souhaitez faire.', NULL),
('SP_CONFIGURE', 'FR', 'Configurer la page', NULL),
('SP_DELETE', 'FR', 'Supprimer une page du site', NULL),
('SP_DELMES', 'FR', 'Vous ÃƒÆ’Ã‚Âªtes sur le point de supprimer une page du site. Notez que toutes les instances vivantes de cette page seront ÃƒÆ’Ã‚Â©galement supprimÃƒÆ’Ã‚Â©es !', NULL),
('SP_EDIT', 'FR', 'Modifier une page du site', NULL),
('SP_EXPIRE', 'FR', 'Expirer la page', NULL),
('SP_EXPIREDATE', 'FR', 'ExpirÃƒÆ’Ã‚Â© depuis', NULL),
('SP_IPROPERTIES', 'FR', 'PropriÃƒÆ’Ã‚Â©tÃƒÆ’Ã‚Â©s de la page', NULL),
('SP_LAUNCH', 'FR', 'Lancer la page', NULL),
('SP_LAUNCHDATE', 'FR', 'Actif depuis', NULL),
('SP_LAUNCHDATES', 'FR', 'Configuration du temps de vie', NULL),
('SP_LINK', 'FR', 'Lien vers une instance de cluster existante', NULL),
('SP_MENUDIRECT', 'FR', 'URL directe sur le serveur en ligne', NULL),
('SP_MENUDIRECTTIT', 'FR', 'DÃƒÆ’Ã‚Â©finir le chemin optionnel sur le serveur pour un accÃƒÆ’Ã‚Â¨s direct', NULL),
('SP_MENUDIRECTTITLE', 'FR', 'DÃƒÆ’Ã‚Â©finir le chemin optionnel sur le serveur pour un accÃƒÆ’Ã‚Â¨s direct', NULL),
('SP_MENUHELP', 'FR', 'Texte d''aide pour le menu', NULL),
('SP_MENUNAME', 'FR', 'Nom dans le menu', NULL),
('SP_MENUPROPS', 'FR', 'Nom du menu et texte d''aide', NULL),
('SP_NEWINSTANCE', 'FR', 'Ajouter une page', NULL),
('SP_NEWPAGE', 'FR', 'Ajouter une page', NULL),
('SP_PDELETE', 'FR', 'Supprimer une page', NULL),
('SP_PDELMES', 'FR', 'Vous ÃƒÆ’Ã‚Âªtes sur le point de supprimer une page. Notez que toutes les instances vivantes de cette page seront ÃƒÆ’Ã‚Â©galement supprimÃƒÆ’Ã‚Â©es !', NULL),
('SP_PREVIEW', 'FR', 'PrÃƒÆ’Ã‚Â©visualisation de la page', NULL),
('SP_PROPERTIES', 'FR', 'PropriÃƒÆ’Ã‚Â©tÃƒÆ’Ã‚Â©s de la page', NULL),
('SP_RLTREE', 'FR', 'RafraÃƒÆ’Ã‚Â®chir l''arborescence', NULL),
('SPM', 'FR', 'Page de site maÃƒÆ’Ã‚Â®tre', NULL),
('SPM_CLUSTER', 'FR', 'ModÃƒÆ’Ã‚Â¨le de cluster', NULL),
('SPM_EDIT', 'FR', 'Modifier la page de site maÃƒÆ’Ã‚Â®tre', NULL),
('SPM_LAUCH_SUCCESS', 'FR', 'Les pages dÃƒÆ’Ã‚Â©finies sur le maÃƒÆ’Ã‚Â®tre ont ÃƒÆ’Ã‚Â©tÃƒÆ’Ã‚Â© relancÃƒÆ’Ã‚Â©es avec succÃƒÆ’Ã‚Â¨s.<br>', NULL),
('SPM_META', 'FR', 'ModÃƒÆ’Ã‚Â¨le de mÃƒÆ’Ã‚Â©ta-clÃƒÆ’Ã‚Â©', NULL),
('SPM_PATH', 'FR', 'Chemin du modÃƒÆ’Ã‚Â¨le', NULL),
('SPM_RLAUNCH', 'FR', 'RafraÃƒÆ’Ã‚Â®chir les instances', NULL),
('SPM_SELECTTHUMB', 'FR', 'SÃƒÆ’Ã‚Â©lectionner une vignette', NULL),
('SPM_THUMBNAIL', 'FR', 'Vignette', NULL),
('SPM_TYPE', 'FR', 'Type de page', NULL),
('SPM_VARIATIONS', 'FR', 'Variations affichables', NULL),
('SR_SELECTCI', 'FR', 'Vous pouvez chercher n''importe quelle entrÃƒÆ’Ã‚Â©e de contenu ici. Si vous voulez sÃƒÆ’Ã‚Â©lectionner une entrÃƒÆ’Ã‚Â©e de contenu, choisissez-la et appuyez sur le bouton Mettre ÃƒÆ’Ã‚Â  jour. Si vous voulez relier un nouveau contenu ÃƒÆ’Ã‚Â  ce champ, crÃƒÆ’Ã‚Â©ez d''abord le contenu dans le navigateur d''objet. ', NULL),
('SR_SELECTCLI', 'FR', 'SÃƒÆ’Ã‚Â©lectionnez un modÃƒÆ’Ã‚Â¨le de cluster. Ensuite, vous pourrez sÃƒÆ’Ã‚Â©lectionner une instance de ce modÃƒÆ’Ã‚Â¨le pour l''utiliser.', NULL),
('START_BAK', 'FR', 'DÃƒÆ’Ã‚Â©marrer la sauvegarde', NULL),
('STARTDATE', 'FR', 'Date de dÃƒÆ’Ã‚Â©marrage', NULL),
('STARTTIME', 'FR', 'Heure de dÃƒÆ’Ã‚Â©marrage', NULL),
('STATS', 'FR', 'Statistiques', NULL),
('STATS_HEADER', 'FR', 'Statistiques de trafic N/X 2004', NULL),
('STATUS', 'FR', 'Etat :', NULL),
('STEP', 'FR', 'Etape', NULL),
('STNAME', 'FR', 'SÃƒÆ’Ã‚Â©lectionner un nom pour identifier cette page dans le plan du site', NULL),
('SYNC_CLUSTERS', 'FR', 'Synchroniser les clusters', NULL),
('SYNC_CLUSTERS_DESCR', 'FR', 'Quand vous modifiez un modÃƒÆ’Ã‚Â¨le de cluster, les clusters ne sont pas automatiquement synchronisÃƒÆ’Ã‚Â©s. Ils sont synchronisÃƒÆ’Ã‚Â©s quand vous travaillez avec la fois suivante. Vous pouvez tous les synchroniser.', NULL),
('TEMPLATE', 'FR', 'ModÃƒÆ’Ã‚Â¨le', NULL),
('TESTS', 'FR', 'Tests unitaires N/X', NULL),
('TF', 'FR', 'Fuseau horaire', NULL),
('THISMONTH', 'FR', 'Ce mois-ci', NULL),
('THISWEEK', 'FR', 'Cette semaine', NULL),
('THISYEAR', 'FR', 'Cette annÃƒÆ’Ã‚Â©e', NULL),
('TIME_BETW_VISITS', 'FR', 'Moyenne de temps entre les visites', NULL),
('TIPP_TEMPLATE_1', 'FR', 'Les modÃƒÆ’Ã‚Â¨les sont ÃƒÆ’Ã‚Â  la base du fonctionnement de N/X. Vous aurez besoin de crÃƒÆ’Ã‚Â©er un modÃƒÆ’Ã‚Â¨le de cluster en premier qui dÃƒÆ’Ã‚Â©finira la structure et le type de contenu. Par la suite, vous pourrez crÃƒÆ’Ã‚Â©er les modÃƒÆ’Ã‚Â¨les de pages ici en fusionnant un modÃƒÆ’Ã‚Â¨le de cluster et un fichier PHP.<br><br>', NULL),
('TITLE', 'FR', 'Titre', NULL),
('TMPL_NAME', 'FR', 'SÃƒÆ’Ã‚Â©lectionner un modÃƒÆ’Ã‚Â¨le', NULL),
('TODAY', 'FR', 'Aujourd''hui', NULL),
('TOP', 'FR', 'Principales donnÃƒÆ’Ã‚Â©es', NULL),
('TOP_BROWSER', 'FR', 'Principaux navigateurs', NULL),
('TOP_ENTRYPAGES', 'FR', 'Principales pages d''entrÃƒÆ’Ã‚Â©es', NULL),
('TOP_EXITPAGES', 'FR', 'Principales pages de sortie', NULL),
('TOP_EXITT', 'FR', 'Principales cibles de sortie', NULL),
('TOP_HOSTS', 'FR', 'Principaux hÃƒÆ’Ã‚Â©bergeurs', NULL),
('TOP_OS', 'FR', 'Principaux systÃƒÆ’Ã‚Â¨mes d''exploitation', NULL),
('TOP_PAGES', 'FR', 'Principales pages', NULL),
('TOP_PATHS', 'FR', 'Principaux chemins', NULL),
('TOP_REFERER', 'FR', 'Principaux rÃƒÆ’Ã‚Â©fÃƒÆ’Ã‚Â©rents', NULL),
('TOP_SI', 'FR', 'Principaux moteurs de recherche', NULL),
('TOP_SKW', 'FR', 'Principaux mots-clÃƒÆ’Ã‚Â©s de recherche', NULL),
('TOTAL', 'FR', 'Total', NULL),
('TRANS_TEMPL', 'FR', 'Traduit depuis', NULL),
('TRANS_THIS', 'FR', 'Traduire ceci :', NULL),
('TRANSLATION', 'FR', 'SystÃƒÆ’Ã‚Â¨me de traduction N/X', NULL),
('TT_REFRESH', 'FR', 'RafraÃƒÆ’Ã‚Â®chir les instances met ÃƒÆ’Ã‚Â  jour les pages en cache dont le modÃƒÆ’Ã‚Â¨le a ÃƒÆ’Ã‚Â©tÃƒÆ’Ã‚Â© modifiÃƒÆ’Ã‚Â©.', NULL),
('TT_RSTCI', 'FR', 'Dans N/X, chaque page a un cluster. En appuyant sur RedÃƒÆ’Ã‚Â©finir l''instance du cluster, vous pouvez assigner un nouveau cluster ÃƒÆ’Ã‚Â  la page et supprimer l''ancien.', NULL),
('TYPE', 'FR', 'Type', NULL),
('UNIQUE', 'FR', 'Ce champ doit ÃƒÆ’Ã‚Âªtre unique !', NULL),
('UP', 'FR', 'Haut', NULL),
('UP_INTRO', 'FR', 'SÃƒÆ’Ã‚Â©lectionnez le groupe et ses rÃƒÆ’Ã‚Â´les ÃƒÆ’Ã‚Â  affecter ÃƒÆ’Ã‚Â  l''utilisateur.', NULL),
('UPL_TEXT', 'FR', 'Charger un fichier texte', NULL),
('USAGE', 'FR', 'Utilisation', NULL),
('USER_ACTIVE', 'FR', 'Compte activÃƒÆ’Ã‚Â©', NULL),
('USER_AGENT', 'FR', 'Utiliser l''agent', NULL),
('USER_BL', 'FR', 'Langage de l''interface', NULL),
('USER_EMAIL', 'FR', 'E-mail', NULL),
('USER_FILTERMENU', 'FR', 'Administration des utilisateurs', NULL),
('USER_GENERAL', 'FR', 'Modifier les donnÃƒÆ’Ã‚Â©es gÃƒÆ’Ã‚Â©nÃƒÆ’Ã‚Â©rales de l''utilisateur', NULL),
('USER_HEAD', 'FR', 'Profil de l''utilisateur', NULL),
('USER_JS', 'FR', 'Utiliser le Javascript', NULL),
('USER_LINK', 'FR', 'Profils des utilisateurs', NULL),
('USER_NAME', 'FR', 'Nom de l''utilisateur', NULL),
('USER_PERMGRID', 'FR', 'Grille de permissions', NULL),
('USER_PERMISSION', 'FR', 'Modifier les permissions de l''utilisateur', NULL),
('USER_PERMISSIONS', 'FR', 'Permissions de l''utilisateur', NULL),
('USER_PROFILE', 'FR', 'Mon profil', NULL),
('USER_SETPERM', 'FR', 'DÃƒÆ’Ã‚Â©finir les permissions de l''utilisateur ci-dessous. Pour enlever un utilisateur d''un groupe, retirez tous les groupes depuis celui-ci.', NULL),
('USER_TO_GROUP', 'FR', 'Ajouter un utilisateur au groupe', NULL),
('USERPERM_HEAD', 'FR', 'Modifier les permissions de l''utilisateur', NULL),
('V_EDIT', 'FR', 'Modifier les variations', NULL),
('V_NAME', 'FR', 'Nom', NULL),
('V_SHORT', 'FR', 'Balise courte', NULL),
('VAR_SUCCEEDED', 'FR', 'rÃƒÆ’Ã‚Â©ussi !', NULL),
('VARIATIONS', 'FR', 'Variations disponibles', NULL),
('VIS_FIRST', 'FR', 'Visiteurs pour la premiÃƒÆ’Ã‚Â¨re fois', NULL),
('VIS_ONL', 'FR', 'Visiteurs en ligne', NULL),
('VIS_PER_VIS', 'FR', 'Moyenne des visites par visiteur', NULL),
('VIS_RET', 'FR', 'Visiteurs pÃƒÆ’Ã‚Â©riodiques', NULL),
('VISITORS', 'FR', 'Visiteurs', NULL),
('VISITS', 'FR', 'Visites', NULL),
('VISITS_OVERVIEW', 'FR', 'Vue d''ensemble des visites', NULL),
('WEBSITE', 'FR', 'Site Web', NULL),
('WEEKDAY', 'FR', 'Jours de la semaine', NULL),
('WEEKDAY_AS', 'FR', 'Analyse des jours de la semaine', NULL),
('WHEN', 'FR', 'Quand', NULL),
('WRONGDATE', 'FR', 'La date saisie n''existe pas !', NULL),
('WZ_ARTICLEIMPORT', 'FR', 'Assistant d''importation d''articles', NULL),
('WZ_ARTICLEIMPORT_TITLE', 'FR', 'Cet assistant est utilisÃƒÆ’Ã‚Â© pour importer des donnÃƒÆ’Ã‚Â©es d''articles depuis diffÃƒÆ’Ã‚Â©rentes sources vers un canal. Vous pouvez importer depuis des multiples existantes ou d''autres canaux. Vous devez vous assurer que les modÃƒÆ’Ã‚Â¨les correspondants sont compatibles. ', NULL),
('WZ_EXPORT_TITLE', 'FR', 'Cet assistant est utilisÃƒÆ’Ã‚Â© pour ÃƒÆ’Ã‚Â©changer des clusters, des modÃƒÆ’Ã‚Â¨les de clusters et des modÃƒÆ’Ã‚Â¨les de pages entre votre installation N/X et d''autres installations. L''assistant produit un fichier XML que vous pouvez stocker sur votre disque dur local et ÃƒÆ’Ã‚Â©changer avec d''autres utilisateurs de N/X.', NULL),
('WZ_IMPORT_TITLE', 'FR', 'Cet assistant est utilisÃƒÆ’Ã‚Â© pour importer vers N/X des donnÃƒÆ’Ã‚Â©es qui ont ÃƒÆ’Ã‚Â©tÃƒÆ’Ã‚Â© prÃƒÆ’Ã‚Â©alablement exportÃƒÆ’Ã‚Â©es avec une autre installation de N/X. Vous devez supprimer une ressource avant de l''importer une deuxiÃƒÆ’Ã‚Â¨me fois.', NULL),
('WZE_ARTICLEIMPORT_SRCTYPE', 'FR', 'SÃƒÆ’Ã‚Â©lectionnez depuis quel type de source vous voulez importer les articles.', NULL),
('WZE_ARTICLEIMPORT_TARGET', 'FR', 'A droite, vous devez choisir le canal cible. Tous les articles importÃƒÆ’Ã‚Â©s seront stockÃƒÆ’Ã‚Â©s dans ce canal.', NULL),
('WZE_EXPORT_TYPE', 'FR', 'A droite, vous devez choisir le type de donnÃƒÆ’Ã‚Â©es que vous voulez exporter. Les clusters stockent le contenu. Quand vous exportez des clusters, les modÃƒÆ’Ã‚Â¨les sont ÃƒÆ’Ã‚Â©galement automatiquement exportÃƒÆ’Ã‚Â©s. Les modÃƒÆ’Ã‚Â¨les de clusters dÃƒÆ’Ã‚Â©finissent la structure pour crÃƒÆ’Ã‚Â©er des clusters. Des modÃƒÆ’Ã‚Â¨les de pages dÃƒÆ’Ã‚Â©finissent la mise en page que les clusters vont utiliser en fonction de leur contenu.', NULL),
('WZE_IMPORT_FILE', 'FR', 'Choisissez un fichier N/X-XML sur votre disque pour le charger dans le systÃƒÆ’Ã‚Â¨me.<br./><br./>Le systÃƒÆ’Ã‚Â¨me le contrÃƒÆ’Ã‚Â´lera et montrera l''information d''ÃƒÆ’Ã‚Â©tat sur la prochaine page.', NULL),
('WZE_IMPORT_VAL', 'FR', 'Le systÃƒÆ’Ã‚Â¨me a vÃƒÆ’Ã‚Â©rifiÃƒÆ’Ã‚Â© l''exactitude du fichier XML chargÃƒÆ’Ã‚Â©. Lisez le rapport ÃƒÆ’Ã‚Â  gauche pour plus de dÃƒÆ’Ã‚Â©tails.', NULL),
('WZE_IMPORTING', 'FR', 'Le systÃƒÆ’Ã‚Â¨me a tentÃƒÆ’Ã‚Â© d''importer les donnÃƒÆ’Ã‚Â©es. Lisez l''ÃƒÆ’Ã‚Â©tat ÃƒÆ’Ã‚Â  droite.', NULL),
('WZT_ARTICLEIMPORT_SRCTYPE', 'FR', 'SÃƒÆ’Ã‚Â©lectionner le type de source', NULL),
('WZT_ARTICLEIMPORT_TARGET', 'FR', 'SÃƒÆ’Ã‚Â©lectionner le canal cible', NULL),
('WZT_DESCR', 'FR', 'Ajouter une description', NULL),
('WZT_DESCR_EXPL', 'FR', 'Vous devriez ajouter une courte description aux donnÃƒÆ’Ã‚Â©es exportÃƒÆ’Ã‚Â©es.</br.></br.>Celui qui importera les donnÃƒÆ’Ã‚Â©es comprendra plus facilement ce qu''il a exportÃƒÆ’Ã‚Â©.', NULL),
('WZT_EXPORT_TYPE', 'FR', 'SÃƒÆ’Ã‚Â©lectionner un type ÃƒÆ’Ã‚Â  exporter', NULL),
('WZT_IMPORT_FILE', 'FR', 'SÃƒÆ’Ã‚Â©lectionner un fichier N/X-XML ', NULL),
('WZT_IMPORT_VAL', 'FR', 'Sommaire du XML chargÃƒÆ’Ã‚Â©', NULL),
('WZT_IMPORTING', 'FR', 'DonnÃƒÆ’Ã‚Â©es en cours d''importation', NULL),
('WZT_KEEPCLUSTER', 'FR', 'Garder les clusters existants ?', NULL),
('WZT_KEEPCLUSTER_EXPL', 'FR', 'Vous pouvez indiquer si vous voulez garder les clusters existants ou crÃƒÆ’Ã‚Â©er des copies de chaque cluster.<br.><br.>Garder ÃƒÆ’Ã‚Â  l''esprit que si vous gardez les clusters originaux vous les partagez avec la source originale.', NULL),
('WZT_SEL_EXP_RES', 'FR', 'SÃƒÆ’Ã‚Â©lectionner une ressource ÃƒÆ’Ã‚Â  exporter', NULL),
('YES', 'FR', 'Oui', NULL),
('YESTERDAY', 'FR', 'Hier', NULL),
('M_ARTICLES', 'FR', 'Articles', ''),
('CL_GROUP', 'FR', 'Cluster Group', ''),
('PAGE_ID', 'FR', 'Page ID', ''),
('PROC_DATA', 'FR', 'Processing Data...', ''),
('MAINT_WWWDEV', 'EN', 'Switch test website into maintenance.', ''),
('BB_IN_MM_MODE', 'EN', 'The backend is in maintenance at the moment. Only the Administrator can log in!', ''),
('POPUP_MENU', 'EN', 'Popup Window', ''),
('PAR_PAGE', 'EN', 'Parent Page', ''),
('IMP_IMAGES', 'EN', 'Import images', ''),
('SEL_IMP_FOLDER', 'EN', 'Select import folder', ''),
('IMP_IMPAGES', 'EN', 'Import Images', ''),
('WZ_IMPORT_IM_TITLE', 'EN', 'This wizard is used for importing importing images to N/X. Pack the images into a zip archive and upload them with this wizard. The wizard will extract the images and add them to the content library.', ''),
('WZT_ARCHIVE_FILE', 'EN', 'Select Archive', ''),
('WZE_ARCHIVE_FILE', 'EN', 'Please select the zip-archive you want to import. Do not use folders within the zip-archive!', ''),
('MUST_UPLOAD', 'EN', 'You must upload a file to proceed!', ''),
('ARCHERR', 'EN', 'The archive could not be properly imported. Check for php_zip extension!', ''),
('WZT_ACH_CHECK', 'EN', 'Check Archive', ''),
('NUMB_FILES', 'EN', 'Number of files found in archive:', ''),
('WZE_ARCH_CHECK', 'EN', 'Please control the result of the archive checks and press next if you want to continue.', ''),
('WZT_DEST_FOLDER', 'EN', 'Select destination folder', ''),
('WZE_DEST_FOLDER', 'EN', 'Please select the destiniation folder for the pictures.', ''),
('DEST_FOLDER', 'EN', 'Destination folder', ''),
('NUM_FILES', 'EN', 'Number of files found in archive:', ''),
('WZT_IMP_IMAG', 'EN', 'Importing images...', ''),
('NOFI', 'EN', 'Number of files imported:', ''),
('ACCESS_VIOLATION', 'EN', 'Access violation', ''),
('ACCESS_V_TEXT', 'EN', 'You have no rights to access this object!', ''),
('CLEAR_JPCACHE', 'EN', 'Clear Cache', ''),
('WAS_DELETED', 'EN', 'The referenced content was deleted from library!', ''),
('DEL_TREE', 'EN', 'Delete Tree', ''),
('MORE_ACT', 'EN', 'More actions...', ''),
('RESETCLI', 'EN', 'Change Object', ''),
('STATISTICS', 'EN', 'Statistics', ''),
('REFRESH', 'EN', 'Refresh', ''),
('ACCESS_V_TEXT', 'DE', 'Sie haben nicht die notwendigen Rechte um auf das Object zuzugreifen.', ''),
('ARCHERR', 'DE', 'Die Archivdatei konnte nicht entpackt werden. Stellen Sie sicher, dass die php_zip Erweiterung korrekt installiert ist.', ''),
('BAK_TIPP', 'DE', 'Sie kÃƒÆ’Ã‚Â¶nnen ihre www, wwwdev-Verzeichnisse sowie die Datenbank hier sichern. Bitte stellen Sie vorab sicher, dass die Sicherung korrekt konfiguriert wurde.', ''),
('BB_IN_MM_MODE', 'DE', 'Das Backoffice ist im Wartungsmodus. Nur der Administrator kann sich einloggen.', ''),
('BY_ORDER', 'DE', 'nach Position', ''),
('CCONLAUNCH', 'DE', 'Cache beim verÃƒÆ’Ã‚Â¶ffentlichen Leeren', ''),
('CCONLAUNCH_LBL', 'DE', 'kommaseparierte Seiten-IDs', ''),
('CHANGE', 'DE', 'ÃƒÆ’Ã¢â‚¬Å¾ndern', ''),
('CHANGE_TEMPLATE', 'DE', 'AusgewÃƒÆ’Ã‚Â¤hlte Seitenvorlage', ''),
('CHNLAUNCHED', 'DE', 'Der Kanal wurde erfolgreich verÃƒÆ’Ã‚Â¶ffentlicht.', ''),
('CLEAR_JPCACHE', 'DE', 'Cache leeren', ''),
('CL_GROUP', 'DE', 'Objektgruppe', ''),
('COPYCLT', 'DE', 'Klasse Kopieren', ''),
('COPYCLUSTERT', 'DE', 'Kopieren', ''),
('CREATECOPY', 'DE', 'Kopieren', ''),
('CR_BO_LANG', 'DE', 'Neue Backoffice-Sprache erstellen', ''),
('DEL_TREE', 'DE', 'Baum lÃƒÆ’Ã‚Â¶schen', ''),
('DEST_FOLDER', 'DE', 'Zielordner', ''),
('EXP_TREE', 'DE', 'Baum zurÃƒÆ’Ã‚Â¼ckziehen', ''),
('FILE_ALREADY_UPLOADED', 'DE', 'Die Datei wurde bereits hochgeladen. Sie kÃƒÆ’Ã‚Â¶nnen fortfahren, indem sie auf Weiter klicken.', ''),
('GAFOLDER', 'DE', 'Bilder-Ordner', ''),
('GALCOLS', 'DE', 'Spalten', ''),
('GALDESC', 'DE', 'Beschreibung', ''),
('GALNAME', 'DE', 'Gallerie', ''),
('GALROWS', 'DE', 'Zeilen', ''),
('GO_IMPORT', 'DE', 'Klicken Sie auf weiter, um die Daten jetzt zu importieren.', ''),
('WZ_IMP_SELCL', 'EN', 'Please select the node you want to import.', ''),
('IMP_ERR', 'DE', 'Der Import ist aufgrund der folgenden Fehler fehlgeschlagen:', ''),
('IMP_IMAGES', 'DE', 'Bilder importieren', ''),
('IMP_IMPAGES', 'DE', 'Bilder importieren', ''),
('LANGID', 'DE', 'Sprachen ID', ''),
('LANGUAGE', 'DE', 'Sprache', ''),
('LAUNCH_TREE', 'DE', 'Launch Tree', ''),
('MAINT_BB', 'DE', 'Backoffice in Wartungsmodus schalten.', ''),
('MAINT_MODE', 'DE', 'Wartungsmodus', ''),
('MAINT_WWW', 'DE', 'Website in Wartungsmodus schalten.', ''),
('MAINT_WWWDEV', 'DE', 'Vorschau-Website in Wartungsmodus schalten.', ''),
('MEDIA_SUPPORTED', 'DE', 'Das Media-Plugin unterstÃƒÆ’Ã‚Â¼tzt folgende Dateitypen:Macromedia Flash Films (.swf), Windows Media (.avi), Real Player (.rm), Apple Quicktime (.mov), MP3 over Windows Media (.mp3), PDF (.pdf)', ''),
('MISSING_PGN', 'DE', 'Fehlendes Plugin:', ''),
('MODTYPE', 'DE', 'Plugin-Typ:', ''),
('MORE_ACT', 'DE', 'Weitere Aktionen...', ''),
('MT_LWC', 'DE', 'Alle Artikel verÃƒÆ’Ã‚Â¶ffentlichen', ''),
('MT_RB_CACHE_MES', 'DE', 'Cache aller verÃƒÆ’Ã‚Â¶ffentlichten Seiten neu aufbauen.', ''),
('MUST_UPLOAD', 'DE', 'Sie mÃƒÆ’Ã‚Â¼ssen eine Datei hochladen', ''),
('M_ARTICLES', 'DE', 'Artikel', ''),
('NEWNAME', 'DE', 'Neuer Name', ''),
('NEW_ROLLOUT', 'DE', 'Einen neuen Kopiervorgang starten', ''),
('NOFI', 'DE', 'Anzahl der importierten Dateien:', ''),
('NOT_FOUND', 'DE', 'Es wurde nichts gefunden.', ''),
('NO_XML', 'DE', 'Die hochgeladenen Datei ist kein korrektes XML.', ''),
('NUMB_FILES', 'DE', 'Anzahl von gefundenen Dateien im Archiv:', ''),
('NUMB_IMPORTED', 'DE', 'Importierte DatensÃƒÆ’Ã‚Â¤tze:', ''),
('NUM_FILES', 'DE', 'Anzahl von gefundenen Dateien im Archiv:', ''),
('O_DELMES2', 'DE', 'MÃƒÆ’Ã‚Â¶chten Sie diesen inhalt wirklich lÃƒÆ’Ã‚Â¶schen? Er kÃƒÆ’Ã‚Â¶nnte immer noch von einigen Objekten genutzt werden.', ''),
('PAGE_ID', 'DE', 'Page ID', ''),
('PAR_PAGE', 'DE', 'Elternseite', ''),
('PGN_INFO', 'DE', 'Informationen zum Plugin', ''),
('PNF', 'DE', 'Die Seiten-Id wurde nicht gefunden', ''),
('POPUP_MENU', 'DE', 'Popup', ''),
('PROC_DATA', 'DE', 'Verarbeite Daten....', ''),
('REFRESH', 'DE', 'Aktualisieren', ''),
('RESETCLI', 'DE', 'Objekt anpassen', ''),
('ROLLOUT_SEL', 'DE', 'Quelle und Ziel der Kopie', ''),
('SEARCH WEBSITE', 'DE', 'Search Website', ''),
('SEL_IMP_FOLDER', 'DE', 'Importverzeichnis auswÃƒÆ’Ã‚Â¤hlen', ''),
('SOURCE', 'DE', 'Quelle', ''),
('SOURCEFILE', 'DE', 'Quelldatei', ''),
('STATISTICS', 'DE', 'Statistiken', ''),
('UNINSTALL', 'DE', 'Deinstallieren', ''),
('UNINSTCONF', 'DE', 'Das Deinstallieren eines Plugins kann ihre Website zerstÃƒÆ’Ã‚Â¶ren. MÃƒÆ’Ã‚Â¶chten Sie wirklich fortfahren?', ''),
('VERSION', 'DE', 'Version', ''),
('WAS_DELETED', 'DE', 'Der Inhalt wurde aus der Bibliothek entfernt.', ''),
('WYSIWYG', 'DE', 'WYSIWYG Editor', ''),
('WZE_ARCHIVE_FILE', 'DE', 'Bitte wÃƒÆ’Ã‚Â¤hlen Sie das zu importierende ZIP-Archiv. Verwenden Sie keine Verzeichnisse innerhalb von Archiven!', ''),
('WZE_ARCH_CHECK', 'DE', 'Bitte kontrollieren Sie die ArchivprÃƒÆ’Ã‚Â¼fung.', ''),
('WZE_DEST_FOLDER', 'DE', 'Bitte wÃƒÆ’Ã‚Â¤hlen Sie den Zielordner fÃƒÆ’Ã‚Â¼r die Bilder.', ''),
('WZT_ACH_CHECK', 'DE', 'Archiv ÃƒÆ’Ã‚Â¼berprÃƒÆ’Ã‚Â¼fen', ''),
('WZT_ARCHIVE_FILE', 'DE', 'Archiv wÃƒÆ’Ã‚Â¤hlen', ''),
('WZT_DEST_FOLDER', 'DE', 'WÃƒÆ’Ã‚Â¤hlen Sie einen Zielordner', ''),
('WZT_IMP_IMAG', 'DE', 'Importiere Bilder...', ''),
('WZ_IMPORT_IM_TITLE', 'DE', 'Dieser Assistent dient zum importieren von Bildern. Packen Sie die Bilder in ein Archiv und laden Sie dies hier hoch.', ''),
('ACCESS_VIOLATION', 'FR', NULL, NULL),
('ACCESS_V_TEXT', 'FR', NULL, NULL),
('ARCHERR', 'FR', NULL, NULL),
('BACK_SP', 'FR', NULL, NULL),
('BB_IN_MM_MODE', 'FR', NULL, NULL),
('BG_COLOR', 'FR', NULL, NULL),
('CCONLAUNCH', 'FR', NULL, NULL),
('CCONLAUNCH_LBL', 'FR', NULL, NULL),
('CHANGE', 'FR', NULL, NULL),
('CHNLAUNCHED', 'FR', NULL, NULL),
('CLEAR_JPCACHE', 'FR', NULL, NULL),
('CLLINK', 'FR', NULL, NULL),
('CONFIRM_UNSAVED_CHANGES_LINKEDCL', 'FR', NULL, NULL),
('COPYCLT', 'FR', NULL, NULL),
('COPYCLUSTERT', 'FR', NULL, NULL),
('CREATECOPY', 'FR', NULL, NULL),
('CR_BO_LANG', 'FR', NULL, NULL),
('DEL_TREE', 'FR', NULL, NULL),
('DEST_FOLDER', 'FR', NULL, NULL),
('EXP_TREE', 'FR', NULL, NULL),
('FILE_ALREADY_UPLOADED', 'FR', NULL, NULL),
('FONT', 'FR', NULL, NULL),
('FONTSIZE', 'FR', NULL, NULL),
('GAFOLDER', 'FR', NULL, NULL),
('GALCOLS', 'FR', NULL, NULL),
('GALDESC', 'FR', NULL, NULL),
('GALNAME', 'FR', NULL, NULL),
('GALROWS', 'FR', NULL, NULL),
('GO_IMPORT', 'FR', NULL, NULL),
('GR_TEXT', 'FR', NULL, NULL),
('HEIGHT', 'FR', NULL, NULL),
('OF', 'EN', 'of', ''),
('IMP_ERR', 'FR', NULL, NULL),
('IMP_IMAGES', 'FR', NULL, NULL),
('IMP_IMPAGES', 'FR', NULL, NULL),
('LANGID', 'FR', NULL, NULL),
('LANGUAGE', 'FR', NULL, NULL),
('LAUNCH_TREE', 'FR', NULL, NULL),
('MAINT_BB', 'FR', NULL, NULL),
('MAINT_MODE', 'FR', NULL, NULL),
('MAINT_WWW', 'FR', NULL, NULL),
('MAINT_WWWDEV', 'FR', NULL, NULL),
('MEDIA_SUPPORTED', 'FR', NULL, NULL),
('MISSING_PGN', 'FR', NULL, NULL),
('MODTYPE', 'FR', NULL, NULL),
('MORE_ACT', 'FR', NULL, NULL),
('MT_LWC', 'FR', NULL, NULL),
('MT_LWS_MESSAGES', 'FR', NULL, NULL),
('MT_RB_CACHE_MES', 'FR', NULL, NULL),
('MUST_UPLOAD', 'FR', NULL, NULL),
('NEWNAME', 'FR', NULL, NULL),
('NEW_ROLLOUT', 'FR', NULL, NULL),
('NOFI', 'FR', NULL, NULL),
('NOT_FOUND', 'FR', NULL, NULL),
('NO_XML', 'FR', NULL, NULL),
('NUMBER', 'FR', NULL, NULL),
('NUMB_FILES', 'FR', NULL, NULL),
('NUMB_IMPORTED', 'FR', NULL, NULL),
('NUM_FILES', 'FR', NULL, NULL),
('O_DELMES2', 'FR', NULL, NULL),
('PAR_PAGE', 'FR', NULL, NULL),
('PGN_INFO', 'FR', NULL, NULL),
('PNF', 'FR', NULL, NULL),
('POPUP_MENU', 'FR', NULL, NULL),
('REFRESH', 'FR', NULL, NULL),
('RESETCLI', 'FR', NULL, NULL),
('ROLLOUT_SEL', 'FR', NULL, NULL),
('SEARCH WEBSITE', 'FR', NULL, NULL),
('SEL_IMP_FOLDER', 'FR', NULL, NULL),
('SOURCE', 'FR', NULL, NULL),
('SOURCEFILE', 'FR', NULL, NULL),
('STATISTICS', 'FR', NULL, NULL),
('TEXT_ALIGN', 'FR', NULL, NULL),
('TEXT_COLOR', 'FR', NULL, NULL),
('TEXT_STYLE', 'FR', NULL, NULL),
('UNINSTALL', 'FR', NULL, NULL),
('UNINSTCONF', 'FR', NULL, NULL),
('VERSION', 'FR', NULL, NULL),
('WAS_DELETED', 'FR', NULL, NULL),
('WIDTH', 'FR', NULL, NULL),
('WYSIWYG', 'FR', NULL, NULL),
('WZE_ARCHIVE_FILE', 'FR', NULL, NULL),
('WZE_ARCH_CHECK', 'FR', NULL, NULL),
('WZE_DEST_FOLDER', 'FR', NULL, NULL),
('WZT_ACH_CHECK', 'FR', NULL, NULL),
('WZT_ARCHIVE_FILE', 'FR', NULL, NULL),
('WZT_DEST_FOLDER', 'FR', NULL, NULL),
('WZT_IMP_IMAG', 'FR', NULL, NULL),
('WZ_IMPORT_IM_TITLE', 'FR', NULL, NULL),
('LATEST', 'EN', 'Latest changed first', ''),
('OLDEST', 'EN', 'Oldest changed first', ''),
('RANDOM', 'EN', 'Random', ''),
('LOGIN', 'EN', 'Sign In', ''),
('ROLL2', 'EN', 'You can change the names of the objects now. This is necessary because you cannot have duplicate names. If names are not too important for you, N/X will use its autonaming algorithm for resolving duplicate name constraints.', ''),
('SOURCE_NODE', 'EN', 'Source Node:', ''),
('DEST_NODE', 'EN', 'Destination node:', ''),
('SEARCH_REPL', 'EN', 'Search and replace object names', ''),
('SEARCHPHRASE', 'EN', 'Search phrase:', ''),
('REPLACEPHRASE', 'EN', 'Replace phrase:', ''),
('REPLACEALL', 'EN', 'Replace All', ''),
('MANEDIT', 'EN', 'Manual edit rollout names and properties', ''),
('SEARCHREPLACEVALID', 'EN', 'You must enter a search and a replace string!', ''),
('ROLLOUTSUCCESS', 'EN', 'The copy was successful!', ''),
('REFRESH_PAGES', 'EN', 'The pages which are based on this template were successfully republished.<br>', ''),
('CH_IMP_SUCCESS', 'EN', 'The data was successfully imported to the channel.', ''),
('NUM_IMP_PAGES', 'EN', 'Total number of imported pages:', ''),
('BACK_TO_CHANNELS', 'EN', 'Back to Article Overview', ''),
('BACKUP_CONFIG', 'EN', 'The backup directory was not found on the harddisc!', ''),
('DEL_BACKUP', 'EN', 'Delete backup file?', ''),
('DEL_BACKUP_MES', 'EN', 'Do you really want to delete this backup file?', ''),
('THEREISQUESTION', 'EN', 'Confirm action', ''),
('CREATED_ITEM', 'EN', 'The following Placeholder was created:', ''),
('SEARCH2', 'EN', 'Search', ''),
('WEBSITEPRV', 'EN', 'Website preview', ''),
('BACKUP_CONFIG', 'DE', 'Das Sicherungsverzeichnis wurde auf der Festplatte nicht gefunden.', ''),
('BACK_TO_CHANNELS', 'DE', 'ZurÃƒÆ’Ã‚Â¼ck zur ArtikelÃƒÆ’Ã‚Â¼bersicht', ''),
('CH_IMP_SUCCESS', 'DE', 'Die Daten wurden erfolgreich in den Kanal importiert.', ''),
('CREATED_ITEM', 'DE', 'Der Platzhalter wurde erzeugt:', ''),
('DEL_BACKUP', 'DE', 'Backupdatei lÃƒÆ’Ã‚Â¶schen?', ''),
('DEL_BACKUP_MES', 'DE', 'MÃƒÆ’Ã‚Â¶chten Sie die Backupdatei wirklich lÃƒÆ’Ã‚Â¶schen?', ''),
('DEST_NODE', 'DE', 'Zielknoten:', ''),
('LATEST', 'DE', 'zuletzt geÃƒÆ’Ã‚Â¤nderte zuerst', ''),
('LOGIN', 'DE', 'Anmelden', ''),
('MANEDIT', 'DE', 'Namen von Hand bearbeiten', ''),
('NUM_IMP_PAGES', 'DE', 'Anzahl importierter Seiten:', ''),
('OF', 'DE', 'von', ''),
('OLDEST', 'DE', 'die ÃƒÆ’Ã‚Â¤ltesten zuerst', ''),
('RANDOM', 'DE', 'ZufÃƒÆ’Ã‚Â¤llig', ''),
('REFRESH_PAGES', 'DE', 'Die Seiten, die auf dieser Vorlage basieren wurden erfolgreich neu verÃƒÆ’Ã‚Â¶ffentlicht.', ''),
('REPLACEALL', 'DE', 'Alle ersetzen', ''),
('REPLACEPHRASE', 'DE', 'Ersetzungstext', ''),
('ROLL2', 'DE', 'Sie kÃƒÆ’Ã‚Â¶nnen die Namen der Objekte jetzt verÃƒÆ’Ã‚Â¤ndern. Dies ist wichtig, da N/X keine zwei Objekte mit dem selben Namen verwalten kann. Wenn Sie die Namen nicht ÃƒÆ’Ã‚Â¤ndern, wird N/X dies automatisch fÃƒÆ’Ã‚Â¼r Sie ÃƒÆ’Ã‚Â¼bernehmen.', ''),
('ROLLOUTSUCCESS', 'DE', 'Die Kopie war erfolgreich.', ''),
('SEARCH2', 'DE', 'Search', ''),
('SEARCHPHRASE', 'DE', 'Suchtext', ''),
('SEARCHREPLACEVALID', 'DE', 'Sie mÃƒÆ’Ã‚Â¼ssen einen Such- und einen Ersetzungstext eingeben.', ''),
('SEARCH_REPL', 'DE', 'Objektnamen Suchen und Ersetzen.', ''),
('SOURCE_NODE', 'DE', 'Quellknoten', ''),
('THEREISQUESTION', 'DE', 'Aktion bestÃƒÆ’Ã‚Â¤tigen', ''),
('WEBSITEPRV', 'DE', 'Entwicklungswebsite', ''),
('WZ_IMP_SELCL', 'DE', 'Bitte wÃƒÆ’Ã‚Â¤hlen Sie den Knoten in den Sie importieren mÃƒÆ’Ã‚Â¶chten.', ''),
('CR_VR', 'DE', 'Create variation', ''),
('CRCLV_MES', 'DE', 'The cluster does not exists in this variation. Do you want to create it?', ''),
('DESIGNS', 'EN', 'Layout Designs', ''),
('M_ESERVICES', 'EN', 'E-Services', ''),
('CONTACTS', 'EN', 'Contacts', ''),
('SHOP', 'EN', 'Shop', ''),
('NEWSLETTER', 'EN', 'Newsletter', ''),
('MAILINGS', 'EN', 'Mailings', ''),
('MENU_DESIGNS', 'EN', 'Menu Designs', ''),
('NOMENU', 'EN', 'No automatic menu drawing', ''),
('SEL_MENU', 'EN', 'Select Menu Layout', ''),
('SEL_MENUSTYLE', 'EN', 'Adjust Menu Type', ''),
('ACTIVECOLOR', 'EN', 'Active Background-Color', ''),
('ACTIVETCOLOR', 'EN', 'Active Text-Color', ''),
('ACTIVETSCOLOR', 'EN', 'Active SubText-Color', ''),
('INACTIVECOLOR', 'EN', 'Inactive Background-Color', ''),
('INACTIVETCOLOR', 'EN', 'Inactive Text-Color', ''),
('INSTALL_PGN', 'EN', 'Install a plugin', ''),
('NACTIVE', 'EN', 'Not active', ''),
('BACTIVE', 'EN', 'Active', ''),
('SP_MENUDESCRIPTION', 'EN', 'Page Description (for sitemap...)', ''),
('URL', 'EN', 'URL', ''),
('ACKEY', 'EN', 'Access Key', ''),
('ACCESS_KEY', 'EN', 'Access Key', ''),
('DESIGNS', 'DE', 'Layout Designs', ''),
('M_ESERVICES', 'DE', 'E-Services', ''),
('CONTACTS', 'DE', 'Contacts', ''),
('SHOP', 'DE', 'Shop', ''),
('NEWSLETTER', 'DE', 'Newsletter', ''),
('MAILINGS', 'DE', 'Mailings', ''),
('MENU_DESIGNS', 'DE', 'Menu Designs', ''),
('NOMENU', 'DE', 'No automatic menu drawing', ''),
('SEL_MENU', 'DE', 'Select Menu Layout', ''),
('SEL_MENUSTYLE', 'DE', 'Adjust Menu Type', ''),
('NACTIVE', 'DE', 'Not active', ''),
('BACTIVE', 'DE', 'Active', ''),
('CONTACTS_OVERVIEW', 'DE', 'Contacts Overview', ''),
('FIRSTNAME', 'DE', 'Firstname', ''),
('EMAIL', 'DE', 'E-Mail-Address', ''),
('CITY', 'DE', 'City', ''),
('LAST_MOD', 'DE', 'Last Modified', ''),
('INSTALL_PGN', 'DE', 'Install a plugin', ''),
('ACKEY', 'DE', 'Access Key', ''),
('EXPL_SEL_CLT', 'DE', 'Please Select a cluster-template.', ''),
('SEL_CLT', 'DE', 'Select Cluster-Template', ''),
('LATEST_CREATED', 'EN', 'Article Date, latest first', ''),
('OLDEST_CREATED', 'EN', 'Article Date, oldest first', ''),
('POS_ASC', 'EN', 'Position ascending', ''),
('POS_DESC', 'EN', 'Position descending', ''),
('OUTPUTPAGE', 'EN', 'Output Page', ''),
('ART_URL', 'EN', 'Article URL', ''),
('URL_DISP_LATER', 'EN', 'The URL will be displayed after the linked template was launched.', ''),
('CHNLAUNCHEDERR', 'EN', 'An error occured while launching the channel.', ''),
('DISP_DOC', 'EN', 'Display Documentation', ''),
('CONTACTS_OVERVIEW', 'EN', 'Contacts Overview', ''),
('FIRSTNAME', 'EN', 'Firstname', ''),
('EMAIL', 'EN', 'E-Mail-Address', ''),
('CITY', 'EN', 'City', ''),
('LAST_MOD', 'EN', 'Last Modified', ''),
('NO_PREVIEW', 'EN', 'No preview available.', ''),
('FLASHGAL', 'EN', 'Flash Gallery', ''),
('CONFIG_SHOP', 'EN', 'Configure Shop', ''),
('CATALOG', 'EN', 'Catalog', ''),
('TAXES', 'EN', 'Tax Setup', ''),
('SHOPCAT', 'EN', 'Shop Categories', ''),
('SHOPOVERVIEW', 'EN', 'Shop Categoy Overview', ''),
('NEW_PRODUCT', 'EN', 'New Product', ''),
('NEW_CATEGORY', 'EN', 'New Category', ''),
('EDIT_CAT', 'EN', 'Edit Category', ''),
('AVAIL_SUBCAT', 'EN', 'Subcategories in this category', ''),
('DEL_CAT', 'EN', 'Delete Category', ''),
('PARENT_CAT', 'EN', 'Parent Category', ''),
('DISPTITLE', 'EN', 'Display Name', ''),
('SEL_IMAGE', 'EN', 'Select image', ''),
('HEADER', 'EN', 'Header', ''),
('FOOTER', 'EN', 'Footer', ''),
('TAX', 'EN', 'Tax', ''),
('EDIT_TAX', 'EN', 'Edit tax', ''),
('NEWSLETTERS', 'EN', 'Newsletters', ''),
('SUBSCRIPTIONS', 'EN', 'Subscriptions', ''),
('NO_ARCHIVE', 'EN', 'The file you uploaded is not an zip-archive or your browser does not send the file correct!', ''),
('ARCHEMPTY', 'EN', 'The archive seems to empty or could not be unzipped successfully.', ''),
('SEL_DESIGN', 'EN', 'Select Design', ''),
('ADJUST/DESUGB', 'EN', 'Adjust Design', ''),
('WEBSITE_DESIGNS', 'EN', 'Website Designs', ''),
('NO_DESIGN', 'EN', 'No design selected', ''),
('IS_SHOP_CAT_CLASS', 'EN', 'Enable for Use as Shop Category Template', ''),
('IS_SHOP_CAT_PRODUCT', 'EN', 'Enable for Use as Shop Product Template', ''),
('RESTRICTED_PAGE', 'EN', 'Restricted page', ''),
('SETTINGS', 'EN', 'Settings', ''),
('REGION', 'EN', 'Place', ''),
('LINK_LABEL', 'EN', 'Link Label', '');

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

INSERT INTO `internal_resources_languages` (`LANGID`, `NAME`, `AGENT_LANGID`, `AGENT_CLASSID`, `AGENT_VERSION`) VALUES 
('EN', 'English', '0x0409', 'B8F2846E-CE36-11D0-AC83-00C04FD97575', '6,0,0,0'),
('DE', 'Deutsch', '0x0407', '1D87F5B5-05F1-11d2-AD7C-0000F8799342', '1,0,0,0'),
('IT', 'Italian', '0x0410', '1D87F5B6-05F1-11d2-AD7C-0000F8799342', '1,0,0,0'),
('MND', 'Chineese (Mandarin)', '', '', ''),
('PL', 'Polish', '12', '32', '65'),
('FR', 'French', '', '', '');

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

INSERT INTO `log` (`LOG_ID`, `CATEGORY`, `MESSAGE`, `USER_ID`, `TARGET1_ID`, `TARGET2_ID`, `LOG_TIME`) VALUES 
(100082, 'AUTH', 'Login failed for user Administrator with IP 127.0.0.1', 0, NULL, NULL, '2007-02-16 19:43:06'),
(100083, 'LAUNCH', 'C:Web\nxhp/www/images/101361.gif could not be deleted.', 1, NULL, NULL, '2007-02-25 13:31:30'),
(100084, 'LAUNCH', 'C:Web\nxhp/www/images/t101361.gif could not be deleted.', 1, NULL, NULL, '2007-02-25 13:31:30'),
(100085, 'AUTH', 'Login failed for user Administrator with IP 127.0.0.1', 0, NULL, NULL, '2007-02-25 21:44:57'),
(100086, 'AUTH', 'Login failed for user Administrator with IP 127.0.0.1', 0, NULL, NULL, '2007-03-03 18:35:43');

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

INSERT INTO `meta_datatypes` (`MTYPE_ID`, `NAME`, `DESCRIPTION`) VALUES 
(1, 'Text', 'Single Line Input with Maximum of 64 chars'),
(2, 'Textarea', 'Four-Line Textarea with maximum of 255 chars of Input'),
(3, 'Color', 'Special Inputfield for entering a color.');

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

INSERT INTO `meta_template_items` (`MTI_ID`, `MT_ID`, `NAME`, `POSITION`, `MTYPE_ID`, `VERSION`) VALUES 
(100426, 100425, 'Keywords', 1, 2, 0),
(100433, 100432, 'Description', 2, 2, 0),
(100435, 100432, 'Keywords', 1, 2, 0);

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

INSERT INTO `meta_templates` (`MT_ID`, `NAME`, `DESCRIPTION`, `INTERNAL`, `VERSION`) VALUES 
(2, '-', NULL, 0, 0),
(100034, '-', '', 0, 10),
(100425, 'Gallery PlugIn-Scheme', 'internally used for assigning Gallery plugin meta data', 1, 0),
(100432, 'Standard', '', 0, 0);

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

INSERT INTO `module_type` (`MODULE_TYPE_ID`, `NAME`) VALUES 
(1, 'Contenttype Extension'),
(2, 'System Extension'),
(3, 'CDS Extension'),
(4, 'Textfilter Extension'),
(5, 'Mashup');

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
  `POSITION` smallint(6) NOT NULL default '0',
  `REGION` varchar(8) default NULL,
  `MODULE_TYPE_ID` tinyint(4) NOT NULL default '1',
  PRIMARY KEY  (`MODULE_ID`),
  UNIQUE KEY `MODULE_ID` (`MODULE_ID`,`MODULE_NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Daten für Tabelle `modules`
-- 

INSERT INTO `modules` (`MODULE_ID`, `MODULE_NAME`, `DESCRIPTION`, `VERSION`, `MT_ID`, `CLASS`, `SOURCE`, `POSITION`, `REGION`, `MODULE_TYPE_ID`) VALUES 
(100012, 'Image', 'Image. Allowed formats are GIF, JPEG and PNG.', 1, 100010, 'pgnImage', 'image/pgn_image.php', 0, NULL, 1),
(100018, 'Label', 'Text-Content with one line for input.', 1, 100016, 'pgnLabel', 'label/pgn_label.php', 0, NULL, 1),
(100024, 'Text', 'Text-Content with any length and format.', 2, 100022, 'pgnText', 'text/pgn_text.php', 0, NULL, 1),
(100048, 'Link', 'Link to pages', 1, 100047, 'pgnLink', 'link/pgn_link.php', 0, NULL, 1),
(100506, 'RSSReader', 'CDS-API-Extension for reading rss feeds', 1, 100505, 'pgnRSSReader', 'rssreader/pgn_rssreader.php', 0, NULL, 3),
(100510, 'RSSCreator', 'CDS-API-Extension for creating RSS-Feeds', 1, 100509, 'pgnRSSCreator', 'rsscreator/pgn_rsscreator.php', 0, NULL, 3),
(100663, 'CMS', 'CDS-API-Extension for creating, launching and editing Clusters.', 1, 100662, 'pgnCMS', 'cms/pgn_cms.php', 0, NULL, 3),
(100711, 'FAQ', 'CDS-API-Extension for realizing a FAQ', 1, 100710, 'pgnFAQ', 'faq/pgn_faq.php', 0, NULL, 3),
(100007, 'Adsense', 'Google Adsense Ad-Management Plugin.', 1, 100006, 'pgnAdsense', 'adsense/pgn_adsense.php', 0, NULL, 1),
(100062, 'Boolean', 'Boolean Plugin', 1, 100061, 'pgnBoolean', 'boolean/pgn_boolean.php', 0, NULL, 1),
(100311, 'Captcha', 'CDS-API-Extension for creating Captchas', 1, 100310, 'pgnCaptcha', 'captcha/pgn_captcha.php', 0, NULL, 3),
(100427, 'Gallery', 'Gallery Plugin', 1, 100425, 'pgnGallery', 'gallery/pgn_gallery.php', 0, NULL, 1),
(100445, 'BulkImage', 'System-Extensions for importing images in archives.', 1, 0, 'pgnBulkImage', 'bulkimage/pgn_bulkimage.php', 0, NULL, 3),
(100606, 'Google Maps API', 'Google Maps API', 1, 100605, 'pgnGoogleMaps', 'googlemaps/pgn_googlemaps.php', 0, NULL, 3),
(101699, 'Tell a Friend', 'Add Tell a friend functions to your website', 1, 101700, 'pgnTellAFriend', 'tellafriend/pgn_tellafriend.php', 1, 'SIDE1', 5);

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

INSERT INTO `pgn_adsense` (`FKID`, `ADTEXT`, `IMPRESSIONS`, `CLICKS`) VALUES 
(100129, '&lt;script type=&quot;text/javascript&quot;&gt;&lt;!--\r\ngoogle_ad_client = &quot;pub-9320408685906498&quot;;\r\ngoogle_ad_width = 160;\r\ngoogle_ad_height = 600;\r\ngoogle_ad_format = &quot;160x600_as&quot;;\r\ngoogle_ad_type = &quot;text_image&quot;;\r\ngoogle_ad_channel =&quot;3676843672&quot;;\r\ngoogle_color_border = &quot;FFFFFF&quot;;\r\ngoogle_color_bg = &quot;FFFFFF&quot;;\r\ngoogle_color_link = &quot;990000&quot;;\r\ngoogle_color_text = &quot;333333&quot;;\r\ngoogle_color_url = &quot;999999&quot;;\r\n//--&gt;&lt;/script&gt;\r\n&lt;script type=&quot;text/javascript&quot;\r\n  src=&quot;http://pagead2.googlesyndication.com/pagead/show_ads.js&quot;&gt;\r\n&lt;/script&gt;', 0, 0),
(100127, '&lt;script type=&quot;text/javascript&quot;&gt;&lt;!--\r\ngoogle_ad_client = &quot;pub-9320408685906498&quot;;\r\ngoogle_ad_width = 125;\r\ngoogle_ad_height = 125;\r\ngoogle_ad_format = &quot;125x125_as_rimg&quot;;\r\ngoogle_cpa_choice = &quot;CAAQsdyWhAIaCMvLJa9eDHjiKJ_D93M&quot;;\r\ngoogle_ad_channel = &quot;3608138593&quot;;\r\n//--&gt;&lt;/script&gt;\r\n&lt;script type=&quot;text/javascript&quot; src=&quot;http://pagead2.googlesyndication.com/pagead/show_ads.js&quot;&gt;\r\n&lt;/script&gt;', 0, 0),
(100123, '&lt;script type=&quot;text/javascript&quot;&gt;&lt;!--\r\ngoogle_ad_client = &quot;pub-9320408685906498&quot;;\r\ngoogle_ad_width = 468;\r\ngoogle_ad_height = 60;\r\ngoogle_ad_format = &quot;468x60_as&quot;;\r\ngoogle_ad_type = &quot;text_image&quot;;\r\ngoogle_ad_channel =&quot;3676843672&quot;;\r\ngoogle_color_border = &quot;FFFFFF&quot;;\r\ngoogle_color_bg = &quot;FFFFFF&quot;;\r\ngoogle_color_link = &quot;990000&quot;;\r\ngoogle_color_text = &quot;333333&quot;;\r\ngoogle_color_url = &quot;999999&quot;;\r\n//--&gt;&lt;/script&gt;\r\n&lt;script type=&quot;text/javascript&quot;\r\n  src=&quot;http://pagead2.googlesyndication.com/pagead/show_ads.js&quot;&gt;\r\n&lt;/script&gt;', 0, 0);

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

INSERT INTO `pgn_boolean` (`FKID`, `VALUE`) VALUES 
(101495, 0),
(101183, 0);

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

INSERT INTO `pgn_config_store` (`CLTI_ID`, `TEXT1`, `TEXT2`, `TEXT3`, `TEXT4`, `TEXT5`, `TEXT6`, `TEXT7`, `TEXT8`, `TEXT9`, `TEXT10`, `TEXT11`, `TEXT12`, `TEXT13`, `TEXT14`, `TEXT15`, `NUMBER1`, `NUMBER2`, `NUMBER3`, `NUMBER4`, `NUMBER5`, `NUMBER6`, `NUMBER7`, `NUMBER8`, `NUMBER9`, `NUMBER10`, `NUMBER11`, `NUMBER12`, `NUMBER13`, `NUMBER14`, `NUMBER15`, `DATE1`, `DATE2`, `DATE3`, `DATE4`, `DATE5`) VALUES 
(100002, 'h1', '#152B36', '#F4FEFD', 'Zrnic', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100111, 'head1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100123, 'h1', '#152b36', '#f4fefd', 'Zrnic', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100321, 'West', '#152b36', '#f4fefd', 'Zrnic', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100322, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100345, '', '#152b36', '#f4fefd', 'Zrnic', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100455, 'h1', '#152b36', '#f4fefd', 'Zrnic', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100527, '400', '80', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100556, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100598, 'h1', '#152b36', '#f4fefd', 'Zrnic', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100733, 'h1', '#152b36', '#f4fefd', 'Zrnic', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100714, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100832, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100341, 'h2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100398, 'h3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100401, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100400, 'h3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100399, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(101178, 'h1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100179, 'h1', '#152b36', '#f4fefd', 'Zrnic', '', '', '', '', '', '', '', '', '', '', '', 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100466, 'h3', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100467, 'h3', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100468, 'h3', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100469, 'h3', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100190, 'h2', '#152b36', '#f4fefd', 'Zrnic', '', '', '', '', '', '', '', '', '', '', '', 24, 200, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100021, 'h1', '#152B36', '#F4FEFD', 'Zrnic', '', '', '', '', '', '', '', '', '', '', '', 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(101905, 'h1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100479, 'h1', '#152b36', '#f4fefd', 'Zrnic', '', '', '', '', '', '', '', '', '', '', '', 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100606, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100622, 'h1', '#152b36', '#f4fefd', 'Zrnic', '', '', '', '', '', '', '', '', '', '', '', 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100778, 'h1', '#152b36', '#f4fefd', 'Zrnic', '', '', '', '', '', '', '', '', '', '', '', 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100491, 'h1', '#152b36', '#f4fefd', 'Zrnic', '', '', '', '', '', '', '', '', '', '', '', 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100350, 'h2', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100351, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100844, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100845, 'h2', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100015, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100016, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100035, 'head1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100036, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100064, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100135, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100139, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100140, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100163, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100172, 'head1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100173, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100168, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100184, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100283, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100280, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100281, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100278, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100276, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100429, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100564, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100616, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100720, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100352, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(101699, 'Tell a Friend', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(101748, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(101752, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `pgn_gallery`
-- 

CREATE TABLE `pgn_gallery` (
  `GALLERY_ID` bigint(20) NOT NULL default '0',
  `NAME` varchar(64) collate latin1_general_ci NOT NULL default '',
  `DESCRIPTION` varchar(255) collate latin1_general_ci default NULL,
  `IMAGE_FOLDER_ID` bigint(20) NOT NULL default '0',
  `COLS` mediumint(9) NOT NULL default '400',
  `ROWS` mediumint(9) NOT NULL default '300',
  `GALLERYTYPE` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`GALLERY_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- 
-- Daten für Tabelle `pgn_gallery`
-- 

INSERT INTO `pgn_gallery` (`GALLERY_ID`, `NAME`, `DESCRIPTION`, `IMAGE_FOLDER_ID`, `COLS`, `ROWS`, `GALLERYTYPE`) VALUES 
(101170, 'Gallery 1', '', 100960, 2, 4, 0);

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

INSERT INTO `pgn_image` (`FKID`, `FILENAME`, `ALT`, `WIDTH`, `HEIGHT`, `COPYRIGHT`) VALUES 
(101356, '101356.gif', 'N/X CMS', 80, 40, ''),
(100125, '100125.gif', 'Logo', 120, 60, ''),
(100967, '100967.jpg', '', 500, 365, 'rick.harris from flickr.com'),
(100969, '100969.jpg', '', 500, 375, 'josef.stuefer from flickr.com'),
(100971, '100971.jpg', '', 500, 375, 'ruurmo from flickr.com'),
(100973, '100973.jpg', '', 375, 500, 'spiralz from flickr.com'),
(100975, '100975.jpg', '', 500, 375, 'michgm from flickr.com'),
(100977, '100977.jpg', '', 500, 376, 'little.jaffa from flickr.com'),
(100979, '100979.jpg', '', 500, 375, 'flickr.com'),
(100981, '100981.jpg', '', 500, 377, 'zenera from flickr.com'),
(100983, '100983.jpg', '', 500, 351, 'michgm from flickr.com'),
(100985, '100985.jpg', '', 375, 500, 'josef.stuefer from flickr.com'),
(100987, '100987.jpg', '', 500, 375, 'josef.stuefer from flickr.com'),
(100989, '100989.jpg', '', 500, 361, 'Binary Code from flickr.com'),
(100991, '100991.jpg', '', 500, 364, 'Binary Code from flickr.com'),
(100993, '100993.jpg', '', 500, 375, ''),
(100995, '100995.jpg', '', 500, 375, 'josef.stuefer from flickr.com'),
(100997, '100997.jpg', '', 500, 375, 'josef.stuefer from flickr.com'),
(100999, '100999.jpg', '', 500, 388, 'Binary Code from Flickr.com'),
(101001, '101001.jpg', '', 500, 375, 'josef.stuefer from flickr.com'),
(101003, '101003.jpg', '', 500, 500, 'josef.stuefer from flickr.com'),
(101361, '101361.gif', 'N/X CMS', 80, 40, ''),
(101993, '', '', 0, 0, '');

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

INSERT INTO `pgn_label` (`FKID`, `CONTENT`) VALUES 
(100133, 'N/X Demohomepage -'),
(100158, 'Welcome to N/X'),
(100177, 'News'),
(100199, 'Back to news Overview'),
(101627, 'Read more about'),
(101622, 'Read more about'),
(101494, 'Sitemap'),
(101485, 'Privacy Statement'),
(101476, 'Legal Notices and Terms'),
(101468, '[SUBJECT]'),
(101467, '<yourmail>@<address.here>'),
(101466, 'Type validation code:'),
(101465, 'Thank you for your message!'),
(101464, 'Reset Form'),
(101463, 'Send Message'),
(101462, 'EMail'),
(101461, ''),
(101460, ''),
(101459, ''),
(101458, ''),
(101457, ''),
(101456, 'Firstname'),
(101455, 'Name'),
(101453, 'Message'),
(101452, 'Subject'),
(101451, 'Get in contact'),
(101426, 'Read more'),
(101421, 'Read more'),
(101417, 'Copyright 2007 by www.yourwebsite.com.'),
(101412, 'Copyright 2007 by www.yourwebsite.com.'),
(101387, 'Description of your website.'),
(101365, 'Keyword1, Keyword2, Keyword3'),
(101345, 'free php content management system'),
(101341, 'N/X CMS'),
(101336, 'N/X CMS'),
(101332, 'Website Title'),
(101327, 'Website Title'),
(101321, 'This is content side2. You can modify this content in the content library by deleting it and creating a new one with access-key "side2". You can also modify the file wwwdev/inc/side2.php which is for creating the whole region.'),
(101314, 'This is content side1. You can modify this content in the content library by deleting it and creating a new one with access-key "side1". You can also modify the file wwwdev/inc/side1.php which is for creating the whole region.'),
(101070, 'Welcome'),
(101089, 'News'),
(101102, 'Back to News Overview'),
(101128, 'About'),
(101140, 'Contact'),
(101141, 'Subject'),
(101142, 'Your Message for us'),
(101144, 'Name'),
(101145, ''),
(101146, ''),
(101147, ''),
(101148, ''),
(101149, ''),
(101150, ''),
(101151, 'E-Mail'),
(101152, 'Send Message'),
(101153, 'Reset Form'),
(101154, 'Thank you for your message'),
(101155, 'Validation code'),
(101156, ''),
(101157, ''),
(101168, 'Image Gallery'),
(101182, 'Sitemap'),
(101194, 'Search'),
(101196, 'Search Website'),
(101197, 'No results found.'),
(101882, 'Recommend this Website'),
(101887, 'Recommend this Website'),
(101891, 'Your Name:'),
(101896, 'Your Name:'),
(101900, 'Your Email:'),
(101906, 'Recipient Email Adresses (at least one)'),
(101911, 'Recipient Email Adresses (at least one)'),
(101915, 'Your Email:'),
(101920, 'Your Message (optional)'),
(101925, 'Your Message (optional)'),
(101929, 'Send Message'),
(101934, 'Send Message'),
(101938, 'Reset Form'),
(101943, 'Reset Form'),
(101947, 'Close Window'),
(101953, 'The following error(s) occured:'),
(101958, 'The following errors occured:'),
(101962, 'Website Recommendation from [name] ([email])'),
(101968, 'Hello, [name] thought you would like to visit the following site: [url]'),
(101973, 'Hello,nr[name] thought you would like to visit the following site: [url]'),
(101982, 'Please enter your email address.'),
(102001, 'Please enter a proper email address for yourself.'),
(102007, 'Please enter at least one friend&#039;s email address.'),
(102013, 'Please enter a proper email adress for recipient #'),
(102019, 'Please enter your name.'),
(102025, 'Message was successfully sent to'),
(102031, 'The message was not sent to'),
(102048, 'Note: This message was not sent unsolicited.  It was sent through a form located at [url]. If you believe this message was received on error, please disregard it.');

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

INSERT INTO `pgn_link` (`FKID`, `LABEL`, `EXTERNAL`, `HREF`, `SPID`, `TARGET`) VALUES 
(100057, 'Forum', 0, 'http://www.nxsystems.org/xmb', 0, ''),
(100092, 'Forum', 0, 'http://www.nxsystems.org/xmb', 100042, ''),
(100418, '', 0, NULL, NULL, NULL),
(100421, '', 0, '', 100256, ''),
(100544, '', 0, '', 100500, ''),
(100593, '', 0, 'http://www.bild.de', 0, ''),
(101208, 'N/X Forum', 0, 'http://www.nxsystems.org/xmb', 0, '');

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

INSERT INTO `pgn_text` (`FKID`, `CONTENT`) VALUES 
(100159, '<p>Phoebe silvarumque potens Diana,<br />lucidum caeli decus, o colendi<br />semper et culti, date quae precamur<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;tempore sacro,</p>\r\n<p><br />quo <strong>Sibyllini monuere versus&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />virgines lectas</strong> puerosque castos<br />dis, quibus septem placuere colles,<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dicere carmen.<br />alme Sol, curru nitido diem qui<br />promis et celas aliusque et idem&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />nasceris, possis nihil urbe Roma<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;visere maius.<br />Rite maturos aperire partus<br />lenis, Ilithyia, tuere matres,<br />sive tu Lucina probas vocari&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;seu Genitalis: <br />diva, producas subolem patrumque<br />prosperes decreta super iugandis<br />feminis prolisque novae feraci<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;lege marita,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />certus undenos deciens per annos<br />orbis ut cantus referatque ludos<br />ter die claro totiensque grata<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nocte frequentis.<br />Vosque, veraces cecinisse Parcae,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />quod semel dictum est stabilisque rerum<br />terminus servet, bona iam peractis<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;iungite fata.<br />fertilis frugum pecorisque Tellus<br />spicea donet Cererem corona;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />nutriant fetus et aquae salubres<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;et Iovis aurae.<br />condito mitis placidusque telo<br />supplices audi pueros, Apollo;<br />siderum regina bicornis, audi,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Luna, puellas.<br />Roma si vestrum est opus Iliaeque<br />litus Etruscum tenuere turmae,<br />iussa pars mutare lares et urbem<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sospite cursu,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />cui per ardentem sine fraude Troiam<br />castus Aeneas patriae superstes<br />liberum munivit iter, daturus<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;plura relictis:<br />di, probos mores docili iuventae,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />di, senectuti placidae quietem,<br />Romulae genti date remque prolemque<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;et decus omne.<br />Quaeque vos bobus veneratur albis<br />clarus Anchisae Venerisque sanguis,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />impetret, bellante prior, iacentem <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;lenis in hostem.<br />iam mari terraque manus potentis<br />Medus Albanasque timet securis,<br />iam Scythae responsa petunt, superbi&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nuper et Indi.<br />iam Fides et Pax et Honos Pudorque<br />priscus et neglecta redire Virtus<br />audet adparetque beata pleno<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Copia cornu.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />Augur et fulgente decorus arcu<br />Phoebus acceptusque novem Camenis,<br />qui salutari levat arte fessos<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;corporis artus, <br />si Palatinas videt aequos aras,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />remque Romanam Latiumque felix<br />alterum in lustrum meliusque semper<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;prorogat aevum,<br />quaeque Aventinum tenet Algidumque,<br />quindecim Diana preces virorum&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />curat et votis puerorum amicas<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;adplicat auris.<br />Haec Iovem sentire deosque cunctos<br />spem bonam certamque domum reporto,<br />doctus et Phoebi chorus et Dianae&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dicere laudes. </p>'),
(100178, ''),
(101477, ''),
(101486, ''),
(101454, ''),
(101071, '<p>{NX:IMAGE ID="100978" HEIGHT="376" WIDTH="500" ALT=""}</p>\r\n<p>Ibis Liburnis inter alta navium,<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amice, propugnacula,<br />paratus omne Caesaris periculum<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; subire, Maecenas, tuo:<br />quid nos, quibus te vita sit superstite<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; iucunda, si contra, gravis?<br />utrumne iussi persequemur otium<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; non dulce, ni tecum simul,<br />an hunc laborem mente laturi, decet<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; qua ferre non mollis viros?<br />feremus et te vel per Alpium iuga<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; inhospitalem et Caucasum<br />vel occidentis usque ad ultimum sinum<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; forti sequemur pectore.<br />roges, tuom labore quid iuvem meo,<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; inbellis ac firmus parum?<br />comes minore sum futurus in metu,<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; qui maior absentis habet:<br />ut adsidens inplumibus pullis avis<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; serpentium adlapsus timet<br />magis relictis, non, ut adsit, auxili<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; latura plus praesentibus.<br />libenter hoc et omne militabitur<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bellum in tuae spem gratiae,<br />non ut iuvencis inligata pluribus<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; aratra nitantur meis<br />pecusve Calabris ante Sidus fervidum<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Lucana mutet pascuis<br />neque ut superni villa candens Tusculi<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Circaea tangat moenia:<br />satis superque me benignitas tua<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ditavit, haud paravero<br />quod aut avarus ut Chremes terra premam,<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; discinctus aut perdam nepos. </p>'),
(101090, ''),
(101129, '<p>{NX:IMAGE ID="100986" HEIGHT="500" WIDTH="375" ALT=""}</p>\r\n<p>&nbsp;</p>\r\n<p>''Beatus ille qui procul negotiis,<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ut prisca gens mortalium,<br />paterna rura bubus exercet suis<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; solutus omni faenore<br />neque excitatur classico miles truci<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; neque horret iratum mare<br />forumque vitat et superba civium<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; potentiorum limina.<br />ergo aut adulta vitium propagine<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; altas maritat populos<br />aut in reducta valle mugientium<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; prospectat errantis greges<br />inutilisque falce ramos amputans<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; feliciores inserit<br />aut pressa puris mella condit amphoris<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; aut tondet infirmas ovis.<br />vel cum decorum mitibus pomis caput<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Autumnus agris extulit,<br />ut gaudet insitiva decerpens pira<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; certantem et uvam purpurae,<br />qua muneretur te, Priape, et te, pater<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Silvane, tutor finium.<br />libet iacere modo sub antiqua ilice,<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; modo in tenaci gramine:<br />labuntur altis interim ripis aquae,<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; queruntur in Silvis aves<br />frondesque lymphis obstrepunt manantibus,<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; somnos quod invitet levis.<br />at cum tonantis annus hibernus Iovis<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; imbris nivisque conparat,<br />aut trudit acris hinc et hinc multa cane<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; apros in obstantis plagas<br />aut amite levi rara tendit retia<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; turdis edacibus dolos<br />pavidumque leporem et advenam laqueo gruem<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; iucunda captat praemia.<br />quis non malarum quas amor curas habet<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; haec inter obliviscitur?<br />quodsi pudica mulier in partem iuvet<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; domum atque dulcis liberos,<br />Sabina qualis aut perusta Solibus<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pernicis uxor Apuli,<br />sacrum vetustis exstruat lignis focum<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lassi Sub adventum viri<br />claudensque textis cratibus laetum pecus<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; distenta siccet ubera<br />et horna dulci vina promens dolio<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dapes inemptas adparet:<br />non me Lucrina iuverint conchylia<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; magisve rhombus aut scari,<br />siquos Eois intonata fluctibus<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hiems ad hoc vertat mare,<br />non Afra avis descendat in ventrem meum,<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; non attagen Ionicus<br />iucundior quam lecta de pinguissimis<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; oliva ramis arborum<br />aut herba lapathi prata amantis et gravi<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; malvae salubres corpori<br />vel agna festis caesa Terminalibus<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vel haedus ereptus lupo.<br />has inter epulas ut iuvat pastas ovis<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; videre properantis domum,<br />videre fessos vomerem inversum boves<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; collo trahentis languido<br />positosque vernas, ditis examen domus,<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; circum renidentis Laris.''<br />haec ubi locutus faenerator Alfius,<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; iam iam futurus rusticus,<br />omnem redegit idibus pecuniam,<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; quaerit kalendis ponere. </p>'),
(101143, ''),
(101169, 'The images shown in the gallery are all from flickr.com. Read there for more details and take a look at the Copyright Tags in the N/X backoffice.'),
(101195, ''),
(102040, '');

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

INSERT INTO `pot_accesslog` (`accesslog_id`, `timestamp`, `document_id`, `exit_target_id`, `entry_document`) VALUES 
(-1870975372, 1155287884, -1372539626, 0, 1),
(-1870975372, 1155288086, -50121658, 0, 0),
(-1870975372, 1155288162, -1372539626, 0, 0),
(-1870975372, 1155288185, -50121658, 0, 0),
(-1870975372, 1155288306, 1404213637, 0, 0),
(-1870975372, 1155288332, -50121658, 0, 0),
(-1870975372, 1155288438, -1372539626, 0, 0),
(-1870975372, 1155289117, -50121658, 0, 0),
(2059908099, 1155289162, -50121658, 0, 1),
(2059908099, 1155289239, 1404213637, 0, 0),
(123962545, 1155299363, -1372539626, 0, 1),
(123962545, 1155299374, -50121658, 0, 0),
(123962545, 1155300454, -597777578, 0, 0),
(123962545, 1155300487, 1275463402, 0, 0),
(123962545, 1155301489, -1372539626, 0, 0),
(123962545, 1155301494, -597777578, 0, 0),
(123962545, 1155301550, -881221112, 0, 0),
(123962545, 1155301647, -1372539626, 0, 0),
(123962545, 1155301651, -597777578, 0, 0),
(123962545, 1155301654, -881221112, 0, 0),
(123962545, 1155302736, -597777578, 0, 0),
(123962545, 1155302966, -1372539626, 0, 0),
(196928006, 1155319569, -1372539626, 0, 1),
(196928006, 1155319576, 217814675, 0, 0),
(196928006, 1155319580, -1480284757, 0, 0),
(196928006, 1155319590, -1372539626, 0, 0),
(196928006, 1155319715, 217814675, 0, 0),
(196928006, 1155319720, -1480284757, 0, 0),
(-1229904442, 1155466272, -1372539626, 0, 1),
(1237274194, 1155466337, -1372539626, 0, 1),
(1695662651, 1155481956, -1372539626, 0, 1),
(1153418208, 1155492450, 0, 0, 1),
(2114142998, 1168170093, 0, 0, 1);

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

INSERT INTO `pot_documents` (`data_id`, `string`, `document_url`) VALUES 
(-1372539626, '100031', 'http://localhost/nx5/www/en/test/'),
(-50121658, '100108', 'http://localhost/nx5/www/en/serivepages/sitemap/'),
(1404213637, '100095', 'http://localhost/nx5/www/en/test/forum/profiles/'),
(-597777578, '100169', 'http://localhost/nx5/www/en/news/'),
(1275463402, '100181', 'http://localhost/nx5/www/en/news/article/general_news/welcome/'),
(-881221112, '100196', 'http://localhost/nx5/www/en/news/articles/general_news/welcome/'),
(217814675, '100243', 'http://localhost/corps/www/en/news/'),
(-1480284757, '100260', 'http://localhost/corps/www/en/news/article/general_news/welcome/');

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

INSERT INTO `pot_hostnames` (`data_id`, `string`) VALUES 
(-1631451101, 'localhost');

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

INSERT INTO `pot_nxlog` (`accesslog_id`, `weekday`, `hour`, `starttime`, `endtime`, `pi`, `duration`) VALUES 
(-1870975372, 5, 11, 1155287884, 1155289117, 8, 1233),
(2059908099, 5, 11, 1155289162, 1155289239, 2, 77),
(123962545, 5, 15, 1155299363, 1155302966, 12, 3603),
(196928006, 5, 20, 1155319569, 1155319720, 6, 151),
(-1229904442, 0, 12, 1155466272, 1155466272, 1, 0),
(1237274194, 0, 12, 1155466337, 1155466337, 1, 0),
(1695662651, 0, 17, 1155481956, 1155481956, 1, 0),
(1153418208, 0, 20, 1155492450, 1155492450, 1, 0),
(2114142998, 0, 12, 1168170093, 1168170093, 1, 0);

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

INSERT INTO `pot_operating_systems` (`data_id`, `string`) VALUES 
(-114077417, 'Windows XP');

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

INSERT INTO `pot_user_agents` (`data_id`, `string`) VALUES 
(-520828167, 'MS Internet Explorer 6.0'),
(-795004555, 'compatible Mozilla/5.0'),
(-516513586, 'MS Internet Explorer 7.0');

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

INSERT INTO `pot_visitors` (`accesslog_id`, `visitor_id`, `client_id`, `operating_system_id`, `user_agent_id`, `host_id`, `referer_id`, `timestamp`, `returning_visitor`) VALUES 
(-1870975372, 408395800, 1, -114077417, -520828167, -1631451101, 0, 1155287884, 1),
(2059908099, -1380132645, 1, -114077417, -795004555, -1631451101, 0, 1155289162, 1),
(123962545, -1380132645, 1, -114077417, -795004555, -1631451101, 0, 1155299363, 1),
(196928006, 196928006, 1, -114077417, -516513586, -1631451101, 0, 1155319569, 0),
(-1229904442, 196928006, 1, -114077417, -520828167, -1631451101, 0, 1155466272, 1),
(1237274194, 1237274194, 1, -114077417, -795004555, -1631451101, 0, 1155466337, 0),
(1695662651, 196928006, 1, -114077417, -520828167, -1631451101, 0, 1155481956, 1),
(1153418208, 196928006, 1, -114077417, -520828167, -1631451101, 0, 1155492450, 1),
(2114142998, 2114142998, 1, -114077417, -795004555, -1631451101, 0, 1168170093, 0);

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

INSERT INTO `registry` (`REGID`, `REGNAME`, `VALUE`, `PARENTREGID`) VALUES 
(100680, 'PLUGINS', '', 0),
(100681, 'FAQ', '', 100680),
(100682, 'CLT', '100712', 100681),
(101146, 'SYSTEM', '', 0),
(101147, 'MAINTENANCE', '', 101146),
(101148, 'WWWDEV', '', 101147),
(101149, 'WWW', '', 101147),
(101150, 'BB', '', 101147),
(100024, 'CDS', '', 0),
(100025, 'MENU', 'plain/dc_plain.php', 100024),
(100026, 'COLORACTIVE', '', 100025),
(100027, 'COLORTACTIVE', '', 100025),
(100028, 'COLORSTACTIVE', '', 100025),
(100029, 'COLORINACTIVE', '', 100025),
(100030, 'COLORTINACTIVE', '', 100025);

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

INSERT INTO `role_sys_functions` (`ROLE_ID`, `FUNCTION_ID`) VALUES 
(2, 'ADD_SITEPAGE'),
(2, 'ADD_SP_MASTER'),
(2, 'ADMINISTRATION_M'),
(2, 'ALLOW_CMS_LOGIN'),
(2, 'B_CL_EDIT_ALL'),
(2, 'B_CL_USAGE'),
(2, 'B_DESTROY_TREE'),
(2, 'B_EDIT_ALL'),
(2, 'B_LIVE_AUTHORING'),
(2, 'B_PREVIEW_PAGE'),
(2, 'B_RELAUNCH_INST'),
(2, 'B_RELAUNCH_TREE'),
(2, 'B_USAGE'),
(2, 'CLEAR_CACHE'),
(2, 'CL_BROWSER'),
(2, 'CL_PROPS'),
(2, 'CL_TEMP_BROWSER'),
(2, 'CL_USAGE'),
(2, 'C_ACTIVE'),
(2, 'C_CACHE'),
(2, 'DELETE_CL'),
(2, 'DELETE_CL_TEMP'),
(2, 'DELETE_FOLDER'),
(2, 'DELETE_OBJECT'),
(2, 'DELETE_SITEPAGE'),
(2, 'DELETE_SP_MASTER'),
(2, 'DIRECT_URL'),
(2, 'EDIT_CL_CONTENT'),
(2, 'EDIT_CL_TEMP'),
(2, 'EDIT_CONTENT'),
(2, 'EDIT_META_DATA'),
(2, 'EDIT_OBJECT'),
(2, 'ED_CL_TEMP_PROPS'),
(2, 'ED_FOLDER_PROPS'),
(2, 'EXPLORE_SITE_M'),
(2, 'EXPLORE_SITE_S'),
(2, 'MAINTENANCE'),
(2, 'MENU'),
(2, 'META_TEMP'),
(2, 'MY_PORTALS'),
(2, 'MY_PROFILE'),
(2, 'NEW_CL_TEMP'),
(2, 'NEW_FOLDER'),
(2, 'NEW_OBJECT'),
(2, 'OBJECT_BROWSER'),
(2, 'OBJECT_PROPS'),
(2, 'OBJ_USAGE'),
(2, 'PORTAL_MANAGER'),
(2, 'RESOURCES_M'),
(2, 'ROLLOUT'),
(2, 'SITEPAGE_MASTER'),
(2, 'SITEPAGE_PROPS'),
(2, 'VARIATIONS'),
(3, 'ADD_SITEPAGE'),
(3, 'ADMINISTRATION_M'),
(3, 'ALLOW_CMS_LOGIN'),
(3, 'B_CL_EDIT_ALL'),
(3, 'B_CL_USAGE'),
(3, 'B_EDIT_ALL'),
(3, 'B_LIVE_AUTHORING'),
(3, 'B_PREVIEW_PAGE'),
(3, 'B_USAGE'),
(3, 'CL_BROWSER'),
(3, 'CL_PROPS'),
(3, 'DELETE_OBJECT'),
(3, 'DELETE_SITEPAGE'),
(3, 'EDIT_CL_CONTENT'),
(3, 'EDIT_CONTENT'),
(3, 'EDIT_META_DATA'),
(3, 'EDIT_OBJECT'),
(3, 'EXPLORE_SITE_M'),
(3, 'EXPLORE_SITE_S'),
(3, 'MENU'),
(3, 'MY_PORTALS'),
(3, 'MY_PROFILE'),
(3, 'NEW_FOLDER'),
(3, 'NEW_OBJECT'),
(3, 'OBJECT_BROWSER'),
(3, 'OBJECT_PROPS'),
(3, 'RESOURCES_M'),
(3, 'SITEPAGE_PROPS'),
(5, 'ADMINISTRATION_M'),
(5, 'ALLOW_CMS_LOGIN'),
(5, 'B_EDIT_ALL'),
(5, 'B_LIVE_AUTHORING'),
(5, 'B_PREVIEW_PAGE'),
(5, 'B_RELAUNCH_TREE'),
(5, 'B_USAGE'),
(5, 'EDIT_CONTENT'),
(5, 'EDIT_META_DATA'),
(5, 'EXPLORE_SITE_M'),
(5, 'EXPLORE_SITE_S'),
(5, 'MENU'),
(5, 'MY_PORTALS'),
(5, 'MY_PROFILE'),
(5, 'PLUGINS_M'),
(5, 'SITEPAGE_PROPS'),
(100255, 'COMMUNITY_LOGIN'),
(100328, 'ADMINISTRATION_M'),
(100328, 'ALLOW_CMS_LOGIN'),
(100328, 'B_CL_EDIT_ALL'),
(100328, 'B_EDIT_ALL'),
(100328, 'B_EXPIRE_LAUNCH'),
(100328, 'B_LIVE_AUTHORING'),
(100328, 'B_PREVIEW_PAGE'),
(100328, 'DELETE_OBJECT'),
(100328, 'EDIT_CL_CONTENT'),
(100328, 'EDIT_CONTENT'),
(100328, 'EDIT_META_DATA'),
(100328, 'EDIT_OBJECT'),
(100328, 'EXPLORE_SITE_M'),
(100328, 'MENU'),
(100328, 'MY_PROFILE'),
(100328, 'NEW_OBJECT'),
(100328, 'OBJECT_BROWSER'),
(100328, 'OBJECT_PROPS'),
(100328, 'OBJ_USAGE'),
(100328, 'RESOURCES_M'),
(100329, 'ADMINISTRATION_M'),
(100329, 'ALLOW_CMS_LOGIN'),
(100329, 'MY_PROFILE'),
(100329, 'TRAFFIC');

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

INSERT INTO `roles` (`ROLE_ID`, `ROLE_NAME`, `DESCRIPTION`) VALUES 
(1, 'Administrator', ''),
(2, 'Developer', ''),
(3, 'Editor', ''),
(5, 'Quality Manager', 'Checks, wether the quality of content is alright or not.'),
(100328, 'Portal Editor', ''),
(100329, 'Analyst', ''),
(100255, 'Community', '');

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

INSERT INTO `sequences` (`seq`, `val`) VALUES 
('GUID', 102052),
('log', 100087);

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

INSERT INTO `sitemap` (`MENU_ID`, `PARENT_ID`, `SPM_ID`, `NAME`, `POSITION`, `IS_POPUP`, `DELETED`, `VERSION`, `IS_DISPLAYED`, `IS_CACHED`, `IS_LOCKED`, `CC_ON_LAUNCH`) VALUES 
(101204, 101123, 100052, 'Forum', 3, 0, 0, 0, 1, 1, 0, NULL),
(101490, 101433, 100058, 'Sitemap', 2, 0, 0, 0, 1, 1, 0, NULL),
(101481, 101440, 100017, 'Privacy Statement', 2, 0, 0, 0, 1, 1, 0, NULL),
(101178, 101066, 100058, 'Sitemap', 1, 0, 0, 0, 1, 1, 0, NULL),
(100180, 100042, 100170, 'News', 4, 0, 0, 10, 1, 1, 0, NULL),
(101164, 101123, 100436, 'Gallery', 2, 0, 0, 0, 1, 1, 0, NULL),
(101447, 101433, 100572, 'Contact', 1, 0, 0, 0, 1, 1, 0, NULL),
(101190, 101066, 100743, 'Search Engine', 2, 0, 0, 0, 1, 1, 0, NULL),
(101136, 101123, 100572, 'Contact', 1, 0, 0, 0, 1, 1, 0, NULL),
(101123, 0, 100017, 'About', 2, 0, 0, 0, 1, 1, 0, NULL),
(101098, 101085, 100137, 'News', 1, 0, 0, 0, 0, 1, 1, NULL),
(101440, 0, 100079, 'Footerlinks', 5, 0, 0, 0, 0, 1, 0, NULL),
(101433, 0, 100079, 'Headerlinks', 4, 0, 0, 0, 0, 1, 0, NULL),
(101085, 101078, 100142, 'Overview', 1, 0, 0, 0, 1, 1, 0, NULL),
(101078, 0, 100079, 'News', 3, 0, 0, 0, 1, 1, 0, NULL),
(101066, 0, 100017, 'Home', 1, 0, 0, 0, 1, 1, 0, NULL),
(101472, 101440, 100017, 'Legal Notices and Terms', 1, 0, 0, 0, 1, 1, 0, NULL);

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
  `DELETABLE` tinyint(4) NOT NULL default '1',
  `PASSWORD_PROTECTED` tinyint(4) NOT NULL default '0',
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

INSERT INTO `sitepage` (`SPID`, `SPM_ID`, `MENU_ID`, `POSITION`, `CLNID`, `LAUNCH_DATE`, `EXPIRE_DATE`, `POPUP_WINDOW`, `DELETABLE`, `PASSWORD_PROTECTED`, `DELETED`, `VERSION`) VALUES 
(101491, 100058, 101490, 1, 101492, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 1, 0, 0, 0),
(101482, 100017, 101481, 1, 101483, NULL, NULL, 0, 1, 0, 0, 0),
(100144, 100142, 100143, 1, 100145, NULL, NULL, 0, 1, 0, 0, 0),
(100196, 100182, 100200, 1, 100197, NULL, NULL, 0, 1, 0, 0, 10),
(100169, 100170, 100180, 1, 100175, NULL, NULL, 0, 1, 0, 0, 10),
(100192, 100137, 100191, 1, 100193, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 1, 0, 0, 0),
(101191, 100743, 101190, 1, 101192, NULL, NULL, 0, 1, 0, 0, 0),
(101473, 100017, 101472, 1, 101474, NULL, NULL, 0, 1, 0, 0, 0),
(101179, 100058, 101178, 1, 101180, NULL, NULL, 0, 1, 0, 0, 0),
(101448, 100572, 101447, 1, 101449, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0, 0, 0),
(101205, 100052, 101204, 1, 101206, NULL, NULL, 0, 1, 0, 0, 0),
(101165, 100436, 101164, 1, 101166, NULL, NULL, 0, 1, 0, 0, 0),
(101137, 100572, 101136, 1, 101138, NULL, NULL, 0, 1, 0, 0, 0),
(101124, 100017, 101123, 1, 101125, NULL, NULL, 0, 1, 0, 0, 0),
(101099, 100137, 101098, 1, 101100, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 1, 0, 0, 0),
(101441, 100079, 101440, 1, 101442, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0, 0, 0),
(101434, 100079, 101433, 1, 101435, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0, 0, 0),
(101086, 100142, 101085, 1, 101087, NULL, NULL, 0, 1, 0, 0, 0),
(101079, 100079, 101078, 1, 101080, NULL, NULL, 0, 1, 0, 0, 0),
(101067, 100017, 101066, 1, 101068, NULL, NULL, 0, 1, 0, 0, 0);

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

INSERT INTO `sitepage_master` (`SPM_ID`, `NAME`, `DESCRIPTION`, `TEMPLATE_PATH`, `CLT_ID`, `SPMTYPE_ID`, `DELETED`, `THUMBNAIL`, `VERSION`) VALUES 
(100017, 'Text', '- Headline\r\n- HTML-Text', 'text.php', 100014, 1, 0, 'HTML_Page.png', 0),
(100052, 'External Page', 'Opens a new window and displays the URL which is stored in the template.', 'external.php', 100050, 1, 0, 'Popup.png', 0),
(100058, 'Sitemap', 'Draws a sitemap for your homepage.', 'sitemap.php', 100063, 1, 0, 'Sitemap.png', 0),
(100079, 'Menu Separator', 'Use for creating menu-sections with no content. If the page is clicked, the system does an automatic forwarding to the first childpage.', 'separator.php', 100078, 1, 0, 'X.png', 0),
(100137, 'Article Page', 'Special Template for displaying an article. Articles are grouped in channels. When you setup a channel, you can define a output page for each channel category. Output pages are based on this template', 'article.php', 100167, 1, 0, 'Article.png', 0),
(100142, 'Article Overview', 'Displays a list with the selected articles from a channel. Use this template to create a overview page for News and other articles.', 'article_overview.php', 100138, 1, 0, 'Overview.png', 0),
(100170, 'Article Overview', 'Displays a list with the selected articles from a channel. Use this template to create a overview page for News and other articles.', 'article_overview.php', 100171, 1, 0, NULL, 10),
(100182, 'Article Page', 'Special Template for displaying an article. Articles are grouped in channels. When you setup a channel, you can define a output page for each channel category. Output pages are based on this template', 'article.php', 100183, 1, 0, NULL, 10),
(100572, 'Contact (Send Email)', 'Contact form. The form is send to you by email.', 'contact.php', 100335, 1, 0, 'Form.png', 0),
(100312, 'Contact  (Mailing System)', 'Contact form. The request are written to the database and can be anwered in E-Services/Mailings.', 'contact2.php', 100554, 1, 0, 'Form.png', 0),
(100513, 'RSS Creator', 'Create a RSS-Feed out of a channel.', 'rss.php', 100511, 1, 0, 'XML.png', 0),
(101212, 'RSS Reader', 'Load a RSS feed and display it on the homepage.', 'rssdisp.php', 101177, 1, 0, 'Overview2.png', 0),
(100436, 'Gallery', 'Template for creating image galleries', 'gallery.php', 100428, 1, 0, 'Gallery.png', 0),
(101182, 'Show In Frame', 'Use this template, to show the content of an URL in an embedded frame (iframe).', 'inline.php', 100560, 1, 0, 'IFrame.png', 0),
(100639, 'Map', 'View a address with Google Maps.', 'map.php', 100612, 1, 0, 'Map.png', 0),
(100743, 'Search Engine', 'This page implements a search engine in your website. You must run the spiders before you can use the integrated searchengine. Therefore go to Maintenance/Search Indexing.', 'search.php', 100716, 1, 0, 'Search.png', 0);

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

INSERT INTO `sitepage_names` (`SPID`, `VARIATION_ID`, `NAME`, `DIRECT_URL`, `HELP`, `DELETED`, `VERSION`) VALUES 
(101191, 1, 'Search Engine', NULL, '', 0, 0),
(101205, 1, 'Forum', NULL, '', 0, 0),
(101491, 1, 'Sitemap', NULL, '', 0, 0),
(101482, 1, 'Privacy Statement', NULL, '', 0, 0),
(101473, 1, 'Legal Notices and Terms', NULL, '', 0, 0),
(100144, 1, 'News', NULL, '', 0, 0),
(100196, 1, 'Articles', '', '', 0, 10),
(100169, 1, 'News', '', '', 0, 10),
(100192, 1, 'Articles', NULL, '', 0, 0),
(101448, 1, 'Contact', NULL, '', 0, 0),
(101441, 1, 'Footerlinks', NULL, '', 0, 0),
(101179, 1, 'Sitemap', NULL, '', 0, 0),
(101165, 1, 'Gallery', NULL, '', 0, 0),
(101137, 1, 'Contact', NULL, '', 0, 0),
(101124, 1, 'About', NULL, '', 0, 0),
(101099, 1, 'News', NULL, '', 0, 0),
(101434, 1, 'Headerlinks', NULL, '', 0, 0),
(101086, 1, 'Overview', NULL, '', 0, 0),
(101079, 1, 'News', NULL, '', 0, 0),
(101067, 1, 'Home', NULL, '', 0, 0);

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

INSERT INTO `sitepage_types` (`SPMTYPE_ID`, `NAME`) VALUES 
(1, 'SINGLEPAGE'),
(2, 'MULTIPAGE'),
(3, 'PORTAL');

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

INSERT INTO `sitepage_variations` (`SPM_ID`, `VARIATION_ID`) VALUES 
(100017, 1),
(100052, 1),
(100058, 1),
(100079, 1),
(100137, 1),
(100142, 1),
(100154, 1),
(100170, 1),
(100182, 1),
(100572, 1),
(100312, 1),
(100513, 1),
(101212, 1),
(100436, 1),
(101182, 1),
(100639, 1),
(100743, 1);

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

INSERT INTO `state_translation` (`IN_ID`, `OUT_ID`, `LEVEL`, `MODIFIED`, `EXPIRED`) VALUES 
(100019, 100031, 10, '2006-08-13 19:01:52', 1),
(100017, 100032, 10, '2006-08-09 22:05:37', 0),
(100014, 100033, 10, '2006-08-11 20:06:03', 0),
(2, 100034, 10, '2007-03-28 16:07:03', 0),
(100015, 100035, 10, '2006-08-11 20:06:03', 0),
(100016, 100036, 10, '2006-08-11 20:06:03', 0),
(100020, 100037, 10, '2006-08-11 20:06:03', 0),
(100021, 100038, 10, '2006-08-13 19:01:52', 1),
(100022, 100039, 10, '2006-08-11 20:06:03', 0),
(100023, 100040, 10, '2006-08-11 20:06:03', 0),
(100018, 100041, 10, '2006-08-13 19:01:52', 1),
(0, 100042, 10, '2006-08-09 22:05:37', 0),
(100080, 100084, 10, '2006-08-13 19:02:06', 1),
(100054, 100086, 10, '2006-08-13 19:01:52', 1),
(100052, 100087, 10, '2006-08-11 11:17:08', 0),
(100050, 100088, 10, '2006-08-11 20:06:03', 0),
(100051, 100089, 10, '2006-08-11 20:06:03', 0),
(100055, 100090, 10, '2006-08-11 20:06:03', 0),
(100056, 100091, 10, '2006-08-13 19:01:52', 1),
(100057, 100092, 10, '2006-08-11 20:06:03', 0),
(100053, 100093, 10, '2006-08-13 19:01:52', 1),
(100073, 100095, 10, '2006-08-13 19:01:52', 1),
(100074, 100096, 10, '2006-08-11 20:06:03', 0),
(100075, 100097, 10, '2006-08-13 19:01:52', 1),
(100076, 100098, 10, '2006-08-11 20:06:03', 0),
(100077, 100099, 10, '2006-08-11 20:06:03', 0),
(100072, 100100, 10, '2006-08-13 19:01:52', 1),
(100081, 100102, 10, '2006-08-13 19:02:06', 1),
(100079, 100103, 10, '2006-08-11 11:17:08', 0),
(100078, 100104, 10, '2006-08-13 12:51:32', 0),
(100082, 100105, 10, '2006-08-11 20:06:03', 0),
(100083, 100106, 10, '2006-08-13 19:02:06', 1),
(100067, 100108, 10, '2006-08-13 19:02:06', 1),
(100058, 100109, 10, '2006-08-11 11:17:08', 0),
(100063, 100110, 10, '2006-08-11 20:06:03', 0),
(100064, 100111, 10, '2006-08-11 20:06:03', 0),
(100065, 100112, 10, '2006-08-11 20:06:03', 0),
(100068, 100113, 10, '2006-08-11 20:06:03', 0),
(100069, 100114, 10, '2006-08-13 19:02:06', 1),
(100070, 100115, 10, '2006-08-11 20:06:03', 0),
(100071, 100116, 10, '2006-08-11 20:06:03', 0),
(100066, 100117, 10, '2006-08-13 19:02:06', 1),
(100008, 100122, 10, '2006-08-11 15:07:05', 0),
(100009, 100123, 10, '2006-08-11 15:07:05', 0),
(100002, 100124, 10, '2006-08-11 15:07:09', 0),
(100003, 100125, 10, '2006-08-11 15:07:09', 0),
(100048, 100126, 10, '2006-08-11 15:07:14', 0),
(100049, 100127, 10, '2006-08-11 15:07:14', 0),
(100046, 100128, 10, '2006-08-11 15:07:16', 0),
(100047, 100129, 10, '2006-08-11 15:07:16', 0),
(100130, 100132, 10, '2006-08-11 15:07:07', 0),
(100131, 100133, 10, '2006-08-11 15:07:07', 0),
(100157, 100160, 10, '2006-08-13 19:04:29', 1),
(100156, 100161, 10, '2006-08-11 20:06:03', 0),
(100134, 100162, 10, '2006-08-11 20:06:03', 0),
(100135, 100163, 10, '2006-08-11 20:06:03', 0),
(100136, 100164, 10, '2006-08-11 20:06:03', 0),
(100158, 100165, 10, '2006-08-11 20:06:03', 0),
(100159, 100166, 10, '2006-08-11 20:06:03', 0),
(100144, 100169, 10, '2006-08-11 14:30:47', 0),
(100142, 100170, 10, '2006-08-11 14:29:11', 0),
(100138, 100171, 10, '2006-08-11 20:06:03', 0),
(100139, 100172, 10, '2006-08-11 20:06:03', 0),
(100140, 100173, 10, '2006-08-11 20:06:03', 0),
(100141, 100174, 10, '2006-08-11 20:06:03', 0),
(100145, 100175, 10, '2006-08-11 14:30:47', 0),
(100146, 100176, 10, '2006-08-11 14:29:11', 0),
(100147, 100177, 10, '2006-08-11 14:30:47', 0),
(100148, 100178, 10, '2006-08-11 14:30:47', 0),
(100149, 100179, 10, '2006-08-11 14:30:47', 0),
(100143, 100180, 10, '2006-08-11 14:30:47', 0),
(100151, 100181, 10, '2006-08-11 15:01:50', 1),
(100137, 100182, 10, '2006-08-11 14:29:11', 0),
(100167, 100183, 10, '2006-08-11 20:06:03', 0),
(100168, 100184, 10, '2006-08-11 20:06:03', 0),
(100152, 100185, 10, '2006-08-11 14:53:11', 0),
(100153, 100186, 10, '2006-08-11 15:01:50', 1),
(100150, 100187, 10, '2006-08-11 15:01:50', 1),
(100188, 100189, 10, '2006-08-11 14:53:11', 0),
(100192, 100196, 10, '2006-08-11 15:06:18', 0),
(100193, 100197, 10, '2006-08-11 15:06:18', 0),
(100194, 100198, 10, '2006-08-11 15:05:11', 0),
(100195, 100199, 10, '2006-08-11 15:06:18', 0),
(100191, 100200, 10, '2006-08-11 15:06:18', 0),
(100202, 100207, 10, '2006-08-11 15:16:21', 1),
(100203, 100208, 10, '2006-08-11 15:16:15', 0),
(100204, 100209, 10, '2006-08-11 15:16:21', 1),
(100205, 100210, 10, '2006-08-11 15:16:15', 0),
(100206, 100211, 10, '2006-08-11 15:16:15', 0),
(100201, 100212, 10, '2006-08-11 15:16:21', 1),
(100237, 100243, 10, '2006-08-13 19:02:19', 1),
(100238, 100244, 10, '2006-08-11 20:06:03', 0),
(100239, 100245, 10, '2006-08-13 19:02:19', 1),
(100240, 100246, 10, '2006-08-11 20:06:03', 0),
(100241, 100247, 10, '2006-08-11 20:06:03', 0),
(100242, 100248, 10, '2006-08-11 20:06:03', 0),
(100236, 100249, 10, '2006-08-13 19:02:19', 1),
(100256, 100260, 10, '2006-08-13 19:02:19', 1),
(100257, 100261, 10, '2006-08-11 20:06:03', 0),
(100258, 100262, 10, '2006-08-13 19:02:19', 1),
(100259, 100263, 10, '2006-08-11 20:06:03', 0),
(100255, 100264, 10, '2006-08-13 19:02:19', 1),
(100234, 100265, 10, '2006-08-11 15:27:39', 1),
(100415, 100500, 10, '2006-08-13 19:02:35', 1),
(100513, 100501, 10, '2006-08-13 12:48:36', 0),
(100511, 100502, 10, '2006-08-13 12:51:38', 0),
(100487, 100503, 10, '2006-08-13 12:51:38', 0),
(100402, 100504, 10, '2006-08-13 12:51:38', 0),
(100454, 100505, 10, '2006-08-13 12:51:38', 0),
(100456, 100506, 10, '2006-08-13 12:51:38', 0),
(100416, 100507, 10, '2006-08-13 12:51:38', 0),
(100417, 100508, 10, '2006-08-13 19:02:35', 1),
(100418, 100509, 10, '2006-08-13 12:51:38', 0),
(100397, 100510, 10, '2006-08-13 12:48:36', 0),
(100419, 100511, 10, '2006-08-13 12:51:38', 0),
(100421, 100512, 10, '2006-08-13 12:51:38', 0),
(100420, 100513, 10, '2006-08-13 12:48:36', 0),
(100467, 100514, 10, '2006-08-13 12:51:38', 0),
(100468, 100515, 10, '2006-08-13 12:51:38', 0),
(100494, 100516, 10, '2006-08-13 12:51:38', 0),
(100414, 100517, 10, '2006-08-13 19:02:35', 1),
(100403, 100518, 10, '2006-08-13 19:02:35', 1),
(100407, 100519, 10, '2006-08-13 19:02:35', 1),
(100404, 100526, 10, '2006-08-13 19:02:35', 1),
(100405, 100527, 10, '2006-08-13 12:51:32', 0),
(100406, 100528, 10, '2006-08-13 19:02:35', 1),
(100437, 100529, 10, '2006-08-13 19:02:57', 1),
(100538, 100543, 10, '2006-08-13 12:58:29', 0),
(100539, 100544, 10, '2006-08-13 12:58:29', 0),
(100287, 100794, 10, '2006-08-13 19:02:06', 1),
(100355, 100796, 10, '2006-08-13 19:02:06', 1),
(100408, 100810, 10, '2006-08-13 19:02:35', 1),
(100438, 100817, 10, '2006-08-13 19:02:57', 1),
(100588, 100819, 10, '2006-08-13 19:02:57', 1),
(100664, 100825, 10, '2006-08-13 19:03:10', 1),
(100316, 100838, 10, '2006-08-13 19:03:52', 1),
(101326, 101331, 10, '2007-02-25 13:26:22', 0),
(101327, 101332, 10, '2007-02-25 13:26:22', 0),
(101335, 101340, 10, '2007-02-25 13:28:26', 0),
(101336, 101341, 10, '2007-02-25 13:28:26', 0),
(101355, 101360, 10, '2007-02-25 13:31:30', 0),
(101356, 101361, 10, '2007-02-25 13:31:30', 0),
(101411, 101416, 10, '2007-02-25 15:09:14', 0),
(101412, 101417, 10, '2007-02-25 15:09:14', 0),
(101420, 101425, 10, '2007-02-25 15:23:50', 0),
(101421, 101426, 10, '2007-02-25 15:23:50', 0),
(101621, 101626, 10, '2007-03-03 13:17:53', 0),
(101622, 101627, 10, '2007-03-03 13:17:53', 0),
(101683, 101844, 10, '2007-03-28 15:19:43', 1),
(101827, 101846, 10, '2007-03-28 15:19:43', 1),
(101881, 101886, 10, '2007-03-28 15:56:24', 0),
(101882, 101887, 10, '2007-03-28 15:56:24', 0),
(101890, 101895, 10, '2007-03-28 15:56:28', 0),
(101891, 101896, 10, '2007-03-28 15:56:28', 0),
(101905, 101910, 10, '2007-03-28 15:56:22', 0),
(101906, 101911, 10, '2007-03-28 15:56:22', 0),
(101899, 101914, 10, '2007-03-28 15:56:26', 0),
(101900, 101915, 10, '2007-03-28 15:56:26', 0),
(101919, 101924, 10, '2007-03-28 15:57:05', 0),
(101920, 101925, 10, '2007-03-28 15:57:05', 0),
(101928, 101933, 10, '2007-03-28 15:57:32', 0),
(101929, 101934, 10, '2007-03-28 15:57:32', 0),
(101937, 101942, 10, '2007-03-28 15:57:59', 0),
(101938, 101943, 10, '2007-03-28 15:57:59', 0),
(101952, 101957, 10, '2007-03-28 16:04:41', 0),
(101953, 101958, 10, '2007-03-28 16:04:41', 0),
(101967, 101972, 10, '2007-03-28 16:07:03', 0),
(101968, 101973, 10, '2007-03-28 16:07:03', 0);

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

INSERT INTO `syndication` (`IN_ID`, `OUT_ID`, `PROVIDER`) VALUES 
(100366, 100551, 'WWW.ZOO-MUNICH.COM'),
(101222, 100554, 'WWW.ZOO-MUNICH.COM'),
(101237, 100572, 'WWW.ZOO-MUNICH.COM');

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

INSERT INTO `sys_functions` (`FUNCTION_ID`, `PARENT_ID`, `NAME`, `DESCRIPTION`) VALUES 
('EXPLORE_SITE_M', '0', 'Content Menu', 'Content Menu'),
('EXPLORE_SITE_S', 'EXPLORE_SITE_M', 'Website', 'Content - Website'),
('EDIT_CONTENT', 'EXPLORE_SITE_S', 'Edit Content', 'Content - Edit Content'),
('B_EDIT_ALL', 'EDIT_CONTENT', 'Button Edit All', 'Content - Edit Content - Edit All'),
('B_USAGE', 'EDIT_CONTENT', 'Button Usage', 'Content - Usage'),
('B_LIVE_AUTHORING', 'EDIT_CONTENT', 'Live Authoring', 'Content - Live Authoring'),
('B_PREVIEW_PAGE', 'EDIT_CONTENT', 'Preview Page', 'Content - Preview Page'),
('B_EXPIRE_LAUNCH', 'EDIT_CONTENT', 'Button Expire/Launch Page', 'Content - Website - Expire/Launch Page'),
('B_LAUNCH_TREE', 'EDIT_CONTENT', 'Launch Tree', 'Content - Website - Launch Tree'),
('B_RELAUNCH_TREE', 'EDIT_CONTENT', 'Refresh Tree', 'Content - Website - Refresh Tree'),
('B_EXPIRE_TREE', 'EDIT_CONTENT', 'Expire Tree', 'Content - Website - Expire Tree'),
('B_DESTROY_TREE', 'EDIT_CONTENT', 'Destroy Tree', 'Content - Website - Destroy Tree'),
('EDIT_META_DATA', 'EDIT_CONTENT', 'Edit Meta Data', 'Content - Edit Meta Data'),
('SITEPAGE_PROPS', 'EXPLORE_SITE_S', 'Sitepage Properties', 'Content - Website  - Sitepage Properties'),
('B_RESET_CL_INST', 'SITEPAGE_PROPS', 'Reset Cluster Instance', 'Content - Website  - Sitepage Properties - Reset Cluster Instance'),
('C_ACTIVE', 'SITEPAGE_PROPS', 'Checkbox Active', 'Content - Website - Sitepage Properties - Active'),
('C_CACHE', 'SITEPAGE_PROPS', 'Checkbox Cache', 'Content - Website - Sitepage Properties - Cache'),
('CLEAR_CACHE', 'SITEPAGE_PROPS', 'Clear Cache on Launch', 'Content - Website - Sitepage Properties - Clear Cache on Launch'),
('MENU', 'EXPLORE_SITE_S', 'Menu', 'Allow editing of menu entries.'),
('DIRECT_URL', 'MENU', 'Direct URL', 'Content - Menues - Direct URL'),
('ADD_SITEPAGE', 'EXPLORE_SITE_S', 'Add Sitepage', 'Content - Add Sitepage'),
('DELETE_SITEPAGE', 'EXPLORE_SITE_S', 'Delete Sitepage', 'Content - Delete Sitepage'),
('PORTAL_MANAGER', 'EXPLORE_SITE_M', 'Portal Manager', 'Portal Manager'),
('SITEPAGE_MASTER', 'TEMPLATES_M', 'Page Templates', 'Enable access to page-templates'),
('B_RELAUNCH_INST', 'SITEPAGE_MASTER', 'Button Relaunch Instances', 'Sitepage Master - Relaunch Instances'),
('ADD_SP_MASTER', 'SITEPAGE_MASTER', 'Add Sitepage Master', 'Sitepage Master - Insert New'),
('DELETE_SP_MASTER', 'SITEPAGE_MASTER', 'Delete Sitepage Master', 'Sitepage Master - Delete'),
('ROLLOUT', 'EXPLORE_SITE_M', 'Rollout', 'Rollout'),
('OBJECT_BROWSER', 'EXPLORE_SITE_M', 'Library', 'Allow general access to content library'),
('NEW_FOLDER', 'GENERAL', 'New Folder', 'Allow to create folder'),
('NEW_OBJECT', 'OBJECT_BROWSER', 'Object Browser - New Object', 'Object Browser - New Object'),
('EDIT_OBJECT', 'OBJECT_BROWSER', 'Edit Object', 'Object Browser - Edit Object'),
('OBJECT_PROPS', 'OBJECT_BROWSER', 'Object Properties', 'Object Browser - Object Properties'),
('DELETE_OBJECT', 'OBJECT_BROWSER', 'Delete Object', 'Object Browser - Delete Object'),
('DELETE_FOLDER', 'GENERAL', 'Delete Folder', 'Allow delete folder'),
('CL_BROWSER', 'EXPLORE_SITE_M', 'Clusters', 'Allow general access to cluster browser.'),
('NEW_CL_TEMP', 'CL_TEMP_BROWSER', 'New CL-Template', 'Cluster Template Browser - New CL-Template'),
('NEW_INSTANCE', 'CL_BROWSER', 'Cluster Browser - New Instance', 'Cluster Browser - New Instance'),
('ED_FOLDER_PROPS', 'GENERAL', 'Edit Folder Properties', 'Allow edit folder ?roperties'),
('EDIT_CL_CONTENT', 'CL_BROWSER', 'Edit Cluster Content', 'Cluster Browser - Edit Cluster Content'),
('B_CL_EDIT_ALL', 'EDIT_CL_CONTENT', 'Button Cluster Edit All', 'Cluster Browser - Edit Content - Edit All'),
('B_CL_USAGE', 'EDIT_CL_CONTENT', 'Button Cluster Usage', 'Cluster Browser - Edit Content - Usage'),
('ED_CL_META_DATA', 'CL_EDIT_CONTENT', 'Edit Cluster Meta Data', 'Cluster Browser - Edit Meta Data'),
('CL_PROPS', 'CL_BROWSER', 'Cluster Properties', 'Cluster Browser - Cluster Properties'),
('DELETE_CL', 'CL_BROWSER', 'Delete Cluster', 'Cluster Browser - Delete Cluster'),
('CL_TEMP_BROWSER', 'TEMPLATES_M', 'Cluster Templates', 'Enable access to cluster-templates'),
('EDIT_CL_TEMP', 'CL_TEMP_BROWSER', 'Edit Cluster Template', 'Cluster Template Browser - Edit Cluster Template'),
('ED_CL_TEMP_PROPS', 'CL_TEMP_BROWSER', 'Edit CL-Template Props', 'Cluster Template Browser - Edit Cluster Template Properties'),
('DELETE_CL_TEMP', 'CL_BROWSER', 'Delete Cluster Template', 'Cluster Browser - Delete Cluster Template'),
('META_TEMP', 'TEMPLATES_M', 'Meta Templates', 'Enable access to meta-templates'),
('PLUGINS_M', '0', 'Plugins', 'Plugins'),
('PLUGIN_CONTROL', 'PLUGINS_M', 'Plugin Control', 'Plugin Control'),
('ADMINISTRATION_M', '0', 'Administration', 'Administration'),
('USER_MANAGEMENT', 'ADMINISTRATION_M', 'User Management', 'User Management'),
('VARIATIONS', 'ADMINISTRATION_M', 'Variations', 'Variations'),
('MAINTENANCE', '0', 'Maintenance Menu', 'Enable access to maintenance menu'),
('PURGE_DATABASE', 'MAINTENANCE', 'Purge Database', 'Purge Database'),
('MY_PROFILE', 'ADMINISTRATION_M', 'My Profile', 'My Profile'),
('OBJ_USAGE', 'OBJECT_BROWSER', 'Object Usage', 'Allow displaying usage of this object'),
('TRAFFIC', 'ADMINISTRATION_M', 'Page Traffic', 'Traffic Analysis of this Website'),
('CL_USAGE', 'CL_BROWSER', 'Cluster Usage', 'Displays usage of this cluster in pages.'),
('TESTS', 'MAINTENANCE', 'PHPUnit Tests', NULL),
('LOGS', 'MAINTENANCE', 'Log Analysis', NULL),
('ED_FOLDER_ACL', 'ED_FOLDER_PROPS', 'Set Access', 'Set Access to a folder an all object who reside within.'),
('BACKUP', 'ADMINISTRATION_M', 'Backup', 'Backup Database and Filesystem'),
('SearchEngineAdm', 'MAINTENANCE', 'Search Engine Admin', 'Can run spider and admin the search engine.'),
('LOCK_MENU', 'SITEPAGE_PROPS', 'Lock Menu', 'Allow user to lock the menu and disallow creating further page under one node.'),
('CALENDAR_CREATE', 'CALENDAR', 'Administration', 'Create Calendars and Categories'),
('CALENDAR_EDIT', 'CALENDAR', 'Edit', 'Edit the calendar'),
('CALENDAR', 'PLUGINS_M', 'Calendar', 'Calendar Plugin'),
('CHANNELS', 'EXPLORE_SITE_M', 'Channels', 'Allow general access to channels'),
('CHANNEL_ADMIN', 'CHANNELS', 'Channel Administration', 'Create, Modify and Delete Channels'),
('CHANNEL_EDIT', 'CHANNELS', 'Edit Content', 'Edit the content in a channel'),
('CHANNEL_DELETE', 'CHANNELS', 'Delete Article', 'Delete an article in a channel.'),
('CHANNEL_LAUNCH', 'CHANNELS', 'Launch Article', 'Launch an article in a channel.'),
('ALLOW_CMS_LOGIN', 'GENERAL', 'Allow Backend Login', 'Must be set, if user shall be able to login to the backend.'),
('COMMUNITY_LOGIN', 'GENERAL', 'Community Login', 'Use for building community portals.'),
('SYNC_CLUSTERS', 'MAINTENANCE', 'Synchronize All Clusters', NULL),
('SYNDICATION', 'EXPLORE_SITE_M', 'Syndication', 'Allow import and export of data'),
('IMPORT', 'SYNDICATION', 'Import Data', 'Import Clusters, Templates and so on.'),
('EXPORT', 'SYNDICATION', 'Export Data', 'Export clusters, templates and so on.'),
('TEMPLATES_M', '0', 'Templates Menu', 'Enable the general Templates Menu'),
('COMPOUND_GROUPS', 'TEMPLATES_M', 'Compound Groups', 'Edit, create and delete compound groups'),
('GENERAL', '0', 'General functions', 'General functions of N/X'),
('SET_PAGE_ACCESS', 'EXPLORE_SITE_S', 'Set Access', 'Set Permissions for a page'),
('EDIT_EXCLUSIVE', 'EDIT_CL_CONTENT', 'Edit Developer Content', 'Allow user to edit Developer Content'),
('ESERVICES', '0', 'Menu E-Services', 'Allow the user to display the menu E-Services'),
('ADDRESS', 'ESERVICES', 'Address Editor', 'Allow displaying, editing and deleting Contacts'),
('SHOP', 'ESERVICES', 'Shop Access', 'Allow access to general shop backoffice'),
('SHOPADM', 'SHOP', 'Shop-Administrator', 'Technical Shop Administration'),
('SHOPPRODADM', 'SHOP', 'Product-Administrator', 'Edit categories, products.....'),
('ORDERPROC', 'SHOP', 'Order Processor', 'Account for processing orders'),
('NEWSLETTER', 'ESERVICES', 'Newsletter Access', 'Allow access to general newsletter backoffice'),
('NEWSLETTERADM', 'NEWSLETTER', 'Newsletter-Administrator', 'Technical Newsletter Administration'),
('NEWSLETTEREDITOR', 'NEWSLETTER', 'Newsletter-Editor', 'Edit and create newsletter'),
('NEWSLETTERSENDER', 'NEWSLETTER', 'Newsletter-Sender', 'Send Newsletters'),
('CUSTOMERCARE', 'ESERVICES', 'Customer Care Access', 'Allow reading and replying to messages.'),
('CUSTOMERCAREADMI', 'ESERVICES', 'Customer Care Admin', 'Allow technical adminstration of customer care.'),
('BULKIMAGE', 'PLUGINS_M', 'Bulk Image', 'Bulkimage Plugin');

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

INSERT INTO `temp_vars` (`NAME`, `USER_ID`, `VALUE`) VALUES 
('pnode', '1', '101878'),
('channels.phpfilter_rule', '1', ''),
('channels.phpfilter_page', '1', '1'),
('categories.phpfilter_rule', '1', ''),
('categories.phpfilter_page', '1', '1'),
('user_general.phpfilter_rule', '1', ''),
('user_general.phpfilter_page', '1', '1'),
('overview.phpfilter_rule', '1', ''),
('overview.phpfilter_page', '1', '1'),
('clt', '1', '100167'),
('install.phpfilter_rule', '1', ''),
('install.phpfilter_page', '1', '1'),
('menu', '1', '1x1'),
('sitepage_master.phpfilter_page', '1', '1'),
('edit_template.phpfilter_rule', '1', ''),
('edit_template.phpfilter_page', '1', '1'),
('mid', '1', '101682'),
('sitepagebrowser.phpview', '1', '1'),
('panelmenu', '1', '1x-1'),
('variations.phpfilter_rule', '1', ''),
('variations.phpfilter_page', '1', '1'),
('compound_groups.phpfilter_rule', '1', ''),
('compound_groups.phpfilter_page', '1', '1'),
('category.phpfilter_rule', '1', ''),
('category.phpfilter_page', '1', '1'),
('texts.phpfilter_rule', '1', ''),
('texts.phpfilter_page', '1', '1'),
('sdateview', '1', 'predefined'),
('sitf', '1', 'today'),
('sstartdate', '1', '2003-01-01'),
('senddate', '1', '2010-01-01'),
('chsel', '1', '100154'),
('quickpanel', '1', ''),
('edit.phpview', '1', '1'),
('clusterbrowser.phpview', '1', '1'),
('metascheme.phpfilter_rule', '1', ''),
('metascheme.phpfilter_page', '1', '1'),
('meta.phpfilter_rule', '1', ''),
('meta.phpfilter_page', '1', '1'),
('snode', '1', '100893'),
('tax.phpfilter_rule', '1', ''),
('tax.phpfilter_page', '1', '1'),
('linkset', '1', ''),
('sitepage_master.phpfilter_rule', '1', ''),
('lastaction', '1', '0');

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=4 ;

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

INSERT INTO `user_permissions` (`GROUP_ID`, `ROLE_ID`, `USER_ID`) VALUES 
(1, 1, '1');

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

INSERT INTO `user_session` (`USER_ID`, `LAST_LOGIN`, `SESSION_ID`, `REMOTE_ADDRESS`) VALUES 
('1', '2007-03-28 14:56:52', '9b1bb3a0ea36389821735919d56fd873', '127.0.0.1');

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

INSERT INTO `users` (`USER_ID`, `USER_NAME`, `FULL_NAME`, `PASSWORD`, `EMAIL`, `ACTIVE`, `REGISTRATION_DATE`, `BACKEND_LANGUAGE`, `LANGID`, `USE_JAVASCRIPT`, `USE_AGENT`) VALUES 
(1, 'Administrator', 'Administrator', '7b7bc2512ee1fedcd76bdc68926d4f7b', 'pleaseEnterM@il', 1, '2006-08-11 11:49:09', 1, 'EN', 0, '0');

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

INSERT INTO `variations` (`VARIATION_ID`, `NAME`, `SHORTTEXT`, `DESCRIPTION`, `DELETED`) VALUES 
(1, 'English', 'en', 'English language version of website', 0);
