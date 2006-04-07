# phpMyAdmin SQL Dump
# version 2.5.4
# http://www.phpmyadmin.net
#
# Host: localhost
# Erstellungszeit: 23. Dezember 2004 um 23:33
# Server Version: 4.1.0
# PHP-Version: 4.3.4
# 
# Datenbank: `nx4`
# 

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `acl_management`
#

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
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `acl_management`
#

INSERT INTO `acl_management` VALUES (1, 1, 0, 0, 0, 0, 1, NULL, NULL);
INSERT INTO `acl_management` VALUES (100065, 0, 0, 0, 0, 0, 1, NULL, NULL);
INSERT INTO `acl_management` VALUES (100383, 1, 0, 0, 0, 1, 1, NULL, NULL);
INSERT INTO `acl_management` VALUES (100156, 1, 0, 0, 0, 1, 1, NULL, NULL);
INSERT INTO `acl_management` VALUES (100128, 1, 0, 0, 0, 1, 1, NULL, NULL);
INSERT INTO `acl_management` VALUES (100716, 1, 0, 0, 0, 1, 1, NULL, NULL);
INSERT INTO `acl_management` VALUES (101244, 1, 0, 0, 0, 1, 1, NULL, NULL);
INSERT INTO `acl_management` VALUES (101220, 1, 0, 0, 0, 1, 1, NULL, NULL);
INSERT INTO `acl_management` VALUES (101250, 0, 0, 0, 0, 1, 1, NULL, NULL);
INSERT INTO `acl_management` VALUES (100259, 1, 0, 0, 0, 0, 1, NULL, NULL);
INSERT INTO `acl_management` VALUES (101386, 0, 0, 0, 0, 1, 1, NULL, NULL);
INSERT INTO `acl_management` VALUES (0, 0, 0, 0, 0, 0, 1, NULL, NULL);
INSERT INTO `acl_management` VALUES (101184, 1, 0, 0, 0, 1, 1, NULL, NULL);

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `acl_relations`
#

DROP TABLE IF EXISTS `acl_relations`;
CREATE TABLE `acl_relations` (
  `GUID` bigint(20) NOT NULL default '0',
  `ACCESSOR_GUID` bigint(20) NOT NULL default '0',
  `ROLE_ID` bigint(20) NOT NULL default '0',
  KEY `ACCESSOR_GUID` (`ACCESSOR_GUID`)
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `acl_relations`
#

INSERT INTO `acl_relations` VALUES (1, 101587, 1);
INSERT INTO `acl_relations` VALUES (0, 101587, 1);

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `categories`
#

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `CATEGORY_ID` bigint(20) NOT NULL default '0',
  `CATEGORY_NAME` varchar(32) NOT NULL default '',
  `PARENT_CATEGORY_ID` bigint(20) NOT NULL default '0',
  `DELETED` smallint(1) default '0',
  PRIMARY KEY  (`CATEGORY_ID`),
  UNIQUE KEY `CATEGORY_ID` (`CATEGORY_ID`)
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `categories`
#

INSERT INTO `categories` VALUES (100000, 'Page-Cluster', 0, 0);
INSERT INTO `categories` VALUES (100065, 'Structures', 0, 0);
INSERT INTO `categories` VALUES (100171, 'Pictures', 0, 0);
INSERT INTO `categories` VALUES (101209, 'Illustrations', 100171, 0);
INSERT INTO `categories` VALUES (101250, 'Sites', 100171, 0);
INSERT INTO `categories` VALUES (101386, 'Screenshots', 100171, 0);
INSERT INTO `categories` VALUES (101749, 'Icons', 100171, 0);

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `centerstage`
#

DROP TABLE IF EXISTS `centerstage`;
CREATE TABLE `centerstage` (
  `STAGE_ID` bigint(20) NOT NULL default '0',
  `CHID` bigint(20) default NULL,
  `CH_CAT_ID` bigint(20) default NULL,
  `SORT_ALGORITHM` tinyint(4) NOT NULL default '1',
  `MAXCARD` bigint(20) NOT NULL default '3',
  `CLNID` bigint(20) default NULL,
  PRIMARY KEY  (`STAGE_ID`)
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `centerstage`
#

INSERT INTO `centerstage` VALUES (100388, 100324, NULL, 1, 20, NULL);
INSERT INTO `centerstage` VALUES (100394, 100324, NULL, 2, 100, NULL);
INSERT INTO `centerstage` VALUES (100397, 100324, NULL, 1, 2, NULL);
INSERT INTO `centerstage` VALUES (0, NULL, NULL, 1, 3, NULL);
INSERT INTO `centerstage` VALUES (100522, 100324, NULL, 1, 5, NULL);
INSERT INTO `centerstage` VALUES (100472, 100324, NULL, 1, 2, NULL);
INSERT INTO `centerstage` VALUES (100497, 100324, NULL, 1, 20, NULL);
INSERT INTO `centerstage` VALUES (100502, 100324, NULL, 2, 100, NULL);
INSERT INTO `centerstage` VALUES (100657, 100324, NULL, 1, 5, NULL);
INSERT INTO `centerstage` VALUES (101351, 101343, 101344, 4, 999, NULL);
INSERT INTO `centerstage` VALUES (102092, 101343, 101344, 4, 999, NULL);

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `channel_articles`
#

DROP TABLE IF EXISTS `channel_articles`;
CREATE TABLE `channel_articles` (
  `ARTICLE_ID` bigint(20) NOT NULL default '0',
  `CHID` bigint(20) NOT NULL default '0',
  `CH_CAT_ID` bigint(20) NOT NULL default '0',
  `CLT_ID` bigint(20) NOT NULL default '0',
  `TITLE` varchar(64) NOT NULL default '',
  `ARTICLE_DATE` datetime NOT NULL default '0000-00-00 00:00:00',
  `LAUNCH_DATE` datetime default NULL,
  `EXPIRE_DATE` datetime default NULL,
  `VERSION` bigint(20) NOT NULL default '0',
  PRIMARY KEY  (`ARTICLE_ID`)
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `channel_articles`
#

INSERT INTO `channel_articles` VALUES (101865, 100324, 100327, 100320, 'Website launch', '2004-12-08 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `channel_articles` VALUES (101352, 101343, 101344, 101340, '01 New Look', '2004-11-26 22:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `channel_articles` VALUES (101357, 101343, 101344, 101340, '02 Edit panel', '2004-11-26 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `channel_articles` VALUES (101366, 101343, 101344, 101340, '03 Richtexteditor', '2004-11-28 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `channel_articles` VALUES (101470, 101343, 101344, 101340, '04 Translation 1', '2004-11-29 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `channel_articles` VALUES (101474, 101343, 101344, 101340, '05 Translation 2', '2004-11-29 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `channel_articles` VALUES (101480, 101343, 101344, 101340, '07 Content Library', '2004-11-29 09:45:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `channel_articles` VALUES (101484, 101343, 101344, 101340, '08 ACLs', '2004-11-29 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `channel_articles` VALUES (101488, 101343, 101344, 101340, '09 ACL 2', '2004-11-29 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `channel_articles` VALUES (101492, 101343, 101344, 101340, '10 Menu', '2004-11-29 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `channel_articles` VALUES (101496, 101343, 101344, 101340, '11 Properties', '2004-11-29 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `channel_articles` VALUES (101506, 101343, 101344, 101340, '12 Articles', '2004-11-29 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `channel_articles` VALUES (101510, 101343, 101344, 101340, '13 Edit article', '2004-11-29 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `channel_articles` VALUES (101514, 101343, 101344, 101340, '14 Cluster overview', '2004-11-29 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `channel_articles` VALUES (101518, 101343, 101344, 101340, '15 Rollout', '2004-11-29 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `channel_articles` VALUES (101522, 101343, 101344, 101340, '16 Rollout Editing', '2004-11-29 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `channel_articles` VALUES (101526, 101343, 101344, 101340, '17 Export Wizard', '2004-11-29 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `channel_articles` VALUES (101530, 101343, 101344, 101340, '18 Export Wizard 2', '2004-11-29 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `channel_articles` VALUES (101534, 101343, 101344, 101340, '19 Export Wizard', '2004-11-29 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `channel_articles` VALUES (101538, 101343, 101344, 101340, '20', '2004-11-29 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `channel_articles` VALUES (101542, 101343, 101344, 101340, '21 Import', '2004-11-29 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `channel_articles` VALUES (101626, 101343, 101344, 101340, '22 Templates 1', '2004-12-06 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `channel_articles` VALUES (101630, 101343, 101344, 101340, '23 Template editor', '2004-12-06 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `channel_articles` VALUES (101634, 101343, 101344, 101340, '24 Cluster templates', '2004-12-06 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `channel_articles` VALUES (101638, 101343, 101344, 101340, '25 Compound Cluster templates', '2004-12-06 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `channel_articles` VALUES (101642, 101343, 101344, 101340, '26 Compound group', '2004-12-06 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `channel_articles` VALUES (101646, 101343, 101344, 101340, '27 Compound CL Group 2', '2004-12-06 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `channel_articles` VALUES (101650, 101343, 101344, 101340, '28 Search engine', '2004-12-06 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `channel_articles` VALUES (101654, 101343, 101344, 101340, '29', '2004-12-06 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `channel_articles` VALUES (101658, 101343, 101344, 101340, '30', '2004-12-06 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `channel_articles` VALUES (101662, 101343, 101344, 101340, '31', '2004-12-06 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `channel_articles` VALUES (101666, 101343, 101344, 101340, '32', '2004-12-06 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `channel_articles` VALUES (101670, 101343, 101344, 101340, '33', '2004-12-06 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `channel_articles` VALUES (101674, 101343, 101344, 101340, '34 roles', '2004-12-06 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `channel_articles` VALUES (101678, 101343, 101344, 101340, '35 Stats 1', '2004-12-06 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `channel_articles` VALUES (101682, 101343, 101344, 101340, '36', '2004-12-06 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `channel_articles` VALUES (101686, 101343, 101344, 101340, '37 visitors', '2004-12-06 14:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `channel_articles` VALUES (101690, 101343, 101344, 101340, '38 stats', '2004-12-06 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `channel_articles` VALUES (101694, 101343, 101344, 101340, '39 clickpaths', '2004-12-06 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `channel_articles` VALUES (101698, 101343, 101344, 101340, '40 integrated help', '2004-12-06 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `channel_articles` VALUES (102824, 100324, 100325, 100349, 'N/X 4.0 relase X-Mas Gift!', '2004-12-21 01:00:00', NULL, NULL, 10);
INSERT INTO `channel_articles` VALUES (102818, 100324, 100325, 100320, 'N/X 4.0 relase X-Mas Gift!', '2004-12-21 01:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `channel_articles` VALUES (102812, 100324, 100326, 100349, 'Yes, we are save!', '2004-12-21 00:00:00', NULL, NULL, 10);
INSERT INTO `channel_articles` VALUES (102806, 100324, 100326, 100320, 'Yes, we are save!', '2004-12-21 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `channel_articles` VALUES (102792, 100324, 100325, 100349, 'PHP Security', '2004-12-16 00:00:00', NULL, NULL, 10);
INSERT INTO `channel_articles` VALUES (102479, 101343, 101344, 102289, '40 integrated help', '2004-12-06 00:00:00', NULL, NULL, 10);
INSERT INTO `channel_articles` VALUES (102786, 100324, 100325, 100320, 'PHP Security', '2004-12-16 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `channel_articles` VALUES (102469, 101343, 101344, 102289, '38 stats', '2004-12-06 00:00:00', NULL, NULL, 10);
INSERT INTO `channel_articles` VALUES (102464, 101343, 101344, 102289, '37 visitors', '2004-12-06 14:00:00', NULL, NULL, 10);
INSERT INTO `channel_articles` VALUES (102459, 101343, 101344, 102289, '36', '2004-12-06 00:00:00', NULL, NULL, 10);
INSERT INTO `channel_articles` VALUES (102454, 101343, 101344, 102289, '35 Stats 1', '2004-12-06 00:00:00', NULL, NULL, 10);
INSERT INTO `channel_articles` VALUES (102449, 101343, 101344, 102289, '34 roles', '2004-12-06 00:00:00', NULL, NULL, 10);
INSERT INTO `channel_articles` VALUES (102444, 101343, 101344, 102289, '33', '2004-12-06 00:00:00', NULL, NULL, 10);
INSERT INTO `channel_articles` VALUES (102439, 101343, 101344, 102289, '32', '2004-12-06 00:00:00', NULL, NULL, 10);
INSERT INTO `channel_articles` VALUES (102434, 101343, 101344, 102289, '31', '2004-12-06 00:00:00', NULL, NULL, 10);
INSERT INTO `channel_articles` VALUES (102429, 101343, 101344, 102289, '30', '2004-12-06 00:00:00', NULL, NULL, 10);
INSERT INTO `channel_articles` VALUES (102424, 101343, 101344, 102289, '29', '2004-12-06 00:00:00', NULL, NULL, 10);
INSERT INTO `channel_articles` VALUES (102419, 101343, 101344, 102289, '28 Search engine', '2004-12-06 00:00:00', NULL, NULL, 10);
INSERT INTO `channel_articles` VALUES (102474, 101343, 101344, 102289, '39 clickpaths', '2004-12-06 00:00:00', NULL, NULL, 10);
INSERT INTO `channel_articles` VALUES (102414, 101343, 101344, 102289, '27 Compound CL Group 2', '2004-12-06 00:00:00', NULL, NULL, 10);
INSERT INTO `channel_articles` VALUES (102409, 101343, 101344, 102289, '26 Compound group', '2004-12-06 00:00:00', NULL, NULL, 10);
INSERT INTO `channel_articles` VALUES (102399, 101343, 101344, 102289, '24 Cluster templates', '2004-12-06 00:00:00', NULL, NULL, 10);
INSERT INTO `channel_articles` VALUES (102404, 101343, 101344, 102289, '25 Compound Cluster templates', '2004-12-06 00:00:00', NULL, NULL, 10);
INSERT INTO `channel_articles` VALUES (102389, 101343, 101344, 102289, '22 Templates 1', '2004-12-06 00:00:00', NULL, NULL, 10);
INSERT INTO `channel_articles` VALUES (102384, 101343, 101344, 102289, '21 Import', '2004-11-29 00:00:00', NULL, NULL, 10);
INSERT INTO `channel_articles` VALUES (102381, 101343, 101344, 102289, '20', '2004-11-29 00:00:00', NULL, NULL, 10);
INSERT INTO `channel_articles` VALUES (102376, 101343, 101344, 102289, '19 Export Wizard', '2004-11-29 00:00:00', NULL, NULL, 10);
INSERT INTO `channel_articles` VALUES (102394, 101343, 101344, 102289, '23 Template editor', '2004-12-06 00:00:00', NULL, NULL, 10);
INSERT INTO `channel_articles` VALUES (102371, 101343, 101344, 102289, '18 Export Wizard 2', '2004-11-29 00:00:00', NULL, NULL, 10);
INSERT INTO `channel_articles` VALUES (102366, 101343, 101344, 102289, '17 Export Wizard', '2004-11-29 00:00:00', NULL, NULL, 10);
INSERT INTO `channel_articles` VALUES (102356, 101343, 101344, 102289, '15 Rollout', '2004-11-29 00:00:00', NULL, NULL, 10);
INSERT INTO `channel_articles` VALUES (102351, 101343, 101344, 102289, '14 Cluster overview', '2004-11-29 00:00:00', NULL, NULL, 10);
INSERT INTO `channel_articles` VALUES (102361, 101343, 101344, 102289, '16 Rollout Editing', '2004-11-29 00:00:00', NULL, NULL, 10);
INSERT INTO `channel_articles` VALUES (102341, 101343, 101344, 102289, '12 Articles', '2004-11-29 00:00:00', NULL, NULL, 10);
INSERT INTO `channel_articles` VALUES (102336, 101343, 101344, 102289, '11 Properties', '2004-11-29 00:00:00', NULL, NULL, 10);
INSERT INTO `channel_articles` VALUES (102331, 101343, 101344, 102289, '10 Menu', '2004-11-29 00:00:00', NULL, NULL, 10);
INSERT INTO `channel_articles` VALUES (102326, 101343, 101344, 102289, '09 ACL 2', '2004-11-29 00:00:00', NULL, NULL, 10);
INSERT INTO `channel_articles` VALUES (102321, 101343, 101344, 102289, '08 ACLs', '2004-11-29 00:00:00', NULL, NULL, 10);
INSERT INTO `channel_articles` VALUES (102346, 101343, 101344, 102289, '13 Edit article', '2004-11-29 00:00:00', NULL, NULL, 10);
INSERT INTO `channel_articles` VALUES (102316, 101343, 101344, 102289, '07 Content Library', '2004-11-29 09:45:00', NULL, NULL, 10);
INSERT INTO `channel_articles` VALUES (102306, 101343, 101344, 102289, '04 Translation 1', '2004-11-29 00:00:00', NULL, NULL, 10);
INSERT INTO `channel_articles` VALUES (102301, 101343, 101344, 102289, '03 Richtexteditor', '2004-11-28 00:00:00', NULL, NULL, 10);
INSERT INTO `channel_articles` VALUES (102296, 101343, 101344, 102289, '02 Edit panel', '2004-11-26 00:00:00', NULL, NULL, 10);
INSERT INTO `channel_articles` VALUES (102288, 101343, 101344, 102289, '01 New Look', '2004-11-26 22:00:00', NULL, NULL, 10);
INSERT INTO `channel_articles` VALUES (102279, 100324, 100327, 100349, 'Website launch', '2004-12-08 00:00:00', NULL, NULL, 10);
INSERT INTO `channel_articles` VALUES (102311, 101343, 101344, 102289, '05 Translation 2', '2004-11-29 00:00:00', NULL, NULL, 10);

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `channel_categories`
#

DROP TABLE IF EXISTS `channel_categories`;
CREATE TABLE `channel_categories` (
  `CH_CAT_ID` bigint(20) NOT NULL default '0',
  `CHID` bigint(20) NOT NULL default '0',
  `NAME` varchar(64) NOT NULL default '',
  PRIMARY KEY  (`CH_CAT_ID`)
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `channel_categories`
#

INSERT INTO `channel_categories` VALUES (100325, 100324, 'Developments');
INSERT INTO `channel_categories` VALUES (100326, 100324, 'Reports');
INSERT INTO `channel_categories` VALUES (100327, 100324, 'Releases');
INSERT INTO `channel_categories` VALUES (100328, 100324, 'Misc');
INSERT INTO `channel_categories` VALUES (101344, 101343, 'N/X 2004');

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `channel_cluster_templates`
#

DROP TABLE IF EXISTS `channel_cluster_templates`;
CREATE TABLE `channel_cluster_templates` (
  `CHID` bigint(20) NOT NULL default '0',
  `CLT_ID` bigint(20) NOT NULL default '0',
  `POSITION` bigint(20) NOT NULL default '0'
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `channel_cluster_templates`
#

INSERT INTO `channel_cluster_templates` VALUES (100324, 100320, 1);
INSERT INTO `channel_cluster_templates` VALUES (101343, 101340, 1);

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `channels`
#

DROP TABLE IF EXISTS `channels`;
CREATE TABLE `channels` (
  `CHID` bigint(20) NOT NULL default '0',
  `NAME` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`CHID`)
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `channels`
#

INSERT INTO `channels` VALUES (100324, 'News');
INSERT INTO `channels` VALUES (101343, 'Tour');

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `cluster_content`
#

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
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `cluster_content`
#

INSERT INTO `cluster_content` VALUES (101359, 101358, 101341, 1, '', 101390, 0);
INSERT INTO `cluster_content` VALUES (101355, 101353, 101342, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101354, 101353, 101341, 1, '', 101388, 0);
INSERT INTO `cluster_content` VALUES (101351, 101349, 100346, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101350, 101349, 100345, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101339, 101313, 100003, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101338, 101313, 100002, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101337, 101317, 100003, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101336, 101317, 100002, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100051, 100049, 100022, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100050, 100049, 100021, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101335, 101309, 100003, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101334, 101309, 100002, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102327, 101503, 102291, 1, '', 102328, 0);
INSERT INTO `cluster_content` VALUES (102325, 101502, 102290, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100077, 100075, 100067, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100078, 100075, 100067, 2, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100079, 100075, 100068, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100080, 100075, 100068, 2, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100081, 100075, 100069, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100082, 100075, 100069, 2, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100083, 100075, 100070, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100084, 100075, 100070, 2, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100085, 100075, 100071, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100086, 100075, 100072, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100087, 100075, 100073, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101880, 100220, 100182, 2, '', 101881, 0);
INSERT INTO `cluster_content` VALUES (100474, 100076, 100468, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100473, 100076, 100469, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100132, 100131, 100123, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100133, 100131, 100124, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100134, 100131, 100126, 1, '', 100163, 0);
INSERT INTO `cluster_content` VALUES (100139, 100138, 100123, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100140, 100138, 100124, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100141, 100138, 100126, 1, '', 101804, 0);
INSERT INTO `cluster_content` VALUES (100146, 100145, 100123, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100147, 100145, 100124, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100148, 100145, 100126, 1, '', 101835, 0);
INSERT INTO `cluster_content` VALUES (102385, 101710, 102291, 1, '', 102386, 0);
INSERT INTO `cluster_content` VALUES (100160, 100159, 100123, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100161, 100159, 100124, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100162, 100159, 100126, 1, '', 101848, 0);
INSERT INTO `cluster_content` VALUES (100165, 100164, 100111, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100166, 100164, 100112, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100167, 100164, 100113, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100168, 100164, 100114, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101779, 100131, 100126, 2, '', 101782, 0);
INSERT INTO `cluster_content` VALUES (100199, 100170, 100193, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100196, 100170, 100192, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100195, 100170, 100191, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100194, 100170, 100190, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101932, 101926, 100193, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101878, 101872, 100193, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102102, 102096, 100193, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102024, 102018, 100193, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100238, 100237, 100002, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100239, 100237, 100003, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100244, 100243, 100002, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100245, 100243, 100003, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100250, 100249, 100002, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100251, 100249, 100003, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102383, 101708, 102290, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102382, 101708, 102291, 1, '', 102378, 0);
INSERT INTO `cluster_content` VALUES (102380, 101707, 102290, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102377, 101707, 102291, 1, '', 102378, 0);
INSERT INTO `cluster_content` VALUES (102375, 101705, 102290, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100275, 100273, 100022, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100274, 100273, 100021, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102372, 101705, 102291, 1, '', 102373, 0);
INSERT INTO `cluster_content` VALUES (102370, 101703, 102290, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102367, 101703, 102291, 1, '', 102368, 0);
INSERT INTO `cluster_content` VALUES (102365, 101605, 102290, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100306, 100305, 100002, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100307, 100305, 100003, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100318, 100316, 100022, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100317, 100316, 100021, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101875, 101872, 100192, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101869, 101866, 100323, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101868, 101866, 100322, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101329, 101305, 100003, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100808, 100806, 100003, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100807, 100806, 100002, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101867, 101866, 100341, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101328, 101305, 100002, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101327, 101301, 100003, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101326, 101301, 100002, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101297, 101296, 101291, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100472, 100076, 100465, 1, '', 100472, 0);
INSERT INTO `cluster_content` VALUES (100464, 100462, 100456, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100403, 100075, 100399, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100402, 100075, 100398, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100397, 100075, 100396, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100463, 100462, 100455, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100405, 100075, 100401, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100404, 100075, 100400, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100387, 100386, 100345, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100388, 100386, 100346, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100393, 100392, 100345, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100394, 100392, 100346, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100471, 100076, 100466, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100470, 100076, 100467, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100109, 100076, 100098, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100485, 100483, 100479, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100484, 100483, 100480, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100108, 100076, 100097, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100107, 100076, 100096, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100497, 100495, 100492, 1, '', 100497, 0);
INSERT INTO `cluster_content` VALUES (100522, 100521, 100512, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100524, 100521, 100523, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100534, 100530, 100526, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100535, 100530, 100528, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100537, 100532, 100526, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100538, 100532, 100528, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101289, 101287, 100003, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101288, 101287, 100002, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102362, 101605, 102291, 1, '', 102363, 0);
INSERT INTO `cluster_content` VALUES (100577, 100576, 100555, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100578, 100576, 100556, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100579, 100576, 100557, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100580, 100576, 100558, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100581, 100576, 100559, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100582, 100576, 100560, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100583, 100576, 100561, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100584, 100576, 100562, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100585, 100576, 100563, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100586, 100576, 100564, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100587, 100576, 100565, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100588, 100576, 100566, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100589, 100576, 100567, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100590, 100576, 100568, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100591, 100576, 100569, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100592, 100576, 100570, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100595, 100576, 100593, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100596, 100576, 100594, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100599, 100576, 100598, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100106, 100076, 100095, 2, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100646, 100626, 100622, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100645, 100626, 100623, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100644, 100626, 100621, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100643, 100626, 100620, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100642, 100626, 100619, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100641, 100626, 100618, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100640, 100626, 100617, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100639, 100626, 100616, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100638, 100626, 100615, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100637, 100626, 100614, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100636, 100626, 100613, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100635, 100626, 100612, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100634, 100626, 100611, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100633, 100626, 100610, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100632, 100626, 100609, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100631, 100626, 100608, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100630, 100626, 100607, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100629, 100626, 100606, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100627, 100626, 100628, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100658, 100656, 100654, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100720, 100719, 100002, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100721, 100719, 100003, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100744, 100743, 100733, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100745, 100743, 100734, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100746, 100743, 100735, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100747, 100743, 100736, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100748, 100743, 100737, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100750, 100743, 100749, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102360, 101604, 102290, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100757, 100756, 100713, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100758, 100756, 100714, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102357, 101604, 102291, 1, '', 102358, 0);
INSERT INTO `cluster_content` VALUES (102332, 101504, 102291, 1, '', 102333, 0);
INSERT INTO `cluster_content` VALUES (100773, 100771, 100022, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100772, 100771, 100021, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100792, 100786, 100784, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100791, 100786, 100782, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100790, 100786, 100781, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100789, 100786, 100780, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100788, 100786, 100779, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100787, 100786, 100778, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100496, 100495, 100491, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100657, 100656, 100653, 1, '', 100657, 0);
INSERT INTO `cluster_content` VALUES (102330, 101503, 102290, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102335, 101504, 102290, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102337, 101505, 102291, 1, '', 102338, 0);
INSERT INTO `cluster_content` VALUES (102340, 101505, 102290, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102342, 101601, 102291, 1, '', 102343, 0);
INSERT INTO `cluster_content` VALUES (101219, 101216, 101180, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101218, 101216, 101179, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101217, 101216, 101178, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101208, 101206, 100003, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100105, 100076, 100095, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101207, 101206, 100002, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102345, 101601, 102290, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101196, 101194, 100003, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101195, 101194, 100002, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102352, 101603, 102291, 1, '', 102353, 0);
INSERT INTO `cluster_content` VALUES (102350, 101602, 102290, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102347, 101602, 102291, 1, '', 102348, 0);
INSERT INTO `cluster_content` VALUES (102355, 101603, 102290, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101157, 101155, 100003, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101156, 101155, 100002, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101360, 101358, 101342, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101364, 101363, 100002, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101365, 101363, 100003, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101368, 101367, 101341, 1, '', 101392, 0);
INSERT INTO `cluster_content` VALUES (101369, 101367, 101342, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101472, 101471, 101341, 1, '', 101394, 0);
INSERT INTO `cluster_content` VALUES (101473, 101471, 101342, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101476, 101475, 101341, 1, '', 101396, 0);
INSERT INTO `cluster_content` VALUES (101477, 101475, 101342, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101482, 101481, 101341, 1, '', 101400, 0);
INSERT INTO `cluster_content` VALUES (101483, 101481, 101342, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101486, 101485, 101341, 1, '', 101402, 0);
INSERT INTO `cluster_content` VALUES (101487, 101485, 101342, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101490, 101489, 101341, 1, '', 101404, 0);
INSERT INTO `cluster_content` VALUES (101491, 101489, 101342, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101494, 101493, 101341, 1, '', 101406, 0);
INSERT INTO `cluster_content` VALUES (101495, 101493, 101342, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101498, 101497, 101341, 1, '', 101408, 0);
INSERT INTO `cluster_content` VALUES (101499, 101497, 101342, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101508, 101507, 101341, 1, '', 101410, 0);
INSERT INTO `cluster_content` VALUES (101509, 101507, 101342, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101512, 101511, 101341, 1, '', 101412, 0);
INSERT INTO `cluster_content` VALUES (101513, 101511, 101342, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101516, 101515, 101341, 1, '', 101414, 0);
INSERT INTO `cluster_content` VALUES (101517, 101515, 101342, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101520, 101519, 101341, 1, '', 101416, 0);
INSERT INTO `cluster_content` VALUES (101521, 101519, 101342, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101524, 101523, 101341, 1, '', 101418, 0);
INSERT INTO `cluster_content` VALUES (101525, 101523, 101342, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101528, 101527, 101341, 1, '', 101422, 0);
INSERT INTO `cluster_content` VALUES (101529, 101527, 101342, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101532, 101531, 101341, 1, '', 101424, 0);
INSERT INTO `cluster_content` VALUES (101533, 101531, 101342, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101536, 101535, 101341, 1, '', 101426, 0);
INSERT INTO `cluster_content` VALUES (101537, 101535, 101342, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101540, 101539, 101341, 1, '', 101426, 0);
INSERT INTO `cluster_content` VALUES (101541, 101539, 101342, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101544, 101543, 101341, 1, '', 101420, 0);
INSERT INTO `cluster_content` VALUES (101545, 101543, 101342, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101579, 101577, 100021, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101578, 101577, 100022, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101593, 101592, 100713, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101594, 101592, 100714, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101597, 101596, 100713, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101598, 101596, 100714, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101792, 101789, 100113, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101791, 101789, 100112, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101790, 101789, 100111, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101780, 100131, 100126, 3, '', 101788, 0);
INSERT INTO `cluster_content` VALUES (100501, 100500, 100491, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101784, 101783, 100111, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101785, 101783, 100112, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101786, 101783, 100113, 1, '', 101778, 0);
INSERT INTO `cluster_content` VALUES (101787, 101783, 100114, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101628, 101627, 101341, 1, '', 101430, 0);
INSERT INTO `cluster_content` VALUES (101629, 101627, 101342, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101632, 101631, 101341, 1, '', 101432, 0);
INSERT INTO `cluster_content` VALUES (101633, 101631, 101342, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101636, 101635, 101341, 1, '', 101434, 0);
INSERT INTO `cluster_content` VALUES (101637, 101635, 101342, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101640, 101639, 101341, 1, '', 101436, 0);
INSERT INTO `cluster_content` VALUES (101641, 101639, 101342, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101644, 101643, 101341, 1, '', 101438, 0);
INSERT INTO `cluster_content` VALUES (101645, 101643, 101342, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101648, 101647, 101341, 1, '', 101440, 0);
INSERT INTO `cluster_content` VALUES (101649, 101647, 101342, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101652, 101651, 101341, 1, '', 101442, 0);
INSERT INTO `cluster_content` VALUES (101653, 101651, 101342, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101656, 101655, 101341, 1, '', 101446, 0);
INSERT INTO `cluster_content` VALUES (101657, 101655, 101342, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101660, 101659, 101341, 1, '', 101448, 0);
INSERT INTO `cluster_content` VALUES (101661, 101659, 101342, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101664, 101663, 101341, 1, '', 101450, 0);
INSERT INTO `cluster_content` VALUES (101665, 101663, 101342, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101668, 101667, 101341, 1, '', 101452, 0);
INSERT INTO `cluster_content` VALUES (101669, 101667, 101342, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101672, 101671, 101341, 1, '', 101456, 0);
INSERT INTO `cluster_content` VALUES (101673, 101671, 101342, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101676, 101675, 101341, 1, '', 101454, 0);
INSERT INTO `cluster_content` VALUES (101677, 101675, 101342, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101680, 101679, 101341, 1, '', 101458, 0);
INSERT INTO `cluster_content` VALUES (101681, 101679, 101342, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101684, 101683, 101341, 1, '', 101460, 0);
INSERT INTO `cluster_content` VALUES (101685, 101683, 101342, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101688, 101687, 101341, 1, '', 101462, 0);
INSERT INTO `cluster_content` VALUES (101689, 101687, 101342, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101692, 101691, 101341, 1, '', 101464, 0);
INSERT INTO `cluster_content` VALUES (101693, 101691, 101342, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101696, 101695, 101341, 1, '', 101466, 0);
INSERT INTO `cluster_content` VALUES (101697, 101695, 101342, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101700, 101699, 101341, 1, '', 101468, 0);
INSERT INTO `cluster_content` VALUES (101701, 101699, 101342, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101793, 101789, 100114, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101796, 101795, 100111, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101797, 101795, 100112, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101798, 101795, 100113, 1, '', 101776, 0);
INSERT INTO `cluster_content` VALUES (101799, 101795, 100114, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101800, 100138, 100126, 2, '', 101810, 0);
INSERT INTO `cluster_content` VALUES (101801, 100138, 100126, 3, '', 101816, 0);
INSERT INTO `cluster_content` VALUES (101802, 100138, 100126, 4, '', 101822, 0);
INSERT INTO `cluster_content` VALUES (101985, 101984, 101982, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101806, 101805, 100111, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101807, 101805, 100112, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101808, 101805, 100113, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101809, 101805, 100114, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101812, 101811, 100111, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101813, 101811, 100112, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101814, 101811, 100113, 1, '', 101756, 0);
INSERT INTO `cluster_content` VALUES (101815, 101811, 100114, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101818, 101817, 100111, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101819, 101817, 100112, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101820, 101817, 100113, 1, '', 101764, 0);
INSERT INTO `cluster_content` VALUES (101821, 101817, 100114, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101824, 101823, 100111, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101825, 101823, 100112, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101826, 101823, 100113, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101827, 101823, 100114, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101830, 101829, 100111, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101831, 101829, 100112, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101832, 101829, 100113, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101833, 101829, 100114, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101834, 100145, 100126, 2, '', 101841, 0);
INSERT INTO `cluster_content` VALUES (101837, 101836, 100111, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101838, 101836, 100112, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101839, 101836, 100113, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101840, 101836, 100114, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101843, 101842, 100111, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101844, 101842, 100112, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101845, 101842, 100113, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101846, 101842, 100114, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101944, 100214, 100182, 4, '', 101945, 0);
INSERT INTO `cluster_content` VALUES (101850, 101849, 100111, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101851, 101849, 100112, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101852, 101849, 100113, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101853, 101849, 100114, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101856, 101855, 100111, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101857, 101855, 100112, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101858, 101855, 100113, 1, '', 101754, 0);
INSERT INTO `cluster_content` VALUES (101859, 101855, 100114, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101874, 101872, 100191, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101873, 101872, 100190, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101888, 101882, 100193, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101885, 101882, 100192, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101884, 101882, 100191, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100223, 100220, 100182, 1, '', 101871, 0);
INSERT INTO `cluster_content` VALUES (101896, 101892, 100021, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101893, 101892, 100022, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101910, 101907, 101905, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101909, 101907, 101904, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101908, 101907, 101903, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101923, 101917, 100193, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101920, 101917, 100192, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101919, 101917, 100191, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101929, 101926, 100192, 1, '', 101930, 0);
INSERT INTO `cluster_content` VALUES (101928, 101926, 100191, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101927, 101926, 100190, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101939, 101936, 100192, 1, '', 101940, 0);
INSERT INTO `cluster_content` VALUES (101938, 101936, 100191, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101918, 101917, 100190, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101952, 101946, 100193, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101949, 101946, 100192, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101948, 101946, 100191, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101934, 100214, 100182, 3, '', 101935, 0);
INSERT INTO `cluster_content` VALUES (101959, 101956, 100192, 1, '', 101960, 0);
INSERT INTO `cluster_content` VALUES (101958, 101956, 100191, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101957, 101956, 100190, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101942, 101936, 100193, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101977, 101975, 100021, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101976, 101975, 100022, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101990, 101988, 100021, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101989, 101988, 100022, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101996, 101994, 100021, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101995, 101994, 100022, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102001, 101999, 100021, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102000, 101999, 100022, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102322, 101502, 102291, 1, '', 102323, 0);
INSERT INTO `cluster_content` VALUES (102320, 101501, 102290, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102021, 102018, 100192, 1, '', 102022, 0);
INSERT INTO `cluster_content` VALUES (102020, 102018, 100191, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102019, 102018, 100190, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102034, 102028, 100193, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102033, 102028, 100190, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102040, 102037, 100192, 1, '', 102041, 0);
INSERT INTO `cluster_content` VALUES (102043, 102037, 100193, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102026, 100184, 100182, 3, '', 102027, 0);
INSERT INTO `cluster_content` VALUES (102317, 101501, 102291, 1, '', 102318, 0);
INSERT INTO `cluster_content` VALUES (102315, 101479, 102290, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102312, 101479, 102291, 1, '', 102313, 0);
INSERT INTO `cluster_content` VALUES (102310, 101478, 102290, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102307, 101478, 102291, 1, '', 102308, 0);
INSERT INTO `cluster_content` VALUES (102099, 102096, 100192, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102098, 102096, 100191, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102097, 102096, 100190, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102109, 102106, 100192, 1, '', 102110, 0);
INSERT INTO `cluster_content` VALUES (102108, 102106, 100191, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102107, 102106, 100190, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100229, 100226, 100182, 1, '', 102095, 0);
INSERT INTO `cluster_content` VALUES (102305, 101469, 102290, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102302, 101469, 102291, 1, '', 102303, 0);
INSERT INTO `cluster_content` VALUES (102300, 101361, 102290, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102297, 101361, 102291, 1, '', 102298, 0);
INSERT INTO `cluster_content` VALUES (102293, 101356, 102291, 1, '', 102294, 0);
INSERT INTO `cluster_content` VALUES (102292, 101356, 102290, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102795, 102791, 100352, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102794, 102791, 100351, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102793, 102791, 100350, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102815, 102811, 100352, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102814, 102811, 100351, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102813, 102811, 100350, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102827, 102823, 100352, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102826, 102823, 100351, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102188, 102186, 100021, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102187, 102186, 100022, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100222, 100220, 100180, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101883, 101882, 100190, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100221, 100220, 100179, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101924, 100214, 100182, 2, '', 101925, 0);
INSERT INTO `cluster_content` VALUES (101937, 101936, 100190, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100217, 100214, 100182, 1, '', 101916, 0);
INSERT INTO `cluster_content` VALUES (101947, 101946, 100190, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100216, 100214, 100180, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (101962, 101956, 100193, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100215, 100214, 100179, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102032, 102028, 100191, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102016, 100184, 100182, 2, '', 102017, 0);
INSERT INTO `cluster_content` VALUES (102039, 102037, 100191, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102092, 102091, 100492, 1, '', 102092, 0);
INSERT INTO `cluster_content` VALUES (100228, 100226, 100180, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102112, 102106, 100193, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100227, 100226, 100179, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102483, 101745, 102290, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102480, 101745, 102291, 1, '', 102481, 0);
INSERT INTO `cluster_content` VALUES (102478, 101744, 102290, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102475, 101744, 102291, 1, '', 102476, 0);
INSERT INTO `cluster_content` VALUES (102473, 101743, 102290, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102470, 101743, 102291, 1, '', 102471, 0);
INSERT INTO `cluster_content` VALUES (102468, 101742, 102290, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102465, 101742, 102291, 1, '', 102466, 0);
INSERT INTO `cluster_content` VALUES (102463, 101741, 102290, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102460, 101741, 102291, 1, '', 102461, 0);
INSERT INTO `cluster_content` VALUES (102458, 101740, 102290, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102455, 101740, 102291, 1, '', 102456, 0);
INSERT INTO `cluster_content` VALUES (102453, 101739, 102290, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102450, 101739, 102291, 1, '', 102451, 0);
INSERT INTO `cluster_content` VALUES (102448, 101738, 102290, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102445, 101738, 102291, 1, '', 102446, 0);
INSERT INTO `cluster_content` VALUES (102443, 101737, 102290, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102440, 101737, 102291, 1, '', 102441, 0);
INSERT INTO `cluster_content` VALUES (102438, 101736, 102290, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102435, 101736, 102291, 1, '', 102436, 0);
INSERT INTO `cluster_content` VALUES (102433, 101732, 102290, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102430, 101732, 102291, 1, '', 102431, 0);
INSERT INTO `cluster_content` VALUES (102428, 101728, 102290, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102425, 101728, 102291, 1, '', 102426, 0);
INSERT INTO `cluster_content` VALUES (102423, 101724, 102290, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102420, 101724, 102291, 1, '', 102421, 0);
INSERT INTO `cluster_content` VALUES (102418, 101720, 102290, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102415, 101720, 102291, 1, '', 102416, 0);
INSERT INTO `cluster_content` VALUES (102413, 101716, 102290, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102410, 101716, 102291, 1, '', 102411, 0);
INSERT INTO `cluster_content` VALUES (102408, 101715, 102290, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102405, 101715, 102291, 1, '', 102406, 0);
INSERT INTO `cluster_content` VALUES (102403, 101714, 102290, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102400, 101714, 102291, 1, '', 102401, 0);
INSERT INTO `cluster_content` VALUES (102398, 101713, 102290, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102395, 101713, 102291, 1, '', 102396, 0);
INSERT INTO `cluster_content` VALUES (102393, 101712, 102290, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102390, 101712, 102291, 1, '', 102391, 0);
INSERT INTO `cluster_content` VALUES (102388, 101710, 102290, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102844, 102833, 101134, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102843, 102833, 101133, 2, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100099, 100076, 100092, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100100, 100076, 100092, 2, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100101, 100076, 100093, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100102, 100076, 100093, 2, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100103, 100076, 100094, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100104, 100076, 100094, 2, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102029, 102028, 100192, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100187, 100184, 100182, 1, '', 100188, 0);
INSERT INTO `cluster_content` VALUES (102038, 102037, 100190, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100186, 100184, 100180, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102825, 102823, 100350, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102282, 101870, 100350, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102281, 101870, 100351, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102280, 101870, 100352, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102093, 102091, 100491, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100502, 100500, 100492, 1, '', 100502, 0);
INSERT INTO `cluster_content` VALUES (102788, 102787, 100341, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102789, 102787, 100322, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102790, 102787, 100323, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102842, 102833, 101133, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102841, 102833, 101132, 2, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102840, 102833, 101132, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (100185, 100184, 100179, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102808, 102807, 100341, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102809, 102807, 100322, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102810, 102807, 100323, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102839, 102833, 101131, 2, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102838, 102833, 101131, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102837, 102833, 101130, 2, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102820, 102819, 100341, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102821, 102819, 100322, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102822, 102819, 100323, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102836, 102833, 101130, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102835, 102833, 101128, 1, '', 0, 0);
INSERT INTO `cluster_content` VALUES (102834, 102833, 101144, 1, '', 0, 0);

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `cluster_node`
#

DROP TABLE IF EXISTS `cluster_node`;
CREATE TABLE `cluster_node` (
  `CLNID` bigint(20) NOT NULL default '0',
  `CLT_ID` bigint(20) NOT NULL default '0',
  `NAME` varchar(32) NOT NULL default '',
  `DELETED` tinyint(4) NOT NULL default '0',
  `VERSION` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`CLNID`)
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `cluster_node`
#

INSERT INTO `cluster_node` VALUES (101308, 100001, 'Website Development API', 0, 0);
INSERT INTO `cluster_node` VALUES (101304, 100001, 'Getting Started Docs', 0, 0);
INSERT INTO `cluster_node` VALUES (100048, 100019, 'About us', 0, 10);
INSERT INTO `cluster_node` VALUES (101300, 100001, 'Installation Documentation', 0, 0);
INSERT INTO `cluster_node` VALUES (101295, 101290, 'Forum', 0, 0);
INSERT INTO `cluster_node` VALUES (100074, 100066, 'Top Menu', 0, 0);
INSERT INTO `cluster_node` VALUES (100090, 100091, 'Top Menu', 0, 10);
INSERT INTO `cluster_node` VALUES (100130, 100122, 'About', 0, 0);
INSERT INTO `cluster_node` VALUES (100137, 100122, 'Services', 0, 0);
INSERT INTO `cluster_node` VALUES (100144, 100122, 'Downloads', 0, 0);
INSERT INTO `cluster_node` VALUES (100158, 100122, 'References', 0, 0);
INSERT INTO `cluster_node` VALUES (100163, 100110, 'About: About us', 0, 0);
INSERT INTO `cluster_node` VALUES (100183, 100178, 'About', 0, 10);
INSERT INTO `cluster_node` VALUES (100188, 100189, 'About: About us', 0, 10);
INSERT INTO `cluster_node` VALUES (100213, 100178, 'Services', 0, 10);
INSERT INTO `cluster_node` VALUES (100219, 100178, 'Downloads', 0, 10);
INSERT INTO `cluster_node` VALUES (100225, 100178, 'References', 0, 10);
INSERT INTO `cluster_node` VALUES (100236, 100001, 'The N/X Crew', 0, 0);
INSERT INTO `cluster_node` VALUES (100242, 100001, 'For whom is N/X?', 0, 0);
INSERT INTO `cluster_node` VALUES (100248, 100001, 'Crew', 0, 0);
INSERT INTO `cluster_node` VALUES (102414, 102289, '26 Compound CL Group 2', 0, 10);
INSERT INTO `cluster_node` VALUES (102409, 102289, '26', 0, 10);
INSERT INTO `cluster_node` VALUES (100272, 100019, 'For whom is N/X?', 0, 10);
INSERT INTO `cluster_node` VALUES (102404, 102289, '25 Compound Cluster templates', 0, 10);
INSERT INTO `cluster_node` VALUES (100300, 100296, 'Servicepages', 0, 0);
INSERT INTO `cluster_node` VALUES (100304, 100001, 'Disclaimer', 0, 0);
INSERT INTO `cluster_node` VALUES (100311, 100310, 'Servicepages', 0, 10);
INSERT INTO `cluster_node` VALUES (100315, 100019, 'Disclaimer', 0, 10);
INSERT INTO `cluster_node` VALUES (101865, 100320, 'Website launch', 0, 0);
INSERT INTO `cluster_node` VALUES (100805, 100001, 'test', 0, 0);
INSERT INTO `cluster_node` VALUES (101286, 100001, 'List of N/X pages', 0, 0);
INSERT INTO `cluster_node` VALUES (100461, 100454, 'Search', 0, 0);
INSERT INTO `cluster_node` VALUES (100482, 100478, 'Search', 0, 10);
INSERT INTO `cluster_node` VALUES (100385, 100344, 'News', 0, 0);
INSERT INTO `cluster_node` VALUES (100391, 100344, 'News Archive', 0, 0);
INSERT INTO `cluster_node` VALUES (100494, 100490, 'News', 0, 10);
INSERT INTO `cluster_node` VALUES (100516, 100296, 'RSS', 0, 0);
INSERT INTO `cluster_node` VALUES (100520, 100511, 'News', 0, 0);
INSERT INTO `cluster_node` VALUES (100529, 100525, 'Banner 1', 0, 0);
INSERT INTO `cluster_node` VALUES (100531, 100525, 'Banner 2', 0, 0);
INSERT INTO `cluster_node` VALUES (102399, 102289, '24', 0, 10);
INSERT INTO `cluster_node` VALUES (100575, 100554, 'Contact', 0, 0);
INSERT INTO `cluster_node` VALUES (100625, 100605, 'Contact', 0, 10);
INSERT INTO `cluster_node` VALUES (100648, 100310, 'RSS', 0, 10);
INSERT INTO `cluster_node` VALUES (100655, 100652, 'News', 0, 10);
INSERT INTO `cluster_node` VALUES (100718, 100001, 'FAQ', 0, 0);
INSERT INTO `cluster_node` VALUES (100742, 100732, 'Ask a Question', 0, 0);
INSERT INTO `cluster_node` VALUES (102394, 102289, '23 Template editor', 0, 10);
INSERT INTO `cluster_node` VALUES (100755, 100712, 'How can I determine the startpag', 0, 0);
INSERT INTO `cluster_node` VALUES (102389, 102289, '22', 0, 10);
INSERT INTO `cluster_node` VALUES (100770, 100019, 'FAQ', 0, 10);
INSERT INTO `cluster_node` VALUES (100785, 100777, 'Ask a Question', 0, 10);
INSERT INTO `cluster_node` VALUES (102384, 102289, '21 Import', 0, 10);
INSERT INTO `cluster_node` VALUES (102381, 102289, '20', 0, 10);
INSERT INTO `cluster_node` VALUES (101215, 101177, 'Downloads', 0, 0);
INSERT INTO `cluster_node` VALUES (101205, 100001, 'License', 0, 0);
INSERT INTO `cluster_node` VALUES (102376, 102289, '19 Export Wizard', 0, 10);
INSERT INTO `cluster_node` VALUES (101193, 100001, 'Common Errors', 0, 0);
INSERT INTO `cluster_node` VALUES (102371, 102289, '18 Export Wizard 2', 0, 10);
INSERT INTO `cluster_node` VALUES (101154, 100001, 'Requirements', 0, 0);
INSERT INTO `cluster_node` VALUES (102361, 102289, '16 Rollout Editing', 0, 10);
INSERT INTO `cluster_node` VALUES (101312, 100001, 'Development API', 0, 0);
INSERT INTO `cluster_node` VALUES (101316, 100001, 'API', 0, 0);
INSERT INTO `cluster_node` VALUES (102351, 102289, '14', 0, 10);
INSERT INTO `cluster_node` VALUES (102346, 102289, '13', 0, 10);
INSERT INTO `cluster_node` VALUES (101348, 100344, 'N/X 4.0 Tour', 0, 0);
INSERT INTO `cluster_node` VALUES (101352, 101340, '01 Impressive new look', 0, 0);
INSERT INTO `cluster_node` VALUES (101357, 101340, '02 Rhichtext editor', 0, 0);
INSERT INTO `cluster_node` VALUES (101366, 101340, '03 Library', 0, 0);
INSERT INTO `cluster_node` VALUES (101470, 101340, '04', 0, 0);
INSERT INTO `cluster_node` VALUES (101474, 101340, '05 Translation 2', 0, 0);
INSERT INTO `cluster_node` VALUES (101480, 101340, '06', 0, 0);
INSERT INTO `cluster_node` VALUES (101484, 101340, '08', 0, 0);
INSERT INTO `cluster_node` VALUES (101488, 101340, '09 ACL 2', 0, 0);
INSERT INTO `cluster_node` VALUES (101492, 101340, '10', 0, 0);
INSERT INTO `cluster_node` VALUES (101496, 101340, '11 Properties', 0, 0);
INSERT INTO `cluster_node` VALUES (101506, 101340, '12', 0, 0);
INSERT INTO `cluster_node` VALUES (101510, 101340, '13', 0, 0);
INSERT INTO `cluster_node` VALUES (101514, 101340, '14', 0, 0);
INSERT INTO `cluster_node` VALUES (101518, 101340, '15', 0, 0);
INSERT INTO `cluster_node` VALUES (101522, 101340, '16 Rollout Editing', 0, 0);
INSERT INTO `cluster_node` VALUES (101526, 101340, '17 Export Wizard', 0, 0);
INSERT INTO `cluster_node` VALUES (101530, 101340, '18 Export Wizard 2', 0, 0);
INSERT INTO `cluster_node` VALUES (101534, 101340, '19 Export Wizard', 0, 0);
INSERT INTO `cluster_node` VALUES (101538, 101340, '20', 0, 0);
INSERT INTO `cluster_node` VALUES (101542, 101340, '21 Import', 0, 0);
INSERT INTO `cluster_node` VALUES (101576, 100019, 'Requirements', 0, 10);
INSERT INTO `cluster_node` VALUES (101591, 100712, 'I created a new group and assign', 0, 0);
INSERT INTO `cluster_node` VALUES (101595, 100712, 'I launched a sitepage or an arti', 0, 0);
INSERT INTO `cluster_node` VALUES (101804, 100110, 'FAQ (2)', 0, 0);
INSERT INTO `cluster_node` VALUES (101782, 100110, 'Tour', 0, 0);
INSERT INTO `cluster_node` VALUES (101788, 100110, 'Requirements (2)', 0, 0);
INSERT INTO `cluster_node` VALUES (101794, 100110, 'The Team (2)', 0, 0);
INSERT INTO `cluster_node` VALUES (101626, 101340, '22', 0, 0);
INSERT INTO `cluster_node` VALUES (101630, 101340, '23 Template editor', 0, 0);
INSERT INTO `cluster_node` VALUES (101634, 101340, '24', 0, 0);
INSERT INTO `cluster_node` VALUES (101638, 101340, '25 Compound Cluster templates', 0, 0);
INSERT INTO `cluster_node` VALUES (101642, 101340, '26', 0, 0);
INSERT INTO `cluster_node` VALUES (101646, 101340, '26 Compound CL Group 2', 0, 0);
INSERT INTO `cluster_node` VALUES (101650, 101340, '28', 0, 0);
INSERT INTO `cluster_node` VALUES (101654, 101340, '29', 0, 0);
INSERT INTO `cluster_node` VALUES (101658, 101340, '30', 0, 0);
INSERT INTO `cluster_node` VALUES (101662, 101340, '31', 0, 0);
INSERT INTO `cluster_node` VALUES (101666, 101340, '32', 0, 0);
INSERT INTO `cluster_node` VALUES (101670, 101340, '33', 0, 0);
INSERT INTO `cluster_node` VALUES (101674, 101340, '34 roles', 0, 0);
INSERT INTO `cluster_node` VALUES (101678, 101340, '35 Stats 1', 0, 0);
INSERT INTO `cluster_node` VALUES (101682, 101340, '36', 0, 0);
INSERT INTO `cluster_node` VALUES (101686, 101340, '37 visitors', 0, 0);
INSERT INTO `cluster_node` VALUES (101690, 101340, '38 stats', 0, 0);
INSERT INTO `cluster_node` VALUES (101694, 101340, '39 clickpaths', 0, 0);
INSERT INTO `cluster_node` VALUES (101698, 101340, '40 integrated help', 0, 0);
INSERT INTO `cluster_node` VALUES (101810, 100110, 'Common Errors (2)', 0, 0);
INSERT INTO `cluster_node` VALUES (101816, 100110, 'Installation', 0, 0);
INSERT INTO `cluster_node` VALUES (101822, 100110, 'API (2)', 0, 0);
INSERT INTO `cluster_node` VALUES (101828, 100110, 'Security', 0, 0);
INSERT INTO `cluster_node` VALUES (101835, 100110, 'Downloads (2)', 0, 0);
INSERT INTO `cluster_node` VALUES (101841, 100110, 'License (2)', 0, 0);
INSERT INTO `cluster_node` VALUES (101848, 100110, 'N/X sites', 0, 0);
INSERT INTO `cluster_node` VALUES (101854, 100110, 'In Media (2)', 0, 0);
INSERT INTO `cluster_node` VALUES (101871, 100189, 'Downloads (2)', 0, 10);
INSERT INTO `cluster_node` VALUES (101881, 100189, 'License (2)', 0, 10);
INSERT INTO `cluster_node` VALUES (101891, 100019, 'License', 0, 10);
INSERT INTO `cluster_node` VALUES (101906, 101901, 'Downloads', 0, 10);
INSERT INTO `cluster_node` VALUES (101916, 100189, 'FAQ (2)', 0, 10);
INSERT INTO `cluster_node` VALUES (101925, 100189, 'Common Errors (2)', 0, 10);
INSERT INTO `cluster_node` VALUES (101935, 100189, 'Installation', 0, 10);
INSERT INTO `cluster_node` VALUES (101945, 100189, 'API (2)', 0, 10);
INSERT INTO `cluster_node` VALUES (101955, 100189, 'Security', 0, 10);
INSERT INTO `cluster_node` VALUES (101974, 100019, 'Common Errors', 0, 10);
INSERT INTO `cluster_node` VALUES (101987, 100019, 'Installation Documentation', 0, 10);
INSERT INTO `cluster_node` VALUES (101993, 100019, 'Getting Started Docs', 0, 10);
INSERT INTO `cluster_node` VALUES (101998, 100019, 'API', 0, 10);
INSERT INTO `cluster_node` VALUES (102341, 102289, '12', 0, 10);
INSERT INTO `cluster_node` VALUES (102017, 100189, 'Tour', 0, 10);
INSERT INTO `cluster_node` VALUES (102027, 100189, 'Requirements (2)', 0, 10);
INSERT INTO `cluster_node` VALUES (102036, 100189, 'The Team (2)', 0, 10);
INSERT INTO `cluster_node` VALUES (102336, 102289, '11 Properties', 0, 10);
INSERT INTO `cluster_node` VALUES (102331, 102289, '10', 0, 10);
INSERT INTO `cluster_node` VALUES (102326, 102289, '09 ACL 2', 0, 10);
INSERT INTO `cluster_node` VALUES (102090, 100490, 'N/X 4.0 Tour', 0, 10);
INSERT INTO `cluster_node` VALUES (102095, 100189, 'N/X sites', 0, 10);
INSERT INTO `cluster_node` VALUES (102105, 100189, 'In Media (2)', 0, 10);
INSERT INTO `cluster_node` VALUES (102321, 102289, '08', 0, 10);
INSERT INTO `cluster_node` VALUES (102316, 102289, '06', 0, 10);
INSERT INTO `cluster_node` VALUES (102311, 102289, '05 Translation 2', 0, 10);
INSERT INTO `cluster_node` VALUES (102306, 102289, '04', 0, 10);
INSERT INTO `cluster_node` VALUES (102301, 102289, '03 Library', 0, 10);
INSERT INTO `cluster_node` VALUES (102812, 100349, 'Yes, we are save!', 0, 10);
INSERT INTO `cluster_node` VALUES (102824, 100349, 'N/X 4.0 relase X-Mas Gift!', 0, 10);
INSERT INTO `cluster_node` VALUES (102185, 100019, 'List of N/X pages', 0, 10);
INSERT INTO `cluster_node` VALUES (102479, 102289, '40 integrated help', 0, 10);
INSERT INTO `cluster_node` VALUES (102474, 102289, '39 clickpaths', 0, 10);
INSERT INTO `cluster_node` VALUES (102469, 102289, '38 stats', 0, 10);
INSERT INTO `cluster_node` VALUES (102464, 102289, '37 visitors', 0, 10);
INSERT INTO `cluster_node` VALUES (102459, 102289, '36', 0, 10);
INSERT INTO `cluster_node` VALUES (102454, 102289, '35 Stats 1', 0, 10);
INSERT INTO `cluster_node` VALUES (102449, 102289, '34 roles', 0, 10);
INSERT INTO `cluster_node` VALUES (102444, 102289, '33', 0, 10);
INSERT INTO `cluster_node` VALUES (102439, 102289, '32', 0, 10);
INSERT INTO `cluster_node` VALUES (102434, 102289, '31', 0, 10);
INSERT INTO `cluster_node` VALUES (102429, 102289, '30', 0, 10);
INSERT INTO `cluster_node` VALUES (102424, 102289, '29', 0, 10);
INSERT INTO `cluster_node` VALUES (102419, 102289, '28', 0, 10);
INSERT INTO `cluster_node` VALUES (102792, 100349, 'PHP Security', 0, 10);
INSERT INTO `cluster_node` VALUES (102288, 102289, '01 Impressive new look', 0, 10);
INSERT INTO `cluster_node` VALUES (102296, 102289, '02 Rhichtext editor', 0, 10);
INSERT INTO `cluster_node` VALUES (102806, 100320, 'Yes, we are save!', 0, 0);
INSERT INTO `cluster_node` VALUES (102356, 102289, '15', 0, 10);
INSERT INTO `cluster_node` VALUES (102786, 100320, 'PHP Security', 0, 0);
INSERT INTO `cluster_node` VALUES (102279, 100349, 'Website launch', 0, 10);
INSERT INTO `cluster_node` VALUES (100499, 100490, 'News Archive', 0, 10);
INSERT INTO `cluster_node` VALUES (101983, 101981, 'Forum', 0, 10);
INSERT INTO `cluster_node` VALUES (102818, 100320, 'N/X 4.0 relase X-Mas Gift!', 0, 0);
INSERT INTO `cluster_node` VALUES (102366, 102289, '17 Export Wizard', 0, 10);
INSERT INTO `cluster_node` VALUES (102832, 101121, 'none', 0, 0);

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `cluster_template_item_types`
#

DROP TABLE IF EXISTS `cluster_template_item_types`;
CREATE TABLE `cluster_template_item_types` (
  `CLTITYPE_ID` tinyint(4) NOT NULL default '0',
  `NAME` varchar(32) NOT NULL default '',
  `DESCRIPTION` varchar(255) default NULL,
  PRIMARY KEY  (`CLTITYPE_ID`),
  UNIQUE KEY `CLTITYPE_ID` (`CLTITYPE_ID`)
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `cluster_template_item_types`
#

INSERT INTO `cluster_template_item_types` VALUES (1, 'Static Content-Item', 'The same content for all instances of the cluster.');
INSERT INTO `cluster_template_item_types` VALUES (2, 'Dynamic Content-Item', 'Different Content-Items for instances of a cluster');
INSERT INTO `cluster_template_item_types` VALUES (3, 'Static Cluster-Instance', 'One Cluster-Instance for all instances of the cluster.');
INSERT INTO `cluster_template_item_types` VALUES (4, 'Dynamic Cluster-Template', 'Different Cluster-Instances for each instance of an cluster.');
INSERT INTO `cluster_template_item_types` VALUES (5, 'Library', 'Link to contents from the object browser');
INSERT INTO `cluster_template_item_types` VALUES (6, 'Compound Cluster', 'Compounds are Clusters having an own layout.');
INSERT INTO `cluster_template_item_types` VALUES (7, 'Compound Group', 'Group Compounds and select group for content');
INSERT INTO `cluster_template_item_types` VALUES (8, 'Channel', 'Linking content of channels.');

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `cluster_template_items`
#

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
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `cluster_template_items`
#

INSERT INTO `cluster_template_items` VALUES (100002, 100001, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100003, 100001, 'Body', 2, 1, 1, 100024, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100493, 100490, 'Menu', 3, 1, 1, 100090, 3, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100067, 100066, 'Menu 1', 1, 2, 2, 100012, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100068, 100066, 'Menu 2', 2, 2, 2, 100012, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100069, 100066, 'Menu 3', 3, 2, 2, 100012, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100070, 100066, 'Menu 4', 4, 2, 2, 100012, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100071, 100066, 'Key Visual', 5, 1, 1, 100012, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100072, 100066, 'Logo', 6, 1, 1, 100012, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100073, 100066, 'Paypal', 7, 1, 1, 100012, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100088, 100001, 'Menu', 3, 1, 1, 100074, 3, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100341, 100320, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100111, 100110, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100112, 100110, 'Body', 2, 1, 1, 100024, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100113, 100110, 'Image', 3, 1, 1, 100012, 5, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100114, 100110, 'Link', 4, 1, 1, 100048, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100123, 100122, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100124, 100122, 'Body', 2, 1, 1, 100024, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100125, 100122, 'Menu', 3, 1, 1, 100074, 3, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100126, 100122, 'Teaser', 4, 1, 20, 100110, 6, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100351, 100349, 'Abstract', 2, 1, 1, 100024, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100350, 100349, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100089, 100019, 'Menu', 3, 1, 1, 100090, 3, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100600, 100091, 'Banner', 13, 1, 1, 100549, 7, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100468, 100091, 'LSiteofmonth', 11, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100322, 100320, 'Abstract', 2, 1, 1, 100024, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100323, 100320, 'Body', 3, 1, 1, 100024, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100345, 100344, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100346, 100344, 'Stage', 2, 1, 1, 1, 8, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100621, 100605, 'Subject', 3, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (101905, 101901, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (101904, 101901, 'Body', 2, 1, 1, 100024, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100395, 100344, 'Menu', 3, 1, 1, 100074, 3, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100396, 100066, 'News', 8, 1, 1, 1, 8, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100398, 100066, 'LNews', 9, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100399, 100066, 'LForum', 10, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100400, 100066, 'LSiteofmonth', 11, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100401, 100066, 'LRSS', 12, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100455, 100454, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100456, 100454, 'No Results', 2, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100457, 100454, 'Menu', 3, 1, 1, 100074, 3, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100467, 100091, 'LForum', 10, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100492, 100490, 'Stage', 2, 1, 1, 1, 8, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100491, 100490, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100466, 100091, 'LNews', 9, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100512, 100511, 'Stage', 1, 1, 1, 1, 8, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100523, 100511, 'Baselink', 2, 1, 1, 100048, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100526, 100525, 'Image', 1, 1, 1, 100012, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100528, 100525, 'Link', 2, 1, 1, 100048, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100550, 100066, 'Banner', 13, 1, 1, 100548, 7, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100556, 100554, 'Body', 5, 1, 1, 100024, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100557, 100554, 'Name', 6, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100558, 100554, 'Christian Name', 7, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100559, 100554, 'Street', 8, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100560, 100554, 'ZIP', 9, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100561, 100554, 'City', 10, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100562, 100554, 'TEL', 11, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100563, 100554, 'FAX', 12, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100564, 100554, 'E-Mail', 13, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100565, 100554, 'SUBMIT', 14, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100566, 100554, 'Reset', 15, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100567, 100554, 'success', 16, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100568, 100554, 'Validation', 17, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100569, 100554, 'sendto', 18, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100570, 100554, 'mailsubject', 19, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100593, 100554, 'Subject', 3, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100598, 100554, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100594, 100554, 'Mailbody', 4, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100597, 100554, 'Menu', 20, 1, 1, 100074, 3, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100620, 100605, 'mailsubject', 19, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100619, 100605, 'sendto', 18, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100618, 100605, 'Validation', 17, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100617, 100605, 'success', 16, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100654, 100652, 'Baselink', 2, 1, 1, 100048, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100714, 100712, 'Answer', 2, 1, 1, 100024, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100713, 100712, 'Question', 1, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100733, 100732, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100734, 100732, 'Body', 2, 1, 1, 100024, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100735, 100732, 'Question', 3, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100736, 100732, 'Submit', 4, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100737, 100732, 'Reset', 5, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100738, 100732, 'Menu', 6, 1, 1, 100074, 3, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100749, 100732, 'success', 7, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (101902, 101901, 'Menu', 4, 1, 1, 100090, 3, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (101903, 101901, 'Address', 3, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100616, 100605, 'Reset', 15, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100615, 100605, 'SUBMIT', 14, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100614, 100605, 'E-Mail', 13, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (101982, 101981, 'Address', 1, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100784, 100777, 'success', 7, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100653, 100652, 'Stage', 1, 1, 1, 1, 8, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100465, 100091, 'News', 8, 1, 1, 1, 8, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100481, 100478, 'Menu', 3, 1, 1, 100090, 3, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100613, 100605, 'FAX', 12, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100612, 100605, 'TEL', 11, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100783, 100777, 'Menu', 6, 1, 1, 100090, 3, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100098, 100091, 'Paypal', 7, 1, 1, 100012, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100097, 100091, 'Logo', 6, 1, 1, 100012, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100022, 100019, 'Body', 2, 1, 1, 100024, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100193, 100189, 'Link', 4, 1, 1, 100048, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100838, 100837, 'Answer', 2, 1, 1, 100024, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100839, 100837, 'Question', 1, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100611, 100605, 'City', 10, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100610, 100605, 'ZIP', 9, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100782, 100777, 'Reset', 5, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100192, 100189, 'Image', 3, 1, 1, 100012, 5, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100191, 100189, 'Body', 2, 1, 1, 100024, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100190, 100189, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100182, 100178, 'Teaser', 4, 1, 20, 100110, 6, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100181, 100178, 'Menu', 3, 1, 1, 100090, 3, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (101342, 101340, 'Text', 2, 1, 1, 100024, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (101341, 101340, 'Picture', 1, 1, 1, 100012, 5, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (101291, 101290, 'Address', 1, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (101181, 101177, 'Menu', 4, 1, 1, 100074, 3, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (101180, 101177, 'Address', 3, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (101179, 101177, 'Body', 2, 1, 1, 100024, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (101178, 101177, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (101144, 101121, 'Body', 1, 1, 1, 100024, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (101134, 101121, 'vision', 8, 1, 1, 100012, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (101133, 101121, 'Menu 4', 7, 2, 2, 100012, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (101132, 101121, 'Menu 3', 6, 2, 2, 100012, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (101131, 101121, 'Menu 2', 5, 2, 2, 100012, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100609, 100605, 'Street', 8, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100608, 100605, 'Christian Name', 7, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100607, 100605, 'Name', 6, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (101130, 101121, 'Menu 1', 4, 2, 2, 100012, 2, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (101128, 101121, 'KeyVisual', 2, 1, 1, 100012, 2, 1, 0, 0);
INSERT INTO `cluster_template_items` VALUES (101127, 101121, 'Menu', 3, 1, 1, 100074, 3, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100096, 100091, 'Key Visual', 5, 1, 1, 100012, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100095, 100091, 'Menu 4', 4, 2, 2, 100012, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (101101, 101100, 'tst', 1, 0, 9, 100712, 4, 0, 0, 0);
INSERT INTO `cluster_template_items` VALUES (100606, 100605, 'Body', 5, 1, 1, 100024, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100778, 100777, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100779, 100777, 'Body', 2, 1, 1, 100024, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100780, 100777, 'Question', 3, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100781, 100777, 'Submit', 4, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100624, 100605, 'Menu', 20, 1, 1, 100090, 3, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100623, 100605, 'Mailbody', 4, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100622, 100605, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100094, 100091, 'Menu 3', 3, 2, 2, 100012, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100480, 100478, 'No Results', 2, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100469, 100091, 'LRSS', 12, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100180, 100178, 'Body', 2, 1, 1, 100024, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100093, 100091, 'Menu 2', 2, 2, 2, 100012, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100479, 100478, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100092, 100091, 'Menu 1', 1, 2, 2, 100012, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100021, 100019, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100179, 100178, 'Headline', 1, 1, 1, 100018, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (100352, 100349, 'Body', 3, 1, 1, 100024, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (102290, 102289, 'Text', 2, 1, 1, 100024, 2, 0, 0, 10);
INSERT INTO `cluster_template_items` VALUES (102291, 102289, 'Picture', 1, 1, 1, 100012, 5, 0, 0, 10);

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `cluster_templates`
#

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
  UNIQUE KEY `CLT_ID` (`CLT_ID`)
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `cluster_templates`
#

INSERT INTO `cluster_templates` VALUES (100001, 2, 100000, 'Standard Page', 'Cluster for a page with a headline and text-content', 0, '', 0, 0);
INSERT INTO `cluster_templates` VALUES (100019, 100020, 100000, 'Standard Page', 'Cluster for a page with a headline and text-content', 0, '', 0, 10);
INSERT INTO `cluster_templates` VALUES (100066, 2, 100065, 'Layout', 'Cluster which contains all graphics for layout.', 0, '', 0, 0);
INSERT INTO `cluster_templates` VALUES (100091, 100020, 100065, 'Layout', 'Cluster which contains all graphics for layout.', 0, '', 0, 10);
INSERT INTO `cluster_templates` VALUES (100110, 2, 100065, 'Teasercluster', 'This cluster is places on teaserpages.', 1, 'echo &quot;&lt;table width=250 border=0 cellpadding=0 cellspacing=0&gt;&quot;;\r\necho &quot;&lt;tr&gt;&lt;td valign=middle width=100&gt;&quot;;\r\necho $me-&gt;content-&gt;get(&quot;Image&quot;);\r\necho &quot;&lt;/td&gt;&lt;td width=10&gt;&amp;nbsp;&amp;nbsp;&lt;/td&gt;&lt;td valign=middle width=140&gt;&quot;;\r\necho &quot;&lt;b&gt;&quot;;\r\necho $me-&gt;content-&gt;get(&quot;Headline&quot;);\r\necho &quot;&lt;/b&gt;&lt;br/&gt;&quot;;\r\necho $me-&gt;content-&gt;get(&quot;Body&quot;);\r\necho &quot;&amp;nbsp;&quot;;\r\necho $me-&gt;content-&gt;get(&quot;Link&quot;);\r\necho &quot;&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;&quot;;', 0, 0);
INSERT INTO `cluster_templates` VALUES (100122, 2, 100000, 'Teaser Page', 'Holds Teasers', 0, '', 0, 0);
INSERT INTO `cluster_templates` VALUES (100178, 100020, 100000, 'Teaser Page', 'Holds Teasers', 0, '', 0, 10);
INSERT INTO `cluster_templates` VALUES (100189, 100020, 100065, 'Teasercluster', 'This cluster is places on teaserpages.', 1, 'echo &quot;&lt;table width=250 border=0 cellpadding=0 cellspacing=0&gt;&quot;;\r\necho &quot;&lt;tr&gt;&lt;td valign=middle width=100&gt;&quot;;\r\necho $me-&gt;content-&gt;get(&quot;Image&quot;);\r\necho &quot;&lt;/td&gt;&lt;td width=10&gt;&amp;nbsp;&amp;nbsp;&lt;/td&gt;&lt;td valign=middle width=140&gt;&quot;;\r\necho &quot;&lt;b&gt;&quot;;\r\necho $me-&gt;content-&gt;get(&quot;Headline&quot;);\r\necho &quot;&lt;/b&gt;&lt;br/&gt;&quot;;\r\necho $me-&gt;content-&gt;get(&quot;Body&quot;);\r\necho &quot;&amp;nbsp;&quot;;\r\necho $me-&gt;content-&gt;get(&quot;Link&quot;);\r\necho &quot;&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;&quot;;', 0, 10);
INSERT INTO `cluster_templates` VALUES (100296, 2, 100000, 'Empty', 'Empty cluster', 0, '', 0, 0);
INSERT INTO `cluster_templates` VALUES (100310, 100020, 100000, 'Empty', 'Empty cluster', 0, '', 0, 10);
INSERT INTO `cluster_templates` VALUES (100320, 2, 100065, 'Article Text', 'Just Text', 1, 'echo &quot;&lt;b&gt;&quot;.$me-&gt;content-&gt;get(&quot;Headline&quot;).&quot;&lt;/b&gt;&quot;;\r\nbr();\r\necho $me-&gt;content-&gt;get(&quot;Abstract&quot;);\r\nbr();\r\necho $me-&gt;content-&gt;get(&quot;Body&quot;);', 0, 0);
INSERT INTO `cluster_templates` VALUES (100344, 2, 100000, 'Stage', '', 0, '', 0, 0);
INSERT INTO `cluster_templates` VALUES (100454, 2, 100000, 'Search', '', 0, '', 0, 0);
INSERT INTO `cluster_templates` VALUES (100478, 100020, 100000, 'Search', '', 0, '', 0, 10);
INSERT INTO `cluster_templates` VALUES (100490, 100020, 100000, 'Stage', '', 0, '', 0, 10);
INSERT INTO `cluster_templates` VALUES (100349, 100020, 100065, 'Article Text', 'Just Text', 1, 'echo &quot;&lt;b&gt;&quot;.$me-&gt;content-&gt;get(&quot;Headline&quot;).&quot;&lt;/b&gt;&quot;;\r\nbr();\r\necho $me-&gt;content-&gt;get(&quot;Abstract&quot;);\r\nbr();\r\necho $me-&gt;content-&gt;get(&quot;Body&quot;);', 0, 10);
INSERT INTO `cluster_templates` VALUES (100511, 2, 100065, 'RSSFeed', '', 0, '', 0, 0);
INSERT INTO `cluster_templates` VALUES (100525, 2, 100065, 'Banner', '', 1, '$link = $me-&gt;content-&gt;get(&quot;Link&quot;, &quot;ALL&quot;);\r\n$banner = $me-&gt;content-&gt;get(&quot;Image&quot;);\r\necho &#039;&lt;a href=&quot;&#039;.$link[&quot;HREF&quot;].&#039;&quot; target=&quot;_blank&quot;&gt;&#039;.$banner.&#039;&lt;/a&gt;&#039;;', 0, 0);
INSERT INTO `cluster_templates` VALUES (100554, 2, 100000, 'Contact form', '', 0, '', 0, 0);
INSERT INTO `cluster_templates` VALUES (100605, 100020, 100000, 'Contact form', '', 0, '', 0, 10);
INSERT INTO `cluster_templates` VALUES (100652, 100020, 100065, 'RSSFeed', '', 0, '', 0, 10);
INSERT INTO `cluster_templates` VALUES (100712, 1, 0, 'pgnFAQ', 'automatically created Cluster-Template for FAQ', 0, '', 0, 0);
INSERT INTO `cluster_templates` VALUES (100732, 2, 100000, 'FAQ Form', '', 0, '', 0, 0);
INSERT INTO `cluster_templates` VALUES (100777, 100020, 100000, 'FAQ Form', '', 0, '', 0, 10);
INSERT INTO `cluster_templates` VALUES (101981, 100020, 100000, 'External Page', '', 0, '', 0, 10);
INSERT INTO `cluster_templates` VALUES (102289, 100020, 100065, 'Picture + Text', '', 1, 'echo $me-&gt;content-&gt;get(&quot;Text&quot;);\r\nbr();\r\nbr();\r\necho $me-&gt;content-&gt;get(&quot;Picture&quot;);', 0, 10);
INSERT INTO `cluster_templates` VALUES (100837, 1, 0, 'Cluster Template', 'automatically created Cluster-Template for FAQ', 0, NULL, 0, 0);
INSERT INTO `cluster_templates` VALUES (101340, 2, 100065, 'Picture + Text', '', 1, 'echo $me-&gt;content-&gt;get(&quot;Text&quot;);\r\nbr();\r\nbr();\r\necho $me-&gt;content-&gt;get(&quot;Picture&quot;);', 0, 0);
INSERT INTO `cluster_templates` VALUES (101121, 2, 100000, 'Startpage', '', 0, '', 0, 0);
INSERT INTO `cluster_templates` VALUES (101901, 100020, 100000, 'Inline Frame', '', 0, '', 0, 10);
INSERT INTO `cluster_templates` VALUES (101177, 2, 100000, 'Inline Frame', '', 0, '', 0, 0);
INSERT INTO `cluster_templates` VALUES (101183, 2, 100000, 'External Link', '', 0, '', 0, 0);
INSERT INTO `cluster_templates` VALUES (101290, 2, 100000, 'External Page', '', 0, '', 0, 0);
INSERT INTO `cluster_templates` VALUES (101100, 2, 100000, 'test', '', 0, '', 0, 0);

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `cluster_variations`
#

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
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `cluster_variations`
#

INSERT INTO `cluster_variations` VALUES (101312, 1, 101313, 0, NULL, 20041122113543, NULL, 'Administrator', NULL, NULL);
INSERT INTO `cluster_variations` VALUES (101304, 1, 101305, 0, 20041222182718, 20041122113433, 'Administrator', 'Administrator', 20041223221148, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101300, 1, 101301, 0, 20041222182604, 20041122113411, 'Administrator', 'Administrator', 20041223221146, 'Administrator');
INSERT INTO `cluster_variations` VALUES (100048, 1, 100049, 0, 20040513141238, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (101295, 1, 101296, 0, 20041122111041, 20041122111024, 'Administrator', 'Administrator', 20041223221144, 'Administrator');
INSERT INTO `cluster_variations` VALUES (100074, 1, 100075, 0, 20040626141732, 20040513155146, 'Administrator', 'Administrator', 20041223221108, 'Administrator');
INSERT INTO `cluster_variations` VALUES (100130, 1, 100131, 0, 20041222192123, 20040617202329, 'Administrator', 'Administrator', 20041223221155, 'Administrator');
INSERT INTO `cluster_variations` VALUES (100137, 1, 100138, 0, 20041222185931, 20040617202346, 'Administrator', 'Administrator', 20041223221137, 'Administrator');
INSERT INTO `cluster_variations` VALUES (100144, 1, 100145, 0, 20041222193210, 20040617202406, 'Administrator', 'Administrator', 20041223221113, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101286, 1, 101287, 0, 20041120162809, 20041120162205, 'Administrator', 'Administrator', 20041223221206, 'Administrator');
INSERT INTO `cluster_variations` VALUES (100158, 1, 100159, 0, 20041222205052, 20040617202548, 'Administrator', 'Administrator', 20041223221205, 'Administrator');
INSERT INTO `cluster_variations` VALUES (100163, 1, 100164, 0, 20040617202846, 20040617202846, 'Administrator', 'Administrator', 20041223221152, 'Administrator');
INSERT INTO `cluster_variations` VALUES (100183, 1, 100184, 0, 20041222192123, 20040617202329, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (100188, 1, 100170, 0, 20040617202846, 20040617202846, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (100213, 1, 100214, 0, 20041222185931, 20040617202346, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (100236, 1, 100237, 0, 20040621150201, 20040621150131, 'Administrator', 'Administrator', NULL, NULL);
INSERT INTO `cluster_variations` VALUES (100242, 1, 100243, 0, 20041118192932, 20040621150232, 'Administrator', 'Administrator', 20041223221156, 'Administrator');
INSERT INTO `cluster_variations` VALUES (100248, 1, 100249, 0, NULL, 20040621150333, NULL, 'Administrator', NULL, NULL);
INSERT INTO `cluster_variations` VALUES (100272, 1, 100273, 0, 20041118192932, 20040621150232, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102824, 1, 102823, 0, 20041221234254, 20041221232234, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102812, 1, 102811, 0, 20041221224737, 20041221223128, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (100300, 1, 100301, 0, NULL, 20040622140548, NULL, 'Administrator', 20041223221123, 'Administrator');
INSERT INTO `cluster_variations` VALUES (100304, 1, 100305, 0, 20041118194013, 20040622141139, 'Administrator', 'Administrator', 20041223221124, 'Administrator');
INSERT INTO `cluster_variations` VALUES (100311, 1, 100312, 0, NULL, 20040622140548, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (100516, 1, 100517, 0, NULL, 20040629231421, NULL, 'Administrator', 20041223221207, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101865, 1, 101866, 0, 20041210073039, 20041208135305, 'Administrator', 'Administrator', 20041223221225, 'Administrator');
INSERT INTO `cluster_variations` VALUES (100805, 1, 100806, 0, NULL, 20040727212544, NULL, 'Administrator', 20040727212816, 'Administrator');
INSERT INTO `cluster_variations` VALUES (100482, 1, 100483, 0, 20041209221425, 20040628233423, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (100090, 1, 100076, 0, 20040626141732, 20040513155146, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (100315, 1, 100316, 0, 20041118194013, 20040622141139, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (100461, 1, 100462, 0, 20041209221425, 20040628233423, 'Administrator', 'Administrator', 20041223221126, 'Administrator');
INSERT INTO `cluster_variations` VALUES (100385, 1, 100386, 0, 20040624004014, 20040624003742, 'Administrator', 'Administrator', 20041223221158, 'Administrator');
INSERT INTO `cluster_variations` VALUES (100391, 1, 100392, 0, 20040624004048, 20040624004030, 'Administrator', 'Administrator', 20041223221200, 'Administrator');
INSERT INTO `cluster_variations` VALUES (100494, 1, 100495, 0, 20040624004014, 20040624003742, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (100499, 1, 100500, 0, 20040624004048, 20040624004030, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (100520, 1, 100521, 0, 20041210110707, 20040629231438, 'Administrator', 'Administrator', 20041223221208, 'Administrator');
INSERT INTO `cluster_variations` VALUES (100529, 1, 100530, 0, 20040630141703, 20040630141629, 'Administrator', 'Administrator', 20041005121646, 'Administrator');
INSERT INTO `cluster_variations` VALUES (100531, 1, 100532, 0, 20040630141732, 20040630141643, 'Administrator', 'Administrator', 20041005121646, 'Administrator');
INSERT INTO `cluster_variations` VALUES (100575, 1, 100576, 0, 20041222183332, 20040630154216, 'Administrator', 'Administrator', 20041223221132, 'Administrator');
INSERT INTO `cluster_variations` VALUES (100625, 1, 100626, 0, 20041222183332, 20040630154216, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (100648, 1, 100649, 0, NULL, 20040629231421, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (100655, 1, 100656, 0, 20041210110707, 20040629231438, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (100718, 1, 100719, 0, 20040701160638, 20040701160540, 'Administrator', 'Administrator', 20041223221139, 'Administrator');
INSERT INTO `cluster_variations` VALUES (100742, 1, 100743, 0, 20040702143048, 20040702142432, 'Administrator', 'Administrator', 20041223221142, 'Administrator');
INSERT INTO `cluster_variations` VALUES (100755, 1, 100756, 0, 20040702144449, 20040702144046, 'Administrator', 'Internal User', 20040702144454, 'Administrator');
INSERT INTO `cluster_variations` VALUES (100770, 1, 100771, 0, 20040701160638, 20040701160540, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (100785, 1, 100786, 0, 20040702143048, 20040702142432, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102288, 1, 101356, 0, 20041129093134, 20041126220021, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (101154, 1, 101155, 0, 20041118191649, 20041118191030, 'Administrator', 'Administrator', 20041223221201, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101193, 1, 101194, 0, 20041119224216, 20041119220720, 'Administrator', 'Administrator', 20041223221143, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101205, 1, 101206, 0, 20041120141258, 20041120135725, 'Administrator', 'Administrator', 20041223221120, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101215, 1, 101216, 0, 20041120142110, 20041120141824, 'Administrator', 'Administrator', 20041223221122, 'Administrator');
INSERT INTO `cluster_variations` VALUES (102469, 1, 101743, 0, 20041206140159, 20041206140115, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102474, 1, 101744, 0, 20041206140407, 20041206140213, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102479, 1, 101745, 0, 20041206140548, 20041206140418, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (101316, 1, 101317, 0, 20041122215519, 20041122113655, 'Administrator', 'Administrator', 20041223221150, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101308, 1, 101309, 0, 20041122214621, 20041122113515, 'Administrator', 'Administrator', NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102464, 1, 101742, 0, 20041206140105, 20041206140016, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102454, 1, 101740, 0, 20041206135834, 20041206135735, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102459, 1, 101741, 0, 20041206140006, 20041206135845, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (101348, 1, 101349, 0, 20041208180631, 20041126215738, 'Administrator', 'Administrator', 20041223221202, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101352, 1, 101353, 0, 20041129093134, 20041126220021, 'Administrator', 'Administrator', 20041223221231, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101357, 1, 101358, 0, 20041129093155, 20041126220151, 'Administrator', 'Administrator', 20041223221233, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101154, 101362, 101363, 0, NULL, 20041128002645, NULL, 'Administrator', NULL, NULL);
INSERT INTO `cluster_variations` VALUES (101366, 1, 101367, 0, 20041129093515, 20041128003120, 'Administrator', 'Administrator', 20041223221234, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101470, 1, 101471, 0, 20041129093809, 20041129093528, 'Administrator', 'Administrator', 20041223221235, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101474, 1, 101475, 0, 20041129093924, 20041129093827, 'Administrator', 'Administrator', 20041223221237, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101480, 1, 101481, 0, 20041129094816, 20041129094535, 'Administrator', 'Administrator', 20041223221238, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101484, 1, 101485, 0, 20041129095036, 20041129094826, 'Administrator', 'Administrator', 20041223221239, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101488, 1, 101489, 0, 20041129095253, 20041129095050, 'Administrator', 'Administrator', 20041223221241, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101492, 1, 101493, 0, 20041129095655, 20041129095526, 'Administrator', 'Administrator', 20041223221243, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101496, 1, 101497, 0, 20041129100032, 20041129095706, 'Administrator', 'Administrator', 20041223221244, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101506, 1, 101507, 0, 20041129213556, 20041129213332, 'Administrator', 'Administrator', 20041223221246, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101510, 1, 101511, 0, 20041206132633, 20041129213606, 'Administrator', 'Administrator', 20041223221248, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101514, 1, 101515, 0, 20041129214123, 20041129213918, 'Administrator', 'Administrator', 20041223221249, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101518, 1, 101519, 0, 20041129214414, 20041129214139, 'Administrator', 'Administrator', 20041223221250, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101522, 1, 101523, 0, 20041129214804, 20041129214428, 'Administrator', 'Administrator', 20041223221252, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101526, 1, 101527, 0, 20041129215002, 20041129214820, 'Administrator', 'Administrator', 20041223221253, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101530, 1, 101531, 0, 20041129215141, 20041129215020, 'Administrator', 'Administrator', 20041223221254, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101534, 1, 101535, 0, 20041129215245, 20041129215157, 'Administrator', 'Administrator', 20041223221255, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101538, 1, 101539, 0, 20041129215509, 20041129215413, 'Administrator', 'Administrator', 20041223221256, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101542, 1, 101543, 0, 20041129215611, 20041129215522, 'Administrator', 'Administrator', 20041223221257, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101576, 1, 101577, 0, 20041118191649, 20041118191030, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (101591, 1, 101592, 0, 20041202180654, 20041202180354, 'Administrator', 'Internal User', NULL, NULL);
INSERT INTO `cluster_variations` VALUES (101595, 1, 101596, 0, 20041202180826, 20041202180438, 'Administrator', 'Internal User', NULL, NULL);
INSERT INTO `cluster_variations` VALUES (101804, 1, 101805, 0, 20041206152243, 20041206152243, 'Administrator', 'Administrator', 20041223221134, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101782, 1, 101783, 0, 20041206151403, 20041206151403, 'Administrator', 'Administrator', 20041223221154, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101788, 1, 101789, 0, 20041206151533, 20041206151533, 'Administrator', 'Administrator', 20041223221155, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101794, 1, 101795, 0, 20041206151634, 20041206151634, 'Administrator', 'Administrator', 20041220130001, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101626, 1, 101627, 0, 20041206133542, 20041206133357, 'Administrator', 'Administrator', 20041223221258, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101630, 1, 101631, 0, 20041206133659, 20041206133553, 'Administrator', 'Administrator', 20041223221300, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101634, 1, 101635, 0, 20041206133938, 20041206133707, 'Administrator', 'Administrator', 20041223221301, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101638, 1, 101639, 0, 20041206134221, 20041206133952, 'Administrator', 'Administrator', 20041223221302, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101642, 1, 101643, 0, 20041206134422, 20041206134228, 'Administrator', 'Administrator', 20041223221303, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101646, 1, 101647, 0, 20041206134556, 20041206134435, 'Administrator', 'Administrator', 20041223221305, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101650, 1, 101651, 0, 20041206134835, 20041206134611, 'Administrator', 'Administrator', 20041223221306, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101654, 1, 101655, 0, 20041206135039, 20041206134845, 'Administrator', 'Administrator', 20041223221307, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101658, 1, 101659, 0, 20041206135158, 20041206135052, 'Administrator', 'Administrator', 20041223221309, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101662, 1, 101663, 0, 20041206135309, 20041206135206, 'Administrator', 'Administrator', 20041223221310, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101666, 1, 101667, 0, 20041206135402, 20041206135319, 'Administrator', 'Administrator', 20041223221311, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101670, 1, 101671, 0, 20041206135505, 20041206135411, 'Administrator', 'Administrator', 20041223221313, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101674, 1, 101675, 0, 20041206135646, 20041206135522, 'Administrator', 'Administrator', 20041223221315, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101678, 1, 101679, 0, 20041206135834, 20041206135735, 'Administrator', 'Administrator', 20041223221316, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101682, 1, 101683, 0, 20041206140006, 20041206135845, 'Administrator', 'Administrator', 20041223221318, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101686, 1, 101687, 0, 20041206140105, 20041206140016, 'Administrator', 'Administrator', 20041223221320, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101690, 1, 101691, 0, 20041206140159, 20041206140115, 'Administrator', 'Administrator', 20041223221321, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101694, 1, 101695, 0, 20041206140407, 20041206140213, 'Administrator', 'Administrator', 20041223221323, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101698, 1, 101699, 0, 20041206140548, 20041206140418, 'Administrator', 'Administrator', 20041223221324, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101810, 1, 101811, 0, 20041206152408, 20041206152408, 'Administrator', 'Administrator', 20041223221135, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101816, 1, 101817, 0, 20041206152543, 20041206152543, 'Administrator', 'Administrator', 20041223221136, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101822, 1, 101823, 0, 20041206152704, 20041206152704, 'Administrator', 'Administrator', 20041223221137, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101828, 1, 101829, 0, 20041206152836, 20041206152836, 'Administrator', 'Administrator', 20041208144648, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101835, 1, 101836, 0, 20041206153250, 20041206153250, 'Administrator', 'Administrator', 20041223221111, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101841, 1, 101842, 0, 20041206153430, 20041206153430, 'Administrator', 'Administrator', 20041223221112, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101848, 1, 101849, 0, 20041206153643, 20041206153643, 'Administrator', 'Administrator', 20041223221204, 'Administrator');
INSERT INTO `cluster_variations` VALUES (101854, 1, 101855, 0, 20041206153802, 20041206153802, 'Administrator', 'Administrator', 20041208144652, 'Administrator');
INSERT INTO `cluster_variations` VALUES (100219, 1, 100220, 0, 20041222193210, 20040617202406, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (101871, 1, 101872, 0, 20041206153250, 20041206153250, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (101881, 1, 101882, 0, 20041206153430, 20041206153430, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (101891, 1, 101892, 0, 20041120141258, 20041120135725, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (101906, 1, 101907, 0, 20041120142110, 20041120141824, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (101916, 1, 101917, 0, 20041206152243, 20041206152243, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (101925, 1, 101926, 0, 20041206152408, 20041206152408, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (101935, 1, 101936, 0, 20041206152543, 20041206152543, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (101945, 1, 101946, 0, 20041206152704, 20041206152704, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (101955, 1, 101956, 0, 20041206152836, 20041206152836, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (101974, 1, 101975, 0, 20041119224216, 20041119220720, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (101983, 1, 101984, 0, 20041122111041, 20041122111024, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (101987, 1, 101988, 0, 20041222182604, 20041122113411, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (101993, 1, 101994, 0, 20041222182718, 20041122113433, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (101998, 1, 101999, 0, 20041122215519, 20041122113655, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102792, 1, 102791, 0, 20041216115245, 20041216114611, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102017, 1, 102018, 0, 20041206151403, 20041206151403, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102027, 1, 102028, 0, 20041206151533, 20041206151533, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102036, 1, 102037, 0, 20041206151634, 20041206151634, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102449, 1, 101739, 0, 20041206135646, 20041206135522, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102444, 1, 101738, 0, 20041206135505, 20041206135411, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102439, 1, 101737, 0, 20041206135402, 20041206135319, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102434, 1, 101736, 0, 20041206135309, 20041206135206, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102090, 1, 102091, 0, 20041208180631, 20041126215738, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (100225, 1, 100226, 0, 20041222205052, 20040617202548, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102095, 1, 102096, 0, 20041206153643, 20041206153643, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102105, 1, 102106, 0, 20041206153802, 20041206153802, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102429, 1, 101732, 0, 20041206135158, 20041206135052, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102424, 1, 101728, 0, 20041206135039, 20041206134845, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102419, 1, 101724, 0, 20041206134835, 20041206134611, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102414, 1, 101720, 0, 20041206134556, 20041206134435, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102409, 1, 101716, 0, 20041206134422, 20041206134228, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102404, 1, 101715, 0, 20041206134221, 20041206133952, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102399, 1, 101714, 0, 20041206133938, 20041206133707, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102394, 1, 101713, 0, 20041206133659, 20041206133553, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102185, 1, 102186, 0, 20041120162809, 20041120162205, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102279, 1, 101870, 0, 20041210073039, 20041208135305, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102389, 1, 101712, 0, 20041206133542, 20041206133357, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102306, 1, 101478, 0, 20041129093809, 20041129093528, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102311, 1, 101479, 0, 20041129093924, 20041129093827, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102316, 1, 101501, 0, 20041129094816, 20041129094535, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102321, 1, 101502, 0, 20041129095036, 20041129094826, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102326, 1, 101503, 0, 20041129095253, 20041129095050, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102331, 1, 101504, 0, 20041129095655, 20041129095526, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102336, 1, 101505, 0, 20041129100032, 20041129095706, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102341, 1, 101601, 0, 20041129213556, 20041129213332, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102346, 1, 101602, 0, 20041206132633, 20041129213606, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102351, 1, 101603, 0, 20041129214123, 20041129213918, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102356, 1, 101604, 0, 20041129214414, 20041129214139, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102361, 1, 101605, 0, 20041129214804, 20041129214428, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102366, 1, 101703, 0, 20041129215002, 20041129214820, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102371, 1, 101705, 0, 20041129215141, 20041129215020, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102376, 1, 101707, 0, 20041129215245, 20041129215157, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102381, 1, 101708, 0, 20041129215509, 20041129215413, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102384, 1, 101710, 0, 20041129215611, 20041129215522, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102301, 1, 101469, 0, 20041129093515, 20041128003120, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102296, 1, 101361, 0, 20041129093155, 20041126220151, NULL, NULL, NULL, NULL);
INSERT INTO `cluster_variations` VALUES (102786, 1, 102787, 0, 20041216115245, 20041216114611, 'Administrator', 'Administrator', 20041223221229, 'Administrator');
INSERT INTO `cluster_variations` VALUES (102806, 1, 102807, 0, 20041221224737, 20041221223128, 'Administrator', 'Administrator', 20041223221227, 'Administrator');
INSERT INTO `cluster_variations` VALUES (102818, 1, 102819, 0, 20041221234254, 20041221232234, 'Administrator', 'Administrator', 20041223221226, 'Administrator');
INSERT INTO `cluster_variations` VALUES (102832, 1, 102833, 0, NULL, 20041222180730, NULL, 'Administrator', NULL, NULL);

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `compound_group_members`
#

DROP TABLE IF EXISTS `compound_group_members`;
CREATE TABLE `compound_group_members` (
  `CGID` bigint(20) NOT NULL default '0',
  `CGMID` bigint(20) NOT NULL default '0',
  `POSITION` bigint(20) NOT NULL default '0'
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `compound_group_members`
#

INSERT INTO `compound_group_members` VALUES (100548, 100531, 2);
INSERT INTO `compound_group_members` VALUES (100549, 100545, 1);
INSERT INTO `compound_group_members` VALUES (100548, 100529, 1);
INSERT INTO `compound_group_members` VALUES (100549, 100539, 2);

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `compound_groups`
#

DROP TABLE IF EXISTS `compound_groups`;
CREATE TABLE `compound_groups` (
  `CGID` bigint(20) NOT NULL default '0',
  `NAME` varchar(64) NOT NULL default '',
  `DESCRIPTION` varchar(255) default NULL,
  `SORTMODE` smallint(6) NOT NULL default '1',
  `VERSION` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`CGID`)
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `compound_groups`
#

INSERT INTO `compound_groups` VALUES (100548, 'Banner', 'Groupe for Teasering Banners', 1, 0);
INSERT INTO `compound_groups` VALUES (100549, 'Banner', 'Groupe for Teasering Banners', 3, 10);

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `content`
#

DROP TABLE IF EXISTS `content`;
CREATE TABLE `content` (
  `CID` bigint(20) NOT NULL default '0',
  `MODULE_ID` bigint(20) NOT NULL default '0',
  `CATEGORY_ID` bigint(20) NOT NULL default '0',
  `MT_ID` bigint(20) NOT NULL default '0',
  `NAME` varchar(32) NOT NULL default '',
  `DESCRIPTION` varchar(255) default NULL,
  `KEYWORDS` varchar(255) default NULL,
  `CREATED` timestamp NOT NULL,
  `LAST_MOD_DATE` timestamp NOT NULL,
  `LAST_MODIFIER` varchar(32) default NULL,
  `DELETED` tinyint(4) NOT NULL default '0',
  `VERSION` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`CID`),
  UNIQUE KEY `CID` (`CID`),
  KEY `NAME` (`NAME`)
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `content`
#

INSERT INTO `content` VALUES (100172, 100012, 100171, 2, 'Hammer', '', '', '2004-06-17 21:10:29', '2004-06-17 21:10:29', 'Administrator', 0, 0);
INSERT INTO `content` VALUES (100174, 100012, 100171, 2, 'Pencil', '', '', '2004-06-17 21:11:21', '2004-06-17 21:11:21', 'Administrator', 0, 0);
INSERT INTO `content` VALUES (101210, 100012, 101209, 2, 'GPL', '', '', '2004-11-20 14:01:54', '2004-11-20 14:01:54', 'Administrator', 0, 0);
INSERT INTO `content` VALUES (101388, 100012, 101386, 0, 'pic01.jpg', NULL, NULL, '2004-11-29 09:17:28', '0000-00-00 00:00:00', NULL, 0, 0);
INSERT INTO `content` VALUES (101390, 100012, 101386, 0, 'pic02.jpg', NULL, NULL, '2004-11-29 09:17:29', '0000-00-00 00:00:00', NULL, 0, 0);
INSERT INTO `content` VALUES (101392, 100012, 101386, 0, 'pic03.jpg', NULL, NULL, '2004-11-29 09:17:29', '0000-00-00 00:00:00', NULL, 0, 0);
INSERT INTO `content` VALUES (101394, 100012, 101386, 0, 'pic04.jpg', NULL, NULL, '2004-11-29 09:17:29', '0000-00-00 00:00:00', NULL, 0, 0);
INSERT INTO `content` VALUES (101396, 100012, 101386, 0, 'pic05.jpg', NULL, NULL, '2004-11-29 09:17:29', '0000-00-00 00:00:00', NULL, 0, 0);
INSERT INTO `content` VALUES (101398, 100012, 101386, 0, 'pic06.jpg', NULL, NULL, '2004-11-29 09:17:29', '0000-00-00 00:00:00', NULL, 0, 0);
INSERT INTO `content` VALUES (101400, 100012, 101386, 0, 'pic07.jpg', NULL, NULL, '2004-11-29 09:17:30', '0000-00-00 00:00:00', NULL, 0, 0);
INSERT INTO `content` VALUES (101402, 100012, 101386, 0, 'pic08.jpg', NULL, NULL, '2004-11-29 09:17:30', '0000-00-00 00:00:00', NULL, 0, 0);
INSERT INTO `content` VALUES (101404, 100012, 101386, 0, 'pic09.jpg', NULL, NULL, '2004-11-29 09:17:30', '0000-00-00 00:00:00', NULL, 0, 0);
INSERT INTO `content` VALUES (101406, 100012, 101386, 0, 'pic10.jpg', '', '', '2004-11-29 09:22:07', '0000-00-00 00:00:00', NULL, 0, 0);
INSERT INTO `content` VALUES (101408, 100012, 101386, 0, 'pic11.jpg', NULL, NULL, '2004-11-29 09:17:30', '0000-00-00 00:00:00', NULL, 0, 0);
INSERT INTO `content` VALUES (101410, 100012, 101386, 0, 'pic12.jpg', NULL, NULL, '2004-11-29 09:17:31', '0000-00-00 00:00:00', NULL, 0, 0);
INSERT INTO `content` VALUES (101412, 100012, 101386, 0, 'pic13.jpg', NULL, NULL, '2004-11-29 09:17:31', '0000-00-00 00:00:00', NULL, 0, 0);
INSERT INTO `content` VALUES (101414, 100012, 101386, 0, 'pic14.jpg', NULL, NULL, '2004-11-29 09:17:31', '0000-00-00 00:00:00', NULL, 0, 0);
INSERT INTO `content` VALUES (101416, 100012, 101386, 0, 'pic15.jpg', NULL, NULL, '2004-11-29 09:17:31', '0000-00-00 00:00:00', NULL, 0, 0);
INSERT INTO `content` VALUES (101418, 100012, 101386, 0, 'pic16.jpg', NULL, NULL, '2004-11-29 09:17:32', '0000-00-00 00:00:00', NULL, 0, 0);
INSERT INTO `content` VALUES (101420, 100012, 101386, 0, 'pic17.jpg', '', '', '2004-11-29 21:45:00', '0000-00-00 00:00:00', NULL, 0, 0);
INSERT INTO `content` VALUES (101422, 100012, 101386, 0, 'pic18.jpg', NULL, NULL, '2004-11-29 09:17:32', '0000-00-00 00:00:00', NULL, 0, 0);
INSERT INTO `content` VALUES (101424, 100012, 101386, 0, 'pic19.jpg', NULL, NULL, '2004-11-29 09:17:32', '0000-00-00 00:00:00', NULL, 0, 0);
INSERT INTO `content` VALUES (101426, 100012, 101386, 0, 'pic20.jpg', NULL, NULL, '2004-11-29 09:17:32', '0000-00-00 00:00:00', NULL, 0, 0);
INSERT INTO `content` VALUES (101428, 100012, 101386, 0, 'pic21.jpg', NULL, NULL, '2004-11-29 09:17:33', '0000-00-00 00:00:00', NULL, 0, 0);
INSERT INTO `content` VALUES (101430, 100012, 101386, 0, 'pic22.jpg', NULL, NULL, '2004-11-29 09:17:33', '0000-00-00 00:00:00', NULL, 0, 0);
INSERT INTO `content` VALUES (101432, 100012, 101386, 0, 'pic23.jpg', NULL, NULL, '2004-11-29 09:17:33', '0000-00-00 00:00:00', NULL, 0, 0);
INSERT INTO `content` VALUES (101434, 100012, 101386, 0, 'pic24.jpg', NULL, NULL, '2004-11-29 09:17:33', '0000-00-00 00:00:00', NULL, 0, 0);
INSERT INTO `content` VALUES (101436, 100012, 101386, 0, 'pic25.jpg', NULL, NULL, '2004-11-29 09:17:33', '0000-00-00 00:00:00', NULL, 0, 0);
INSERT INTO `content` VALUES (101438, 100012, 101386, 0, 'pic26.jpg', NULL, NULL, '2004-11-29 09:17:34', '0000-00-00 00:00:00', NULL, 0, 0);
INSERT INTO `content` VALUES (101440, 100012, 101386, 0, 'pic27.jpg', NULL, NULL, '2004-11-29 09:17:34', '0000-00-00 00:00:00', NULL, 0, 0);
INSERT INTO `content` VALUES (101442, 100012, 101386, 0, 'pic28.jpg', NULL, NULL, '2004-11-29 09:17:34', '0000-00-00 00:00:00', NULL, 0, 0);
INSERT INTO `content` VALUES (101444, 100012, 101386, 0, 'pic29.jpg', NULL, NULL, '2004-11-29 09:17:34', '0000-00-00 00:00:00', NULL, 0, 0);
INSERT INTO `content` VALUES (101446, 100012, 101386, 0, 'pic30.jpg', NULL, NULL, '2004-11-29 09:17:34', '0000-00-00 00:00:00', NULL, 0, 0);
INSERT INTO `content` VALUES (101448, 100012, 101386, 0, 'pic31.jpg', NULL, NULL, '2004-11-29 09:17:35', '0000-00-00 00:00:00', NULL, 0, 0);
INSERT INTO `content` VALUES (101450, 100012, 101386, 0, 'pic32.jpg', NULL, NULL, '2004-11-29 09:17:35', '0000-00-00 00:00:00', NULL, 0, 0);
INSERT INTO `content` VALUES (101452, 100012, 101386, 0, 'pic33.jpg', NULL, NULL, '2004-11-29 09:17:35', '0000-00-00 00:00:00', NULL, 0, 0);
INSERT INTO `content` VALUES (101454, 100012, 101386, 0, 'pic34.jpg', NULL, NULL, '2004-11-29 09:17:35', '0000-00-00 00:00:00', NULL, 0, 0);
INSERT INTO `content` VALUES (101456, 100012, 101386, 0, 'pic35.jpg', NULL, NULL, '2004-11-29 09:17:35', '0000-00-00 00:00:00', NULL, 0, 0);
INSERT INTO `content` VALUES (101458, 100012, 101386, 0, 'pic36.jpg', NULL, NULL, '2004-11-29 09:17:36', '0000-00-00 00:00:00', NULL, 0, 0);
INSERT INTO `content` VALUES (101460, 100012, 101386, 0, 'pic37.jpg', NULL, NULL, '2004-11-29 09:17:36', '0000-00-00 00:00:00', NULL, 0, 0);
INSERT INTO `content` VALUES (101462, 100012, 101386, 0, 'pic38.jpg', NULL, NULL, '2004-11-29 09:17:36', '0000-00-00 00:00:00', NULL, 0, 0);
INSERT INTO `content` VALUES (101464, 100012, 101386, 0, 'pic39.jpg', NULL, NULL, '2004-11-29 09:17:36', '0000-00-00 00:00:00', NULL, 0, 0);
INSERT INTO `content` VALUES (101466, 100012, 101386, 0, 'pic40.jpg', NULL, NULL, '2004-11-29 09:17:36', '0000-00-00 00:00:00', NULL, 0, 0);
INSERT INTO `content` VALUES (101468, 100012, 101386, 0, 'pic41.jpg', NULL, NULL, '2004-11-29 09:17:37', '0000-00-00 00:00:00', NULL, 0, 0);
INSERT INTO `content` VALUES (101754, 100012, 101749, 0, 'billede_presse_underside.jpg', '', '', '2004-12-08 13:08:56', '0000-00-00 00:00:00', NULL, 0, 0);
INSERT INTO `content` VALUES (101756, 100012, 101749, 0, 'common errors.gif', '', '', '2004-12-08 13:18:29', '0000-00-00 00:00:00', NULL, 0, 0);
INSERT INTO `content` VALUES (101764, 100012, 101749, 0, 'installation.gif', '', '', '2004-12-08 13:32:18', '0000-00-00 00:00:00', NULL, 0, 0);
INSERT INTO `content` VALUES (101776, 100012, 101749, 0, 'team.png', '', '', '2004-12-08 13:45:41', '0000-00-00 00:00:00', NULL, 0, 0);
INSERT INTO `content` VALUES (101778, 100012, 101749, 0, 'Tour', '', '', '2004-12-08 13:09:24', '0000-00-00 00:00:00', NULL, 0, 0);
INSERT INTO `content` VALUES (102481, 100012, 101386, 100028, 'pic41.jpg', '', '', '2004-12-23 22:13:24', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (102476, 100012, 101386, 100028, 'pic40.jpg', '', '', '2004-12-23 22:13:22', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (102471, 100012, 101386, 100028, 'pic39.jpg', '', '', '2004-12-23 22:13:21', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (102466, 100012, 101386, 100028, 'pic38.jpg', '', '', '2004-12-23 22:13:19', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (102461, 100012, 101386, 100028, 'pic37.jpg', '', '', '2004-12-23 22:13:17', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (102456, 100012, 101386, 100028, 'pic36.jpg', '', '', '2004-12-23 22:13:16', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (102451, 100012, 101386, 100028, 'pic34.jpg', '', '', '2004-12-23 22:13:13', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (102446, 100012, 101386, 100028, 'pic35.jpg', '', '', '2004-12-23 22:13:12', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (102441, 100012, 101386, 100028, 'pic33.jpg', '', '', '2004-12-23 22:13:10', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (102436, 100012, 101386, 100028, 'pic32.jpg', '', '', '2004-12-23 22:13:09', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (102431, 100012, 101386, 100028, 'pic31.jpg', '', '', '2004-12-23 22:13:08', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (102426, 100012, 101386, 100028, 'pic30.jpg', '', '', '2004-12-23 22:13:07', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (102421, 100012, 101386, 100028, 'pic28.jpg', '', '', '2004-12-23 22:13:06', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (102416, 100012, 101386, 100028, 'pic27.jpg', '', '', '2004-12-23 22:13:04', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (102411, 100012, 101386, 100028, 'pic26.jpg', '', '', '2004-12-23 22:13:03', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (102406, 100012, 101386, 100028, 'pic25.jpg', '', '', '2004-12-23 22:13:02', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (102401, 100012, 101386, 100028, 'pic24.jpg', '', '', '2004-12-23 22:13:00', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (102396, 100012, 101386, 100028, 'pic23.jpg', '', '', '2004-12-23 22:12:59', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (102391, 100012, 101386, 100028, 'pic22.jpg', '', '', '2004-12-23 22:12:58', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (102386, 100012, 101386, 100028, 'pic17.jpg', '', '', '2004-12-23 22:12:57', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (102378, 100012, 101386, 100028, 'pic20.jpg', '', '', '2004-12-23 22:12:54', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (102373, 100012, 101386, 100028, 'pic19.jpg', '', '', '2004-12-23 22:12:53', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (102368, 100012, 101386, 100028, 'pic18.jpg', '', '', '2004-12-23 22:12:52', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (102363, 100012, 101386, 100028, 'pic16.jpg', '', '', '2004-12-23 22:12:51', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (102358, 100012, 101386, 100028, 'pic15.jpg', '', '', '2004-12-23 22:12:50', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (102353, 100012, 101386, 100028, 'pic14.jpg', '', '', '2004-12-23 22:12:48', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (102348, 100012, 101386, 100028, 'pic13.jpg', '', '', '2004-12-23 22:12:47', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (102343, 100012, 101386, 100028, 'pic12.jpg', '', '', '2004-12-23 22:12:45', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (102338, 100012, 101386, 100028, 'pic11.jpg', '', '', '2004-12-23 22:12:44', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (102333, 100012, 101386, 100028, 'pic10.jpg', '', '', '2004-12-23 22:12:42', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (102328, 100012, 101386, 100028, 'pic09.jpg', '', '', '2004-12-23 22:12:40', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (102323, 100012, 101386, 100028, 'pic08.jpg', '', '', '2004-12-23 22:12:39', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (102318, 100012, 101386, 100028, 'pic07.jpg', '', '', '2004-12-23 22:12:37', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (102313, 100012, 101386, 100028, 'pic05.jpg', '', '', '2004-12-23 22:12:36', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (102308, 100012, 101386, 100028, 'pic04.jpg', '', '', '2004-12-23 22:12:35', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (102303, 100012, 101386, 100028, 'pic03.jpg', '', '', '2004-12-23 22:12:33', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (102298, 100012, 101386, 100028, 'pic02.jpg', '', '', '2004-12-23 22:12:32', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (102294, 100012, 101386, 100028, 'pic01.jpg', '', '', '2004-12-23 22:12:31', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (102022, 100012, 101749, 100028, 'Tour', '', '', '2004-12-23 22:11:53', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (101940, 100012, 101749, 100028, 'installation.gif', '', '', '2004-12-23 22:11:36', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (101930, 100012, 101749, 100028, 'common errors.gif', '', '', '2004-12-23 22:11:34', '0000-00-00 00:00:00', 'Administrator', 0, 10);
INSERT INTO `content` VALUES (101894, 100012, 101209, 100020, 'GPL', '', '', '2004-12-23 22:11:18', '0000-00-00 00:00:00', 'Administrator', 0, 10);

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `content_variations`
#

DROP TABLE IF EXISTS `content_variations`;
CREATE TABLE `content_variations` (
  `CID` bigint(20) NOT NULL default '0',
  `VARIATION_ID` bigint(20) NOT NULL default '0',
  `FK_ID` bigint(20) NOT NULL default '0',
  `DELETED` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`CID`,`VARIATION_ID`)
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `content_variations`
#

INSERT INTO `content_variations` VALUES (100172, 1, 100173, 0);
INSERT INTO `content_variations` VALUES (100174, 1, 100175, 0);
INSERT INTO `content_variations` VALUES (101210, 1, 101211, 0);
INSERT INTO `content_variations` VALUES (101375, 1, 101374, 0);
INSERT INTO `content_variations` VALUES (101377, 1, 101376, 0);
INSERT INTO `content_variations` VALUES (101379, 1, 101378, 0);
INSERT INTO `content_variations` VALUES (101381, 1, 101380, 0);
INSERT INTO `content_variations` VALUES (101388, 1, 101387, 0);
INSERT INTO `content_variations` VALUES (101390, 1, 101389, 0);
INSERT INTO `content_variations` VALUES (101392, 1, 101391, 0);
INSERT INTO `content_variations` VALUES (101394, 1, 101393, 0);
INSERT INTO `content_variations` VALUES (101396, 1, 101395, 0);
INSERT INTO `content_variations` VALUES (101398, 1, 101397, 0);
INSERT INTO `content_variations` VALUES (101400, 1, 101399, 0);
INSERT INTO `content_variations` VALUES (101402, 1, 101401, 0);
INSERT INTO `content_variations` VALUES (101404, 1, 101403, 0);
INSERT INTO `content_variations` VALUES (101406, 1, 101405, 0);
INSERT INTO `content_variations` VALUES (101408, 1, 101407, 0);
INSERT INTO `content_variations` VALUES (101410, 1, 101409, 0);
INSERT INTO `content_variations` VALUES (101412, 1, 101411, 0);
INSERT INTO `content_variations` VALUES (101414, 1, 101413, 0);
INSERT INTO `content_variations` VALUES (101416, 1, 101415, 0);
INSERT INTO `content_variations` VALUES (101418, 1, 101417, 0);
INSERT INTO `content_variations` VALUES (101420, 1, 101419, 0);
INSERT INTO `content_variations` VALUES (101422, 1, 101421, 0);
INSERT INTO `content_variations` VALUES (101424, 1, 101423, 0);
INSERT INTO `content_variations` VALUES (101426, 1, 101425, 0);
INSERT INTO `content_variations` VALUES (101428, 1, 101427, 0);
INSERT INTO `content_variations` VALUES (101430, 1, 101429, 0);
INSERT INTO `content_variations` VALUES (101432, 1, 101431, 0);
INSERT INTO `content_variations` VALUES (101434, 1, 101433, 0);
INSERT INTO `content_variations` VALUES (101436, 1, 101435, 0);
INSERT INTO `content_variations` VALUES (101438, 1, 101437, 0);
INSERT INTO `content_variations` VALUES (101440, 1, 101439, 0);
INSERT INTO `content_variations` VALUES (101442, 1, 101441, 0);
INSERT INTO `content_variations` VALUES (101444, 1, 101443, 0);
INSERT INTO `content_variations` VALUES (101446, 1, 101445, 0);
INSERT INTO `content_variations` VALUES (101448, 1, 101447, 0);
INSERT INTO `content_variations` VALUES (101450, 1, 101449, 0);
INSERT INTO `content_variations` VALUES (101452, 1, 101451, 0);
INSERT INTO `content_variations` VALUES (101454, 1, 101453, 0);
INSERT INTO `content_variations` VALUES (101456, 1, 101455, 0);
INSERT INTO `content_variations` VALUES (101458, 1, 101457, 0);
INSERT INTO `content_variations` VALUES (101460, 1, 101459, 0);
INSERT INTO `content_variations` VALUES (101462, 1, 101461, 0);
INSERT INTO `content_variations` VALUES (101464, 1, 101463, 0);
INSERT INTO `content_variations` VALUES (101466, 1, 101465, 0);
INSERT INTO `content_variations` VALUES (101468, 1, 101467, 0);
INSERT INTO `content_variations` VALUES (101754, 1, 101753, 0);
INSERT INTO `content_variations` VALUES (101756, 1, 101755, 0);
INSERT INTO `content_variations` VALUES (101764, 1, 101763, 0);
INSERT INTO `content_variations` VALUES (101776, 1, 101775, 0);
INSERT INTO `content_variations` VALUES (101778, 1, 101777, 0);
INSERT INTO `content_variations` VALUES (102481, 1, 102482, 0);
INSERT INTO `content_variations` VALUES (102476, 1, 102477, 0);
INSERT INTO `content_variations` VALUES (102471, 1, 102472, 0);
INSERT INTO `content_variations` VALUES (102466, 1, 102467, 0);
INSERT INTO `content_variations` VALUES (102461, 1, 102462, 0);
INSERT INTO `content_variations` VALUES (102456, 1, 102457, 0);
INSERT INTO `content_variations` VALUES (102451, 1, 102452, 0);
INSERT INTO `content_variations` VALUES (102446, 1, 102447, 0);
INSERT INTO `content_variations` VALUES (102441, 1, 102442, 0);
INSERT INTO `content_variations` VALUES (102436, 1, 102437, 0);
INSERT INTO `content_variations` VALUES (102431, 1, 102432, 0);
INSERT INTO `content_variations` VALUES (102426, 1, 102427, 0);
INSERT INTO `content_variations` VALUES (102421, 1, 102422, 0);
INSERT INTO `content_variations` VALUES (102416, 1, 102417, 0);
INSERT INTO `content_variations` VALUES (102411, 1, 102412, 0);
INSERT INTO `content_variations` VALUES (102406, 1, 102407, 0);
INSERT INTO `content_variations` VALUES (102401, 1, 102402, 0);
INSERT INTO `content_variations` VALUES (102396, 1, 102397, 0);
INSERT INTO `content_variations` VALUES (102391, 1, 102392, 0);
INSERT INTO `content_variations` VALUES (102386, 1, 102387, 0);
INSERT INTO `content_variations` VALUES (102378, 1, 102379, 0);
INSERT INTO `content_variations` VALUES (102373, 1, 102374, 0);
INSERT INTO `content_variations` VALUES (102368, 1, 102369, 0);
INSERT INTO `content_variations` VALUES (102363, 1, 102364, 0);
INSERT INTO `content_variations` VALUES (102358, 1, 102359, 0);
INSERT INTO `content_variations` VALUES (102353, 1, 102354, 0);
INSERT INTO `content_variations` VALUES (102348, 1, 102349, 0);
INSERT INTO `content_variations` VALUES (102343, 1, 102344, 0);
INSERT INTO `content_variations` VALUES (102338, 1, 102339, 0);
INSERT INTO `content_variations` VALUES (102333, 1, 102334, 0);
INSERT INTO `content_variations` VALUES (102328, 1, 102329, 0);
INSERT INTO `content_variations` VALUES (102323, 1, 102324, 0);
INSERT INTO `content_variations` VALUES (102318, 1, 102319, 0);
INSERT INTO `content_variations` VALUES (102313, 1, 102314, 0);
INSERT INTO `content_variations` VALUES (102308, 1, 102309, 0);
INSERT INTO `content_variations` VALUES (102303, 1, 102304, 0);
INSERT INTO `content_variations` VALUES (102298, 1, 102299, 0);
INSERT INTO `content_variations` VALUES (102294, 1, 102295, 0);
INSERT INTO `content_variations` VALUES (102022, 1, 102023, 0);
INSERT INTO `content_variations` VALUES (101940, 1, 101941, 0);
INSERT INTO `content_variations` VALUES (101930, 1, 101931, 0);
INSERT INTO `content_variations` VALUES (101894, 1, 101895, 0);

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `dig_engine`
#

DROP TABLE IF EXISTS `dig_engine`;
CREATE TABLE `dig_engine` (
  `spider_id` mediumint(9) NOT NULL default '0',
  `key_id` mediumint(9) NOT NULL default '0',
  `weight` smallint(4) NOT NULL default '0',
  KEY `key_id` (`key_id`)
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `dig_engine`
#


# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `dig_excludes`
#

DROP TABLE IF EXISTS `dig_excludes`;
CREATE TABLE `dig_excludes` (
  `ex_id` mediumint(11) NOT NULL auto_increment,
  `ex_site_id` mediumint(9) default NULL,
  `ex_path` text NOT NULL,
  PRIMARY KEY  (`ex_id`),
  UNIQUE KEY `ex_id` (`ex_id`),
  KEY `ex_site_id` (`ex_site_id`)
) TYPE=MyISAM CHARSET=latin1 AUTO_INCREMENT=1 ;

#
# Daten für Tabelle `dig_excludes`
#


# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `dig_keywords`
#

DROP TABLE IF EXISTS `dig_keywords`;
CREATE TABLE `dig_keywords` (
  `key_id` mediumint(9) NOT NULL auto_increment,
  `twoletters` char(2) NOT NULL default '',
  `keyword` varchar(64) NOT NULL default '',
  PRIMARY KEY  (`key_id`),
  UNIQUE KEY `key_id` (`key_id`),
  UNIQUE KEY `keyword` (`keyword`),
  UNIQUE KEY `key_id_2` (`key_id`),
  KEY `twoletters` (`twoletters`)
) TYPE=MyISAM CHARSET=latin1 AUTO_INCREMENT=17416 ;

#
# Daten für Tabelle `dig_keywords`
#


# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `dig_logs`
#

DROP TABLE IF EXISTS `dig_logs`;
CREATE TABLE `dig_logs` (
  `l_id` mediumint(9) NOT NULL auto_increment,
  `l_includes` varchar(255) NOT NULL default '',
  `l_excludes` varchar(127) default NULL,
  `l_num` mediumint(9) default NULL,
  `l_mode` char(1) default NULL,
  `l_ts` timestamp NOT NULL,
  `l_time` float NOT NULL default '0',
  PRIMARY KEY  (`l_id`),
  UNIQUE KEY `l_id` (`l_id`),
  KEY `l_includes` (`l_includes`),
  KEY `l_excludes` (`l_excludes`)
) TYPE=MyISAM CHARSET=latin1 AUTO_INCREMENT=1 ;

#
# Daten für Tabelle `dig_logs`
#


# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `dig_sites`
#

DROP TABLE IF EXISTS `dig_sites`;
CREATE TABLE `dig_sites` (
  `site_id` mediumint(9) NOT NULL auto_increment,
  `site_url` varchar(127) NOT NULL default '',
  `upddate` timestamp NOT NULL,
  `username` varchar(32) default NULL,
  `password` varchar(32) default NULL,
  `port` smallint(6) default NULL,
  `locked` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`site_id`),
  UNIQUE KEY `site_id` (`site_id`),
  UNIQUE KEY `site_id_2` (`site_id`)
) TYPE=MyISAM CHARSET=latin1 AUTO_INCREMENT=3 ;

#
# Daten für Tabelle `dig_sites`
#


# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `dig_spider`
#

DROP TABLE IF EXISTS `dig_spider`;
CREATE TABLE `dig_spider` (
  `spider_id` mediumint(9) NOT NULL auto_increment,
  `file` varchar(127) NOT NULL default '',
  `first_words` text NOT NULL,
  `upddate` timestamp NOT NULL,
  `md5` varchar(50) default NULL,
  `site_id` mediumint(9) NOT NULL default '0',
  `path` varchar(127) NOT NULL default '',
  `num_words` int(11) NOT NULL default '1',
  `last_modified` timestamp NOT NULL,
  `filesize` int(11) NOT NULL default '0',
  PRIMARY KEY  (`spider_id`),
  UNIQUE KEY `spider_id` (`spider_id`),
  UNIQUE KEY `spider_id_2` (`spider_id`),
  KEY `site_id` (`site_id`)
) TYPE=MyISAM CHARSET=latin1 AUTO_INCREMENT=1361 ;

#
# Daten für Tabelle `dig_spider`
#


# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `dig_tempspider`
#

DROP TABLE IF EXISTS `dig_tempspider`;
CREATE TABLE `dig_tempspider` (
  `file` text NOT NULL,
  `id` mediumint(11) NOT NULL auto_increment,
  `level` tinyint(6) NOT NULL default '0',
  `path` text NOT NULL,
  `site_id` mediumint(9) NOT NULL default '0',
  `indexed` tinyint(1) NOT NULL default '0',
  `upddate` timestamp NOT NULL,
  `error` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `id_2` (`id`),
  KEY `site_id` (`site_id`),
  KEY `site_id_2` (`site_id`)
) TYPE=MyISAM CHARSET=latin1 AUTO_INCREMENT=1 ;

#
# Daten für Tabelle `dig_tempspider`
#


# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `groups`
#

DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `GROUP_ID` bigint(20) NOT NULL default '0',
  `GROUP_NAME` varchar(32) NOT NULL default '',
  `DESCRIPTION` varchar(255) default NULL,
  PRIMARY KEY  (`GROUP_ID`)
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `groups`
#

INSERT INTO `groups` VALUES (1, 'System', 'internal use');

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `internal_resources`
#

DROP TABLE IF EXISTS `internal_resources`;
CREATE TABLE `internal_resources` (
  `RESID` varchar(32) NOT NULL default '',
  `LANGID` char(3) NOT NULL default '',
  `VALUE` text,
  `TOOLTIP` text,
  PRIMARY KEY  (`RESID`,`LANGID`)
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `internal_resources`
#

INSERT INTO `internal_resources` VALUES ('SEARCH_EXPIRED_ARTICLES', 'DE', 'Zurückgezogene Artikel', '');
INSERT INTO `internal_resources` VALUES ('ROLE_PERMISSION', 'DE', 'Rollen-Berechtigungen bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('ROLE_GENERAL', 'DE', 'Allgemeine Rollen-Daten bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('PREV_AVAIL', 'DE', 'Sie haben ein Objekt ausgewählt. Eine Vorschau wird nach dem Speichern verüfgbar sein.', '');
INSERT INTO `internal_resources` VALUES ('OBJLAUNCH_SUCCESS', 'DE', 'Das Objekt wurde erfolgreich veröffentlicht', '');
INSERT INTO `internal_resources` VALUES ('NOT_SPECIFIED', 'DE', 'Alle Typen', '');
INSERT INTO `internal_resources` VALUES ('NO_OBJ', 'DE', 'Kein Objekt ausgewählt.', '');
INSERT INTO `internal_resources` VALUES ('NOT_SELECTED', 'DE', 'Kein Element ausgewählt.', '');
INSERT INTO `internal_resources` VALUES ('MT_SYNC_CL', 'DE', 'Cluster synchronisieren', '');
INSERT INTO `internal_resources` VALUES ('MULTIPAGE', 'DE', 'Multipage', '');
INSERT INTO `internal_resources` VALUES ('MH_GLOSSARY', 'DE', 'Glossar', '');
INSERT INTO `internal_resources` VALUES ('LEAVE_EMPTY', 'DE', 'frei lassen', '');
INSERT INTO `internal_resources` VALUES ('INSTANCES_CREATED', 'DE', 'Neue Instanzen des Elements wurden erzeugt.', '');
INSERT INTO `internal_resources` VALUES ('KEEP_CLUSTER', 'DE', 'ursprünglichen Cluster beibehalten', '');
INSERT INTO `internal_resources` VALUES ('HIDE', 'DE', 'verstecken', '');
INSERT INTO `internal_resources` VALUES ('HELP_VARIATION', 'DE', 'Inhalte können in verschiedenen Variationen vorliegen. Variationen können z.B. verschiedene Sprachen oder unterschiedliche Inhaltsprofile darstellen.', '');
INSERT INTO `internal_resources` VALUES ('HELP_SYNCCL', 'DE', 'Eine Einrichtung zur Synchronisation von Clustern, nachdem eine Cluster-Vorlage verändert wurde.', '');
INSERT INTO `internal_resources` VALUES ('HELP_PURGE', 'DE', 'Löscht überflüssige Daten aus der Datenbank', '');
INSERT INTO `internal_resources` VALUES ('HELP_DW', 'DE', 'Erzeugt eine Konfigurations-Datei für das N/X Dreamweaver-PlugIn. Mit Hilfe dieses Plug-Ins können N/X-Vorlagen benutzerfreundlich mit Dreamweaver entwickelt werden.', '');
INSERT INTO `internal_resources` VALUES ('HELP_BACKUP', 'DE', 'Die untenstehende Liste zeigt eine Liste von Sicherungen an. Sie können hier einzelne Sicherungen löschen. Um eine Sicherung zurückzuspielen, müssen Sie sich manuell auf Ihrem Server anmelden und die Dateien selbst wiederherstellen', '');
INSERT INTO `internal_resources` VALUES ('CONFIRM_UNSAVED_CHANGES', 'DE', 'Note: Unsaved changes will be lost if you proceed. If you have already edited something, you may cancel now and save your work. Proceed ?', '');
INSERT INTO `internal_resources` VALUES ('GOTO_CL', 'DE', 'Gehe zu Cluster', '');
INSERT INTO `internal_resources` VALUES ('FIND_OBJ', 'DE', 'Finde Objekt', '');
INSERT INTO `internal_resources` VALUES ('EXPL_SEL_SPM', 'DE', 'Bitte wählen Sie eine Seiten-Vorlage aus.', '');
INSERT INTO `internal_resources` VALUES ('ENDTIME', 'DE', 'Endzeit', '');
INSERT INTO `internal_resources` VALUES ('EXPL_SEL_CH', 'DE', 'Bitte wählen Sie einen Kanal.', '');
INSERT INTO `internal_resources` VALUES ('ENDATE', 'DE', 'Enddatum', '');
INSERT INTO `internal_resources` VALUES ('DELETE_PAGE', 'DE', 'Seite löschen', '');
INSERT INTO `internal_resources` VALUES ('DISABLE', 'DE', 'Deaktivieren', '');
INSERT INTO `internal_resources` VALUES ('DWEXT_CONTENTFIELDINFO', 'DE', 'Inhalts-Feld-Informationen erzeugen', '');
INSERT INTO `internal_resources` VALUES ('DWEXT_CONTENTFIELDINFO_MES', 'DE', 'erzeugt Inhalts-Feld-Informationen für Dreamweaver MX', '');
INSERT INTO `internal_resources` VALUES ('CLT', 'DE', 'Cluster-Vorlage', '');
INSERT INTO `internal_resources` VALUES ('CMPTYPE', 'DE', 'Verbund-Typ', '');
INSERT INTO `internal_resources` VALUES ('COPY_CLUSTER', 'DE', 'Cluster kopieren', '');
INSERT INTO `internal_resources` VALUES ('CLEAR', 'DE', 'Löschen', '');
INSERT INTO `internal_resources` VALUES ('CHANNEL_IMPORTARTICLES', 'DE', 'Artikel importieren', '');
INSERT INTO `internal_resources` VALUES ('CAL_BTO', 'DE', 'Zurück zur Übersicht', '');
INSERT INTO `internal_resources` VALUES ('AUTH_GROUP', 'DE', 'Autentifizierung', '');
INSERT INTO `internal_resources` VALUES ('ARTICLE_VARIATION_MISSING', 'DE', 'Variation dieses Artikels existiert noch nicht', '');
INSERT INTO `internal_resources` VALUES ('ARTICLE_IS_LIVE', 'DE', 'Artikel ist live', '');
INSERT INTO `internal_resources` VALUES ('ARTICLE_IS_EXPIRED', 'DE', 'Artikel ist abgelaufen', '');
INSERT INTO `internal_resources` VALUES ('ADD_LINK', 'DE', 'Link hinzufügen', '');
INSERT INTO `internal_resources` VALUES ('ADDITIONAL_LINK', 'DE', 'Zusätzlicher Link', '');
INSERT INTO `internal_resources` VALUES ('ADDITIONAL_IMAGE', 'DE', 'Zusätzliches Bild', '');
INSERT INTO `internal_resources` VALUES ('HELP_ACCESS', 'DE', 'Eine Einrichtung zum Erstellen und Verwalten von Benutzerprofilen in N/X', '');
INSERT INTO `internal_resources` VALUES ('NUM_OF_ART', 'DE', 'Anzahl Artikel (-1 = unendlich)', '');
INSERT INTO `internal_resources` VALUES ('ORDERART', 'DE', 'Sortierung von Artikeln', '');
INSERT INTO `internal_resources` VALUES ('ALL', 'DE', 'Alles', '');
INSERT INTO `internal_resources` VALUES ('READY_TO_USE', 'DE', 'Fertig zum Gebrauch', '');
INSERT INTO `internal_resources` VALUES ('CH_CAT2', 'DE', 'Kanal und Kategorie', '');
INSERT INTO `internal_resources` VALUES ('SEL_CHANNEL_CAT', 'DE', 'Kanal und Kategorie auswählen', '');
INSERT INTO `internal_resources` VALUES ('O_DBLINK_ADDWHERE', 'DE', 'Additional WHERE-clause', '');
INSERT INTO `internal_resources` VALUES ('NO_CONTENT', 'DE', 'Noch kein Inhalt eingegeben', '');
INSERT INTO `internal_resources` VALUES ('O_DBLINK_SRCHVALUE', 'DE', 'Search for value', '');
INSERT INTO `internal_resources` VALUES ('O_DBLINK_EXTERNALDB', 'DE', 'External Database', '');
INSERT INTO `internal_resources` VALUES ('CL_EXPIRE', 'DE', 'Cluster zurückziehen', '');
INSERT INTO `internal_resources` VALUES ('BACK_TO_CV', 'DE', 'Zurück zur Cluster-Übersicht', '');
INSERT INTO `internal_resources` VALUES ('CL_LAUNCH', 'DE', 'Cluster veröffentlichen', '');
INSERT INTO `internal_resources` VALUES ('CHANNEL_GRABMP', 'DE', 'grab from Multipage', '');
INSERT INTO `internal_resources` VALUES ('AR_EXPIRE', 'DE', 'Artikel zurückziehen', '');
INSERT INTO `internal_resources` VALUES ('HELP_PGN', 'DE', 'Plug-Ins erlauben Ihnen, N/X üher seine Standard-Funktionalitäten hinaus zu erweitern. Üblicherweise werden Plug-Ins dazu verwendet, neue Objekttypen zu den Standard-Typen Text und Bild hinzuzufügen.', '');
INSERT INTO `internal_resources` VALUES ('O_TEXT_NOBREAK', 'DE', 'Ignore New-Lines', '');
INSERT INTO `internal_resources` VALUES ('DEL_ARTICLE', 'DE', 'Möchten Sie diesen Artikel wirklich in allen Variationen löschen?', '');
INSERT INTO `internal_resources` VALUES ('AR_LAUNCH', 'DE', 'Artikel veröffentlichen', '');
INSERT INTO `internal_resources` VALUES ('CREATE_ARTICLE', 'DE', 'Neuen Artikel im Kanal erzeugen', '');
INSERT INTO `internal_resources` VALUES ('ED_PROPERTIES', 'DE', 'Eigenschaften bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('ED_CLT', 'DE', 'Cluster-Vorlage bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('NODE_ACCESS', 'DE', 'Zugriffsrechte für Root-Seite setzen', '');
INSERT INTO `internal_resources` VALUES ('BACK_TO_OVERVIEW', 'DE', 'Zurück zur Übersicht', '');
INSERT INTO `internal_resources` VALUES ('NEW_ARTICLE', 'DE', 'Neuer Artikel', '');
INSERT INTO `internal_resources` VALUES ('DESTROY_EXCLUSIVE_CONTENT', 'DE', 'Exklusive Inhalte löschen', '');
INSERT INTO `internal_resources` VALUES ('EDIT_ARTICLE', 'DE', 'Artikel bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('DESTROY_TREE', 'DE', 'Baum zerstören', '');
INSERT INTO `internal_resources` VALUES ('CONFIRM_DELETE', 'DE', 'Möchten Sie dieses Element wirklich löschen?', '');
INSERT INTO `internal_resources` VALUES ('HELP_ROLLOUT', 'DE', 'Rollout ist eine Einrichtung in N/X, mit der Sie Kopien eines Teils Ihrer Website erstellen und diese an anderer Stelle mit oder ohne alte Inhalte weiderverwenden können.', '');
INSERT INTO `internal_resources` VALUES ('CHANNEL', 'DE', 'Kanal', '');
INSERT INTO `internal_resources` VALUES ('CLT_SELECT', 'DE', 'Cluster-Vorlagen auswählen', '');
INSERT INTO `internal_resources` VALUES ('HELP_CHANNEL', 'DE', 'Themen-Kategorien für die Inhalte der von N/X erzeugten Artikel, z.B. Neuigkeiten, Personen', '');
INSERT INTO `internal_resources` VALUES ('CHANNELS', 'DE', 'Kanäle', '');
INSERT INTO `internal_resources` VALUES ('SEL_FILE', 'DE', 'Datei auswählen', '');
INSERT INTO `internal_resources` VALUES ('WZT_IMPORTING', 'DE', 'Daten werden importiert', '');
INSERT INTO `internal_resources` VALUES ('WZE_IMPORTING', 'DE', 'Das System hat versucht, die Daten zu importieren. Bitten überprüfen Sie den Status auf der rechten Seite.', '');
INSERT INTO `internal_resources` VALUES ('WZE_IMPORT_VAL', 'DE', 'Das System hat die Korrektheit der hochgeladenen XML-Datei überprüft. Im Bericht rechts finden Sie nähere Informationen.', '');
INSERT INTO `internal_resources` VALUES ('WZT_IMPORT_VAL', 'DE', 'Zusammenfassung des hochgeladenen XML', '');
INSERT INTO `internal_resources` VALUES ('WZE_IMPORT_FILE', 'DE', 'Bitte wählen Sie eine XML-Datei auf Ihrer Festplatte aus, die ins System geladen werden soll<br/><br/>Das System wird eine Überprüfung durchführen und den Status auf der rechten Seite ausgeben.', '');
INSERT INTO `internal_resources` VALUES ('WZT_IMPORT_FILE', 'DE', 'N/X-XML-Datei auswählen', '');
INSERT INTO `internal_resources` VALUES ('IMPORT_DATA', 'DE', 'N/X-XML-Daten importieren', '');
INSERT INTO `internal_resources` VALUES ('WZ_IMPORT_TITLE', 'DE', 'Dieser Assisten dient dem Import von Daten in N/X, die zuvor von einer anderen N/X-Installation exportiert wurden. Um eine Ressource erneut importieren zu können, müssen Sie sie zunächst löschen.', '');
INSERT INTO `internal_resources` VALUES ('EXPL_SEL_CLUSTER', 'DE', 'Nachdem Sie eine Cluster-Vorlage gewählt haben, erscheint eine Liste von Clustern, aus der Sie einen auswählen können.', '');
INSERT INTO `internal_resources` VALUES ('STEP', 'DE', 'Schritt', '');
INSERT INTO `internal_resources` VALUES ('NEXT', 'DE', 'Nächstes', '');
INSERT INTO `internal_resources` VALUES ('EXP_REPORT', 'DE', 'Exportiere folgende Daten', '');
INSERT INTO `internal_resources` VALUES ('EXPL_EXEC_EXPORT', 'DE', 'Das System erzeugt gerade eine XML-Datei für den Export..<br/><br/>In ein paar Sekunden wird ein PopUp erscheinen. Klicken Sie "Speichern", um die Daten auf Ihre Festplatte zu sichern.', '');
INSERT INTO `internal_resources` VALUES ('EXEC_EXPORT', 'DE', 'Quelle wird exportiert', '');
INSERT INTO `internal_resources` VALUES ('PAGE_TEMPLATE', 'DE', 'Seiten Vorlage', '');
INSERT INTO `internal_resources` VALUES ('WZT_SEL_EXP_RES', 'DE', 'Ressource für den Export auswählen', '');
INSERT INTO `internal_resources` VALUES ('WZT_DESCR', 'DE', 'Beschreibung hinzufügen', '');
INSERT INTO `internal_resources` VALUES ('WZT_DESCR_EXPL', 'DE', 'Sie sollten eine kurze Beschreibung zu den exportierten Daten hinzufügen.<br><br>Jeder, der die Daten importiert, wird leichter verstehen, was er importiert.', '');
INSERT INTO `internal_resources` VALUES ('CLUSTER', 'DE', 'Cluster', '');
INSERT INTO `internal_resources` VALUES ('CLUSTER_TEMPLATE', 'DE', 'Cluster-Vorlage', '');
INSERT INTO `internal_resources` VALUES ('WZE_EXPORT_TYPE', 'DE', 'Bitte wählen Sie rechts den Typ von Daten aus, den Sie exportieren möchten. Cluster speichern Inhalte. Wenn Sie Cluser exportieren, werden automatisch auch die zugehörigen Vorlagen exportiert. Cluster-Vorlagen sind Schemata, um Cluster zu erstellen. seiten-Vorlagen werden benutzt, um Seiten zu erstellen.', '');
INSERT INTO `internal_resources` VALUES ('WZT_EXPORT_TYPE', 'DE', 'Wählen Sie den Typ für den Export aus.', '');
INSERT INTO `internal_resources` VALUES ('WZ_EXPORT_TITLE', 'DE', 'Der Assistent dient zum Austausch von Clusern, Cluster-Vorlagen und Seiten-Vorlagen zwischen Ihrer und anderen N/X-Installationen. Der Assistent erzeugt eine XML-Datei, die Sie auf Ihre lokale Festplatte speichern und mit anderen N/X-Nutzern austauschen können.', '');
INSERT INTO `internal_resources` VALUES ('EXPORT_DATA', 'DE', 'Inhalts- und Vorlagen-Export-Assistent', '');
INSERT INTO `internal_resources` VALUES ('LAST_LAUNCHED_AT', 'DE', 'Zuletzt veröffentlicht am', '');
INSERT INTO `internal_resources` VALUES ('BY', 'DE', 'nach', '');
INSERT INTO `internal_resources` VALUES ('LAST_MOD_AT', 'DE', 'Zuletzt geändert am', '');
INSERT INTO `internal_resources` VALUES ('CREATED_AT', 'DE', 'Erstellt am', '');
INSERT INTO `internal_resources` VALUES ('CLUSTER_INFORMATION', 'DE', 'Informationen über diesen Datensatz', '');
INSERT INTO `internal_resources` VALUES ('TT_RSTCI', 'DE', 'Jede Seite in N/X besitzt einen Cluster. Duch Klicken auf "Cluster-Instanz zurücksetzen" können Sie der Seite einen neuen Cluster zuweisen und den alten entfernen.', '');
INSERT INTO `internal_resources` VALUES ('HELP_METATEMP', 'DE', 'Eine Meta-Schablone wird benutzt, um festzulegen, welche Metadaten-Felder eine Seite erhalten soll. Wenn Sie in einer Vorlage ein neues Metadaten-Feld erstellen, wird jede auf dieser Vorlage basierende Seite dieses Feld besitzen.', '');
INSERT INTO `internal_resources` VALUES ('NO_CLUSTER', 'DE', 'Es gibt keine Cluster', '');
INSERT INTO `internal_resources` VALUES ('USER_AGENT', 'DE', 'Agent verwenden', '');
INSERT INTO `internal_resources` VALUES ('HELP_CLB', 'DE', 'Ein Cluster ist eine Ansammlung von statischen und dynamischen Inhalts-Platzhaltern, die entweder von einem Entwickler oder einem Editor einer Website gefüllt werden. Die Grundstruktur in N/X besteht aus Daten-Clustern', '');
INSERT INTO `internal_resources` VALUES ('PROMPTDELETE', 'DE', 'Möchten Sie diesen Datensatz wirklich löschen? Diese Aktion kann nicht rückgängig gemacht werden!', '');
INSERT INTO `internal_resources` VALUES ('CREATENEW', 'DE', 'Ein neues Mitglied dieser Vorlage wurde mit untenstehenden Daten erstellt.', '');
INSERT INTO `internal_resources` VALUES ('SELECTONE', 'DE', 'Sie müssen hier eine Auswahl treffen!', '');
INSERT INTO `internal_resources` VALUES ('SAVESUCCESS', 'DE', 'Die Daten wurden erfolgreich in die Datenbank geschrieben.', '');
INSERT INTO `internal_resources` VALUES ('DELETESUCCESS', 'DE', 'Die unten aufgeführten Daten wurden erfolgreich aus der Datenbank gelöscht. Sie können nicht wiederhergestellt werden!', '');
INSERT INTO `internal_resources` VALUES ('SAVEERROR', 'DE', 'Während des Speicherns der Daten in die Datenbank ist ein Fehler aufgetreten. Bitte stellen Sie sicher, dass die Datenbank verbunden ist, oder benachrichtigen Sie Ihren Administrator.', '');
INSERT INTO `internal_resources` VALUES ('PROCERROR', 'DE', 'Während der Verarbeitung des Formulars ist ein Fehler aufgetreten. Bitte überprüfen Sie die markierten Felder und lesen Sie die dortigen Anweisungen für weitergehende Informationen.', '');
INSERT INTO `internal_resources` VALUES ('PWDTOOSHORT', 'DE', 'Das Passwort muss mindestens 6 Zeichen lang sein!', '');
INSERT INTO `internal_resources` VALUES ('PWDNOTMATCH', 'DE', 'Die von Ihnen eingegebene Passwörter stimmen nicht überein!', '');
INSERT INTO `internal_resources` VALUES ('DATEFORMAT', 'DE', 'Das Datumsformat ist nicht korrekt!', NULL);
INSERT INTO `internal_resources` VALUES ('WRONGDATE', 'DE', 'Das von Ihnen eingegebene Datum existiert nicht!', '');
INSERT INTO `internal_resources` VALUES ('NOTNUMBER', 'DE', 'Sie können in dieses Feld nur Zahlenwerte eingeben!', '');
INSERT INTO `internal_resources` VALUES ('MANDATORY', 'DE', 'Dieses Feld darf nicht leer sein!', '');
INSERT INTO `internal_resources` VALUES ('UNIQUE', 'DE', 'Dieses Feld muss eindeutig sein!', '');
INSERT INTO `internal_resources` VALUES ('STATUS', 'DE', 'Status:', '');
INSERT INTO `internal_resources` VALUES ('EMPTY', 'DE', '<leer>', '');
INSERT INTO `internal_resources` VALUES ('SELECT_CL', 'DE', 'Wählen Sie eine Cluster-Instanz aus', '');
INSERT INTO `internal_resources` VALUES ('SELECT_CI', 'DE', 'Wählen Sie ein Inhalts-Element aus', '');
INSERT INTO `internal_resources` VALUES ('CONFIG', 'DE', 'konfigurieren', '');
INSERT INTO `internal_resources` VALUES ('CONFIGURED', 'DE', 'Fertig zur Verwendung.', '');
INSERT INTO `internal_resources` VALUES ('NOTCONFIGURED', 'DE', 'Noch nicht konfiguriert.', '');
INSERT INTO `internal_resources` VALUES ('CHOOSEFILE', 'DE', 'Wählen Sie eine Datei aus.', '');
INSERT INTO `internal_resources` VALUES ('PREVIEW', 'DE', 'Vorschau', '');
INSERT INTO `internal_resources` VALUES ('ED_CONTENT', 'DE', 'Inhalt bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('ED_META', 'DE', 'META-Daten', '');
INSERT INTO `internal_resources` VALUES ('ED_DISPATCHER', 'DE', 'Benutzen Sie diese Schaltfläche, um zwischen der Bearbeitung der META-Daten und der Bearbeitung der Inhalte umherzuschlaten.', '');
INSERT INTO `internal_resources` VALUES ('ACTIVE_VARIATION', 'DE', 'Aktive Variation:', '');
INSERT INTO `internal_resources` VALUES ('NO_VARIATIONS', 'DE', 'Es wurden noch keine Variationen für dieses Objekt definiert.<br>Bitten Sie einen Entwickler, die Konfiguration des gewählten Elements zu überprüfen!', '');
INSERT INTO `internal_resources` VALUES ('SELECT_VARIATION', 'DE', 'Variation auswählen', '');
INSERT INTO `internal_resources` VALUES ('METATEMPLATE', 'DE', 'Zusätzliche META-Key-Vorlage', '');
INSERT INTO `internal_resources` VALUES ('POSITION', 'DE', 'Position', '');
INSERT INTO `internal_resources` VALUES ('DELETE', 'DE', 'Löschen', '');
INSERT INTO `internal_resources` VALUES ('TYPE', 'DE', 'Typ', '');
INSERT INTO `internal_resources` VALUES ('KEYWORDS', 'DE', 'Schlüsselwörter', '');
INSERT INTO `internal_resources` VALUES ('SELECTOBJECT', 'DE', 'Bitte wählen Sie eine Klasse aus und geben Sie eine Position und einen Namen an, um das Objekt zu erzeugen.<br>Geben Sie als Position 0 an, um das neue Objekt am Anfang einzufügen, 999, um es am Ende anzufügen und jede beliebige andere Numm', '');
INSERT INTO `internal_resources` VALUES ('CONTAINERNAME', 'DE', 'Vorlage', '');
INSERT INTO `internal_resources` VALUES ('DOWN', 'DE', 'Ab', '');
INSERT INTO `internal_resources` VALUES ('UP', 'DE', 'Auf', '');
INSERT INTO `internal_resources` VALUES ('EDIT', 'DE', 'Bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('DOSOMETHING', 'DE', 'Bitte wählen Sie aus, was Sie tun möchten. Sie können neue Elemente einfügen, bestehende Elemente bearbeiten oder löschen und die Reihenfolge bestehender Elemente verändern.', '');
INSERT INTO `internal_resources` VALUES ('DESCRIPTION', 'DE', 'Beschreibung', '');
INSERT INTO `internal_resources` VALUES ('NAME', 'DE', 'Name', '');
INSERT INTO `internal_resources` VALUES ('NEW', 'DE', 'Neue einfügen', '');
INSERT INTO `internal_resources` VALUES ('NO', 'DE', 'Nein', '');
INSERT INTO `internal_resources` VALUES ('YES', 'DE', 'Ja', '');
INSERT INTO `internal_resources` VALUES ('CANCEL', 'DE', 'Abbrechen', '');
INSERT INTO `internal_resources` VALUES ('COMMIT', 'DE', 'Übernehmen', '');
INSERT INTO `internal_resources` VALUES ('USER_PROFILE', 'DE', 'Mein Profil', '');
INSERT INTO `internal_resources` VALUES ('ERROR_SEL_ROLE', 'DE', 'Sie müssen mindestens eine Rolle auswählen!', '');
INSERT INTO `internal_resources` VALUES ('ERROR_SEL_GROUP', 'DE', 'Sie müssen eine Gruppe auswählen!', '');
INSERT INTO `internal_resources` VALUES ('USER_TO_GROUP', 'DE', 'User zur Gruppe hinzufügen', '');
INSERT INTO `internal_resources` VALUES ('ROLE_DESCRIPTION', 'DE', 'Beschreibung', '');
INSERT INTO `internal_resources` VALUES ('ROLE_FILTERMENU', 'DE', 'Rollen-Administration', '');
INSERT INTO `internal_resources` VALUES ('USER_PERMISSIONS', 'DE', 'Benutzer-Berechtigungen', '');
INSERT INTO `internal_resources` VALUES ('UP_INTRO', 'DE', 'Bitte wählen Sie die Gruppe und die Rollen in der Gruppe, die Sie diesem User zuweisen möchten.', '');
INSERT INTO `internal_resources` VALUES ('ROLE_LINK', 'DE', 'Rollen-Profile', '');
INSERT INTO `internal_resources` VALUES ('ROLE_HEAD', 'DE', 'Rollen-Profil', '');
INSERT INTO `internal_resources` VALUES ('ROLE_NAME', 'DE', 'Rollen-Name', '');
INSERT INTO `internal_resources` VALUES ('GROUP_FILTERMENU', 'DE', 'Gruppen-Administration', '');
INSERT INTO `internal_resources` VALUES ('GROUP_DESCRIPTIO', 'DE', 'Beschreibung', '');
INSERT INTO `internal_resources` VALUES ('GROUP_NAME', 'DE', 'Gruppen-Name', '');
INSERT INTO `internal_resources` VALUES ('USER_PERMGRID', 'DE', 'Berechtigungs-Gitter', '');
INSERT INTO `internal_resources` VALUES ('GROUP_LINK', 'DE', 'Gruppen-Profile', '');
INSERT INTO `internal_resources` VALUES ('GROUP_HEAD', 'DE', 'Gruppen-Profil', '');
INSERT INTO `internal_resources` VALUES ('USER_FILTERMENU', 'DE', 'Benutzer Administration', '');
INSERT INTO `internal_resources` VALUES ('USER_SETPERM', 'DE', 'Setzen Sie hier die User-Berechtigungen. Um einen User aus einer Gruppe zu entfernen, entfernen Sie einfach alle Gruppen von ihm.', '');
INSERT INTO `internal_resources` VALUES ('USER_EMAIL', 'DE', 'eMail', '');
INSERT INTO `internal_resources` VALUES ('USER_ACTIVE', 'DE', 'Account freigegeben', '');
INSERT INTO `internal_resources` VALUES ('PASSWORD', 'DE', 'Passwort', '');
INSERT INTO `internal_resources` VALUES ('FULL_NAME', 'DE', 'voller Name', '');
INSERT INTO `internal_resources` VALUES ('USER_LINK', 'DE', 'Benutzer-Profile', '');
INSERT INTO `internal_resources` VALUES ('USER_NAME', 'DE', 'Benutzername', '');
INSERT INTO `internal_resources` VALUES ('USER_HEAD', 'DE', 'Benutzer-Profil', '');
INSERT INTO `internal_resources` VALUES ('LOGIN_FAILED', 'DE', 'Die Login-Daten, die Sie eingegeben haben, konnten nicht verifiziert werden. Bitte versuchen Sie es erneut.', '');
INSERT INTO `internal_resources` VALUES ('V_EDIT', 'DE', 'Variationen bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('MT_BASE', 'DE', 'Grundlegende META-Daten', '');
INSERT INTO `internal_resources` VALUES ('MT_MODULE', 'DE', 'Inhaltstyp-spezifische META-Daten', '');
INSERT INTO `internal_resources` VALUES ('VARIATIONS', 'DE', 'Verfügbare Variationen', '');
INSERT INTO `internal_resources` VALUES ('V_NAME', 'DE', 'Name', '');
INSERT INTO `internal_resources` VALUES ('V_SHORT', 'DE', 'Kürzel', '');
INSERT INTO `internal_resources` VALUES ('MT_ADDITIONAL', 'DE', 'Zusätzliche META-Daten', '');
INSERT INTO `internal_resources` VALUES ('MT_DELETE', 'DE', 'Möchten Sie diesen Teil der Meta-Vorlage wirklich löschen? Alle Informationen, die im CMS in irgend ein mit diesem Teil verknüpften META-Eingabefeld eingegeben wurden, werden gelöscht. Die Daten können anschliessend nicht wiederhe', '');
INSERT INTO `internal_resources` VALUES ('MT_SCHEME', 'DE', 'Meta-Vorlagen-Schema bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('MT_PROPERTIES', 'DE', 'Meta-Vorlagen-Eigenschaften bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('METATEMPLATES', 'DE', 'Meta-Daten-Vorlagen', '');
INSERT INTO `internal_resources` VALUES ('R_PARENT', 'DE', 'übergeordneter Ordner', '');
INSERT INTO `internal_resources` VALUES ('R_DELFOLDER', 'DE', 'Ordner und alle untergeordneten Objekte löschen', '');
INSERT INTO `internal_resources` VALUES ('R_MOVEOBJECTS', 'DE', 'Alle Objekte zur nächst höheren Ebene verschieben', '');
INSERT INTO `internal_resources` VALUES ('R_FOLDERNOTEMPTY', 'DE', 'Der Ordner ist nicht leer, Sie können ihn also nicht löschen! Bitte überprüfen Sie alle Objekte und Cluster!', '');
INSERT INTO `internal_resources` VALUES ('R_DELFOLDERMES', 'DE', 'Sie sind im Begriff einen Ordner zu löschen. Bitte wählen Sie eine Aktion aus.', '');
INSERT INTO `internal_resources` VALUES ('R_DELETEFOLDER', 'DE', 'Ordner löschen', '');
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
INSERT INTO `internal_resources` VALUES ('O_DEL', 'DE', 'Objekt löschen', '');
INSERT INTO `internal_resources` VALUES ('O_DELMES', 'DE', 'Sie sind im Begriff ein Objekt zu löschen.<b>Beachten Sie dass hierbei alle Variationen und META-DATEN gelöscht werden!</b>', '');
INSERT INTO `internal_resources` VALUES ('O_PROPERTIES', 'DE', 'Objekt-Eigenschaften', '');
INSERT INTO `internal_resources` VALUES ('O_NAME', 'DE', 'Objekt-Name', '');
INSERT INTO `internal_resources` VALUES ('O_NEW', 'DE', 'Neues Objekt', '');
INSERT INTO `internal_resources` VALUES ('PG_UNINSTALLDELE', 'DE', 'Modul entfernen,<br> Alle zugehörigen Inhalte löschen.', '');
INSERT INTO `internal_resources` VALUES ('PG_UNINSTALLMES', 'DE', 'Sie sind im Begriff, ein Modul zu entfernen. Das Entfernen eines Moduls löscht nicht nur den Inhalts-Typ sondern löscht auch jedes einzelne Objekt, das in der Datenbank gespeichert ist. Die Deinstallation des Moduls wird alle(!) Daten dieses Mod', '');
INSERT INTO `internal_resources` VALUES ('PG_UNINSTALL', 'DE', 'PlugIn entfernen', '');
INSERT INTO `internal_resources` VALUES ('PG_INSTALL', 'DE', 'PlugIn installieren', '');
INSERT INTO `internal_resources` VALUES ('PG_TITLE', 'DE', 'PlugIns', '');
INSERT INTO `internal_resources` VALUES ('PG_NEWERINSTALLE', 'DE', 'Eine neuere Version des PlugIns ist bereits installiert!', '');
INSERT INTO `internal_resources` VALUES ('PG_ALREADYINSTAL', 'DE', 'Das PlugIn ist bereits installiert!', '');
INSERT INTO `internal_resources` VALUES ('PG_ERROR', 'DE', 'Während der Installation des PlugIns ist ein Fehler aufgetreten!', '');
INSERT INTO `internal_resources` VALUES ('PG_UPGRADED', 'DE', 'Das PlugIn wurde erfolgreich aktualisiert!', '');
INSERT INTO `internal_resources` VALUES ('PG_INSTALLED', 'DE', 'Das PlugIn wurde erfolgreich installiert!', '');
INSERT INTO `internal_resources` VALUES ('CLASS_WRONG', 'DE', 'Die von Ihnen angegebene Datei hat keine gültige Klassen-Signatur!', '');
INSERT INTO `internal_resources` VALUES ('PG_FILEWRONG', 'DE', 'Der von Ihnen eingegebene Dateiname konnte auf dem Server nicht gefunden werden!', '');
INSERT INTO `internal_resources` VALUES ('PG_CHOOSE', 'DE', 'PlugIn:   /plugin/', '');
INSERT INTO `internal_resources` VALUES ('CLT_MINCARD', 'DE', 'minimale Anzahl Instanzen', '');
INSERT INTO `internal_resources` VALUES ('CLT_MAXCARD', 'DE', 'maximale Anzahl Instanzen', '');
INSERT INTO `internal_resources` VALUES ('LINKED', 'DE', 'Verknüpft mit', '');
INSERT INTO `internal_resources` VALUES ('PG_INSTALLDESC', 'DE', 'Bitte stellen Sie sicher, dass Sie alle benötigten Dateien ins Verzeichnis kopiert haben, bevor Sie fortfahren. Geben Sie in das untenstehende Eingabefeld den korrekten Pfad zum PlugIn ein. Das System wird das PlugIn dann automatisch installieren.', '');
INSERT INTO `internal_resources` VALUES ('CLT_SCHEME', 'DE', 'Cluster-Vorlagen-Schema bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('CLTI_DELETE', 'DE', 'Möchten Sie dieses Element wirklich löschen? Sämtliche Instanzen dieses Elements werden ebenfalls gelöscht!', '');
INSERT INTO `internal_resources` VALUES ('CLT_DELMES', 'DE', 'Sie sind im Begriff eine Cluster-Vorlage zu löschen. Dies wird den Verlust aller(!) Ihnhalte zur Folge haben, die mit dieser Cluster-Vorlage erstellt wurden. Sind Sie sicher, dass Sie forfahren möchten?', '');
INSERT INTO `internal_resources` VALUES ('CLT_DELETE', 'DE', 'Cluster-Vorlage löschen', '');
INSERT INTO `internal_resources` VALUES ('CLT_NAME', 'DE', 'Cluster-Vorlagen-Name', '');
INSERT INTO `internal_resources` VALUES ('CLT_PROPERTIES', 'DE', 'Cluster-Vorlagen-Eigenschaften', '');
INSERT INTO `internal_resources` VALUES ('CLT_BROWSE', 'DE', 'Cluster-Vorlagen', '');
INSERT INTO `internal_resources` VALUES ('CLT_NEW', 'DE', 'Neue Cluster-Vorlage', '');
INSERT INTO `internal_resources` VALUES ('M_PGN', 'DE', 'Plugin-Kontrolle', '');
INSERT INTO `internal_resources` VALUES ('M_PURGE', 'DE', 'Datenbank bereinigen', '');
INSERT INTO `internal_resources` VALUES ('M_VAR', 'DE', 'Variationen', '');
INSERT INTO `internal_resources` VALUES ('M_UMAN', 'DE', 'Benutzer-Verwaltung', '');
INSERT INTO `internal_resources` VALUES ('M_CLTB', 'DE', 'Cluster-Vorlagen-Browser', '');
INSERT INTO `internal_resources` VALUES ('M_CLB', 'DE', 'Cluster-Browser', '');
INSERT INTO `internal_resources` VALUES ('M_LOGOUT', 'DE', 'Abmelden', '');
INSERT INTO `internal_resources` VALUES ('M_MYPROFILE', 'DE', 'Mein Profil', '');
INSERT INTO `internal_resources` VALUES ('M_MYPRT', 'DE', 'Meine Portale', '');
INSERT INTO `internal_resources` VALUES ('M_PRTMAN', 'DE', 'Portal-Manager', '');
INSERT INTO `internal_resources` VALUES ('M_ES', 'DE', 'Site Erkunden', '');
INSERT INTO `internal_resources` VALUES ('M_SPM', 'DE', 'Sitepage-Master', '');
INSERT INTO `internal_resources` VALUES ('M_INSTALLPLUGIN', 'DE', 'PlugIns', '');
INSERT INTO `internal_resources` VALUES ('SELECTEDOBJECT', 'DE', 'Derzeit ausgewähltes Inhalts-Element', '');
INSERT INTO `internal_resources` VALUES ('SELECTEDINSTANCE', 'DE', 'Ausgewählte Cluster-Instanz', '');
INSERT INTO `internal_resources` VALUES ('M_META', 'DE', 'Meta-Vorlagen', '');
INSERT INTO `internal_resources` VALUES ('M_BROWSER', 'DE', 'Objekt-Browser', '');
INSERT INTO `internal_resources` VALUES ('SEARCH', 'DE', 'Suche starten', '');
INSERT INTO `internal_resources` VALUES ('SEARCHIN', 'DE', 'Suchen nach', '');
INSERT INTO `internal_resources` VALUES ('SEARCHRESULTS', 'DE', 'Such-Ergebnisse, bitte treffen Sie Ihre Auswahl', '');
INSERT INTO `internal_resources` VALUES ('CONTENTTYPE', 'DE', 'Inhalts-Typ', '');
INSERT INTO `internal_resources` VALUES ('CONTENTITEM', 'DE', 'Inhalts-Element', '');
INSERT INTO `internal_resources` VALUES ('FOLDER', 'DE', 'Ordner', '');
INSERT INTO `internal_resources` VALUES ('SR_SELECTCLI', 'DE', 'Bitte wählen Sie eine Cluster-Vorlage. Anschliessend können Sie die zu verwendende Instanz der Vorlage auswählen.', '');
INSERT INTO `internal_resources` VALUES ('SR_SELECTCI', 'DE', 'Sie können hier nach einem beliebigen Inhalts-Element suchen. Wenn Sie ein Inhalts-Element selektieren möchten, wählen Sie es aus und klicken Sie die Aktualisieren-Schaltfläche! Wenn sie neuen Inhalt mit diesem Feld verbinden möch', '');
INSERT INTO `internal_resources` VALUES ('CLI', 'DE', 'Cluster-Instanz:', '');
INSERT INTO `internal_resources` VALUES ('CLI_NOTDELETED', 'DE', 'Diese Insatanz kann nicht gelöscht werden!', '');
INSERT INTO `internal_resources` VALUES ('CLI_DELETED', 'DE', 'Die Instanz wurde gelöscht!', '');
INSERT INTO `internal_resources` VALUES ('CLI_DELETEMES', 'DE', 'Möchten Sie diese Instanz wirklich löschen? Sie kann anschliessend nicht wiederhergestellt werden!', '');
INSERT INTO `internal_resources` VALUES ('CLI_DELETE', 'DE', 'Cluster-Mitglied löschen', '');
INSERT INTO `internal_resources` VALUES ('CLI_EDIT', 'DE', 'Cluster-Mitglied bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('TITLE', 'DE', 'Titel', '');
INSERT INTO `internal_resources` VALUES ('CL_NOTITLE', 'DE', 'Noch kein Titel angegeben', '');
INSERT INTO `internal_resources` VALUES ('PO_BROWSER', 'MND', 'Èë¿Úä¯ÀÀÆ÷', NULL);
INSERT INTO `internal_resources` VALUES ('PO_OWNER', 'MND', 'Ò³ÃæMaster', NULL);
INSERT INTO `internal_resources` VALUES ('PO_CRSUCCEEDED', 'MND', '³É¹¦´´½¨ÐÂÈë¿ÚÒ³Ãæ!', NULL);
INSERT INTO `internal_resources` VALUES ('PO_MYPORTAL', 'MND', 'ÎÒµÄÈë¿ÚÒ³Ãæ', NULL);
INSERT INTO `internal_resources` VALUES ('PO_EDIT', 'MND', '±à¼­Èë¿ÚÒ³Ãæ', NULL);
INSERT INTO `internal_resources` VALUES ('SP_BROWSE', 'MND', 'ä¯ÀÀÕ¾µãµØÍ¼', NULL);
INSERT INTO `internal_resources` VALUES ('SP_NEWPAGE', 'MND', 'Ôö¼ÓÕ¾µãÒ³Ãæ', NULL);
INSERT INTO `internal_resources` VALUES ('SP_NEWINSTANCE', 'MND', 'Ôö¼ÓÒ³Ãæ', NULL);
INSERT INTO `internal_resources` VALUES ('SP_IPROPERTIES', 'MND', 'Ò³ÃæÊôÐÔ', NULL);
INSERT INTO `internal_resources` VALUES ('SP_PROPERTIES', 'MND', 'Õ¾µãÒ³ÃæÊôÐÔ', NULL);
INSERT INTO `internal_resources` VALUES ('SP_DELMES', 'MND', 'ÄúÕý×¼±¸É¾³ýÕ¾µãÒ³Ãæ¡£Çë×¢Òâ£¬Õ¾µãÒ³ÃæµÄÊµÀýÒ²»á±»É¾³ý!', NULL);
INSERT INTO `internal_resources` VALUES ('SP_DELETE', 'MND', 'É¾³ýÕ¾µãÒ³Ãæ', NULL);
INSERT INTO `internal_resources` VALUES ('SP_PDELMES', 'MND', 'ÄúÕý×¼±¸É¾³ýÒ³Ãæ¡£Çë×¢Òâ£¬Ò³ÃæµÄÊµÀýÒ²»á±»É¾³ý!', NULL);
INSERT INTO `internal_resources` VALUES ('SP_PDELETE', 'MND', 'É¾³ýÒ³Ãæ', NULL);
INSERT INTO `internal_resources` VALUES ('SP_CONFIGURE', 'MND', 'ÅäÖÃÒ³Ãæ', NULL);
INSERT INTO `internal_resources` VALUES ('SP_CONFDESC', 'MND', 'Äú¿ÉÒÔ½«±¾Õ¾µãÒ³Ãæ¹ØÁªÖÁÒ»¸öÒÑ´æÔÚµÄ´ØµÄÀý³Ì£¬»òÕßÄúÒ²¿ÉÒÔ´´½¨Ò»¸öÐÂµÄÀý³Ì£¬Çë¾ö¶¨ÄúÏë×öÊ²Ã´¡£', NULL);
INSERT INTO `internal_resources` VALUES ('SP_LINK', 'MND', '¹ØÁªÖÁÒÑ´æÔÚµÄ´ØµÄÀý³Ì', NULL);
INSERT INTO `internal_resources` VALUES ('SP_CLNEW', 'MND', '´´½¨ÐÂµÄ´ØµÄÀý³Ì', NULL);
INSERT INTO `internal_resources` VALUES ('SP_EDIT', 'MND', '±à¼­Õ¾µãÒ³Ãæ', NULL);
INSERT INTO `internal_resources` VALUES ('SP_MENUPROPS', 'MND', '²Ëµ¥ÃûÓë°ïÖúÎÄ×Ö', NULL);
INSERT INTO `internal_resources` VALUES ('SP_MENUNAME', 'MND', '²Ëµ¥ÉÏµÄÃû³Æ', NULL);
INSERT INTO `internal_resources` VALUES ('SP_MENUHELP', 'MND', '²Ëµ¥ÉÏµÄ°ïÖúÎÄ×Ö', NULL);
INSERT INTO `internal_resources` VALUES ('SP_LAUNCHDATE', 'MND', '´Ó...¼¤»î', NULL);
INSERT INTO `internal_resources` VALUES ('SP_EXPIREDATE', 'MND', '´Ó...Ê§Ð§', NULL);
INSERT INTO `internal_resources` VALUES ('SP_LAUNCHDATES', 'MND', 'ÊµÊ±ÅäÖÃ', NULL);
INSERT INTO `internal_resources` VALUES ('SP_PREVIEW', 'MND', 'Ô¤ÀÀÒ³Ãæ', NULL);
INSERT INTO `internal_resources` VALUES ('SP_LAUNCH', 'MND', 'Æô¶¯Ò³Ãæ', NULL);
INSERT INTO `internal_resources` VALUES ('SP_EXPIRE', 'MND', 'Ê§Ð§Ò³Ãæ', NULL);
INSERT INTO `internal_resources` VALUES ('NOSPTITLE', 'MND', 'Æô¶¯Ò³ÃæÖ®Ç°Äú±ØÐë¶¨Òå²Ëµ¥ÉÏµÄÃû³Æ!', NULL);
INSERT INTO `internal_resources` VALUES ('SPM', 'MND', 'Õ¾µãÒ³ÃæMaster', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_EDIT', 'MND', '±à¼­Õ¾µãÒ³ÃæMaster', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_META', 'MND', 'META-KeyÄ£°å', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_VARIATIONS', 'MND', '¿ÉÏÔÊ¾µÄ±äÁ¿', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_TYPE', 'MND', 'Ò³ÃæÖÖÀà', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_CLUSTER', 'MND', '´ØÄ£°å', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_PATH', 'MND', 'Ä£°åÂ·¾¶', NULL);
INSERT INTO `internal_resources` VALUES ('CL_BROWSE', 'MND', 'ä¯ÀÀ´Ø', NULL);
INSERT INTO `internal_resources` VALUES ('CL_NEW', 'MND', 'ÐÂÀý³Ì', NULL);
INSERT INTO `internal_resources` VALUES ('CL_PROPERTIES', 'MND', 'Àý³ÌÊôÐÔ', NULL);
INSERT INTO `internal_resources` VALUES ('CL_DEL', 'MND', 'É¾³ýÀý³Ì', NULL);
INSERT INTO `internal_resources` VALUES ('CL_DELMES', 'MND', 'ÄúÈ·ÊµÏëÉ¾³ýÕâ¸ö´ØÀý³ÌÂð.ËùÓÐÄÚÈÝÊý¾Ý»á¶ªÊ§!', NULL);
INSERT INTO `internal_resources` VALUES ('CL_EDIT', 'MND', '±à¼­´ØÀý³Ì', NULL);
INSERT INTO `internal_resources` VALUES ('CL_CREATEINSTANC', 'MND', '´´½¨ÐÂÀý³Ì', NULL);
INSERT INTO `internal_resources` VALUES ('CL_CREATEINSMES', 'MND', 'ÈÔÓÐ¿Õ¼ä¿É´´½¨Õâ¸öÄÚÈÝ×Ö¶ÎµÄ¶îÍâÀý³Ì. Èç¹ûÄúÏë´´½¨ÁíÒ»¸öÀý³Ì£¬ÇëÔÚÏÂÃæµÄÎÄ×Ö¿òÖÐÊäÈë±êÌâ£¬²¢°´ÏÂCreat°´Å¥.', NULL);
INSERT INTO `internal_resources` VALUES ('CL_NOTITLE', 'MND', '»¹Î´¶¨Òå±êÌâ', NULL);
INSERT INTO `internal_resources` VALUES ('TITLE', 'MND', '±êÌâ', NULL);
INSERT INTO `internal_resources` VALUES ('CLI_EDIT', 'MND', '±à¼­´ØºÅ', NULL);
INSERT INTO `internal_resources` VALUES ('CLI_DELETE', 'MND', 'É¾³ý´ØºÅ', NULL);
INSERT INTO `internal_resources` VALUES ('CLI_DELETEMES', 'MND', 'ÄúÈ·ÊµÏëÉ¾³ýÕâ¸öÀý³ÌÂð. Ëü»áÓÀÔ¶Ê§È¥!', NULL);
INSERT INTO `internal_resources` VALUES ('CLI_DELETED', 'MND', 'Õâ¸öÀý³ÌÒÑ±»É¾³ý!', NULL);
INSERT INTO `internal_resources` VALUES ('CLI_NOTDELETED', 'MND', 'Õâ¸öÀý³Ì²»ÄÜ±»É¾³ý!', NULL);
INSERT INTO `internal_resources` VALUES ('CLI', 'MND', '´ØÀý³Ì:', NULL);
INSERT INTO `internal_resources` VALUES ('SR_SELECTCI', 'MND', 'Äú¿ÉËÑË÷ÈÎºÎÕâÀïµÄÄÚÈÝÌõÄ¿.Èç¹ûÄúÏëÑ¡¶¨Ò»¸öÄÚÈÝÌõÄ¿, ¿ÉÑ¡ÖÐËü²¢°´ÏÂ²¢°´ÏÂUpdate°´Å¥! Èç¹ûÄúÏë¹ØÁªÐÂÄÚÈÝÖÁÕâ¸ö×Ö¶Î, create the content in the Object Browser first.', NULL);
INSERT INTO `internal_resources` VALUES ('SR_SELECTCLI', 'MND', 'ÇëÑ¡ÔñÒ»¸ö´ØÄ£°å. È»ºóÄú¿ÉÑ¡ÔñÒ»¸öÄ£°åµÄÀý³ÌÀ´Ê¹ÓÃ.', NULL);
INSERT INTO `internal_resources` VALUES ('FOLDER', 'MND', 'ÎÄ¼þ¼Ð', NULL);
INSERT INTO `internal_resources` VALUES ('CONTENTTYPE', 'MND', 'ÄÚÈÝÀàÐÍ', NULL);
INSERT INTO `internal_resources` VALUES ('CONTENTITEM', 'MND', 'ÄÚÈÝÌõÄ¿', NULL);
INSERT INTO `internal_resources` VALUES ('SEARCH', 'MND', '¿ªÊ¼ËÑË÷', NULL);
INSERT INTO `internal_resources` VALUES ('SEARCHIN', 'MND', 'ËÑË÷', NULL);
INSERT INTO `internal_resources` VALUES ('SEARCHRESULTS', 'MND', 'ËÑË÷½á¹û£¬ÇëÑ¡Ôñ', NULL);
INSERT INTO `internal_resources` VALUES ('SELECTEDOBJECT', 'MND', 'µ±Ç°Ñ¡ÔñµÄÄÚÈÝÌõÄ¿', NULL);
INSERT INTO `internal_resources` VALUES ('SELECTEDINSTANCE', 'MND', 'Ñ¡Ôñ´ØÀý³Ì', NULL);
INSERT INTO `internal_resources` VALUES ('M_META', 'MND', 'MetaÄ£°å', NULL);
INSERT INTO `internal_resources` VALUES ('M_BROWSER', 'MND', 'Ä¿±êä¯ÀÀÆ÷', NULL);
INSERT INTO `internal_resources` VALUES ('M_INSTALLPLUGIN', 'MND', '²å¼þ', NULL);
INSERT INTO `internal_resources` VALUES ('M_ES', 'MND', 'Ì½Ë÷Õ¾µã', NULL);
INSERT INTO `internal_resources` VALUES ('M_SPM', 'MND', 'Õ¾µãÒ³ÃæMaster', NULL);
INSERT INTO `internal_resources` VALUES ('M_PRTMAN', 'MND', 'Èë¿Ú¹ÜÀíÆ÷', NULL);
INSERT INTO `internal_resources` VALUES ('M_MYPRT', 'MND', 'ÎÒµÄÈë¿Ú', NULL);
INSERT INTO `internal_resources` VALUES ('M_MYPROFILE', 'MND', 'ÎÒµÄ´«ÂÔ', NULL);
INSERT INTO `internal_resources` VALUES ('M_LOGOUT', 'MND', 'µÇ³ö', NULL);
INSERT INTO `internal_resources` VALUES ('M_CLB', 'MND', '´Øä¯ÀÀÆ÷', NULL);
INSERT INTO `internal_resources` VALUES ('M_CLTB', 'MND', '´ØÄ£°åä¯ÀÀÆ÷', NULL);
INSERT INTO `internal_resources` VALUES ('M_UMAN', 'MND', 'ÓÃ»§¹ÜÀí', NULL);
INSERT INTO `internal_resources` VALUES ('M_VAR', 'MND', '±äÁ¿', NULL);
INSERT INTO `internal_resources` VALUES ('M_PURGE', 'MND', '¾»»¯Êý¾Ý¿â', NULL);
INSERT INTO `internal_resources` VALUES ('M_PGN', 'MND', '²å¼þ¿ØÖÆ', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_NEW', 'MND', 'ÐÂ´ØÄ£°å', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_BROWSE', 'MND', 'ä¯ÀÀ´ØÄ£°å', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_NAME', 'MND', '´ØÄ£°åÃû³Æ', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_PROPERTIES', 'MND', '´ØÄ£°åÊôÐÔ', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_DELETE', 'MND', 'É¾³ý´ØÄ£°å', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_DELMES', 'MND', 'ÄúÕý×¼±¸É¾³ýÒ»¸ö´ØÄ£°å. Õâ»áµ¼ÖÂÔÚÄÇ¸ö´ØÄ£°åÉÏ´´½¨µÄËùÓÐ(!)ÄÚÈÝ¶ªÊ§. ÄúÈ·¶¨Òª¼ÌÐøÂð?', NULL);
INSERT INTO `internal_resources` VALUES ('CLTI_DELETE', 'MND', 'ÄúÊÇ·ñÕæÏëÉ¾³ýÕâ¸öÌõÄ¿. Õâ¸öÌõÄ¿µÄËùÓÐÀý³ÌÒ²»á¶ªÊ§!', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_SCHEME', 'MND', '±à¼­´ØÄ£°å·½°¸', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_MINCARD', 'MND', '×îÉÙÀý³ÌÊý', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_MAXCARD', 'MND', '×î´óÀý³ÌÊý', NULL);
INSERT INTO `internal_resources` VALUES ('LINKED', 'MND', '¹ØÁªÖÁ', NULL);
INSERT INTO `internal_resources` VALUES ('PG_INSTALLDESC', 'MND', 'ÇëÈ·¶¨ÄúÒÑ½«ËùÓÐ±ØÐèµÄÎÄ¼þ¸´ÖÆµ½Õâ¸öÎÄ¼þ¼Ð£¬·ñÔò²»ÄÜ³É¹¦. ÔÚÏÂÃæµÄÊäÈë¿òÖÐÊäÈë²å¼þµÄÕýÈ·Â·¾¶. ÏµÍ³¼´»á×Ô¶¯°²×°²å¼þ.', NULL);
INSERT INTO `internal_resources` VALUES ('PG_CHOOSE', 'MND', '²å¼þ: &nbsp; /plugin/', NULL);
INSERT INTO `internal_resources` VALUES ('PG_FILEWRONG', 'MND', 'ÔÚ·þÎñÆ÷ÉÏÕÒ²»µ½ÄúÊäÈëµÄÎÄ¼þÃû!', NULL);
INSERT INTO `internal_resources` VALUES ('CLASS_WRONG', 'MND', 'ÄúÖ¸¶¨µÄÎÄ¼þÃ»ÓÐºÏ·¨µÄÀàÐÍÇ©Ãû!', NULL);
INSERT INTO `internal_resources` VALUES ('PG_INSTALLED', 'MND', '³É¹¦°²×°²å¼þ!', NULL);
INSERT INTO `internal_resources` VALUES ('PG_UPGRADED', 'MND', '³É¹¦Éý¼¶²å¼þ!', NULL);
INSERT INTO `internal_resources` VALUES ('PG_ERROR', 'MND', '°²×°²å¼þÊ±ÓÐ´íÎó!', NULL);
INSERT INTO `internal_resources` VALUES ('PG_ALREADYINSTAL', 'MND', '²å¼þÒÑ±»°²×°!', NULL);
INSERT INTO `internal_resources` VALUES ('PG_NEWERINSTALLE', 'MND', 'ÒÑ¾­°²×°ÓÐÕâ¸ö²å¼þµÄÐÂ°æ±¾!', NULL);
INSERT INTO `internal_resources` VALUES ('PG_TITLE', 'MND', '²å¼þ', NULL);
INSERT INTO `internal_resources` VALUES ('PG_INSTALL', 'MND', '°²×°²å¼þ', NULL);
INSERT INTO `internal_resources` VALUES ('PG_UNINSTALL', 'MND', 'Ð¶ÔØ²å¼þ', NULL);
INSERT INTO `internal_resources` VALUES ('PG_UNINSTALLMES', 'MND', 'ÄúÕý×¼±¸Ð¶ÔØÒ»¸öÄ£¿é. Ð¶ÔØÒ»¸öÄ£¿é²»Ö»É¾³ýÄÚÈÝÀàÐÍ£¬Í¬Ê±Ò²É¾³ýÕâ¸öÀàÐÍ´¢´æÔÚÊý¾Ý¿âÖÐµÄÃ¿¸öµ¥¸öÄ¿±ê. Ð¶ÔØ½«»á¿Ï¶¨É¾³ýÕâ¸öÄ£¿éµÄËùÓÐ(!)Êý¾Ý!', NULL);
INSERT INTO `internal_resources` VALUES ('PG_UNINSTALLDELE', 'MND', 'Ð¶ÔØÄ£¿é,<br> É¾³ýËùÓÐ¶ÔÓ¦µÄÄÚÈÝ.', NULL);
INSERT INTO `internal_resources` VALUES ('O_NEW', 'MND', 'ÐÂÄ¿±ê', NULL);
INSERT INTO `internal_resources` VALUES ('O_NAME', 'MND', 'Ä¿±êÃû³Æ', NULL);
INSERT INTO `internal_resources` VALUES ('O_PROPERTIES', 'MND', 'Ä¿±êÊôÐÔ', NULL);
INSERT INTO `internal_resources` VALUES ('O_DELMES', 'MND', 'ÄúÕý×¼±¸É¾³ýÒ»¸öÄ¿±ê. <b>×¢Òâ»á¶ªÊ§ËùÓÐ±äÁ¿ÓëMETA-DATA!</b>', NULL);
INSERT INTO `internal_resources` VALUES ('O_DEL', 'MND', 'É¾³ýÄ¿±ê', NULL);
INSERT INTO `internal_resources` VALUES ('O_EDIT', 'MND', '±à¼­Ä¿±ê', NULL);
INSERT INTO `internal_resources` VALUES ('O_PREVIEW', 'MND', 'Ô¤ÀÀ', NULL);
INSERT INTO `internal_resources` VALUES ('O_TEXT', 'MND', 'ÎÄ±¾', NULL);
INSERT INTO `internal_resources` VALUES ('O_ALT', 'MND', 'ALT-Tag', NULL);
INSERT INTO `internal_resources` VALUES ('O_COPYRIGHT', 'MND', '°æÈ¨', NULL);
INSERT INTO `internal_resources` VALUES ('O_BROWSE', 'MND', 'ä¯ÀÀÄ¿±ê', NULL);
INSERT INTO `internal_resources` VALUES ('R_HOME', 'MND', '¿ªÊ¼', NULL);
INSERT INTO `internal_resources` VALUES ('R_NEWFOLDER', 'MND', 'ÐÂÎÄ¼þ¼Ð', NULL);
INSERT INTO `internal_resources` VALUES ('R_EDITFOLDER', 'MND', '±à¼­ÎÄ¼þ¼ÐÊôÐÔ', NULL);
INSERT INTO `internal_resources` VALUES ('R_FOLDERNAME', 'MND', 'ÎÄ¼þ¼ÐÃû', NULL);
INSERT INTO `internal_resources` VALUES ('R_DELETEFOLDER', 'MND', 'É¾³ýÎÄ¼þ¼Ð', NULL);
INSERT INTO `internal_resources` VALUES ('R_DELFOLDERMES', 'MND', 'ÄúÕý×¼±¸É¾³ýÒ»¸öÎÄ¼þ¼Ð.  ÇëÑ¡ÔñÒ»¸ö¶¯×÷.', NULL);
INSERT INTO `internal_resources` VALUES ('R_FOLDERNOTEMPTY', 'MND', 'ÎÄ¼þ¼Ð²»¿Õ. Òò´ËÄú²»ÄÜÉ¾³ýËü! Çë¼ì²éËùÓÐÄ¿±êÓë´Ø!', NULL);
INSERT INTO `internal_resources` VALUES ('R_DELFOLDER', 'MND', 'É¾³ýÎÄ¼þ¼ÐÓëËùÓÐ×ÓÄ¿±ê', NULL);
INSERT INTO `internal_resources` VALUES ('R_MOVEOBJECTS', 'MND', '½«ËùÓÐÄ¿±êÒÆÖÁ¸¸½áµã', NULL);
INSERT INTO `internal_resources` VALUES ('R_PARENT', 'MND', '¸¸ÎÄ¼þ¼Ð', NULL);
INSERT INTO `internal_resources` VALUES ('METATEMPLATES', 'MND', 'MetaÊý¾ÝÄ£°å', NULL);
INSERT INTO `internal_resources` VALUES ('MT_PROPERTIES', 'MND', '±à¼­MetaÄ£°åÊôÐÔ', NULL);
INSERT INTO `internal_resources` VALUES ('MT_SCHEME', 'MND', '±à¼­MetaÄ£°å·½°¸', NULL);
INSERT INTO `internal_resources` VALUES ('MT_DELETE', 'MND', 'ÄúÊÇ·ñÕæÏëÉ¾³ýmetaÄ£°åµÄÕâ¸ö²¿·Ö? ËùÓÐ¹ØÁªµ½Õâ¸ö²¿·ÖµÄÔÚCMS METAÊäÈëÖÐÊäÈëµÄÐÅÏ¢½«»á±»É¾³ý. Êý¾Ý»áÓÀÔ¶¶ªÊ§!', NULL);
INSERT INTO `internal_resources` VALUES ('MT_ADDITIONAL', 'MND', '¸½¼ÓµÄMETAÊý¾Ý', NULL);
INSERT INTO `internal_resources` VALUES ('MT_BASE', 'MND', '»ù±¾µÄMETAÊý¾Ý', NULL);
INSERT INTO `internal_resources` VALUES ('MT_MODULE', 'MND', 'ÄÚÈÝÀàÐÍÖ¸¶¨µÄMETAÊý¾Ý', NULL);
INSERT INTO `internal_resources` VALUES ('VARIATIONS', 'MND', '¿ÉÓÃµÄ±äÁ¿', NULL);
INSERT INTO `internal_resources` VALUES ('V_NAME', 'MND', 'Ãû³Æ', NULL);
INSERT INTO `internal_resources` VALUES ('V_SHORT', 'MND', 'Short-Tag', NULL);
INSERT INTO `internal_resources` VALUES ('V_EDIT', 'MND', '±à¼­±äÁ¿', NULL);
INSERT INTO `internal_resources` VALUES ('LOGIN_FAILED', 'MND', 'ÄúÊäÈëµÄµÇÂ¼Êý¾Ý²»ÄÜ±»ÑéÖ¤! ÇëÔÙÊÔÒ»±é.', NULL);
INSERT INTO `internal_resources` VALUES ('USER_HEAD', 'MND', 'ÓÃ»§´«ÂÔ', NULL);
INSERT INTO `internal_resources` VALUES ('USER_LINK', 'MND', 'ÓÃ»§´«ÂÔ', NULL);
INSERT INTO `internal_resources` VALUES ('USER_NAME', 'MND', 'ÓÃ»§Ãû', NULL);
INSERT INTO `internal_resources` VALUES ('FULL_NAME', 'MND', 'È«Ãû', NULL);
INSERT INTO `internal_resources` VALUES ('PASSWORD', 'MND', 'ÃÜÂë', NULL);
INSERT INTO `internal_resources` VALUES ('USER_EMAIL', 'MND', 'eMail', NULL);
INSERT INTO `internal_resources` VALUES ('USER_ACTIVE', 'MND', 'Ê¹ÕÊºÅ¿ÉÓÃ', NULL);
INSERT INTO `internal_resources` VALUES ('USER_FILTERMENU', 'MND', 'ÓÃ»§¹ÜÀí', NULL);
INSERT INTO `internal_resources` VALUES ('USER_SETPERM', 'MND', 'ÔÚÏÂÃæÉèÖÃÓÃ»§È¨ÏÞ. Òª´Ó×éÖÐÉ¾³ýÒ»¸öÓÃ»§, ½«Ëû´ÓËùÓÐµÄ×éÖÐ³·Ïû¼´¿É.', NULL);
INSERT INTO `internal_resources` VALUES ('USER_PERMGRID', 'MND', 'È¨ÏÞ±í', NULL);
INSERT INTO `internal_resources` VALUES ('GROUP_LINK', 'MND', '×é´«ÂÔ', NULL);
INSERT INTO `internal_resources` VALUES ('GROUP_HEAD', 'MND', '×é´«ÂÔ', NULL);
INSERT INTO `internal_resources` VALUES ('GROUP_NAME', 'MND', '×éÃû', NULL);
INSERT INTO `internal_resources` VALUES ('GROUP_DESCRIPTIO', 'MND', 'ÃèÊö', NULL);
INSERT INTO `internal_resources` VALUES ('GROUP_FILTERMENU', 'MND', '×é¹ÜÀí', NULL);
INSERT INTO `internal_resources` VALUES ('ROLE_LINK', 'MND', '½ÇÉ«´«ÂÔ', NULL);
INSERT INTO `internal_resources` VALUES ('ROLE_HEAD', 'MND', '½ÇÉ«´«ÂÔ', NULL);
INSERT INTO `internal_resources` VALUES ('ROLE_NAME', 'MND', '½ÇÉ«Ãûe', NULL);
INSERT INTO `internal_resources` VALUES ('ROLE_DESCRIPTION', 'MND', 'ÃèÊö', NULL);
INSERT INTO `internal_resources` VALUES ('ROLE_FILTERMENU', 'MND', '½ÇÉ«¹ÜÀí', NULL);
INSERT INTO `internal_resources` VALUES ('USER_PERMISSIONS', 'MND', 'ÓÃ»§È¨ÏÞ', NULL);
INSERT INTO `internal_resources` VALUES ('UP_INTRO', 'MND', 'ÇëÑ¡ÔñÄúÏë¸³ÓèÓÃ»§µÄ×é¼°ÔÚ×éÖÐµÄ½ÇÉ«.', NULL);
INSERT INTO `internal_resources` VALUES ('USER_TO_GROUP', 'MND', 'Ìí¼ÓÓÃ»§µ½×éÖÐ', NULL);
INSERT INTO `internal_resources` VALUES ('ERROR_SEL_GROUP', 'MND', 'Äú±ØÐëÑ¡ÔñÒ»¸ö×é!', NULL);
INSERT INTO `internal_resources` VALUES ('ERROR_SEL_ROLE', 'MND', 'Äú±ØÐëÖÁÉÙÑ¡ÔñÒ»¸ö½ÇÉ«!', NULL);
INSERT INTO `internal_resources` VALUES ('USER_PROFILE', 'MND', 'ÎÒµÄ´«ÂÔ', NULL);
INSERT INTO `internal_resources` VALUES ('COMMIT', 'MND', 'Î¯ÍÐ', NULL);
INSERT INTO `internal_resources` VALUES ('CANCEL', 'MND', 'È¡Ïû', NULL);
INSERT INTO `internal_resources` VALUES ('YES', 'MND', 'ÊÇ', NULL);
INSERT INTO `internal_resources` VALUES ('NO', 'MND', '·ñ', NULL);
INSERT INTO `internal_resources` VALUES ('NEW', 'MND', '²åÈëÐÂµÄ', NULL);
INSERT INTO `internal_resources` VALUES ('NAME', 'MND', 'Ãû³Æ', NULL);
INSERT INTO `internal_resources` VALUES ('DESCRIPTION', 'MND', 'ÃèÊö', NULL);
INSERT INTO `internal_resources` VALUES ('DOSOMETHING', 'MND', 'ÇëÑ¡ÔñÄúÒª½øÐÐµÄ¶¯×÷. Äú¿É²åÈëÐÂÌõÄ¿, ±à¼­ÌõÄ¿, É¾³ýÌõÄ¿¼°¸Ä±äÌõÄ¿Ë³Ðò.', NULL);
INSERT INTO `internal_resources` VALUES ('EDIT', 'MND', '±à¼­', NULL);
INSERT INTO `internal_resources` VALUES ('UP', 'MND', 'ÉÏ', NULL);
INSERT INTO `internal_resources` VALUES ('DOWN', 'MND', 'ÏÂ', NULL);
INSERT INTO `internal_resources` VALUES ('CONTAINERNAME', 'MND', 'Ä£°å', NULL);
INSERT INTO `internal_resources` VALUES ('SELECTOBJECT', 'MND', 'ÇëÑ¡ÔñÒ»¸öÀàÐÍ²¢Ö¸¶¨Ò»¸öÎ»ÖÃÓëÃû³ÆÒÔ±ã´´½¨Ò»¸öÐÂÄ¿±ê.<br>¶ÔÓÚÎ»ÖÃ£¬°´ÄúµÄÐèÒª£¬Ê¹ÓÃ 0 ½«²åÔÚ¿ªÍ·£¬999 ½«²åÔÚÄ©Î²£¬ÒÔ¼°ÆäËüÎ»ÖÃ.', NULL);
INSERT INTO `internal_resources` VALUES ('POSITION', 'MND', 'Î»ÖÃ', NULL);
INSERT INTO `internal_resources` VALUES ('DELETE', 'MND', 'É¾³ý', NULL);
INSERT INTO `internal_resources` VALUES ('TYPE', 'MND', 'ÀàÐÍ', NULL);
INSERT INTO `internal_resources` VALUES ('KEYWORDS', 'MND', '¹Ø¼ü×Ö', NULL);
INSERT INTO `internal_resources` VALUES ('METATEMPLATE', 'MND', '¸½¼ÓµÄMETA-KeyÄ£°å', NULL);
INSERT INTO `internal_resources` VALUES ('SELECT_VARIATION', 'MND', 'Ñ¡Ôñ±äÁ¿', NULL);
INSERT INTO `internal_resources` VALUES ('ACTIVE_VARIATION', 'MND', '¼¤»îµÄ±äÁ¿:', NULL);
INSERT INTO `internal_resources` VALUES ('NO_VARIATIONS', 'MND', 'Ä¿Ç°Õâ¸öÃ»ÓÐ¶¨Òå±äÁ¿!<br> ÇëÕÒÒ»Î»¿ª·¢Õß¼ì²éËùÑ¡µÄÌõÄ¿µÄÅäÖÃ!', NULL);
INSERT INTO `internal_resources` VALUES ('ED_CONTENT', 'MND', '±à¼­ÄÚÈÝ', NULL);
INSERT INTO `internal_resources` VALUES ('ED_META', 'MND', '±à¼­METAÊý¾Ý', NULL);
INSERT INTO `internal_resources` VALUES ('ED_DISPATCHER', 'MND', 'Ê¹ÓÃÕâ¸ö°´Å¥ÔÚ±à¼­METAÊý¾ÝÓë±à¼­ÄÚÈÝÖ®¼äÇÐ»».', NULL);
INSERT INTO `internal_resources` VALUES ('PREVIEW', 'MND', 'Ô¤ÀÀ', NULL);
INSERT INTO `internal_resources` VALUES ('CHOOSEFILE', 'MND', 'Ñ¡ÔñÒ»¸öÎÄ¼þ', NULL);
INSERT INTO `internal_resources` VALUES ('CONFIGURED', 'MND', 'ÒÑ×¼±¸ºÃÊ¹ÓÃ.', NULL);
INSERT INTO `internal_resources` VALUES ('NOTCONFIGURED', 'MND', 'Î´ÅäÖÃ.', NULL);
INSERT INTO `internal_resources` VALUES ('CONFIG', 'MND', 'ÅäÖÃ', NULL);
INSERT INTO `internal_resources` VALUES ('SELECT_CI', 'MND', 'Ñ¡ÔñÒ»¸öÄÚÈÝÌõÄ¿', NULL);
INSERT INTO `internal_resources` VALUES ('SELECT_CL', 'MND', 'Ñ¡ÔñÒ»¸ö´ØÀý³Ì', NULL);
INSERT INTO `internal_resources` VALUES ('EMPTY', 'MND', '&lt;¿Õ&gt;', NULL);
INSERT INTO `internal_resources` VALUES ('STATUS', 'MND', '×´Ì¬:', NULL);
INSERT INTO `internal_resources` VALUES ('UNIQUE', 'MND', 'Õâ¸ö×Ö¶Î±ØÐëÊÇÎ¨Ò»µÄ!', NULL);
INSERT INTO `internal_resources` VALUES ('MANDATORY', 'MND', 'Õâ¸ö×Ö¶Î±ØÐëÎª¿Õ!', NULL);
INSERT INTO `internal_resources` VALUES ('NOTNUMBER', 'MND', 'Äú±ØÐëÊäÈëÒ»¸öÊý×Öµ½Õâ¸ö×Ö¶ÎÖÐ!', NULL);
INSERT INTO `internal_resources` VALUES ('WRONGDATE', 'MND', 'ÄúÊäÈëµÄÊý¾Ý²»´æÔÚ!', NULL);
INSERT INTO `internal_resources` VALUES ('DATEFORMAT', 'MND', 'Êý¾Ý¸ñÊ½²»¶Ô!', NULL);
INSERT INTO `internal_resources` VALUES ('PWDNOTMATCH', 'MND', 'ÄúÊäÈëµÄÃÜÂë²»¶Ô!', NULL);
INSERT INTO `internal_resources` VALUES ('PWDTOOSHORT', 'MND', 'ÃÜÂë±ØÐëÖÁÉÙÓÐÖú6¸ö×Ö·û!', NULL);
INSERT INTO `internal_resources` VALUES ('PROCERROR', 'MND', '´¦Àí±íµ¥Ê±³öÏÖ´íÎó. Çë¼ì²é±êÎªÀ¶É«µÄ×Ö¶Î²¢ÔÄ¶ÁÄÇÀïÈ¡µÃ½øÒ»²½µÄÐÅÏ¢.', NULL);
INSERT INTO `internal_resources` VALUES ('SAVEERROR', 'MND', '½«Êý¾Ý´æÈëÊý¾Ý¿âÊ±³öÏÖ´íÎó. ÇëÈ·¶¨Êý¾Ý¿âÒÑÁ¬½Ó£¬»òÕÒÄúµÄ¹ÜÀíÔ±.', NULL);
INSERT INTO `internal_resources` VALUES ('SAVESUCCESS', 'MND', 'Êý¾Ý³É¹¦Ð´ÈëÊý¾Ý¿â.', NULL);
INSERT INTO `internal_resources` VALUES ('DELETESUCCESS', 'MND', 'ÏÂÁÐÊý¾ÝÒÑ±»´ÓÊý¾Ý¿âÖÐ³É¹¦É¾³ý. ÏÖÔÚËüÒÑ¶ªÊ§!', NULL);
INSERT INTO `internal_resources` VALUES ('SELECTONE', 'MND', 'Äú±ØÐëÔÚÕâÀï×ö³öÒ»¸öÑ¡Ôñ!', NULL);
INSERT INTO `internal_resources` VALUES ('CREATENEW', 'MND', 'Õâ¸öÄ£°åÒÑ´´½¨Ò»¸öÐÂ³ÉÔ±. Çë²Î¼ûÏÂÁÐÊý¾Ý.', NULL);
INSERT INTO `internal_resources` VALUES ('PROMPTDELETE', 'MND', 'ÄúÊÇ·ñÕæÏëÉ¾³ýÕâ¸öÊý¾Ý¼¯? Õâ¸ö¶¯×÷²»ÄÜ·´»Ú!', NULL);
INSERT INTO `internal_resources` VALUES ('RESET', 'MND', 'ÖØÖÃ±íµ¥', NULL);
INSERT INTO `internal_resources` VALUES ('BACK', 'MND', 'ÍË»Ø', NULL);
INSERT INTO `internal_resources` VALUES ('CREATE', 'MND', '´´½¨ÌõÄ¿', NULL);
INSERT INTO `internal_resources` VALUES ('ERROR', 'MND', 'ÔÚ½øÐÐËùÑ¡²Ù×÷Ê±³ö´í!', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE', 'MND', '¾»»¯Êý¾Ý¿â', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_MES', 'MND', 'ÇëÑ¡ÔñÄúÏë¾»»¯µÄÊý¾Ý¿â²¿·Ö.', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_VAR', 'MND', '¾»»¯²ÎÊý', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_CONTENT', 'MND', '¾»»¯ÄÚÈÝ', NULL);
INSERT INTO `internal_resources` VALUES ('VAR_SUCCEEDED', 'MND', ' ³É¹¦!', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_FOLDER', 'MND', '¾»»¯ÎÄ¼þ¼Ð', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_CLUSTER', 'MND', '¾»»¯´Ø', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_META', 'MND', '¾»»¯Meta', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_CLT', 'MND', '¾»»¯´ØÄ£°å', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_PAGES', 'MND', '¾»»¯Õ¾µãÒ³ÃæÓëMasters', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_EXPIRED', 'MND', '¾»»¯Ê§Ð§µÄÒ³Ãæ', NULL);
INSERT INTO `internal_resources` VALUES ('PO_BROWSER', 'IT', 'Esplora il portale', NULL);
INSERT INTO `internal_resources` VALUES ('PO_OWNER', 'IT', 'Proprietario della pagina', NULL);
INSERT INTO `internal_resources` VALUES ('PO_CRSUCCEEDED', 'IT', 'La creazione della nuova pagina del portale è avvenuta con successo!', NULL);
INSERT INTO `internal_resources` VALUES ('PO_MYPORTAL', 'IT', 'Mio Portale', NULL);
INSERT INTO `internal_resources` VALUES ('PO_EDIT', 'IT', 'Edita la pagine dal portale', NULL);
INSERT INTO `internal_resources` VALUES ('SP_BROWSE', 'IT', 'Esplora la mappa del sito', NULL);
INSERT INTO `internal_resources` VALUES ('SP_NEWPAGE', 'IT', 'Aggiungi la pagina del sito', NULL);
INSERT INTO `internal_resources` VALUES ('SP_NEWINSTANCE', 'IT', 'Aggiungere Pagina', NULL);
INSERT INTO `internal_resources` VALUES ('SP_IPROPERTIES', 'IT', 'Propietà dalla pagina', NULL);
INSERT INTO `internal_resources` VALUES ('SP_PROPERTIES', 'IT', 'Proprietà della pagina del sito', NULL);
INSERT INTO `internal_resources` VALUES ('SP_DELETE', 'IT', 'Cancella la pagina del sito', NULL);
INSERT INTO `internal_resources` VALUES ('SP_PDELETE', 'IT', 'Cancella Pagina', NULL);
INSERT INTO `internal_resources` VALUES ('SP_CONFIGURE', 'IT', 'Configura Pagina', NULL);
INSERT INTO `internal_resources` VALUES ('SP_CONFDESC', 'IT', 'Puoi collegare la pagina del sito a una istanza di gruppo esistente, o puoi creare una nuova istanza. Decidere cosa fare.', NULL);
INSERT INTO `internal_resources` VALUES ('SP_LINK', 'IT', 'Collegare a una istanza di gruppo esistente', NULL);
INSERT INTO `internal_resources` VALUES ('SP_CLNEW', 'IT', 'Creare una nuova istanza di gruppo', NULL);
INSERT INTO `internal_resources` VALUES ('SP_EDIT', 'IT', 'Edita la pagina del sito', NULL);
INSERT INTO `internal_resources` VALUES ('SP_MENUPROPS', 'IT', 'Nome del menù e testo di aiuto', NULL);
INSERT INTO `internal_resources` VALUES ('SP_MENUNAME', 'IT', 'Nome nel Menù', NULL);
INSERT INTO `internal_resources` VALUES ('SP_MENUHELP', 'IT', 'Testo di aiuto per il Menù', NULL);
INSERT INTO `internal_resources` VALUES ('SP_LAUNCHDATE', 'IT', 'Attivata da', NULL);
INSERT INTO `internal_resources` VALUES ('SP_EXPIREDATE', 'IT', 'Scaduta da', NULL);
INSERT INTO `internal_resources` VALUES ('SP_LAUNCHDATES', 'IT', 'Configurazione del tempo di vita', NULL);
INSERT INTO `internal_resources` VALUES ('SP_PREVIEW', 'IT', 'Pagina Precedente', NULL);
INSERT INTO `internal_resources` VALUES ('SP_LAUNCH', 'IT', 'Aprire la Pagina', NULL);
INSERT INTO `internal_resources` VALUES ('SP_EXPIRE', 'IT', 'Fà scadere pagina', NULL);
INSERT INTO `internal_resources` VALUES ('SPM', 'IT', 'Pagina del sito principale', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_EDIT', 'IT', 'Edita pagina del sito principale', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_META', 'IT', 'Template di META-chiavi', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_VARIATIONS', 'IT', 'Variazioni visualizabili', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_TYPE', 'IT', 'Tipo di pagina', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_CLUSTER', 'IT', 'Gruppo di Template', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_PATH', 'IT', 'Percorso dei Template', NULL);
INSERT INTO `internal_resources` VALUES ('CL_BROWSE', 'IT', 'Esplora gruppo', NULL);
INSERT INTO `internal_resources` VALUES ('CL_NEW', 'IT', 'Nuova istanza', NULL);
INSERT INTO `internal_resources` VALUES ('CL_PROPERTIES', 'IT', 'Proprietà del gruppo', NULL);
INSERT INTO `internal_resources` VALUES ('CL_DEL', 'IT', 'Cancella istanza', NULL);
INSERT INTO `internal_resources` VALUES ('CL_CREATEINSTANC', 'IT', 'Creare nuova istanza', NULL);
INSERT INTO `internal_resources` VALUES ('CL_NOTITLE', 'IT', 'Nessun titolo definito', NULL);
INSERT INTO `internal_resources` VALUES ('TITLE', 'IT', 'Titolo', NULL);
INSERT INTO `internal_resources` VALUES ('CLI_EDIT', 'IT', 'Edita membri del gruppo', NULL);
INSERT INTO `internal_resources` VALUES ('CLI_DELETE', 'IT', 'Cancella membri del gruppo', NULL);
INSERT INTO `internal_resources` VALUES ('CLI_DELETEMES', 'IT', 'Vuoi veramente cancellare questa istanza. Sarà persa per sempre!', NULL);
INSERT INTO `internal_resources` VALUES ('CLI', 'IT', 'Istanza di gruppo:', NULL);
INSERT INTO `internal_resources` VALUES ('SR_SELECTCI', 'IT', 'Puoi cercare quì per ogni content-items . Se vuoi selezionare un content-item, sceglierlo e premere il pulsante di Update ! Se vuoi connettere un nuovo contenuto con questo campo, bisogna prima creare il contenuto nel navigatore di oggetti.', NULL);
INSERT INTO `internal_resources` VALUES ('SR_SELECTCLI', 'IT', 'Selezionare un cluster-template. Dopodichè puoi selezionare una istanza del template da assegnare.', NULL);
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
INSERT INTO `internal_resources` VALUES ('CLT_PROPERTIES', 'IT', 'Proprietà del Cluster-Template', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_DELETE', 'IT', 'Cancella il Cluster-Template', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_DELMES', 'IT', 'Vuoi candellare il cluster-template. Questo comporterà la perdita di tutti(!) i contenuti creati su e con il cluster-template. Sei sicuro, vuoi proseguire?', NULL);
INSERT INTO `internal_resources` VALUES ('CLTI_DELETE', 'IT', 'Vuoi veramente cancellare questo oggetto. Tutte le istanza di questo oggetto saranno perse!', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_SCHEME', 'IT', 'Edita lo schema  Cluster-Template', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_MINCARD', 'IT', 'Minimo numero di istanze', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_MAXCARD', 'IT', 'Massimo numero di istanze', NULL);
INSERT INTO `internal_resources` VALUES ('LINKED', 'IT', 'Collegato  con', NULL);
INSERT INTO `internal_resources` VALUES ('PG_INSTALLDESC', 'IT', 'Essere sicuri di aver copiato tutti i necessari file nella cartella. Inserire il percorso corretto per i plugin nel campo sottostante. Il sistema istallerà i the PlugIn automaticamente.', NULL);
INSERT INTO `internal_resources` VALUES ('PG_CHOOSE', 'IT', 'PlugIn: &nbsp; /plugin/', NULL);
INSERT INTO `internal_resources` VALUES ('PG_FILEWRONG', 'IT', 'Il file inserito non è stato trovato nel server!', NULL);
INSERT INTO `internal_resources` VALUES ('CLASS_WRONG', 'IT', 'Il file specificato non ha un firma di classe valida!', NULL);
INSERT INTO `internal_resources` VALUES ('PG_INSTALLED', 'IT', 'Il PlugIn è stato installato con successo!', NULL);
INSERT INTO `internal_resources` VALUES ('PG_UPGRADED', 'IT', 'Il PlugIn è stato aggiornato con successo!', NULL);
INSERT INTO `internal_resources` VALUES ('PG_ALREADYINSTAL', 'IT', 'Il PlugIn è già istallato!', NULL);
INSERT INTO `internal_resources` VALUES ('PG_TITLE', 'IT', 'PlugIns', NULL);
INSERT INTO `internal_resources` VALUES ('PG_INSTALL', 'IT', 'Aggiungi PlugIn', NULL);
INSERT INTO `internal_resources` VALUES ('PG_UNINSTALL', 'IT', 'Rimuovi PlugIn', NULL);
INSERT INTO `internal_resources` VALUES ('PG_UNINSTALLMES', 'IT', 'Stai per rimuovere un modulo. Rimuovere un modulo non solo rimuove i tipi contenuti ma anche cancella ogni singolo oggetto di questo tipo che sono immagazzinati nel database. La rimozione cancellerà definitivamente tutti(!) i dati di questo modulo!', NULL);
INSERT INTO `internal_resources` VALUES ('PG_UNINSTALLDELE', 'IT', 'Rimuovi il modulo,<br> Cancella tutti i contenuti corrispondenti.', NULL);
INSERT INTO `internal_resources` VALUES ('O_NEW', 'IT', 'Nuovo oggetto', NULL);
INSERT INTO `internal_resources` VALUES ('O_PROPERTIES', 'IT', 'Proprietà degli oggetti', NULL);
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
INSERT INTO `internal_resources` VALUES ('R_EDITFOLDER', 'IT', 'Edita le proprietà del contenitore', NULL);
INSERT INTO `internal_resources` VALUES ('R_FOLDERNAME', 'IT', 'Nomina il contenitore', NULL);
INSERT INTO `internal_resources` VALUES ('R_DELETEFOLDER', 'IT', 'Cancella il contenitore', NULL);
INSERT INTO `internal_resources` VALUES ('R_FOLDERNOTEMPTY', 'IT', 'Il contenitore non è vuoto. Non è possibili cancellarlo! Controllare tutti gli oggetti e gruppi!', NULL);
INSERT INTO `internal_resources` VALUES ('R_DELFOLDER', 'IT', 'Cancellare il contenitore a tutti gli oggetti figli', NULL);
INSERT INTO `internal_resources` VALUES ('R_MOVEOBJECTS', 'IT', 'Spostare tutti gli oggetti nel nodo principale', NULL);
INSERT INTO `internal_resources` VALUES ('R_PARENT', 'IT', 'Contenitore principale', NULL);
INSERT INTO `internal_resources` VALUES ('METATEMPLATES', 'IT', 'Contenitori Meta-Dati', NULL);
INSERT INTO `internal_resources` VALUES ('MT_PROPERTIES', 'IT', 'Edita la proprietà dei Meta-Contenitori', NULL);
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
INSERT INTO `internal_resources` VALUES ('UP', 'IT', 'Sù', NULL);
INSERT INTO `internal_resources` VALUES ('DOWN', 'IT', 'Giù', NULL);
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
INSERT INTO `internal_resources` VALUES ('MANDATORY', 'IT', 'Questo campo non può essere vuoto!', NULL);
INSERT INTO `internal_resources` VALUES ('NOTNUMBER', 'IT', 'Devi inserire un numero in questo campo!', NULL);
INSERT INTO `internal_resources` VALUES ('WRONGDATE', 'IT', 'La data inserita, non esiste!', NULL);
INSERT INTO `internal_resources` VALUES ('DATEFORMAT', 'IT', 'Il formato della data non è corretto!', NULL);
INSERT INTO `internal_resources` VALUES ('PWDNOTMATCH', 'IT', 'La passwords inserita non è corretta!', NULL);
INSERT INTO `internal_resources` VALUES ('PWDTOOSHORT', 'IT', 'La password deve essere di almeno 6 caratteri!', NULL);
INSERT INTO `internal_resources` VALUES ('PROCERROR', 'IT', 'Un errore è successo mentre si processava il form. Controllare il campo marcato di blu e leggere quì per ulteriori informazioni.', NULL);
INSERT INTO `internal_resources` VALUES ('SAVEERROR', 'IT', 'Si è verificato un errore mentre si stavano salvando i dati nel database. Assicurarsi che il database sia connesso o contattare il proprio Amministratore.', NULL);
INSERT INTO `internal_resources` VALUES ('SAVESUCCESS', 'IT', 'I dati sono stati scritti correttamente nel database.', NULL);
INSERT INTO `internal_resources` VALUES ('DELETESUCCESS', 'IT', 'I dati elencati sotto sono stati correttamente cancellati dal database. Ora sono persi!', NULL);
INSERT INTO `internal_resources` VALUES ('SELECTONE', 'IT', 'Devi fare una scelta quì!', NULL);
INSERT INTO `internal_resources` VALUES ('CREATENEW', 'IT', 'Un nuovo membro di questo template è stato creato. Guardare i dati elencati sotto.', NULL);
INSERT INTO `internal_resources` VALUES ('PROMPTDELETE', 'IT', 'Vuoi veramente cancellare questo dataset? Questa azione non può essere ripristinata!', NULL);
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
INSERT INTO `internal_resources` VALUES ('USER_JS', 'PL', 'U¿yj Javascript', NULL);
INSERT INTO `internal_resources` VALUES ('USER_BL', 'PL', 'Jêzyk systemu zarz±dzania', NULL);
INSERT INTO `internal_resources` VALUES ('PO_BROWSER', 'PL', 'Przegl±danie Portali', NULL);
INSERT INTO `internal_resources` VALUES ('PO_OWNER', 'PL', 'W³a¶ciciel Strony', NULL);
INSERT INTO `internal_resources` VALUES ('PO_CRSUCCEEDED', 'PL', 'Utworzenie nowej strony portalu powiod³o siê!', NULL);
INSERT INTO `internal_resources` VALUES ('PO_MYPORTAL', 'PL', 'Moje Portale', NULL);
INSERT INTO `internal_resources` VALUES ('PO_EDIT', 'PL', 'Edycja strony Portal-u', NULL);
INSERT INTO `internal_resources` VALUES ('SP_BROWSE', 'PL', 'Przegl±danie uk³adu stron', NULL);
INSERT INTO `internal_resources` VALUES ('SP_NEWPAGE', 'PL', 'Dodanie strony serwisu', NULL);
INSERT INTO `internal_resources` VALUES ('SP_NEWINSTANCE', 'PL', 'Dodanie strony', NULL);
INSERT INTO `internal_resources` VALUES ('SP_IPROPERTIES', 'PL', 'W³a¶ciwo¶ci strony', NULL);
INSERT INTO `internal_resources` VALUES ('SP_PROPERTIES', 'PL', 'W³a¶ciwo¶ci strony serwisu', NULL);
INSERT INTO `internal_resources` VALUES ('SP_DELMES', 'PL', 'Zamierzasz usun±æ stronê serwisu. Proszê zauwa¿yæ, ¿e tak¿e czynna wersja tej strony serwisu zostanie usuniêta!', NULL);
INSERT INTO `internal_resources` VALUES ('SP_DELETE', 'PL', 'Usuniêcie strony serwisu', NULL);
INSERT INTO `internal_resources` VALUES ('SP_PDELMES', 'PL', 'Zamierzasz usun±æ stronê. Proszê zauwa¿yæ, ¿e tak¿e czynna wersja tej strony zostanie usuniêta!', NULL);
INSERT INTO `internal_resources` VALUES ('SP_PDELETE', 'PL', 'Usuniêcie strony', NULL);
INSERT INTO `internal_resources` VALUES ('SP_CONFIGURE', 'PL', 'Konfiguracja strony', NULL);
INSERT INTO `internal_resources` VALUES ('SP_CONFDESC', 'PL', 'Mo¿na po³±czyæ t± stronê serwisu z instniej±cym wysta±pieniem klastra lub mo¿na utworzyæ now± instancjê. Proszê zadecydowaæ co zamierzsz zrobiæ.', NULL);
INSERT INTO `internal_resources` VALUES ('SP_LINK', 'PL', 'Utworzyæ po³±czenie do istniej±cego wyst±pienia klastra', NULL);
INSERT INTO `internal_resources` VALUES ('SP_CLNEW', 'PL', 'Stworzyæ nowe wyst±pienie klastra', NULL);
INSERT INTO `internal_resources` VALUES ('SP_EDIT', 'PL', 'Edycja strony serwisu', NULL);
INSERT INTO `internal_resources` VALUES ('SP_MENUPROPS', 'PL', 'Nazwa menu i tekst pomocy', NULL);
INSERT INTO `internal_resources` VALUES ('SP_MENUNAME', 'PL', 'Nazwa w menu', NULL);
INSERT INTO `internal_resources` VALUES ('SP_MENUHELP', 'PL', 'Tekst pomocy dla menu', NULL);
INSERT INTO `internal_resources` VALUES ('SP_LAUNCHDATE', 'PL', 'Wa¿ne od', NULL);
INSERT INTO `internal_resources` VALUES ('SP_EXPIREDATE', 'PL', 'Up³ywa od', NULL);
INSERT INTO `internal_resources` VALUES ('SP_LAUNCHDATES', 'PL', 'Konfiguracja czasu pracy', NULL);
INSERT INTO `internal_resources` VALUES ('SP_PREVIEW', 'PL', 'Podgl±d strony', NULL);
INSERT INTO `internal_resources` VALUES ('SP_LAUNCH', 'PL', 'Uruchom stronê', NULL);
INSERT INTO `internal_resources` VALUES ('SP_EXPIRE', 'PL', 'Przedawnij stronê', NULL);
INSERT INTO `internal_resources` VALUES ('NOSPTITLE', 'PL', 'Nale¿y zdefiniowaæ nazwê w menu przed uruchomieniem strony!', NULL);
INSERT INTO `internal_resources` VALUES ('ACTIVE', 'PL', 'Aktywne', NULL);
INSERT INTO `internal_resources` VALUES ('SPM', 'PL', 'Wzorzec strony serwisu', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_EDIT', 'PL', 'Edycja wzorca strony serwisu', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_META', 'PL', 'Wzorzec meta kluczy', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_VARIATIONS', 'PL', 'Wy¶wietlane wersje', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_TYPE', 'PL', 'Rodzaj strony', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_CLUSTER', 'PL', 'Wzorzec klastra', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_PATH', 'PL', '¦cie¿ka do wzorca', NULL);
INSERT INTO `internal_resources` VALUES ('CL_BROWSE', 'PL', 'Przegl±danie klastrów', NULL);
INSERT INTO `internal_resources` VALUES ('CL_NEW', 'PL', 'Nowe wyst±pienie', NULL);
INSERT INTO `internal_resources` VALUES ('CL_PROPERTIES', 'PL', 'W³a¶ciwo¶ci klastra', NULL);
INSERT INTO `internal_resources` VALUES ('CL_DEL', 'PL', 'Usuñ wyst±pienie', NULL);
INSERT INTO `internal_resources` VALUES ('CL_DELMES', 'PL', 'Czy na pewno chcesz usun±æ to wyst±pienie klastra? Wszystkie dane zawarto¶ci zostan± stracone!', NULL);
INSERT INTO `internal_resources` VALUES ('CL_EDIT', 'PL', 'Edycja wyst±pienia klastra', NULL);
INSERT INTO `internal_resources` VALUES ('CL_CREATEINSTANC', 'PL', 'Utórzenie nowego wyst±pienia', NULL);
INSERT INTO `internal_resources` VALUES ('CL_CREATEINSMES', 'PL', 'Nadal zostaj± gniazda do utworzenia dodatkowych wyst±pieñ dla thych pól zawarto¶ci. Je¿eli chcesz utworzyæ dodatkowe wyst±pienie, wprowad¼ tytu³ w polu tekstowym poni¿ej i naci¶nij przycisk utwórz.', NULL);
INSERT INTO `internal_resources` VALUES ('CL_NOTITLE', 'PL', 'Nie zosta³ jeszcze zdefiniowany tytu³', NULL);
INSERT INTO `internal_resources` VALUES ('TITLE', 'PL', 'Tytu³', NULL);
INSERT INTO `internal_resources` VALUES ('CLI_EDIT', 'PL', 'Edycja cz³onka klastra', NULL);
INSERT INTO `internal_resources` VALUES ('CLI_DELETE', 'PL', 'Usuñ cz³onka klastra', NULL);
INSERT INTO `internal_resources` VALUES ('CLI_DELETEMES', 'PL', 'Czy na pewno chcesz usun±æ to wyst±pienie? Zostanie stracone na zawsze!', NULL);
INSERT INTO `internal_resources` VALUES ('CLI_DELETED', 'PL', 'Wyst±pienie zosta³o usuniête!', NULL);
INSERT INTO `internal_resources` VALUES ('CLI_NOTDELETED', 'PL', 'To wyst±pienie nie mo¿e zostaæ usuniête!', NULL);
INSERT INTO `internal_resources` VALUES ('CLI', 'PL', 'Wyst±pienie klastra:', NULL);
INSERT INTO `internal_resources` VALUES ('SR_SELECTCI', 'PL', 'Tutaj mo¿na wyszukiwaæ dowolne elementy zawarto¶ci. Je¿eli chcemy wybraæ element zawarto¶ci, nale¿y nacisn±æ przycisk Aktualizuj! Je¿eli chcemy pod³±czyæ siê do nowej zawarto¶ci za pomoc± tego pola - stwórz wcze¶niej zawarto¶æ w Przegl±darce obiektów.', NULL);
INSERT INTO `internal_resources` VALUES ('SR_SELECTCLI', 'PL', 'Proszê wybraæ szablon klastra. Nastêpnie mo¿na wybraæ wyst±pienie szablonu w celu dalszego u¿ycia.', NULL);
INSERT INTO `internal_resources` VALUES ('FOLDER', 'PL', 'Folder', NULL);
INSERT INTO `internal_resources` VALUES ('CONTENTTYPE', 'PL', 'Rodzaj zawarto¶ci', NULL);
INSERT INTO `internal_resources` VALUES ('CONTENTITEM', 'PL', 'Element zawarto¶ci', NULL);
INSERT INTO `internal_resources` VALUES ('SEARCH', 'PL', 'Pocz±tek wyszukiwania', NULL);
INSERT INTO `internal_resources` VALUES ('SEARCHIN', 'PL', 'Szukaj', NULL);
INSERT INTO `internal_resources` VALUES ('SEARCHRESULTS', 'PL', 'Wyniki wyszukiwania, proszê wybraæ', NULL);
INSERT INTO `internal_resources` VALUES ('SELECTEDOBJECT', 'PL', 'Aktualnie wybrany element zawarto¶ci', NULL);
INSERT INTO `internal_resources` VALUES ('SELECTEDINSTANCE', 'PL', 'Wybrane wyst±pienie klastra', NULL);
INSERT INTO `internal_resources` VALUES ('M_META', 'PL', 'Szablony Meta', NULL);
INSERT INTO `internal_resources` VALUES ('M_BROWSER', 'PL', 'Przegladarka obiektów', NULL);
INSERT INTO `internal_resources` VALUES ('M_INSTALLPLUGIN', 'PL', 'Dodatki', NULL);
INSERT INTO `internal_resources` VALUES ('M_ES', 'PL', 'Przegl±darka serwisu', NULL);
INSERT INTO `internal_resources` VALUES ('M_SPM', 'PL', 'Wzorzec stron serwisu', NULL);
INSERT INTO `internal_resources` VALUES ('M_PRTMAN', 'PL', 'Zarz±dzanie portalem', NULL);
INSERT INTO `internal_resources` VALUES ('M_MYPRT', 'PL', 'Moje portale', NULL);
INSERT INTO `internal_resources` VALUES ('M_MYPROFILE', 'PL', 'Mój profil', NULL);
INSERT INTO `internal_resources` VALUES ('M_LOGOUT', 'PL', 'Wyloguj', NULL);
INSERT INTO `internal_resources` VALUES ('M_CLB', 'PL', 'Przegl±darka klastra', NULL);
INSERT INTO `internal_resources` VALUES ('M_CLTB', 'PL', 'Przegl±darka szablonów klastra', NULL);
INSERT INTO `internal_resources` VALUES ('M_UMAN', 'PL', 'Zarz±dzanie u¿ytkownikami', NULL);
INSERT INTO `internal_resources` VALUES ('M_VAR', 'PL', 'Odmiany', NULL);
INSERT INTO `internal_resources` VALUES ('M_PURGE', 'PL', 'Usuniêcie bazy danych', NULL);
INSERT INTO `internal_resources` VALUES ('M_PGN', 'PL', 'Kontrola dodatków', NULL);
INSERT INTO `internal_resources` VALUES ('M_REPORT', 'PL', 'Raport serweisu', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_NEW', 'PL', 'Nowy szablon klastra', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_BROWSE', 'PL', 'Przegl±d. szabl.klas.', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_NAME', 'PL', 'Nazwa szabl.klas.', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_PROPERTIES', 'PL', 'W³a¶ciwo¶ci szabl.klas.', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_DELETE', 'PL', 'Usuniêcie szabl.klas.', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_DELMES', 'PL', 'Zamierzasz usun±æ szablon klastra. Spowoduje to usuniêciê wszystkich(!) zawarto¶ci stworzonych przy u¿yciu szablonu klastra. Czy na pewno chcesz kontynuowaæ?', NULL);
INSERT INTO `internal_resources` VALUES ('CLTI_DELETE', 'PL', 'Czy na pewno chesz usun±æ ten element? Wszystkie wyst±pienia tego elementu tak¿e zostan± usuniête!', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_SCHEME', 'PL', 'Edycja schematu szablonu klastra', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_MINCARD', 'PL', 'Wyst±pienia', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_MAXCARD', 'PL', '-', NULL);
INSERT INTO `internal_resources` VALUES ('LINKED', 'PL', 'Po³±czone z', NULL);
INSERT INTO `internal_resources` VALUES ('PG_INSTALLDESC', 'PL', 'Prosze siê upewniæ, ¿e zosta³y skopiowane wszystkie niezbêdne pliki do katalogu przed kontynuacj±. Wprowad¼ poprawn± ¶cie¿kê do dodatku w poni¿szym polu. System zainstaluje dodatek automatycznie.', NULL);
INSERT INTO `internal_resources` VALUES ('PG_CHOOSE', 'PL', 'Dodatek: &nbsp; /plugin/', NULL);
INSERT INTO `internal_resources` VALUES ('PG_FILEWRONG', 'PL', 'Nazwa pliku, która zosta³a wprowadzona nie mog³a zostaæ znaleziona na serwerze!', NULL);
INSERT INTO `internal_resources` VALUES ('CLASS_WRONG', 'PL', 'Plik, który zosta³ wprowadzony nie zawiera poprawnej sygnatury!', NULL);
INSERT INTO `internal_resources` VALUES ('PG_INSTALLED', 'PL', 'Dodatek zosta³ poprawnie zainstalowany!', NULL);
INSERT INTO `internal_resources` VALUES ('PG_UPGRADED', 'PL', 'Dodatek zosta³ porawnie zaktualizowany!', NULL);
INSERT INTO `internal_resources` VALUES ('PG_ERROR', 'PL', 'Wyst±pi³ b³±d podczas instalacji dodatku!', NULL);
INSERT INTO `internal_resources` VALUES ('PG_ALREADYINSTAL', 'PL', 'Dodatek ju¿ zosta³ zainstalowany!', NULL);
INSERT INTO `internal_resources` VALUES ('PG_NEWERINSTALLE', 'PL', 'Ju¿ jest zainstalowana nowsza wersja dodatku!', NULL);
INSERT INTO `internal_resources` VALUES ('PG_TITLE', 'PL', 'Dodatki', NULL);
INSERT INTO `internal_resources` VALUES ('PG_INSTALL', 'PL', 'Zainstaluj dodatek', NULL);
INSERT INTO `internal_resources` VALUES ('PG_UNINSTALL', 'PL', 'Odinstaluj dodatek', NULL);
INSERT INTO `internal_resources` VALUES ('PG_UNINSTALLMES', 'PL', 'Zamierzasz odinstalowaæ modu³. Odinstalowanie modu³u nie tylko usuwa rodzaj zawarto¶ci ale tak¿e usuwa ka¿dy obiekt tego typu przechowywany w bazie danych. Odinstalowanie definitywnie(!) usunie wszystkie dane dla tego modu³u!', NULL);
INSERT INTO `internal_resources` VALUES ('PG_UNINSTALLDELE', 'PL', 'Odinstaluj modu³,<br> Usuniêcie wszystkie zale¿ne zawarto¶ci.', NULL);
INSERT INTO `internal_resources` VALUES ('O_NEW', 'PL', 'Nowy obiekt', NULL);
INSERT INTO `internal_resources` VALUES ('O_NAME', 'PL', 'Nazwa obiektu', NULL);
INSERT INTO `internal_resources` VALUES ('O_PROPERTIES', 'PL', 'W³a¶ciwo¶ci obiektu', NULL);
INSERT INTO `internal_resources` VALUES ('O_DELMES', 'PL', 'Zamierzasz usun±æ obiekt. <b>Nale¿y zauwa¿yæ, ¿e wszystkie odmiany i meta dane zostan± utracone!</b>', NULL);
INSERT INTO `internal_resources` VALUES ('O_DEL', 'PL', 'Usuñ obiekt', NULL);
INSERT INTO `internal_resources` VALUES ('O_EDIT', 'PL', 'Edytuj obiekt', NULL);
INSERT INTO `internal_resources` VALUES ('O_PREVIEW', 'PL', 'Podgl±d', NULL);
INSERT INTO `internal_resources` VALUES ('O_TEXT', 'PL', 'Tekst', NULL);
INSERT INTO `internal_resources` VALUES ('O_ALT', 'PL', 'Opis rysunku', NULL);
INSERT INTO `internal_resources` VALUES ('O_COPYRIGHT', 'PL', 'Prawo autorskie', NULL);
INSERT INTO `internal_resources` VALUES ('O_BROWSE', 'PL', 'Przegl±d obiektów', NULL);
INSERT INTO `internal_resources` VALUES ('R_HOME', 'PL', 'Start', NULL);
INSERT INTO `internal_resources` VALUES ('R_NEWFOLDER', 'PL', 'Nowy folder', NULL);
INSERT INTO `internal_resources` VALUES ('R_EDITFOLDER', 'PL', 'Edycja w³a¶ciwo¶ci folderu', NULL);
INSERT INTO `internal_resources` VALUES ('R_FOLDERNAME', 'PL', 'Nazwa folderu', NULL);
INSERT INTO `internal_resources` VALUES ('R_DELETEFOLDER', 'PL', 'Usuñ folder', NULL);
INSERT INTO `internal_resources` VALUES ('R_DELFOLDERMES', 'PL', 'Zamierzasz usun±æ folder. Proszê zaznaczyæ akcjê.', NULL);
INSERT INTO `internal_resources` VALUES ('R_FOLDERNOTEMPTY', 'PL', 'Folder nie jest pusty. Nie mo¿na go usun±æ. Proszê sprawdziæ wszystkie obiekty i klastry!', NULL);
INSERT INTO `internal_resources` VALUES ('R_DELFOLDER', 'PL', 'Usuniêcie folderu i wszystkich podrzêdnych obiektów', NULL);
INSERT INTO `internal_resources` VALUES ('R_MOVEOBJECTS', 'PL', 'Przesuniêcie wszystkich obiektów do nadrzêdnego wêz³a', NULL);
INSERT INTO `internal_resources` VALUES ('R_PARENT', 'PL', 'Nadrzêdny folder', NULL);
INSERT INTO `internal_resources` VALUES ('METATEMPLATES', 'PL', 'Szablon meta danych', NULL);
INSERT INTO `internal_resources` VALUES ('MT_PROPERTIES', 'PL', 'Edycja w³a¶ciwo¶ci meta szablonu', NULL);
INSERT INTO `internal_resources` VALUES ('MT_SCHEME', 'PL', 'Edycja schematu meta szablonu', NULL);
INSERT INTO `internal_resources` VALUES ('MT_DELETE', 'PL', 'Czy rzeczywi¶cie zamierzasz usun±æ t± czê¶æ meta szablonu? Wszystkie informacje wprowadzone w dowolne meta pola w systemie CMS po³±czone do tej czê¶ci zostan± usuniête. Dane zostan± usuniête ca³kowicie!', NULL);
INSERT INTO `internal_resources` VALUES ('MT_ADDITIONAL', 'PL', 'Dodatkowe meta dane', NULL);
INSERT INTO `internal_resources` VALUES ('MT_BASE', 'PL', 'Podstawowe meta dane', NULL);
INSERT INTO `internal_resources` VALUES ('MT_MODULE', 'PL', 'Meta dane specyficzne dla rodzaju zawrto¶ci', NULL);
INSERT INTO `internal_resources` VALUES ('VARIATIONS', 'PL', 'Dostêpne odmiany', NULL);
INSERT INTO `internal_resources` VALUES ('V_NAME', 'PL', 'Nazwa', NULL);
INSERT INTO `internal_resources` VALUES ('V_SHORT', 'PL', 'Krótki znacznik', NULL);
INSERT INTO `internal_resources` VALUES ('V_EDIT', 'PL', 'Edycja odmian', NULL);
INSERT INTO `internal_resources` VALUES ('LOGIN_FAILED', 'PL', 'Wprowadzone dane u¿ytkownika nie mog± zostaæ potwierdzone! Proszê spróbowaæ ponownie.', NULL);
INSERT INTO `internal_resources` VALUES ('USER_HEAD', 'PL', 'Profil u¿ytkownika', NULL);
INSERT INTO `internal_resources` VALUES ('USER_LINK', 'PL', 'Profile u¿ytkowników', NULL);
INSERT INTO `internal_resources` VALUES ('USER_NAME', 'PL', 'Nazwa u¿ytkownika', NULL);
INSERT INTO `internal_resources` VALUES ('FULL_NAME', 'PL', 'Pe³na nazwa', NULL);
INSERT INTO `internal_resources` VALUES ('PASSWORD', 'PL', 'Has³o', NULL);
INSERT INTO `internal_resources` VALUES ('USER_EMAIL', 'PL', 'eMail', NULL);
INSERT INTO `internal_resources` VALUES ('USER_ACTIVE', 'PL', 'Konto w³±czone', NULL);
INSERT INTO `internal_resources` VALUES ('USER_FILTERMENU', 'PL', 'Administracja u¿ytkonikami', NULL);
INSERT INTO `internal_resources` VALUES ('USER_SETPERM', 'PL', 'Ustal prawa dostêpu u¿ytkownika poni¿ej. W celu usuniêcia u¿ytkownika z grupy, po prostu odwo³aj wszytkie grupy przynale¿ne do niego.', NULL);
INSERT INTO `internal_resources` VALUES ('USER_PERMGRID', 'PL', 'Siatka uprawnieñ', NULL);
INSERT INTO `internal_resources` VALUES ('GROUP_LINK', 'PL', 'Profile grupy', NULL);
INSERT INTO `internal_resources` VALUES ('GROUP_HEAD', 'PL', 'Profil grupy', NULL);
INSERT INTO `internal_resources` VALUES ('GROUP_NAME', 'PL', 'Nazwa grupy', NULL);
INSERT INTO `internal_resources` VALUES ('GROUP_DESCRIPTIO', 'PL', 'Opis', NULL);
INSERT INTO `internal_resources` VALUES ('GROUP_FILTERMENU', 'PL', 'Adminstracja grup±', NULL);
INSERT INTO `internal_resources` VALUES ('ROLE_LINK', 'PL', 'Profile ról', NULL);
INSERT INTO `internal_resources` VALUES ('ROLE_HEAD', 'PL', 'Profil roli', NULL);
INSERT INTO `internal_resources` VALUES ('ROLE_NAME', 'PL', 'Nazwa roli', NULL);
INSERT INTO `internal_resources` VALUES ('ROLE_DESCRIPTION', 'PL', 'Opis', NULL);
INSERT INTO `internal_resources` VALUES ('ROLE_FILTERMENU', 'PL', 'Adminstracja rolami', NULL);
INSERT INTO `internal_resources` VALUES ('USER_PERMISSIONS', 'PL', 'Uprawnienia u¿ytkownika', NULL);
INSERT INTO `internal_resources` VALUES ('UP_INTRO', 'PL', 'Proszê zaznaczyæ grupê i role w grupie, które checesz dodaæ dla u¿ytkownika.', NULL);
INSERT INTO `internal_resources` VALUES ('USER_TO_GROUP', 'PL', 'Dodanie u¿ytkownika do grupy', NULL);
INSERT INTO `internal_resources` VALUES ('ERROR_SEL_GROUP', 'PL', 'Nale¿y wybraæ grupê!', NULL);
INSERT INTO `internal_resources` VALUES ('ERROR_SEL_ROLE', 'PL', 'Nale¿y wybraæ co najmniej jedn± rolê!', NULL);
INSERT INTO `internal_resources` VALUES ('USER_PROFILE', 'PL', 'Mój profil', NULL);
INSERT INTO `internal_resources` VALUES ('COMMIT', 'PL', 'Powie¿', NULL);
INSERT INTO `internal_resources` VALUES ('CANCEL', 'PL', 'Anuluj', NULL);
INSERT INTO `internal_resources` VALUES ('YES', 'PL', 'Tak', NULL);
INSERT INTO `internal_resources` VALUES ('NO', 'PL', 'Nie', NULL);
INSERT INTO `internal_resources` VALUES ('NEW', 'PL', 'Wstaw nowy', NULL);
INSERT INTO `internal_resources` VALUES ('NAME', 'PL', 'Nazwa', NULL);
INSERT INTO `internal_resources` VALUES ('DESCRIPTION', 'PL', 'Opis', NULL);
INSERT INTO `internal_resources` VALUES ('DOSOMETHING', 'PL', 'Proszê wybraæ dzia³anie, które chesz wykonaæ. Mo¿esz wybraæ nowe elementy, edytowaæ elementy, usun±æ elementy lub zmieniæ kolejno¶æ elementów.', NULL);
INSERT INTO `internal_resources` VALUES ('EDIT', 'PL', 'Edycja', NULL);
INSERT INTO `internal_resources` VALUES ('UP', 'PL', 'W górê', NULL);
INSERT INTO `internal_resources` VALUES ('DOWN', 'PL', 'W dó³', NULL);
INSERT INTO `internal_resources` VALUES ('CONTAINERNAME', 'PL', 'Szablon', NULL);
INSERT INTO `internal_resources` VALUES ('SELECTOBJECT', 'PL', 'Proszê wybraæ klasê oraz okre¶liæ pozycjê i nazwê dla tworzonego obiektu.<br> Dla pozycji u¿yj 0 dla okre¶lenia pocz±tkowej pozycji, 999 dla okre¶lenie na koñcu poza innymi pozycjami twojego wybory.', NULL);
INSERT INTO `internal_resources` VALUES ('POSITION', 'PL', 'Pozycja', NULL);
INSERT INTO `internal_resources` VALUES ('DELETE', 'PL', 'Usuñ', NULL);
INSERT INTO `internal_resources` VALUES ('TYPE', 'PL', 'Typ', NULL);
INSERT INTO `internal_resources` VALUES ('KEYWORDS', 'PL', 'S³owa kluczowe', NULL);
INSERT INTO `internal_resources` VALUES ('METATEMPLATE', 'PL', 'Dodatkowe meta klucze szablonu', NULL);
INSERT INTO `internal_resources` VALUES ('SELECT_VARIATION', 'PL', 'Wybierz odmianê', NULL);
INSERT INTO `internal_resources` VALUES ('ACTIVE_VARIATION', 'PL', 'Aktywne odmiany:', NULL);
INSERT INTO `internal_resources` VALUES ('NO_VARIATIONS', 'PL', 'Nie ma obecnie zdefiniowanych odmian tego obiektu!<br>Proszê skonsultowaæ to z programist± w celu sprawdzenia konfiguracji wybranego elementu!', NULL);
INSERT INTO `internal_resources` VALUES ('ED_CONTENT', 'PL', 'Edycja zawarto¶ci', NULL);
INSERT INTO `internal_resources` VALUES ('ED_META', 'PL', 'Edycja meta danych', NULL);
INSERT INTO `internal_resources` VALUES ('ED_DISPATCHER', 'PL', 'U¿yj tego przycisku w celu prze³±czenia siê pomiêdzy edytowaniem meta danych a edycj± zawarto¶ci.', NULL);
INSERT INTO `internal_resources` VALUES ('PREVIEW', 'PL', 'Podgl±d', NULL);
INSERT INTO `internal_resources` VALUES ('CHOOSEFILE', 'PL', 'Wybierz plik', NULL);
INSERT INTO `internal_resources` VALUES ('CONFIGURED', 'PL', 'Gotowy do u¿ycia.', NULL);
INSERT INTO `internal_resources` VALUES ('NOTCONFIGURED', 'PL', 'Nie skonfigurowany jeszcze.', NULL);
INSERT INTO `internal_resources` VALUES ('CONFIG', 'PL', 'Konfiguracja', NULL);
INSERT INTO `internal_resources` VALUES ('SELECT_CI', 'PL', 'Wybierz element zawarto¶ci', NULL);
INSERT INTO `internal_resources` VALUES ('SELECT_CL', 'PL', 'Wybierz element klastra', NULL);
INSERT INTO `internal_resources` VALUES ('EMPTY', 'PL', '&lt;pusty&gt;', NULL);
INSERT INTO `internal_resources` VALUES ('STATUS', 'PL', 'Status:', NULL);
INSERT INTO `internal_resources` VALUES ('UNIQUE', 'PL', 'To pole musi byæ unikalne!', NULL);
INSERT INTO `internal_resources` VALUES ('MANDATORY', 'PL', 'To pole nie mo¿e byæ puste!', NULL);
INSERT INTO `internal_resources` VALUES ('NOTNUMBER', 'PL', 'Nale¿y wprowadziæ numer do tego pola!', NULL);
INSERT INTO `internal_resources` VALUES ('WRONGDATE', 'PL', 'Data, która zosta³a wprowadzone nie istnieje!', NULL);
INSERT INTO `internal_resources` VALUES ('DATEFORMAT', 'PL', 'Format daty jest nieprawid³owy!', NULL);
INSERT INTO `internal_resources` VALUES ('PWDNOTMATCH', 'PL', 'Has³a, które zosta³y wprowadzone nie zgadzaj± siê!', NULL);
INSERT INTO `internal_resources` VALUES ('PWDTOOSHORT', 'PL', 'Has³o musi zawieraæ co najmniej 6 znaków!', NULL);
INSERT INTO `internal_resources` VALUES ('PROCERROR', 'PL', 'Wyst±pi³ b³±d podczas przetwarzania danych formularza. Proszê sprawdziæ pola zaznaczone na niebiesko i przeczytaæ dodatkowe informacje.', NULL);
INSERT INTO `internal_resources` VALUES ('SAVEERROR', 'PL', 'Wyst±pi³ b³±d podczas zapisywania danych do bazy danych. Proszê sprawdziæ czy baza danych jest pod³±czona lub zadzwoniæ do administratora.', NULL);
INSERT INTO `internal_resources` VALUES ('SAVESUCCESS', 'PL', 'Dane zosta³y poprawnie zapisane do bazy danych.', NULL);
INSERT INTO `internal_resources` VALUES ('DELETESUCCESS', 'PL', 'Dane wypisane poni¿ej zosta³y poprawnie usuniête z bazy danych. Zosta³y ca³kowicie usuniête!', NULL);
INSERT INTO `internal_resources` VALUES ('SELECTONE', 'PL', 'Tutaj nale¿y dokonaæ wyboru!', NULL);
INSERT INTO `internal_resources` VALUES ('CREATENEW', 'PL', 'Nowy cz³onek tego szablonu zosta³ utworzony zobacz dane wypisane poni¿ej.', NULL);
INSERT INTO `internal_resources` VALUES ('PROMPTDELETE', 'PL', 'Czy na pewno chcesz usun±æ ten zestaw danych? Ta akcja nie mo¿e zostaæ cofniêta!', NULL);
INSERT INTO `internal_resources` VALUES ('RESET', 'PL', 'Wyczy¶æ formularz', NULL);
INSERT INTO `internal_resources` VALUES ('BACK', 'PL', 'Wstecz', NULL);
INSERT INTO `internal_resources` VALUES ('CREATE', 'PL', 'Utwórz element', NULL);
INSERT INTO `internal_resources` VALUES ('ERROR', 'PL', 'Wyst±pi³ b³±d podczas operacji wykonywania wyboru!', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE', 'PL', 'Usuniêcie bazy danych', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_MES', 'PL', 'Proszê wybraæ czêsci bazy danych, które zamierzasz usun±æ.', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_VAR', 'PL', 'Usuniêcie odmian', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_CONTENT', 'PL', 'Usuniêcie zawarto¶ci', NULL);
INSERT INTO `internal_resources` VALUES ('VAR_SUCCEEDED', 'PL', ' powiod³o siê!', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_FOLDER', 'PL', 'Usuniêcie folderu', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_CLUSTER', 'PL', 'Usuniêcie klastra', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_META', 'PL', 'Usuniêcie Meta', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_CLT', 'PL', 'Usuniêcie szablonów klastra', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_PAGES', 'PL', 'Usuniêcie stron serwisu i wzorców', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_EXPIRED', 'PL', 'Usuniêcie stron przedawnionych', NULL);
INSERT INTO `internal_resources` VALUES ('HELP_COMPGRP', 'DE', 'Verbund-Gruppen sind Gruppen von Clustern. Cluster-Vorlagen können ein eigenes Layout besitzen. Dies ermöglicht Ihnen, Ihre Homepage aus Blöcken zusammenzusezten, z.B. News, Umfrage, Bildergalerie - alles auf einer Seite und bei Bedarf.', '');
INSERT INTO `internal_resources` VALUES ('NO_CLUSTERTEMPLATES', 'DE', 'Es gibt keine Cluster-Vorlagen', '');
INSERT INTO `internal_resources` VALUES ('HELP_CLT', 'DE', 'Cluster-Vorlagen erlauben Ihnen, die Struktur für Ihre Site festzulegen und den Typ von Inhalten zu bestimmen. Anschließend werden Cluster-Vorlagen mit Seiten-Vorlagen verschmolzen, welche die Inhalte in der Web-Seite darstellen.', '');
INSERT INTO `internal_resources` VALUES ('SPM_SELECTTHUMB', 'DE', 'Vorschaubild auswählen', '');
INSERT INTO `internal_resources` VALUES ('TT_REFRESH', 'DE', 'Instanzen erneuern aktualisiert zwischengespeicherte Seiten mit den geänderten Werten.', '');
INSERT INTO `internal_resources` VALUES ('HELP_PAGETEMP', 'DE', 'In Tabellenkalkulations- und Datenbank-Anwendungen ist eine Vorlage ein leeres Formular, das zeigt, welche Felder an welcher Position und in welcher Länge existieren. In N/X sind Vorlage die Grundlage für jede Ausgabe. Eine Vorlage ist ein Formular, in dem alle Zellen definiert wurden, jedoch noch keine Inhalte hinterlegt wurden.', '');
INSERT INTO `internal_resources` VALUES ('CREATED', 'DE', 'Erstellt', '');
INSERT INTO `internal_resources` VALUES ('EDITED', 'DE', 'Bearbeitet', '');
INSERT INTO `internal_resources` VALUES ('IN_CHANNEL', 'DE', 'in Kanal', '');
INSERT INTO `internal_resources` VALUES ('AUTHOR', 'DE', 'Autor', '');
INSERT INTO `internal_resources` VALUES ('SEL_ARTICLE', 'DE', 'Artikel auswählen', '');
INSERT INTO `internal_resources` VALUES ('CH_CAT', 'DE', 'Kategorien definieren', '');
INSERT INTO `internal_resources` VALUES ('CH_ADMIN', 'DE', 'Kanal-Administration', '');
INSERT INTO `internal_resources` VALUES ('ARTICLES', 'DE', 'Atikel', '');
INSERT INTO `internal_resources` VALUES ('CHANNEL_SELECT', 'DE', 'Kanal auswählen', '');
INSERT INTO `internal_resources` VALUES ('HELP_OBJBROWSE', 'DE', 'Die Inhalts-Bibliothek enthält alle Inhalte der Site.', '');
INSERT INTO `internal_resources` VALUES ('HELP_SP', 'DE', 'Die Sitemap dient zum Bearbeiten von Seiten-Struktur und Seiten', '');
INSERT INTO `internal_resources` VALUES ('MH_GETSTART', 'DE', 'Erste Schritte', '');
INSERT INTO `internal_resources` VALUES ('M_HELP', 'DE', 'Hilfe', '');
INSERT INTO `internal_resources` VALUES ('M_CHANNELS', 'DE', 'Kanäle', '');
INSERT INTO `internal_resources` VALUES ('M_EXPORT_WZ', 'DE', 'Export-Assistent', '');
INSERT INTO `internal_resources` VALUES ('M_IMPORT_WZ', 'DE', 'Import-Assistent', '');
INSERT INTO `internal_resources` VALUES ('SYNC_CLUSTERS', 'DE', 'Cluster synchronisieren', '');
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
INSERT INTO `internal_resources` VALUES ('WEEKDAY_AS', 'DE', 'Wochentags-Analyse', '');
INSERT INTO `internal_resources` VALUES ('VIS_FIRST', 'DE', 'Erstmalige Besucher', '');
INSERT INTO `internal_resources` VALUES ('VIS_ONL', 'DE', 'Besucher online', '');
INSERT INTO `internal_resources` VALUES ('VIS_PER_VIS', 'DE', 'Durchschnittliche Besucher je Besucher', '');
INSERT INTO `internal_resources` VALUES ('VIS_RET', 'DE', 'Wiederkehrende Besucher', '');
INSERT INTO `internal_resources` VALUES ('WEBSITE', 'DE', 'Website', '');
INSERT INTO `internal_resources` VALUES ('VISITS_OVERVIEW', 'DE', 'Besuchs-Übersicht', '');
INSERT INTO `internal_resources` VALUES ('VISITS', 'DE', 'Besuche', '');
INSERT INTO `internal_resources` VALUES ('VISITORS', 'DE', 'Besucher', '');
INSERT INTO `internal_resources` VALUES ('USER_PERMISSION', 'DE', 'Benutzerrechte bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('USER_JS', 'DE', 'Javascript verwenden', '');
INSERT INTO `internal_resources` VALUES ('USER_GENERAL', 'DE', 'Allgemeine Benutzerdaten bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('USER_BL', 'DE', 'Hintergrund-Sprache', '');
INSERT INTO `internal_resources` VALUES ('USAGE', 'DE', 'Benutzung', '');
INSERT INTO `internal_resources` VALUES ('USERPERM_HEAD', 'DE', 'Benutzer-Rechte berabeiten', '');
INSERT INTO `internal_resources` VALUES ('TRANSLATION', 'DE', 'N/X Übersetzungs-System', '');
INSERT INTO `internal_resources` VALUES ('TOTAL', 'DE', 'Total', '');
INSERT INTO `internal_resources` VALUES ('TOP_SKW', 'DE', 'Top Such-Schlüsselworte', '');
INSERT INTO `internal_resources` VALUES ('TOP_SI', 'DE', 'Top Suchmaschinen', '');
INSERT INTO `internal_resources` VALUES ('TOP_REFERER', 'DE', 'Top Referer', '');
INSERT INTO `internal_resources` VALUES ('TOP_PATHS', 'DE', 'Top Pfade', '');
INSERT INTO `internal_resources` VALUES ('TOP_OS', 'DE', 'Top Betriebssysteme', '');
INSERT INTO `internal_resources` VALUES ('TOP_EXITT', 'DE', 'Top Ausgangs-Ziele', '');
INSERT INTO `internal_resources` VALUES ('TOP_HOSTS', 'DE', 'Top Hosts', '');
INSERT INTO `internal_resources` VALUES ('TOP_BROWSER', 'DE', 'Top Browser', '');
INSERT INTO `internal_resources` VALUES ('TMPL_NAME', 'DE', 'Vorlage auswählen', '');
INSERT INTO `internal_resources` VALUES ('TODAY', 'DE', 'Heute', '');
INSERT INTO `internal_resources` VALUES ('TOP', 'DE', 'Daten einschränken', '');
INSERT INTO `internal_resources` VALUES ('TIPP_TEMPLATE_1', 'DE', 'Vorlagen sind die Basis jeder Ausgabe von N/X. Sie müssen zunächst eine Cluster-Vorlage erstellen, die die Struktur und die Art der Inhalte definiert. Anschließend können Sie die Seiten-Vorlage erstellen, indem Sie eine Cluster-Vorlage mit einer PHP-datei verbinden.', '');
INSERT INTO `internal_resources` VALUES ('TIME_BETW_VISITS', 'DE', 'Durchschnittliche Zeit zwischen Besuchen', '');
INSERT INTO `internal_resources` VALUES ('THISYEAR', 'DE', 'Dieses Jahr', '');
INSERT INTO `internal_resources` VALUES ('THISWEEK', 'DE', 'Dieses Woche', '');
INSERT INTO `internal_resources` VALUES ('THISMONTH', 'DE', 'Dieser Monat', '');
INSERT INTO `internal_resources` VALUES ('TF', 'DE', 'Zeitrahmen', '');
INSERT INTO `internal_resources` VALUES ('TESTS', 'DE', 'N/X Unit-Tests', '');
INSERT INTO `internal_resources` VALUES ('TEMPLATE', 'DE', 'Vorlage', '');
INSERT INTO `internal_resources` VALUES ('STNAME', 'DE', 'Wählen Sie einen Namen, um die Seite in der Sitemap zu identifizieren', '');
INSERT INTO `internal_resources` VALUES ('STATS_HEADER', 'DE', 'N/X 2004 Traffic-Statistiken', '');
INSERT INTO `internal_resources` VALUES ('STATS', 'DE', 'Statistiken', '');
INSERT INTO `internal_resources` VALUES ('START_BAK', 'DE', 'Datensicherung starten', '');
INSERT INTO `internal_resources` VALUES ('SP_RLTREE', 'DE', 'Baum auffrischen', '');
INSERT INTO `internal_resources` VALUES ('SP_MENUDIRECTTITLE', 'DE', 'Optionalen Pfad auf dem Server für direkten Zugriff angeben', '');
INSERT INTO `internal_resources` VALUES ('SP_MENUDIRECT', 'DE', 'Direkt-URL auf Live-Server', '');
INSERT INTO `internal_resources` VALUES ('SP_MENUDIRECTTIT', 'DE', 'Optionalen Pfad auf dem Server für direkten Zugriff angeben', '');
INSERT INTO `internal_resources` VALUES ('SPM_THUMBNAIL', 'DE', 'Vorschaubild', '');
INSERT INTO `internal_resources` VALUES ('SPM_RLAUNCH', 'DE', 'Instanzen erneuern', '');
INSERT INTO `internal_resources` VALUES ('SMA_EXT_EDIT', 'DE', 'Bearbeitungs-Fenster öffnen. Alle inline bearbeiteten Texte vorher speichern !', '');
INSERT INTO `internal_resources` VALUES ('SHORTEST_PATHS', 'DE', 'Kürzeste Pfade', '');
INSERT INTO `internal_resources` VALUES ('SET', 'DE', 'Setzen', '');
INSERT INTO `internal_resources` VALUES ('SEL_MEM', 'DE', 'Gewählte Mitglieder', '');
INSERT INTO `internal_resources` VALUES ('SELMULTIPLE', 'DE', 'Halten Sie die STRG-Taste gedrückt, um mehrere Elemente auszuwählen', '');
INSERT INTO `internal_resources` VALUES ('SELECT', 'DE', 'Auswählen', '');
INSERT INTO `internal_resources` VALUES ('SEARCH_CLEAR', 'DE', 'Filter zurücksetzen', '');
INSERT INTO `internal_resources` VALUES ('SAVE_BACK', 'DE', 'Speichern und Zurück', '');
INSERT INTO `internal_resources` VALUES ('SAVE', 'DE', 'Speichern', '');
INSERT INTO `internal_resources` VALUES ('RL_PERM', 'DE', 'Rollen-Berechtigungen', '');
INSERT INTO `internal_resources` VALUES ('RET_VIS', 'DE', 'Wiederkerende Besucher', '');
INSERT INTO `internal_resources` VALUES ('RESET_FORM', 'DE', 'Formular zurücksetzen', '');
INSERT INTO `internal_resources` VALUES ('REMAIN_POS', 'DE', 'Position beibehalten', '');
INSERT INTO `internal_resources` VALUES ('REFERER', 'DE', 'Referer', '');
INSERT INTO `internal_resources` VALUES ('RB_CACHE', 'DE', 'Zwischenspeichern neu aufbauen', '');
INSERT INTO `internal_resources` VALUES ('RATERES', 'DE', 'Ergebnisse bewerten', '');
INSERT INTO `internal_resources` VALUES ('RANK', 'DE', 'Rang', '');
INSERT INTO `internal_resources` VALUES ('RANDOM', 'DE', 'zufällig', '');
INSERT INTO `internal_resources` VALUES ('PTEMPL', 'DE', 'Seiten-Vorlagen', '');
INSERT INTO `internal_resources` VALUES ('PROPERTIES', 'DE', 'Eigenschaften', '');
INSERT INTO `internal_resources` VALUES ('PRINT', 'DE', 'Drucken', '');
INSERT INTO `internal_resources` VALUES ('PREDEF_TIME', 'DE', 'Vordefinierter Zeitrahmen', '');
INSERT INTO `internal_resources` VALUES ('POS_IN_MENU', 'DE', 'Position in Sitemap', '');
INSERT INTO `internal_resources` VALUES ('PI_OVERVIEW', 'DE', 'Überischt Seiten-Ansichten', '');
INSERT INTO `internal_resources` VALUES ('PI', 'DE', 'Seiten-Ansichten', '');
INSERT INTO `internal_resources` VALUES ('PGNTXT_SMA', 'DE', 'Alle bearbeiteten Texte auf der Seite speichern', '');
INSERT INTO `internal_resources` VALUES ('PERCENT', 'DE', 'Prozent', '');
INSERT INTO `internal_resources` VALUES ('PATHS', 'DE', 'Click-Pfade', '');
INSERT INTO `internal_resources` VALUES ('PAGE', 'DE', 'Seite', '');
INSERT INTO `internal_resources` VALUES ('PAGES', 'DE', 'Seiten', '');
INSERT INTO `internal_resources` VALUES ('PATH', 'DE', 'Pfad', '');
INSERT INTO `internal_resources` VALUES ('OVERVIEW', 'DE', 'Übersicht', '');
INSERT INTO `internal_resources` VALUES ('OTHERS', 'DE', 'Andere', '');
INSERT INTO `internal_resources` VALUES ('ORDERCOMP', 'DE', 'Sortierung von Verbünden', '');
INSERT INTO `internal_resources` VALUES ('OLDEST', 'DE', 'älteste', '');
INSERT INTO `internal_resources` VALUES ('ORDER', 'DE', 'nach Sortierung', '');
INSERT INTO `internal_resources` VALUES ('OK', 'DE', 'Ok', '');
INSERT INTO `internal_resources` VALUES ('NUMBER_OF_INSTANCES', 'DE', 'Bitte geben Sie an, wie viele Instanzen Sie erzeugen möchten.', '');
INSERT INTO `internal_resources` VALUES ('NO_CONTENTS', 'DE', 'In diesem Ordner existieren keine Inhalte', '');
INSERT INTO `internal_resources` VALUES ('NO_CLUSTER_SELECTED', 'DE', 'Kein Cluster ausgewählt', '');
INSERT INTO `internal_resources` VALUES ('NEW_FOLDER', 'DE', 'Ordner erstellen', '');
INSERT INTO `internal_resources` VALUES ('NEW_CONTENT', 'DE', 'Neuer Inhalt', '');
INSERT INTO `internal_resources` VALUES ('M_WWW', 'DE', 'Website', '');
INSERT INTO `internal_resources` VALUES ('M_TEMP', 'DE', 'Vorlagen', '');
INSERT INTO `internal_resources` VALUES ('M_TRANSLATION', 'DE', 'Übersetzung', '');
INSERT INTO `internal_resources` VALUES ('M_ROLLOUT', 'DE', 'Rollout', '');
INSERT INTO `internal_resources` VALUES ('M_REPORT', 'DE', 'Seiten-Bericht', '');
INSERT INTO `internal_resources` VALUES ('M_PTEMP', 'DE', 'Seiten Vorlagen', '');
INSERT INTO `internal_resources` VALUES ('M_MAINTENANCE', 'DE', 'Wartung', '');
INSERT INTO `internal_resources` VALUES ('M_LIB', 'DE', 'Bibliothek', '');
INSERT INTO `internal_resources` VALUES ('CL_CREATEINSMES', 'DE', 'Es stehen noch freie Plätze zur Erzeugung von zusätzlichen Instanzen dieses Inhalts-Feldes zur Verfügung. Wenn Sie eine neue Instanz erzuegen möchten, geben Sie den Titel in das untenstehende Textfeld ein und klicken Sie auf die Erzeug', '');
INSERT INTO `internal_resources` VALUES ('CL_CREATEINSTANC', 'DE', 'neue Instanz erzeugen', '');
INSERT INTO `internal_resources` VALUES ('CL_EDIT', 'DE', 'Cluster-Instanz bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('CL_DELMES', 'DE', 'Möchen Sie diese Instanz des Clusters wirklich löschen? Sämtlicher Inhalt geht hiermit verloren!', '');
INSERT INTO `internal_resources` VALUES ('CL_DEL', 'DE', 'Instance löschen', '');
INSERT INTO `internal_resources` VALUES ('CL_PROPERTIES', 'DE', 'Cluster Eigenschaften', '');
INSERT INTO `internal_resources` VALUES ('CL_NEW', 'DE', 'Neue Instanz', '');
INSERT INTO `internal_resources` VALUES ('CL_BROWSE', 'DE', 'Cluster durchsuchen', '');
INSERT INTO `internal_resources` VALUES ('SPM_PATH', 'DE', 'Vorlagen-Pfad', '');
INSERT INTO `internal_resources` VALUES ('SPM_CLUSTER', 'DE', 'Cluster-Vorlage', '');
INSERT INTO `internal_resources` VALUES ('SPM_TYPE', 'DE', 'Seiten-Typ', '');
INSERT INTO `internal_resources` VALUES ('SPM_VARIATIONS', 'DE', 'mögliche Variationen', '');
INSERT INTO `internal_resources` VALUES ('SPM_META', 'DE', 'META-Key Vorlage', '');
INSERT INTO `internal_resources` VALUES ('SPM_EDIT', 'DE', 'Sitepage-Master bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('SPM', 'DE', 'Sitepage-Master', '');
INSERT INTO `internal_resources` VALUES ('ACTIVE', 'DE', 'Aktiviert', '');
INSERT INTO `internal_resources` VALUES ('NOSPTITLE', 'DE', 'Sie müssen einen Menünamen angeben, bevor Sie die Seite launchen können!', '');
INSERT INTO `internal_resources` VALUES ('SP_EXPIRE', 'DE', 'Seite deaktivieren', '');
INSERT INTO `internal_resources` VALUES ('SP_LAUNCH', 'DE', 'Seite launchen', '');
INSERT INTO `internal_resources` VALUES ('SP_PREVIEW', 'DE', 'Seiten-Vorschau', '');
INSERT INTO `internal_resources` VALUES ('SP_LAUNCHDATES', 'DE', 'Live Time-Konfiguration', '');
INSERT INTO `internal_resources` VALUES ('SP_EXPIREDATE', 'DE', 'Inaktiv ab', '');
INSERT INTO `internal_resources` VALUES ('SP_LAUNCHDATE', 'DE', 'Aktiv ab', '');
INSERT INTO `internal_resources` VALUES ('SP_MENUHELP', 'DE', 'Hilfetext für das Menü', '');
INSERT INTO `internal_resources` VALUES ('SP_MENUNAME', 'DE', 'Name im Menü', '');
INSERT INTO `internal_resources` VALUES ('SP_MENUPROPS', 'DE', 'Menü-Name und Hilfetext', '');
INSERT INTO `internal_resources` VALUES ('SP_EDIT', 'DE', 'Sitepage bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('SP_CLNEW', 'DE', 'Neue Cluster-Instanz erzeugen', '');
INSERT INTO `internal_resources` VALUES ('SP_LINK', 'DE', 'Link zu existierender Cluster-Instanz', '');
INSERT INTO `internal_resources` VALUES ('SP_CONFDESC', 'DE', 'Sie können diese Sitepage mit einer existierenden Instanz des Cluster verlinken oder eine neue Instanz erzeugen. Bitte entscheiden Sie, was Sie tun möchten.', '');
INSERT INTO `internal_resources` VALUES ('SP_CONFIGURE', 'DE', 'Seite konfigurieren', '');
INSERT INTO `internal_resources` VALUES ('SP_PDELETE', 'DE', 'Seite löschen', '');
INSERT INTO `internal_resources` VALUES ('SP_PDELMES', 'DE', 'Sie sind im Begriff eine Seite zu löschen. Bitte beachten Sie, dass auch die LIVE-Instanz dieser Seite gelöscht wird!', '');
INSERT INTO `internal_resources` VALUES ('SP_DELETE', 'DE', 'Sitepage löschen', '');
INSERT INTO `internal_resources` VALUES ('SP_DELMES', 'DE', 'Sie sind im Begriff eine Sitepage zu löschen. Bitte bachten Sie, dass auch die LIVE-Instanz dieser Sitepage gelöscht wird!', '');
INSERT INTO `internal_resources` VALUES ('SP_PROPERTIES', 'DE', 'Eigenschaften', '');
INSERT INTO `internal_resources` VALUES ('SP_IPROPERTIES', 'DE', 'Seiten-Eigenschaften', '');
INSERT INTO `internal_resources` VALUES ('SP_NEWINSTANCE', 'DE', 'Neue Seite', '');
INSERT INTO `internal_resources` VALUES ('SP_NEWPAGE', 'DE', 'Sitepage hinzufügen', '');
INSERT INTO `internal_resources` VALUES ('SP_BROWSE', 'DE', 'Sitemap', '');
INSERT INTO `internal_resources` VALUES ('PO_EDIT', 'DE', 'Portalseite bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('PO_MYPORTAL', 'DE', 'Meine Portale', '');
INSERT INTO `internal_resources` VALUES ('PO_CRSUCCEEDED', 'DE', 'Neues Portal erfolgreich erstellt!', '');
INSERT INTO `internal_resources` VALUES ('PO_OWNER', 'DE', 'Seiten-Besitzer', '');
INSERT INTO `internal_resources` VALUES ('PO_BROWSER', 'DE', 'Portal-Browser', '');
INSERT INTO `internal_resources` VALUES ('M_COMBOBJ', 'DE', 'kombinierte Inhalte (Cluster)', '');
INSERT INTO `internal_resources` VALUES ('M_CLUSTERS', 'DE', 'Cluster', '');
INSERT INTO `internal_resources` VALUES ('M_CLT', 'DE', 'Cluster Vorlagen', '');
INSERT INTO `internal_resources` VALUES ('M_BACKUP', 'DE', 'Datensicherung', '');
INSERT INTO `internal_resources` VALUES ('M_ADMIN', 'DE', 'Administration', '');
INSERT INTO `internal_resources` VALUES ('M_ACCESS', 'DE', 'Zugriff', '');
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
INSERT INTO `internal_resources` VALUES ('MENU', 'DE', 'Menü', '');
INSERT INTO `internal_resources` VALUES ('MEDIAN', 'DE', 'Median', '');
INSERT INTO `internal_resources` VALUES ('MAXIMUMAT', 'DE', 'Maximum bei', '');
INSERT INTO `internal_resources` VALUES ('MAXIMUM', 'DE', 'Maximum', '');
INSERT INTO `internal_resources` VALUES ('LONGEST_PATHS', 'DE', 'Längste Pfade', '');
INSERT INTO `internal_resources` VALUES ('LOGS', 'DE', 'Log-Datei Analyse', '');
INSERT INTO `internal_resources` VALUES ('LOGGED_AS', 'DE', 'Eingeloggt als', '');
INSERT INTO `internal_resources` VALUES ('LOCK_MENU', 'DE', 'Menü serren', '');
INSERT INTO `internal_resources` VALUES ('LOCATION', 'DE', 'Verweisziel, falls extern', '');
INSERT INTO `internal_resources` VALUES ('LIVE_AUTHORING', 'DE', 'Live-Bearbeitung', '');
INSERT INTO `internal_resources` VALUES ('LIBRARY', 'DE', 'Inhalts-Bibliothek', '');
INSERT INTO `internal_resources` VALUES ('LAUNCH', 'DE', 'veröffentlichen', '');
INSERT INTO `internal_resources` VALUES ('LATEST', 'DE', 'jüngste', '');
INSERT INTO `internal_resources` VALUES ('LASTYEAR', 'DE', 'Letztes Jahr', '');
INSERT INTO `internal_resources` VALUES ('LASTWEEK', 'DE', 'Letzte Woche', '');
INSERT INTO `internal_resources` VALUES ('LASTMONTH', 'DE', 'Letzter Monat', '');
INSERT INTO `internal_resources` VALUES ('I_AFTER', 'DE', 'Einfügen nach', '');
INSERT INTO `internal_resources` VALUES ('IS_COMPOUND', 'DE', 'Verbund-Cluster-Vorlage', '');
INSERT INTO `internal_resources` VALUES ('IS_FILTERED', 'DE', 'Hinweis: Möglicherweise werden nicht alle Datensätze angezeigt, weil ein Filter verwendet wird.', '');
INSERT INTO `internal_resources` VALUES ('INSTANCE_CREATED', 'DE', 'Eine neue Instanz des Elements wurde erzeugt.', '');
INSERT INTO `internal_resources` VALUES ('INSNAME', 'DE', '', '');
INSERT INTO `internal_resources` VALUES ('IND_TIME', 'DE', 'individueller Zeitrahmen', '');
INSERT INTO `internal_resources` VALUES ('HOURS_AS', 'DE', 'Stunden-Analyse', '');
INSERT INTO `internal_resources` VALUES ('HOUR', 'DE', 'Stunden', '');
INSERT INTO `internal_resources` VALUES ('HELP', 'DE', 'Hilfe', '');
INSERT INTO `internal_resources` VALUES ('GO', 'DE', 'Los!', '');
INSERT INTO `internal_resources` VALUES ('GROUP_DESCRIPTION', 'DE', 'Beschreibung', '');
INSERT INTO `internal_resources` VALUES ('FOLDER_DELMES', 'DE', 'Möchen Sie diesen Ordner wirklich löschen ?', '');
INSERT INTO `internal_resources` VALUES ('ENVIRONMENT', 'DE', 'Umgebung', '');
INSERT INTO `internal_resources` VALUES ('EXPLORE', 'DE', 'Durchsuchen', '');
INSERT INTO `internal_resources` VALUES ('FILTER_COLUMN', 'DE', '...in', '');
INSERT INTO `internal_resources` VALUES ('FILTER_RULE', 'DE', 'Suche nach...', '');
INSERT INTO `internal_resources` VALUES ('ED_CPGROUPGENERAL', 'DE', 'Gruppe gerell bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('ED_CPGROUP', 'DE', 'Verbund-Gruppe bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('EDIT_TEMPLATE', 'DE', 'Vorlage bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('EDIT_SPM', 'DE', 'Vorlagen-Eigenschaften bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('EDIT_ALL', 'DE', 'Alles bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('EDIT_CONTENT', 'DE', 'Inhalt bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('EDIT_FOLDER', 'DE', 'Ordner bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('EDIT_ACCESS', 'DE', 'Zugriff festlegen', '');
INSERT INTO `internal_resources` VALUES ('DWEXT_CONTENTFIE', 'DE', 'Inhalts-Feld-Informationen erzeugen', '');
INSERT INTO `internal_resources` VALUES ('DATE', 'DE', 'Datum', '');
INSERT INTO `internal_resources` VALUES ('DEL_FOLDER', 'DE', 'Ordner löschen', '');
INSERT INTO `internal_resources` VALUES ('DESC', 'DE', 'Beschreibung', '');
INSERT INTO `internal_resources` VALUES ('DISPLAY', 'DE', 'Anzeigen', '');
INSERT INTO `internal_resources` VALUES ('CREATE_INSTANCES', 'DE', 'Instanzen erzeugen', '');
INSERT INTO `internal_resources` VALUES ('CR_CONTENT', 'DE', 'Inhalt für diese Seite erzeugen?', '');
INSERT INTO `internal_resources` VALUES ('COUNT', 'DE', 'Anzahl', '');
INSERT INTO `internal_resources` VALUES ('CPG_MEMBERS_SELECT', 'DE', 'Mitglieder dieser Verbundgruppe auswählen', '');
INSERT INTO `internal_resources` VALUES ('CP_GROUP', 'DE', 'Verbund-Gruppe', '');
INSERT INTO `internal_resources` VALUES ('COLOR', 'DE', 'Farbe', '');
INSERT INTO `internal_resources` VALUES ('COMB_ALL', 'DE', 'Alles auswählen', '');
INSERT INTO `internal_resources` VALUES ('COMB_NONE', 'DE', 'Auswahl entfernen', '');
INSERT INTO `internal_resources` VALUES ('COMMENT', 'DE', 'Kommentar', '');
INSERT INTO `internal_resources` VALUES ('CONTENT', 'DE', 'Inhalt', '');
INSERT INTO `internal_resources` VALUES ('CONTENT_DESC', 'DE', 'Beschreibung des Inhalts', '');
INSERT INTO `internal_resources` VALUES ('CL_NAME', 'DE', 'Cluster-Name', '');
INSERT INTO `internal_resources` VALUES ('CAL_NAME', 'DE', 'Kalender-Name', '');
INSERT INTO `internal_resources` VALUES ('CATEGORY', 'DE', 'Kategorie', '');
INSERT INTO `internal_resources` VALUES ('CAT_NAME', 'DE', 'Kategorie', '');
INSERT INTO `internal_resources` VALUES ('CLEAR_MEDIA', 'DE', 'Datei aus Datenbank entfernen', '');
INSERT INTO `internal_resources` VALUES ('CLK_PATHS', 'DE', 'Click-Pfade', '');
INSERT INTO `internal_resources` VALUES ('CAL_EDIT', 'DE', 'Termin bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('CALENDAR_SELECT', 'DE', 'Kalender auswählen', '');
INSERT INTO `internal_resources` VALUES ('CALENDARS_EDIT', 'DE', 'Kalender bearbeiten', '');
INSERT INTO `internal_resources` VALUES ('CALENDARS_TIPP', 'DE', 'Sie können hier verschiedene Kalender erstellen. Jeder Kalender wird seine eigenen Termine und Ereignisse haben.', '');
INSERT INTO `internal_resources` VALUES ('CALENDARS_DEFINE', 'DE', 'Kalender definieren', '');
INSERT INTO `internal_resources` VALUES ('CALENDAR', 'DE', 'Kalender', '');
INSERT INTO `internal_resources` VALUES ('CALENDARS', 'DE', 'Kalender', '');
INSERT INTO `internal_resources` VALUES ('CALENDARS_CAT_DEFINE', 'DE', 'Kategorien definieren', '');
INSERT INTO `internal_resources` VALUES ('CACHED', 'DE', 'Seite zwischenspeichern (cache)', '');
INSERT INTO `internal_resources` VALUES ('BEGIN', 'DE', 'Zu Beginn', '');
INSERT INTO `internal_resources` VALUES ('BAK_FILE', 'DE', 'Sicherungs-Datei', '');
INSERT INTO `internal_resources` VALUES ('BACKUP', 'DE', 'System-Sicherung', '');
INSERT INTO `internal_resources` VALUES ('BACK_INFO', 'DE', 'Die untenstehende Liste zeigt die auf Ihrem Server verfügbaren N/X-Sicherungen an. Sie können hier einzelne Sicherungen löschen. Um eine Sicherung zurück zu spielen, müssen Sie sich manuell auf Ihrem Server einloggen und die Dateien wiederherstellen.', '');
INSERT INTO `internal_resources` VALUES ('AVG_VIS_LENGTH', 'DE', 'durchschnittliche Besuchsdauer (Sekunden)', '');
INSERT INTO `internal_resources` VALUES ('AVG_VISIT_LENGTH', 'DE', 'durchschnittliche Besuchsdauer', '');
INSERT INTO `internal_resources` VALUES ('AVG_CLICKSTREAM', 'DE', 'durchschnittlicher Click-Pfad', '');
INSERT INTO `internal_resources` VALUES ('AVAIL_VARIATIONS', 'DE', 'Verfügbare Variationen', '');
INSERT INTO `internal_resources` VALUES ('AVERAGE', 'DE', 'Durchschnitt', '');
INSERT INTO `internal_resources` VALUES ('ACL_PARENT', 'DE', 'Berechtigungen geerbt von', '');
INSERT INTO `internal_resources` VALUES ('ACL_ROLE', 'DE', 'Rollen für Gruppe auswählen', '');
INSERT INTO `internal_resources` VALUES ('ACL_TITLE', 'DE', 'Setze Berechtigungen für', '');
INSERT INTO `internal_resources` VALUES ('AFTER', 'DE', 'Nach:', '');
INSERT INTO `internal_resources` VALUES ('ALC_OWNER', 'DE', 'Besitzer festlegen', '');
INSERT INTO `internal_resources` VALUES ('AVAIL_ITEMS', 'DE', 'Verfügbare Elemente', '');
INSERT INTO `internal_resources` VALUES ('ACL_INHERIT_NOTE', 'DE', 'Hinweis: Wenn dieses Feld markiert ist, ist keine andere Konfiguration verfügbar!', '');
INSERT INTO `internal_resources` VALUES ('ACL_OWNER', 'DE', 'Besitzer', '');
INSERT INTO `internal_resources` VALUES ('ACL_GROUPS', 'DE', 'Hinzuzufügende Gruppe auswählen', '');
INSERT INTO `internal_resources` VALUES ('ACL_GROUPSROLES', 'DE', 'Fremdzugriff', '');
INSERT INTO `internal_resources` VALUES ('ACL_INFO', 'DE', 'Zugriffsrechte vom Elternobjekt geerbt', '');
INSERT INTO `internal_resources` VALUES ('ACL_INHERIT', 'DE', 'Berechtigungen vom Elternobjekt erben', '');
INSERT INTO `internal_resources` VALUES ('PURGE_EXPIRED', 'DE', 'Deaktivierte Seiten bereinigen', '');
INSERT INTO `internal_resources` VALUES ('ACL_ACCESS', 'DE', 'Berechtigungen in Gruppen berabeiten', '');
INSERT INTO `internal_resources` VALUES ('ACL_GROUPEDIT', 'DE', 'Gruppe für Rollen-Bearbeitung auswählen', '');
INSERT INTO `internal_resources` VALUES ('PURGE_META', 'DE', 'Meta bereinigen', '');
INSERT INTO `internal_resources` VALUES ('PURGE_CLT', 'DE', 'Cluster-Vorlagen bereinigen', '');
INSERT INTO `internal_resources` VALUES ('PURGE_PAGES', 'DE', 'Sitepages und Master bereinigen', '');
INSERT INTO `internal_resources` VALUES ('PURGE_FOLDER', 'DE', 'Ordner bereinigen', '');
INSERT INTO `internal_resources` VALUES ('PURGE_CLUSTER', 'DE', 'Cluster bereinigen', '');
INSERT INTO `internal_resources` VALUES ('VAR_SUCCEEDED', 'DE', 'erfolgt!', '');
INSERT INTO `internal_resources` VALUES ('PURGE_VAR', 'DE', 'Variationen bereinigen', '');
INSERT INTO `internal_resources` VALUES ('PURGE_CONTENT', 'DE', 'Inhalt bereinigen', '');
INSERT INTO `internal_resources` VALUES ('ERROR', 'DE', 'Während der Ausführung der gewählten Operation ist ein Fehler aufgetreten!', '');
INSERT INTO `internal_resources` VALUES ('PURGE', 'DE', 'Datenbank bereinigen', '');
INSERT INTO `internal_resources` VALUES ('PURGE_MES', 'DE', 'Bitte wählen Sie die Teile der Datenbank, die Sie bereinigen möchten.', '');
INSERT INTO `internal_resources` VALUES ('RESET', 'DE', 'Formular zurücksetzen', '');
INSERT INTO `internal_resources` VALUES ('BACK', 'DE', 'Zurück', '');
INSERT INTO `internal_resources` VALUES ('CREATE', 'DE', 'Element erstellen', '');
INSERT INTO `internal_resources` VALUES ('SEARCH_LIVE_ACRTICLES', 'DE', 'Veröffentlichte Artikel', '');
INSERT INTO `internal_resources` VALUES ('SEASRCH_MISSING_VARIATIONS', 'DE', 'Fehlende Variationen', '');
INSERT INTO `internal_resources` VALUES ('SEL_CH', 'DE', 'Kanal auswählen', '');
INSERT INTO `internal_resources` VALUES ('SEL_CLUSTER', 'DE', 'Cluster auswählen', '');
INSERT INTO `internal_resources` VALUES ('SEL_EVENT', 'DE', 'Ereignis oder Termin speichern', '');
INSERT INTO `internal_resources` VALUES ('SEL_PTML', 'DE', 'Seiten-Vorlage auswählen', '');
INSERT INTO `internal_resources` VALUES ('SEL_VAR', 'DE', 'Variation auswählen', '');
INSERT INTO `internal_resources` VALUES ('SHOW', 'DE', 'anzeigen', '');
INSERT INTO `internal_resources` VALUES ('SHOW_ADVANCED_SEARCH', 'DE', 'erweiterte Suchoptionen anzeigen', '');
INSERT INTO `internal_resources` VALUES ('SHOW_ALL', 'DE', 'Alles anzeigen', '');
INSERT INTO `internal_resources` VALUES ('SHOW_PAGEWISE', 'DE', 'Seitenweise anzeigen', '');
INSERT INTO `internal_resources` VALUES ('STARTDATE', 'DE', 'Startdatum', '');
INSERT INTO `internal_resources` VALUES ('STARTTIME', 'DE', 'Startzeit', '');
INSERT INTO `internal_resources` VALUES ('SYNC_CLUSTERS_DESCR', 'DE', 'Wenn Sie eine Cluster-Vorlage ändern, werden die Cluster nicht automatisch synchronisiert. Sie werden synchronisiert, wenn Sie das nächste mal mit ihnen arbeiten. Hier können Sie alle manuell synchronisieren.', '');
INSERT INTO `internal_resources` VALUES ('TOP_ENTRYPAGES', 'DE', 'Top Eingangsseiten', '');
INSERT INTO `internal_resources` VALUES ('TOP_EXITPAGES', 'DE', 'Top Ausgangsseiten', '');
INSERT INTO `internal_resources` VALUES ('TOP_PAGES', 'DE', 'Top Seiten', '');
INSERT INTO `internal_resources` VALUES ('TRANS_TEMPL', 'DE', 'Übersetzen von', '');
INSERT INTO `internal_resources` VALUES ('TRANS_THIS', 'DE', 'Übersetzen Sie:', '');
INSERT INTO `internal_resources` VALUES ('UPL_TEXT', 'DE', 'Text-Datei hochladen', '');
INSERT INTO `internal_resources` VALUES ('WZE_ARTICLEIMPORT_SRCTYPE', 'DE', 'Bitte geben Sie den Quellen-Typ an, aus dem Sie die Artikel importieren möchten.', '');
INSERT INTO `internal_resources` VALUES ('WZE_ARTICLEIMPORT_TARGET', 'DE', 'Bitte wählen Sie rechts den Ziel-Kanal aus. Alle importierten Artikel werden in diesem Kanal gespeichert.', '');
INSERT INTO `internal_resources` VALUES ('WZT_ARTICLEIMPORT_SRCTYPE', 'DE', 'Quellen-Typ auswählen', '');
INSERT INTO `internal_resources` VALUES ('WZT_ARTICLEIMPORT_TARGET', 'DE', 'Ziel-Kanal auswählen', '');
INSERT INTO `internal_resources` VALUES ('WZT_KEEPCLUSTER', 'DE', 'Bestehende Cluster beibehalten?', '');
INSERT INTO `internal_resources` VALUES ('WZT_KEEPCLUSTER_EXPL', 'DE', 'Sie können festlegen, ob Sie die bestehenden Cluster beibehalten möchten oder lieber Kopien von jedem Cluster anlegen wollen.<br><br>Beachten Sie: Wenn Sie die bestehenden Cluster beibehalten, teilen Sie sie sich mit der ursprünglichen Quelle.', '');
INSERT INTO `internal_resources` VALUES ('WZ_ARTICLEIMPORT', 'DE', 'Artikel-Import Assistent', '');
INSERT INTO `internal_resources` VALUES ('WZ_ARTICLEIMPORT_TITLE', 'DE', 'Der Assistent hilft Ihnen, Artikel  aus unterschiedlichen Quellen in einen Kanal zu laden.', '');
INSERT INTO `internal_resources` VALUES ('USER_JS', 'EN', 'Use Javascript', '');
INSERT INTO `internal_resources` VALUES ('USER_BL', 'EN', 'Backend Language', '');
INSERT INTO `internal_resources` VALUES ('PO_BROWSER', 'EN', 'Portal Browser', '');
INSERT INTO `internal_resources` VALUES ('PO_OWNER', 'EN', 'Page owner', '');
INSERT INTO `internal_resources` VALUES ('PO_CRSUCCEEDED', 'EN', 'The creation of a new portal page succeeded!', '');
INSERT INTO `internal_resources` VALUES ('PO_MYPORTAL', 'EN', 'My Portals', '');
INSERT INTO `internal_resources` VALUES ('PO_EDIT', 'EN', 'Edit Portalpage', '');
INSERT INTO `internal_resources` VALUES ('SP_BROWSE', 'EN', 'Browse Sitemap', '');
INSERT INTO `internal_resources` VALUES ('SP_NEWPAGE', 'EN', 'Add Page', '');
INSERT INTO `internal_resources` VALUES ('SP_NEWINSTANCE', 'EN', 'Add Page', '');
INSERT INTO `internal_resources` VALUES ('SP_IPROPERTIES', 'EN', 'Page Properties', '');
INSERT INTO `internal_resources` VALUES ('SP_PROPERTIES', 'EN', 'Sitepage Properties', '');
INSERT INTO `internal_resources` VALUES ('SP_DELMES', 'EN', 'You are about to delete a sitepage. Please note, that also the LIVE-Instance of this sitepage will be deleted!', '');
INSERT INTO `internal_resources` VALUES ('SP_DELETE', 'EN', 'Delete Sitepage', '');
INSERT INTO `internal_resources` VALUES ('SP_PDELMES', 'EN', 'You are about to delete a page. Please note, that also the LIVE-Instance of this page will be deleted!', '');
INSERT INTO `internal_resources` VALUES ('SP_PDELETE', 'EN', 'Delete Page', '');
INSERT INTO `internal_resources` VALUES ('SP_CONFIGURE', 'EN', 'Configure Page', '');
INSERT INTO `internal_resources` VALUES ('SP_CONFDESC', 'EN', 'You can link this sitepage to an existing instance of the Cluster or you can create a new instance. Please decide, what you like to do.', '');
INSERT INTO `internal_resources` VALUES ('SP_LINK', 'EN', 'Link to existing cluster instance', '');
INSERT INTO `internal_resources` VALUES ('SP_CLNEW', 'EN', 'Create Cluster', '');
INSERT INTO `internal_resources` VALUES ('SP_EDIT', 'EN', 'Edit Sitepage', '');
INSERT INTO `internal_resources` VALUES ('SP_MENUPROPS', 'EN', 'Menu Name and Helptext', '');
INSERT INTO `internal_resources` VALUES ('SP_MENUNAME', 'EN', 'Name on Menu', '');
INSERT INTO `internal_resources` VALUES ('SP_MENUHELP', 'EN', 'Helptext for Menu', '');
INSERT INTO `internal_resources` VALUES ('SP_LAUNCHDATE', 'EN', 'Active from', '');
INSERT INTO `internal_resources` VALUES ('SP_EXPIREDATE', 'EN', 'Expired from', '');
INSERT INTO `internal_resources` VALUES ('SP_LAUNCHDATES', 'EN', 'Live Time Configuration', '');
INSERT INTO `internal_resources` VALUES ('SP_PREVIEW', 'EN', 'Preview Page', '');
INSERT INTO `internal_resources` VALUES ('SP_LAUNCH', 'EN', 'Launch Page', '');
INSERT INTO `internal_resources` VALUES ('SP_EXPIRE', 'EN', 'Expire Page', '');
INSERT INTO `internal_resources` VALUES ('NOSPTITLE', 'EN', 'You must define the Name on Menu before you can launch the page!', '');
INSERT INTO `internal_resources` VALUES ('ACTIVE', 'EN', 'Show Page in Menu', 'When you uncheck this box, the page will no longer be displayed in the menu of the website.');
INSERT INTO `internal_resources` VALUES ('SPM', 'EN', 'Sitepage Master', '');
INSERT INTO `internal_resources` VALUES ('SPM_EDIT', 'EN', 'Edit Sitepage Master', '');
INSERT INTO `internal_resources` VALUES ('SPM_META', 'EN', 'META-Key Template', '');
INSERT INTO `internal_resources` VALUES ('SPM_VARIATIONS', 'EN', 'Displayable Variations', 'Select the variations, this template is valid for. If you have languages as variations, you should select all languages.');
INSERT INTO `internal_resources` VALUES ('SPM_TYPE', 'EN', 'Page Type', 'Please select always singlepage. Multipage is mature and is there for compatiblity reasons only. Use channels instead.');
INSERT INTO `internal_resources` VALUES ('SPM_CLUSTER', 'EN', 'Cluster Template', '');
INSERT INTO `internal_resources` VALUES ('SPM_PATH', 'EN', 'Template Path', 'Filename of the php-file which will be called when you use the page. The file will be created in wwwdev and copied to www after launch.');
INSERT INTO `internal_resources` VALUES ('CL_BROWSE', 'EN', 'Browse Clusters', '');
INSERT INTO `internal_resources` VALUES ('CL_NEW', 'EN', 'Create Cluster', '');
INSERT INTO `internal_resources` VALUES ('CL_PROPERTIES', 'EN', 'Cluster Properties', '');
INSERT INTO `internal_resources` VALUES ('CL_DEL', 'EN', 'Delete Instance', '');
INSERT INTO `internal_resources` VALUES ('CL_DELMES', 'EN', 'Do you really want to delete this instance of the cluster. All content data will be lost!', '');
INSERT INTO `internal_resources` VALUES ('CL_EDIT', 'EN', 'Edit Cluster-Instance', '');
INSERT INTO `internal_resources` VALUES ('CL_CREATEINSTANC', 'EN', 'Create new Instance', '');
INSERT INTO `internal_resources` VALUES ('CL_CREATEINSMES', 'EN', 'There are still slots left for creating additional instances of this content-field. If you want to create another instance, then enter a title in the textfield below and press the Create button.', '');
INSERT INTO `internal_resources` VALUES ('CL_NOTITLE', 'EN', 'No title defined yet', '');
INSERT INTO `internal_resources` VALUES ('TITLE', 'EN', 'Title', '');
INSERT INTO `internal_resources` VALUES ('CLI_EDIT', 'EN', 'Edit Cluster member', '');
INSERT INTO `internal_resources` VALUES ('CLI_DELETE', 'EN', 'Delete Cluster member', '');
INSERT INTO `internal_resources` VALUES ('CLI_DELETEMES', 'EN', 'Do you really want to delete this cluster. It will be lost forever!', '');
INSERT INTO `internal_resources` VALUES ('CLI_DELETED', 'EN', 'The cluster has been deleted!', '');
INSERT INTO `internal_resources` VALUES ('CLI_NOTDELETED', 'EN', 'This cluster cannot be deleted!', '');
INSERT INTO `internal_resources` VALUES ('CLI', 'EN', 'Cluster:', '');
INSERT INTO `internal_resources` VALUES ('SR_SELECTCI', 'EN', 'You can search for any content-items here. If you want to select a content-item, then choose it and press the Update button! If you want to connect new content with this field, create the content in the Object Browser first.', '');
INSERT INTO `internal_resources` VALUES ('SR_SELECTCLI', 'EN', 'Please select a cluster-template. Afterwards you can select an instance of the template for use.', '');
INSERT INTO `internal_resources` VALUES ('FOLDER', 'EN', 'Folder', '');
INSERT INTO `internal_resources` VALUES ('CONTENTTYPE', 'EN', 'Content-Type', '');
INSERT INTO `internal_resources` VALUES ('CONTENTITEM', 'EN', 'Content-Item', '');
INSERT INTO `internal_resources` VALUES ('SEARCH', 'EN', 'Start Search', '');
INSERT INTO `internal_resources` VALUES ('SEARCHIN', 'EN', 'Search for', '');
INSERT INTO `internal_resources` VALUES ('SEARCHRESULTS', 'EN', 'Search results, please select', '');
INSERT INTO `internal_resources` VALUES ('SELECTEDOBJECT', 'EN', 'Currently Selected Content-Item', '');
INSERT INTO `internal_resources` VALUES ('SELECTEDINSTANCE', 'EN', 'Selected Cluster-Instance', '');
INSERT INTO `internal_resources` VALUES ('M_META', 'EN', 'Meta Templates', '');
INSERT INTO `internal_resources` VALUES ('M_BROWSER', 'EN', 'Object Browser', '');
INSERT INTO `internal_resources` VALUES ('M_INSTALLPLUGIN', 'EN', 'PlugIns', '');
INSERT INTO `internal_resources` VALUES ('M_ES', 'EN', 'Explore Site', '');
INSERT INTO `internal_resources` VALUES ('M_SPM', 'EN', 'Sitepage-Master', '');
INSERT INTO `internal_resources` VALUES ('M_PRTMAN', 'EN', 'Portal Manager', '');
INSERT INTO `internal_resources` VALUES ('M_MYPRT', 'EN', 'My Portals', '');
INSERT INTO `internal_resources` VALUES ('M_MYPROFILE', 'EN', 'My Profile', '');
INSERT INTO `internal_resources` VALUES ('M_LOGOUT', 'EN', 'Logout', '');
INSERT INTO `internal_resources` VALUES ('M_CLB', 'EN', 'Cluster Browser', '');
INSERT INTO `internal_resources` VALUES ('M_CLTB', 'EN', 'Cluster-Template Browser', '');
INSERT INTO `internal_resources` VALUES ('M_UMAN', 'EN', 'User Mangement', '');
INSERT INTO `internal_resources` VALUES ('M_VAR', 'EN', 'Variations', '');
INSERT INTO `internal_resources` VALUES ('M_PURGE', 'EN', 'Purge Database', '');
INSERT INTO `internal_resources` VALUES ('M_PGN', 'EN', 'Plugin Control', '');
INSERT INTO `internal_resources` VALUES ('M_REPORT', 'EN', 'Site Report', '');
INSERT INTO `internal_resources` VALUES ('CLT_NEW', 'EN', 'New CL-Template', '');
INSERT INTO `internal_resources` VALUES ('CLT_BROWSE', 'EN', 'Browse CL-Templates', '');
INSERT INTO `internal_resources` VALUES ('CLT_NAME', 'EN', 'CL-Template Name', 'Name of the cluster-tempalte. You can edit cluster templates in Templages &amp;gt; Custer-Templates.');
INSERT INTO `internal_resources` VALUES ('CLT_PROPERTIES', 'EN', 'Cluster-Template Properties', '');
INSERT INTO `internal_resources` VALUES ('CLT_DELETE', 'EN', 'Delete Cluster-Template', '');
INSERT INTO `internal_resources` VALUES ('CLT_DELMES', 'EN', 'You are about to delete a cluster-template. This will cause the loss of all(!) contents created on and with that cluster-template. Are you sure, you want to procceed?', '');
INSERT INTO `internal_resources` VALUES ('CLTI_DELETE', 'EN', 'Do you really want to delete this Item. All instances of this item will be lost also!', '');
INSERT INTO `internal_resources` VALUES ('CLT_SCHEME', 'EN', 'Edit Cluster-Template Scheme', '');
INSERT INTO `internal_resources` VALUES ('CLT_MINCARD', 'EN', 'Instances', '');
INSERT INTO `internal_resources` VALUES ('CLT_MAXCARD', 'EN', '-', '');
INSERT INTO `internal_resources` VALUES ('LINKED', 'EN', 'Linked to', '');
INSERT INTO `internal_resources` VALUES ('PG_INSTALLDESC', 'EN', 'Please make sure that you copied all neccessary files into the folder, before succeeding. Insert the correct path to the plugin in the Input-field below. The system will then install the PlugIn automatically.', '');
INSERT INTO `internal_resources` VALUES ('PG_CHOOSE', 'EN', 'PlugIn:   /plugin/', '');
INSERT INTO `internal_resources` VALUES ('PG_FILEWRONG', 'EN', 'The filename you entered could not be found on the server!', '');
INSERT INTO `internal_resources` VALUES ('CLASS_WRONG', 'EN', 'The file you specified has no valid class signature!', '');
INSERT INTO `internal_resources` VALUES ('PG_INSTALLED', 'EN', 'The PlugIn was successfully installed!', '');
INSERT INTO `internal_resources` VALUES ('PG_UPGRADED', 'EN', 'The PlugIn was successfully upgraded!', '');
INSERT INTO `internal_resources` VALUES ('PG_ERROR', 'EN', 'There was an error while installing the plugin!', '');
INSERT INTO `internal_resources` VALUES ('PG_ALREADYINSTAL', 'EN', 'The PlugIn is already installed!', '');
INSERT INTO `internal_resources` VALUES ('PG_NEWERINSTALLE', 'EN', 'There is already a newer version of this PlugIn installed!', '');
INSERT INTO `internal_resources` VALUES ('PG_TITLE', 'EN', 'PlugIns', '');
INSERT INTO `internal_resources` VALUES ('PG_INSTALL', 'EN', 'Install PlugIn', '');
INSERT INTO `internal_resources` VALUES ('PG_UNINSTALL', 'EN', 'UnInstall PlugIn', '');
INSERT INTO `internal_resources` VALUES ('PG_UNINSTALLMES', 'EN', 'You are about to uninstall a module. UnInstalling a module does not only remove the content-type but also deletes every single object of this type that is stored in the database. The uninstallation will definitely delete all(!) data of this module!', '');
INSERT INTO `internal_resources` VALUES ('PG_UNINSTALLDELE', 'EN', 'Uninstall Module,<br> Delete all correspondig contents.', '');
INSERT INTO `internal_resources` VALUES ('O_NEW', 'EN', 'New Object', '');
INSERT INTO `internal_resources` VALUES ('O_NAME', 'EN', 'Object Name', '');
INSERT INTO `internal_resources` VALUES ('O_PROPERTIES', 'EN', 'Object Properties', '');
INSERT INTO `internal_resources` VALUES ('O_DELMES', 'EN', 'You are about to delete an object. <b>Note that all variations and META-DATA will be lost!</b>', '');
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
INSERT INTO `internal_resources` VALUES ('R_FOLDERNOTEMPTY', 'EN', 'The folder is not empty. So you cannot delete it! Please check all Objects and Clusters!', '');
INSERT INTO `internal_resources` VALUES ('R_DELFOLDER', 'EN', 'Delete Folder and all child objects', '');
INSERT INTO `internal_resources` VALUES ('R_MOVEOBJECTS', 'EN', 'Move all objects to parent node', '');
INSERT INTO `internal_resources` VALUES ('R_PARENT', 'EN', 'Parent Folder', '');
INSERT INTO `internal_resources` VALUES ('METATEMPLATES', 'EN', 'Meta-Data Templates', '');
INSERT INTO `internal_resources` VALUES ('MT_PROPERTIES', 'EN', 'Edit Meta-Template Properties', '');
INSERT INTO `internal_resources` VALUES ('MT_SCHEME', 'EN', 'Edit Meta-Template Scheme', '');
INSERT INTO `internal_resources` VALUES ('MT_DELETE', 'EN', 'Do you really want to delete this part of the meta-template? All information entered in any META-Input in CMS linked to this part will be deleted. The data is going to be lost forever!', '');
INSERT INTO `internal_resources` VALUES ('MT_ADDITIONAL', 'EN', 'Additional META-Data', '');
INSERT INTO `internal_resources` VALUES ('MT_BASE', 'EN', 'Basic META-Data', '');
INSERT INTO `internal_resources` VALUES ('MT_MODULE', 'EN', 'Content-Type specific META-Data', '');
INSERT INTO `internal_resources` VALUES ('VARIATIONS', 'EN', 'Available Variations', '');
INSERT INTO `internal_resources` VALUES ('V_NAME', 'EN', 'Name', '');
INSERT INTO `internal_resources` VALUES ('V_SHORT', 'EN', 'Short-Tag', '');
INSERT INTO `internal_resources` VALUES ('V_EDIT', 'EN', 'Edit Variations', '');
INSERT INTO `internal_resources` VALUES ('LOGIN_FAILED', 'EN', 'The login data you entered could not be verified! Please try again.', '');
INSERT INTO `internal_resources` VALUES ('USER_HEAD', 'EN', 'User profile', '');
INSERT INTO `internal_resources` VALUES ('USER_LINK', 'EN', 'User profiles', '');
INSERT INTO `internal_resources` VALUES ('USER_NAME', 'EN', 'Username', '');
INSERT INTO `internal_resources` VALUES ('FULL_NAME', 'EN', 'Full Name', '');
INSERT INTO `internal_resources` VALUES ('PASSWORD', 'EN', 'Password', '');
INSERT INTO `internal_resources` VALUES ('USER_EMAIL', 'EN', 'eMail', '');
INSERT INTO `internal_resources` VALUES ('USER_ACTIVE', 'EN', 'Account Enabled', '');
INSERT INTO `internal_resources` VALUES ('USER_FILTERMENU', 'EN', 'User Administration', '');
INSERT INTO `internal_resources` VALUES ('USER_SETPERM', 'EN', 'Set User Permissions below. To remove a user form a group, just revoke all groups from him.', '');
INSERT INTO `internal_resources` VALUES ('USER_PERMGRID', 'EN', 'Permission Grid', '');
INSERT INTO `internal_resources` VALUES ('GROUP_LINK', 'EN', 'Group profiles', '');
INSERT INTO `internal_resources` VALUES ('GROUP_HEAD', 'EN', 'Group profile', '');
INSERT INTO `internal_resources` VALUES ('GROUP_NAME', 'EN', 'Group name', 'You can create groups of clusters, e.g. banners, and name these groups.');
INSERT INTO `internal_resources` VALUES ('GROUP_DESCRIPTIO', 'EN', 'Description', '');
INSERT INTO `internal_resources` VALUES ('GROUP_FILTERMENU', 'EN', 'Group Administration', '');
INSERT INTO `internal_resources` VALUES ('ROLE_LINK', 'EN', 'Role profiles', '');
INSERT INTO `internal_resources` VALUES ('ROLE_HEAD', 'EN', 'Role profile', '');
INSERT INTO `internal_resources` VALUES ('ROLE_NAME', 'EN', 'Role name', '');
INSERT INTO `internal_resources` VALUES ('ROLE_DESCRIPTION', 'EN', 'Description', '');
INSERT INTO `internal_resources` VALUES ('ROLE_FILTERMENU', 'EN', 'Role Administration', '');
INSERT INTO `internal_resources` VALUES ('USER_PERMISSIONS', 'EN', 'User Permissions', '');
INSERT INTO `internal_resources` VALUES ('UP_INTRO', 'EN', 'Please select the group and the roles in the group, you want to add to the user.', '');
INSERT INTO `internal_resources` VALUES ('USER_TO_GROUP', 'EN', 'Add user to group', '');
INSERT INTO `internal_resources` VALUES ('ERROR_SEL_GROUP', 'EN', 'You must select a group!', '');
INSERT INTO `internal_resources` VALUES ('ERROR_SEL_ROLE', 'EN', 'You must select at least one role!', '');
INSERT INTO `internal_resources` VALUES ('USER_PROFILE', 'EN', 'My Profile', '');
INSERT INTO `internal_resources` VALUES ('COMMIT', 'EN', 'Commit', '');
INSERT INTO `internal_resources` VALUES ('CANCEL', 'EN', 'Cancel', '');
INSERT INTO `internal_resources` VALUES ('YES', 'EN', 'Yes', '');
INSERT INTO `internal_resources` VALUES ('NO', 'EN', 'No', '');
INSERT INTO `internal_resources` VALUES ('NEW', 'EN', 'Create New', '');
INSERT INTO `internal_resources` VALUES ('NAME', 'EN', 'Name', '');
INSERT INTO `internal_resources` VALUES ('DESCRIPTION', 'EN', 'Description', '');
INSERT INTO `internal_resources` VALUES ('DOSOMETHING', 'EN', 'Please select the action you want to do. You can insert new items, edit items, delete items and change the order of items.', '');
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
INSERT INTO `internal_resources` VALUES ('ACTIVE_VARIATION', 'EN', 'Active Variation:', '');
INSERT INTO `internal_resources` VALUES ('NO_VARIATIONS', 'EN', 'There are currently no variations of this object defined!<br>Please call a developer for checking the configuration of the selected item!', '');
INSERT INTO `internal_resources` VALUES ('ED_CONTENT', 'EN', 'Edit Content', '');
INSERT INTO `internal_resources` VALUES ('ED_META', 'EN', 'Edit META-Data', '');
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
INSERT INTO `internal_resources` VALUES ('UNIQUE', 'EN', 'The value you entered already exsists whether in another item or in the dustbin.', '');
INSERT INTO `internal_resources` VALUES ('MANDATORY', 'EN', 'This field cannot be empty!', '');
INSERT INTO `internal_resources` VALUES ('NOTNUMBER', 'EN', 'You must enter a number into this field!', '');
INSERT INTO `internal_resources` VALUES ('WRONGDATE', 'EN', 'The date you entered, does not exist!', '');
INSERT INTO `internal_resources` VALUES ('PWDNOTMATCH', 'EN', 'The passwords you entered do not match!', '');
INSERT INTO `internal_resources` VALUES ('PWDTOOSHORT', 'EN', 'The password must be at least 6 chars!', '');
INSERT INTO `internal_resources` VALUES ('PROCERROR', 'EN', 'An error occured while processing the form. Please check the marked fields and read there for further information.', '');
INSERT INTO `internal_resources` VALUES ('SAVEERROR', 'EN', 'An error occured while saving the data to the database. Please make sure, the database is connected or call your Administrator.', '');
INSERT INTO `internal_resources` VALUES ('SAVESUCCESS', 'EN', 'The data was successfully written to the database.', '');
INSERT INTO `internal_resources` VALUES ('DELETESUCCESS', 'EN', 'The data listed below was successfully deleted from the database. It is now lost!', '');
INSERT INTO `internal_resources` VALUES ('SELECTONE', 'EN', 'You must make a choice here!', '');
INSERT INTO `internal_resources` VALUES ('CREATENEW', 'EN', 'A new member of this template was created. See the data listed below.', '');
INSERT INTO `internal_resources` VALUES ('PROMPTDELETE', 'EN', 'Do you really want to delete this dataset? This action cannot be undone!', '');
INSERT INTO `internal_resources` VALUES ('RESET', 'EN', 'Reset Form', '');
INSERT INTO `internal_resources` VALUES ('BACK', 'EN', 'Back', '');
INSERT INTO `internal_resources` VALUES ('CREATE', 'EN', 'Create Item', '');
INSERT INTO `internal_resources` VALUES ('ERROR', 'EN', 'An error occured while doing the selected operation!', '');
INSERT INTO `internal_resources` VALUES ('PURGE', 'EN', 'Purge Database', '');
INSERT INTO `internal_resources` VALUES ('PURGE_MES', 'EN', 'Please select the parts of the database, you want to purge.', '');
INSERT INTO `internal_resources` VALUES ('PURGE_VAR', 'EN', 'Purge Variations', '');
INSERT INTO `internal_resources` VALUES ('PURGE_CONTENT', 'EN', 'Purge Content', '');
INSERT INTO `internal_resources` VALUES ('VAR_SUCCEEDED', 'EN', 'succeeded!', '');
INSERT INTO `internal_resources` VALUES ('PURGE_FOLDER', 'EN', 'Purge Folders', '');
INSERT INTO `internal_resources` VALUES ('PURGE_CLUSTER', 'EN', 'Purge Cluster', '');
INSERT INTO `internal_resources` VALUES ('PURGE_META', 'EN', 'Purge Meta', '');
INSERT INTO `internal_resources` VALUES ('PURGE_CLT', 'EN', 'Purge Cluster-Templates', '');
INSERT INTO `internal_resources` VALUES ('PURGE_PAGES', 'EN', 'Purge Sitepages and Masters', '');
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
INSERT INTO `internal_resources` VALUES ('M_ACCESS', 'EN', 'Access', '');
INSERT INTO `internal_resources` VALUES ('M_MAINTENANCE', 'EN', 'Maintenance', '');
INSERT INTO `internal_resources` VALUES ('M_WWW', 'EN', 'Website', '');
INSERT INTO `internal_resources` VALUES ('M_TEMP', 'EN', 'Templates', '');
INSERT INTO `internal_resources` VALUES ('M_ROLLOUT', 'EN', 'Rollout', '');
INSERT INTO `internal_resources` VALUES ('M_LIB', 'EN', 'Library', '');
INSERT INTO `internal_resources` VALUES ('M_COMBOBJ', 'EN', 'Combined Contents (Cluster)', '');
INSERT INTO `internal_resources` VALUES ('M_CLT', 'EN', 'Cluster Templates', '');
INSERT INTO `internal_resources` VALUES ('RL_PERM', 'EN', 'Role Permissions', '');
INSERT INTO `internal_resources` VALUES ('MT_TITLE', 'EN', 'Maintenance', '');
INSERT INTO `internal_resources` VALUES ('MT_GENERATE_DTA', 'EN', 'Generate DataTypes', '');
INSERT INTO `internal_resources` VALUES ('MT_DW_CONTENTFIE', 'EN', 'Dreamweaver Content-Field-Info', '');
INSERT INTO `internal_resources` VALUES ('MT_GENERATE_DTA_', 'EN', 'generates DataTypes', '');
INSERT INTO `internal_resources` VALUES ('DWEXT_CONTENTFIE', 'EN', 'Generate Content-Field-Information', '');
INSERT INTO `internal_resources` VALUES ('SPM_RLAUNCH', 'EN', 'Refresh instances', '');
INSERT INTO `internal_resources` VALUES ('SP_RLTREE', 'EN', 'Refresh Tree', '');
INSERT INTO `internal_resources` VALUES ('SP_MENUDIRECTTIT', 'EN', 'Define optinal Path on server for direct access', '');
INSERT INTO `internal_resources` VALUES ('SP_MENUDIRECT', 'EN', 'Direct url on Live Server', '');
INSERT INTO `internal_resources` VALUES ('TMPL_NAME', 'EN', 'Select a template', '');
INSERT INTO `internal_resources` VALUES ('STNAME', 'EN', 'Select a name to identify this page in the sitemap', '');
INSERT INTO `internal_resources` VALUES ('POS_IN_MENU', 'EN', 'Position in sitemap', 'Pages are ordered by their position in the tree of the website.');
INSERT INTO `internal_resources` VALUES ('CR_CONTENT', 'EN', 'Create Content for this page?', '');
INSERT INTO `internal_resources` VALUES ('CLEAR_MEDIA', 'EN', 'Remove file from database', '');
INSERT INTO `internal_resources` VALUES ('DESC', 'EN', 'Description', '');
INSERT INTO `internal_resources` VALUES ('LOCATION', 'EN', 'Location, if external', '');
INSERT INTO `internal_resources` VALUES ('CONTENT', 'EN', 'Content', '');
INSERT INTO `internal_resources` VALUES ('M_CLUSTERS', 'EN', 'Clusters', '');
INSERT INTO `internal_resources` VALUES ('M_PTEMP', 'EN', 'Page Templates', '');
INSERT INTO `internal_resources` VALUES ('MT_SPIDER', 'EN', 'Run Spider', '');
INSERT INTO `internal_resources` VALUES ('MT_DW_CONTENTFIELDINFO', 'EN', 'Dreamweaver Content-Field-Info', '');
INSERT INTO `internal_resources` VALUES ('LOGS', 'EN', 'Logfile Analysis', '');
INSERT INTO `internal_resources` VALUES ('TESTS', 'EN', 'N/X Unit Tests', '');
INSERT INTO `internal_resources` VALUES ('M_ADMIN', 'EN', 'Administration', '');
INSERT INTO `internal_resources` VALUES ('M_BACKUP', 'EN', 'Backup', '');
INSERT INTO `internal_resources` VALUES ('M_TRANSLATION', 'EN', 'Translation', '');
INSERT INTO `internal_resources` VALUES ('PTEMPL', 'EN', 'Page Template', '');
INSERT INTO `internal_resources` VALUES ('SP_MENUDIRECTTITLE', 'EN', 'Define optional Path on server for direct access', 'Sometimes you may want to access a page with a name instead of an IP-address, e.g.\r\nwww.news.fi/oulu instead of www.news.fi/www/p100211_v1.html. You enter\r\nthe Path here.');
INSERT INTO `internal_resources` VALUES ('LIBRARY', 'EN', 'Content Library', '');
INSERT INTO `internal_resources` VALUES ('NEW_CONTENT', 'EN', 'New Content', '');
INSERT INTO `internal_resources` VALUES ('NEW_FOLDER', 'EN', 'Create Folder', '');
INSERT INTO `internal_resources` VALUES ('EDIT_FOLDER', 'EN', 'Edit Folder', '');
INSERT INTO `internal_resources` VALUES ('DEL_FOLDER', 'EN', 'Delete Folder', '');
INSERT INTO `internal_resources` VALUES ('EDIT_ACCESS', 'EN', 'Set Access', '');
INSERT INTO `internal_resources` VALUES ('USAGE', 'EN', 'Usage', '');
INSERT INTO `internal_resources` VALUES ('LAUNCH', 'EN', 'Launch', '');
INSERT INTO `internal_resources` VALUES ('AVAIL_VARIATIONS', 'EN', 'Available variations', '');
INSERT INTO `internal_resources` VALUES ('NO_CONTENTS', 'EN', 'No Contents available in this folder.', '');
INSERT INTO `internal_resources` VALUES ('EDIT_CONTENT', 'EN', 'Edit Content', '');
INSERT INTO `internal_resources` VALUES ('CONTENT_DESC', 'EN', 'Description of Content', '');
INSERT INTO `internal_resources` VALUES ('SAVE_BACK', 'EN', 'Save and Back', '');
INSERT INTO `internal_resources` VALUES ('PROPERTIES', 'EN', 'Properties', '');
INSERT INTO `internal_resources` VALUES ('RESET_FORM', 'EN', 'Reset Form', '');
INSERT INTO `internal_resources` VALUES ('NO_CLUSTER_SELECTED', 'EN', 'No cluster selected.', '');
INSERT INTO `internal_resources` VALUES ('CREATE_INSTANCES', 'EN', 'Create instances', '');
INSERT INTO `internal_resources` VALUES ('NUMBER_OF_INSTANCES', 'EN', 'Please specify how many instances you want to create', '');
INSERT INTO `internal_resources` VALUES ('TIPP_TEMPLATE_1', 'EN', 'Templates are the basis of every output with N/X. You will need to create a cluster-template first, which defines the structure and the kind of contents. Afterwards you can create the page-templates here by merging a cluster-template and php-file.<br><br>', '');
INSERT INTO `internal_resources` VALUES ('SPM_THUMBNAIL', 'EN', 'Thumbnail', '');
INSERT INTO `internal_resources` VALUES ('HELP', 'EN', 'Help', '');
INSERT INTO `internal_resources` VALUES ('EXPLORE', 'EN', 'Explore', '');
INSERT INTO `internal_resources` VALUES ('FILTER_RULE', 'EN', 'Search for...', '');
INSERT INTO `internal_resources` VALUES ('FILTER_COLUMN', 'EN', '...in', '');
INSERT INTO `internal_resources` VALUES ('SEARCH_CLEAR', 'EN', 'Reset Filter', '');
INSERT INTO `internal_resources` VALUES ('ED_CPGROUP', 'EN', 'Edit Compound Group', '');
INSERT INTO `internal_resources` VALUES ('GROUP_DESCRIPTION', 'EN', 'Description', '');
INSERT INTO `internal_resources` VALUES ('RANDOM', 'EN', 'Random', '');
INSERT INTO `internal_resources` VALUES ('LATEST', 'EN', 'Latest ones', '');
INSERT INTO `internal_resources` VALUES ('OLDEST', 'EN', 'Oldest ones', '');
INSERT INTO `internal_resources` VALUES ('ORDER', 'EN', 'By order', '');
INSERT INTO `internal_resources` VALUES ('ORDERCOMP', 'EN', 'Order of Compounds', 'Set the order in which clusters, e.g. banners, appear.');
INSERT INTO `internal_resources` VALUES ('ED_CPGROUPGENERAL', 'EN', 'Edit Group General', '');
INSERT INTO `internal_resources` VALUES ('CPG_MEMBERS_SELECT', 'EN', 'Select members of this compound group', '');
INSERT INTO `internal_resources` VALUES ('AVAIL_ITEMS', 'EN', 'Available items', '');
INSERT INTO `internal_resources` VALUES ('SEL_MEM', 'EN', 'Selected members', '');
INSERT INTO `internal_resources` VALUES ('COMB_ALL', 'EN', 'Select All', '');
INSERT INTO `internal_resources` VALUES ('COMB_NONE', 'EN', 'Clear All', '');
INSERT INTO `internal_resources` VALUES ('MT_DW_CONTENT', 'EN', 'Dreamweaver Plugin', '');
INSERT INTO `internal_resources` VALUES ('MT_GENERATE_DTA_MES', 'EN', 'generates DataTypes', '');
INSERT INTO `internal_resources` VALUES ('MT_GENERATE_DTA_SUCCEEDED', 'EN', '<br><br>DataTypes were successfully generated and file was written.<br>', '');
INSERT INTO `internal_resources` VALUES ('START_BAK', 'EN', 'Start Backup', '');
INSERT INTO `internal_resources` VALUES ('BACKUP', 'EN', 'System Backup', '');
INSERT INTO `internal_resources` VALUES ('BACK_INFO', 'EN', 'The list below shows you the backups of N/X on your server. You can delete the backups here. To restore a backup,you need to manually log in your server and restore the files yourself.', '');
INSERT INTO `internal_resources` VALUES ('BAK_FILE', 'EN', 'Backup file', '');
INSERT INTO `internal_resources` VALUES ('IS_COMPOUND', 'EN', 'Compound Cluster Template', 'Enable cluster to have its own layout-template by checking this box.');
INSERT INTO `internal_resources` VALUES ('TEMPLATE', 'EN', 'Template', '');
INSERT INTO `internal_resources` VALUES ('OVERVIEW', 'EN', 'Overview', '');
INSERT INTO `internal_resources` VALUES ('VISITORS', 'EN', 'Visitors', '');
INSERT INTO `internal_resources` VALUES ('PAGES', 'EN', 'Pages', '');
INSERT INTO `internal_resources` VALUES ('WEEKDAY', 'EN', 'Weekdays', '');
INSERT INTO `internal_resources` VALUES ('HOUR', 'EN', 'Hours', '');
INSERT INTO `internal_resources` VALUES ('REFERER', 'EN', 'Referer', '');
INSERT INTO `internal_resources` VALUES ('ENVIRONMENT', 'EN', 'Environment', '');
INSERT INTO `internal_resources` VALUES ('PATHS', 'EN', 'Clickpaths', '');
INSERT INTO `internal_resources` VALUES ('STATS_HEADER', 'EN', 'N/X 2004 Traffic Statistics', '');
INSERT INTO `internal_resources` VALUES ('VISITS_OVERVIEW', 'EN', 'Visits overview', '');
INSERT INTO `internal_resources` VALUES ('VISITS', 'EN', 'Visits', '');
INSERT INTO `internal_resources` VALUES ('TOTAL', 'EN', 'Total', '');
INSERT INTO `internal_resources` VALUES ('AVERAGE', 'EN', 'Average', '');
INSERT INTO `internal_resources` VALUES ('MEDIAN', 'EN', 'Median', '');
INSERT INTO `internal_resources` VALUES ('MAXIMUM', 'EN', 'Maximum', '');
INSERT INTO `internal_resources` VALUES ('MAXIMUMAT', 'EN', 'Maximum at', '');
INSERT INTO `internal_resources` VALUES ('MINIMUM', 'EN', 'Minimum', '');
INSERT INTO `internal_resources` VALUES ('MINIMUMAT', 'EN', 'Minimum at', '');
INSERT INTO `internal_resources` VALUES ('PI_OVERVIEW', 'EN', 'Page Impressions overview', '');
INSERT INTO `internal_resources` VALUES ('PI', 'EN', 'Page Impressions', '');
INSERT INTO `internal_resources` VALUES ('TF', 'EN', 'Time Frame', '');
INSERT INTO `internal_resources` VALUES ('PREDEF_TIME', 'EN', 'Predefined timeframe', '');
INSERT INTO `internal_resources` VALUES ('TODAY', 'EN', 'Today', '');
INSERT INTO `internal_resources` VALUES ('YESTERDAY', 'EN', 'Yesterday', '');
INSERT INTO `internal_resources` VALUES ('THISWEEK', 'EN', 'This Week', '');
INSERT INTO `internal_resources` VALUES ('LASTWEEK', 'EN', 'Last Week', '');
INSERT INTO `internal_resources` VALUES ('THISMONTH', 'EN', 'This Month', '');
INSERT INTO `internal_resources` VALUES ('LASTMONTH', 'EN', 'Last Month', '');
INSERT INTO `internal_resources` VALUES ('THISYEAR', 'EN', 'This Year', '');
INSERT INTO `internal_resources` VALUES ('LASTYEAR', 'EN', 'Last Year', '');
INSERT INTO `internal_resources` VALUES ('IND_TIME', 'EN', 'Individual timeframe', '');
INSERT INTO `internal_resources` VALUES ('SET', 'EN', 'Set', '');
INSERT INTO `internal_resources` VALUES ('PRINT', 'EN', 'print', '');
INSERT INTO `internal_resources` VALUES ('ACL_TITLE', 'EN', 'Setting permissions for', '');
INSERT INTO `internal_resources` VALUES ('ACL_INHERIT', 'EN', 'Inherit permissions from parent', '');
INSERT INTO `internal_resources` VALUES ('ACL_INHERIT_NOTE', 'EN', 'Note: When the box is checked, there is no other configuration available!', '');
INSERT INTO `internal_resources` VALUES ('ACL_INFO', 'EN', 'Inherited Access from parent', '');
INSERT INTO `internal_resources` VALUES ('ACL_PARENT', 'EN', 'Permissions inherited from', '');
INSERT INTO `internal_resources` VALUES ('ACL_GROUPSROLES', 'EN', 'Foreign Access', 'Declare groups, who you allow to access this object.');
INSERT INTO `internal_resources` VALUES ('ALC_OWNER', 'EN', 'Set owner', '');
INSERT INTO `internal_resources` VALUES ('ACL_OWNER', 'EN', 'Owner', 'The members of this group have Administrator role on this ressource');
INSERT INTO `internal_resources` VALUES ('ACL_ACCESS', 'EN', 'Edit permissions in groups on', '');
INSERT INTO `internal_resources` VALUES ('ACL_GROUPS', 'EN', 'Select Group to add', '');
INSERT INTO `internal_resources` VALUES ('ACL_GROUPEDIT', 'EN', 'Select group to edit roles', '');
INSERT INTO `internal_resources` VALUES ('ACL_ROLE', 'EN', 'Select roles for group', '');
INSERT INTO `internal_resources` VALUES ('SELMULTIPLE', 'EN', 'Hold down the CTRL-Key to select multiple items!', '');
INSERT INTO `internal_resources` VALUES ('SELECT', 'EN', 'Select', '');
INSERT INTO `internal_resources` VALUES ('CP_GROUP', 'EN', 'Compound Group', '');
INSERT INTO `internal_resources` VALUES ('EDIT_TEMPLATE', 'EN', 'Edit template', '');
INSERT INTO `internal_resources` VALUES ('EDIT_SPM', 'EN', 'Edit template properties', '');
INSERT INTO `internal_resources` VALUES ('OK', 'EN', 'Ok', '');
INSERT INTO `internal_resources` VALUES ('FOLDER_DELMES', 'EN', 'Do you really want to delete this folder?', '');
INSERT INTO `internal_resources` VALUES ('RATERES', 'EN', 'Rate Results', '');
INSERT INTO `internal_resources` VALUES ('DISPLAY', 'EN', 'Display', '');
INSERT INTO `internal_resources` VALUES ('PAGE', 'EN', 'Page', '');
INSERT INTO `internal_resources` VALUES ('COMMENT', 'EN', 'Comment', '');
INSERT INTO `internal_resources` VALUES ('DATE', 'EN', 'Date', '');
INSERT INTO `internal_resources` VALUES ('SMA_EXT_EDIT', 'EN', 'Open edit window. Save all inline edited texts before!', '');
INSERT INTO `internal_resources` VALUES ('PGNTXT_SMA', 'EN', 'Save all edited texts on the page', '');
INSERT INTO `internal_resources` VALUES ('AVG_VISIT_LENGTH', 'EN', 'Average visit length', '');
INSERT INTO `internal_resources` VALUES ('AVG_CLICKSTREAM', 'EN', 'Average clickstream', '');
INSERT INTO `internal_resources` VALUES ('VIS_ONL', 'EN', 'Visitors online', '');
INSERT INTO `internal_resources` VALUES ('WHEN', 'EN', 'When', '');
INSERT INTO `internal_resources` VALUES ('RET_VIS', 'EN', 'Returning visitors', '');
INSERT INTO `internal_resources` VALUES ('VIS_FIRST', 'EN', 'First time visitors', '');
INSERT INTO `internal_resources` VALUES ('VIS_RET', 'EN', 'Returning visitors', '');
INSERT INTO `internal_resources` VALUES ('TIME_BETW_VISITS', 'EN', 'Average time between visits', '');
INSERT INTO `internal_resources` VALUES ('VIS_PER_VIS', 'EN', 'Average visits per visitor', '');
INSERT INTO `internal_resources` VALUES ('AVG_VIS_LENGTH', 'EN', 'Average visit length (seconds)', '');
INSERT INTO `internal_resources` VALUES ('TOP_BROWSER', 'EN', 'Top Browser', '');
INSERT INTO `internal_resources` VALUES ('RANK', 'EN', 'Rank', '');
INSERT INTO `internal_resources` VALUES ('COUNT', 'EN', 'Count', '');
INSERT INTO `internal_resources` VALUES ('PERCENT', 'EN', 'Percent', '');
INSERT INTO `internal_resources` VALUES ('TOP_OS', 'EN', 'Top Operating Systems', '');
INSERT INTO `internal_resources` VALUES ('TOP_HOSTS', 'EN', 'Top Hosts', '');
INSERT INTO `internal_resources` VALUES ('TOP', 'EN', 'Limit data', '');
INSERT INTO `internal_resources` VALUES ('OTHERS', 'EN', 'Others', '');
INSERT INTO `internal_resources` VALUES ('CLK_PATHS', 'EN', 'Clickpaths', '');
INSERT INTO `internal_resources` VALUES ('TOP_PATHS', 'EN', 'Top paths', '');
INSERT INTO `internal_resources` VALUES ('PATH', 'EN', 'Path', '');
INSERT INTO `internal_resources` VALUES ('SHORTEST_PATHS', 'EN', 'Shortest paths', '');
INSERT INTO `internal_resources` VALUES ('LONGEST_PATHS', 'EN', 'Longest paths', '');
INSERT INTO `internal_resources` VALUES ('WEBSITE', 'EN', 'Website', '');
INSERT INTO `internal_resources` VALUES ('TRANSLATION', 'EN', 'N/X Translation System', '');
INSERT INTO `internal_resources` VALUES ('STATS', 'EN', 'Statistics', '');
INSERT INTO `internal_resources` VALUES ('LOCK_MENU', 'EN', 'Lock Menu', 'By locking a menu, a developer can prevent editors from creating sub pages for a page.');
INSERT INTO `internal_resources` VALUES ('USER_PERMISSION', 'EN', 'Edit user permissions', '');
INSERT INTO `internal_resources` VALUES ('USERPERM_HEAD', 'EN', 'Edit user permissions', '');
INSERT INTO `internal_resources` VALUES ('USER_GENERAL', 'EN', 'Edit general user data', '');
INSERT INTO `internal_resources` VALUES ('IS_FILTERED', 'EN', 'Note: You may not display all records because you are using a filter!', '');
INSERT INTO `internal_resources` VALUES ('TOP_REFERER', 'EN', 'Top referer', '');
INSERT INTO `internal_resources` VALUES ('TOP_SI', 'EN', 'Top search engines', '');
INSERT INTO `internal_resources` VALUES ('TOP_SKW', 'EN', 'Top search keywords', '');
INSERT INTO `internal_resources` VALUES ('TOP_EXITT', 'EN', 'Top exit targets', '');
INSERT INTO `internal_resources` VALUES ('HOURS_AS', 'EN', 'Hour Analysis', '');
INSERT INTO `internal_resources` VALUES ('WEEKDAY_AS', 'EN', 'Weekday Analysis', '');
INSERT INTO `internal_resources` VALUES ('I_AFTER', 'EN', 'Insert after', '');
INSERT INTO `internal_resources` VALUES ('AFTER', 'EN', 'After:', '');
INSERT INTO `internal_resources` VALUES ('REMAIN_POS', 'EN', 'Do not change position', '');
INSERT INTO `internal_resources` VALUES ('BEGIN', 'EN', 'Start', '');
INSERT INTO `internal_resources` VALUES ('CL_NAME', 'EN', 'Cluster Name', '');
INSERT INTO `internal_resources` VALUES ('INSNAME', 'EN', '<Cluster Name>', '');
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
INSERT INTO `internal_resources` VALUES ('TOP_PAGES', 'EN', 'Top pages', '');
INSERT INTO `internal_resources` VALUES ('TOP_ENTRYPAGES', 'EN', 'Top entry pages', '');
INSERT INTO `internal_resources` VALUES ('TOP_EXITPAGES', 'EN', 'Top exit pages', '');
INSERT INTO `internal_resources` VALUES ('SEL_EVENT', 'EN', 'Select Event or Appointment', '');
INSERT INTO `internal_resources` VALUES ('STARTDATE', 'EN', 'Startdate', '');
INSERT INTO `internal_resources` VALUES ('STARTTIME', 'EN', 'Starttime', '');
INSERT INTO `internal_resources` VALUES ('ENDATE', 'EN', 'Enddate', '');
INSERT INTO `internal_resources` VALUES ('ENDTIME', 'EN', 'Endtime', '');
INSERT INTO `internal_resources` VALUES ('CAL_BTO', 'EN', 'Back to Overview', '');
INSERT INTO `internal_resources` VALUES ('ROLE_PERMISSION', 'EN', 'Edit role permissions', '');
INSERT INTO `internal_resources` VALUES ('ROLE_GENERAL', 'EN', 'Edit general role data', '');
INSERT INTO `internal_resources` VALUES ('ADD_LINK', 'EN', 'Add Link', '');
INSERT INTO `internal_resources` VALUES ('ADDITIONAL_LINK', 'EN', 'Additional Link', '');
INSERT INTO `internal_resources` VALUES ('ADDITIONAL_IMAGE', 'EN', 'Additional Image', '');
INSERT INTO `internal_resources` VALUES ('NO_OBJ', 'EN', 'No object selected.', '');
INSERT INTO `internal_resources` VALUES ('CLEAR', 'EN', 'Clear', '');
INSERT INTO `internal_resources` VALUES ('FIND_OBJ', 'EN', 'Find Object', '');
INSERT INTO `internal_resources` VALUES ('PREV_AVAIL', 'EN', 'You selected an object. A preview will be available after saving.', '');
INSERT INTO `internal_resources` VALUES ('NOT_SPECIFIED', 'EN', 'Any type', '');
INSERT INTO `internal_resources` VALUES ('CMPTYPE', 'EN', 'Compound type:', '');
INSERT INTO `internal_resources` VALUES ('INSTANCES_CREATED', 'EN', 'New instances of the item have been created.', '');
INSERT INTO `internal_resources` VALUES ('CONFIRM_DELETE', 'EN', 'Do you really want to delete this item?', '');
INSERT INTO `internal_resources` VALUES ('NOT_SELECTED', 'EN', 'No item selected yet.', '');
INSERT INTO `internal_resources` VALUES ('NO_CONTENT', 'EN', 'No content entered yet.', '');
INSERT INTO `internal_resources` VALUES ('LEAVE_EMPTY', 'EN', 'Leave empty.', '');
INSERT INTO `internal_resources` VALUES ('GOTO_CL', 'EN', 'Goto Cluster', '');
INSERT INTO `internal_resources` VALUES ('CL_EXPIRE', 'EN', 'Expire Cluster', '');
INSERT INTO `internal_resources` VALUES ('CL_LAUNCH', 'EN', 'Launch Cluster', '');
INSERT INTO `internal_resources` VALUES ('OBJLAUNCH_SUCCESS', 'EN', 'The object was successfully launched.', '');
INSERT INTO `internal_resources` VALUES ('NO_CLUSTER', 'EN', 'There are no clusters.', '');
INSERT INTO `internal_resources` VALUES ('BACK_TO_CV', 'EN', 'Back to cluster overview', '');
INSERT INTO `internal_resources` VALUES ('CREATED_AT', 'EN', 'Created at', '');
INSERT INTO `internal_resources` VALUES ('BY', 'EN', 'by', '');
INSERT INTO `internal_resources` VALUES ('LAST_MOD_AT', 'EN', 'Last Modified at', '');
INSERT INTO `internal_resources` VALUES ('CLUSTER_INFORMATION', 'EN', 'Information about this record', '');
INSERT INTO `internal_resources` VALUES ('LAST_LAUNCHED_AT', 'EN', 'Last Launched at', '');
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
INSERT INTO `internal_resources` VALUES ('SEL_ARTICLE', 'EN', 'Select Article', '');
INSERT INTO `internal_resources` VALUES ('IN_CHANNEL', 'EN', 'in channel', '');
INSERT INTO `internal_resources` VALUES ('EDIT_ARTICLE', 'EN', 'Edit Article', '');
INSERT INTO `internal_resources` VALUES ('BACK_TO_OVERVIEW', 'EN', 'Back to Overview', '');
INSERT INTO `internal_resources` VALUES ('CREATE_ARTICLE', 'EN', 'Create new Article in channel', '');
INSERT INTO `internal_resources` VALUES ('AR_LAUNCH', 'EN', 'Launch Article', '');
INSERT INTO `internal_resources` VALUES ('CLT_SELECT', 'EN', 'Select cluster templates', '');
INSERT INTO `internal_resources` VALUES ('CLT', 'EN', 'Cluster Template', '');
INSERT INTO `internal_resources` VALUES ('NEW_ARTICLE', 'EN', 'New Article', '');
INSERT INTO `internal_resources` VALUES ('AR_EXPIRE', 'EN', 'Expire Article', '');
INSERT INTO `internal_resources` VALUES ('DWEXT_CONTENTFIELDINFO', 'EN', 'Generate Content-Field-Information', '');
INSERT INTO `internal_resources` VALUES ('DWEXT_CONTENTFIELDINFO_MES', 'EN', 'generates Content-Field-Information for Dreamweaver MX', '');
INSERT INTO `internal_resources` VALUES ('DEL_ARTICLE', 'EN', 'Do you really want to delete this article in all variations?', '');
INSERT INTO `internal_resources` VALUES ('READY_TO_USE', 'EN', 'Ready to use.', '');
INSERT INTO `internal_resources` VALUES ('SEL_CHANNEL_CAT', 'EN', 'Select Channel and Category', '');
INSERT INTO `internal_resources` VALUES ('ALL', 'EN', 'All', '');
INSERT INTO `internal_resources` VALUES ('ORDERART', 'EN', 'Order of Articles', '');
INSERT INTO `internal_resources` VALUES ('NUM_OF_ART', 'EN', 'Number of articles (999 = infinite)', '');
INSERT INTO `internal_resources` VALUES ('CH_CAT2', 'EN', 'Channel and Category', '');
INSERT INTO `internal_resources` VALUES ('DESTROY_TREE', 'EN', 'Destroy Tree', '');
INSERT INTO `internal_resources` VALUES ('DESTROY_EXCLUSIVE_CONTENT', 'EN', 'Destroy exclusive content', '');
INSERT INTO `internal_resources` VALUES ('AUTH_GROUP', 'EN', 'Authentification', '');
INSERT INTO `internal_resources` VALUES ('SYNC_CLUSTERS', 'EN', 'Synchronize Clusters', '');
INSERT INTO `internal_resources` VALUES ('SYNC_CLUSTERS_DESCR', 'EN', 'Whe you are changing a cluster template, the clusters are not automatically synched. They are synched when you are working with them the next time. You can sync all of them here.', '');
INSERT INTO `internal_resources` VALUES ('M_EXPORT_WZ', 'EN', 'Export Wizzard', '');
INSERT INTO `internal_resources` VALUES ('M_IMPORT_WZ', 'EN', 'Import Wizzard', '');
INSERT INTO `internal_resources` VALUES ('M_HELP', 'EN', 'Help', '');
INSERT INTO `internal_resources` VALUES ('MH_GETSTART', 'EN', 'Getting Started', '');
INSERT INTO `internal_resources` VALUES ('MH_GLOSSARY', 'EN', 'Glossary', '');
INSERT INTO `internal_resources` VALUES ('DELETE_PAGE', 'EN', 'Delete Page', '');
INSERT INTO `internal_resources` VALUES ('TT_REFRESH', 'EN', 'Refresh Instances updates the changes made to a template to cached pages.', '');
INSERT INTO `internal_resources` VALUES ('TT_RSTCI', 'EN', 'Each page in N/X has a cluster. By pressing Reset ClusterInstance you can assign a new cluster to the page and remove the old one.', '');
INSERT INTO `internal_resources` VALUES ('HELP_SP', 'EN', 'Sitemap is used for editing site structure and pages.', '');
INSERT INTO `internal_resources` VALUES ('HELP_OBJBROWSE', 'EN', 'Content library contains all content material of the site', '');
INSERT INTO `internal_resources` VALUES ('HELP_CLB', 'EN', 'Cluster is a collection of static dynamic content placeholders, which are either to be filled in by a developer or an editor of a webpage. The structure-definition within N/X is done with data clusters.', '');
INSERT INTO `internal_resources` VALUES ('HELP_CHANNEL', 'EN', 'Topic categories defining the contents of articles created by N/X. i.e. News, Persons', '');
INSERT INTO `internal_resources` VALUES ('HELP_ROLLOUT', 'EN', 'Rollout is a feature of N/X that enables you to make copies of a section on your web page and re-use it with or without the old content.', '');
INSERT INTO `internal_resources` VALUES ('EXPORT_DATA', 'EN', 'Export Content and Templates Wizzard', '');
INSERT INTO `internal_resources` VALUES ('WZ_EXPORT_TITLE', 'EN', 'This wizard is used to exchange clusters, cluster-templates and page-templates between your N/X installation and others. The wizard generates a XML File, which you can store on your local hard drive and exchange with other N/X-Users.', '');
INSERT INTO `internal_resources` VALUES ('WZT_EXPORT_TYPE', 'EN', 'Select type to export', '');
INSERT INTO `internal_resources` VALUES ('WZE_EXPORT_TYPE', 'EN', 'On the right you need to select the type of data you want to export. Clusters are storing content. When you export clusters, the templates are automatically exported too. Cluster-Templates are schemes for creating clusters. Page-Templates are used for cre', '');
INSERT INTO `internal_resources` VALUES ('CLUSTER', 'EN', 'Cluster', '');
INSERT INTO `internal_resources` VALUES ('CLUSTER_TEMPLATE', 'EN', 'Cluster Template', '');
INSERT INTO `internal_resources` VALUES ('PAGE_TEMPLATE', 'EN', 'Page Template', '');
INSERT INTO `internal_resources` VALUES ('WZT_SEL_EXP_RES', 'EN', 'Select Ressource for export', '');
INSERT INTO `internal_resources` VALUES ('WZT_DESCR', 'EN', 'Add description', '');
INSERT INTO `internal_resources` VALUES ('WZT_DESCR_EXPL', 'EN', 'You should add a short description to the exported data.<br/><br/> Anyone who will import the data will easier understand, what he exports.', '');
INSERT INTO `internal_resources` VALUES ('EXEC_EXPORT', 'EN', 'Exporting the ressource', '');
INSERT INTO `internal_resources` VALUES ('EXPL_EXEC_EXPORT', 'EN', 'The system is generating a XML-File for export now.<br/><br/>In a few seconds, a popup will appear. Press Save for storing the Ressource on your harddisk.', '');
INSERT INTO `internal_resources` VALUES ('EXP_REPORT', 'EN', 'Exporting following data', '');
INSERT INTO `internal_resources` VALUES ('NEXT', 'EN', 'Next', '');
INSERT INTO `internal_resources` VALUES ('STEP', 'EN', 'Step', '');
INSERT INTO `internal_resources` VALUES ('IMPORT_DATA', 'EN', 'Import N/X-XML Data', '');
INSERT INTO `internal_resources` VALUES ('WZ_IMPORT_TITLE', 'EN', 'This wizard is used for importing data to N/X, which has formerly been exported with another N/X installation. You must delete a resource before you can import it for a second time.', '');
INSERT INTO `internal_resources` VALUES ('WZT_IMPORT_FILE', 'EN', 'Select N/X-XML File', '');
INSERT INTO `internal_resources` VALUES ('WZE_IMPORT_FILE', 'EN', 'Please choose a N/X-XML file from your harddisk for upload into the system.<br/><br/>The system will perform a check and will display status information on the next page.', '');
INSERT INTO `internal_resources` VALUES ('WZT_IMPORT_VAL', 'EN', 'Summary of uploaded xml', '');
INSERT INTO `internal_resources` VALUES ('WZE_IMPORT_VAL', 'EN', 'The system has checked the correctness of the uploaded XML file. Read the report on the left for details.', '');
INSERT INTO `internal_resources` VALUES ('WZT_IMPORTING', 'EN', 'Importing data', '');
INSERT INTO `internal_resources` VALUES ('WZE_IMPORTING', 'EN', 'The system has tried to import the data. Check the status on the right.', '');
INSERT INTO `internal_resources` VALUES ('SEL_FILE', 'EN', 'Select a file', '');
INSERT INTO `internal_resources` VALUES ('HELP_PAGETEMP', 'EN', 'In spreadsheet and database applications, a template is a blank form that shows which fields exist, their locations, and their length. In N/X, templates are the basis of every output. A template is a form in which all the cells have been defined but no data has yet been entered.', '');
INSERT INTO `internal_resources` VALUES ('HELP_CLT', 'EN', 'Cluster template is a form that enables you to create structure for your site and define the type of contents. Afterwards, cluster template is merged with a page-template that includes the content of the web page.', '');
INSERT INTO `internal_resources` VALUES ('HELP_METATEMP', 'EN', 'A meta template is used for defining which metadata fields need to go on a new page. When you create a new metadata field in the template, each new page based on that template will contain that field.', '');
INSERT INTO `internal_resources` VALUES ('HELP_COMPGRP', 'EN', 'Compound group is a group of clusters. Clusters templates may have an own layout. This enables you to build your homepage out of blocks, e.g. News-Article, Poll, Image-Gallery all on one page and on demand.', '');
INSERT INTO `internal_resources` VALUES ('HELP_PURGE', 'EN', 'Deletes unnecessary information from the database.', '');
INSERT INTO `internal_resources` VALUES ('HELP_DW', 'EN', 'Creates a configuration-file for N/X Dreamweaver Plug-in. With the help of the Plug-in, templates can be developed with Dreamweaver.', '');
INSERT INTO `internal_resources` VALUES ('HELP_SYNCCL', 'EN', 'A feature used for synchronizing clusters after having modified/changed a cluster template.', '');
INSERT INTO `internal_resources` VALUES ('MT_SYNC_CL', 'EN', 'Synchronize Clusters', '');
INSERT INTO `internal_resources` VALUES ('HELP_PGN', 'EN', 'Plug-ins allow you to enhance N/X beyond its standard features. Typically, plug-ins are used to create new objects types in addition to the two standard object types text and image.', '');
INSERT INTO `internal_resources` VALUES ('HELP_BACKUP', 'EN', 'The list below shows you the backups of N/X on your server. You can delete the backups here. To restore a backup ,you need to manually log in to your server and restore the files yourself.', '');
INSERT INTO `internal_resources` VALUES ('HELP_VARIATION', 'EN', 'Content may have different variations. So variations can be languages or different profiles of content.', '');
INSERT INTO `internal_resources` VALUES ('HELP_ACCESS', 'EN', 'A feature used for creating and managing user profiles within N/X.', '');
INSERT INTO `internal_resources` VALUES ('SHOW_PAGEWISE', 'EN', 'show pagewise', '');
INSERT INTO `internal_resources` VALUES ('SHOW_ALL', 'EN', 'show all', '');
INSERT INTO `internal_resources` VALUES ('NODE_ACCESS', 'EN', 'Set access for site root', '');
INSERT INTO `internal_resources` VALUES ('SPM_SELECTTHUMB', 'EN', 'Select Thumbnail', 'Select a graphic which will be displayed if an editor creates a new page. You can upload your own icon-graphics to the folder cms/modules/sitepages/thumbnails.');
INSERT INTO `internal_resources` VALUES ('ED_PROPERTIES', 'EN', 'Edit Properties', '');
INSERT INTO `internal_resources` VALUES ('ED_CLT', 'EN', 'Edit Cluster Template', '');
INSERT INTO `internal_resources` VALUES ('EXPL_SEL_CLUSTER', 'EN', 'After selecting a cluster-template, a list with clusters will appear, where you can select one.', '');
INSERT INTO `internal_resources` VALUES ('SEL_PTML', 'EN', 'Select Page-Template', '');
INSERT INTO `internal_resources` VALUES ('EXPL_SEL_SPM', 'EN', 'Please select a page-template.', '');
INSERT INTO `internal_resources` VALUES ('CHANNEL_IMPORTARTICLES', 'EN', 'Import articles', '');
INSERT INTO `internal_resources` VALUES ('WZ_ARTICLEIMPORT', 'EN', 'Article-Import Wizard', '');
INSERT INTO `internal_resources` VALUES ('WZ_ARTICLEIMPORT_TITLE', 'EN', 'This wizard is used to import article data to a channel from different sources. You can import from existing Multipages or other channels. You have to make sure that the corresponding templates are compatible.', '');
INSERT INTO `internal_resources` VALUES ('WZT_ARTICLEIMPORT_TARGET', 'EN', 'Select target channel', '');
INSERT INTO `internal_resources` VALUES ('WZE_ARTICLEIMPORT_TARGET', 'EN', 'On the right you need to select the target channel. All imported articles will be stored within this channel.', '');
INSERT INTO `internal_resources` VALUES ('SEL_CH', 'EN', 'Select Channel', '');
INSERT INTO `internal_resources` VALUES ('EXPL_SEL_CH', 'EN', 'Please select a channel.', '');
INSERT INTO `internal_resources` VALUES ('WZT_ARTICLEIMPORT_SRCTYPE', 'EN', 'Select source type', '');
INSERT INTO `internal_resources` VALUES ('WZE_ARTICLEIMPORT_SRCTYPE', 'EN', 'Please select the type of source you want to import the articles from.', '');
INSERT INTO `internal_resources` VALUES ('MULTIPAGE', 'EN', 'Multipage', '');
INSERT INTO `internal_resources` VALUES ('COPY_CLUSTER', 'EN', 'Copy clusters', '');
INSERT INTO `internal_resources` VALUES ('KEEP_CLUSTER', 'EN', 'Keep original Cluster', '');
INSERT INTO `internal_resources` VALUES ('ARTICLE_IS_EXPIRED', 'EN', 'Article is expired', '');
INSERT INTO `internal_resources` VALUES ('ARTICLE_IS_LIVE', 'EN', 'Article is live', '');
INSERT INTO `internal_resources` VALUES ('DISABLE', 'EN', 'Disable', '');
INSERT INTO `internal_resources` VALUES ('TRANS_TEMPL', 'EN', 'Translate from', '');
INSERT INTO `internal_resources` VALUES ('TRANS_THIS', 'EN', 'Translate this:', '');
INSERT INTO `internal_resources` VALUES ('SEL_VAR', 'EN', 'Select Variation', '');
INSERT INTO `internal_resources` VALUES ('ARTICLE_VARIATION_MISSING', 'EN', 'Variation of this article does not exist yet', '');
INSERT INTO `internal_resources` VALUES ('SHOW_ADVANCED_SEARCH', 'EN', 'Display advanced search options', '');
INSERT INTO `internal_resources` VALUES ('SEARCH_LIVE_ACRTICLES', 'EN', 'Live articles', '');
INSERT INTO `internal_resources` VALUES ('SHOW', 'EN', 'show', '');
INSERT INTO `internal_resources` VALUES ('HIDE', 'EN', 'hide', '');
INSERT INTO `internal_resources` VALUES ('SEARCH_EXPIRED_ARTICLES', 'EN', 'Expired articles', '');
INSERT INTO `internal_resources` VALUES ('SEASRCH_MISSING_VARIATIONS', 'EN', 'Missing variations', '');
INSERT INTO `internal_resources` VALUES ('MAINT_MODE', 'EN', 'Maintenance Mode', '');
INSERT INTO `internal_resources` VALUES ('MAINT_BB', 'EN', 'Backend Maintenance', '');
INSERT INTO `internal_resources` VALUES ('MAINT_WWW', 'EN', 'Live Website Maintenance', '');
INSERT INTO `internal_resources` VALUES ('UPL_TEXT', 'EN', 'Upload text file', '');
INSERT INTO `internal_resources` VALUES ('WZT_KEEPCLUSTER', 'EN', 'Keep existing clusters ?', '');
INSERT INTO `internal_resources` VALUES ('WZT_KEEPCLUSTER_EXPL', 'EN', 'You can specify whether you want to keep the existing clusters or create copies of each cluster.<br><br>Keep in mind: if you keep the original clusters you sharen them with the original source.', '');
INSERT INTO `internal_resources` VALUES ('SEL_CLUSTER', 'EN', 'Select Cluster', '');
INSERT INTO `internal_resources` VALUES ('NO_CLUSTERTEMPLATES', 'EN', 'There are no cluster-templates.', '');
INSERT INTO `internal_resources` VALUES ('RESET_LOGS', 'EN', 'Reset Logs', '');
INSERT INTO `internal_resources` VALUES ('LOGFILE', 'EN', 'View System Logs', '');
INSERT INTO `internal_resources` VALUES ('LOGS_INFO', 'EN', 'The list below shows you logs made while running N/X.', '');
INSERT INTO `internal_resources` VALUES ('MESSAGE', 'EN', 'Message', '');
INSERT INTO `internal_resources` VALUES ('LATEST_CREATED', 'DE', 'Latest created first', '');
INSERT INTO `internal_resources` VALUES ('OLDEST_CREATED', 'DE', 'Oldest crested first', '');
INSERT INTO `internal_resources` VALUES ('AGENT_WELCOME', 'EN', 'Welcome to N/X.', '');
INSERT INTO `internal_resources` VALUES ('AGENT_GOHOME', 'EN', 'Go home!', '');
INSERT INTO `internal_resources` VALUES ('AGENT_GOAWAY', 'EN', 'Hide and stay away!', '');
INSERT INTO `internal_resources` VALUES ('AGENT_NXHOMEPAGE', 'EN', 'Visit N/X Homepage!', '');
INSERT INTO `internal_resources` VALUES ('AGENT_CALLED', 'EN', 'you asked for me?', '');
INSERT INTO `internal_resources` VALUES ('AGENT_LOGOUT', 'EN', 'I hope you enjoyed working with N/X. Have a nice day!', '');
INSERT INTO `internal_resources` VALUES ('AGENT_EXPLAINHOME', 'EN', 'You can find me by clicking the N/X-Logo in the upper-right corner of your browser.', '');
INSERT INTO `internal_resources` VALUES ('USER_AGENT', 'EN', 'Use Agent', '');
INSERT INTO `internal_resources` VALUES ('CLTPOSITION', 'EN', 'Position', '');
INSERT INTO `internal_resources` VALUES ('FONT', 'EN', 'Font name', '');
INSERT INTO `internal_resources` VALUES ('FONTSIZE', 'EN', 'Font size', '');
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
INSERT INTO `internal_resources` VALUES ('CL_SELECT', 'EN', 'Please select a cluster to link it into the cluster-template', '');
INSERT INTO `internal_resources` VALUES ('M_HOME', 'EN', 'Home', '');
INSERT INTO `internal_resources` VALUES ('CLT_EXCLUSIVE', 'EN', 'Developer Content', '');
INSERT INTO `internal_resources` VALUES ('BACK_SP', 'EN', 'Back to Website', '');
INSERT INTO `internal_resources` VALUES ('CONFIRM_UNSAVED_CHANGES_LINKEDCL', 'EN', 'Note: When changing the linked cluster, any changes you apply on the currently linked cluster will be lost. If you want to save these canges, save your work first and change the linked cluster then. Proceed ?', '');
INSERT INTO `internal_resources` VALUES ('CLLINK', 'EN', 'This box is linked to', '');
INSERT INTO `internal_resources` VALUES ('BACK_SP', 'DE', '', '');
INSERT INTO `internal_resources` VALUES ('BG_COLOR', 'DE', '', '');
INSERT INTO `internal_resources` VALUES ('CLLINK', 'DE', '', '');
INSERT INTO `internal_resources` VALUES ('CLTPOSITION', 'DE', '', '');
INSERT INTO `internal_resources` VALUES ('CLT_EXCLUSIVE', 'DE', '', '');
INSERT INTO `internal_resources` VALUES ('CL_SELECT', 'DE', '', '');
INSERT INTO `internal_resources` VALUES ('CONFIRM_UNSAVED_CHANGES_LINKEDCL', 'DE', '', '');
INSERT INTO `internal_resources` VALUES ('FONT', 'DE', '', '');
INSERT INTO `internal_resources` VALUES ('FONTSIZE', 'DE', '', '');
INSERT INTO `internal_resources` VALUES ('GR_TEXT', 'DE', '', '');
INSERT INTO `internal_resources` VALUES ('HEIGHT', 'DE', '', '');
INSERT INTO `internal_resources` VALUES ('MT_LW_SITE', 'EN', 'Launch whole site', '');
INSERT INTO `internal_resources` VALUES ('INDIV_CONFIG', 'DE', '', '');
INSERT INTO `internal_resources` VALUES ('LOGFILE', 'DE', '', '');
INSERT INTO `internal_resources` VALUES ('LOGS_INFO', 'DE', '', '');
INSERT INTO `internal_resources` VALUES ('MESSAGE', 'DE', '', '');
INSERT INTO `internal_resources` VALUES ('M_HOME', 'DE', '', '');
INSERT INTO `internal_resources` VALUES ('NUMBER', 'DE', '', '');
INSERT INTO `internal_resources` VALUES ('RESET_LOGS', 'DE', '', '');
INSERT INTO `internal_resources` VALUES ('SPM_LAUCH_SUCCESS', 'DE', '', '');
INSERT INTO `internal_resources` VALUES ('TEXT_ALIGN', 'DE', '', '');
INSERT INTO `internal_resources` VALUES ('TEXT_COLOR', 'DE', '', '');
INSERT INTO `internal_resources` VALUES ('TEXT_STYLE', 'DE', '', '');
INSERT INTO `internal_resources` VALUES ('WIDTH', 'DE', '', '');
INSERT INTO `internal_resources` VALUES ('MT_LWS_MESSAGES', 'EN', 'Do you really want to launch the whole website?', '');
INSERT INTO `internal_resources` VALUES ('CH_ARTICLE_DATE', 'EN', 'Article Date', '');
INSERT INTO `internal_resources` VALUES ('EXPIRE', 'EN', 'Expire', '');
INSERT INTO `internal_resources` VALUES ('LATEST_CREATED', 'EN', 'Latest created first', '');
INSERT INTO `internal_resources` VALUES ('OLDEST_CREATED', 'EN', 'Oldest crested first', '');
INSERT INTO `internal_resources` VALUES ('CH_ARTICLE_DATE', 'DE', '', '');
INSERT INTO `internal_resources` VALUES ('EXPIRE', 'DE', '', '');
INSERT INTO `internal_resources` VALUES ('BY_ORDER', 'EN', 'By order', '');
INSERT INTO `internal_resources` VALUES ('MT_LWS_MESSAGES', 'DE', '', '');
INSERT INTO `internal_resources` VALUES ('MT_LW_SITE', 'DE', '', '');
INSERT INTO `internal_resources` VALUES ('GALNAME', 'EN', 'Gallery Name', '');
INSERT INTO `internal_resources` VALUES ('GALDESC', 'EN', 'Gallery Description', '');
INSERT INTO `internal_resources` VALUES ('GAFOLDER', 'EN', 'Image-Folder', '');
INSERT INTO `internal_resources` VALUES ('GALROWS', 'EN', 'Rows', '');
INSERT INTO `internal_resources` VALUES ('GALCOLS', 'EN', 'Columns', '');
INSERT INTO `internal_resources` VALUES ('MEDIA_SUPPORTED', 'EN', 'The Media plugin supports the following file-types:<br>Macromedia Flash Films (.swf), Windows Media (.avi), Real Player (.rm), Apple Quicktime (.mov), MP3 over Windows Media (.mp3), PDF (.pdf)', '');
INSERT INTO `internal_resources` VALUES ('O_DELMES2', 'EN', 'Do you really want to delete this content? It may still be used in some clusters.', '');
INSERT INTO `internal_resources` VALUES ('MISSING_PGN', 'EN', 'Missing Plugin: ', '');
INSERT INTO `internal_resources` VALUES ('IMP_ERR', 'EN', 'You cannot import, because of following errors:', '');
INSERT INTO `internal_resources` VALUES ('FILE_ALREADY_UPLOADED', 'EN', 'You have already uploaded a file. You can go on by pressing Next.', '');
INSERT INTO `internal_resources` VALUES ('GO_IMPORT', 'EN', 'Press Next to import this data now. If the data has already been imported, nothing will be changed.', '');
INSERT INTO `internal_resources` VALUES ('NUMB_IMPORTED', 'EN', 'Number of imported recordsets:', '');
INSERT INTO `internal_resources` VALUES ('PROC_DATA', 'EN', 'Processing Data...', '');
INSERT INTO `internal_resources` VALUES ('BAK_TIPP', 'EN', 'You can backup your database and www and wwwdev folder here. Make sure you have setup backup in settings.inc.php!', '');
INSERT INTO `internal_resources` VALUES ('COPYCLUSTERT', 'EN', 'Create Copy', '');
INSERT INTO `internal_resources` VALUES ('CREATECOPY', 'EN', 'Create Copy', '');
INSERT INTO `internal_resources` VALUES ('COPYCLT', 'EN', 'Copy cluster template', '');
INSERT INTO `internal_resources` VALUES ('SOURCE', 'EN', 'Source', '');
INSERT INTO `internal_resources` VALUES ('NEWNAME', 'EN', 'New Name', '');
INSERT INTO `internal_resources` VALUES ('CHNLAUNCHED', 'EN', 'The channel was launched successfully.', '');
INSERT INTO `internal_resources` VALUES ('MT_LWC', 'EN', 'Launch all articles', '');
INSERT INTO `internal_resources` VALUES ('NO_XML', 'EN', 'The file you uploaded is not XML or your browser does not send the file correct!', '');
INSERT INTO `internal_resources` VALUES ('CHANGE_TEMPLATE', 'EN', 'Change Template', '');
INSERT INTO `internal_resources` VALUES ('CCONLAUNCH', 'EN', 'Clear Cache on Launch', '');
INSERT INTO `internal_resources` VALUES ('CCONLAUNCH_LBL', 'EN', 'Dev-Page-IDs (commaseparated)', '');
INSERT INTO `internal_resources` VALUES ('ROLLOUT_SEL', 'EN', 'Source and Destination for Rollout', '');
INSERT INTO `internal_resources` VALUES ('NEW_ROLLOUT', 'EN', 'Start another rollout', '');
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
INSERT INTO `internal_resources` VALUES ('LATEST', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('LATEST_CREATED', '100', NULL, NULL);
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
INSERT INTO `internal_resources` VALUES ('OLDEST', '100', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('OLDEST_CREATED', '100', NULL, NULL);
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
INSERT INTO `internal_resources` VALUES ('RANDOM', '100', NULL, NULL);
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
INSERT INTO `internal_resources` VALUES ('NOT_FOUND', 'EN', 'Sorry, I found nothing', '');
INSERT INTO `internal_resources` VALUES ('PNF', 'EN', 'The page with the ID you entered was not found.', '');
INSERT INTO `internal_resources` VALUES ('MODTYPE', 'EN', 'Plugin Type', '');
INSERT INTO `internal_resources` VALUES ('VERSION', 'EN', 'Version', '');
INSERT INTO `internal_resources` VALUES ('SOURCEFILE', 'EN', 'Source file', '');
INSERT INTO `internal_resources` VALUES ('UNINSTALL', 'EN', 'Uninstall', '');
INSERT INTO `internal_resources` VALUES ('UNINSTCONF', 'EN', 'Uninstalling a plugin can cause damage to the website! Do you want to proceed?', '');
INSERT INTO `internal_resources` VALUES ('MT_RB_CACHE_MES', 'EN', 'Rebuild Cache of all live pages', '');
INSERT INTO `internal_resources` VALUES ('CL_GROUP', 'EN', 'Cluster Group', '');
INSERT INTO `internal_resources` VALUES ('ACL_ACCESS', 'FR', 'Editer les permissions dans les groupes', NULL);
INSERT INTO `internal_resources` VALUES ('ACL_GROUPEDIT', 'FR', 'Sélectionner le groupe pour éditer les rôles', NULL);
INSERT INTO `internal_resources` VALUES ('ACL_GROUPS', 'FR', 'Sélectionner le groupe à ajouter', NULL);
INSERT INTO `internal_resources` VALUES ('ACL_GROUPSROLES', 'FR', 'Accès étranger', NULL);
INSERT INTO `internal_resources` VALUES ('ACL_INFO', 'FR', 'Accès hérité du parent', NULL);
INSERT INTO `internal_resources` VALUES ('ACL_INHERIT', 'FR', 'Hériter des permissions du parent', NULL);
INSERT INTO `internal_resources` VALUES ('ACL_INHERIT_NOTE', 'FR', 'Note : quand la case est cochée, il n\'y a pas d\'autre configuration disponible !', NULL);
INSERT INTO `internal_resources` VALUES ('ACL_OWNER', 'FR', 'Propriétaire', NULL);
INSERT INTO `internal_resources` VALUES ('ACL_PARENT', 'FR', 'Permissions héritées de', NULL);
INSERT INTO `internal_resources` VALUES ('ACL_ROLE', 'FR', 'Sélectionner les rôles pour le groupe', NULL);
INSERT INTO `internal_resources` VALUES ('ACL_TITLE', 'FR', 'Configuration des permissions pour', NULL);
INSERT INTO `internal_resources` VALUES ('ACTIVE', 'FR', 'Actif', NULL);
INSERT INTO `internal_resources` VALUES ('ACTIVE_VARIATION', 'FR', 'Variation active', NULL);
INSERT INTO `internal_resources` VALUES ('ADD_LINK', 'FR', 'Ajouter un lien', NULL);
INSERT INTO `internal_resources` VALUES ('ADDITIONAL_IMAGE', 'FR', 'Image additionnelle', NULL);
INSERT INTO `internal_resources` VALUES ('ADDITIONAL_LINK', 'FR', 'Lien additionnel', NULL);
INSERT INTO `internal_resources` VALUES ('AFTER', 'FR', 'Après :', NULL);
INSERT INTO `internal_resources` VALUES ('AGENT_CALLED', 'FR', 'Vous m\'avez demandé ?', NULL);
INSERT INTO `internal_resources` VALUES ('AGENT_EXPLAINHOME', 'FR', 'Vous pouvez me trouver en cliquant sur le logo N/X, en haut à droite de la fenêtre', NULL);
INSERT INTO `internal_resources` VALUES ('AGENT_GOAWAY', 'FR', 'Cachez-vous et restez éloigné !', NULL);
INSERT INTO `internal_resources` VALUES ('AGENT_GOHOME', 'FR', 'Rentrez chez vous !', NULL);
INSERT INTO `internal_resources` VALUES ('AGENT_LOGOUT', 'FR', 'J\'espère que vous avez bien travaillé avec N/X. Bonne journée !', NULL);
INSERT INTO `internal_resources` VALUES ('AGENT_NXHOMEPAGE', 'FR', 'Visitez le site de N/X', NULL);
INSERT INTO `internal_resources` VALUES ('AGENT_WELCOME', 'FR', 'Bienvenue sur N/X', NULL);
INSERT INTO `internal_resources` VALUES ('ALC_OWNER', 'FR', 'Définir le propriétaire', NULL);
INSERT INTO `internal_resources` VALUES ('ALL', 'FR', 'Tous', NULL);
INSERT INTO `internal_resources` VALUES ('AR_EXPIRE', 'FR', 'Expirer l\'article', NULL);
INSERT INTO `internal_resources` VALUES ('AR_LAUNCH', 'FR', 'Lancer l\'article', NULL);
INSERT INTO `internal_resources` VALUES ('ARTICLE_IS_EXPIRED', 'FR', 'L\'article a expiré', NULL);
INSERT INTO `internal_resources` VALUES ('ARTICLE_IS_LIVE', 'FR', 'L\'article est en ligne', NULL);
INSERT INTO `internal_resources` VALUES ('ARTICLE_VARIATION_MISSING', 'FR', 'La variation de cet article n\'existe pas encore.', NULL);
INSERT INTO `internal_resources` VALUES ('ARTICLES', 'FR', 'Articles', NULL);
INSERT INTO `internal_resources` VALUES ('AUTH_GROUP', 'FR', 'Authentification', NULL);
INSERT INTO `internal_resources` VALUES ('AUTHOR', 'FR', 'Auteur', NULL);
INSERT INTO `internal_resources` VALUES ('AVAIL_ITEMS', 'FR', 'Entrées disponibles', NULL);
INSERT INTO `internal_resources` VALUES ('AVAIL_VARIATIONS', 'FR', 'Variations disponibles', NULL);
INSERT INTO `internal_resources` VALUES ('AVERAGE', 'FR', 'Moyenne', NULL);
INSERT INTO `internal_resources` VALUES ('AVG_CLICKSTREAM', 'FR', 'Taux de clics moyen', NULL);
INSERT INTO `internal_resources` VALUES ('AVG_VIS_LENGTH', 'FR', 'Temps moyen de visite (secondes)', NULL);
INSERT INTO `internal_resources` VALUES ('AVG_VISIT_LENGTH', 'FR', 'Temps moyen de visite', NULL);
INSERT INTO `internal_resources` VALUES ('BACK', 'FR', 'Retour', NULL);
INSERT INTO `internal_resources` VALUES ('BACK_INFO', 'FR', 'La liste ci-dessous montre les sauvegardes de N/X sur votre serveur. Vous pouvez supprimer les sauvegardes ici. Pour restaurer une sauvegarde, vous devez vous connecter manuellement au serveur et restaurer les fichiers.', NULL);
INSERT INTO `internal_resources` VALUES ('BACK_TO_CV', 'FR', 'Retour à la vue d\'ensemble du cluster', NULL);
INSERT INTO `internal_resources` VALUES ('BACK_TO_OVERVIEW', 'FR', 'Retour à la vue d\'ensemble', NULL);
INSERT INTO `internal_resources` VALUES ('BACKUP', 'FR', 'Sauvegarde système', NULL);
INSERT INTO `internal_resources` VALUES ('BAK_FILE', 'FR', 'Fichier de sauvegarde', NULL);
INSERT INTO `internal_resources` VALUES ('BAK_TIPP', 'FR', 'Vous pouvez sauvegarder votre base de données et les dossiers de site www et wwwdev ici. Vérifiez que vous avez bien configuré la sauvegarde dans settings.inc.php !', NULL);
INSERT INTO `internal_resources` VALUES ('BEGIN', 'FR', 'Démarrer', NULL);
INSERT INTO `internal_resources` VALUES ('BY', 'FR', 'par', NULL);
INSERT INTO `internal_resources` VALUES ('BY_ORDER', 'FR', 'Par ordre', NULL);
INSERT INTO `internal_resources` VALUES ('CACHED', 'FR', 'Page de cache', NULL);
INSERT INTO `internal_resources` VALUES ('CAL_BTO', 'FR', 'Retour à la vue d\'ensemble', NULL);
INSERT INTO `internal_resources` VALUES ('CAL_EDIT', 'FR', 'Editer le rendez-vous', NULL);
INSERT INTO `internal_resources` VALUES ('CAL_NAME', 'FR', 'Nom du calendrier', NULL);
INSERT INTO `internal_resources` VALUES ('CALENDAR', 'FR', 'Calendrier', NULL);
INSERT INTO `internal_resources` VALUES ('CALENDAR_SELECT', 'FR', 'Sélectionner un calendrier', NULL);
INSERT INTO `internal_resources` VALUES ('CALENDARS', 'FR', 'Calendriers', NULL);
INSERT INTO `internal_resources` VALUES ('CALENDARS_CAT_DEFINE', 'FR', 'Définir les catégories', NULL);
INSERT INTO `internal_resources` VALUES ('CALENDARS_DEFINE', 'FR', 'Définir les calendriers', NULL);
INSERT INTO `internal_resources` VALUES ('CALENDARS_EDIT', 'FR', 'Editer le calendrier', NULL);
INSERT INTO `internal_resources` VALUES ('CALENDARS_TIPP', 'FR', 'Vous pouvez créer plusieurs calendriers ici. Chaque calendrier aura ses propres événements et dates.', NULL);
INSERT INTO `internal_resources` VALUES ('CANCEL', 'FR', 'Annuler', NULL);
INSERT INTO `internal_resources` VALUES ('CAT_NAME', 'FR', 'Catégorie', NULL);
INSERT INTO `internal_resources` VALUES ('CATEGORY', 'FR', 'Catégorie', NULL);
INSERT INTO `internal_resources` VALUES ('CH_ADMIN', 'FR', 'Administration du canal', NULL);
INSERT INTO `internal_resources` VALUES ('CH_ARTICLE_DATE', 'FR', 'Date de l\'article', NULL);
INSERT INTO `internal_resources` VALUES ('CH_CAT', 'FR', 'Définir les catégories', NULL);
INSERT INTO `internal_resources` VALUES ('CH_CAT2', 'FR', 'Canal et catégorie', NULL);
INSERT INTO `internal_resources` VALUES ('CHANGE_TEMPLATE', 'FR', 'Changer de modèle', NULL);
INSERT INTO `internal_resources` VALUES ('CHANNEL', 'FR', 'Canal', NULL);
INSERT INTO `internal_resources` VALUES ('CHANNEL_GRABMP', 'FR', NULL, NULL);
INSERT INTO `internal_resources` VALUES ('CHANNEL_IMPORTARTICLES', 'FR', 'Importer des articles', NULL);
INSERT INTO `internal_resources` VALUES ('CHANNEL_SELECT', 'FR', 'Sélectionner un canal', NULL);
INSERT INTO `internal_resources` VALUES ('CHANNELS', 'FR', 'Canaux', NULL);
INSERT INTO `internal_resources` VALUES ('CHOOSEFILE', 'FR', 'Choisir un fichier', NULL);
INSERT INTO `internal_resources` VALUES ('CL_BROWSE', 'FR', 'Voir les clusters', NULL);
INSERT INTO `internal_resources` VALUES ('CL_CREATEINSMES', 'FR', 'Il reste des emplacements pour créer d\'autres instances de ce champ de contenu. Si vous voulez créer une autre instance, entrez un titre dans le champ texte ci-dessous et appuyez sur Créer.', NULL);
INSERT INTO `internal_resources` VALUES ('CL_CREATEINSTANC', 'FR', 'Créer une nouvelle instance', NULL);
INSERT INTO `internal_resources` VALUES ('CL_DEL', 'FR', 'Supprimer l\'instance', NULL);
INSERT INTO `internal_resources` VALUES ('CL_DELMES', 'FR', 'Voulez-vous vraiment supprimer cette instance de cluster ? Toutes les données seront perdues !', NULL);
INSERT INTO `internal_resources` VALUES ('CL_EDIT', 'FR', 'Modifier l\'instance du cluster', NULL);
INSERT INTO `internal_resources` VALUES ('CL_EXPIRE', 'FR', 'Expirer le cluster', NULL);
INSERT INTO `internal_resources` VALUES ('CL_LAUNCH', 'FR', 'Lancer le cluster', NULL);
INSERT INTO `internal_resources` VALUES ('CL_NAME', 'FR', 'Nom du cluster', NULL);
INSERT INTO `internal_resources` VALUES ('CL_NEW', 'FR', 'Nouvelle instance', NULL);
INSERT INTO `internal_resources` VALUES ('CL_NOTITLE', 'FR', 'Aucun titre défini', NULL);
INSERT INTO `internal_resources` VALUES ('CL_PROPERTIES', 'FR', 'Propriétés du cluster', NULL);
INSERT INTO `internal_resources` VALUES ('CL_SELECT', 'FR', 'Sélectionnez un cluster pour le lier à un modèle de cluster', NULL);
INSERT INTO `internal_resources` VALUES ('CLASS_WRONG', 'FR', 'Le fichier spécifié n\'a pas de signature de classe valide !', NULL);
INSERT INTO `internal_resources` VALUES ('CLEAR', 'FR', 'Effacer', NULL);
INSERT INTO `internal_resources` VALUES ('CLEAR_MEDIA', 'FR', 'Supprimer le fichier depuis la base de données', NULL);
INSERT INTO `internal_resources` VALUES ('CLI', 'FR', 'Instance de cluster', NULL);
INSERT INTO `internal_resources` VALUES ('CLI_DELETE', 'FR', 'Supprimer le membre de cluster', NULL);
INSERT INTO `internal_resources` VALUES ('CLI_DELETED', 'FR', 'L\'instance a été supprimée.', NULL);
INSERT INTO `internal_resources` VALUES ('CLI_DELETEMES', 'FR', 'Voulez-vous vraiment supprimer cette instance ? Elle sera perdue à jamais !', NULL);
INSERT INTO `internal_resources` VALUES ('CLI_EDIT', 'FR', 'Modifier le membre de cluster', NULL);
INSERT INTO `internal_resources` VALUES ('CLI_NOTDELETED', 'FR', 'Cette instance ne peut pas être supprimée !', NULL);
INSERT INTO `internal_resources` VALUES ('CLK_PATHS', 'FR', 'Chemins des clics', NULL);
INSERT INTO `internal_resources` VALUES ('CLT', 'FR', 'Modèle de cluster', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_BROWSE', 'FR', 'Voir les modèles de clusters', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_DELETE', 'FR', 'Supprimer le modèle de cluster', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_DELMES', 'FR', 'Vous êtes sur le point de supprimer un modèle de cluster. Cela entraînera la perte de toutes les données créées avec ce modèle. Voulez-vous vraiment continuer ?', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_EXCLUSIVE', 'FR', 'Contenu développeur', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_MAXCARD', 'FR', '', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_MINCARD', 'FR', 'Instances', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_NAME', 'FR', 'Nom du modèle de cluster', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_NEW', 'FR', 'Nouveau modèle de cluster', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_PROPERTIES', 'FR', 'Propriétés du modèle de cluster', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_SCHEME', 'FR', 'Modifier le schéma du modèle de cluster', NULL);
INSERT INTO `internal_resources` VALUES ('CLT_SELECT', 'FR', 'Sélectionner des modèles de clusters', NULL);
INSERT INTO `internal_resources` VALUES ('CLTI_DELETE', 'FR', 'Voulez-vous vraiment supprimer cette entrée ? Toutes les instances seront aussi perdues !', NULL);
INSERT INTO `internal_resources` VALUES ('CLTPOSITION', 'FR', 'Position', NULL);
INSERT INTO `internal_resources` VALUES ('CLUSTER', 'FR', 'Cluster', NULL);
INSERT INTO `internal_resources` VALUES ('CLUSTER_INFORMATION', 'FR', 'Informations de cet enregistrement', NULL);
INSERT INTO `internal_resources` VALUES ('CLUSTER_TEMPLATE', 'FR', 'Modèle de cluster', NULL);
INSERT INTO `internal_resources` VALUES ('CMPTYPE', 'FR', 'Type de composition', NULL);
INSERT INTO `internal_resources` VALUES ('COLOR', 'FR', 'Couleur', NULL);
INSERT INTO `internal_resources` VALUES ('COMB_ALL', 'FR', 'Tout sélectionner', NULL);
INSERT INTO `internal_resources` VALUES ('COMB_NONE', 'FR', 'Tout effacer', NULL);
INSERT INTO `internal_resources` VALUES ('COMMENT', 'FR', 'Commentaire', NULL);
INSERT INTO `internal_resources` VALUES ('COMMIT', 'FR', 'Proposer', NULL);
INSERT INTO `internal_resources` VALUES ('CONFIG', 'FR', 'Configurer', NULL);
INSERT INTO `internal_resources` VALUES ('CONFIGURED', 'FR', 'Prêt à l\'utilisation', NULL);
INSERT INTO `internal_resources` VALUES ('CONFIRM_DELETE', 'FR', 'Voulez-vous vraiment supprimer cette entrée ?', NULL);
INSERT INTO `internal_resources` VALUES ('CONFIRM_UNSAVED_CHANGES', 'FR', 'Note : les modifications non enregistrées seront perdues si vous continuez. Si vous avez déjà modifié quelque chose, vous pouvez annuler et enregistrer votre travail. On continue ? ', NULL);
INSERT INTO `internal_resources` VALUES ('CONTAINERNAME', 'FR', 'Modèle', NULL);
INSERT INTO `internal_resources` VALUES ('CONTENT', 'FR', 'Contenu', NULL);
INSERT INTO `internal_resources` VALUES ('CONTENT_DESC', 'FR', 'Description du contenu', NULL);
INSERT INTO `internal_resources` VALUES ('CONTENTITEM', 'FR', 'Entrée de contenu', NULL);
INSERT INTO `internal_resources` VALUES ('CONTENTTYPE', 'FR', 'Type de contenu', NULL);
INSERT INTO `internal_resources` VALUES ('COPY_CLUSTER', 'FR', 'Copier des clusters', NULL);
INSERT INTO `internal_resources` VALUES ('COUNT', 'FR', 'Compteur', NULL);
INSERT INTO `internal_resources` VALUES ('CP_GROUP', 'FR', 'Groupe composé', NULL);
INSERT INTO `internal_resources` VALUES ('CPG_MEMBERS_SELECT', 'FR', 'Sélectionner des membres de ce groupe de composition', NULL);
INSERT INTO `internal_resources` VALUES ('CR_CONTENT', 'FR', 'Créer du contenu pour cette page ?', NULL);
INSERT INTO `internal_resources` VALUES ('CREATE', 'FR', 'Créer un article', NULL);
INSERT INTO `internal_resources` VALUES ('CREATE_ARTICLE', 'FR', 'Créer un nouvel article dans le canal', NULL);
INSERT INTO `internal_resources` VALUES ('CREATE_INSTANCES', 'FR', 'Créer des instances', NULL);
INSERT INTO `internal_resources` VALUES ('CREATED', 'FR', 'Créé', NULL);
INSERT INTO `internal_resources` VALUES ('CREATED_AT', 'FR', 'Créé le', NULL);
INSERT INTO `internal_resources` VALUES ('CREATENEW', 'FR', 'Un nouveau membre de ce modèle a été créé. Voir les données ci-dessous', NULL);
INSERT INTO `internal_resources` VALUES ('DATE', 'FR', 'Date', NULL);
INSERT INTO `internal_resources` VALUES ('DATEFORMAT', 'FR', 'Ce format de date n\'est pas correct !', NULL);
INSERT INTO `internal_resources` VALUES ('DEL_ARTICLE', 'FR', 'Voulez-vous vraiment supprimer cet article dans toutes ses variations ?', NULL);
INSERT INTO `internal_resources` VALUES ('DEL_FOLDER', 'FR', 'Supprimer le dossier', NULL);
INSERT INTO `internal_resources` VALUES ('DELETE', 'FR', 'Supprimer', NULL);
INSERT INTO `internal_resources` VALUES ('DELETE_PAGE', 'FR', 'Supprimer la page', NULL);
INSERT INTO `internal_resources` VALUES ('DELETESUCCESS', 'FR', 'Les données ci-dessous ont été supprimées de la base de données. Elles sont maintenant perdues !', NULL);
INSERT INTO `internal_resources` VALUES ('DESC', 'FR', 'Description', NULL);
INSERT INTO `internal_resources` VALUES ('DESCRIPTION', 'FR', 'Description', NULL);
INSERT INTO `internal_resources` VALUES ('DESTROY_EXCLUSIVE_CONTENT', 'FR', 'Détruire le contenu exclusif', NULL);
INSERT INTO `internal_resources` VALUES ('DESTROY_TREE', 'FR', 'Détruire l\'arborescence', NULL);
INSERT INTO `internal_resources` VALUES ('DISABLE', 'FR', 'Désactiver', NULL);
INSERT INTO `internal_resources` VALUES ('DISPLAY', 'FR', 'Afficher', NULL);
INSERT INTO `internal_resources` VALUES ('DOSOMETHING', 'FR', 'Sélectionnez l\'action que vous souhaitez. Vous pouvez insérer des entrées, les modifier, les supprimer et changer leur ordre.', NULL);
INSERT INTO `internal_resources` VALUES ('DOWN', 'FR', 'Bas', NULL);
INSERT INTO `internal_resources` VALUES ('DWEXT_CONTENTFIE', 'FR', 'Générer les informations du champ de contenu', NULL);
INSERT INTO `internal_resources` VALUES ('DWEXT_CONTENTFIELDINFO', 'FR', 'Générer les informations du champ de contenu', NULL);
INSERT INTO `internal_resources` VALUES ('DWEXT_CONTENTFIELDINFO_MES', 'FR', 'Générer les informations du champ de contenu pour Dreamweaver MX', NULL);
INSERT INTO `internal_resources` VALUES ('ED_CLT', 'FR', 'Modifier le modèle de cluster', NULL);
INSERT INTO `internal_resources` VALUES ('ED_CONTENT', 'FR', 'Modifier le contenu', NULL);
INSERT INTO `internal_resources` VALUES ('ED_CPGROUP', 'FR', 'Modifier le groupe de composition', NULL);
INSERT INTO `internal_resources` VALUES ('ED_CPGROUPGENERAL', 'FR', 'Modifier le groupe général', NULL);
INSERT INTO `internal_resources` VALUES ('ED_DISPATCHER', 'FR', 'Utilisez ce bouton pour basculer entre la modification des méta-données et la modification du contenu.', NULL);
INSERT INTO `internal_resources` VALUES ('ED_META', 'FR', 'Modifier les méta-données', NULL);
INSERT INTO `internal_resources` VALUES ('ED_PROPERTIES', 'FR', 'Modifier les propriétés', NULL);
INSERT INTO `internal_resources` VALUES ('EDIT', 'FR', 'Modifier', NULL);
INSERT INTO `internal_resources` VALUES ('EDIT_ACCESS', 'FR', 'Définir les accès', NULL);
INSERT INTO `internal_resources` VALUES ('EDIT_ALL', 'FR', 'Modifier tout', NULL);
INSERT INTO `internal_resources` VALUES ('EDIT_ARTICLE', 'FR', 'Modifier l\'article', NULL);
INSERT INTO `internal_resources` VALUES ('EDIT_CONTENT', 'FR', 'Modifier le contenu', NULL);
INSERT INTO `internal_resources` VALUES ('EDIT_FOLDER', 'FR', 'Modifier le dossier', NULL);
INSERT INTO `internal_resources` VALUES ('EDIT_SPM', 'FR', 'Modifier les propriétés du modèle', NULL);
INSERT INTO `internal_resources` VALUES ('EDIT_TEMPLATE', 'FR', 'Modifier le modèle', NULL);
INSERT INTO `internal_resources` VALUES ('EDITED', 'FR', 'Modifié', NULL);
INSERT INTO `internal_resources` VALUES ('EMPTY', 'FR', '<vide>', NULL);
INSERT INTO `internal_resources` VALUES ('ENDATE', 'FR', 'Date de fin', NULL);
INSERT INTO `internal_resources` VALUES ('ENDTIME', 'FR', 'Heure de fin', NULL);
INSERT INTO `internal_resources` VALUES ('ENVIRONMENT', 'FR', 'Environnement', NULL);
INSERT INTO `internal_resources` VALUES ('ERROR', 'FR', 'Une erreur est apparue pendant l\'opération sélectionnée !', NULL);
INSERT INTO `internal_resources` VALUES ('ERROR_SEL_GROUP', 'FR', 'Vous devez choisir un groupe !', NULL);
INSERT INTO `internal_resources` VALUES ('ERROR_SEL_ROLE', 'FR', 'Vous devez choisir au moins un rôle !', NULL);
INSERT INTO `internal_resources` VALUES ('EXEC_EXPORT', 'FR', 'Exportation de la ressource en cours', NULL);
INSERT INTO `internal_resources` VALUES ('EXP_REPORT', 'FR', 'Exportation des données suivantes en cours', NULL);
INSERT INTO `internal_resources` VALUES ('EXPIRE', 'FR', 'Expirer', NULL);
INSERT INTO `internal_resources` VALUES ('EXPL_EXEC_EXPORT', 'FR', 'Ce système génère actuellement un fichier XML d\'exportation.<br/><br/>Dans quelques secondes, une fenêtre apparaîtra. Cliquez sur Enregistrer pour placer la ressource sur votre disque.', NULL);
INSERT INTO `internal_resources` VALUES ('EXPL_SEL_CH', 'FR', 'Choisissez un canal.', NULL);
INSERT INTO `internal_resources` VALUES ('EXPL_SEL_CLUSTER', 'FR', 'Après avoir choisi un modèle de cluster, vous pourrez choisir un cluster dans la liste qui apparaîtra.', NULL);
INSERT INTO `internal_resources` VALUES ('EXPL_SEL_SPM', 'FR', 'Choisissez un modèle de page.', NULL);
INSERT INTO `internal_resources` VALUES ('EXPLORE', 'FR', 'Explorer', NULL);
INSERT INTO `internal_resources` VALUES ('EXPORT_DATA', 'FR', 'Assistant d\'exportation du contenu et des modèles', NULL);
INSERT INTO `internal_resources` VALUES ('FILTER_COLUMN', 'FR', '…dans', NULL);
INSERT INTO `internal_resources` VALUES ('FILTER_RULE', 'FR', 'Chercher…', NULL);
INSERT INTO `internal_resources` VALUES ('FIND_OBJ', 'FR', 'Trouver l\'objet', NULL);
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
INSERT INTO `internal_resources` VALUES ('HELP_ACCESS', 'FR', 'Un dispositif existe pour créer et gérer des profils d\'utilisateur dans N/X.', NULL);
INSERT INTO `internal_resources` VALUES ('HELP_ARTICLES', 'EN', 'The form displays articles.<br><br>The color codes are:<li>red: article not published<li>grey: article not translated<li>green: article published', '');
INSERT INTO `internal_resources` VALUES ('HELP_BACKUP', 'FR', 'La liste ci-dessous montre les sauvegardes de N/X sur votre serveur. Vous pouvez supprimer les sauvegardes ici. Pour restaurer une sauvegarde, vous devez vous connecter manuellement au serveur et restaurer les fichiers.', NULL);
INSERT INTO `internal_resources` VALUES ('HELP_CHANNEL', 'FR', 'Catégories de thèmes définissant le contenu des articles créés par N/X (par exemple, News, Personnes…).', NULL);
INSERT INTO `internal_resources` VALUES ('HELP_CLB', 'FR', 'Un cluster est une collection de champs de contenu dynamiques ou statiques, complétés par un développeur ou un rédacteur de pages Web. La définition de la structure dans N/X est faite avec des clusters de données.', NULL);
INSERT INTO `internal_resources` VALUES ('HELP_CLT', 'FR', 'Le modèle de cluster est un formulaire qui vous permet de créer la structure des données pour votre site et de définir le type de contenu. Ensuite, le modèle de cluster est fusionné avec un modèle de page qui gère le contenu de la page Web.', NULL);
INSERT INTO `internal_resources` VALUES ('HELP_COMPGRP', 'FR', 'Le groupe de composition est un groupe de clusters. Les modèles de clusters peuvent avoir leur propre disposition. Ceci vous permet de construire votre page Web hors de blocs (par exemple, articles de news, sondage, galerie de photos... le tout sur une page et sur demande).', NULL);
INSERT INTO `internal_resources` VALUES ('HELP_DW', 'FR', 'Crée un dossier de configuration pour l\'extension N/X de Dreamweaver. A l\'aide de cette extension, des modèles peuvent être développés avec Dreamweaver.', NULL);
INSERT INTO `internal_resources` VALUES ('HELP_METATEMP', 'FR', 'Un modèle de méta-donnée est utilisé pour définir quels champs de méta-données seront placés dans une nouvelle page. Quand vous créez un nouveau champ de méta-donnée dans le modèle, chaque nouvelle page basée sur ce modèle contiendra ce champ.', NULL);
INSERT INTO `internal_resources` VALUES ('HELP_OBJBROWSE', 'FR', 'La bibliothèque de contenu contient tous les éléments de contenu du site', NULL);
INSERT INTO `internal_resources` VALUES ('HELP_PAGETEMP', 'FR', 'Dans les tableurs et les applications de base de données, un modèle est un formulaire vide qui montre quels champs existent, leur emplacement et leur longueur. Dans N/X, les modèles sont à la base de son fonctionnement. Un modèle est un formulaire dans lequel toutes les cellules ont été définies mais aucune donnée n\'a encore été saisie.', NULL);
INSERT INTO `internal_resources` VALUES ('HELP_PGN', 'FR', 'Les extensions vous permettent d\'étendre les fonctions de N/X. Typiquement, des extensions sont employées pour créer de nouveaux types d\'objets, en plus des deux types d\'objets standards Text et Image.', NULL);
INSERT INTO `internal_resources` VALUES ('HELP_PURGE', 'FR', 'Supprime les informations inutiles de la base de données.', NULL);
INSERT INTO `internal_resources` VALUES ('HELP_ROLLOUT', 'FR', 'Rollout est un dispositif de N/X qui permet de créer des copies d\'une section de votre page Web et de les réutiliser avec ou sans l\'ancien contenu.', NULL);
INSERT INTO `internal_resources` VALUES ('HELP_SP', 'FR', 'Le plan du site est utilisé pour modifier la structure et les pages du site.', NULL);
INSERT INTO `internal_resources` VALUES ('HELP_SYNCCL', 'FR', 'Dispositif utilisé pour synchroniser les clusters après avoir modifié ou changé un modèle de cluster.', NULL);
INSERT INTO `internal_resources` VALUES ('HELP_VARIATION', 'FR', 'Un contenu peut avoir plusieurs variations. Ces variations peuvent être des langues différentes ou des profils de contenu différents.', NULL);
INSERT INTO `internal_resources` VALUES ('HIDE', 'FR', 'Cacher', NULL);
INSERT INTO `internal_resources` VALUES ('HOUR', 'FR', 'Heures', NULL);
INSERT INTO `internal_resources` VALUES ('HOURS_AS', 'FR', 'Analyse des heures', NULL);
INSERT INTO `internal_resources` VALUES ('I_AFTER', 'FR', 'Insérer après', NULL);
INSERT INTO `internal_resources` VALUES ('IMPORT_DATA', 'FR', 'Importer des données N/X-XML', NULL);
INSERT INTO `internal_resources` VALUES ('IN_CHANNEL', 'FR', 'dans le canal', NULL);
INSERT INTO `internal_resources` VALUES ('IND_TIME', 'FR', 'Fuseau horaire individuel', NULL);
INSERT INTO `internal_resources` VALUES ('INDIV_CONFIG', 'FR', 'Configuration individuelle pour cette entrée', NULL);
INSERT INTO `internal_resources` VALUES ('INSNAME', 'FR', '<Nom du cluster>', NULL);
INSERT INTO `internal_resources` VALUES ('INSTANCE_CREATED', 'FR', 'Une nouvelle instance de cette entrée a été créée.', NULL);
INSERT INTO `internal_resources` VALUES ('INSTANCES_CREATED', 'FR', 'De nouvelles instances de cette entrée ont été créées.', NULL);
INSERT INTO `internal_resources` VALUES ('IS_COMPOUND', 'FR', 'Modèle de cluster de composition', NULL);
INSERT INTO `internal_resources` VALUES ('IS_FILTERED', 'FR', 'Note : vous ne pouvez pas afficher tous les enregistrements parce que vous utilisez un filtre !  ', NULL);
INSERT INTO `internal_resources` VALUES ('KEEP_CLUSTER', 'FR', 'Garder le cluster original', NULL);
INSERT INTO `internal_resources` VALUES ('KEYWORDS', 'FR', 'Mots-clés', NULL);
INSERT INTO `internal_resources` VALUES ('LAST_LAUNCHED_AT', 'FR', 'Dernier lancement à', NULL);
INSERT INTO `internal_resources` VALUES ('LAST_MOD_AT', 'FR', 'Dernière modification à', NULL);
INSERT INTO `internal_resources` VALUES ('LASTMONTH', 'FR', 'Mois dernier', NULL);
INSERT INTO `internal_resources` VALUES ('LASTWEEK', 'FR', 'Semaine dernière', NULL);
INSERT INTO `internal_resources` VALUES ('LASTYEAR', 'FR', 'Année dernière', NULL);
INSERT INTO `internal_resources` VALUES ('LATEST', 'FR', 'Les plus récents', NULL);
INSERT INTO `internal_resources` VALUES ('LATEST_CREATED', 'FR', 'Les plus récents en premier', NULL);
INSERT INTO `internal_resources` VALUES ('LAUNCH', 'FR', 'Lancement', NULL);
INSERT INTO `internal_resources` VALUES ('LEAVE_EMPTY', 'FR', 'Laisser vide', NULL);
INSERT INTO `internal_resources` VALUES ('LIBRARY', 'FR', 'Bibliothèque de contenu', NULL);
INSERT INTO `internal_resources` VALUES ('LINKED', 'FR', 'Lié à', NULL);
INSERT INTO `internal_resources` VALUES ('LIVE_AUTHORING', 'FR', 'Gestion en direct', NULL);
INSERT INTO `internal_resources` VALUES ('LOCATION', 'FR', 'Emplacement, si externe', NULL);
INSERT INTO `internal_resources` VALUES ('LOCK_MENU', 'FR', 'Bloquer le menu', NULL);
INSERT INTO `internal_resources` VALUES ('LOGFILE', 'FR', 'Voir les logs système', NULL);
INSERT INTO `internal_resources` VALUES ('LOGGED_AS', 'FR', 'Utilisateur connecté', NULL);
INSERT INTO `internal_resources` VALUES ('LOGIN_FAILED', 'FR', 'L\'identifiant saisi ne peut pas être vérifié ! Essayez de nouveau.', NULL);
INSERT INTO `internal_resources` VALUES ('LOGS', 'FR', 'Analyse du fichier de logs', NULL);
INSERT INTO `internal_resources` VALUES ('LOGS_INFO', 'FR', 'La liste ci-dessous montre les logs réalisés pendant que N/X fonctionne.', NULL);
INSERT INTO `internal_resources` VALUES ('LONGEST_PATHS', 'FR', 'Chemins les plus longs', NULL);
INSERT INTO `internal_resources` VALUES ('M_ACCESS', 'FR', 'Accès', NULL);
INSERT INTO `internal_resources` VALUES ('M_ADMIN', 'FR', 'Administration', NULL);
INSERT INTO `internal_resources` VALUES ('M_BACKUP', 'FR', 'Sauvegarde', NULL);
INSERT INTO `internal_resources` VALUES ('M_BROWSER', 'FR', 'Navigateur d\'objets', NULL);
INSERT INTO `internal_resources` VALUES ('M_CHANNELS', 'FR', 'Canaux', NULL);
INSERT INTO `internal_resources` VALUES ('M_CLB', 'FR', 'Navigateur de clusters', NULL);
INSERT INTO `internal_resources` VALUES ('M_CLT', 'FR', 'Modèles de clusters', NULL);
INSERT INTO `internal_resources` VALUES ('M_CLTB', 'FR', 'Navigateur de modèles de clusters', NULL);
INSERT INTO `internal_resources` VALUES ('M_CLUSTERS', 'FR', 'Clusters', NULL);
INSERT INTO `internal_resources` VALUES ('M_COMBOBJ', 'FR', 'Contenus combinés (cluster)', NULL);
INSERT INTO `internal_resources` VALUES ('M_ES', 'FR', 'Explorer le site', NULL);
INSERT INTO `internal_resources` VALUES ('M_EXPORT_WZ', 'FR', 'Assistant d\'exportation', NULL);
INSERT INTO `internal_resources` VALUES ('M_HELP', 'FR', 'Aide', NULL);
INSERT INTO `internal_resources` VALUES ('M_HOME', 'FR', 'Accueil', NULL);
INSERT INTO `internal_resources` VALUES ('M_IMPORT_WZ', 'FR', 'Assistant d\'importation', NULL);
INSERT INTO `internal_resources` VALUES ('M_INSTALLPLUGIN', 'FR', 'Extensions', NULL);
INSERT INTO `internal_resources` VALUES ('M_LIB', 'FR', 'Bibliothèque', NULL);
INSERT INTO `internal_resources` VALUES ('M_LOGOUT', 'FR', 'Se déconnecter', NULL);
INSERT INTO `internal_resources` VALUES ('M_MAINTENANCE', 'FR', 'Maintenance', NULL);
INSERT INTO `internal_resources` VALUES ('M_META', 'FR', 'Modèles de méta', NULL);
INSERT INTO `internal_resources` VALUES ('M_MYPROFILE', 'FR', 'Mon profil', NULL);
INSERT INTO `internal_resources` VALUES ('M_MYPRT', 'FR', 'Mes portails', NULL);
INSERT INTO `internal_resources` VALUES ('M_PGN', 'FR', 'Contrôle des extensions', NULL);
INSERT INTO `internal_resources` VALUES ('M_PRTMAN', 'FR', 'Gestionnaire de portail', NULL);
INSERT INTO `internal_resources` VALUES ('M_PTEMP', 'FR', 'Modèles de pages', NULL);
INSERT INTO `internal_resources` VALUES ('M_PURGE', 'FR', 'Nettoyer le base de données', NULL);
INSERT INTO `internal_resources` VALUES ('M_REPORT', 'FR', 'Rapport de site', NULL);
INSERT INTO `internal_resources` VALUES ('M_ROLLOUT', 'FR', 'Bascule', NULL);
INSERT INTO `internal_resources` VALUES ('M_SPM', 'FR', 'Page de site maître', NULL);
INSERT INTO `internal_resources` VALUES ('M_TEMP', 'FR', 'Modèles', NULL);
INSERT INTO `internal_resources` VALUES ('M_TRANSLATION', 'FR', 'Traduction', NULL);
INSERT INTO `internal_resources` VALUES ('M_UMAN', 'FR', 'Gestion des utilisateurs', NULL);
INSERT INTO `internal_resources` VALUES ('M_VAR', 'FR', 'Variations', NULL);
INSERT INTO `internal_resources` VALUES ('M_WWW', 'FR', 'Site Web', NULL);
INSERT INTO `internal_resources` VALUES ('MANDATORY', 'FR', 'Ce champ ne peut pas être vide !', NULL);
INSERT INTO `internal_resources` VALUES ('MAXIMUM', 'FR', 'Maximum', NULL);
INSERT INTO `internal_resources` VALUES ('MAXIMUMAT', 'FR', 'Maximum à', NULL);
INSERT INTO `internal_resources` VALUES ('MEDIAN', 'FR', 'Médian', NULL);
INSERT INTO `internal_resources` VALUES ('MENU', 'FR', 'Menu', NULL);
INSERT INTO `internal_resources` VALUES ('MESSAGE', 'FR', 'Message', NULL);
INSERT INTO `internal_resources` VALUES ('METATEMPLATE', 'FR', 'Modèle de méta-clé additionnel', NULL);
INSERT INTO `internal_resources` VALUES ('METATEMPLATES', 'FR', 'Modèles de méta-données', NULL);
INSERT INTO `internal_resources` VALUES ('MH_GETSTART', 'FR', 'Pour commencer', NULL);
INSERT INTO `internal_resources` VALUES ('MH_GLOSSARY', 'FR', 'Lexique', NULL);
INSERT INTO `internal_resources` VALUES ('MINIMUM', 'FR', 'Minimum', NULL);
INSERT INTO `internal_resources` VALUES ('MINIMUMAT', 'FR', 'Minimum à', NULL);
INSERT INTO `internal_resources` VALUES ('MT_ADDITIONAL', 'FR', 'Méta-données additionnelles', NULL);
INSERT INTO `internal_resources` VALUES ('MT_BASE', 'FR', 'Méta-données basiques', NULL);
INSERT INTO `internal_resources` VALUES ('MT_DELETE', 'FR', 'Voulez-vous vraiment supprimer cette partie du modèle de méta ? Toute les informations écrites dans n\'importe quelle méta-donnée liée à la présente partie seront supprimées. Les données vont être perdues à jamais ! ', NULL);
INSERT INTO `internal_resources` VALUES ('MT_DW_CONTENT', 'FR', 'Extension Dreamweaver', NULL);
INSERT INTO `internal_resources` VALUES ('MT_DW_CONTENTFIE', 'FR', 'Informations du champ de contenu Dreamweaver', NULL);
INSERT INTO `internal_resources` VALUES ('MT_DW_CONTENTFIELDINFO', 'FR', 'Informations du champ de contenu Dreamweaver', NULL);
INSERT INTO `internal_resources` VALUES ('MT_GENERATE_DTA', 'FR', 'Générer les types de données', NULL);
INSERT INTO `internal_resources` VALUES ('MT_GENERATE_DTA_', 'FR', 'génère les types de données', NULL);
INSERT INTO `internal_resources` VALUES ('MT_GENERATE_DTA_MES', 'FR', 'génère les types de données', NULL);
INSERT INTO `internal_resources` VALUES ('MT_GENERATE_DTA_SUCCEEDED', 'FR', '<br><br>Les types de données ont été générés avec succès et le fichier écrit.<br>', NULL);
INSERT INTO `internal_resources` VALUES ('MT_LW_SITE', 'FR', 'Lancer le site entier', NULL);
INSERT INTO `internal_resources` VALUES ('MT_MODULE', 'FR', 'Méta-donnée de type de contenu spécifique', NULL);
INSERT INTO `internal_resources` VALUES ('MT_PROPERTIES', 'FR', 'Modifier les propriétés du modèle de méta', NULL);
INSERT INTO `internal_resources` VALUES ('MT_SCHEME', 'FR', 'Modifier le schéma du modèle de méta', NULL);
INSERT INTO `internal_resources` VALUES ('MT_SPIDER', 'FR', 'Démarrer le spider', NULL);
INSERT INTO `internal_resources` VALUES ('MT_SYNC_CL', 'FR', 'Synchroniser les clusters', NULL);
INSERT INTO `internal_resources` VALUES ('MT_TITLE', 'FR', 'Maintenance', NULL);
INSERT INTO `internal_resources` VALUES ('MULTIPAGE', 'FR', 'Multipage', NULL);
INSERT INTO `internal_resources` VALUES ('NAME', 'FR', 'Nom', NULL);
INSERT INTO `internal_resources` VALUES ('NEW', 'FR', 'Créer un nouveau', NULL);
INSERT INTO `internal_resources` VALUES ('NEW_ARTICLE', 'FR', 'Nouvel article', NULL);
INSERT INTO `internal_resources` VALUES ('NEW_CONTENT', 'FR', 'Nouveau contenu', NULL);
INSERT INTO `internal_resources` VALUES ('NEW_FOLDER', 'FR', 'Créer un dossier', NULL);
INSERT INTO `internal_resources` VALUES ('NEXT', 'FR', 'Suivant', NULL);
INSERT INTO `internal_resources` VALUES ('NO', 'FR', 'Non', NULL);
INSERT INTO `internal_resources` VALUES ('NO_CLUSTER', 'FR', 'Il n\'y a aucun cluster.', NULL);
INSERT INTO `internal_resources` VALUES ('NO_CLUSTER_SELECTED', 'FR', 'Aucun cluster sélectionné.', NULL);
INSERT INTO `internal_resources` VALUES ('NO_CLUSTERTEMPLATES', 'FR', 'Il n\'y a aucun modèle de cluster.', NULL);
INSERT INTO `internal_resources` VALUES ('NO_CONTENT', 'FR', 'Aucun contenu déjà saisi.', NULL);
INSERT INTO `internal_resources` VALUES ('NO_CONTENTS', 'FR', 'Aucun contenu disponible dans ce dossier.', NULL);
INSERT INTO `internal_resources` VALUES ('NO_OBJ', 'FR', 'Aucun objet sélectionné.', NULL);
INSERT INTO `internal_resources` VALUES ('NO_VARIATIONS', 'FR', 'Il n\'y a actuellement aucune variation définie pour cet objet<br>Demandez à un développeur de vérifier la configuration de l\'entrée sélectionnée.', NULL);
INSERT INTO `internal_resources` VALUES ('NODE_ACCESS', 'FR', 'Définir les accès pour la racine du site', NULL);
INSERT INTO `internal_resources` VALUES ('NOSPTITLE', 'FR', 'Vous devez définir le nom dans le menu avant de pouvoir lancer la page !', NULL);
INSERT INTO `internal_resources` VALUES ('NOT_SELECTED', 'FR', 'Aucune entrée encore sélectionnée.', NULL);
INSERT INTO `internal_resources` VALUES ('NOT_SPECIFIED', 'FR', 'N\'importe quel type', NULL);
INSERT INTO `internal_resources` VALUES ('NOTCONFIGURED', 'FR', 'Pas encore configuré.', NULL);
INSERT INTO `internal_resources` VALUES ('NOTNUMBER', 'FR', 'Vous devez entrer un nombre dans ce champ !', NULL);
INSERT INTO `internal_resources` VALUES ('NUM_OF_ART', 'FR', 'Nombre d\'articles (999 = infini)', NULL);
INSERT INTO `internal_resources` VALUES ('NUMBER_OF_INSTANCES', 'FR', 'Spécifiez combien d\'instances vous voulez créer.', NULL);
INSERT INTO `internal_resources` VALUES ('O_ALT', 'FR', 'Libellé ALT', NULL);
INSERT INTO `internal_resources` VALUES ('O_BROWSE', 'FR', 'Naviguer dans les objets', NULL);
INSERT INTO `internal_resources` VALUES ('O_COPYRIGHT', 'FR', 'Copyright', NULL);
INSERT INTO `internal_resources` VALUES ('O_DBLINK_ADDWHERE', 'FR', 'Clause WHERE additionnelle', NULL);
INSERT INTO `internal_resources` VALUES ('O_DBLINK_EXTERNALDB', 'FR', 'Base de données externe', NULL);
INSERT INTO `internal_resources` VALUES ('O_DBLINK_SRCHVALUE', 'FR', 'Rechercher la valeur', NULL);
INSERT INTO `internal_resources` VALUES ('O_DEL', 'FR', 'Supprimer l\'objet', NULL);
INSERT INTO `internal_resources` VALUES ('O_DELMES', 'FR', 'Vous êtes sur le point de supprimer un objet.<b>Notez que toutes les variations et toutes les méta-données seront perdues !</b>', NULL);
INSERT INTO `internal_resources` VALUES ('O_EDIT', 'FR', 'Modifier l\'objet', NULL);
INSERT INTO `internal_resources` VALUES ('O_NAME', 'FR', 'Nom de l\'objet', NULL);
INSERT INTO `internal_resources` VALUES ('O_NEW', 'FR', 'Nouvel objet', NULL);
INSERT INTO `internal_resources` VALUES ('O_PREVIEW', 'FR', 'Prévisualisation de', NULL);
INSERT INTO `internal_resources` VALUES ('O_PROPERTIES', 'FR', 'Propriétés de l\'objet', NULL);
INSERT INTO `internal_resources` VALUES ('O_TEXT', 'FR', 'Texte', NULL);
INSERT INTO `internal_resources` VALUES ('O_TEXT_NOBREAK', 'FR', 'Ignorer les nouvelles lignes', NULL);
INSERT INTO `internal_resources` VALUES ('OBJLAUNCH_SUCCESS', 'FR', 'L\'objet a été lancé avec succès.', NULL);
INSERT INTO `internal_resources` VALUES ('OK', 'FR', 'Ok', NULL);
INSERT INTO `internal_resources` VALUES ('OLDEST', 'FR', 'Les plus anciens', NULL);
INSERT INTO `internal_resources` VALUES ('OLDEST_CREATED', 'FR', 'Les plus anciens créés d\'abord', NULL);
INSERT INTO `internal_resources` VALUES ('ORDER', 'FR', 'Par ordre', NULL);
INSERT INTO `internal_resources` VALUES ('ORDERART', 'FR', 'Ordre des articles', NULL);
INSERT INTO `internal_resources` VALUES ('ORDERCOMP', 'FR', 'Ordres des compositions', NULL);
INSERT INTO `internal_resources` VALUES ('OTHERS', 'FR', 'Autres', NULL);
INSERT INTO `internal_resources` VALUES ('OVERVIEW', 'FR', 'Vue d\'ensemble', NULL);
INSERT INTO `internal_resources` VALUES ('PAGE', 'FR', 'Page', NULL);
INSERT INTO `internal_resources` VALUES ('PAGE_TEMPLATE', 'FR', 'Modèle de page', NULL);
INSERT INTO `internal_resources` VALUES ('PAGES', 'FR', 'Pages', NULL);
INSERT INTO `internal_resources` VALUES ('PASSWORD', 'FR', 'Mot de passe', NULL);
INSERT INTO `internal_resources` VALUES ('PATH', 'FR', 'Chemin', NULL);
INSERT INTO `internal_resources` VALUES ('PATHS', 'FR', 'Chemin de clics', NULL);
INSERT INTO `internal_resources` VALUES ('PERCENT', 'FR', 'Pourcentage', NULL);
INSERT INTO `internal_resources` VALUES ('PG_ALREADYINSTAL', 'FR', 'L\'extension est déjà installée !', NULL);
INSERT INTO `internal_resources` VALUES ('PG_CHOOSE', 'FR', 'Extension : /plugin/', NULL);
INSERT INTO `internal_resources` VALUES ('PG_ERROR', 'FR', 'Il y a eu une erreur pendant l\'installation de l\'extension !', NULL);
INSERT INTO `internal_resources` VALUES ('PG_FILEWRONG', 'FR', 'Le nom de fichier entré ne peut pas être trouvé sur le serveur !', NULL);
INSERT INTO `internal_resources` VALUES ('PG_INSTALL', 'FR', 'Installer une extension', NULL);
INSERT INTO `internal_resources` VALUES ('PG_INSTALLDESC', 'FR', 'Vérifiez que vous avez copié tous les fichiers nécessaires dans le dossier avant de procéder. Insérez le chemin correct de l\'extension dans le champ ci-dessous. Le système pourra alors installer l\'extension automatiquement.', NULL);
INSERT INTO `internal_resources` VALUES ('PG_INSTALLED', 'FR', 'L\'extension a été installée avec succès !', NULL);
INSERT INTO `internal_resources` VALUES ('PG_NEWERINSTALLE', 'FR', 'Il y a une version plus récente de cette extension installée !', NULL);
INSERT INTO `internal_resources` VALUES ('PG_TITLE', 'FR', 'Extensions', NULL);
INSERT INTO `internal_resources` VALUES ('PG_UNINSTALL', 'FR', 'Désinstaller une extension', NULL);
INSERT INTO `internal_resources` VALUES ('PG_UNINSTALLDELE', 'FR', 'Désinstaller un module, <br> supprimer les contenus correspondants.', NULL);
INSERT INTO `internal_resources` VALUES ('PG_UNINSTALLMES', 'FR', 'Vous êtes sur le point de désinstaller un module.<b>La désinstallation d\'un module ne supprime pas seulement le type de contenu mais aussi chaque objet unique de ce type stocké dans la base de données. La désinstallation supprimera définitivement toutes les données de ce module ! ', NULL);
INSERT INTO `internal_resources` VALUES ('PG_UPGRADED', 'FR', 'L\'extension a été mise à jour avec succès !', NULL);
INSERT INTO `internal_resources` VALUES ('PGNTXT_SMA', 'FR', 'Enregistrer tous les textes modifiés sur cette page', NULL);
INSERT INTO `internal_resources` VALUES ('PI', 'FR', 'Pages demandées', NULL);
INSERT INTO `internal_resources` VALUES ('PI_OVERVIEW', 'FR', 'Vue d\'ensemble des pages demandées', NULL);
INSERT INTO `internal_resources` VALUES ('PO_BROWSER', 'FR', 'Navigateur de portail', NULL);
INSERT INTO `internal_resources` VALUES ('PO_CRSUCCEEDED', 'FR', 'La création d\'un nouveau portail a abouti !', NULL);
INSERT INTO `internal_resources` VALUES ('PO_EDIT', 'FR', 'Modifier la page du portail', NULL);
INSERT INTO `internal_resources` VALUES ('PO_MYPORTAL', 'FR', 'Mes portails', NULL);
INSERT INTO `internal_resources` VALUES ('PO_OWNER', 'FR', 'Propriétaire de la page', NULL);
INSERT INTO `internal_resources` VALUES ('POS_IN_MENU', 'FR', 'Position dans le plan du site', NULL);
INSERT INTO `internal_resources` VALUES ('POSITION', 'FR', 'Position', NULL);
INSERT INTO `internal_resources` VALUES ('PREDEF_TIME', 'FR', 'Fuseau horaire prédéfini', NULL);
INSERT INTO `internal_resources` VALUES ('PREV_AVAIL', 'FR', 'Vous avez sélectionné un objet. Une prévisualisation sera disponible après enregistrement.', NULL);
INSERT INTO `internal_resources` VALUES ('PREVIEW', 'FR', 'Prévisualisation', NULL);
INSERT INTO `internal_resources` VALUES ('PRINT', 'FR', 'Imprimer', NULL);
INSERT INTO `internal_resources` VALUES ('PROCERROR', 'FR', 'Une erreur s\'est produite pendant le traitement du formulaire. Regardez les champs marqués et lisez les commentaires pour plus d\'information.', NULL);
INSERT INTO `internal_resources` VALUES ('PROMPTDELETE', 'FR', 'Voulez-vous vraiment supprimer ce jeu de données ? Cette action ne peut pas être annulée !', NULL);
INSERT INTO `internal_resources` VALUES ('PROPERTIES', 'FR', 'Propriétés', NULL);
INSERT INTO `internal_resources` VALUES ('PTEMPL', 'FR', 'Modèle de page', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE', 'FR', 'Nettoyer la base de données', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_CLT', 'FR', 'Nettoyer les modèles de clusters', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_CLUSTER', 'FR', 'Nettoyer le cluster', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_CONTENT', 'FR', 'Nettoyer le contenu', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_EXPIRED', 'FR', 'Nettoyer les pages expirées', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_FOLDER', 'FR', 'Nettoyer les dossiers', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_MES', 'FR', 'Sélectionnez les parties de la base de données que vous voulez nettoyer.', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_META', 'FR', 'Nettoyer les méta-données', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_PAGES', 'FR', 'Nettoyer les pages du site et les maîtres', NULL);
INSERT INTO `internal_resources` VALUES ('PURGE_VAR', 'FR', 'Nettoyer les variations', NULL);
INSERT INTO `internal_resources` VALUES ('PWDNOTMATCH', 'FR', 'Les mots de passe entrés ne correspondent pas !', NULL);
INSERT INTO `internal_resources` VALUES ('PWDTOOSHORT', 'FR', 'Le mot de passe doit être d\'au moins 6 caractères !', NULL);
INSERT INTO `internal_resources` VALUES ('R_DELETEFOLDER', 'FR', 'Supprimer le dossier', NULL);
INSERT INTO `internal_resources` VALUES ('R_DELFOLDER', 'FR', 'Supprimer le dossier et tous les objets enfants', NULL);
INSERT INTO `internal_resources` VALUES ('R_DELFOLDERMES', 'FR', 'Vous êtes sur le point de supprimer un dossier. Sélectionnez une action.', NULL);
INSERT INTO `internal_resources` VALUES ('R_EDITFOLDER', 'FR', 'Modifier les propriétés du dossier', NULL);
INSERT INTO `internal_resources` VALUES ('R_FOLDERNAME', 'FR', 'Nom du dossier', NULL);
INSERT INTO `internal_resources` VALUES ('R_FOLDERNOTEMPTY', 'FR', 'Le dossier n\'est pas vide. Vous ne pouvez donc pas le supprimer ! Vérifier tous les objets et tous les clusters !', NULL);
INSERT INTO `internal_resources` VALUES ('R_HOME', 'FR', 'Démarrer', NULL);
INSERT INTO `internal_resources` VALUES ('R_MOVEOBJECTS', 'FR', 'Déplacer tous les objets vers le nœud parent', NULL);
INSERT INTO `internal_resources` VALUES ('R_NEWFOLDER', 'FR', 'Nouveau dossier', NULL);
INSERT INTO `internal_resources` VALUES ('R_PARENT', 'FR', 'Dossier parent', NULL);
INSERT INTO `internal_resources` VALUES ('RANDOM', 'FR', 'Aléatoire', NULL);
INSERT INTO `internal_resources` VALUES ('RANK', 'FR', 'Rang', NULL);
INSERT INTO `internal_resources` VALUES ('RATERES', 'FR', 'Résultats des taux', NULL);
INSERT INTO `internal_resources` VALUES ('RB_CACHE', 'FR', 'Reconstruire le cache', NULL);
INSERT INTO `internal_resources` VALUES ('READY_TO_USE', 'FR', 'Prêt à l\'utilisation.', NULL);
INSERT INTO `internal_resources` VALUES ('REFERER', 'FR', 'Référent', NULL);
INSERT INTO `internal_resources` VALUES ('REMAIN_POS', 'FR', 'Ne pas changer la position', NULL);
INSERT INTO `internal_resources` VALUES ('RESET', 'FR', 'Remettre à zéro le formulaire', NULL);
INSERT INTO `internal_resources` VALUES ('RESET_FORM', 'FR', 'Remettre à zéro le formulaire', NULL);
INSERT INTO `internal_resources` VALUES ('RESET_LOGS', 'FR', 'Remettre à zéro les logs', NULL);
INSERT INTO `internal_resources` VALUES ('RET_VIS', 'FR', 'Visiteurs de renvoi', NULL);
INSERT INTO `internal_resources` VALUES ('RL_PERM', 'FR', 'Permissions des rôles', NULL);
INSERT INTO `internal_resources` VALUES ('ROLE_DESCRIPTION', 'FR', 'Description', NULL);
INSERT INTO `internal_resources` VALUES ('ROLE_FILTERMENU', 'FR', 'Administration des rôles', NULL);
INSERT INTO `internal_resources` VALUES ('ROLE_GENERAL', 'FR', 'Modifier les données générales du rôle', NULL);
INSERT INTO `internal_resources` VALUES ('ROLE_HEAD', 'FR', 'Profil du rôle', NULL);
INSERT INTO `internal_resources` VALUES ('ROLE_LINK', 'FR', 'Profils du rôle', NULL);
INSERT INTO `internal_resources` VALUES ('ROLE_NAME', 'FR', 'Nom du rôle', NULL);
INSERT INTO `internal_resources` VALUES ('ROLE_PERMISSION', 'FR', 'Modifier les permissions du rôle', NULL);
INSERT INTO `internal_resources` VALUES ('SAVE', 'FR', 'Enregistrer', NULL);
INSERT INTO `internal_resources` VALUES ('SAVE_BACK', 'FR', 'Enregistrer et revenir', NULL);
INSERT INTO `internal_resources` VALUES ('SAVEERROR', 'FR', 'Une erreur s\'est produite pendant l\'enregistrement des données dans la base de données. Vérifiez que la base de données est connectée ou appelez votre administrateur.', NULL);
INSERT INTO `internal_resources` VALUES ('SAVESUCCESS', 'FR', 'Les données ont été écrites dans la base de données avec succès.', NULL);
INSERT INTO `internal_resources` VALUES ('SEARCH', 'FR', 'Démarrer la recherche', NULL);
INSERT INTO `internal_resources` VALUES ('SEARCH_CLEAR', 'FR', 'Remettre à zéro le filtre', NULL);
INSERT INTO `internal_resources` VALUES ('SEARCH_EXPIRED_ARTICLES', 'FR', 'Articles expirés', NULL);
INSERT INTO `internal_resources` VALUES ('SEARCH_LIVE_ACRTICLES', 'FR', 'Articles en cours', NULL);
INSERT INTO `internal_resources` VALUES ('SEARCHIN', 'FR', 'Rechercher', NULL);
INSERT INTO `internal_resources` VALUES ('SEARCHRESULTS', 'FR', 'Résultat de la recherche, veuillez faire votre choix', NULL);
INSERT INTO `internal_resources` VALUES ('SEASRCH_MISSING_VARIATIONS', 'FR', 'Variations manquantes', NULL);
INSERT INTO `internal_resources` VALUES ('SEL_ARTICLE', 'FR', 'Sélectionner un article', NULL);
INSERT INTO `internal_resources` VALUES ('SEL_CH', 'FR', 'Sélectionner un canal', NULL);
INSERT INTO `internal_resources` VALUES ('SEL_CHANNEL_CAT', 'FR', 'Sélectionner un canal et une catégorie', NULL);
INSERT INTO `internal_resources` VALUES ('SEL_CLUSTER', 'FR', 'Sélectionner un cluster', NULL);
INSERT INTO `internal_resources` VALUES ('SEL_EVENT', 'FR', 'Sélectionner un événement ou un rendez-vous', NULL);
INSERT INTO `internal_resources` VALUES ('SEL_FILE', 'FR', 'Sélectionner un fichier', NULL);
INSERT INTO `internal_resources` VALUES ('SEL_MEM', 'FR', 'Sélectionner des membres', NULL);
INSERT INTO `internal_resources` VALUES ('SEL_PTML', 'FR', 'Sélectionner un modèle de page', NULL);
INSERT INTO `internal_resources` VALUES ('SEL_VAR', 'FR', 'Sélectionner une variation', NULL);
INSERT INTO `internal_resources` VALUES ('SELECT', 'FR', 'Sélectionner', NULL);
INSERT INTO `internal_resources` VALUES ('SELECT_CI', 'FR', 'Sélectionner une entrée de contenu', NULL);
INSERT INTO `internal_resources` VALUES ('SELECT_CL', 'FR', 'Sélectionner une instance de cluster', NULL);
INSERT INTO `internal_resources` VALUES ('SELECT_VARIATION', 'FR', 'Sélectionner une variation', NULL);
INSERT INTO `internal_resources` VALUES ('SELECTEDINSTANCE', 'FR', 'Instance de cluster sélectionnée', NULL);
INSERT INTO `internal_resources` VALUES ('SELECTEDOBJECT', 'FR', 'Entrée de contenu actuellement sélectionnée', NULL);
INSERT INTO `internal_resources` VALUES ('SELECTOBJECT', 'FR', 'Sélectionnez une classe et spécifiez une position et un nom pour créer un nouvel objet.<br>Pour la position, utilisez 0 pour l\'insérer au début, 999 pour l\'insérer à la fin ou n\'importe quel autre position de votre choix.', NULL);
INSERT INTO `internal_resources` VALUES ('SELECTONE', 'FR', 'Vous devez faire un choix ici !', NULL);
INSERT INTO `internal_resources` VALUES ('SELMULTIPLE', 'FR', 'Maintenez la touche CTRL enfoncée pour sélectionner plusieurs entrées.', NULL);
INSERT INTO `internal_resources` VALUES ('SET', 'FR', 'Définir', NULL);
INSERT INTO `internal_resources` VALUES ('SHORTEST_PATHS', 'FR', 'Chemins les plus courts', NULL);
INSERT INTO `internal_resources` VALUES ('SHOW', 'FR', 'Montrer', NULL);
INSERT INTO `internal_resources` VALUES ('SHOW_ADVANCED_SEARCH', 'FR', 'Afficher les options de recherche avancées', NULL);
INSERT INTO `internal_resources` VALUES ('SHOW_ALL', 'FR', 'Tout montrer', NULL);
INSERT INTO `internal_resources` VALUES ('SHOW_PAGEWISE', 'FR', 'Montrer la mise en page', NULL);
INSERT INTO `internal_resources` VALUES ('SMA_EXT_EDIT', 'FR', 'Ouvrir une fenêtre d\'édition. Enregistrer d\'abord tous les textes édités avant !', NULL);
INSERT INTO `internal_resources` VALUES ('SP_BROWSE', 'FR', 'Plan du site', NULL);
INSERT INTO `internal_resources` VALUES ('SP_CLNEW', 'FR', 'Créer une nouvelle instance de cluster', NULL);
INSERT INTO `internal_resources` VALUES ('SP_CONFDESC', 'FR', 'Vous pouvez lier cette page du site à une instance existante du cluster ou créer une nouvelle instance. Décidez ce que vous souhaitez faire.', NULL);
INSERT INTO `internal_resources` VALUES ('SP_CONFIGURE', 'FR', 'Configurer la page', NULL);
INSERT INTO `internal_resources` VALUES ('SP_DELETE', 'FR', 'Supprimer une page du site', NULL);
INSERT INTO `internal_resources` VALUES ('SP_DELMES', 'FR', 'Vous êtes sur le point de supprimer une page du site. Notez que toutes les instances vivantes de cette page seront également supprimées !', NULL);
INSERT INTO `internal_resources` VALUES ('SP_EDIT', 'FR', 'Modifier une page du site', NULL);
INSERT INTO `internal_resources` VALUES ('SP_EXPIRE', 'FR', 'Expirer la page', NULL);
INSERT INTO `internal_resources` VALUES ('SP_EXPIREDATE', 'FR', 'Expiré depuis', NULL);
INSERT INTO `internal_resources` VALUES ('SP_IPROPERTIES', 'FR', 'Propriétés de la page', NULL);
INSERT INTO `internal_resources` VALUES ('SP_LAUNCH', 'FR', 'Lancer la page', NULL);
INSERT INTO `internal_resources` VALUES ('SP_LAUNCHDATE', 'FR', 'Actif depuis', NULL);
INSERT INTO `internal_resources` VALUES ('SP_LAUNCHDATES', 'FR', 'Configuration du temps de vie', NULL);
INSERT INTO `internal_resources` VALUES ('SP_LINK', 'FR', 'Lien vers une instance de cluster existante', NULL);
INSERT INTO `internal_resources` VALUES ('SP_MENUDIRECT', 'FR', 'URL directe sur le serveur en ligne', NULL);
INSERT INTO `internal_resources` VALUES ('SP_MENUDIRECTTIT', 'FR', 'Définir le chemin optionnel sur le serveur pour un accès direct', NULL);
INSERT INTO `internal_resources` VALUES ('SP_MENUDIRECTTITLE', 'FR', 'Définir le chemin optionnel sur le serveur pour un accès direct', NULL);
INSERT INTO `internal_resources` VALUES ('SP_MENUHELP', 'FR', 'Texte d\'aide pour le menu', NULL);
INSERT INTO `internal_resources` VALUES ('SP_MENUNAME', 'FR', 'Nom dans le menu', NULL);
INSERT INTO `internal_resources` VALUES ('SP_MENUPROPS', 'FR', 'Nom du menu et texte d\'aide', NULL);
INSERT INTO `internal_resources` VALUES ('SP_NEWINSTANCE', 'FR', 'Ajouter une page', NULL);
INSERT INTO `internal_resources` VALUES ('SP_NEWPAGE', 'FR', 'Ajouter une page', NULL);
INSERT INTO `internal_resources` VALUES ('SP_PDELETE', 'FR', 'Supprimer une page', NULL);
INSERT INTO `internal_resources` VALUES ('SP_PDELMES', 'FR', 'Vous êtes sur le point de supprimer une page. Notez que toutes les instances vivantes de cette page seront également supprimées !', NULL);
INSERT INTO `internal_resources` VALUES ('SP_PREVIEW', 'FR', 'Prévisualisation de la page', NULL);
INSERT INTO `internal_resources` VALUES ('SP_PROPERTIES', 'FR', 'Propriétés de la page', NULL);
INSERT INTO `internal_resources` VALUES ('SP_RLTREE', 'FR', 'Rafraîchir l\'arborescence', NULL);
INSERT INTO `internal_resources` VALUES ('SPM', 'FR', 'Page de site maître', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_CLUSTER', 'FR', 'Modèle de cluster', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_EDIT', 'FR', 'Modifier la page de site maître', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_LAUCH_SUCCESS', 'FR', 'Les pages définies sur le maître ont été relancées avec succès.<br>', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_META', 'FR', 'Modèle de méta-clé', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_PATH', 'FR', 'Chemin du modèle', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_RLAUNCH', 'FR', 'Rafraîchir les instances', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_SELECTTHUMB', 'FR', 'Sélectionner une vignette', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_THUMBNAIL', 'FR', 'Vignette', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_TYPE', 'FR', 'Type de page', NULL);
INSERT INTO `internal_resources` VALUES ('SPM_VARIATIONS', 'FR', 'Variations affichables', NULL);
INSERT INTO `internal_resources` VALUES ('SR_SELECTCI', 'FR', 'Vous pouvez chercher n\'importe quelle entrée de contenu ici. Si vous voulez sélectionner une entrée de contenu, choisissez-la et appuyez sur le bouton Mettre à jour. Si vous voulez relier un nouveau contenu à ce champ, créez d\'abord le contenu dans le navigateur d\'objet. ', NULL);
INSERT INTO `internal_resources` VALUES ('SR_SELECTCLI', 'FR', 'Sélectionnez un modèle de cluster. Ensuite, vous pourrez sélectionner une instance de ce modèle pour l\'utiliser.', NULL);
INSERT INTO `internal_resources` VALUES ('START_BAK', 'FR', 'Démarrer la sauvegarde', NULL);
INSERT INTO `internal_resources` VALUES ('STARTDATE', 'FR', 'Date de démarrage', NULL);
INSERT INTO `internal_resources` VALUES ('STARTTIME', 'FR', 'Heure de démarrage', NULL);
INSERT INTO `internal_resources` VALUES ('STATS', 'FR', 'Statistiques', NULL);
INSERT INTO `internal_resources` VALUES ('STATS_HEADER', 'FR', 'Statistiques de trafic N/X 2004', NULL);
INSERT INTO `internal_resources` VALUES ('STATUS', 'FR', 'Etat :', NULL);
INSERT INTO `internal_resources` VALUES ('STEP', 'FR', 'Etape', NULL);
INSERT INTO `internal_resources` VALUES ('STNAME', 'FR', 'Sélectionner un nom pour identifier cette page dans le plan du site', NULL);
INSERT INTO `internal_resources` VALUES ('SYNC_CLUSTERS', 'FR', 'Synchroniser les clusters', NULL);
INSERT INTO `internal_resources` VALUES ('SYNC_CLUSTERS_DESCR', 'FR', 'Quand vous modifiez un modèle de cluster, les clusters ne sont pas automatiquement synchronisés. Ils sont synchronisés quand vous travaillez avec la fois suivante. Vous pouvez tous les synchroniser.', NULL);
INSERT INTO `internal_resources` VALUES ('TEMPLATE', 'FR', 'Modèle', NULL);
INSERT INTO `internal_resources` VALUES ('TESTS', 'FR', 'Tests unitaires N/X', NULL);
INSERT INTO `internal_resources` VALUES ('TF', 'FR', 'Fuseau horaire', NULL);
INSERT INTO `internal_resources` VALUES ('THISMONTH', 'FR', 'Ce mois-ci', NULL);
INSERT INTO `internal_resources` VALUES ('THISWEEK', 'FR', 'Cette semaine', NULL);
INSERT INTO `internal_resources` VALUES ('THISYEAR', 'FR', 'Cette année', NULL);
INSERT INTO `internal_resources` VALUES ('TIME_BETW_VISITS', 'FR', 'Moyenne de temps entre les visites', NULL);
INSERT INTO `internal_resources` VALUES ('TIPP_TEMPLATE_1', 'FR', 'Les modèles sont à la base du fonctionnement de N/X. Vous aurez besoin de créer un modèle de cluster en premier qui définira la structure et le type de contenu. Par la suite, vous pourrez créer les modèles de pages ici en fusionnant un modèle de cluster et un fichier PHP.<br><br>', NULL);
INSERT INTO `internal_resources` VALUES ('TITLE', 'FR', 'Titre', NULL);
INSERT INTO `internal_resources` VALUES ('TMPL_NAME', 'FR', 'Sélectionner un modèle', NULL);
INSERT INTO `internal_resources` VALUES ('TODAY', 'FR', 'Aujourd\'hui', NULL);
INSERT INTO `internal_resources` VALUES ('TOP', 'FR', 'Principales données', NULL);
INSERT INTO `internal_resources` VALUES ('TOP_BROWSER', 'FR', 'Principaux navigateurs', NULL);
INSERT INTO `internal_resources` VALUES ('TOP_ENTRYPAGES', 'FR', 'Principales pages d\'entrées', NULL);
INSERT INTO `internal_resources` VALUES ('TOP_EXITPAGES', 'FR', 'Principales pages de sortie', NULL);
INSERT INTO `internal_resources` VALUES ('TOP_EXITT', 'FR', 'Principales cibles de sortie', NULL);
INSERT INTO `internal_resources` VALUES ('TOP_HOSTS', 'FR', 'Principaux hébergeurs', NULL);
INSERT INTO `internal_resources` VALUES ('TOP_OS', 'FR', 'Principaux systèmes d\'exploitation', NULL);
INSERT INTO `internal_resources` VALUES ('TOP_PAGES', 'FR', 'Principales pages', NULL);
INSERT INTO `internal_resources` VALUES ('TOP_PATHS', 'FR', 'Principaux chemins', NULL);
INSERT INTO `internal_resources` VALUES ('TOP_REFERER', 'FR', 'Principaux référents', NULL);
INSERT INTO `internal_resources` VALUES ('TOP_SI', 'FR', 'Principaux moteurs de recherche', NULL);
INSERT INTO `internal_resources` VALUES ('TOP_SKW', 'FR', 'Principaux mots-clés de recherche', NULL);
INSERT INTO `internal_resources` VALUES ('TOTAL', 'FR', 'Total', NULL);
INSERT INTO `internal_resources` VALUES ('TRANS_TEMPL', 'FR', 'Traduit depuis', NULL);
INSERT INTO `internal_resources` VALUES ('TRANS_THIS', 'FR', 'Traduire ceci :', NULL);
INSERT INTO `internal_resources` VALUES ('TRANSLATION', 'FR', 'Système de traduction N/X', NULL);
INSERT INTO `internal_resources` VALUES ('TT_REFRESH', 'FR', 'Rafraîchir les instances met à jour les pages en cache dont le modèle a été modifié.', NULL);
INSERT INTO `internal_resources` VALUES ('TT_RSTCI', 'FR', 'Dans N/X, chaque page a un cluster. En appuyant sur Redéfinir l\'instance du cluster, vous pouvez assigner un nouveau cluster à la page et supprimer l\'ancien.', NULL);
INSERT INTO `internal_resources` VALUES ('TYPE', 'FR', 'Type', NULL);
INSERT INTO `internal_resources` VALUES ('UNIQUE', 'FR', 'Ce champ doit être unique !', NULL);
INSERT INTO `internal_resources` VALUES ('UP', 'FR', 'Haut', NULL);
INSERT INTO `internal_resources` VALUES ('UP_INTRO', 'FR', 'Sélectionnez le groupe et ses rôles à affecter à l\'utilisateur.', NULL);
INSERT INTO `internal_resources` VALUES ('UPL_TEXT', 'FR', 'Charger un fichier texte', NULL);
INSERT INTO `internal_resources` VALUES ('USAGE', 'FR', 'Utilisation', NULL);
INSERT INTO `internal_resources` VALUES ('USER_ACTIVE', 'FR', 'Compte activé', NULL);
INSERT INTO `internal_resources` VALUES ('USER_AGENT', 'FR', 'Utiliser l\'agent', NULL);
INSERT INTO `internal_resources` VALUES ('USER_BL', 'FR', 'Langage de l\'interface', NULL);
INSERT INTO `internal_resources` VALUES ('USER_EMAIL', 'FR', 'E-mail', NULL);
INSERT INTO `internal_resources` VALUES ('USER_FILTERMENU', 'FR', 'Administration des utilisateurs', NULL);
INSERT INTO `internal_resources` VALUES ('USER_GENERAL', 'FR', 'Modifier les données générales de l\'utilisateur', NULL);
INSERT INTO `internal_resources` VALUES ('USER_HEAD', 'FR', 'Profil de l\'utilisateur', NULL);
INSERT INTO `internal_resources` VALUES ('USER_JS', 'FR', 'Utiliser le Javascript', NULL);
INSERT INTO `internal_resources` VALUES ('USER_LINK', 'FR', 'Profils des utilisateurs', NULL);
INSERT INTO `internal_resources` VALUES ('USER_NAME', 'FR', 'Nom de l\'utilisateur', NULL);
INSERT INTO `internal_resources` VALUES ('USER_PERMGRID', 'FR', 'Grille de permissions', NULL);
INSERT INTO `internal_resources` VALUES ('USER_PERMISSION', 'FR', 'Modifier les permissions de l\'utilisateur', NULL);
INSERT INTO `internal_resources` VALUES ('USER_PERMISSIONS', 'FR', 'Permissions de l\'utilisateur', NULL);
INSERT INTO `internal_resources` VALUES ('USER_PROFILE', 'FR', 'Mon profil', NULL);
INSERT INTO `internal_resources` VALUES ('USER_SETPERM', 'FR', 'Définir les permissions de l\'utilisateur ci-dessous. Pour enlever un utilisateur d\'un groupe, retirez tous les groupes depuis celui-ci.', NULL);
INSERT INTO `internal_resources` VALUES ('USER_TO_GROUP', 'FR', 'Ajouter un utilisateur au groupe', NULL);
INSERT INTO `internal_resources` VALUES ('USERPERM_HEAD', 'FR', 'Modifier les permissions de l\'utilisateur', NULL);
INSERT INTO `internal_resources` VALUES ('V_EDIT', 'FR', 'Modifier les variations', NULL);
INSERT INTO `internal_resources` VALUES ('V_NAME', 'FR', 'Nom', NULL);
INSERT INTO `internal_resources` VALUES ('V_SHORT', 'FR', 'Balise courte', NULL);
INSERT INTO `internal_resources` VALUES ('VAR_SUCCEEDED', 'FR', 'réussi !', NULL);
INSERT INTO `internal_resources` VALUES ('VARIATIONS', 'FR', 'Variations disponibles', NULL);
INSERT INTO `internal_resources` VALUES ('VIS_FIRST', 'FR', 'Visiteurs pour la première fois', NULL);
INSERT INTO `internal_resources` VALUES ('VIS_ONL', 'FR', 'Visiteurs en ligne', NULL);
INSERT INTO `internal_resources` VALUES ('VIS_PER_VIS', 'FR', 'Moyenne des visites par visiteur', NULL);
INSERT INTO `internal_resources` VALUES ('VIS_RET', 'FR', 'Visiteurs périodiques', NULL);
INSERT INTO `internal_resources` VALUES ('VISITORS', 'FR', 'Visiteurs', NULL);
INSERT INTO `internal_resources` VALUES ('VISITS', 'FR', 'Visites', NULL);
INSERT INTO `internal_resources` VALUES ('VISITS_OVERVIEW', 'FR', 'Vue d\'ensemble des visites', NULL);
INSERT INTO `internal_resources` VALUES ('WEBSITE', 'FR', 'Site Web', NULL);
INSERT INTO `internal_resources` VALUES ('WEEKDAY', 'FR', 'Jours de la semaine', NULL);
INSERT INTO `internal_resources` VALUES ('WEEKDAY_AS', 'FR', 'Analyse des jours de la semaine', NULL);
INSERT INTO `internal_resources` VALUES ('WHEN', 'FR', 'Quand', NULL);
INSERT INTO `internal_resources` VALUES ('WRONGDATE', 'FR', 'La date saisie n\'existe pas !', NULL);
INSERT INTO `internal_resources` VALUES ('WZ_ARTICLEIMPORT', 'FR', 'Assistant d\'importation d\'articles', NULL);
INSERT INTO `internal_resources` VALUES ('WZ_ARTICLEIMPORT_TITLE', 'FR', 'Cet assistant est utilisé pour importer des données d\'articles depuis différentes sources vers un canal. Vous pouvez importer depuis des multiples existantes ou d\'autres canaux. Vous devez vous assurer que les modèles correspondants sont compatibles. ', NULL);
INSERT INTO `internal_resources` VALUES ('WZ_EXPORT_TITLE', 'FR', 'Cet assistant est utilisé pour échanger des clusters, des modèles de clusters et des modèles de pages entre votre installation N/X et d\'autres installations. L\'assistant produit un fichier XML que vous pouvez stocker sur votre disque dur local et échanger avec d\'autres utilisateurs de N/X.', NULL);
INSERT INTO `internal_resources` VALUES ('WZ_IMPORT_TITLE', 'FR', 'Cet assistant est utilisé pour importer vers N/X des données qui ont été préalablement exportées avec une autre installation de N/X. Vous devez supprimer une ressource avant de l\'importer une deuxième fois.', NULL);
INSERT INTO `internal_resources` VALUES ('WZE_ARTICLEIMPORT_SRCTYPE', 'FR', 'Sélectionnez depuis quel type de source vous voulez importer les articles.', NULL);
INSERT INTO `internal_resources` VALUES ('WZE_ARTICLEIMPORT_TARGET', 'FR', 'A droite, vous devez choisir le canal cible. Tous les articles importés seront stockés dans ce canal.', NULL);
INSERT INTO `internal_resources` VALUES ('WZE_EXPORT_TYPE', 'FR', 'A droite, vous devez choisir le type de données que vous voulez exporter. Les clusters stockent le contenu. Quand vous exportez des clusters, les modèles sont également automatiquement exportés. Les modèles de clusters définissent la structure pour créer des clusters. Des modèles de pages définissent la mise en page que les clusters vont utiliser en fonction de leur contenu.', NULL);
INSERT INTO `internal_resources` VALUES ('WZE_IMPORT_FILE', 'FR', 'Choisissez un fichier N/X-XML sur votre disque pour le charger dans le système.<br./><br./>Le système le contrôlera et montrera l\'information d\'état sur la prochaine page.', NULL);
INSERT INTO `internal_resources` VALUES ('WZE_IMPORT_VAL', 'FR', 'Le système a vérifié l\'exactitude du fichier XML chargé. Lisez le rapport à gauche pour plus de détails.', NULL);
INSERT INTO `internal_resources` VALUES ('WZE_IMPORTING', 'FR', 'Le système a tenté d\'importer les données. Lisez l\'état à droite.', NULL);
INSERT INTO `internal_resources` VALUES ('WZT_ARTICLEIMPORT_SRCTYPE', 'FR', 'Sélectionner le type de source', NULL);
INSERT INTO `internal_resources` VALUES ('WZT_ARTICLEIMPORT_TARGET', 'FR', 'Sélectionner le canal cible', NULL);
INSERT INTO `internal_resources` VALUES ('WZT_DESCR', 'FR', 'Ajouter une description', NULL);
INSERT INTO `internal_resources` VALUES ('WZT_DESCR_EXPL', 'FR', 'Vous devriez ajouter une courte description aux données exportées.</br.></br.>Celui qui importera les données comprendra plus facilement ce qu\'il a exporté.', NULL);
INSERT INTO `internal_resources` VALUES ('WZT_EXPORT_TYPE', 'FR', 'Sélectionner un type à exporter', NULL);
INSERT INTO `internal_resources` VALUES ('WZT_IMPORT_FILE', 'FR', 'Sélectionner un fichier N/X-XML ', NULL);
INSERT INTO `internal_resources` VALUES ('WZT_IMPORT_VAL', 'FR', 'Sommaire du XML chargé', NULL);
INSERT INTO `internal_resources` VALUES ('WZT_IMPORTING', 'FR', 'Données en cours d\'importation', NULL);
INSERT INTO `internal_resources` VALUES ('WZT_KEEPCLUSTER', 'FR', 'Garder les clusters existants ?', NULL);
INSERT INTO `internal_resources` VALUES ('WZT_KEEPCLUSTER_EXPL', 'FR', 'Vous pouvez indiquer si vous voulez garder les clusters existants ou créer des copies de chaque cluster.<br.><br.>Garder à l\'esprit que si vous gardez les clusters originaux vous les partagez avec la source originale.', NULL);
INSERT INTO `internal_resources` VALUES ('WZT_SEL_EXP_RES', 'FR', 'Sélectionner une ressource à exporter', NULL);
INSERT INTO `internal_resources` VALUES ('YES', 'FR', 'Oui', NULL);
INSERT INTO `internal_resources` VALUES ('YESTERDAY', 'FR', 'Hier', NULL);
INSERT INTO `internal_resources` VALUES ('M_ARTICLES', 'FR', 'Articles', '');
INSERT INTO `internal_resources` VALUES ('CL_GROUP', 'FR', 'Cluster Group', '');
INSERT INTO `internal_resources` VALUES ('PAGE_ID', 'FR', 'Page ID', '');
INSERT INTO `internal_resources` VALUES ('PROC_DATA', 'FR', 'Processing Data...', '');
INSERT INTO `internal_resources` VALUES ('MAINT_WWWDEV', 'EN', 'Dev Website Maintenance', '');
INSERT INTO `internal_resources` VALUES ('BB_IN_MM_MODE', 'EN', 'The backend is in maintenance at the moment. Only the Administrator can log in!', '');
INSERT INTO `internal_resources` VALUES ('POPUP_MENU', 'EN', 'Popup window', '');
INSERT INTO `internal_resources` VALUES ('PAR_PAGE', 'EN', 'Parent Page', '');
INSERT INTO `internal_resources` VALUES ('IMP_IMAGES', 'EN', 'Import images', '');
INSERT INTO `internal_resources` VALUES ('SEL_IMP_FOLDER', 'EN', 'Select import folder', '');
INSERT INTO `internal_resources` VALUES ('IMP_IMPAGES', 'EN', 'Import Images', '');
INSERT INTO `internal_resources` VALUES ('WZ_IMPORT_IM_TITLE', 'EN', 'This wizard is used for importing importing images to N/X. Pack the images into a zip archive. The wizard will then create the data.', '');
INSERT INTO `internal_resources` VALUES ('WZT_ARCHIVE_FILE', 'EN', 'Select Archive', '');
INSERT INTO `internal_resources` VALUES ('WZE_ARCHIVE_FILE', 'EN', 'Please select the zip-archive you want to import. The images must be into that archive in a flat structure, having no folders.', '');
INSERT INTO `internal_resources` VALUES ('MUST_UPLOAD', 'EN', 'You must upload a file to proceed!', '');
INSERT INTO `internal_resources` VALUES ('ARCHERR', 'EN', 'The archive could not be properly imported. Check for php_zip extension!', '');
INSERT INTO `internal_resources` VALUES ('WZT_ACH_CHECK', 'EN', 'Check Archive', '');
INSERT INTO `internal_resources` VALUES ('NUMB_FILES', 'EN', 'Number of files found in archive: ', '');
INSERT INTO `internal_resources` VALUES ('WZE_ARCH_CHECK', 'EN', 'Please control the result of the archive checks and press next if you want to resume.', '');
INSERT INTO `internal_resources` VALUES ('WZT_DEST_FOLDER', 'EN', 'Select destination folder', '');
INSERT INTO `internal_resources` VALUES ('WZE_DEST_FOLDER', 'EN', 'Please select the folder, where all the new pictures will be copied to.', '');
INSERT INTO `internal_resources` VALUES ('DEST_FOLDER', 'EN', 'Destination folder', '');
INSERT INTO `internal_resources` VALUES ('NUM_FILES', 'EN', 'Number of files found in archive: ', '');
INSERT INTO `internal_resources` VALUES ('WZT_IMP_IMAG', 'EN', 'Importing images...', '');
INSERT INTO `internal_resources` VALUES ('NOFI', 'EN', 'Number of files imported:', '');
INSERT INTO `internal_resources` VALUES ('ACCESS_VIOLATION', 'EN', 'Access violation', '');
INSERT INTO `internal_resources` VALUES ('ACCESS_V_TEXT', 'EN', 'You have not rights to access this object!', '');
INSERT INTO `internal_resources` VALUES ('CLEAR_JPCACHE', 'EN', 'Clear Cache', '');
INSERT INTO `internal_resources` VALUES ('WAS_DELETED', 'EN', 'The referenced object was deleted from library!', '');

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `internal_resources_languages`
#

DROP TABLE IF EXISTS `internal_resources_languages`;
CREATE TABLE `internal_resources_languages` (
  `LANGID` char(3) NOT NULL default '',
  `NAME` varchar(32) NOT NULL default '',
  `AGENT_LANGID` varchar(10) NOT NULL default '',
  `AGENT_CLASSID` varchar(36) NOT NULL default '',
  `AGENT_VERSION` varchar(7) NOT NULL default '',
  PRIMARY KEY  (`LANGID`),
  UNIQUE KEY `NAME` (`NAME`)
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `internal_resources_languages`
#

INSERT INTO `internal_resources_languages` VALUES ('EN', 'English', '0x0409', 'B8F2846E-CE36-11D0-AC83-00C04FD97575', '6,0,0,0');
INSERT INTO `internal_resources_languages` VALUES ('DE', 'Deutsch', '0x0407', '1D87F5B5-05F1-11d2-AD7C-0000F8799342', '1,0,0,0');
INSERT INTO `internal_resources_languages` VALUES ('IT', 'Italian', '0x0410', '1D87F5B6-05F1-11d2-AD7C-0000F8799342', '1,0,0,0');
INSERT INTO `internal_resources_languages` VALUES ('MND', 'Chineese (Mandarin)', '', '', '');
INSERT INTO `internal_resources_languages` VALUES ('PL', 'Polish', '12', '32', '65');
INSERT INTO `internal_resources_languages` VALUES ('FR', 'French', '', '', '');

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `log`
#

DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `LOG_ID` bigint(20) NOT NULL default '0',
  `CATEGORY` varchar(16) NOT NULL default '',
  `MESSAGE` varchar(255) default NULL,
  `USER_ID` bigint(20) default NULL,
  `TARGET1_ID` bigint(20) default NULL,
  `TARGET2_ID` bigint(20) default NULL,
  `LOG_TIME` timestamp NOT NULL,
  KEY `LOG_TIME` (`LOG_TIME`),
  KEY `CATEGORY` (`CATEGORY`)
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `log`
#


# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `messaging`
#

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
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `messaging`
#


# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `meta`
#

DROP TABLE IF EXISTS `meta`;
CREATE TABLE `meta` (
  `MID` bigint(20) NOT NULL default '0',
  `MTI_ID` bigint(20) NOT NULL default '0',
  `CID` bigint(20) NOT NULL default '0',
  `VALUE` varchar(255) default NULL,
  `DELETED` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`MID`,`MTI_ID`)
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `meta`
#


# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `meta_datatypes`
#

DROP TABLE IF EXISTS `meta_datatypes`;
CREATE TABLE `meta_datatypes` (
  `MTYPE_ID` mediumint(9) NOT NULL default '0',
  `NAME` varchar(16) NOT NULL default '',
  `DESCRIPTION` varchar(255) default NULL,
  PRIMARY KEY  (`MTYPE_ID`),
  UNIQUE KEY `MTYPE_ID` (`MTYPE_ID`,`NAME`)
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `meta_datatypes`
#

INSERT INTO `meta_datatypes` VALUES (1, 'Text', 'Single Line Input with Maximum of 64 chars');
INSERT INTO `meta_datatypes` VALUES (2, 'Textarea', 'Four-Line Textarea with maximum of 255 chars of Input');
INSERT INTO `meta_datatypes` VALUES (3, 'Color', 'Special Inputfield for entering a color.');

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `meta_template_items`
#

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
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `meta_template_items`
#

INSERT INTO `meta_template_items` VALUES (100552, 100551, 'Description', 2, 2, 0);
INSERT INTO `meta_template_items` VALUES (100553, 100551, 'Keywords', 1, 2, 0);

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `meta_templates`
#

DROP TABLE IF EXISTS `meta_templates`;
CREATE TABLE `meta_templates` (
  `MT_ID` bigint(20) NOT NULL default '0',
  `NAME` varchar(32) NOT NULL default '',
  `DESCRIPTION` varchar(255) default NULL,
  `INTERNAL` tinyint(4) NOT NULL default '0',
  `VERSION` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`MT_ID`),
  UNIQUE KEY `MT_ID` (`MT_ID`,`NAME`)
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `meta_templates`
#

INSERT INTO `meta_templates` VALUES (2, '-', NULL, 0, 0);
INSERT INTO `meta_templates` VALUES (100020, '-', '', 0, 10);
INSERT INTO `meta_templates` VALUES (100551, 'Standard', '', 0, 0);
INSERT INTO `meta_templates` VALUES (100842, '-', '', 0, 10);
INSERT INTO `meta_templates` VALUES (101080, '-', '', 0, 10);

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `module_type`
#

DROP TABLE IF EXISTS `module_type`;
CREATE TABLE `module_type` (
  `MODULE_TYPE_ID` tinyint(4) NOT NULL default '0',
  `NAME` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`MODULE_TYPE_ID`),
  UNIQUE KEY `NAME` (`NAME`)
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `module_type`
#

INSERT INTO `module_type` VALUES (1, 'Contenttype Extension');
INSERT INTO `module_type` VALUES (2, 'System Extension');
INSERT INTO `module_type` VALUES (3, 'CDS Extension');
INSERT INTO `module_type` VALUES (4, 'Textfilter Extension');

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `modules`
#

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
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `modules`
#

INSERT INTO `modules` VALUES (100012, 'Image', 'Image. Allowed formats are GIF, JPEG and PNG.', 1, 100010, 'pgnImage', 'image/pgn_image.php', 1);
INSERT INTO `modules` VALUES (100018, 'Label', 'Text-Content with one line for input.', 1, 100016, 'pgnLabel', 'label/pgn_label.php', 1);
INSERT INTO `modules` VALUES (100024, 'Text', 'Text-Content with any length and format.', 2, 100022, 'pgnText', 'text/pgn_text.php', 1);
INSERT INTO `modules` VALUES (100048, 'Link', 'Link to pages', 1, 100047, 'pgnLink', 'link/pgn_link.php', 1);
INSERT INTO `modules` VALUES (100506, 'RSSReader', 'CDS-API-Extension for reading rss feeds', 1, 100505, 'pgnRSSReader', 'rssreader/pgn_rssreader.php', 3);
INSERT INTO `modules` VALUES (100510, 'RSSCreator', 'CDS-API-Extension for creating RSS-Feeds', 1, 100509, 'pgnRSSCreator', 'rsscreator/pgn_rsscreator.php', 3);
INSERT INTO `modules` VALUES (100663, 'CMS', 'CDS-API-Extension for creating, launching and editing Clusters.', 1, 100662, 'pgnCMS', 'cms/pgn_cms.php', 3);
INSERT INTO `modules` VALUES (100711, 'FAQ', 'CDS-API-Extension for realizing a FAQ', 1, 100710, 'pgnFAQ', 'faq/pgn_faq.php', 3);

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `pgn_config_store`
#

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
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `pgn_config_store`
#

INSERT INTO `pgn_config_store` VALUES (100002, 'h1', '#152B36', '#F4FEFD', 'Zrnic', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100111, 'h2', '#152b36', '#f4fefd', 'Zrnic', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 24, 200, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100123, 'h1', '#152b36', '#f4fefd', 'Zrnic', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100321, 'West', '#152b36', '#f4fefd', 'Zrnic', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100322, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100345, 'h1', '#152b36', '#f4fefd', 'Zrnic', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100455, 'h1', '#152b36', '#f4fefd', 'Zrnic', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100527, '400', '80', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100556, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100598, 'h1', '#152b36', '#f4fefd', 'Zrnic', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100733, 'h1', '#152b36', '#f4fefd', 'Zrnic', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100714, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100832, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100341, 'h2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100398, 'h3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100401, 'h3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100400, 'h3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100399, 'h3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
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

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `pgn_image`
#

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
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `pgn_image`
#

INSERT INTO `pgn_image` VALUES (100027, '100027.gif', '', 20, 1600, '');
INSERT INTO `pgn_image` VALUES (100028, '100028.png', 'Key Visual', 800, 140, '');
INSERT INTO `pgn_image` VALUES (100058, '100058.jpg', '', 427, 675, '');
INSERT INTO `pgn_image` VALUES (100110, '', '', 0, 0, '');
INSERT INTO `pgn_image` VALUES (100113, '100113.jpg', 'Graf Zeppelin', 427, 675, '');
INSERT INTO `pgn_image` VALUES (100230, '100230.gif', 'Our Can Openers', 133, 400, '');
INSERT INTO `pgn_image` VALUES (100237, '100237.gif', 'High Quality Whire Whisk', 318, 320, '');
INSERT INTO `pgn_image` VALUES (100244, '100244.jpg', 'Our quality scissors', 400, 300, '');
INSERT INTO `pgn_image` VALUES (100251, '100251.jpg', 'Our spoons and forks', 400, 300, '');
INSERT INTO `pgn_image` VALUES (100367, '100367.gif', 'Our Can Openers', 133, 400, '');
INSERT INTO `pgn_image` VALUES (100377, '100377.gif', 'High Quality Whire Whisk', 318, 320, '');
INSERT INTO `pgn_image` VALUES (100383, '100383.jpg', 'Our quality scissors', 400, 300, '');
INSERT INTO `pgn_image` VALUES (100389, '100389.jpg', 'Our spoons and forks', 400, 300, '');
INSERT INTO `pgn_image` VALUES (100447, '100447.gif', '', 20, 1600, '');
INSERT INTO `pgn_image` VALUES (100448, '100448.gif', '', 175, 100, '');
INSERT INTO `pgn_image` VALUES (100496, '', '', 0, 0, '');
INSERT INTO `pgn_image` VALUES (100595, '', '', 0, 0, '');
INSERT INTO `pgn_image` VALUES (100602, '100602.', '', 0, 0, '');
INSERT INTO `pgn_image` VALUES (100637, '', '', 0, 0, '');
INSERT INTO `pgn_image` VALUES (101163, '101163.jpg', 'Sven Weih', 152, 200, '');
INSERT INTO `pgn_image` VALUES (101300, '', '', 0, 0, '');
INSERT INTO `pgn_image` VALUES (101305, '', '', 0, 0, '');
INSERT INTO `pgn_image` VALUES (101380, '101380.jpg', 'Sven Weih', 152, 200, '');
INSERT INTO `pgn_image` VALUES (101388, '101388.jpg', 'Sven Weih', 152, 200, '');
INSERT INTO `pgn_image` VALUES (101392, '101392.', '', 0, 0, '');
INSERT INTO `pgn_image` VALUES (101394, '101394.jpg', 'Graf Zeppelin', 427, 675, '');
INSERT INTO `pgn_image` VALUES (101405, '101405.jpg', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (101414, '101414.jpg', 'Sven Weih', 152, 200, '');
INSERT INTO `pgn_image` VALUES (101419, '101419.jpg', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (101424, '101424.', '', 0, 0, '');
INSERT INTO `pgn_image` VALUES (101542, '', '', 0, 0, '');
INSERT INTO `pgn_image` VALUES (101548, '', '', 0, 0, '');
INSERT INTO `pgn_image` VALUES (101552, '101552.', '', 0, 0, '');
INSERT INTO `pgn_image` VALUES (113740, '', '', 0, 0, '');
INSERT INTO `pgn_image` VALUES (113743, '113743.', '', 0, 0, '');
INSERT INTO `pgn_image` VALUES (100005, '100005.gif', 'FH Gießen Friedberg', 167, 93, '');
INSERT INTO `pgn_image` VALUES (100022, '100022.jpg', 'Collage', 300, 50, '');
INSERT INTO `pgn_image` VALUES (100032, '100032.gif', '', 9, 9, '');
INSERT INTO `pgn_image` VALUES (100066, '100066.jpg', 'Willkommen', 363, 317, '');
INSERT INTO `pgn_image` VALUES (100095, '100095.gif', '', 400, 1, '');
INSERT INTO `pgn_image` VALUES (100097, '100097.gif', '', 10, 14, '');
INSERT INTO `pgn_image` VALUES (100181, '', '', 0, 0, '');
INSERT INTO `pgn_image` VALUES (100182, '', '', 0, 0, '');
INSERT INTO `pgn_image` VALUES (100183, '', '', 0, 0, '');
INSERT INTO `pgn_image` VALUES (100191, '', '', 0, 0, '');
INSERT INTO `pgn_image` VALUES (100192, '', '', 0, 0, '');
INSERT INTO `pgn_image` VALUES (100193, '', '', 0, 0, '');
INSERT INTO `pgn_image` VALUES (100201, '', '', 0, 0, '');
INSERT INTO `pgn_image` VALUES (100202, '', '', 0, 0, '');
INSERT INTO `pgn_image` VALUES (100203, '', '', 0, 0, '');
INSERT INTO `pgn_image` VALUES (100385, '100385.gif', 'FH Gießen Friedberg', 167, 93, '');
INSERT INTO `pgn_image` VALUES (100388, '100388.jpg', 'Collage', 300, 50, '');
INSERT INTO `pgn_image` VALUES (100393, '100393.png', 'Key Visual', 800, 140, '');
INSERT INTO `pgn_image` VALUES (100397, '100397.gif', '', 9, 9, '');
INSERT INTO `pgn_image` VALUES (100399, '100399.gif', '', 400, 1, '');
INSERT INTO `pgn_image` VALUES (100402, '100402.gif', '', 10, 14, '');
INSERT INTO `pgn_image` VALUES (100077, '100077.png', '', 100, 85, '');
INSERT INTO `pgn_image` VALUES (100078, '100078.png', '', 100, 85, '');
INSERT INTO `pgn_image` VALUES (100079, '100079.png', '', 100, 85, '');
INSERT INTO `pgn_image` VALUES (100080, '100080.png', '', 100, 85, '');
INSERT INTO `pgn_image` VALUES (100081, '100081.png', '', 100, 85, '');
INSERT INTO `pgn_image` VALUES (100082, '100082.png', '', 100, 85, '');
INSERT INTO `pgn_image` VALUES (100083, '100083.png', '', 100, 85, '');
INSERT INTO `pgn_image` VALUES (100084, '100084.png', '', 100, 85, '');
INSERT INTO `pgn_image` VALUES (100085, '100085.jpg', '', 400, 60, '');
INSERT INTO `pgn_image` VALUES (100086, '100086.gif', '', 120, 60, '');
INSERT INTO `pgn_image` VALUES (100087, '100087.gif', '', 55, 18, '');
INSERT INTO `pgn_image` VALUES (100099, '100099.png', '', 100, 85, '');
INSERT INTO `pgn_image` VALUES (100100, '100100.png', '', 100, 85, '');
INSERT INTO `pgn_image` VALUES (100101, '100101.png', '', 100, 85, '');
INSERT INTO `pgn_image` VALUES (100102, '100102.png', '', 100, 85, '');
INSERT INTO `pgn_image` VALUES (100103, '100103.png', '', 100, 85, '');
INSERT INTO `pgn_image` VALUES (100104, '100104.png', '', 100, 85, '');
INSERT INTO `pgn_image` VALUES (100105, '100105.png', '', 100, 85, '');
INSERT INTO `pgn_image` VALUES (100106, '100106.png', '', 100, 85, '');
INSERT INTO `pgn_image` VALUES (100107, '100107.jpg', '', 400, 60, '');
INSERT INTO `pgn_image` VALUES (100108, '100108.gif', '', 120, 60, '');
INSERT INTO `pgn_image` VALUES (100109, '100109.gif', '', 55, 18, '');
INSERT INTO `pgn_image` VALUES (100173, '100173.jpg', '', 100, 75, '');
INSERT INTO `pgn_image` VALUES (100175, '100175.jpg', '', 100, 75, '');
INSERT INTO `pgn_image` VALUES (101941, '101941.gif', '', 100, 73, '');
INSERT INTO `pgn_image` VALUES (101931, '101931.gif', '', 100, 73, '');
INSERT INTO `pgn_image` VALUES (100534, '100534.jpg', '', 400, 80, '');
INSERT INTO `pgn_image` VALUES (100537, '100537.jpg', '', 400, 80, '');
INSERT INTO `pgn_image` VALUES (102334, '102334.jpg', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (102319, '102319.jpg', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (102324, '102324.jpg', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (102329, '102329.jpg', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (102023, '102023.gif', '', 100, 50, '');
INSERT INTO `pgn_image` VALUES (102295, '102295.jpg', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (102299, '102299.jpg', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (102304, '102304.jpg', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (102309, '102309.jpg', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (102314, '102314.jpg', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (101211, '101211.jpg', '', 160, 200, '');
INSERT INTO `pgn_image` VALUES (101374, '101374.JPG', '', 600, 491, '');
INSERT INTO `pgn_image` VALUES (101376, '101376.JPG', '', 600, 491, '');
INSERT INTO `pgn_image` VALUES (101378, '101378.JPG', '', 600, 491, '');
INSERT INTO `pgn_image` VALUES (101387, '101387.JPG', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (101389, '101389.JPG', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (101391, '101391.JPG', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (101393, '101393.JPG', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (101395, '101395.JPG', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (101397, '101397.JPG', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (101399, '101399.JPG', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (101401, '101401.JPG', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (101403, '101403.JPG', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (101407, '101407.JPG', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (101409, '101409.JPG', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (101411, '101411.JPG', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (101413, '101413.JPG', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (101415, '101415.JPG', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (101417, '101417.JPG', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (101421, '101421.JPG', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (101423, '101423.JPG', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (101425, '101425.JPG', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (101427, '101427.JPG', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (101429, '101429.JPG', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (101431, '101431.JPG', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (101433, '101433.JPG', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (101435, '101435.JPG', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (101437, '101437.JPG', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (101439, '101439.JPG', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (101441, '101441.JPG', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (101443, '101443.JPG', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (101445, '101445.JPG', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (101447, '101447.JPG', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (101449, '101449.JPG', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (101451, '101451.JPG', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (101453, '101453.JPG', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (101455, '101455.JPG', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (101457, '101457.JPG', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (101459, '101459.JPG', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (101461, '101461.JPG', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (101463, '101463.JPG', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (101465, '101465.JPG', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (101467, '101467.JPG', '', 640, 521, '');
INSERT INTO `pgn_image` VALUES (102835, '', '', 0, 0, '');
INSERT INTO `pgn_image` VALUES (102836, '', '', 0, 0, '');
INSERT INTO `pgn_image` VALUES (102837, '', '', 0, 0, '');
INSERT INTO `pgn_image` VALUES (102838, '', '', 0, 0, '');
INSERT INTO `pgn_image` VALUES (102839, '', '', 0, 0, '');
INSERT INTO `pgn_image` VALUES (102840, '', '', 0, 0, '');
INSERT INTO `pgn_image` VALUES (102841, '', '', 0, 0, '');
INSERT INTO `pgn_image` VALUES (102842, '', '', 0, 0, '');
INSERT INTO `pgn_image` VALUES (102843, '', '', 0, 0, '');
INSERT INTO `pgn_image` VALUES (102844, '', '', 0, 0, '');
INSERT INTO `pgn_image` VALUES (101895, '101895.jpg', '', 160, 200, '');
INSERT INTO `pgn_image` VALUES (101753, '101753.gif', '', 100, 66, '');
INSERT INTO `pgn_image` VALUES (101755, '101755.gif', '', 100, 73, '');
INSERT INTO `pgn_image` VALUES (101763, '101763.gif', '', 100, 73, '');
INSERT INTO `pgn_image` VALUES (101775, '101775.gif', '', 100, 63, '');
INSERT INTO `pgn_image` VALUES (101777, '101777.gif', '', 100, 50, '');
INSERT INTO `pgn_image` VALUES (102482, '102482.jpg', '', 640, 521, '');
INSERT INTO `pgn_image` VALUES (102477, '102477.jpg', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (102472, '102472.jpg', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (102467, '102467.jpg', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (102462, '102462.jpg', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (102457, '102457.jpg', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (102452, '102452.jpg', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (102447, '102447.jpg', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (102442, '102442.jpg', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (102437, '102437.jpg', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (102432, '102432.jpg', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (102427, '102427.jpg', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (102422, '102422.jpg', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (102417, '102417.jpg', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (102412, '102412.jpg', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (102407, '102407.jpg', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (102402, '102402.jpg', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (102397, '102397.jpg', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (102392, '102392.jpg', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (102387, '102387.jpg', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (102379, '102379.jpg', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (102374, '102374.jpg', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (102369, '102369.jpg', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (102364, '102364.jpg', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (102359, '102359.jpg', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (102354, '102354.jpg', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (102349, '102349.jpg', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (102344, '102344.jpg', '', 640, 507, '');
INSERT INTO `pgn_image` VALUES (102339, '102339.jpg', '', 640, 507, '');

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `pgn_label`
#

DROP TABLE IF EXISTS `pgn_label`;
CREATE TABLE `pgn_label` (
  `FKID` bigint(20) NOT NULL default '0',
  `CONTENT` varchar(255) default NULL,
  PRIMARY KEY  (`FKID`),
  UNIQUE KEY `FKID` (`FKID`)
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `pgn_label`
#

INSERT INTO `pgn_label` VALUES (100035, '');
INSERT INTO `pgn_label` VALUES (100036, 'Search');
INSERT INTO `pgn_label` VALUES (100037, 'Your search results');
INSERT INTO `pgn_label` VALUES (100147, 'Welcome to our company');
INSERT INTO `pgn_label` VALUES (100056, 'Testseite 1');
INSERT INTO `pgn_label` VALUES (100059, 'Das ist Graf Zeppelin.');
INSERT INTO `pgn_label` VALUES (100169, 'Successful fiscal Year');
INSERT INTO `pgn_label` VALUES (100163, 'Downloads');
INSERT INTO `pgn_label` VALUES (100076, '');
INSERT INTO `pgn_label` VALUES (100155, 'MyCompany latest News.');
INSERT INTO `pgn_label` VALUES (100108, 'Test News 1');
INSERT INTO `pgn_label` VALUES (100084, '');
INSERT INTO `pgn_label` VALUES (100111, '');
INSERT INTO `pgn_label` VALUES (100175, 'New Customers');
INSERT INTO `pgn_label` VALUES (100181, 'Products Overview');
INSERT INTO `pgn_label` VALUES (100187, 'Jobs Overview');
INSERT INTO `pgn_label` VALUES (100217, 'Contact our company!');
INSERT INTO `pgn_label` VALUES (100219, 'Name');
INSERT INTO `pgn_label` VALUES (100220, 'News');
INSERT INTO `pgn_label` VALUES (100222, 'Message');
INSERT INTO `pgn_label` VALUES (100223, 'Phone');
INSERT INTO `pgn_label` VALUES (100228, 'Can Opener');
INSERT INTO `pgn_label` VALUES (100235, 'Whire Whisk');
INSERT INTO `pgn_label` VALUES (100242, 'Scissors');
INSERT INTO `pgn_label` VALUES (100249, 'Professoren');
INSERT INTO `pgn_label` VALUES (100258, 'Berlin');
INSERT INTO `pgn_label` VALUES (100266, 'Sitzung beenden');
INSERT INTO `pgn_label` VALUES (100268, 'Munich');
INSERT INTO `pgn_label` VALUES (100277, 'Location');
INSERT INTO `pgn_label` VALUES (100280, 'If you are interested, please contact:');
INSERT INTO `pgn_label` VALUES (100285, 'Submit');
INSERT INTO `pgn_label` VALUES (100286, 'The Message has been successfully sent!');
INSERT INTO `pgn_label` VALUES (100317, 'Disclaimer');
INSERT INTO `pgn_label` VALUES (100292, '');
INSERT INTO `pgn_label` VALUES (100306, 'Disclaimer');
INSERT INTO `pgn_label` VALUES (100324, 'MyCompany latest News.');
INSERT INTO `pgn_label` VALUES (100337, 'Getting Started tutorial available');
INSERT INTO `pgn_label` VALUES (100345, 'Successful fiscal Year');
INSERT INTO `pgn_label` VALUES (100350, 'New Customers');
INSERT INTO `pgn_label` VALUES (100354, 'Products Overview');
INSERT INTO `pgn_label` VALUES (100404, 'Site of the month');
INSERT INTO `pgn_label` VALUES (100375, 'Whire Whisk');
INSERT INTO `pgn_label` VALUES (100381, 'Scissors');
INSERT INTO `pgn_label` VALUES (100387, 'News');
INSERT INTO `pgn_label` VALUES (100393, 'News Archive');
INSERT INTO `pgn_label` VALUES (100408, 'Die Anmeldung ist fehlgeschlagen');
INSERT INTO `pgn_label` VALUES (100410, 'Anmelden');
INSERT INTO `pgn_label` VALUES (100417, '');
INSERT INTO `pgn_label` VALUES (100423, 'Secretary');
INSERT INTO `pgn_label` VALUES (100425, 'Munich');
INSERT INTO `pgn_label` VALUES (100456, '');
INSERT INTO `pgn_label` VALUES (100457, 'Search');
INSERT INTO `pgn_label` VALUES (100458, 'Your search results');
INSERT INTO `pgn_label` VALUES (100464, 'Your search query returned no results.');
INSERT INTO `pgn_label` VALUES (100466, 'Name');
INSERT INTO `pgn_label` VALUES (100467, 'E-Mail');
INSERT INTO `pgn_label` VALUES (100468, 'Studium');
INSERT INTO `pgn_label` VALUES (100469, 'Message');
INSERT INTO `pgn_label` VALUES (100471, 'News');
INSERT INTO `pgn_label` VALUES (100472, 'The Message has been successfully sent!');
INSERT INTO `pgn_label` VALUES (100473, 'Statistics');
INSERT INTO `pgn_label` VALUES (100494, '');
INSERT INTO `pgn_label` VALUES (100503, 'Forschung und Projekte');
INSERT INTO `pgn_label` VALUES (100510, '');
INSERT INTO `pgn_label` VALUES (100512, '');
INSERT INTO `pgn_label` VALUES (100522, '');
INSERT INTO `pgn_label` VALUES (100528, '');
INSERT INTO `pgn_label` VALUES (100560, '');
INSERT INTO `pgn_label` VALUES (100564, '');
INSERT INTO `pgn_label` VALUES (100566, '');
INSERT INTO `pgn_label` VALUES (100572, 'Ich bin der Peter');
INSERT INTO `pgn_label` VALUES (100600, '');
INSERT INTO `pgn_label` VALUES (100611, '');
INSERT INTO `pgn_label` VALUES (100635, 'Phone');
INSERT INTO `pgn_label` VALUES (100648, '');
INSERT INTO `pgn_label` VALUES (100650, '');
INSERT INTO `pgn_label` VALUES (100668, '');
INSERT INTO `pgn_label` VALUES (100759, '');
INSERT INTO `pgn_label` VALUES (101161, 'Die Überschirft');
INSERT INTO `pgn_label` VALUES (101195, 'Common Errors');
INSERT INTO `pgn_label` VALUES (101196, '3');
INSERT INTO `pgn_label` VALUES (101197, '2');
INSERT INTO `pgn_label` VALUES (101219, 'http://sourceforge.net/export/rss2_projfiles.php?group_id=47362');
INSERT INTO `pgn_label` VALUES (101206, '8');
INSERT INTO `pgn_label` VALUES (101200, '6');
INSERT INTO `pgn_label` VALUES (101220, '');
INSERT INTO `pgn_label` VALUES (101202, '5');
INSERT INTO `pgn_label` VALUES (101203, '4');
INSERT INTO `pgn_label` VALUES (101205, '7');
INSERT INTO `pgn_label` VALUES (101223, '');
INSERT INTO `pgn_label` VALUES (101226, '');
INSERT INTO `pgn_label` VALUES (101227, '');
INSERT INTO `pgn_label` VALUES (101229, '23');
INSERT INTO `pgn_label` VALUES (101231, '154');
INSERT INTO `pgn_label` VALUES (101232, '56');
INSERT INTO `pgn_label` VALUES (101233, '45649999999999966');
INSERT INTO `pgn_label` VALUES (101234, 'ein schnuckeliger text also.');
INSERT INTO `pgn_label` VALUES (101235, 'test');
INSERT INTO `pgn_label` VALUES (101237, '1234');
INSERT INTO `pgn_label` VALUES (101238, '123456789012345679812,456791,45679');
INSERT INTO `pgn_label` VALUES (101246, '');
INSERT INTO `pgn_label` VALUES (101249, '123456789');
INSERT INTO `pgn_label` VALUES (101298, 'Test Sven 2');
INSERT INTO `pgn_label` VALUES (101303, 'Test Sven 3');
INSERT INTO `pgn_label` VALUES (101328, 'Getting Started with N/X 4.0');
INSERT INTO `pgn_label` VALUES (101378, 'Die Überschirft');
INSERT INTO `pgn_label` VALUES (101386, 'Die Überschirft');
INSERT INTO `pgn_label` VALUES (101391, 'Test Sven 2');
INSERT INTO `pgn_label` VALUES (101403, 'Test Sven 3');
INSERT INTO `pgn_label` VALUES (101416, 'Die Überschirft');
INSERT INTO `pgn_label` VALUES (101420, 'Test Sven 2');
INSERT INTO `pgn_label` VALUES (101426, 'Test Sven 3');
INSERT INTO `pgn_label` VALUES (101446, 'ein schöner Text, den wir hier eingeben, finden Sie nicht.');
INSERT INTO `pgn_label` VALUES (101448, '23');
INSERT INTO `pgn_label` VALUES (101449, '2');
INSERT INTO `pgn_label` VALUES (101450, '154');
INSERT INTO `pgn_label` VALUES (101451, '56');
INSERT INTO `pgn_label` VALUES (101452, '45649999999999966');
INSERT INTO `pgn_label` VALUES (101458, '');
INSERT INTO `pgn_label` VALUES (101460, '');
INSERT INTO `pgn_label` VALUES (101462, '1234');
INSERT INTO `pgn_label` VALUES (101463, '123456789012345679812,456791,45679');
INSERT INTO `pgn_label` VALUES (101540, '');
INSERT INTO `pgn_label` VALUES (101546, '');
INSERT INTO `pgn_label` VALUES (101550, '');
INSERT INTO `pgn_label` VALUES (101645, '');
INSERT INTO `pgn_label` VALUES (101652, '');
INSERT INTO `pgn_label` VALUES (101657, 'Tritt Boris Becker vom Rücktritt zurück?');
INSERT INTO `pgn_label` VALUES (101662, '');
INSERT INTO `pgn_label` VALUES (101703, 'test');
INSERT INTO `pgn_label` VALUES (101726, 'test');
INSERT INTO `pgn_label` VALUES (102356, 'Becker hechtet wie eh und je');
INSERT INTO `pgn_label` VALUES (102365, 'Becker hechtet wie eh und je');
INSERT INTO `pgn_label` VALUES (102370, '');
INSERT INTO `pgn_label` VALUES (113708, '');
INSERT INTO `pgn_label` VALUES (113719, 'Aber Heidi!');
INSERT INTO `pgn_label` VALUES (113723, '');
INSERT INTO `pgn_label` VALUES (113738, 'Bayern eine Runde weiter!');
INSERT INTO `pgn_label` VALUES (113744, 'Bayern eine Runde weiter!');
INSERT INTO `pgn_label` VALUES (113778, '');
INSERT INTO `pgn_label` VALUES (113782, '');
INSERT INTO `pgn_label` VALUES (113801, 'Fußball ist unser Leben, ja König Fußball regiert die Welt :-)');
INSERT INTO `pgn_label` VALUES (113809, 'Stich ist ein loser!');
INSERT INTO `pgn_label` VALUES (100019, 'Suche');
INSERT INTO `pgn_label` VALUES (100061, 'Willkommen im Fachbereich MNI');
INSERT INTO `pgn_label` VALUES (100069, 'GO');
INSERT INTO `pgn_label` VALUES (100074, '');
INSERT INTO `pgn_label` VALUES (100080, 'Impressum');
INSERT INTO `pgn_label` VALUES (100086, 'Disclaimer');
INSERT INTO `pgn_label` VALUES (100092, 'Copyright');
INSERT INTO `pgn_label` VALUES (100304, 'Angemeldet als');
INSERT INTO `pgn_label` VALUES (100121, 'Allgemeines');
INSERT INTO `pgn_label` VALUES (100127, 'Sonstiges');
INSERT INTO `pgn_label` VALUES (100133, 'Über den Fachbereich');
INSERT INTO `pgn_label` VALUES (100143, 'Stundenplan');
INSERT INTO `pgn_label` VALUES (100145, 'Studium');
INSERT INTO `pgn_label` VALUES (100151, 'Rund ums Studium');
INSERT INTO `pgn_label` VALUES (100161, 'Forschung und Projekte');
INSERT INTO `pgn_label` VALUES (100179, 'Pflicht- und Wahlpflichtmodule WS 03/04');
INSERT INTO `pgn_label` VALUES (100189, 'Klausuranmeldung / Schwerpunkt-Anmeldung WS 03/04');
INSERT INTO `pgn_label` VALUES (100199, 'Notenauszüge SS 03');
INSERT INTO `pgn_label` VALUES (100229, 'MNI News');
INSERT INTO `pgn_label` VALUES (100236, 'Quibeldey-Cirkel');
INSERT INTO `pgn_label` VALUES (100237, 'Klaus');
INSERT INTO `pgn_label` VALUES (100238, 'The N/X Crew');
INSERT INTO `pgn_label` VALUES (100239, '089/92929');
INSERT INTO `pgn_label` VALUES (100240, 'klaus.quibeldey-cirkel@mni.fh-giessen.de');
INSERT INTO `pgn_label` VALUES (100264, 'Benutzername');
INSERT INTO `pgn_label` VALUES (100265, 'Die Anmeldung ist fehlgeschlagen');
INSERT INTO `pgn_label` VALUES (100267, 'Anmelden');
INSERT INTO `pgn_label` VALUES (100297, 'Anmeldung benötigt!');
INSERT INTO `pgn_label` VALUES (100327, 'Willkommen im MNI-Intranet!');
INSERT INTO `pgn_label` VALUES (100334, 'Klausurergebnisse');
INSERT INTO `pgn_label` VALUES (100341, 'Klausurergenisse Softwaretechnik');
INSERT INTO `pgn_label` VALUES (100348, 'Klausurergenisse Informationssystem SS03');
INSERT INTO `pgn_label` VALUES (100389, 'Suche');
INSERT INTO `pgn_label` VALUES (100398, 'GO');
INSERT INTO `pgn_label` VALUES (100403, 'Latest Forum Threads');
INSERT INTO `pgn_label` VALUES (100405, 'Statistics');
INSERT INTO `pgn_label` VALUES (100406, 'Passwort');
INSERT INTO `pgn_label` VALUES (100407, 'Benutzername');
INSERT INTO `pgn_label` VALUES (100409, 'Sitzung beenden');
INSERT INTO `pgn_label` VALUES (100414, 'Willkommen im Fachbereich MNI');
INSERT INTO `pgn_label` VALUES (100430, 'Allgemeines');
INSERT INTO `pgn_label` VALUES (100436, 'Über den Fachbereich');
INSERT INTO `pgn_label` VALUES (100452, 'MNI News');
INSERT INTO `pgn_label` VALUES (100461, 'Professoren');
INSERT INTO `pgn_label` VALUES (100475, 'Stundenplan');
INSERT INTO `pgn_label` VALUES (100480, 'Sonstiges');
INSERT INTO `pgn_label` VALUES (100486, 'Rund ums Studium');
INSERT INTO `pgn_label` VALUES (100495, 'Downloads');
INSERT INTO `pgn_label` VALUES (100511, 'Anmeldung benötigt!');
INSERT INTO `pgn_label` VALUES (100518, '');
INSERT INTO `pgn_label` VALUES (100524, 'Impressum');
INSERT INTO `pgn_label` VALUES (100533, 'Disclaimer');
INSERT INTO `pgn_label` VALUES (100539, 'Copyright');
INSERT INTO `pgn_label` VALUES (100546, 'Willkommen im MNI-Intranet!');
INSERT INTO `pgn_label` VALUES (100552, 'Klausurergebnisse');
INSERT INTO `pgn_label` VALUES (100559, 'Klausurergenisse Softwaretechnik');
INSERT INTO `pgn_label` VALUES (100567, 'Klausurergenisse Informationssystem SS03');
INSERT INTO `pgn_label` VALUES (100579, 'Name');
INSERT INTO `pgn_label` VALUES (100580, 'First Name');
INSERT INTO `pgn_label` VALUES (100581, 'Street');
INSERT INTO `pgn_label` VALUES (100582, 'ZIP');
INSERT INTO `pgn_label` VALUES (100583, 'City');
INSERT INTO `pgn_label` VALUES (100593, 'Klausuranmeldung / Schwerpunkt-Anmeldung WS 03/04');
INSERT INTO `pgn_label` VALUES (100605, 'Notenauszüge SS 03');
INSERT INTO `pgn_label` VALUES (100619, 'Pflicht- und Wahlpflichtmodule WS 03/04');
INSERT INTO `pgn_label` VALUES (100050, 'About us');
INSERT INTO `pgn_label` VALUES (100132, 'About us');
INSERT INTO `pgn_label` VALUES (100139, 'Services');
INSERT INTO `pgn_label` VALUES (100146, 'Downloads');
INSERT INTO `pgn_label` VALUES (100160, 'References');
INSERT INTO `pgn_label` VALUES (100165, 'News');
INSERT INTO `pgn_label` VALUES (100185, 'About us');
INSERT INTO `pgn_label` VALUES (100194, 'News');
INSERT INTO `pgn_label` VALUES (100215, 'Services');
INSERT INTO `pgn_label` VALUES (100244, 'For whom is N/X?');
INSERT INTO `pgn_label` VALUES (100250, '');
INSERT INTO `pgn_label` VALUES (100331, 'N/X 4.0 BETA available');
INSERT INTO `pgn_label` VALUES (100274, 'For whom is N/X?');
INSERT INTO `pgn_label` VALUES (101867, 'Launch of new website');
INSERT INTO `pgn_label` VALUES (100807, '');
INSERT INTO `pgn_label` VALUES (100402, 'News');
INSERT INTO `pgn_label` VALUES (100463, 'Search Engine');
INSERT INTO `pgn_label` VALUES (100470, 'Latest Forum Threads');
INSERT INTO `pgn_label` VALUES (100474, 'Site of the month');
INSERT INTO `pgn_label` VALUES (100484, 'Your search query returned no results.');
INSERT INTO `pgn_label` VALUES (101985, 'http://forum.nxsystems.org');
INSERT INTO `pgn_label` VALUES (100496, 'News');
INSERT INTO `pgn_label` VALUES (100577, 'Contact the N/X team!');
INSERT INTO `pgn_label` VALUES (100584, 'Phone');
INSERT INTO `pgn_label` VALUES (100585, 'Fax');
INSERT INTO `pgn_label` VALUES (100586, 'E-Mail');
INSERT INTO `pgn_label` VALUES (100587, 'Submit');
INSERT INTO `pgn_label` VALUES (100588, 'Reset');
INSERT INTO `pgn_label` VALUES (100589, 'Thank you for your message!');
INSERT INTO `pgn_label` VALUES (100590, 'Ooops! There is something wrong with your data.');
INSERT INTO `pgn_label` VALUES (100591, 'your.email@address');
INSERT INTO `pgn_label` VALUES (100592, 'Message in Homepage');
INSERT INTO `pgn_label` VALUES (100595, 'Subject');
INSERT INTO `pgn_label` VALUES (100596, 'Your Message');
INSERT INTO `pgn_label` VALUES (100599, 'Your message to the N/X team!');
INSERT INTO `pgn_label` VALUES (100630, 'Name');
INSERT INTO `pgn_label` VALUES (100631, 'First Name');
INSERT INTO `pgn_label` VALUES (100632, 'Street');
INSERT INTO `pgn_label` VALUES (100633, 'ZIP');
INSERT INTO `pgn_label` VALUES (100634, 'City');
INSERT INTO `pgn_label` VALUES (100636, 'Fax');
INSERT INTO `pgn_label` VALUES (100637, 'E-Mail');
INSERT INTO `pgn_label` VALUES (100638, 'Submit');
INSERT INTO `pgn_label` VALUES (100639, 'Reset');
INSERT INTO `pgn_label` VALUES (100640, 'Thank you for your message!');
INSERT INTO `pgn_label` VALUES (100641, 'Ooops! There is something wrong with your data.');
INSERT INTO `pgn_label` VALUES (100642, 'your.email@address');
INSERT INTO `pgn_label` VALUES (100643, 'Message in Homepage');
INSERT INTO `pgn_label` VALUES (100644, 'Subject');
INSERT INTO `pgn_label` VALUES (100645, 'Your Message');
INSERT INTO `pgn_label` VALUES (100646, 'Your message to the N/X team!');
INSERT INTO `pgn_label` VALUES (100720, 'FAQ');
INSERT INTO `pgn_label` VALUES (100744, 'Ask a Question');
INSERT INTO `pgn_label` VALUES (100746, 'Your Question');
INSERT INTO `pgn_label` VALUES (100747, 'Send');
INSERT INTO `pgn_label` VALUES (100748, 'Reset');
INSERT INTO `pgn_label` VALUES (100750, 'We received your question:');
INSERT INTO `pgn_label` VALUES (101207, 'N/X License Agreement - The GNU General Public License (GPL)');
INSERT INTO `pgn_label` VALUES (100757, 'How can I determine the startpage of my website?');
INSERT INTO `pgn_label` VALUES (100772, 'FAQ');
INSERT INTO `pgn_label` VALUES (100787, 'Ask a Question');
INSERT INTO `pgn_label` VALUES (100789, 'Your Question');
INSERT INTO `pgn_label` VALUES (100790, 'Send');
INSERT INTO `pgn_label` VALUES (100791, 'Reset');
INSERT INTO `pgn_label` VALUES (100792, 'We received your question:');
INSERT INTO `pgn_label` VALUES (101217, 'Available Downloads');
INSERT INTO `pgn_label` VALUES (101156, 'Computer Requirements for N/X 4.0');
INSERT INTO `pgn_label` VALUES (101288, 'List of pages developed with N/X');
INSERT INTO `pgn_label` VALUES (101297, 'http://forum.nxsystems.org');
INSERT INTO `pgn_label` VALUES (101326, 'Installing N/X 4.0');
INSERT INTO `pgn_label` VALUES (101334, 'The N/X 4.0 Website API (CDS API)');
INSERT INTO `pgn_label` VALUES (101336, 'The N/X APIs');
INSERT INTO `pgn_label` VALUES (101338, '');
INSERT INTO `pgn_label` VALUES (101350, 'Take a Tour through N/X 4.0');
INSERT INTO `pgn_label` VALUES (101364, '');
INSERT INTO `pgn_label` VALUES (101579, 'Computer Requirements for N/X 4.0');
INSERT INTO `pgn_label` VALUES (101593, 'I created a new group and assigned it to a user. When the users clicks on website, an access violation is displayed.');
INSERT INTO `pgn_label` VALUES (101597, 'I launched a sitepage or an article but there is nothing shown at the live-website.');
INSERT INTO `pgn_label` VALUES (101784, 'N/X Tour');
INSERT INTO `pgn_label` VALUES (101790, 'Requirements');
INSERT INTO `pgn_label` VALUES (101796, 'The Team');
INSERT INTO `pgn_label` VALUES (101806, 'You have questions?');
INSERT INTO `pgn_label` VALUES (101812, 'Common Errors');
INSERT INTO `pgn_label` VALUES (101818, 'N/X Installation');
INSERT INTO `pgn_label` VALUES (101824, 'API Online');
INSERT INTO `pgn_label` VALUES (101830, 'Security');
INSERT INTO `pgn_label` VALUES (101837, 'Downloads');
INSERT INTO `pgn_label` VALUES (101843, 'License');
INSERT INTO `pgn_label` VALUES (101850, 'Sites built with N/X');
INSERT INTO `pgn_label` VALUES (101856, 'In Media');
INSERT INTO `pgn_label` VALUES (100221, 'Downloads');
INSERT INTO `pgn_label` VALUES (101873, 'Downloads');
INSERT INTO `pgn_label` VALUES (101883, 'License');
INSERT INTO `pgn_label` VALUES (101896, 'N/X License Agreement - The GNU General Public License (GPL)');
INSERT INTO `pgn_label` VALUES (101908, 'http://sourceforge.net/export/rss2_projfiles.php?group_id=47362');
INSERT INTO `pgn_label` VALUES (101910, 'Available Downloads');
INSERT INTO `pgn_label` VALUES (101918, 'You have questions?');
INSERT INTO `pgn_label` VALUES (101927, 'Common Errors');
INSERT INTO `pgn_label` VALUES (101937, 'N/X Installation');
INSERT INTO `pgn_label` VALUES (101947, 'API Online');
INSERT INTO `pgn_label` VALUES (101957, 'Security');
INSERT INTO `pgn_label` VALUES (101977, 'Common Errors');
INSERT INTO `pgn_label` VALUES (101990, 'Installing N/X 4.0');
INSERT INTO `pgn_label` VALUES (101996, 'Getting Started with N/X 4.0');
INSERT INTO `pgn_label` VALUES (102001, 'The N/X APIs');
INSERT INTO `pgn_label` VALUES (102019, 'N/X Tour');
INSERT INTO `pgn_label` VALUES (102033, 'Requirements');
INSERT INTO `pgn_label` VALUES (102038, 'The Team');
INSERT INTO `pgn_label` VALUES (102093, 'Take a Tour through N/X 4.0');
INSERT INTO `pgn_label` VALUES (100227, 'References');
INSERT INTO `pgn_label` VALUES (102097, 'Sites built with N/X');
INSERT INTO `pgn_label` VALUES (102107, 'In Media');
INSERT INTO `pgn_label` VALUES (102793, 'PHP Security problems do not affect N/X');
INSERT INTO `pgn_label` VALUES (102813, 'Yes, we are save!');
INSERT INTO `pgn_label` VALUES (102825, 'N/X 4.0 release X-Mas Gift!');
INSERT INTO `pgn_label` VALUES (102282, 'Launch of new website');
INSERT INTO `pgn_label` VALUES (102188, 'List of pages developed with N/X');
INSERT INTO `pgn_label` VALUES (100485, 'Search Engine');
INSERT INTO `pgn_label` VALUES (100501, 'News Archive');
INSERT INTO `pgn_label` VALUES (102788, 'PHP Security problems do not affect N/X');
INSERT INTO `pgn_label` VALUES (102808, 'Yes, we are save!');
INSERT INTO `pgn_label` VALUES (102820, 'N/X 4.0 release X-Mas Gift!');

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `pgn_link`
#

DROP TABLE IF EXISTS `pgn_link`;
CREATE TABLE `pgn_link` (
  `FKID` bigint(20) NOT NULL default '0',
  `LABEL` varchar(32) default NULL,
  `EXTERNAL` tinyint(4) NOT NULL default '0',
  `HREF` varchar(128) default NULL,
  `SPID` bigint(20) default NULL,
  `TARGET` varchar(32) default NULL,
  PRIMARY KEY  (`FKID`)
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `pgn_link`
#

INSERT INTO `pgn_link` VALUES (100208, '', 0, NULL, NULL, NULL);
INSERT INTO `pgn_link` VALUES (100209, '', 0, NULL, NULL, NULL);
INSERT INTO `pgn_link` VALUES (100210, '', 0, NULL, NULL, NULL);
INSERT INTO `pgn_link` VALUES (100221, '', 0, '', 0, '');
INSERT INTO `pgn_link` VALUES (100222, '', 0, '', 0, '');
INSERT INTO `pgn_link` VALUES (100223, '', 0, '', 0, '');
INSERT INTO `pgn_link` VALUES (100241, 'Homepage', 0, 'www.quibeldey-cirkel.de', 0, '_blank');
INSERT INTO `pgn_link` VALUES (100316, '', 0, '', 0, '');
INSERT INTO `pgn_link` VALUES (100317, '', 0, '', 0, '');
INSERT INTO `pgn_link` VALUES (100318, '', 0, '', 0, '');
INSERT INTO `pgn_link` VALUES (100584, 'Homepage', 0, 'www.quibeldey-cirkel.de', 100420, '_blank');
INSERT INTO `pgn_link` VALUES (100599, '', 0, '', 100420, '');
INSERT INTO `pgn_link` VALUES (100600, '', 0, '', 100420, '');
INSERT INTO `pgn_link` VALUES (100601, '', 0, '', 100420, '');
INSERT INTO `pgn_link` VALUES (100610, '', 0, '', 100611, '');
INSERT INTO `pgn_link` VALUES (100612, '', 0, '', 100613, '');
INSERT INTO `pgn_link` VALUES (100614, '', 0, '', 100615, '');
INSERT INTO `pgn_link` VALUES (100624, '', 0, '', 100625, '');
INSERT INTO `pgn_link` VALUES (100626, '', 0, '', 100627, '');
INSERT INTO `pgn_link` VALUES (100628, '', 0, '', 100629, '');
INSERT INTO `pgn_link` VALUES (100168, 'more...', 0, '', 100384, '');
INSERT INTO `pgn_link` VALUES (100199, 'more...', 0, '', 100488, '');
INSERT INTO `pgn_link` VALUES (100524, '', 0, '', 100384, '');
INSERT INTO `pgn_link` VALUES (100535, '', 0, '', 100129, '');
INSERT INTO `pgn_link` VALUES (100538, '', 0, '', 100136, '');
INSERT INTO `pgn_link` VALUES (101787, 'more...', 0, '', 101347, '');
INSERT INTO `pgn_link` VALUES (101793, 'more...', 0, '', 101153, '');
INSERT INTO `pgn_link` VALUES (101799, 'more...', 0, '', 0, '');
INSERT INTO `pgn_link` VALUES (101809, 'more...', 0, '', 100717, '');
INSERT INTO `pgn_link` VALUES (101815, 'Read more...', 0, '', 101192, '');
INSERT INTO `pgn_link` VALUES (101821, 'more..', 0, '', 101299, '');
INSERT INTO `pgn_link` VALUES (101827, 'more...', 0, '', 101315, '');
INSERT INTO `pgn_link` VALUES (101833, 'more...', 0, '', 0, '');
INSERT INTO `pgn_link` VALUES (101840, 'more...', 0, '', 101214, '');
INSERT INTO `pgn_link` VALUES (101846, 'Read more...', 0, '', 101204, '');
INSERT INTO `pgn_link` VALUES (101853, 'more...', 0, '', 101285, '');
INSERT INTO `pgn_link` VALUES (101859, 'more...', 0, '', 0, '');
INSERT INTO `pgn_link` VALUES (101878, 'more...', 0, '', 101879, '');
INSERT INTO `pgn_link` VALUES (101888, 'Read more...', 0, '', 101889, '');
INSERT INTO `pgn_link` VALUES (101923, 'more...', 0, '', 100768, '');
INSERT INTO `pgn_link` VALUES (101932, 'Read more...', 0, '', 101933, '');
INSERT INTO `pgn_link` VALUES (101942, 'more..', 0, '', 101943, '');
INSERT INTO `pgn_link` VALUES (101952, 'more...', 0, '', 101953, '');
INSERT INTO `pgn_link` VALUES (101962, 'more...', 0, '', 101963, '');
INSERT INTO `pgn_link` VALUES (102024, 'more...', 0, '', 102025, '');
INSERT INTO `pgn_link` VALUES (102034, 'more...', 0, '', 101575, '');
INSERT INTO `pgn_link` VALUES (102043, 'more...', 0, '', 100278, '');
INSERT INTO `pgn_link` VALUES (102102, 'more...', 0, '', 102184, '');
INSERT INTO `pgn_link` VALUES (102112, 'more...', 0, '', 102113, '');
INSERT INTO `pgn_link` VALUES (100658, '', 0, '', 100488, '');

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `pgn_text`
#

DROP TABLE IF EXISTS `pgn_text`;
CREATE TABLE `pgn_text` (
  `FKID` bigint(20) NOT NULL default '0',
  `CONTENT` longtext,
  PRIMARY KEY  (`FKID`),
  UNIQUE KEY `FKID` (`FKID`),
  FULLTEXT KEY `CONTENT` (`CONTENT`)
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `pgn_text`
#

INSERT INTO `pgn_text` VALUES (100057, 'Halt so ein kleiner Text.');
INSERT INTO `pgn_text` VALUES (100109, 'Demo Text und nochmal DemoText usw. ..... <img height="316" src="http://localhost/nx2004/wwwdev/images/100113.jpg" width="200" align="bottom" border="0" />');
INSERT INTO `pgn_text` VALUES (100148, 'L. Sergius Catilina, homo patricii generis, magna vi et animi et corporis, sed ingenio malo pravoque, praetorius, qui iam a. u. c. 689 caedem consulum facere eaque facta rerum potiri constituerat, casu autem rem perficere prohibitus erat, ascitis ad consilium rei publicae opprimendae hominibus omnis generis perditissiis atque audacissimis, quos inopia, cupiditas, scelera stimulabant, consulatum in annum 691 p. u. c. petivit, sed cum, quae in animo habebat, perniciosa rei publicae consilia parum occultata essent, studiis bonorum omnium M. Tullius Cicero una cum C. Antonio consul factus est. Qua re commotus L. Catilina M. Cicerone C. Antonio consulibus cupidius etiam sua consilia recepit, quibus maxime Ciceronis consulis diligentia restitit ad quem Catilinae eiusque sociorum consilia a Fulvia, muliere nobili, quae rem habebat cum Q. Curio, qui particeps fuit conspirationis illius, deferebantur. Cum autem ista mala consilia contra salutem rei publicae a coniuratis inita apertius iam agitarentur, senatus consultum factum est, darent operam consules, ne quid res publica detrimenti caperet, effectumque est, ut Catilina spe consulatus, quem in proximum annum petebat, excideret, designarenturque D. Silanus et L. Murena. Quae cum ita essent, L. Catilina, qui iam ante per Italiam ad homines seditiosos, maxime veteres L. Sullae milites, concitandos nuntios miserat, ad C. Manlium, qui Faesulas, in urbem Etruriae munitam, manum armatorum coegerat, proficisci constituit et bellum patriae inferre convocatisque nocte, quae inter VIII et VII Id. Novembres erat, sociis in domum M. Porci Laecae consilium, quod ceperat, aperuit. Qua in congregatione nocturna duo equites Romani Ciceronem consulem illa ipsa nocte ante lucem, cum sicut salutaturi eius domum intrassent, interficiendum receperunt. M. Cicero vitatis insidiis proximo die, qui fuit a. d. VI Id. Novembres, dispositis praesidiis senatum in templum Iovis Statoris convocavit, quo cum Catilina quasi sui purgandi causa venisset, Cicero eam, quae infra legitur, orationem in Catilinam vehementissime invehens habuit.');
INSERT INTO `pgn_text` VALUES (100156, 'Quo usque tandem abutere, Catilina, patientia nostra? quam diu etiam furor iste tuus nos eludet? quem ad finem sese effrenata iactabit audacia? Nihilne te nocturnum praesidium Palati, nihil urbis vigiliae, nihil timor populi, nihil concursus bonorum omnium, nihil hic munitissimus habendi senatus locus, nihil horum ora voltusque moverunt? Patere tua consilia non sentis, constrictam iam horum omnium scientia teneri coniurationem tuam non vides? Quid proxima, quid superiore nocte egeris, ubi fueris, quos convocaveris, quid consilii ceperis, quem nostrum ignorare arbitraris?');
INSERT INTO `pgn_text` VALUES (100164, 'Decrevit quondam senatus, ut L. Opimius consul videret, ne quid res publica detrimenti caperet; nox nulla intercessit; interfectus est propter quasdam seditionum suspiciones C. Gracchus, clarissimo patre, avo, maioribus, occisus est cum liberis M. Fulvius consularis. Simili senatus consulto C. Mario et L. Valerio consulibus est permissa res publica; num unum diem postea L. Saturninum tribunum pl. et C. Servilium praetorem mors ac rei publicae poena remorata est? At [vero] nos vicesimum iam diem patimur hebescere aciem horum auctoritatis.');
INSERT INTO `pgn_text` VALUES (100180, 'Eine Übersicht der Module und deren Verrechnung in den verschiedenen POs , die im WS 03/04 angeboten werden, erhalten Sie unter <a HREF="http://localhost/veranstaltungen.shtml">Veranstaltungen</A> .');
INSERT INTO `pgn_text` VALUES (100190, 'Sie können sich jetzt zu Klausuren und zum Studienschwerpunkt anmelden. Anmeldung unter <a HREF="http://anm.mni.fh-giessen.de/anm/anm_vor.asp">Online-Anmeldung</A>,');
INSERT INTO `pgn_text` VALUES (100200, 'Es wurden alle Notenauszüge fürs SS 03 gedruckt. Bitte holen Sie Ihre Auszüge im MNI-Sekretariat ab. Eine Überprüfung Ihrer bisher erbrachten Leistungsnachweise bzw. Ihrer möglichen Fehlversuche sollten Sie vornehmen.');
INSERT INTO `pgn_text` VALUES (100230, '');
INSERT INTO `pgn_text` VALUES (100242, '');
INSERT INTO `pgn_text` VALUES (100170, '<p>Etenim quid est, Catilina, quod iam amplius expectes, si neque nox tenebris obscurare coeptus nefarios nec privata domus parietibus continere voces coniurationis tuae potest, si illustrantur, si erumpunt omnia? Muta iam istam mentem, mihi crede, obliviscere caedis atque incendiorum. Teneris undique; luce sunt clariora nobis tua consilia omnia; quae iam mecum licet recognoscas. [7] Meministine me ante diem XII Kalendas Novembris dicere in senatu fore in armis certo die, qui dies futurus esset ante diem VI Kal. Novembris, C. Manlium, audaciae satellitem atque administrum tuae? Num me fefellit, Catilina, non modo res tanta, tam atrox tamque incredibilis, verum, id quod multo magis est admirandum, dies? Dixi ego idem in senatu caedem te optumatium contulisse in ante diem V Kalendas Novembris, tum cum multi principes civitatis Roma non tam sui conservandi quam tuorum consiliorum reprimendorum causa profugerunt. Num infitiari potes te illo ipso die meis praesidiis, mea diligentia circumclusum commovere te contra rem publicam non potuisse, cum tu discessu ceterorum nostra tamen, qui remansissemus, caede te contentum esse dicebas? [8] Quid? cum te Praeneste Kalendis ipsis Novembribus occupaturum nocturno impetu esse confideres, sensistin illam coloniam meo iussu meis praesidiis, custodiis, vigiliis esse munitam? Nihil agis, nihil moliris, nihil cogitas, quod non ego non modo audiam, sed etiam videam planeque sentiam. Recognosce tandem mecum noctem illam superiorem; iam intelleges multo me vigilare acrius ad salutem quam te ad perniciem rei publicae. Dico te priore nocte venisse inter falcarios (non agam obscure) in M. Laecae domum; convenisse eodem complures eiusdem amentiae scelerisque socios. Num negare audes? quid taces? Convincam, si negas. Video enim esse hic in senatu quosdam, qui tecum una fuerunt. [9] O di inmortales! ubinam gentium sumus? in qua urbe vivimus? quam rem publicam habemus? Hic, hic sunt in nostro numero, patres conscripti, in hoc orbis terrae sanctissimo gravissimoque consilio, qui de nostro omnium interitu, qui de huius urbis atque adeo de orbis terrarum exitio cogitent! Hos ego video consul et de re publica sententiam rogo et, quos ferro trucidari oportebat, eos nondum voce volnero! Fuisti igitur apud Laecam illa nocte, Catilina, distribuisti partes Italiae, statuisti, quo quemque proficisci placeret, delegisti, quos Romae relinqueres, quos tecum educeres, discripsisti urbis partes ad incendia, confirmasti te ipsum iam esse exiturum, dixisti paulum tibi esse etiam nunc morae, quod ego viverem. Reperti sunt duo equites Romani, qui te ista cura liberarent et sese illa ipsa nocte paulo ante lucem me in meo lectulo interfecturos [esse] pollicerentur. [10] Haec ego omnia vixdum etiam coetu vestro dimisso comperi; domum meam maioribus praesidiis munivi atque firmavi, exclusi eos, quos tu ad me salutatum mane miseras, cum illi ipsi venissent, quos ego iam multis ac summis viris ad me id temporis venturos esse praedixeram. </p>');
INSERT INTO `pgn_text` VALUES (100176, 'Quae cum ita sint, Catilina, perge, quo coepisti, egredere aliquando ex urbe; patent portae; proficiscere. Nimium diu te imperatorem tua illa Manliana castra desiderant. Educ tecum etiam omnes tuos, si minus, quam plurimos; purga urbem. Magno me metu liberabis, dum modo inter me atque te murus intersit. Nobiscum versari iam diutius non potes; non feram, non patiar, non sinam. [11] Magna dis inmortalibus habenda est atque huic ipsi Iovi Statori, antiquissimo custodi huius urbis, gratia, quod hanc tam taetram, tam horribilem tamque infestam rei publicae pestem totiens iam effugimus. Non est saepius in uno homine summa salus periclitanda rei publicae. Quamdiu mihi consuli designato, Catilina, insidiatus es, non publico me praesidio, sed privata diligentia defendi. Cum proximis comitiis consularibus me consulem in campo et competitores tuos interficere voluisti, compressi conatus tuos nefarios amicorum praesidio et copiis nullo tumultu publice concitato; denique, quotienscumque me petisti, per me tibi obstiti, quamquam videbam perniciem meam cum magna calamitate rei publicae esse coniunctam. [12] Nunc iam aperte rem publicam universam petis, templa deorum inmortalium, tecta urbis, vitam omnium civium, Italiam [denique] totam ad exitium et vastitatem vocas. Quare, quoniam id, quod est primum, et quod huius imperii disciplinaeque maiorum proprium est, facere nondum audeo, faciam id, quod est ad severitatem lenius et ad communem salutem utilius. Nam si te interfici iussero, residebit in re publica reliqua coniuratorum manus; sin tu, quod te iam dudum hortor, exieris, exhaurietur ex urbe tuorum comitum magna et perniciosa sentina rei publicae');
INSERT INTO `pgn_text` VALUES (100182, 'Quid est, Catilina? num dubitas id me imperante facere, quod iam tua sponte faciebas? Exire ex urbe iubet consul hostem. Interrogas me, num in exilium; non iubeo, sed, si me consulis, suadeo. Quid est enim, Catilina, quod te iam in hac urbe delectare possit? in qua nemo est extra istam coniurationem perditorum hominum, qui te non metuat, nemo, qui non oderit. Quae nota domesticae turpitudinis non inusta vitae tuae est? quod privatarum rerum dedecus non haeret in fama? quae lubido ab oculis, quod facinus a manibus umquam tuis, quod flagitium a toto corpore afuit? cui tu adulescentulo, quem corruptelarum inlecebris inretisses, non aut ad audaciam ferrum aut ad lubidinem facem praetulisti? [14] Quid vero? nuper cum morte superioris uxoris novis nuptiis domum vacuefecisses, nonne etiam alio incredibili scelere hoc scelus cumulasti? quod ego praetermitto et facile patior sileri, ne in hac civitate tanti facinoris inmanitas aut extitisse aut non vindicata esse videatur Praetermitto ruinas fortunarum tuarum, quas omnis inpendere tibi proxumis Idibus senties; ad illa venio, quae non ad privatam ignominiam vitiorum tuorum, non ad domesticam tuam difficultatem ac turpitudinem sed ad summam rem publicam atque ad omnium nostrum vitam salutemque pertinent.');
INSERT INTO `pgn_text` VALUES (100188, 'Potestne tibi haec lux, Catilina, aut huius caeli spiritus esse iucundus, cum scias esse horum neminem, qui nesciat te pridie Kalendas Ianuarias Lepido et Tullo consulibus stetisse in comitio cum telo, manum consulum et principum civitatis interficiendorum causa paravisse, sceleri ac furori tuo non mentem aliquam aut timorem tuum sed fortunam populi Romani obstitisse? Ac iam illa omitto (neque enim sunt aut obscura aut non multa commissa postea); quotiens tu me designatum, quotiens consulem interficere conatus es! quot ego tuas petitiones ita coniectas, ut vitari posse non viderentur, parva quadam declinatione et, ut aiunt, corpore effugi! nihil [agis, nihil] adsequeris [, nihil moliris] neque tamen conari ac velle desistis. [16] Quotiens tibi iam extorta est ista sica de manibus, quotiens [vero] excidit casu aliquo et elapsa est!9999');
INSERT INTO `pgn_text` VALUES (100218, 'quae quidem quibus abs te initiata sacris ac devota sit, nescio, quod eam necesse putas esse in consulis corpore defigere. Nunc vero quae tua est ista vita? Sic enim iam tecum loquar, non ut odio permotus esse videar, quo debeo, sed ut misericordia, quae tibi nulla debetur. Venisti paulo ante in senatum. Quis te ex hac tanta frequentia totque tuis amicis ac necessariis salutavit? Si hoc post hominum memoriam contigit nemini, vocis expectas contumeliam, cum sis gravissimo iudicio taciturnitatis oppressus? Quid, quod adventu tuo ista subsellia vacuefacta sunt, quod omnes consulares, qui tibi persaepe ad caedem constituti fuerunt, simul atque adsedisti, partem istam subselliorum nudam atque inanem reliquerunt, quo tandem animo [hoc] tibi ferundum putas?');
INSERT INTO `pgn_text` VALUES (100229, 'Servi mehercule mei si me isto pacto metuerent, ut te metuunt omnes cives tui, domum meam relinquendam putarem; tu tibi urbem non arbitraris? et, si me meis civibus iniuria suspectum tam graviter atque offensum viderem, carere me aspectu civium quam infestis omnium oculis conspici mallem; tu cum conscientia scelerum tuorum agnoscas odium omnium iustum et iam diu tibi debitum, dubitas, quorum mentes sensusque volneras, eorum aspectum praesentiamque vitare? Si te parentes timerent atque odissent tui neque eos ulla ratione placare posses, ut opinor, ab eorum oculis aliquo concederes. Nunc te patria, quae communis est parens omnium nostrum, odit ac metuit et iam diu nihil te iudicat nisi de parricidio suo cogitare; huius tu neque auctoritatem verebere nec iudicium sequere nec vim pertimesces? [18] Quae tecum, Catilina, sic agit et quodam modo tacita loquitur: `Nullum iam aliquot annis facinus exstitit nisi per te, nullum flagitium sine te; tibi uni multorum civium neces, tibi vexatio direptioque sociorum inpunita fuit ac libera; tu non solum ad neglegendas leges et quaestiones, verum etiam ad evertendas perfringendasque valuisti. Superiora illa, quamquam ferenda non fuerunt, tamen, ut potui, tuli; nunc vero me totam esse in metu propter unum te, quicquid increpuerit, Catilinam timeri, nullum videri contra me consilium iniri posse, quod a tuo scelere abhorreat, non est ferendum. Quam ob rem discede atque hunc mihi timorem eripe; si est verus, ne opprimar, sin falsus, ut tandem aliquando timere desinam.\'');
INSERT INTO `pgn_text` VALUES (100236, '<p><table cellspacing="1" cellpadding="1" width="100%" border="0"><tbody><tr><td><img height="237" src="http://localhost/nx2004/wwwdev/images/100113.jpg" width="150" align="top" border="0" /></td><td><font size="2">Haec si tecum, ita ut dixi, patria loquatur, nonne impetrare debeat, etiamsi vim adhibere non possit? Quid, quod tu te ipse in custodiam dedisti, quod vitandae suspicionis causa ad M\'. Lepidum te habitare velle dixisti? A quo non receptus etiam ad me venire ausus es atque, ut domi meae te adservarem, rogasti. Cum a me quoque id responsum tulisses, me nullo modo posse isdem parietibus tuto esse tecum, qui magno in periculo essem, quod isdem moenibus contineremur, ad Q. Metellum praetorem venisti. A quo repudiatus ad sodalem tuum, virum optumum, M. Metellum, demigrasti; quem tu videlicet et ad custodiendum diligentissimum et ad suspicandum sagacissimum et ad vindicandum fortissimum fore putasti. Sed quam longe videtur a carcere atque a vinculis abesse debere, qui se ipse iam dignum custodia iudicarit! [20] Quae cum ita sint, Catilina, dubitas, si emori aequo animo non potes, abire in aliquas terras et vitam istam multis suppliciis iustis debitisque ereptam fugae solitudinique mandare?</font></td></tr><tr><td></td><td></td></tr></tbody></table></p>');
INSERT INTO `pgn_text` VALUES (100243, 'Refer\', inquis, `ad senatum\'; id enim postulas et, si hic ordo [sibi] placere decreverit te ire in exilium, optemperaturum te esse dicis. Non referam, id quod abhorret a meis moribus, et tamen faciam, ut intellegas, quid hi de te sentiant. Egredere ex urbe, Catilina, libera rem publicam metu, in exilium, si hanc vocem exspectas, proficiscere. Quid est, Catilina? ecquid attendis, ecquid animadvertis horum silentium? Patiuntur, tacent. Quid exspectas auctoritatem loquentium, quorum voluntatem tacitorum perspicis? [21] At si hoc idem huic adulescenti optimo, P. Sestio, si fortissimo viro, M. Marcello, dixissem, iam mihi consuli hoc ipso in templo iure optimo senatus vim et manus intulisset. De te autem, Catilina, cum quiescunt, probant, cum patiuntur, decernunt, cum tacent, clamant, neque hi solum, quorum tibi auctoritas est videlicet cara, vita vilissima, sed etiam illi equites Romani, honestissimi atque optimi viri, ceterique fortissimi cives, qui circumstant senatum, quorum tu et frequentiam videre et studia perspicere et voces paulo ante exaudire potuisti. Quorum ego vix abs te iam diu manus ac tela contineo, eosdem facile adducam, ut te haec, quae vastare iam pridem studes, relinquentem usque ad portas prosequantur');
INSERT INTO `pgn_text` VALUES (100250, '<p></p>');
INSERT INTO `pgn_text` VALUES (100298, '<p><font size="2">Sie haben eine Seite im geschlossenen Bereich unserer Website aufgerufen. Bitte melden Sie sich zuerst im System mit ihrem Benutzernamen und Passwort an!</font></p>');
INSERT INTO `pgn_text` VALUES (100328, 'Informationen für Studierende und Mitarbeiter....');
INSERT INTO `pgn_text` VALUES (100335, '');
INSERT INTO `pgn_text` VALUES (100342, '<p>   </p><p><b>Vorläufige Ergebnisse der Klausur vom 28.7.2003</b></p><p></p><p><table cellspacing="0" cellpadding="0" border="0"><tbody><tr><td valign="top" width="247"><p>Teilnehmer </p></td><td valign="top" width="76"><p>12 </p></td></tr><tr><td valign="top" width="247"><p>Bestanden </p></td><td valign="top" width="76"><p>12 </p></td></tr><tr><td valign="top" width="247"><p>Durchgefallen </p></td><td valign="top" width="76"><p>0 </p></td></tr><tr><td valign="top" width="247"><p>Schnitt </p></td><td valign="top" width="76"><p>2,2 </p></td></tr></tbody></table></p><p><br />Die Klausureinsicht findet am 12. September von 14.00 bis 16.00h im Raum F112 statt.</p><p></p><p><table cellspacing="0" cellpadding="0" border="1"><tbody><tr><td valign="top" width="154"><p><b>Martrikelnummer</b></p></td><td valign="top" width="154"><p><b>Note</b></p></td><td valign="top" width="154"><p><b>Martrikelnummer</b></p></td><td valign="top" width="154"><p><b>Note</b></p></td></tr><tr><td valign="top" width="154"><p>55654</p></td><td valign="top" width="154"><p>2,0</p></td><td valign="top" width="154"><p>55478</p></td><td valign="top" width="154"><p>2,0</p></td></tr><tr><td valign="top" width="154"><p>55489</p></td><td valign="top" width="154"><p>1,3</p></td><td valign="top" width="154"><p>55499</p></td><td valign="top" width="154"><p>3,7</p></td></tr><tr><td valign="top" width="154"><p>55223</p></td><td valign="top" width="154"><p>1,7</p></td><td valign="top" width="154"><p>55669</p></td><td valign="top" width="154"><p>4,0</p></td></tr><tr><td valign="top" width="154"><p>55441</p></td><td valign="top" width="154"><p>2,7</p></td><td valign="top" width="154"><p>55442</p></td><td valign="top" width="154"><p>2,3</p></td></tr><tr><td valign="top" width="154"><p>55668</p></td><td valign="top" width="154"><p>2,7</p></td><td valign="top" width="154"><p>55447</p></td><td valign="top" width="154"><p>3,3</p></td></tr></tbody></table></p>');
INSERT INTO `pgn_text` VALUES (100307, '<P DESIGNTIMESP="12203">1. Content <BR>The author reserves the right not to be responsible for the topicality, correctness, completeness or quality of the information provided. Liability claims regarding damage caused by the use of any information provided, including any kind of information which is incomplete or incorrect,will therefore be rejected. <BR>All offers are not-binding and without obligation. Parts of the pages or the complete publication including all offers and information might be extended, changed or partly or completely deleted by the author without separate announcement. <BR><BR>2. Referrals and links <BR>The author is not responsible for any contents linked or referred to from his pages - unless he has full knowledge of illegal contents and would be able to prevent the visitors of his site fromviewing those pages. If any damage occurs by the use of information presented there, only the author of the respective pages might be liable, not the one who has linked to these pages. Furthermore the author is not liable for any postings or messages published by users of discussion boards, guestbooks or mailinglists provided on his page. <BR><BR>3. Copyright <BR>The author intended not to use any copyrighted material for the publication or, if not possible, to indicatethe copyright of the respective object. <BR>The copyright for any material created by the author is reserved. Any duplication or use of objects such as diagrams, sounds or texts in other electronic or printed publications is not permitted without the author\'s agreement. <BR><BR>4. Privacy policy <BR>If the opportunity for the input of personal or business data (email addresses, name, addresses) is given, the input of these data takes place voluntarily. The use and payment of all offered services are permitted - if and so far technically possible and reasonable - without specification of any personal data or under specification of anonymized data or an alias. The use of published postal addresses, telephone or fax numbers and email addresses for marketing purposes is prohibited, offenders sending unwanted spam messages will be punished. <BR><BR>5. Legal validity of this disclaimer <BR>This disclaimer is to be regarded as part of the internet publication which you were referred from. If sections or individual terms of this statement are not legal or correct, the content or validity of the other parts remain uninfluenced by this fact. <BR><BR><BR>6. N/X is a project hosted at Sourceforge.net. For any questions contact Sven Weih (E-Mail: sven_at_nxsystems.org). </P>');
INSERT INTO `pgn_text` VALUES (101868, '<P DESIGNTIMESP="14160">After&nbsp;two years of developments, we have almost finished the developments of N/X 4.0.&nbsp;The new website was built on N/X 4.0.&nbsp;</P>');
INSERT INTO `pgn_text` VALUES (101869, '<P DESIGNTIMESP="14166">The getting started guide and installation manuals are already available for online reading. Take a look at them to get a clue, what was changed in N/X 4.0.</P>\r\n<P DESIGNTIMESP="14167">The new website was designed to give you an idea, what you can do with N/X 4.0. We focused on the N/X tour and online documentation to give you as much information as possible. Enjoy our new site.</P>');
INSERT INTO `pgn_text` VALUES (101157, '<P DESIGNTIMESP="7615"><STRONG DESIGNTIMESP="7616"><FONT size=3 DESIGNTIMESP="7617">Server Requirements</FONT></STRONG></P>\r\n<P DESIGNTIMESP="7615"><STRONG><FONT size=3></FONT></STRONG>&nbsp;</P>\r\n<P DESIGNTIMESP="7618">N/X is optimized to run with minimal system requirements, so you should be able to use it with almost any webspace provider with PHP4 or PHP 5 support&nbsp;and MySQL installed.<BR DESIGNTIMESP="7619"><BR DESIGNTIMESP="7620"><B DESIGNTIMESP="7621">PHP-Requirements</B><BR DESIGNTIMESP="7622">You need PHP Version 4.3.0 or higher.<BR DESIGNTIMESP="7623">N/X may work with older versions of PHP. Officialliy there&nbsp;will be&nbsp;no support.<BR DESIGNTIMESP="7624"><a HREF="http://www.php.net/" TARGET="_blank" DESIGNTIMESP="7625">Visit the PHP-Homepage</A><BR DESIGNTIMESP="7626"><BR DESIGNTIMESP="7627"><B DESIGNTIMESP="7628">MySQL-Requirements</B><BR DESIGNTIMESP="7629">You need MySQL Version 3.23 or later.<BR DESIGNTIMESP="7630"><a HREF="http://www.mysql.com/" TARGET="_blank" DESIGNTIMESP="7631">Visit the MySQL-Homepage</A><BR DESIGNTIMESP="7632"><BR DESIGNTIMESP="7633"><B DESIGNTIMESP="7634">Apache Web-Server-Requirements</B><BR DESIGNTIMESP="7635">You need Apache Version 1.3 or later.<BR DESIGNTIMESP="7636"><a HREF="http://www.apache.org/" TARGET="_blank" DESIGNTIMESP="7637">Visit the Apache-Homepage</A><BR DESIGNTIMESP="7638"><BR DESIGNTIMESP="7639"></P><STRONG DESIGNTIMESP="7641">\r\n<P DESIGNTIMESP="7640"><BR DESIGNTIMESP="7642"><FONT size=3 DESIGNTIMESP="7643">Client Requirements</FONT></P>\r\n<P DESIGNTIMESP="7640"></STRONG>&nbsp;</P>\r\n<P DESIGNTIMESP="7644"><STRONG DESIGNTIMESP="7645">Webbrowser for accessing the backend</STRONG><BR DESIGNTIMESP="7646">Internet Explorer 6+ (all features)<BR DESIGNTIMESP="7647">Opera 6+ (no richtext editor)<BR DESIGNTIMESP="7648">Mozilla 1.0+ (no richtext editor)<BR DESIGNTIMESP="7649">Netscape 7.0+ (no richtext editor)<BR DESIGNTIMESP="7650">Firefox 1.0+ (no richtext editor)</P>');
INSERT INTO `pgn_text` VALUES (100808, '');
INSERT INTO `pgn_text` VALUES (100259, '<p>Our Company<br />Our Company Road 2<br />777555 CompCity<br /><br />E-Mail: company@demo</p>');
INSERT INTO `pgn_text` VALUES (100267, 'Nunc, ut a me, patres conscripti, quandam prope iustam patriae querimoniam detester ac deprecer, percipite, quaeso, diligenter, quae dicam, et ea penitus animis vestris mentibusque mandate. Etenim, si mecum patria, quae mihi vita mea multo est carior, si cuncta Italia, si omnis res publica loquatur: `M. Tulli, quid agis? Tune eum, quem esse hostem comperisti, quem ducem belli futurum vides, quem expectari imperatorem in castris hostium sentis, auctorem sceleris, principem coniurationis, evocatorem servorum et civium perditorum, exire patiere, ut abs te non emissus ex urbe, sed immissus in urbem esse videatur? Nonne hunc in vincla duci, non ad mortem rapi, non summo supplicio mactari imperabis? [28] Quid tandem te impedit? mosne maiorum? At persaepe etiam privati in hac re publica perniciosos cives morte multarunt. An leges, quae de civium Romanorum supplicio rogatae sunt? At numquam in hac urbe, qui a re publica defecerunt, civium iura tenuerunt. An invidiam posteritatis times? Praeclaram vero populo Romano refers gratiam, qui te, hominem per te cognitum nulla commendatione maiorum tam mature ad summum imperium per omnis honorum gradus extulit, si propter invidiam aut alicuius periculi metum salutem civium tuorum neglegis.');
INSERT INTO `pgn_text` VALUES (100269, '<p>Our Company<br />Company Drive 6<br />666555 Company City<br /><br />E-Mail: company@demo</p>');
INSERT INTO `pgn_text` VALUES (100293, '');
INSERT INTO `pgn_text` VALUES (100305, 'L. Sergius Catilina, homo patricii generis, magna vi et animi et corporis, sed ingenio malo pravoque, praetorius, qui iam a. u. c. 689 caedem consulum facere eaque facta rerum potiri constituerat, casu autem rem perficere prohibitus erat, ascitis ad consilium rei publicae opprimendae hominibus omnis generis perditissiis atque audacissimis, quos inopia, cupiditas, scelera stimulabant, consulatum in annum 691 p. u. c. petivit, sed cum, quae in animo habebat, perniciosa rei publicae consilia parum occultata essent, studiis bonorum omnium M. Tullius Cicero una cum C. Antonio consul factus est. Qua re commotus L. Catilina M. Cicerone C. Antonio consulibus cupidius etiam sua consilia recepit, quibus maxime Ciceronis consulis diligentia restitit ad quem Catilinae eiusque sociorum consilia a Fulvia, muliere nobili, quae rem habebat cum Q. Curio, qui particeps fuit conspirationis illius, deferebantur. Cum autem ista mala consilia contra salutem rei publicae a coniuratis inita apertius iam agitarentur, senatus consultum factum est, darent operam consules, ne quid res publica detrimenti caperet, effectumque est, ut Catilina spe consulatus, quem in proximum annum petebat, excideret, designarenturque D. Silanus et L. Murena. Quae cum ita essent, L. Catilina, qui iam ante per Italiam ad homines seditiosos, maxime veteres L. Sullae milites, concitandos nuntios miserat, ad C. Manlium, qui Faesulas, in urbem Etruriae munitam, manum armatorum coegerat, proficisci constituit et bellum patriae inferre convocatisque nocte, quae inter VIII et VII Id. Novembres erat, sociis in domum M. Porci Laecae consilium, quod ceperat, aperuit. Qua in congregatione nocturna duo equites Romani Ciceronem consulem illa ipsa nocte ante lucem, cum sicut salutaturi eius domum intrassent, interficiendum receperunt. M. Cicero vitatis insidiis proximo die, qui fuit a. d. VI Id. Novembres, dispositis praesidiis senatum in templum Iovis Statoris convocavit, quo cum Catilina quasi sui purgandi causa venisset, Cicero eam, quae infra legitur, orationem in Catilinam vehementissime invehens habuit.');
INSERT INTO `pgn_text` VALUES (100323, 'Quo usque tandem abutere, Catilina, patientia nostra? quam diu etiam furor iste tuus nos eludet? quem ad finem sese effrenata iactabit audacia? Nihilne te nocturnum praesidium Palati, nihil urbis vigiliae, nihil timor populi, nihil concursus bonorum omnium, nihil hic munitissimus habendi senatus locus, nihil horum ora voltusque moverunt? Patere tua consilia non sentis, constrictam iam horum omnium scientia teneri coniurationem tuam non vides? Quid proxima, quid superiore nocte egeris, ubi fueris, quos convocaveris, quid consilii ceperis, quem nostrum ignorare arbitraris?');
INSERT INTO `pgn_text` VALUES (100336, 'Decrevit quondam senatus, ut L. Opimius consul videret, ne quid res publica detrimenti caperet; nox nulla intercessit; interfectus est propter quasdam seditionum suspiciones C. Gracchus, clarissimo patre, avo, maioribus, occisus est cum liberis M. Fulvius consularis. Simili senatus consulto C. Mario et L. Valerio consulibus est permissa res publica; num unum diem postea L. Saturninum tribunum pl. et C. Servilium praetorem mors ac rei publicae poena remorata est? At [vero] nos vicesimum iam diem patimur hebescere aciem horum auctoritatis. Habemus enim huiusce modi senatus consultum, verum inclusum in tabulis tamquam in vagina reconditum, quo ex senatus consulto confestim te interfectum esse, Catilina, convenit. Vivis, et vivis non ad deponendam, sed ad confirmandam audaciam. Cupio, patres conscripti, me esse clementem, cupio in tantis rei publicae periculis me non dissolutum videri, sed iam me ipse inertiae nequitiaeque condemno. [5] Castra sunt in Italia contra populum Romanum in Etruriae faucibus conlocata, crescit in dies singulos hostium numerus; eorum autem castrorum imperatorem ducemque hostium intra moenia atque adeo in senatu videmus intestinam aliquam cotidie perniciem rei publicae molientem. Si te iam, Catilina, comprehendi, si interfici iussero, credo, erit verendum mihi, ne non potius hoc omnes boni serius a me quam quisquam crudelius factum esse dicat. Verum ego hoc, quod iam pridem factum esse oportuit, certa de causa nondum adducor ut faciam. Tum denique interficiere, cum iam nemo tam inprobus, tam perditus, tam tui similis inveniri poterit, qui id non iure factum esse fateatur. [6] Quamdiu quisquam erit, qui te defendere audeat, vives, et vives ita, ut [nunc] vivis. multis meis et firmis praesidiis obsessus, ne commovere te contra rem publicam possis. Multorum te etiam oculi et aures non sentientem, sicut adhuc fecerunt, speculabuntur atque custodient.');
INSERT INTO `pgn_text` VALUES (100344, '<p>Etenim quid est, Catilina, quod iam amplius expectes, si neque nox tenebris obscurare coeptus nefarios nec privata domus parietibus continere voces coniurationis tuae potest, si illustrantur, si erumpunt omnia? Muta iam istam mentem, mihi crede, obliviscere caedis atque incendiorum. Teneris undique; luce sunt clariora nobis tua consilia omnia; quae iam mecum licet recognoscas. [7] Meministine me ante diem XII Kalendas Novembris dicere in senatu fore in armis certo die, qui dies futurus esset ante diem VI Kal. Novembris, C. Manlium, audaciae satellitem atque administrum tuae? Num me fefellit, Catilina, non modo res tanta, tam atrox tamque incredibilis, verum, id quod multo magis est admirandum, dies? Dixi ego idem in senatu caedem te optumatium contulisse in ante diem V Kalendas Novembris, tum cum multi principes civitatis Roma non tam sui conservandi quam tuorum consiliorum reprimendorum causa profugerunt. Num infitiari potes te illo ipso die meis praesidiis, mea diligentia circumclusum commovere te contra rem publicam non potuisse, cum tu discessu ceterorum nostra tamen, qui remansissemus, caede te contentum esse dicebas? [8] Quid? cum te Praeneste Kalendis ipsis Novembribus occupaturum nocturno impetu esse confideres, sensistin illam coloniam meo iussu meis praesidiis, custodiis, vigiliis esse munitam? Nihil agis, nihil moliris, nihil cogitas, quod non ego non modo audiam, sed etiam videam planeque sentiam. Recognosce tandem mecum noctem illam superiorem; iam intelleges multo me vigilare acrius ad salutem quam te ad perniciem rei publicae. Dico te priore nocte venisse inter falcarios (non agam obscure) in M. Laecae domum; convenisse eodem complures eiusdem amentiae scelerisque socios. Num negare audes? quid taces? Convincam, si negas. Video enim esse hic in senatu quosdam, qui tecum una fuerunt. [9] O di inmortales! ubinam gentium sumus? in qua urbe vivimus? quam rem publicam habemus? Hic, hic sunt in nostro numero, patres conscripti, in hoc orbis terrae sanctissimo gravissimoque consilio, qui de nostro omnium interitu, qui de huius urbis atque adeo de orbis terrarum exitio cogitent! Hos ego video consul et de re publica sententiam rogo et, quos ferro trucidari oportebat, eos nondum voce volnero! Fuisti igitur apud Laecam illa nocte, Catilina, distribuisti partes Italiae, statuisti, quo quemque proficisci placeret, delegisti, quos Romae relinqueres, quos tecum educeres, discripsisti urbis partes ad incendia, confirmasti te ipsum iam esse exiturum, dixisti paulum tibi esse etiam nunc morae, quod ego viverem. Reperti sunt duo equites Romani, qui te ista cura liberarent et sese illa ipsa nocte paulo ante lucem me in meo lectulo interfecturos [esse] pollicerentur. [10] Haec ego omnia vixdum etiam coetu vestro dimisso comperi; domum meam maioribus praesidiis munivi atque firmavi, exclusi eos, quos tu ad me salutatum mane miseras, cum illi ipsi venissent, quos ego iam multis ac summis viris ad me id temporis venturos esse praedixeram. </p>');
INSERT INTO `pgn_text` VALUES (100349, '<p>   </p><p><b>Vorläufige Ergebnisse der Klausur vom 28.7.2003</b></p><p></p><p><table cellspacing="0" cellpadding="0" border="0"><tbody><tr><td valign="top" width="247"><p>Teilnehmer </p></td><td valign="top" width="76"><p>12 </p></td></tr><tr><td valign="top" width="247"><p>Bestanden </p></td><td valign="top" width="76"><p>12 </p></td></tr><tr><td valign="top" width="247"><p>Durchgefallen </p></td><td valign="top" width="76"><p>0 </p></td></tr><tr><td valign="top" width="247"><p>Schnitt </p></td><td valign="top" width="76"><p>2,2 </p></td></tr></tbody></table></p><p><br />Die Klausureinsicht findet am 12. September von 14.00 bis 16.00h im Raum F112 statt.</p><p></p><p><table cellspacing="0" cellpadding="0" border="1"><tbody><tr><td valign="top" width="154"><p><b>Martrikelnummer</b></p></td><td valign="top" width="154"><p><b>Note</b></p></td><td valign="top" width="154"><p><b>Martrikelnummer</b></p></td><td valign="top" width="154"><p><b>Note</b></p></td></tr><tr><td valign="top" width="154"><p>55654</p></td><td valign="top" width="154"><p>2,0</p></td><td valign="top" width="154"><p>55478</p></td><td valign="top" width="154"><p>2,0</p></td></tr><tr><td valign="top" width="154"><p>55489</p></td><td valign="top" width="154"><p>1,3</p></td><td valign="top" width="154"><p>55499</p></td><td valign="top" width="154"><p>3,7</p></td></tr><tr><td valign="top" width="154"><p>55223</p></td><td valign="top" width="154"><p>1,7</p></td><td valign="top" width="154"><p>55669</p></td><td valign="top" width="154"><p>4,0</p></td></tr><tr><td valign="top" width="154"><p>55441</p></td><td valign="top" width="154"><p>2,7</p></td><td valign="top" width="154"><p>55442</p></td><td valign="top" width="154"><p>2,3</p></td></tr><tr><td valign="top" width="154"><p>55668</p></td><td valign="top" width="154"><p>2,7</p></td><td valign="top" width="154"><p>55447</p></td><td valign="top" width="154"><p>3,3</p></td></tr></tbody></table></p>');
INSERT INTO `pgn_text` VALUES (100578, '<P>&nbsp;</P>');
INSERT INTO `pgn_text` VALUES (100629, '<P>&nbsp;</P>');
INSERT INTO `pgn_text` VALUES (100721, '<P>Want to know something special? Try searching our FAQ-Database.</P>');
INSERT INTO `pgn_text` VALUES (100745, '<P>You did not find the answer to your questions? Ask a Question and we will try to reply in our FAQ-database soon!</P>');
INSERT INTO `pgn_text` VALUES (100758, '<P>The startpage of your website is found with the&nbsp;$cds-&gt;menu-&gt;getStartPage() method. The method returns a new Menu-Interface of the startpage. This means you can work with it like $startpage-&gt;lowerLevel() for getting all its child-menues.</P>');
INSERT INTO `pgn_text` VALUES (100773, '<P>Want to know something special? Try searching our FAQ-Database.</P>');
INSERT INTO `pgn_text` VALUES (100788, '<P>You did not find the answer to your questions? Ask a Question and we will try to reply in our FAQ-database soon!</P>');
INSERT INTO `pgn_text` VALUES (100376, 'Haec si tecum, ita ut dixi, patria loquatur, nonne impetrare debeat, etiamsi vim adhibere non possit? Quid, quod tu te ipse in custodiam dedisti, quod vitandae suspicionis causa ad M\'. Lepidum te habitare velle dixisti? A quo non receptus etiam ad me venire ausus es atque, ut domi meae te adservarem, rogasti. Cum a me quoque id responsum tulisses, me nullo modo posse isdem parietibus tuto esse tecum, qui magno in periculo essem, quod isdem moenibus contineremur, ad Q. Metellum praetorem venisti. A quo repudiatus ad sodalem tuum, virum optumum, M. Metellum, demigrasti; quem tu videlicet et ad custodiendum diligentissimum et ad suspicandum sagacissimum et ad vindicandum fortissimum fore putasti. Sed quam longe videtur a carcere atque a vinculis abesse debere, qui se ipse iam dignum custodia iudicarit! [20] Quae cum ita sint, Catilina, dubitas, si emori aequo animo non potes, abire in aliquas terras et vitam istam multis suppliciis iustis debitisque ereptam fugae solitudinique mandare?');
INSERT INTO `pgn_text` VALUES (100388, 'Quamquam quid loquor? te ut ulla res frangat, tu ut umquam te corrigas, tu ut ullam fugam meditere, tu ut ullum exilium cogites? Utinam tibi istam mentem di inmortales duint! tametsi video, si mea voce perterritus ire in exilium animum induxeris quanta tempestas invidiae nobis, si minus in praesens tempus recenti memoria scelerum tuorum, at in posteritatem impendeat. Sed est tanti, dum modo ista sit privata calamitas et a rei publicae periculis seiungatur. Sed tu ut vitiis tuis commoveare, ut legum poenas pertimescas, ut temporibus rei publicae cedas, non est postulandum. Neque enim is es, Catilina, ut te aut pudor umquam a turpitudine aut metus a periculo aut ratio a furore revocarit. [23] Quam ob rem, ut saepe iam dixi, proficiscere ac, si mihi inimico, ut praedicas, tuo conflare vis invidiam, recta perge in exilium; vix feram sermones hominum, si id feceris, vix molem istius invidiae, si in exilium iussu consulis ieris, sustinebo. Sin autem servire meae laudi et gloriae mavis, egredere cum inportuna sceleratorum manu, confer te ad Manlium, concita perditos cives, secerne te a bonis, infer patriae bellum, exsulta impio latrocinio, ut a me non eiectus ad alienos, sed invitatus ad tuos isse videaris. [24] Quamquam quid ego te invitem, a quo iam sciam esse praemissos, qui tibi ad Forum Aurelium praestolarentur armati, cui iam sciam pactam et constitutam cum Manlio diem, a quo etiam aquilam illam argenteam, quam tibi ac tuis omnibus confido perniciosam ac funestam futuram, cui domi tuae sacrarium [scelerum tuorum] constitutum fuit, sciam esse praemissam? Tu ut illa carere diutius possis, quam venerari ad caedem proficiscens solebas, a cuius altaribus saepe istam impiam dexteram ad necem civium transtulisti?');
INSERT INTO `pgn_text` VALUES (100394, '<p>FH Gießen Friedberg<br />Fachbereich MNI<br />Wiesenstr. 14<br />35390 Gießen</p>');
INSERT INTO `pgn_text` VALUES (100415, '<p align="center"><img height="317" src="http://localhost/nx2004/wwwdev/images/100066.jpg" width="363" border="0" /></p>');
INSERT INTO `pgn_text` VALUES (100431, 'Hier finden Sie allgemeine Informationen zum Fachbereich MNI an der FH Gießen-Friedberg.');
INSERT INTO `pgn_text` VALUES (100437, '<font size="2">Am Fachbereich MNI werden drei Studiengänge angeboten. Informatik als grundständiger Diplomstudiengang, der Aufbaustudiengang Strahlenschutz und -messtechnik und der Aufbaustudiengang Technische Redaktion &amp; Multimediale Dokumentation. Darüber hinaus werden Grundlagen in Mathematik und Naturwissenschaften für Studierende aller Gießener Fachbereiche vermittelt.</font>');
INSERT INTO `pgn_text` VALUES (100453, '');
INSERT INTO `pgn_text` VALUES (100409, 'Ibis tandem aliquando, quo te iam pridem ista tua cupiditas effrenata ac furiosa rapiebat; neque enim tibi haec res adfert dolorem, sed quandam incredibilem voluptatem. Ad hanc te amentiam natura peperit, voluntas exercuit, fortuna servavit. Numquam tu non modo otium, sed ne bellum quidem nisi nefarium concupisti. Nactus es ex perditis atque ab omni non modo fortuna, verum etiam spe derelictis conflatam inproborum manum. [26] Hic tu qua laetitia perfruere, quibus gaudiis exultabis, quanta in voluptate bacchabere, cum in tanto numero tuorum neque audies virum bonum quemquam neque videbis! Ad huius vitae studium meditati illi sunt, qui feruntur, labores tui, iacere humi non solum ad obsidendum stuprum, verum etiam ad facinus obeundum, vigilare non solum insidiantem somno maritorum, verum etiam bonis otiosorum. Habes, ubi ostentes tuam illam praeclaram patientiam famis, frigoris, inopiae rerum omnium, quibus te brevi tempore confectum esse senties. [27] Tantum profeci tum, cum te a consulatu reppuli, ut exsul potius temptare quam consul vexare rem publicam posses, atque ut id, quod esset a te scelerate susceptum, latrocinium potius quam bellum nominaretur.');
INSERT INTO `pgn_text` VALUES (100411, '<p>Our Company<br />Our Company Road 2<br />777555 CompCity<br /><br />E-Mail: company@demo</p>');
INSERT INTO `pgn_text` VALUES (100418, '');
INSERT INTO `pgn_text` VALUES (100424, 'Nunc, ut a me, patres conscripti, quandam prope iustam patriae querimoniam detester ac deprecer, percipite, quaeso, diligenter, quae dicam, et ea penitus animis vestris mentibusque mandate. Etenim, si mecum patria, quae mihi vita mea multo est carior, si cuncta Italia, si omnis res publica loquatur: `M. Tulli, quid agis? Tune eum, quem esse hostem comperisti, quem ducem belli futurum vides, quem expectari imperatorem in castris hostium sentis, auctorem sceleris, principem coniurationis, evocatorem servorum et civium perditorum, exire patiere, ut abs te non emissus ex urbe, sed immissus in urbem esse videatur? Nonne hunc in vincla duci, non ad mortem rapi, non summo supplicio mactari imperabis? [28] Quid tandem te impedit? mosne maiorum? At persaepe etiam privati in hac re publica perniciosos cives morte multarunt. An leges, quae de civium Romanorum supplicio rogatae sunt? At numquam in hac urbe, qui a re publica defecerunt, civium iura tenuerunt. An invidiam posteritatis times? Praeclaram vero populo Romano refers gratiam, qui te, hominem per te cognitum nulla commendatione maiorum tam mature ad summum imperium per omnis honorum gradus extulit, si propter invidiam aut alicuius periculi metum salutem civium tuorum neglegis.');
INSERT INTO `pgn_text` VALUES (100426, '<p>Our Company<br />Company Drive 6<br />666555 Company City<br /><br />E-Mail: company@demo</p>');
INSERT INTO `pgn_text` VALUES (100465, 'quae quidem quibus abs te initiata sacris ac devota sit, nescio, quod eam necesse putas esse in consulis corpore defigere. Nunc vero quae tua est ista vita? Sic enim iam tecum loquar, non ut odio permotus esse videar, quo debeo, sed ut misericordia, quae tibi nulla debetur. Venisti paulo ante in senatum. Quis te ex hac tanta frequentia totque tuis amicis ac necessariis salutavit? Si hoc post hominum memoriam contigit nemini, vocis expectas contumeliam, cum sis gravissimo iudicio taciturnitatis oppressus? Quid, quod adventu tuo ista subsellia vacuefacta sunt, quod omnes consulares, qui tibi persaepe ad caedem constituti fuerunt, simul atque adsedisti, partem istam subselliorum nudam atque inanem reliquerunt, quo tandem animo [hoc] tibi ferundum putas?');
INSERT INTO `pgn_text` VALUES (100495, '');
INSERT INTO `pgn_text` VALUES (100502, '');
INSERT INTO `pgn_text` VALUES (100504, 'Informationen über unsere Forschungsprojekte...');
INSERT INTO `pgn_text` VALUES (100511, '');
INSERT INTO `pgn_text` VALUES (100513, '');
INSERT INTO `pgn_text` VALUES (100523, '');
INSERT INTO `pgn_text` VALUES (100529, '');
INSERT INTO `pgn_text` VALUES (100561, '');
INSERT INTO `pgn_text` VALUES (100565, '');
INSERT INTO `pgn_text` VALUES (100567, '');
INSERT INTO `pgn_text` VALUES (100573, '<p>Hallo, ich bin der Peter</p><p><img src="http://www.worms-wonnegau.de/B_B/2002_Korsika/Bild_2002_Korsika-29/2002-Korsika-29.jpg" border="0" /></p>');
INSERT INTO `pgn_text` VALUES (100601, '');
INSERT INTO `pgn_text` VALUES (100612, '');
INSERT INTO `pgn_text` VALUES (100636, '');
INSERT INTO `pgn_text` VALUES (100649, '');
INSERT INTO `pgn_text` VALUES (100651, '');
INSERT INTO `pgn_text` VALUES (100669, '');
INSERT INTO `pgn_text` VALUES (100760, '');
INSERT INTO `pgn_text` VALUES (101012, 'test');
INSERT INTO `pgn_text` VALUES (101162, 'Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.');
INSERT INTO `pgn_text` VALUES (101299, 'Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2');
INSERT INTO `pgn_text` VALUES (101304, 'Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3');
INSERT INTO `pgn_text` VALUES (101329, '<P>Please take yourself one day of time to learn N/X with our Getting Started tutorial. After learning you will be able to create your own fascinating websites with the help of the N/X APIs.</P>\r\n<P>&nbsp;</P>\r\n<UL>\r\n<LI><a HREF="http://www.nxsystems.org/manuals/NXGettingStartedEN.html" TARGET="_blank">Getting Started (ENGLISH)</A></LI>\r\n<LI><a HREF="http://www.nxsystems.org/manuals/NXGettingStartedDE.html" TARGET="_blank">Getting Started (GERMAN)</A></LI></UL>');
INSERT INTO `pgn_text` VALUES (101379, 'Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.');
INSERT INTO `pgn_text` VALUES (101387, 'Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.');
INSERT INTO `pgn_text` VALUES (101390, 'Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2');
INSERT INTO `pgn_text` VALUES (101398, 'test');
INSERT INTO `pgn_text` VALUES (101404, 'Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3');
INSERT INTO `pgn_text` VALUES (101415, 'Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.Der Body. Irgend ein Blindtext.');
INSERT INTO `pgn_text` VALUES (101421, 'Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2 Test Sven 2');
INSERT INTO `pgn_text` VALUES (101425, 'Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3Sven 3 SVen 3');
INSERT INTO `pgn_text` VALUES (101459, '');
INSERT INTO `pgn_text` VALUES (101461, '');
INSERT INTO `pgn_text` VALUES (101541, '<P>After exporting the data the wizard shows a summary.</P>');
INSERT INTO `pgn_text` VALUES (101547, '');
INSERT INTO `pgn_text` VALUES (101551, '');
INSERT INTO `pgn_text` VALUES (101647, '');
INSERT INTO `pgn_text` VALUES (101654, '');
INSERT INTO `pgn_text` VALUES (101659, 'Wir wünschens uns auf jeden Fall schon einmal...');
INSERT INTO `pgn_text` VALUES (101664, '');
INSERT INTO `pgn_text` VALUES (101705, 'test test test');
INSERT INTO `pgn_text` VALUES (101728, 'test test test');
INSERT INTO `pgn_text` VALUES (102358, 'blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...');
INSERT INTO `pgn_text` VALUES (102363, 'blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...blah blah blah...');
INSERT INTO `pgn_text` VALUES (102371, '');
INSERT INTO `pgn_text` VALUES (113720, '<p>Heidi, Heidi, diene Welte sind die Berge... Heidi, Heidi, diene Welte sind die Berge...</p><p>Heidi, Heidi, diene Welte sind die Berge...Heidi, Heidi, diene Welte sind die Berge...Heidi, Heidi, diene Welte sind die Berge...Heidi, Heidi, diene Welte sind die Berge...Heidi, Heidi, diene Welte sind die Berge...</p><p>Heidi, Heidi, diene Welte sind die Berge...Heidi, Heidi, diene Welte sind die Berge...Heidi, Heidi, diene Welte sind die Berge...Heidi, Heidi, diene Welte sind die Berge...Heidi, Heidi, diene Welte sind die Berge...Heidi, Heidi, diene Welte sind die Berge...Heidi, Heidi, diene Welte sind die Berge...Heidi, Heidi, diene Welte sind die Berge...Heidi, Heidi, diene Welte sind die Berge...Heidi, Heidi, diene Welte sind die Berge...Heidi, Heidi, diene Welte sind die Berge...Heidi, Heidi, diene Welte sind die Berge...</p>');
INSERT INTO `pgn_text` VALUES (113739, 'Die Bayern haben knapp gewonnen. Yippie Yeah!');
INSERT INTO `pgn_text` VALUES (113745, 'Die Bayern haben knapp gewonnen. Yippie Yeah!');
INSERT INTO `pgn_text` VALUES (113779, '');
INSERT INTO `pgn_text` VALUES (113803, 'blai... blai...blai...blai...blai...blai...blai...blai...blai...blai...blai...blai...blai...blai...blai...blai...blai...blai...blai...blai...blai...blai...blai...blai...blai...blai...blai...blai...blai...blai...blai...blai...blai...blai...blai...blai...blai...blai...blai...blai...blai...blai...blai...blai...blai...blai...blai...blai...');
INSERT INTO `pgn_text` VALUES (113811, 'Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser! Ein lóoser!');
INSERT INTO `pgn_text` VALUES (100020, 'Ihre Suche lieferte folgendes Ergebnis:');
INSERT INTO `pgn_text` VALUES (100062, '<p align="center"><img height="317" src="http://localhost/nx2004/wwwdev/images/100066.jpg" width="363" border="0" /></p>');
INSERT INTO `pgn_text` VALUES (100075, '');
INSERT INTO `pgn_text` VALUES (100081, '<font size="2">Ipse loco medius rerum novitate paventem<br />Sol oculis iuvenem, quibus adspicit omnia, vidit<br />\'quae\' que \'viae tibi causa? quid hac\' ait \'arce petisti,<br />progenies, Phaethon, haud infitianda parenti?\'<br />ille refert: \'o lux inmensi publica mundi,               <br />Phoebe pater, si das usum mihi nominis huius,<br />nec falsa Clymene culpam sub imagine celat,<br />pignora da, genitor, per quae tua vera propago<br />credar, et hunc animis errorem detrahe nostris!\'<br />dixerat, at genitor circum caput omne micantes               <br />deposuit radios propiusque accedere iussit<br />amplexuque dato \'nec tu meus esse negari<br />dignus es, et Clymene veros\' ait \'edidit ortus,<br />quoque minus dubites, quodvis pete munus, ut illud<br />me tribuente feras! promissi testis adesto               <br />dis iuranda palus, oculis incognita nostris!\'<br />vix bene desierat, currus rogat ille paternos<br />inque diem alipedum ius et moderamen equorum.<br /></font>');
INSERT INTO `pgn_text` VALUES (100087, '<p><font size="2">Regia Solis erat sublimibus alta columnis,<br />clara micante auro flammasque imitante pyropo,<br />cuius ebur nitidum fastigia summa tegebat,<br />argenti bifores radiabant lumine valvae.<br />materiam superabat opus: nam Mulciber illic               5<br />aequora caelarat medias cingentia terras<br />terrarumque orbem caelumque, quod imminet orbi.<br />caeruleos habet unda deos, Tritona canorum<br />Proteaque ambiguum ballaenarumque prementem<br />Aegaeona suis inmania terga lacertis               10<br />Doridaque et natas, quarum pars nare videtur,<br />pars in mole sedens viridis siccare capillos,<br />pisce vehi quaedam: facies non omnibus una,<br />non diversa tamen, qualem decet esse sororum.<br />terra viros urbesque gerit silvasque ferasque               15<br />fluminaque et nymphas et cetera numina ruris.<br />haec super inposita est caeli fulgentis imago,<br />signaque sex foribus dextris totidemque sinistris.<br />    Quo simul adclivi Clymeneia limite proles<br />venit et intravit dubitati tecta parentis,               20<br />protinus ad patrios sua fert vestigia vultus<br />consistitque procul; neque enim propiora ferebat<br />lumina: purpurea velatus veste sedebat<br />in solio Phoebus claris lucente smaragdis.<br />a dextra laevaque Dies et Mensis et Annus               25<br />Saeculaque et positae spatiis aequalibus Horae<br />Verque novum stabat cinctum florente corona,<br />stabat nuda Aestas et spicea serta gerebat,<br />stabat et Autumnus calcatis sordidus uvis<br />et glacialis Hiems canos hirsuta capillos.               30<br /></font></p><p><em><font size="2">Quelle: Latein24.de</font></em></p>');
INSERT INTO `pgn_text` VALUES (100093, '<font size="2">Paenituit iurasse patrem: qui terque quaterque<br />concutiens inlustre caput \'temeraria\' dixit               <br />\'vox mea facta tua est; utinam promissa liceret<br />non dare! confiteor, solum hoc tibi, nate, negarem.<br />dissuadere licet: non est tua tuta voluntas!<br />magna petis, Phaethon, et quae nec viribus istis<br />munera conveniant nec tam puerilibus annis:               <br />sors tua mortalis, non est mortale, quod optas.<br />plus etiam, quam quod superis contingere possit,<br />nescius adfectas; placeat sibi quisque licebit,<br />non tamen ignifero quisquam consistere in axe<br />me valet excepto; vasti quoque rector Olympi,               60<br />qui fera terribili iaculatur fulmina dextra,<br />non agat hos currus: et quid Iove maius habemus?<br />ardua prima via est et qua vix mane recentes<br />enituntur equi; medio est altissima caelo,<br />unde mare et terras ipsi mihi saepe videre               65<br />fit timor et pavida trepidat formidine pectus;<br />ultima prona via est et eget moderamine certo:<br />tunc etiam quae me subiectis excipit undis,<br />ne ferar in praeceps, Tethys solet ipsa vereri.<br />adde, quod adsidua rapitur vertigine caelum               <br />sideraque alta trahit celerique volumine torquet.<br />nitor in adversum, nec me, qui cetera, vincit<br />inpetus, et rapido contrarius evehor orbi.<br />finge datos currus: quid ages? poterisne rotatis<br />obvius ire polis, ne te citus auferat axis?             <br />forsitan et lucos illic urbesque deorum<br />concipias animo delubraque ditia donis<br />esse: per insidias iter est formasque ferarum!<br />utque viam teneas nulloque errore traharis,<br />per tamen adversi gradieris cornua tauri              <br />Haemoniosque arcus violentique ora Leonis<br />saevaque circuitu curvantem bracchia longo<br />Scorpion atque aliter curvantem bracchia Cancrum.<br />nec tibi quadripedes animosos ignibus illis,<br />quos in pectore habent, quos ore et naribus efflant,               85<br />in promptu regere est: vix me patiuntur, ubi acres<br />incaluere animi cervixque repugnat habenis.—<br />at tu, funesti ne sim tibi muneris auctor,<br />nate, cave, dum resque sinit tua corrige vota!<br />scilicet ut nostro genitum te sanguine credas,               90<br />pignora certa petis: do pignora certa timendo<br />et patrio pater esse metu probor. adspice vultus<br />ecce meos; utinamque oculos in pectora posses<br />inserere et patrias intus deprendere curas!<br />denique quidquid habet dives, circumspice, mundus              <br />eque tot ac tantis caeli terraeque marisque<br />posce bonis aliquid; nullam patiere repulsam.<br />deprecor hoc unum, quod vero nomine poena,<br />non honor est: poenam, Phaethon, pro munere poscis!<br />quid mea colla tenes blandis, ignare, lacertis?              <br />ne dubita! dabitur (Stygias iuravimus undas),<br />quodcumque optaris; sed tu sapientius opta!\'<br /></font>');
INSERT INTO `pgn_text` VALUES (100122, 'Hier finden Sie allgemeine Informationen zum Fachbereich MNI an der FH Gießen-Friedberg.');
INSERT INTO `pgn_text` VALUES (100128, '');
INSERT INTO `pgn_text` VALUES (100134, '<font size="2">Am Fachbereich MNI werden drei Studiengänge angeboten. Informatik als grundständiger Diplomstudiengang, der Aufbaustudiengang Strahlenschutz und -messtechnik und der Aufbaustudiengang Technische Redaktion &amp; Multimediale Dokumentation. Darüber hinaus werden Grundlagen in Mathematik und Naturwissenschaften für Studierende aller Gießener Fachbereiche vermittelt.</font>');
INSERT INTO `pgn_text` VALUES (100144, '<p><font size="2">Die aktuellen Studenpläne sind auf der Homepage von Prof. Dr. Peter Kneisel zu finden. </font></p><ul><li><a href="http://www.prof-kneisel.de/index.html" target="_blank"><font size="2">Stundenpläne (nur für Studiengang Informatik, Stundenplan für Bio- und Medizininformatiker auf der Homepage des Fachbereiches KMUB )</font></a><font size="2"> <!-- <li><a href="http://www.prof-kneisel.de/index_gross.html">Stundenpl&auml;ne (für Sehbehinderte, 640*480-Auflösung)</a> --></font></li></ul><p><font size="2"></font></p><p><font size="2">Die Zuordnung der Wahlpflichtfächer zu den Studienschwerpunkten ist in der Prüfungsordnung festgelegt. Informationen aus anderen Quellen (z.B. Stundenplan) sind ohne Gewähr.</font> </p>');
INSERT INTO `pgn_text` VALUES (100146, '<font size="2">Alma tamen Tellus, ut erat circumdata ponto,<br />inter aquas pelagi contractosque undique fontes,<br />qui se condiderant in opacae viscera matris,<br />sustulit oppressos collo tenus arida vultus           <br />opposuitque manum fronti magnoque tremore<br />omnia concutiens paulum subsedit et infra,<br />quam solet esse, fuit fractaque ita voce locuta est:<br />\'si placet hoc meruique, quid o tua fulmina cessant,<br />summe deum? liceat periturae viribus ignis         <br />igne perire tuo clademque auctore levare!<br />vix equidem fauces haec ipsa in verba resolvo\';<br />(presserat ora vapor) \'tostos en adspice crines<br />inque oculis tantum, tantum super ora favillae!<br />hosne mihi fructus, hunc fertilitatis honorem          <br />officiique refers, quod adunci vulnera aratri<br />rastrorumque fero totoque exerceor anno,<br />quod pecori frondes alimentaque mitia, fruges<br />humano generi, vobis quoque tura ministro?<br />sed tamen exitium fac me meruisse: quid undae,           <br />quid meruit frater? cur illi tradita sorte<br />aequora decrescunt et ab aethere longius absunt?<br />quodsi nec fratris nec te mea gratia tangit,<br />at caeli miserere tui! circumspice utrumque:<br />fumat uterque polus! quos si vitiaverit ignis,             <br />atria vestra ruent! Atlas en ipse laborat<br />vixque suis umeris candentem sustinet axem!<br />si freta, si terrae pereunt, si regia caeli,<br />in chaos antiquum confundimur! eripe flammis,<br />si quid adhuc superest, et rerum consule summae!\'</font>  <font size="4">  </font>');
INSERT INTO `pgn_text` VALUES (100152, '<font size="2">Infos rund ums Studium..... <br />Dixerat haec Tellus: neque enim tolerare vaporem<br />ulterius potuit nec dicere plura suumque<br />rettulit os in se propioraque manibus antra;<br />at pater omnipotens, superos testatus et ipsum,<br />qui dederat currus, nisi opem ferat, omnia fato               <br />interitura gravi, summam petit arduus arcem,<br />unde solet nubes latis inducere terris,<br /></font>');
INSERT INTO `pgn_text` VALUES (100162, 'Informationen über unsere Forschungsprojekte...');
INSERT INTO `pgn_text` VALUES (100390, 'Ihre Suche lieferte folgendes Ergebnis:');
INSERT INTO `pgn_text` VALUES (100462, '<p></p>');
INSERT INTO `pgn_text` VALUES (100469, '<font size="2">Alma tamen Tellus, ut erat circumdata ponto,<br />inter aquas pelagi contractosque undique fontes,<br />qui se condiderant in opacae viscera matris,<br />sustulit oppressos collo tenus arida vultus           <br />opposuitque manum fronti magnoque tremore<br />omnia concutiens paulum subsedit et infra,<br />quam solet esse, fuit fractaque ita voce locuta est:<br />\'si placet hoc meruique, quid o tua fulmina cessant,<br />summe deum? liceat periturae viribus ignis         <br />igne perire tuo clademque auctore levare!<br />vix equidem fauces haec ipsa in verba resolvo\';<br />(presserat ora vapor) \'tostos en adspice crines<br />inque oculis tantum, tantum super ora favillae!<br />hosne mihi fructus, hunc fertilitatis honorem          <br />officiique refers, quod adunci vulnera aratri<br />rastrorumque fero totoque exerceor anno,<br />quod pecori frondes alimentaque mitia, fruges<br />humano generi, vobis quoque tura ministro?<br />sed tamen exitium fac me meruisse: quid undae,           <br />quid meruit frater? cur illi tradita sorte<br />aequora decrescunt et ab aethere longius absunt?<br />quodsi nec fratris nec te mea gratia tangit,<br />at caeli miserere tui! circumspice utrumque:<br />fumat uterque polus! quos si vitiaverit ignis,             <br />atria vestra ruent! Atlas en ipse laborat<br />vixque suis umeris candentem sustinet axem!<br />si freta, si terrae pereunt, si regia caeli,<br />in chaos antiquum confundimur! eripe flammis,<br />si quid adhuc superest, et rerum consule summae!\'</font>  <font size="4">  </font>');
INSERT INTO `pgn_text` VALUES (100476, '<p><font size="2">Die aktuellen Studenpläne sind auf der Homepage von Prof. Dr. Peter Kneisel zu finden. </font></p><ul><li><a href="http://www.prof-kneisel.de/index.html" target="_blank"><font size="2">Stundenpläne (nur für Studiengang Informatik, Stundenplan für Bio- und Medizininformatiker auf der Homepage des Fachbereiches KMUB )</font></a><font size="2"> <!-- <li><a href="http://www.prof-kneisel.de/index_gross.html">Stundenpl&auml;ne (für Sehbehinderte, 640*480-Auflösung)</a> --></font></li></ul><p><font size="2"></font></p><p><font size="2">Die Zuordnung der Wahlpflichtfächer zu den Studienschwerpunkten ist in der Prüfungsordnung festgelegt. Informationen aus anderen Quellen (z.B. Stundenplan) sind ohne Gewähr.</font> </p>');
INSERT INTO `pgn_text` VALUES (100481, '');
INSERT INTO `pgn_text` VALUES (100487, '<font size="2">Infos rund ums Studium..... <br />Dixerat haec Tellus: neque enim tolerare vaporem<br />ulterius potuit nec dicere plura suumque<br />rettulit os in se propioraque manibus antra;<br />at pater omnipotens, superos testatus et ipsum,<br />qui dederat currus, nisi opem ferat, omnia fato               <br />interitura gravi, summam petit arduus arcem,<br />unde solet nubes latis inducere terris,<br /></font>');
INSERT INTO `pgn_text` VALUES (100496, 'Decrevit quondam senatus, ut L. Opimius consul videret, ne quid res publica detrimenti caperet; nox nulla intercessit; interfectus est propter quasdam seditionum suspiciones C. Gracchus, clarissimo patre, avo, maioribus, occisus est cum liberis M. Fulvius consularis. Simili senatus consulto C. Mario et L. Valerio consulibus est permissa res publica; num unum diem postea L. Saturninum tribunum pl. et C. Servilium praetorem mors ac rei publicae poena remorata est? At [vero] nos vicesimum iam diem patimur hebescere aciem horum auctoritatis.');
INSERT INTO `pgn_text` VALUES (100512, '<p><font size="2">Sie haben eine Seite im geschlossenen Bereich unserer Website aufgerufen. Bitte melden Sie sich zuerst im System mit ihrem Benutzernamen und Passwort an!</font></p>');
INSERT INTO `pgn_text` VALUES (100519, '');
INSERT INTO `pgn_text` VALUES (100525, '<font size="2">Ipse loco medius rerum novitate paventem<br />Sol oculis iuvenem, quibus adspicit omnia, vidit<br />\'quae\' que \'viae tibi causa? quid hac\' ait \'arce petisti,<br />progenies, Phaethon, haud infitianda parenti?\'<br />ille refert: \'o lux inmensi publica mundi,               <br />Phoebe pater, si das usum mihi nominis huius,<br />nec falsa Clymene culpam sub imagine celat,<br />pignora da, genitor, per quae tua vera propago<br />credar, et hunc animis errorem detrahe nostris!\'<br />dixerat, at genitor circum caput omne micantes               <br />deposuit radios propiusque accedere iussit<br />amplexuque dato \'nec tu meus esse negari<br />dignus es, et Clymene veros\' ait \'edidit ortus,<br />quoque minus dubites, quodvis pete munus, ut illud<br />me tribuente feras! promissi testis adesto               <br />dis iuranda palus, oculis incognita nostris!\'<br />vix bene desierat, currus rogat ille paternos<br />inque diem alipedum ius et moderamen equorum.<br /></font>');
INSERT INTO `pgn_text` VALUES (100534, '<p><font size="2">Regia Solis erat sublimibus alta columnis,<br />clara micante auro flammasque imitante pyropo,<br />cuius ebur nitidum fastigia summa tegebat,<br />argenti bifores radiabant lumine valvae.<br />materiam superabat opus: nam Mulciber illic               5<br />aequora caelarat medias cingentia terras<br />terrarumque orbem caelumque, quod imminet orbi.<br />caeruleos habet unda deos, Tritona canorum<br />Proteaque ambiguum ballaenarumque prementem<br />Aegaeona suis inmania terga lacertis               10<br />Doridaque et natas, quarum pars nare videtur,<br />pars in mole sedens viridis siccare capillos,<br />pisce vehi quaedam: facies non omnibus una,<br />non diversa tamen, qualem decet esse sororum.<br />terra viros urbesque gerit silvasque ferasque               15<br />fluminaque et nymphas et cetera numina ruris.<br />haec super inposita est caeli fulgentis imago,<br />signaque sex foribus dextris totidemque sinistris.<br />    Quo simul adclivi Clymeneia limite proles<br />venit et intravit dubitati tecta parentis,               20<br />protinus ad patrios sua fert vestigia vultus<br />consistitque procul; neque enim propiora ferebat<br />lumina: purpurea velatus veste sedebat<br />in solio Phoebus claris lucente smaragdis.<br />a dextra laevaque Dies et Mensis et Annus               25<br />Saeculaque et positae spatiis aequalibus Horae<br />Verque novum stabat cinctum florente corona,<br />stabat nuda Aestas et spicea serta gerebat,<br />stabat et Autumnus calcatis sordidus uvis<br />et glacialis Hiems canos hirsuta capillos.               30<br /></font></p><p><em><font size="2">Quelle: Latein24.de</font></em></p>');
INSERT INTO `pgn_text` VALUES (100540, '<font size="2">Paenituit iurasse patrem: qui terque quaterque<br />concutiens inlustre caput \'temeraria\' dixit               <br />\'vox mea facta tua est; utinam promissa liceret<br />non dare! confiteor, solum hoc tibi, nate, negarem.<br />dissuadere licet: non est tua tuta voluntas!<br />magna petis, Phaethon, et quae nec viribus istis<br />munera conveniant nec tam puerilibus annis:               <br />sors tua mortalis, non est mortale, quod optas.<br />plus etiam, quam quod superis contingere possit,<br />nescius adfectas; placeat sibi quisque licebit,<br />non tamen ignifero quisquam consistere in axe<br />me valet excepto; vasti quoque rector Olympi,               60<br />qui fera terribili iaculatur fulmina dextra,<br />non agat hos currus: et quid Iove maius habemus?<br />ardua prima via est et qua vix mane recentes<br />enituntur equi; medio est altissima caelo,<br />unde mare et terras ipsi mihi saepe videre               65<br />fit timor et pavida trepidat formidine pectus;<br />ultima prona via est et eget moderamine certo:<br />tunc etiam quae me subiectis excipit undis,<br />ne ferar in praeceps, Tethys solet ipsa vereri.<br />adde, quod adsidua rapitur vertigine caelum               <br />sideraque alta trahit celerique volumine torquet.<br />nitor in adversum, nec me, qui cetera, vincit<br />inpetus, et rapido contrarius evehor orbi.<br />finge datos currus: quid ages? poterisne rotatis<br />obvius ire polis, ne te citus auferat axis?             <br />forsitan et lucos illic urbesque deorum<br />concipias animo delubraque ditia donis<br />esse: per insidias iter est formasque ferarum!<br />utque viam teneas nulloque errore traharis,<br />per tamen adversi gradieris cornua tauri              <br />Haemoniosque arcus violentique ora Leonis<br />saevaque circuitu curvantem bracchia longo<br />Scorpion atque aliter curvantem bracchia Cancrum.<br />nec tibi quadripedes animosos ignibus illis,<br />quos in pectore habent, quos ore et naribus efflant,               85<br />in promptu regere est: vix me patiuntur, ubi acres<br />incaluere animi cervixque repugnat habenis.—<br />at tu, funesti ne sim tibi muneris auctor,<br />nate, cave, dum resque sinit tua corrige vota!<br />scilicet ut nostro genitum te sanguine credas,               90<br />pignora certa petis: do pignora certa timendo<br />et patrio pater esse metu probor. adspice vultus<br />ecce meos; utinamque oculos in pectora posses<br />inserere et patrias intus deprendere curas!<br />denique quidquid habet dives, circumspice, mundus              <br />eque tot ac tantis caeli terraeque marisque<br />posce bonis aliquid; nullam patiere repulsam.<br />deprecor hoc unum, quod vero nomine poena,<br />non honor est: poenam, Phaethon, pro munere poscis!<br />quid mea colla tenes blandis, ignare, lacertis?              <br />ne dubita! dabitur (Stygias iuravimus undas),<br />quodcumque optaris; sed tu sapientius opta!\'<br /></font>');
INSERT INTO `pgn_text` VALUES (100547, 'Informationen für Studierende und Mitarbeiter....');
INSERT INTO `pgn_text` VALUES (100553, '');
INSERT INTO `pgn_text` VALUES (100560, '<p>   </p><p><b>Vorläufige Ergebnisse der Klausur vom 28.7.2003</b></p><p></p><p><table cellspacing="0" cellpadding="0" border="0"><tbody><tr><td valign="top" width="247"><p>Teilnehmer </p></td><td valign="top" width="76"><p>12 </p></td></tr><tr><td valign="top" width="247"><p>Bestanden </p></td><td valign="top" width="76"><p>12 </p></td></tr><tr><td valign="top" width="247"><p>Durchgefallen </p></td><td valign="top" width="76"><p>0 </p></td></tr><tr><td valign="top" width="247"><p>Schnitt </p></td><td valign="top" width="76"><p>2,2 </p></td></tr></tbody></table></p><p><br />Die Klausureinsicht findet am 12. September von 14.00 bis 16.00h im Raum F112 statt.</p><p></p><p><table cellspacing="0" cellpadding="0" border="1"><tbody><tr><td valign="top" width="154"><p><b>Martrikelnummer</b></p></td><td valign="top" width="154"><p><b>Note</b></p></td><td valign="top" width="154"><p><b>Martrikelnummer</b></p></td><td valign="top" width="154"><p><b>Note</b></p></td></tr><tr><td valign="top" width="154"><p>55654</p></td><td valign="top" width="154"><p>2,0</p></td><td valign="top" width="154"><p>55478</p></td><td valign="top" width="154"><p>2,0</p></td></tr><tr><td valign="top" width="154"><p>55489</p></td><td valign="top" width="154"><p>1,3</p></td><td valign="top" width="154"><p>55499</p></td><td valign="top" width="154"><p>3,7</p></td></tr><tr><td valign="top" width="154"><p>55223</p></td><td valign="top" width="154"><p>1,7</p></td><td valign="top" width="154"><p>55669</p></td><td valign="top" width="154"><p>4,0</p></td></tr><tr><td valign="top" width="154"><p>55441</p></td><td valign="top" width="154"><p>2,7</p></td><td valign="top" width="154"><p>55442</p></td><td valign="top" width="154"><p>2,3</p></td></tr><tr><td valign="top" width="154"><p>55668</p></td><td valign="top" width="154"><p>2,7</p></td><td valign="top" width="154"><p>55447</p></td><td valign="top" width="154"><p>3,3</p></td></tr></tbody></table></p>');
INSERT INTO `pgn_text` VALUES (100568, '<p>   </p><p><b>Vorläufige Ergebnisse der Klausur vom 28.7.2003</b></p><p></p><p><table cellspacing="0" cellpadding="0" border="0"><tbody><tr><td valign="top" width="247"><p>Teilnehmer </p></td><td valign="top" width="76"><p>12 </p></td></tr><tr><td valign="top" width="247"><p>Bestanden </p></td><td valign="top" width="76"><p>12 </p></td></tr><tr><td valign="top" width="247"><p>Durchgefallen </p></td><td valign="top" width="76"><p>0 </p></td></tr><tr><td valign="top" width="247"><p>Schnitt </p></td><td valign="top" width="76"><p>2,2 </p></td></tr></tbody></table></p><p><br />Die Klausureinsicht findet am 12. September von 14.00 bis 16.00h im Raum F112 statt.</p><p></p><p><table cellspacing="0" cellpadding="0" border="1"><tbody><tr><td valign="top" width="154"><p><b>Martrikelnummer</b></p></td><td valign="top" width="154"><p><b>Note</b></p></td><td valign="top" width="154"><p><b>Martrikelnummer</b></p></td><td valign="top" width="154"><p><b>Note</b></p></td></tr><tr><td valign="top" width="154"><p>55654</p></td><td valign="top" width="154"><p>2,0</p></td><td valign="top" width="154"><p>55478</p></td><td valign="top" width="154"><p>2,0</p></td></tr><tr><td valign="top" width="154"><p>55489</p></td><td valign="top" width="154"><p>1,3</p></td><td valign="top" width="154"><p>55499</p></td><td valign="top" width="154"><p>3,7</p></td></tr><tr><td valign="top" width="154"><p>55223</p></td><td valign="top" width="154"><p>1,7</p></td><td valign="top" width="154"><p>55669</p></td><td valign="top" width="154"><p>4,0</p></td></tr><tr><td valign="top" width="154"><p>55441</p></td><td valign="top" width="154"><p>2,7</p></td><td valign="top" width="154"><p>55442</p></td><td valign="top" width="154"><p>2,3</p></td></tr><tr><td valign="top" width="154"><p>55668</p></td><td valign="top" width="154"><p>2,7</p></td><td valign="top" width="154"><p>55447</p></td><td valign="top" width="154"><p>3,3</p></td></tr></tbody></table></p>');
INSERT INTO `pgn_text` VALUES (100585, '');
INSERT INTO `pgn_text` VALUES (100594, 'Sie können sich jetzt zu Klausuren und zum Studienschwerpunkt anmelden. Anmeldung unter <a HREF="http://anm.mni.fh-giessen.de/anm/anm_vor.asp">Online-Anmeldung</A>,');
INSERT INTO `pgn_text` VALUES (100606, 'Es wurden alle Notenauszüge fürs SS 03 gedruckt. Bitte holen Sie Ihre Auszüge im MNI-Sekretariat ab. Eine Überprüfung Ihrer bisher erbrachten Leistungsnachweise bzw. Ihrer möglichen Fehlversuche sollten Sie vornehmen.');
INSERT INTO `pgn_text` VALUES (100620, 'Eine Übersicht der Module und deren Verrechnung in den verschiedenen POs , die im WS 03/04 angeboten werden, erhalten Sie unter <a href="http://localhost/veranstaltungen.shtml">Veranstaltungen</a> .');
INSERT INTO `pgn_text` VALUES (100051, 'Read information about the N/X Team.');
INSERT INTO `pgn_text` VALUES (100133, '<P>Welcome to the N/X CMS Open Source Project.<BR>N/X is an extensible &nbsp;web content management system written for the lamp environment. </P>\r\n<P>Learn more about N/X and how to realize your visions on these pages.</P>');
INSERT INTO `pgn_text` VALUES (100140, 'Learn more about our services!');
INSERT INTO `pgn_text` VALUES (100147, 'N/X is hosted at sourceforge. All downloads on this page are linked to the sourcefourge.net project page. Do not download from other sources!');
INSERT INTO `pgn_text` VALUES (100161, '<P>&nbsp;</P>');
INSERT INTO `pgn_text` VALUES (100166, '<P DESIGNTIMESP="24915">Read, what is new in the world of N/X. We will provide updates and news regularly here.</P>');
INSERT INTO `pgn_text` VALUES (100216, 'Learn more about our services!');
INSERT INTO `pgn_text` VALUES (100239, '<P>A Who is Who in the world of N/X.</P>');
INSERT INTO `pgn_text` VALUES (100245, '<P DESIGNTIMESP="7847"><FONT size=4 DESIGNTIMESP="10055">Who should use N/X</FONT></P>\r\n<UL DESIGNTIMESP="10056">\r\n<LI DESIGNTIMESP="10057">\r\n<DIV DESIGNTIMESP="7847">Professional&nbsp;developers with knowledge of&nbsp;PHP and databases</DIV>\r\n<LI DESIGNTIMESP="10059">\r\n<DIV DESIGNTIMESP="7847">Organisations, which need a flexible and adjustable system</DIV>\r\n<LI DESIGNTIMESP="10061">\r\n<DIV DESIGNTIMESP="7847">Internet agencies</DIV>\r\n<LI DESIGNTIMESP="10063">\r\n<DIV DESIGNTIMESP="7847">People who need to integrate data from several different sources <BR DESIGNTIMESP="10065">(you will love our plugin interfaces)</DIV>\r\n<LI DESIGNTIMESP="10066">\r\n<DIV DESIGNTIMESP="7847">Designers who are planning to built interactive flash films</DIV>\r\n<LI DESIGNTIMESP="10068">\r\n<DIV DESIGNTIMESP="7847">People who would like to structure their content into objects (clusters) and to reuse it.</DIV></LI></UL>\r\n<P DESIGNTIMESP="7847"><FONT size=4 DESIGNTIMESP="10071"></FONT>&nbsp;</P>\r\n<P DESIGNTIMESP="7847"><FONT size=4 DESIGNTIMESP="10073">Who should not use N/X</FONT></P>\r\n<UL DESIGNTIMESP="10074">\r\n<LI DESIGNTIMESP="10075">\r\n<DIV DESIGNTIMESP="7847"><FONT size=2 DESIGNTIMESP="10077">Anyone who has no technical background, except to editors of the website, which do not need to have any technical knowledge.</FONT></DIV>\r\n<LI DESIGNTIMESP="10078">\r\n<DIV DESIGNTIMESP="7847"><FONT size=2 DESIGNTIMESP="10080">Anyone who has not at least a few hours time&nbsp;for reading our documentation. </FONT></DIV>\r\n<LI DESIGNTIMESP="10078">\r\n<DIV DESIGNTIMESP="7847"><FONT size=2 DESIGNTIMESP="10083">Any designers with no experience with content management</FONT></DIV>\r\n<LI DESIGNTIMESP="10084">\r\n<DIV DESIGNTIMESP="7847"><FONT size=2 DESIGNTIMESP="10086">All the people who would like to quickly build a homepage - use Mambo instead</FONT></DIV>\r\n<LI DESIGNTIMESP="10087">\r\n<DIV DESIGNTIMESP="7847"><FONT size=2 DESIGNTIMESP="10089">All the people who would like to setup a standard portal - use Nuke or xoops instead</FONT></DIV></LI></UL>\r\n<P DESIGNTIMESP="7847"><FONT size=2 DESIGNTIMESP="10091"></FONT>&nbsp;</P>\r\n<P DESIGNTIMESP="7847"><FONT size=2 DESIGNTIMESP="10093">Please contact us, if you think this lists&nbsp;are incomplete.</FONT></P>\r\n<P DESIGNTIMESP="7847"><FONT size=2 DESIGNTIMESP="10095"></FONT>&nbsp;</P>');
INSERT INTO `pgn_text` VALUES (100251, '');
INSERT INTO `pgn_text` VALUES (101196, '<P DESIGNTIMESP="1049"><FONT size=4 DESIGNTIMESP="1050">Programming the website</FONT></P>\r\n<UL DESIGNTIMESP="1051">\r\n<LI DESIGNTIMESP="1052"><FONT size=2 DESIGNTIMESP="1053">The header.inc.php and/or the pagelayout.inc.php in www and wwwdev-folders are different. Make sure, you did not copy one version over the other!</FONT> </LI></UL>\r\n<P DESIGNTIMESP="1052"><BR DESIGNTIMESP="2265"></P>\r\n<UL DESIGNTIMESP="1051">\r\n<LI DESIGNTIMESP="1054"><FONT size=2 DESIGNTIMESP="1055">If you encounter trouble with live-authoring, e.g. the data you entered is not stored, make sure you have no forms in the page. you can strip the form-tag and the closing tag out by checking $sma which is true when you are in live authoring mode.</FONT> </LI></UL>\r\n<P DESIGNTIMESP="1054"><BR DESIGNTIMESP="2268"></P>\r\n<UL DESIGNTIMESP="1051">\r\n<LI DESIGNTIMESP="1056"><FONT size=2 DESIGNTIMESP="1057">When you launched a page or an article, nothing has changed in the live-website? Check the caching settings. Disable the query-cache if the page is under development. If needed also disable the dynamic cache.</FONT></LI></UL>\r\n<P DESIGNTIMESP="1056"><FONT size=2 DESIGNTIMESP="2272"></FONT>&nbsp;</P>\r\n<P DESIGNTIMESP="1056"><FONT size=2 DESIGNTIMESP="2274">Do you think, there is something missing? Please contact us!</FONT></P>');
INSERT INTO `pgn_text` VALUES (101208, '<P DESIGNTIMESP="19464">All parts of N/X are distributed under GNU General Public License if no special agreements are printed in the sourcecode. Graphics distributed with N/X may belong to third parties and are not all free to use.</P>\r\n<P DESIGNTIMESP="19465">&nbsp;</P>\r\n<P DESIGNTIMESP="19466">{NX:IMAGE ID="101210" HEIGHT="200" ALT="" HSPACE="5" WIDTH="160" ALIGN="left" VSPACE="5" BORDER="0" DESIGNTIMESP="20842" DESIGNTIMEURL="/homepage/wwwdev/images/101211.jpg"}</P>\r\n<P DESIGNTIMESP="19468"><FONT size=4 DESIGNTIMESP="19469">GNU GENERAL PUBLIC LICENSE<BR DESIGNTIMESP="19470"></FONT>Version 2, June 1991<BR DESIGNTIMESP="19471"><BR DESIGNTIMESP="19472">Copyright (C) 1989, 1991 Free Software Foundation, Inc.<BR DESIGNTIMESP="19473">59 Temple Place, Suite 330, Boston, MA 02111-1307 USA<BR DESIGNTIMESP="19474">Everyone is permitted to copy and distribute verbatim copies<BR DESIGNTIMESP="19475">of this license document, but changing it is not allowed.<BR DESIGNTIMESP="19476"><BR DESIGNTIMESP="19477">Preamble<BR DESIGNTIMESP="19478"><BR DESIGNTIMESP="19479">The licenses for most software are designed to take away your<BR DESIGNTIMESP="19480">freedom to share and change it. By contrast, the GNU General Public<BR DESIGNTIMESP="19481">License is intended to guarantee your freedom to share and change free<BR DESIGNTIMESP="19482">software--to make sure the software is free for all its users. This<BR DESIGNTIMESP="19483">General Public License applies to most of the Free Software<BR DESIGNTIMESP="19484">Foundation\'s software and to any other program whose authors commit to<BR DESIGNTIMESP="19485">using it. (Some other Free Software Foundation software is covered by<BR DESIGNTIMESP="19486">the GNU Library General Public License instead.) You can apply it to<BR DESIGNTIMESP="19487">your programs, too.<BR DESIGNTIMESP="19488"><BR DESIGNTIMESP="19489">When we speak of free software, we are referring to freedom, not<BR DESIGNTIMESP="19490">price. Our General Public Licenses are designed to make sure that you<BR DESIGNTIMESP="19491">have the freedom to distribute copies of free software (and charge for<BR DESIGNTIMESP="19492">this service if you wish), that you receive source code or can get it<BR DESIGNTIMESP="19493">if you want it, that you can change the software or use pieces of it<BR DESIGNTIMESP="19494">in new free programs; and that you know you can do these things.<BR DESIGNTIMESP="19495"><BR DESIGNTIMESP="19496">To protect your rights, we need to make restrictions that forbid<BR DESIGNTIMESP="19497">anyone to deny you these rights or to ask you to surrender the rights.<BR DESIGNTIMESP="19498">These restrictions translate to certain responsibilities for you if you<BR DESIGNTIMESP="19499">distribute copies of the software, or if you modify it.<BR DESIGNTIMESP="19500"><BR DESIGNTIMESP="19501">For example, if you distribute copies of such a program, whether<BR DESIGNTIMESP="19502">gratis or for a fee, you must give the recipients all the rights that<BR DESIGNTIMESP="19503">you have. You must make sure that they, too, receive or can get the<BR DESIGNTIMESP="19504">source code. And you must show them these terms so they know their<BR DESIGNTIMESP="19505">rights.<BR DESIGNTIMESP="19506"><BR DESIGNTIMESP="19507">We protect your rights with two steps: (1) copyright the software, and<BR DESIGNTIMESP="19508">(2) offer you this license which gives you legal permission to copy,<BR DESIGNTIMESP="19509">distribute and/or modify the software.<BR DESIGNTIMESP="19510"><BR DESIGNTIMESP="19511">Also, for each author\'s protection and ours, we want to make certain<BR DESIGNTIMESP="19512">that everyone understands that there is no warranty for this free<BR DESIGNTIMESP="19513">software. If the software is modified by someone else and passed on, we<BR DESIGNTIMESP="19514">want its recipients to know that what they have is not the original, so<BR DESIGNTIMESP="19515">that any problems introduced by others will not reflect on the original<BR DESIGNTIMESP="19516">authors\' reputations.<BR DESIGNTIMESP="19517"><BR DESIGNTIMESP="19518">Finally, any free program is threatened constantly by software<BR DESIGNTIMESP="19519">patents. We wish to avoid the danger that redistributors of a free<BR DESIGNTIMESP="19520">program will individually obtain patent licenses, in effect making the<BR DESIGNTIMESP="19521">program proprietary. To prevent this, we have made it clear that any<BR DESIGNTIMESP="19522">patent must be licensed for everyone\'s free use or not licensed at all.<BR DESIGNTIMESP="19523"><BR DESIGNTIMESP="19524">The precise terms and conditions for copying, distribution and<BR DESIGNTIMESP="19525">modification follow.<BR DESIGNTIMESP="19526"><BR DESIGNTIMESP="19527">GNU GENERAL PUBLIC LICENSE<BR DESIGNTIMESP="19528">TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION<BR DESIGNTIMESP="19529"><BR DESIGNTIMESP="19530">0. This License applies to any program or other work which contains<BR DESIGNTIMESP="19531">a notice placed by the copyright holder saying it may be distributed<BR DESIGNTIMESP="19532">under the terms of this General Public License. The "Program", below,<BR DESIGNTIMESP="19533">refers to any such program or work, and a "work based on the Program"<BR DESIGNTIMESP="19534">means either the Program or any derivative work under copyright law:<BR DESIGNTIMESP="19535">that is to say, a work containing the Program or a portion of it,<BR DESIGNTIMESP="19536">either verbatim or with modifications and/or translated into another<BR DESIGNTIMESP="19537">language. (Hereinafter, translation is included without limitation in<BR DESIGNTIMESP="19538">the term "modification".) Each licensee is addressed as "you".<BR DESIGNTIMESP="19539"><BR DESIGNTIMESP="19540">Activities other than copying, distribution and modification are not<BR DESIGNTIMESP="19541">covered by this License; they are outside its scope. The act of<BR DESIGNTIMESP="19542">running the Program is not restricted, and the output from the Program<BR DESIGNTIMESP="19543">is covered only if its contents constitute a work based on the<BR DESIGNTIMESP="19544">Program (independent of having been made by running the Program).<BR DESIGNTIMESP="19545">Whether that is true depends on what the Program does.<BR DESIGNTIMESP="19546"><BR DESIGNTIMESP="19547">1. You may copy and distribute verbatim copies of the Program\'s<BR DESIGNTIMESP="19548">source code as you receive it, in any medium, provided that you<BR DESIGNTIMESP="19549">conspicuously and appropriately publish on each copy an appropriate<BR DESIGNTIMESP="19550">copyright notice and disclaimer of warranty; keep intact all the<BR DESIGNTIMESP="19551">notices that refer to this License and to the absence of any warranty;<BR DESIGNTIMESP="19552">and give any other recipients of the Program a copy of this License<BR DESIGNTIMESP="19553">along with the Program.<BR DESIGNTIMESP="19554"><BR DESIGNTIMESP="19555">You may charge a fee for the physical act of transferring a copy, and<BR DESIGNTIMESP="19556">you may at your option offer warranty protection in exchange for a fee.<BR DESIGNTIMESP="19557"><BR DESIGNTIMESP="19558">2. You may modify your copy or copies of the Program or any portion<BR DESIGNTIMESP="19559">of it, thus forming a work based on the Program, and copy and<BR DESIGNTIMESP="19560">distribute such modifications or work under the terms of Section 1<BR DESIGNTIMESP="19561">above, provided that you also meet all of these conditions:<BR DESIGNTIMESP="19562"><BR DESIGNTIMESP="19563">a) You must cause the modified files to carry prominent notices<BR DESIGNTIMESP="19564">stating that you changed the files and the date of any change.<BR DESIGNTIMESP="19565"><BR DESIGNTIMESP="19566">b) You must cause any work that you distribute or publish, that in<BR DESIGNTIMESP="19567">whole or in part contains or is derived from the Program or any<BR DESIGNTIMESP="19568">part thereof, to be licensed as a whole at no charge to all third<BR DESIGNTIMESP="19569">parties under the terms of this License.<BR DESIGNTIMESP="19570"><BR DESIGNTIMESP="19571">c) If the modified program normally reads commands interactively<BR DESIGNTIMESP="19572">when run, you must cause it, when started running for such<BR DESIGNTIMESP="19573">interactive use in the most ordinary way, to print or display an<BR DESIGNTIMESP="19574">announcement including an appropriate copyright notice and a<BR DESIGNTIMESP="19575">notice that there is no warranty (or else, saying that you provide<BR DESIGNTIMESP="19576">a warranty) and that users may redistribute the program under<BR DESIGNTIMESP="19577">these conditions, and telling the user how to view a copy of this<BR DESIGNTIMESP="19578">License. (Exception: if the Program itself is interactive but<BR DESIGNTIMESP="19579">does not normally print such an announcement, your work based on<BR DESIGNTIMESP="19580">the Program is not required to print an announcement.)<BR DESIGNTIMESP="19581"><BR DESIGNTIMESP="19582">These requirements apply to the modified work as a whole. If<BR DESIGNTIMESP="19583">identifiable sections of that work are not derived from the Program,<BR DESIGNTIMESP="19584">and can be reasonably considered independent and separate works in<BR DESIGNTIMESP="19585">themselves, then this License, and its terms, do not apply to those<BR DESIGNTIMESP="19586">sections when you distribute them as separate works. But when you<BR DESIGNTIMESP="19587">distribute the same sections as part of a whole which is a work based<BR DESIGNTIMESP="19588">on the Program, the distribution of the whole must be on the terms of<BR DESIGNTIMESP="19589">this License, whose permissions for other licensees extend to the<BR DESIGNTIMESP="19590">entire whole, and thus to each and every part regardless of who wrote it.<BR DESIGNTIMESP="19591"><BR DESIGNTIMESP="19592">Thus, it is not the intent of this section to claim rights or contest<BR DESIGNTIMESP="19593">your rights to work written entirely by you; rather, the intent is to<BR DESIGNTIMESP="19594">exercise the right to control the distribution of derivative or<BR DESIGNTIMESP="19595">collective works based on the Program.<BR DESIGNTIMESP="19596"><BR DESIGNTIMESP="19597">In addition, mere aggregation of another work not based on the Program<BR DESIGNTIMESP="19598">with the Program (or with a work based on the Program) on a volume of<BR DESIGNTIMESP="19599">a storage or distribution medium does not bring the other work under<BR DESIGNTIMESP="19600">the scope of this License.<BR DESIGNTIMESP="19601"><BR DESIGNTIMESP="19602">3. You may copy and distribute the Program (or a work based on it,<BR DESIGNTIMESP="19603">under Section 2) in object code or executable form under the terms of<BR DESIGNTIMESP="19604">Sections 1 and 2 above provided that you also do one of the following:<BR DESIGNTIMESP="19605"><BR DESIGNTIMESP="19606">a) Accompany it with the complete corresponding machine-readable<BR DESIGNTIMESP="19607">source code, which must be distributed under the terms of Sections<BR DESIGNTIMESP="19608">1 and 2 above on a medium customarily used for software interchange; or,<BR DESIGNTIMESP="19609"><BR DESIGNTIMESP="19610">b) Accompany it with a written offer, valid for at least three<BR DESIGNTIMESP="19611">years, to give any third party, for a charge no more than your<BR DESIGNTIMESP="19612">cost of physically performing source distribution, a complete<BR DESIGNTIMESP="19613">machine-readable copy of the corresponding source code, to be<BR DESIGNTIMESP="19614">distributed under the terms of Sections 1 and 2 above on a medium<BR DESIGNTIMESP="19615">customarily used for software interchange; or,<BR DESIGNTIMESP="19616"><BR DESIGNTIMESP="19617">c) Accompany it with the information you received as to the offer<BR DESIGNTIMESP="19618">to distribute corresponding source code. (This alternative is<BR DESIGNTIMESP="19619">allowed only for noncommercial distribution and only if you<BR DESIGNTIMESP="19620">received the program in object code or executable form with such<BR DESIGNTIMESP="19621">an offer, in accord with Subsection b above.)<BR DESIGNTIMESP="19622"><BR DESIGNTIMESP="19623">The source code for a work means the preferred form of the work for<BR DESIGNTIMESP="19624">making modifications to it. For an executable work, complete source<BR DESIGNTIMESP="19625">code means all the source code for all modules it contains, plus any<BR DESIGNTIMESP="19626">associated interface definition files, plus the scripts used to<BR DESIGNTIMESP="19627">control compilation and installation of the executable. However, as a<BR DESIGNTIMESP="19628">special exception, the source code distributed need not include<BR DESIGNTIMESP="19629">anything that is normally distributed (in either source or binary<BR DESIGNTIMESP="19630">form) with the major components (compiler, kernel, and so on) of the<BR DESIGNTIMESP="19631">operating system on which the executable runs, unless that component<BR DESIGNTIMESP="19632">itself accompanies the executable.<BR DESIGNTIMESP="19633"><BR DESIGNTIMESP="19634">If distribution of executable or object code is made by offering<BR DESIGNTIMESP="19635">access to copy from a designated place, then offering equivalent<BR DESIGNTIMESP="19636">access to copy the source code from the same place counts as<BR DESIGNTIMESP="19637">distribution of the source code, even though third parties are not<BR DESIGNTIMESP="19638">compelled to copy the source along with the object code.<BR DESIGNTIMESP="19639"><BR DESIGNTIMESP="19640">4. You may not copy, modify, sublicense, or distribute the Program<BR DESIGNTIMESP="19641">except as expressly provided under this License. Any attempt<BR DESIGNTIMESP="19642">otherwise to copy, modify, sublicense or distribute the Program is<BR DESIGNTIMESP="19643">void, and will automatically terminate your rights under this License.<BR DESIGNTIMESP="19644">However, parties who have received copies, or rights, from you under<BR DESIGNTIMESP="19645">this License will not have their licenses terminated so long as such<BR DESIGNTIMESP="19646">parties remain in full compliance.<BR DESIGNTIMESP="19647"><BR DESIGNTIMESP="19648">5. You are not required to accept this License, since you have not<BR DESIGNTIMESP="19649">signed it. However, nothing else grants you permission to modify or<BR DESIGNTIMESP="19650">distribute the Program or its derivative works. These actions are<BR DESIGNTIMESP="19651">prohibited by law if you do not accept this License. Therefore, by<BR DESIGNTIMESP="19652">modifying or distributing the Program (or any work based on the<BR DESIGNTIMESP="19653">Program), you indicate your acceptance of this License to do so, and<BR DESIGNTIMESP="19654">all its terms and conditions for copying, distributing or modifying<BR DESIGNTIMESP="19655">the Program or works based on it.<BR DESIGNTIMESP="19656"><BR DESIGNTIMESP="19657">6. Each time you redistribute the Program (or any work based on the<BR DESIGNTIMESP="19658">Program), the recipient automatically receives a license from the<BR DESIGNTIMESP="19659">original licensor to copy, distribute or modify the Program subject to<BR DESIGNTIMESP="19660">these terms and conditions. You may not impose any further<BR DESIGNTIMESP="19661">restrictions on the recipients\' exercise of the rights granted herein.<BR DESIGNTIMESP="19662">You are not responsible for enforcing compliance by third parties to<BR DESIGNTIMESP="19663">this License.<BR DESIGNTIMESP="19664"><BR DESIGNTIMESP="19665">7. If, as a consequence of a court judgment or allegation of patent<BR DESIGNTIMESP="19666">infringement or for any other reason (not limited to patent issues),<BR DESIGNTIMESP="19667">conditions are imposed on you (whether by court order, agreement or<BR DESIGNTIMESP="19668">otherwise) that contradict the conditions of this License, they do not<BR DESIGNTIMESP="19669">excuse you from the conditions of this License. If you cannot<BR DESIGNTIMESP="19670">distribute so as to satisfy simultaneously your obligations under this<BR DESIGNTIMESP="19671">License and any other pertinent obligations, then as a consequence you<BR DESIGNTIMESP="19672">may not distribute the Program at all. For example, if a patent<BR DESIGNTIMESP="19673">license would not permit royalty-free redistribution of the Program by<BR DESIGNTIMESP="19674">all those who receive copies directly or indirectly through you, then<BR DESIGNTIMESP="19675">the only way you could satisfy both it and this License would be to<BR DESIGNTIMESP="19676">refrain entirely from distribution of the Program.<BR DESIGNTIMESP="19677"><BR DESIGNTIMESP="19678">If any portion of this section is held invalid or unenforceable under<BR DESIGNTIMESP="19679">any particular circumstance, the balance of the section is intended to<BR DESIGNTIMESP="19680">apply and the section as a whole is intended to apply in other<BR DESIGNTIMESP="19681">circumstances.<BR DESIGNTIMESP="19682"><BR DESIGNTIMESP="19683">It is not the purpose of this section to induce you to infringe any<BR DESIGNTIMESP="19684">patents or other property right claims or to contest validity of any<BR DESIGNTIMESP="19685">such claims; this section has the sole purpose of protecting the<BR DESIGNTIMESP="19686">integrity of the free software distribution system, which is<BR DESIGNTIMESP="19687">implemented by public license practices. Many people have made<BR DESIGNTIMESP="19688">generous contributions to the wide range of software distributed<BR DESIGNTIMESP="19689">through that system in reliance on consistent application of that<BR DESIGNTIMESP="19690">system; it is up to the author/donor to decide if he or she is willing<BR DESIGNTIMESP="19691">to distribute software through any other system and a licensee cannot<BR DESIGNTIMESP="19692">impose that choice.<BR DESIGNTIMESP="19693"><BR DESIGNTIMESP="19694">This section is intended to make thoroughly clear what is believed to<BR DESIGNTIMESP="19695">be a consequence of the rest of this License.<BR DESIGNTIMESP="19696"><BR DESIGNTIMESP="19697">8. If the distribution and/or use of the Program is restricted in<BR DESIGNTIMESP="19698">certain countries either by patents or by copyrighted interfaces, the<BR DESIGNTIMESP="19699">original copyright holder who places the Program under this License<BR DESIGNTIMESP="19700">may add an explicit geographical distribution limitation excluding<BR DESIGNTIMESP="19701">those countries, so that distribution is permitted only in or among<BR DESIGNTIMESP="19702">countries not thus excluded. In such case, this License incorporates<BR DESIGNTIMESP="19703">the limitation as if written in the body of this License.<BR DESIGNTIMESP="19704"><BR DESIGNTIMESP="19705">9. The Free Software Foundation may publish revised and/or new versions<BR DESIGNTIMESP="19706">of the General Public License from time to time. Such new versions will<BR DESIGNTIMESP="19707">be similar in spirit to the present version, but may differ in detail to<BR DESIGNTIMESP="19708">address new problems or concerns.<BR DESIGNTIMESP="19709"><BR DESIGNTIMESP="19710">Each version is given a distinguishing version number. If the Program<BR DESIGNTIMESP="19711">specifies a version number of this License which applies to it and "any<BR DESIGNTIMESP="19712">later version", you have the option of following the terms and conditions<BR DESIGNTIMESP="19713">either of that version or of any later version published by the Free<BR DESIGNTIMESP="19714">Software Foundation. If the Program does not specify a version number of<BR DESIGNTIMESP="19715">this License, you may choose any version ever published by the Free Software<BR DESIGNTIMESP="19716">Foundation.<BR DESIGNTIMESP="19717"><BR DESIGNTIMESP="19718">10. If you wish to incorporate parts of the Program into other free<BR DESIGNTIMESP="19719">programs whose distribution conditions are different, write to the author<BR DESIGNTIMESP="19720">to ask for permission. For software which is copyrighted by the Free<BR DESIGNTIMESP="19721">Software Foundation, write to the Free Software Foundation; we sometimes<BR DESIGNTIMESP="19722">make exceptions for this. Our decision will be guided by the two goals<BR DESIGNTIMESP="19723">of preserving the free status of all derivatives of our free software and<BR DESIGNTIMESP="19724">of promoting the sharing and reuse of software generally.<BR DESIGNTIMESP="19725"><BR DESIGNTIMESP="19726">NO WARRANTY<BR DESIGNTIMESP="19727"><BR DESIGNTIMESP="19728">11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY<BR DESIGNTIMESP="19729">FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN<BR DESIGNTIMESP="19730">OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES<BR DESIGNTIMESP="19731">PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED<BR DESIGNTIMESP="19732">OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF<BR DESIGNTIMESP="19733">MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE ENTIRE RISK AS<BR DESIGNTIMESP="19734">TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU. SHOULD THE<BR DESIGNTIMESP="19735">PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING,<BR DESIGNTIMESP="19736">REPAIR OR CORRECTION.<BR DESIGNTIMESP="19737"><BR DESIGNTIMESP="19738">12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING<BR DESIGNTIMESP="19739">WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR<BR DESIGNTIMESP="19740">REDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES,<BR DESIGNTIMESP="19741">INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING<BR DESIGNTIMESP="19742">OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED<BR DESIGNTIMESP="19743">TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY<BR DESIGNTIMESP="19744">YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER<BR DESIGNTIMESP="19745">PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE<BR DESIGNTIMESP="19746">POSSIBILITY OF SUCH DAMAGES.<BR DESIGNTIMESP="19747"><BR DESIGNTIMESP="19748">END OF TERMS AND CONDITIONS<BR DESIGNTIMESP="19749"><BR DESIGNTIMESP="19750">How to Apply These Terms to Your New Programs<BR DESIGNTIMESP="19751"><BR DESIGNTIMESP="19752">If you develop a new program, and you want it to be of the greatest<BR DESIGNTIMESP="19753">possible use to the public, the best way to achieve this is to make it<BR DESIGNTIMESP="19754">free software which everyone can redistribute and change under these terms.<BR DESIGNTIMESP="19755"><BR DESIGNTIMESP="19756">To do so, attach the following notices to the program. It is safest<BR DESIGNTIMESP="19757">to attach them to the start of each source file to most effectively<BR DESIGNTIMESP="19758">convey the exclusion of warranty; and each file should have at least<BR DESIGNTIMESP="19759">the "copyright" line and a pointer to where the full notice is found.<BR DESIGNTIMESP="19760"><BR DESIGNTIMESP="19761"><ONE DESIGNTIMESP="19762" does. it what of idea brief a and name program?s the give to line><BR DESIGNTIMESP="19763">Copyright (C) <YEAR DESIGNTIMESP="19764"><NAME DESIGNTIMESP="19765" of author><BR DESIGNTIMESP="19766"><BR DESIGNTIMESP="19767">This program is free software; you can redistribute it and/or modify<BR DESIGNTIMESP="19768">it under the terms of the GNU General Public License as published by<BR DESIGNTIMESP="19769">the Free Software Foundation; either version 2 of the License, or<BR DESIGNTIMESP="19770">(at your option) any later version.<BR DESIGNTIMESP="19771"><BR DESIGNTIMESP="19772">This program is distributed in the hope that it will be useful,<BR DESIGNTIMESP="19773">but WITHOUT ANY WARRANTY; without even the implied warranty of<BR DESIGNTIMESP="19774">MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the<BR DESIGNTIMESP="19775">GNU General Public License for more details.<BR DESIGNTIMESP="19776"><BR DESIGNTIMESP="19777">You should have received a copy of the GNU General Public License<BR DESIGNTIMESP="19778">along with this program; if not, write to the Free Software<BR DESIGNTIMESP="19779">Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA<BR DESIGNTIMESP="19780"><BR DESIGNTIMESP="19781"><BR DESIGNTIMESP="19782">Also add information on how to contact you by electronic and paper mail.<BR DESIGNTIMESP="19783"><BR DESIGNTIMESP="19784">If the program is interactive, make it output a short notice like this<BR DESIGNTIMESP="19785">when it starts in an interactive mode:<BR DESIGNTIMESP="19786"><BR DESIGNTIMESP="19787">Gnomovision version 69, Copyright (C) year name of author<BR DESIGNTIMESP="19788">Gnomovision comes with ABSOLUTELY NO WARRANTY; for details type `show w\'.<BR DESIGNTIMESP="19789">This is free software, and you are welcome to redistribute it<BR DESIGNTIMESP="19790">under certain conditions; type `show c\' for details.<BR DESIGNTIMESP="19791"><BR DESIGNTIMESP="19792">The hypothetical commands `show w\' and `show c\' should show the appropriate<BR DESIGNTIMESP="19793">parts of the General Public License. Of course, the commands you use may<BR DESIGNTIMESP="19794">be called something other than `show w\' and `show c\'; they could even be<BR DESIGNTIMESP="19795">mouse-clicks or menu items--whatever suits your program.<BR DESIGNTIMESP="19796"><BR DESIGNTIMESP="19797">You should also get your employer (if you work as a programmer) or your<BR DESIGNTIMESP="19798">school, if any, to sign a "copyright disclaimer" for the program, if<BR DESIGNTIMESP="19799">necessary. Here is a sample; alter the names:<BR DESIGNTIMESP="19800"><BR DESIGNTIMESP="19801">Yoyodyne, Inc., hereby disclaims all copyright interest in the program<BR DESIGNTIMESP="19802">`Gnomovision\' (which makes passes at compilers) written by James Hacker.<BR DESIGNTIMESP="19803"><BR DESIGNTIMESP="19804"><SIGNATURE DESIGNTIMESP="19805" of Coon Ty>1 April 1989<BR DESIGNTIMESP="19806">Ty Coon, President of Vice<BR DESIGNTIMESP="19807"><BR DESIGNTIMESP="19808">This General Public License does not permit incorporating your program into<BR DESIGNTIMESP="19809">proprietary programs. If your program is a subroutine library, you may<BR DESIGNTIMESP="19810">consider it more useful to permit linking proprietary applications with the<BR DESIGNTIMESP="19811">library. If this is what you want to do, use the GNU Library General<BR DESIGNTIMESP="19812">Public License instead of this License. </P>');
INSERT INTO `pgn_text` VALUES (101218, '<P>Below you find a list with available downloads of N/X. Visit our <a HREF="http://sourceforge.net/project/showfiles.php?group_id=47362&release_id=143942" TARGET="_blank">download page at Sourceforge</A> for more information!</P>\r\n<P>&nbsp;</P>');
INSERT INTO `pgn_text` VALUES (101289, '<P>The following pages have been developed with N/X WCMS. If you want to get listed, please contact us!</P>\r\n<UL>\r\n<LI>ModExotics: <a HREF="http://www.modexotics.com" TARGET="_blank">www.modexotics.com</A></LI>\r\n<LI>Dynamic Flash: <a HREF="http://www.dynamicflash.de" TARGET="_blank">www.dynamicflash.de</A></LI>\r\n<LI>Golf Club Orthenau: <a HREF="http://www.gc-orthenau.de" TARGET="_blank">www.gc-orthenau.de</A></LI>\r\n<LI>Eskapis: <a HREF="http://www.eskapis.de" TARGET="_blank">www.eskapis.de</A></LI>\r\n<LI>Karate Team: <a HREF="http://www.karate-team.de" TARGET="_blank">www.karate-team.de</A></LI>\r\n<LI>Karate Lahr: <a HREF="http://www.karate-lahr.de" TARGET="_blank">www.karate-lahr.de</A></LI>\r\n<LI>Uexkuell & Stollberg, Attornies: <a HREF="http://www.uex.de" TARGET="_blank">www.uex.de</A></LI>\r\n<LI>ELIXIA: <a HREF="http://www.elixia.de" TARGET="_blank">www.elixia.de</A></LI>\r\n<LI>KJG Freiburg: <a HREF="http://www.kjg-freiburg.de" TARGET="_blank">www.kjg-freiburg.de</A></LI></UL>');
INSERT INTO `pgn_text` VALUES (101327, '<UL>\r\n<LI>\r\n<DIV DESIGNTIMESP="135"><a HREF="/manuals/NXInstallEN.html" TARGET="_blank" DESIGNTIMESP="138" DESIGNTIMEURL="http://www.nxsystems.org/manuals/NX" ="N.html">Installation Guidelines (English)</A> </DIV></LI>\r\n<LI DESIGNTIMESP="139"><a HREF="/manuals/NXInstallDE.html" TARGET="_blank" DESIGNTIMESP="140" DESIGNTIMEURL="http://www.nxsystems.org/manuals/NX" ="E.html">Installation Guidelines (German)</A></LI></UL>');
INSERT INTO `pgn_text` VALUES (101335, '<P DESIGNTIMESP="18605">You can access the N/X CDS-API at:</P>\r\n<UL DESIGNTIMESP="18606">\r\n<LI DESIGNTIMESP="18607"><a HREF="/manuals/website_api/index.html" TARGET="_blank" DESIGNTIMESP="18608">http://www.nxsystems.org/manuals/website_api/index.html</A></LI></UL>\r\n<P DESIGNTIMESP="18609">&nbsp;</P>\r\n<P DESIGNTIMESP="18610">Alternatively we offer it on our homepage for {NX:LINK DESIGNTIMESP="18611" DESIGNTIMEURL="/homepage/wwwdev/rssdisp.php?page=101214&v=1" PAGE="101214" V="1" GETVARS=""}download</A>.</P>');
INSERT INTO `pgn_text` VALUES (101337, '<P DESIGNTIMESP="18605"><FONT size=4 DESIGNTIMESP="19827">The N/X Website API (aka CDS-API)</FONT></P>\r\n<P DESIGNTIMESP="18605"><FONT size=4 DESIGNTIMESP="19904"></FONT>&nbsp;</P>\r\n<P DESIGNTIMESP="18605">The N/X Website API contains all functions that are needed to develop your own web-templates. The API is brought to you by including the file nxheader.inc.php in the wwwdev or www folder.</P>\r\n<P DESIGNTIMESP="18605">&nbsp;</P>\r\n<P DESIGNTIMESP="18605">You can access the N/X CDS-API at:</P>\r\n<UL DESIGNTIMESP="20385">\r\n<LI DESIGNTIMESP="20386">\r\n<DIV DESIGNTIMESP="18605"><a HREF="/manuals/website_api/index.html" TARGET="_blank" DESIGNTIMESP="20388" DESIGNTIMEURL="/manuals/website_api/index.html">http://www.nxsystems.org/manuals/website_api/index.html</A></DIV></LI></UL>\r\n<P DESIGNTIMESP="18609">&nbsp;</P>\r\n<P DESIGNTIMESP="18610">&nbsp;</P>\r\n<P DESIGNTIMESP="18610"><FONT size=4 DESIGNTIMESP="19913">The N/X Backoffice API</FONT></P>\r\n<P DESIGNTIMESP="18610">&nbsp;</P>\r\n<P DESIGNTIMESP="18610">This API is used for developing own modules, extending the system and making modifications. It is also used to build plugins.</P>\r\n<P DESIGNTIMESP="18610">&nbsp;</P>\r\n<P DESIGNTIMESP="18610">You can access the N/X API at:</P>\r\n<UL DESIGNTIMESP="20397">\r\n<LI DESIGNTIMESP="20398">\r\n<DIV DESIGNTIMESP="18610"><a HREF="/manuals/api/index.html" TARGET="_blank" DESIGNTIMESP="20400" DESIGNTIMEURL="/manuals/api/index.html">http://www.nxsystems.org/manuals/api/index.html</A></DIV></LI></UL>\r\n<P DESIGNTIMESP="18610">&nbsp;</P>\r\n<P DESIGNTIMESP="18610">&nbsp;</P>\r\n<P DESIGNTIMESP="18610">Alternatively we offer&nbsp;the APIs&nbsp;on our homepage for {NX:LINK DESIGNTIMESP="20404" DESIGNTIMEURL="/homepage/wwwdev/rssdisp.php?page=101214&v=1" PAGE="101214" V="1" GETVARS=""}download</A>.</P>');
INSERT INTO `pgn_text` VALUES (101339, '');
INSERT INTO `pgn_text` VALUES (101355, '<P DESIGNTIMESP="14666">Do you remember the nasty UI of N/X 2002? Well, this times have gone away. N/X 4.0 offers theme based backends. Custimize the look and feel to your needs and create your own skins! Moreover we have rewritten almost every control. In this picture you see the new dynamic website tree.</P>');
INSERT INTO `pgn_text` VALUES (101360, '<P DESIGNTIMESP="14718">Editing content is as simple as in N/X 2002. By pressing the "Edit All" button, the editor can create content. Morever there are now 3 new content types for developers, called Channels - which we see in the picure, compound cluster, which is a cluster with encapsulated layout-routines and cluster-groups, where you can group clusters for automatic banner-rotation, teasering, displaying anything random and so on. N/X 4.0 also offers a new WYSIWYG-Editor for the website. We will cover this in a few steps.</P>');
INSERT INTO `pgn_text` VALUES (101365, '');
INSERT INTO `pgn_text` VALUES (101369, 'The new richtext-editor is seemlessly integrated into the userinterface. You can work with tables, insert content from the content-library, place links within the site and so on. The edit control works with internet explorer only at the moment. A version that will also work with mozilla will come when the FCKEditor- Open-Source-Project have a stable release of their editor for firefox. You can also paste content form word, which is parsed and cleaned automatically.');
INSERT INTO `pgn_text` VALUES (101473, '<P>Have a look at the top of the picture. You can see the lanuages selector which says "Standard". You can also see a box which says "Translate from: Disable". </P>\r\n<P>N/X 4.0 offers you new translation capabilities. By selecting another languages and setting the translate from language, the editor gets the following screen.</P>');
INSERT INTO `pgn_text` VALUES (101477, 'Now we are in translation mode. The text you selected as source is displayed above the input field. So the translator can do his work without a need for switching windows or printing the website on paper.');
INSERT INTO `pgn_text` VALUES (101483, 'The completely new written content library stores all atomic content. Content is brought to N/X with plugins. So labels, pictures, texts... are all based on plugins. This enables you to create your own content types and gives you maximum flexibility. The picture show an overview of a folder in the content-library.');
INSERT INTO `pgn_text` VALUES (101487, '<P>You set individual access to&nbsp;pages and folders of the content library. This enables you to ensure, that people only have access to the objects they should have access to.&nbsp;</P>\r\n<P>&nbsp;</P>\r\n<P>The picture shows the access-panel with standard-permissions inherited from the parent object.</P>');
INSERT INTO `pgn_text` VALUES (101491, '<P>Even if a user has the permission to access a page or a folder, you can configure the actions the user can perform individually. Therefore N/X offers predefined roles. A role is a collection of actions a user can take. You can define for each object, which user-groups can access with which roles.</P>\r\n<P>&nbsp;</P>\r\n<P>Of course you can introduce your own roles and customize the permissions individually.</P>');
INSERT INTO `pgn_text` VALUES (101495, 'We are now again in our website. As you have already seen, you can set all properties and content in the tabbed form. The picture shows you settings for the menu text.');
INSERT INTO `pgn_text` VALUES (101499, '<P>This screen shows the property-settings of a page. You can define the livespan of the page, can do some menu settings and change the template.</P>\r\n<P>&nbsp;</P>\r\n<P>You can also do caching settings here. N/X can render static HTML for you (*.html files). You may use this for creating CD-ROMs also. Maybe you already know the trouble that happens when you relaunch one single page. You normally mus also refresh some other pages, when menues change. N/X is doing this automatically by refreshing the menu-entries of all pages on the same menu-level and one level down. You can also specifiy extra-pages, which will be refreshed.</P>');
INSERT INTO `pgn_text` VALUES (101509, '<P>Next to the sitemap-tree we already saw, N/X offers an article editor, with which you can create new channels. This tour is also made with a channel. Channels are referenced in the website tree whenever this is needed. So you can mix both concepts - develping the website sitemap based and developing the website based on channels.</P>');
INSERT INTO `pgn_text` VALUES (101513, 'Editing an article in the news-channel or another one is as simple as editing a website. You can customize the input-fields for each channel and you can also define multiple formats (based on the new compound clusters concept). In the website you have several possibilities for ordering the articles, e.g. by date or alphanumerically by name.');
INSERT INTO `pgn_text` VALUES (101517, '<P>Starting from atomic content like one image or one text you can build so called clusters with N/X. A cluster is a group of atomic content and/or other clusters. You can build lists, include content fixed (static)&nbsp;or editable (dynamically).</P>');
INSERT INTO `pgn_text` VALUES (101521, '<P>The rollout wizard allow you to copy single pages or a whole tree of a website. Consider you have developed a microsite for one&nbsp;shop of a customer. Just rollout the sample microsite now for other shops.</P>\r\n<P>&nbsp;</P>\r\n<P>The picture shows the selection page of the rollout-wizard.</P>');
INSERT INTO `pgn_text` VALUES (101525, '<P>With N/X you can do intelligent copies of single sites. Because every webpage and also every article is based on a cluster, you can reuse these clusters in other pages or articles. This means, you can get several representations or layouts of one content-page. For example one page XML, one WAP and one HTML. You could also do PDFs. </P>\r\n<P>&nbsp;</P>\r\n<P>What is very useful is sharing content with clusters. Editing one single text in a shared cluster makes the needed changes on every single page. Because you can group clusters and build subclusters you could change one content on every single webpage within minutes.</P>');
INSERT INTO `pgn_text` VALUES (101529, '<P>N/X 4.0 allows you sharing of templates and content with other N/X users.</P>\r\n<P>&nbsp;</P>\r\n<P>The picture shows the export wizard. The user has to select the type he wants to export.</P>');
INSERT INTO `pgn_text` VALUES (101533, 'The user now selects the data-object he wants to export. The files are stored in XML-format. So you can also reuse content in other applications or develop al filter to automate import of content to N/X.');
INSERT INTO `pgn_text` VALUES (101537, 'After adding a short description to the export-file, the system starts sending the data.');
INSERT INTO `pgn_text` VALUES (101545, 'The import wizard is at least as intuitive as the export wizard. Before you start the import, the wizard shows you the summary of the file.');
INSERT INTO `pgn_text` VALUES (101578, '<P DESIGNTIMESP="7615"><STRONG DESIGNTIMESP="7616"><FONT size=3 DESIGNTIMESP="7617">Server Requirements</FONT></STRONG></P>\r\n<P DESIGNTIMESP="7615"><STRONG><FONT size=3></FONT></STRONG>&nbsp;</P>\r\n<P DESIGNTIMESP="7618">N/X is optimized to run with minimal system requirements, so you should be able to use it with almost any webspace provider with PHP4 or PHP 5 support&nbsp;and MySQL installed.<BR DESIGNTIMESP="7619"><BR DESIGNTIMESP="7620"><B DESIGNTIMESP="7621">PHP-Requirements</B><BR DESIGNTIMESP="7622">You need PHP Version 4.3.0 or higher.<BR DESIGNTIMESP="7623">N/X may work with older versions of PHP. Officialliy there&nbsp;will be&nbsp;no support.<BR DESIGNTIMESP="7624"><a HREF="http://www.php.net/" TARGET="_blank" DESIGNTIMESP="7625">Visit the PHP-Homepage</A><BR DESIGNTIMESP="7626"><BR DESIGNTIMESP="7627"><B DESIGNTIMESP="7628">MySQL-Requirements</B><BR DESIGNTIMESP="7629">You need MySQL Version 3.23 or later.<BR DESIGNTIMESP="7630"><a HREF="http://www.mysql.com/" TARGET="_blank" DESIGNTIMESP="7631">Visit the MySQL-Homepage</A><BR DESIGNTIMESP="7632"><BR DESIGNTIMESP="7633"><B DESIGNTIMESP="7634">Apache Web-Server-Requirements</B><BR DESIGNTIMESP="7635">You need Apache Version 1.3 or later.<BR DESIGNTIMESP="7636"><a HREF="http://www.apache.org/" TARGET="_blank" DESIGNTIMESP="7637">Visit the Apache-Homepage</A><BR DESIGNTIMESP="7638"><BR DESIGNTIMESP="7639"></P><STRONG DESIGNTIMESP="7641">\r\n<P DESIGNTIMESP="7640"><BR DESIGNTIMESP="7642"><FONT size=3 DESIGNTIMESP="7643">Client Requirements</FONT></P>\r\n<P DESIGNTIMESP="7640"></STRONG>&nbsp;</P>\r\n<P DESIGNTIMESP="7644"><STRONG DESIGNTIMESP="7645">Webbrowser for accessing the backend</STRONG><BR DESIGNTIMESP="7646">Internet Explorer 6+ (all features)<BR DESIGNTIMESP="7647">Opera 6+ (no richtext editor)<BR DESIGNTIMESP="7648">Mozilla 1.0+ (no richtext editor)<BR DESIGNTIMESP="7649">Netscape 7.0+ (no richtext editor)<BR DESIGNTIMESP="7650">Firefox 1.0+ (no richtext editor)</P>');
INSERT INTO `pgn_text` VALUES (101594, 'Go to the website and the library menu. Select the root node in both folders and click on set access. You must now add the new group to the permissions and grant them access to library and/or website.');
INSERT INTO `pgn_text` VALUES (101598, '<P>The source for this problem is often caching. Try to disable the Query-Cache at first. If this does not help, disable also the dynamic cache. If the live website is built as statically html you must run the maintenance function&nbsp; \'Rebuild Cache\' after disabling the Query-Cache.</P>');
INSERT INTO `pgn_text` VALUES (101813, 'We are collecting feedback of you all and are extracting&nbsp;common errors of first-time developers.');
INSERT INTO `pgn_text` VALUES (101819, 'Read online, how to setup N/X!&nbsp;We provide a very detailed description of how to configure N/X.');
INSERT INTO `pgn_text` VALUES (101785, 'We created about 40 pages of introduction to give you an idea what you can do with N/X.');
INSERT INTO `pgn_text` VALUES (101791, 'Read here, what kind of software and hardware you need to run N/X on you server on your clients.');
INSERT INTO `pgn_text` VALUES (101797, 'You want to know more about the people behind N/X? Read here.');
INSERT INTO `pgn_text` VALUES (101807, 'Please read our F.A.Q. first, before you post any questions. The F.A.Q. module also has a form, where you can ask us questions.');
INSERT INTO `pgn_text` VALUES (101629, '<P>Each sitepage is based on one template. N/X knows two template types: singlepages and multipages. A multipage is a collection of several pages with the same layout which located under one logical node. A single page always contains only one content.</P>\r\n<P>&nbsp;</P>\r\n<P>Mulitpages should no longer be used with N/X 4.0. Use Channels instead!</P>');
INSERT INTO `pgn_text` VALUES (101633, 'Page templates can be editied either within the webbrowser or with access to the webserver via webdav. Webdav requires configuration of the webserver by the administrator.');
INSERT INTO `pgn_text` VALUES (101637, '<P DESIGNTIMESP="6680">Each page is based on one cluster and each cluster has a cluster-template. The cluster-template is a definition of fields, that make the layout of a cluster. </P>\r\n<P DESIGNTIMESP="6681">&nbsp;</P>\r\n<P DESIGNTIMESP="6682">Example: You want your page to be made out of one headline, one text and one picture. You will create a cluster template which consists out of three elements: 1 for the headline, 1 for the text and 1 for the picture. More information can be found in the getting-started guide.</P>');
INSERT INTO `pgn_text` VALUES (101641, '<P>A lot of peple asked us, if it is possible to link a template to a cluster. Now it is!</P>\r\n<P>&nbsp;</P>\r\n<P>N/X 4.0 introduces <STRONG>compound clusters</STRONG>. A compound cluster is a cluster which cluster-template is linked to an layout-file. The picture shows the editor of the cluster-layout. It is written in php with the standard Website-API. The only difference is that the common object $cds is replaced by $me.</P>');
INSERT INTO `pgn_text` VALUES (101645, 'N/X 4.0 introduces <STRONG>compound groups</STRONG>. You already learned about compound clusters. You can group several compound clusters now to compound group. This gives you easy ways to create banner rotation or other random or ordered display of content.');
INSERT INTO `pgn_text` VALUES (101649, 'The picture shows the editor of the compound group. The user can add and remove cluster. He can also set a custom order. You may also want to use compound groups for teasering.');
INSERT INTO `pgn_text` VALUES (101653, 'N/X 4.0 introduces a new search engine. The search engine is based on phpDig with some special N/X extensions. The search engine works with an integrated spider which is going through the website to build the search index. This guarantees excellent search results!');
INSERT INTO `pgn_text` VALUES (101657, 'N/X offers a rhich set of maintenance functions to make the admins the administration easier. For example there are wizards that launch a whole website. So you do not need to launch page by page, which can be a very serious problem for larger sites.');
INSERT INTO `pgn_text` VALUES (101661, '<P>As you already know, N/X content library is based on plugins. The picture shows the plugin administration module.</P>');
INSERT INTO `pgn_text` VALUES (101665, 'Of course you can define your own users. Each user can use the system in his own language - if installed.');
INSERT INTO `pgn_text` VALUES (101669, 'Each user can have another right to access the system. The picture shows the permission editor of a user.');
INSERT INTO `pgn_text` VALUES (101673, 'N/X uses a group - user -role concept to edit the access to system resource. The picture shows the group editor.');
INSERT INTO `pgn_text` VALUES (101677, 'roles are a set of system functions. Each user can have several roles. The system comes with the pre-defined roles editor, developer, quality manager and administrator. However sometimes it is needed to customize this roles or to create new ones. This can be done with the role editor.');
INSERT INTO `pgn_text` VALUES (101681, 'One of the most impressive modules of N/X 4.0 are the page access statistics.');
INSERT INTO `pgn_text` VALUES (101685, '<P>The picture shows the page impressions of the website. The user can define a custom time-span for analysis.</P>');
INSERT INTO `pgn_text` VALUES (101689, '<P>The picture shows the visitor statistics of the website. The user can define a custom time-span for analysis. </P>');
INSERT INTO `pgn_text` VALUES (101693, '<P>The picture shows the top pages of the website. You can also view the top entry and top exit pages of your website.</P>');
INSERT INTO `pgn_text` VALUES (101697, 'This picture shows the click-path analysis. The click-path , also known as click stream, shows the pages users viewed during their visit of your website in the correct order. The data is anonymized and shows top-paths, shortest paths and longest paths. The anaylsis is quite fast!');
INSERT INTO `pgn_text` VALUES (101701, '<P>The oulu team of finland created a help module for N/X. The pictures shows the integrated help. There are is also help within the system when you hover a form-element. The help-message popups after 2-3 seconds hovering the element. </P>');
INSERT INTO `pgn_text` VALUES (101825, 'Read our API-documentation online.');
INSERT INTO `pgn_text` VALUES (101831, 'We are thinking about system security. Read our whitepaper here.');
INSERT INTO `pgn_text` VALUES (101838, '<P DESIGNTIMESP="15624">Our Downloads are hosted at sourceforge. Get N/X now. </P>');
INSERT INTO `pgn_text` VALUES (101844, 'N/X is licensed under Gnu General Public License (GPL).');
INSERT INTO `pgn_text` VALUES (101851, 'Take a look at all the sites built with N/X');
INSERT INTO `pgn_text` VALUES (101857, '<P DESIGNTIMESP="4455">Read here, what the media says about N/X.</P>');
INSERT INTO `pgn_text` VALUES (100222, 'N/X is hosted at sourceforge. All downloads on this page are linked to the sourcefourge.net project page. Do not download from other sources!');
INSERT INTO `pgn_text` VALUES (101874, '<P DESIGNTIMESP="15624">Our Downloads are hosted at sourceforge. Get N/X now. </P>');
INSERT INTO `pgn_text` VALUES (101884, 'N/X is licensed under Gnu General Public License (GPL).');
INSERT INTO `pgn_text` VALUES (101893, '<P DESIGNTIMESP="19464">All parts of N/X are distributed under GNU General Public License if no special agreements are printed in the sourcecode. Graphics distributed with N/X may belong to third parties and are not all free to use.</P>\r\n<P DESIGNTIMESP="19465">&nbsp;</P>\r\n<P DESIGNTIMESP="19466">{NX:IMAGE ID="101894" HEIGHT="200" ALT="" HSPACE="5" WIDTH="160" ALIGN="left" VSPACE="5" BORDER="0" DESIGNTIMESP="20842" DESIGNTIMEURL="/homepage/wwwdev/images/101211.jpg"}</P>\r\n<P DESIGNTIMESP="19468"><FONT size=4 DESIGNTIMESP="19469">GNU GENERAL PUBLIC LICENSE<BR DESIGNTIMESP="19470"></FONT>Version 2, June 1991<BR DESIGNTIMESP="19471"><BR DESIGNTIMESP="19472">Copyright (C) 1989, 1991 Free Software Foundation, Inc.<BR DESIGNTIMESP="19473">59 Temple Place, Suite 330, Boston, MA 02111-1307 USA<BR DESIGNTIMESP="19474">Everyone is permitted to copy and distribute verbatim copies<BR DESIGNTIMESP="19475">of this license document, but changing it is not allowed.<BR DESIGNTIMESP="19476"><BR DESIGNTIMESP="19477">Preamble<BR DESIGNTIMESP="19478"><BR DESIGNTIMESP="19479">The licenses for most software are designed to take away your<BR DESIGNTIMESP="19480">freedom to share and change it. By contrast, the GNU General Public<BR DESIGNTIMESP="19481">License is intended to guarantee your freedom to share and change free<BR DESIGNTIMESP="19482">software--to make sure the software is free for all its users. This<BR DESIGNTIMESP="19483">General Public License applies to most of the Free Software<BR DESIGNTIMESP="19484">Foundation\'s software and to any other program whose authors commit to<BR DESIGNTIMESP="19485">using it. (Some other Free Software Foundation software is covered by<BR DESIGNTIMESP="19486">the GNU Library General Public License instead.) You can apply it to<BR DESIGNTIMESP="19487">your programs, too.<BR DESIGNTIMESP="19488"><BR DESIGNTIMESP="19489">When we speak of free software, we are referring to freedom, not<BR DESIGNTIMESP="19490">price. Our General Public Licenses are designed to make sure that you<BR DESIGNTIMESP="19491">have the freedom to distribute copies of free software (and charge for<BR DESIGNTIMESP="19492">this service if you wish), that you receive source code or can get it<BR DESIGNTIMESP="19493">if you want it, that you can change the software or use pieces of it<BR DESIGNTIMESP="19494">in new free programs; and that you know you can do these things.<BR DESIGNTIMESP="19495"><BR DESIGNTIMESP="19496">To protect your rights, we need to make restrictions that forbid<BR DESIGNTIMESP="19497">anyone to deny you these rights or to ask you to surrender the rights.<BR DESIGNTIMESP="19498">These restrictions translate to certain responsibilities for you if you<BR DESIGNTIMESP="19499">distribute copies of the software, or if you modify it.<BR DESIGNTIMESP="19500"><BR DESIGNTIMESP="19501">For example, if you distribute copies of such a program, whether<BR DESIGNTIMESP="19502">gratis or for a fee, you must give the recipients all the rights that<BR DESIGNTIMESP="19503">you have. You must make sure that they, too, receive or can get the<BR DESIGNTIMESP="19504">source code. And you must show them these terms so they know their<BR DESIGNTIMESP="19505">rights.<BR DESIGNTIMESP="19506"><BR DESIGNTIMESP="19507">We protect your rights with two steps: (1) copyright the software, and<BR DESIGNTIMESP="19508">(2) offer you this license which gives you legal permission to copy,<BR DESIGNTIMESP="19509">distribute and/or modify the software.<BR DESIGNTIMESP="19510"><BR DESIGNTIMESP="19511">Also, for each author\'s protection and ours, we want to make certain<BR DESIGNTIMESP="19512">that everyone understands that there is no warranty for this free<BR DESIGNTIMESP="19513">software. If the software is modified by someone else and passed on, we<BR DESIGNTIMESP="19514">want its recipients to know that what they have is not the original, so<BR DESIGNTIMESP="19515">that any problems introduced by others will not reflect on the original<BR DESIGNTIMESP="19516">authors\' reputations.<BR DESIGNTIMESP="19517"><BR DESIGNTIMESP="19518">Finally, any free program is threatened constantly by software<BR DESIGNTIMESP="19519">patents. We wish to avoid the danger that redistributors of a free<BR DESIGNTIMESP="19520">program will individually obtain patent licenses, in effect making the<BR DESIGNTIMESP="19521">program proprietary. To prevent this, we have made it clear that any<BR DESIGNTIMESP="19522">patent must be licensed for everyone\'s free use or not licensed at all.<BR DESIGNTIMESP="19523"><BR DESIGNTIMESP="19524">The precise terms and conditions for copying, distribution and<BR DESIGNTIMESP="19525">modification follow.<BR DESIGNTIMESP="19526"><BR DESIGNTIMESP="19527">GNU GENERAL PUBLIC LICENSE<BR DESIGNTIMESP="19528">TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION<BR DESIGNTIMESP="19529"><BR DESIGNTIMESP="19530">0. This License applies to any program or other work which contains<BR DESIGNTIMESP="19531">a notice placed by the copyright holder saying it may be distributed<BR DESIGNTIMESP="19532">under the terms of this General Public License. The "Program", below,<BR DESIGNTIMESP="19533">refers to any such program or work, and a "work based on the Program"<BR DESIGNTIMESP="19534">means either the Program or any derivative work under copyright law:<BR DESIGNTIMESP="19535">that is to say, a work containing the Program or a portion of it,<BR DESIGNTIMESP="19536">either verbatim or with modifications and/or translated into another<BR DESIGNTIMESP="19537">language. (Hereinafter, translation is included without limitation in<BR DESIGNTIMESP="19538">the term "modification".) Each licensee is addressed as "you".<BR DESIGNTIMESP="19539"><BR DESIGNTIMESP="19540">Activities other than copying, distribution and modification are not<BR DESIGNTIMESP="19541">covered by this License; they are outside its scope. The act of<BR DESIGNTIMESP="19542">running the Program is not restricted, and the output from the Program<BR DESIGNTIMESP="19543">is covered only if its contents constitute a work based on the<BR DESIGNTIMESP="19544">Program (independent of having been made by running the Program).<BR DESIGNTIMESP="19545">Whether that is true depends on what the Program does.<BR DESIGNTIMESP="19546"><BR DESIGNTIMESP="19547">1. You may copy and distribute verbatim copies of the Program\'s<BR DESIGNTIMESP="19548">source code as you receive it, in any medium, provided that you<BR DESIGNTIMESP="19549">conspicuously and appropriately publish on each copy an appropriate<BR DESIGNTIMESP="19550">copyright notice and disclaimer of warranty; keep intact all the<BR DESIGNTIMESP="19551">notices that refer to this License and to the absence of any warranty;<BR DESIGNTIMESP="19552">and give any other recipients of the Program a copy of this License<BR DESIGNTIMESP="19553">along with the Program.<BR DESIGNTIMESP="19554"><BR DESIGNTIMESP="19555">You may charge a fee for the physical act of transferring a copy, and<BR DESIGNTIMESP="19556">you may at your option offer warranty protection in exchange for a fee.<BR DESIGNTIMESP="19557"><BR DESIGNTIMESP="19558">2. You may modify your copy or copies of the Program or any portion<BR DESIGNTIMESP="19559">of it, thus forming a work based on the Program, and copy and<BR DESIGNTIMESP="19560">distribute such modifications or work under the terms of Section 1<BR DESIGNTIMESP="19561">above, provided that you also meet all of these conditions:<BR DESIGNTIMESP="19562"><BR DESIGNTIMESP="19563">a) You must cause the modified files to carry prominent notices<BR DESIGNTIMESP="19564">stating that you changed the files and the date of any change.<BR DESIGNTIMESP="19565"><BR DESIGNTIMESP="19566">b) You must cause any work that you distribute or publish, that in<BR DESIGNTIMESP="19567">whole or in part contains or is derived from the Program or any<BR DESIGNTIMESP="19568">part thereof, to be licensed as a whole at no charge to all third<BR DESIGNTIMESP="19569">parties under the terms of this License.<BR DESIGNTIMESP="19570"><BR DESIGNTIMESP="19571">c) If the modified program normally reads commands interactively<BR DESIGNTIMESP="19572">when run, you must cause it, when started running for such<BR DESIGNTIMESP="19573">interactive use in the most ordinary way, to print or display an<BR DESIGNTIMESP="19574">announcement including an appropriate copyright notice and a<BR DESIGNTIMESP="19575">notice that there is no warranty (or else, saying that you provide<BR DESIGNTIMESP="19576">a warranty) and that users may redistribute the program under<BR DESIGNTIMESP="19577">these conditions, and telling the user how to view a copy of this<BR DESIGNTIMESP="19578">License. (Exception: if the Program itself is interactive but<BR DESIGNTIMESP="19579">does not normally print such an announcement, your work based on<BR DESIGNTIMESP="19580">the Program is not required to print an announcement.)<BR DESIGNTIMESP="19581"><BR DESIGNTIMESP="19582">These requirements apply to the modified work as a whole. If<BR DESIGNTIMESP="19583">identifiable sections of that work are not derived from the Program,<BR DESIGNTIMESP="19584">and can be reasonably considered independent and separate works in<BR DESIGNTIMESP="19585">themselves, then this License, and its terms, do not apply to those<BR DESIGNTIMESP="19586">sections when you distribute them as separate works. But when you<BR DESIGNTIMESP="19587">distribute the same sections as part of a whole which is a work based<BR DESIGNTIMESP="19588">on the Program, the distribution of the whole must be on the terms of<BR DESIGNTIMESP="19589">this License, whose permissions for other licensees extend to the<BR DESIGNTIMESP="19590">entire whole, and thus to each and every part regardless of who wrote it.<BR DESIGNTIMESP="19591"><BR DESIGNTIMESP="19592">Thus, it is not the intent of this section to claim rights or contest<BR DESIGNTIMESP="19593">your rights to work written entirely by you; rather, the intent is to<BR DESIGNTIMESP="19594">exercise the right to control the distribution of derivative or<BR DESIGNTIMESP="19595">collective works based on the Program.<BR DESIGNTIMESP="19596"><BR DESIGNTIMESP="19597">In addition, mere aggregation of another work not based on the Program<BR DESIGNTIMESP="19598">with the Program (or with a work based on the Program) on a volume of<BR DESIGNTIMESP="19599">a storage or distribution medium does not bring the other work under<BR DESIGNTIMESP="19600">the scope of this License.<BR DESIGNTIMESP="19601"><BR DESIGNTIMESP="19602">3. You may copy and distribute the Program (or a work based on it,<BR DESIGNTIMESP="19603">under Section 2) in object code or executable form under the terms of<BR DESIGNTIMESP="19604">Sections 1 and 2 above provided that you also do one of the following:<BR DESIGNTIMESP="19605"><BR DESIGNTIMESP="19606">a) Accompany it with the complete corresponding machine-readable<BR DESIGNTIMESP="19607">source code, which must be distributed under the terms of Sections<BR DESIGNTIMESP="19608">1 and 2 above on a medium customarily used for software interchange; or,<BR DESIGNTIMESP="19609"><BR DESIGNTIMESP="19610">b) Accompany it with a written offer, valid for at least three<BR DESIGNTIMESP="19611">years, to give any third party, for a charge no more than your<BR DESIGNTIMESP="19612">cost of physically performing source distribution, a complete<BR DESIGNTIMESP="19613">machine-readable copy of the corresponding source code, to be<BR DESIGNTIMESP="19614">distributed under the terms of Sections 1 and 2 above on a medium<BR DESIGNTIMESP="19615">customarily used for software interchange; or,<BR DESIGNTIMESP="19616"><BR DESIGNTIMESP="19617">c) Accompany it with the information you received as to the offer<BR DESIGNTIMESP="19618">to distribute corresponding source code. (This alternative is<BR DESIGNTIMESP="19619">allowed only for noncommercial distribution and only if you<BR DESIGNTIMESP="19620">received the program in object code or executable form with such<BR DESIGNTIMESP="19621">an offer, in accord with Subsection b above.)<BR DESIGNTIMESP="19622"><BR DESIGNTIMESP="19623">The source code for a work means the preferred form of the work for<BR DESIGNTIMESP="19624">making modifications to it. For an executable work, complete source<BR DESIGNTIMESP="19625">code means all the source code for all modules it contains, plus any<BR DESIGNTIMESP="19626">associated interface definition files, plus the scripts used to<BR DESIGNTIMESP="19627">control compilation and installation of the executable. However, as a<BR DESIGNTIMESP="19628">special exception, the source code distributed need not include<BR DESIGNTIMESP="19629">anything that is normally distributed (in either source or binary<BR DESIGNTIMESP="19630">form) with the major components (compiler, kernel, and so on) of the<BR DESIGNTIMESP="19631">operating system on which the executable runs, unless that component<BR DESIGNTIMESP="19632">itself accompanies the executable.<BR DESIGNTIMESP="19633"><BR DESIGNTIMESP="19634">If distribution of executable or object code is made by offering<BR DESIGNTIMESP="19635">access to copy from a designated place, then offering equivalent<BR DESIGNTIMESP="19636">access to copy the source code from the same place counts as<BR DESIGNTIMESP="19637">distribution of the source code, even though third parties are not<BR DESIGNTIMESP="19638">compelled to copy the source along with the object code.<BR DESIGNTIMESP="19639"><BR DESIGNTIMESP="19640">4. You may not copy, modify, sublicense, or distribute the Program<BR DESIGNTIMESP="19641">except as expressly provided under this License. Any attempt<BR DESIGNTIMESP="19642">otherwise to copy, modify, sublicense or distribute the Program is<BR DESIGNTIMESP="19643">void, and will automatically terminate your rights under this License.<BR DESIGNTIMESP="19644">However, parties who have received copies, or rights, from you under<BR DESIGNTIMESP="19645">this License will not have their licenses terminated so long as such<BR DESIGNTIMESP="19646">parties remain in full compliance.<BR DESIGNTIMESP="19647"><BR DESIGNTIMESP="19648">5. You are not required to accept this License, since you have not<BR DESIGNTIMESP="19649">signed it. However, nothing else grants you permission to modify or<BR DESIGNTIMESP="19650">distribute the Program or its derivative works. These actions are<BR DESIGNTIMESP="19651">prohibited by law if you do not accept this License. Therefore, by<BR DESIGNTIMESP="19652">modifying or distributing the Program (or any work based on the<BR DESIGNTIMESP="19653">Program), you indicate your acceptance of this License to do so, and<BR DESIGNTIMESP="19654">all its terms and conditions for copying, distributing or modifying<BR DESIGNTIMESP="19655">the Program or works based on it.<BR DESIGNTIMESP="19656"><BR DESIGNTIMESP="19657">6. Each time you redistribute the Program (or any work based on the<BR DESIGNTIMESP="19658">Program), the recipient automatically receives a license from the<BR DESIGNTIMESP="19659">original licensor to copy, distribute or modify the Program subject to<BR DESIGNTIMESP="19660">these terms and conditions. You may not impose any further<BR DESIGNTIMESP="19661">restrictions on the recipients\' exercise of the rights granted herein.<BR DESIGNTIMESP="19662">You are not responsible for enforcing compliance by third parties to<BR DESIGNTIMESP="19663">this License.<BR DESIGNTIMESP="19664"><BR DESIGNTIMESP="19665">7. If, as a consequence of a court judgment or allegation of patent<BR DESIGNTIMESP="19666">infringement or for any other reason (not limited to patent issues),<BR DESIGNTIMESP="19667">conditions are imposed on you (whether by court order, agreement or<BR DESIGNTIMESP="19668">otherwise) that contradict the conditions of this License, they do not<BR DESIGNTIMESP="19669">excuse you from the conditions of this License. If you cannot<BR DESIGNTIMESP="19670">distribute so as to satisfy simultaneously your obligations under this<BR DESIGNTIMESP="19671">License and any other pertinent obligations, then as a consequence you<BR DESIGNTIMESP="19672">may not distribute the Program at all. For example, if a patent<BR DESIGNTIMESP="19673">license would not permit royalty-free redistribution of the Program by<BR DESIGNTIMESP="19674">all those who receive copies directly or indirectly through you, then<BR DESIGNTIMESP="19675">the only way you could satisfy both it and this License would be to<BR DESIGNTIMESP="19676">refrain entirely from distribution of the Program.<BR DESIGNTIMESP="19677"><BR DESIGNTIMESP="19678">If any portion of this section is held invalid or unenforceable under<BR DESIGNTIMESP="19679">any particular circumstance, the balance of the section is intended to<BR DESIGNTIMESP="19680">apply and the section as a whole is intended to apply in other<BR DESIGNTIMESP="19681">circumstances.<BR DESIGNTIMESP="19682"><BR DESIGNTIMESP="19683">It is not the purpose of this section to induce you to infringe any<BR DESIGNTIMESP="19684">patents or other property right claims or to contest validity of any<BR DESIGNTIMESP="19685">such claims; this section has the sole purpose of protecting the<BR DESIGNTIMESP="19686">integrity of the free software distribution system, which is<BR DESIGNTIMESP="19687">implemented by public license practices. Many people have made<BR DESIGNTIMESP="19688">generous contributions to the wide range of software distributed<BR DESIGNTIMESP="19689">through that system in reliance on consistent application of that<BR DESIGNTIMESP="19690">system; it is up to the author/donor to decide if he or she is willing<BR DESIGNTIMESP="19691">to distribute software through any other system and a licensee cannot<BR DESIGNTIMESP="19692">impose that choice.<BR DESIGNTIMESP="19693"><BR DESIGNTIMESP="19694">This section is intended to make thoroughly clear what is believed to<BR DESIGNTIMESP="19695">be a consequence of the rest of this License.<BR DESIGNTIMESP="19696"><BR DESIGNTIMESP="19697">8. If the distribution and/or use of the Program is restricted in<BR DESIGNTIMESP="19698">certain countries either by patents or by copyrighted interfaces, the<BR DESIGNTIMESP="19699">original copyright holder who places the Program under this License<BR DESIGNTIMESP="19700">may add an explicit geographical distribution limitation excluding<BR DESIGNTIMESP="19701">those countries, so that distribution is permitted only in or among<BR DESIGNTIMESP="19702">countries not thus excluded. In such case, this License incorporates<BR DESIGNTIMESP="19703">the limitation as if written in the body of this License.<BR DESIGNTIMESP="19704"><BR DESIGNTIMESP="19705">9. The Free Software Foundation may publish revised and/or new versions<BR DESIGNTIMESP="19706">of the General Public License from time to time. Such new versions will<BR DESIGNTIMESP="19707">be similar in spirit to the present version, but may differ in detail to<BR DESIGNTIMESP="19708">address new problems or concerns.<BR DESIGNTIMESP="19709"><BR DESIGNTIMESP="19710">Each version is given a distinguishing version number. If the Program<BR DESIGNTIMESP="19711">specifies a version number of this License which applies to it and "any<BR DESIGNTIMESP="19712">later version", you have the option of following the terms and conditions<BR DESIGNTIMESP="19713">either of that version or of any later version published by the Free<BR DESIGNTIMESP="19714">Software Foundation. If the Program does not specify a version number of<BR DESIGNTIMESP="19715">this License, you may choose any version ever published by the Free Software<BR DESIGNTIMESP="19716">Foundation.<BR DESIGNTIMESP="19717"><BR DESIGNTIMESP="19718">10. If you wish to incorporate parts of the Program into other free<BR DESIGNTIMESP="19719">programs whose distribution conditions are different, write to the author<BR DESIGNTIMESP="19720">to ask for permission. For software which is copyrighted by the Free<BR DESIGNTIMESP="19721">Software Foundation, write to the Free Software Foundation; we sometimes<BR DESIGNTIMESP="19722">make exceptions for this. Our decision will be guided by the two goals<BR DESIGNTIMESP="19723">of preserving the free status of all derivatives of our free software and<BR DESIGNTIMESP="19724">of promoting the sharing and reuse of software generally.<BR DESIGNTIMESP="19725"><BR DESIGNTIMESP="19726">NO WARRANTY<BR DESIGNTIMESP="19727"><BR DESIGNTIMESP="19728">11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY<BR DESIGNTIMESP="19729">FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN<BR DESIGNTIMESP="19730">OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES<BR DESIGNTIMESP="19731">PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED<BR DESIGNTIMESP="19732">OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF<BR DESIGNTIMESP="19733">MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE ENTIRE RISK AS<BR DESIGNTIMESP="19734">TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU. SHOULD THE<BR DESIGNTIMESP="19735">PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING,<BR DESIGNTIMESP="19736">REPAIR OR CORRECTION.<BR DESIGNTIMESP="19737"><BR DESIGNTIMESP="19738">12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING<BR DESIGNTIMESP="19739">WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR<BR DESIGNTIMESP="19740">REDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES,<BR DESIGNTIMESP="19741">INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING<BR DESIGNTIMESP="19742">OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED<BR DESIGNTIMESP="19743">TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY<BR DESIGNTIMESP="19744">YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER<BR DESIGNTIMESP="19745">PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE<BR DESIGNTIMESP="19746">POSSIBILITY OF SUCH DAMAGES.<BR DESIGNTIMESP="19747"><BR DESIGNTIMESP="19748">END OF TERMS AND CONDITIONS<BR DESIGNTIMESP="19749"><BR DESIGNTIMESP="19750">How to Apply These Terms to Your New Programs<BR DESIGNTIMESP="19751"><BR DESIGNTIMESP="19752">If you develop a new program, and you want it to be of the greatest<BR DESIGNTIMESP="19753">possible use to the public, the best way to achieve this is to make it<BR DESIGNTIMESP="19754">free software which everyone can redistribute and change under these terms.<BR DESIGNTIMESP="19755"><BR DESIGNTIMESP="19756">To do so, attach the following notices to the program. It is safest<BR DESIGNTIMESP="19757">to attach them to the start of each source file to most effectively<BR DESIGNTIMESP="19758">convey the exclusion of warranty; and each file should have at least<BR DESIGNTIMESP="19759">the "copyright" line and a pointer to where the full notice is found.<BR DESIGNTIMESP="19760"><BR DESIGNTIMESP="19761"><ONE DESIGNTIMESP="19762" does. it what of idea brief a and name program?s the give to line><BR DESIGNTIMESP="19763">Copyright (C) <YEAR DESIGNTIMESP="19764"><NAME DESIGNTIMESP="19765" of author><BR DESIGNTIMESP="19766"><BR DESIGNTIMESP="19767">This program is free software; you can redistribute it and/or modify<BR DESIGNTIMESP="19768">it under the terms of the GNU General Public License as published by<BR DESIGNTIMESP="19769">the Free Software Foundation; either version 2 of the License, or<BR DESIGNTIMESP="19770">(at your option) any later version.<BR DESIGNTIMESP="19771"><BR DESIGNTIMESP="19772">This program is distributed in the hope that it will be useful,<BR DESIGNTIMESP="19773">but WITHOUT ANY WARRANTY; without even the implied warranty of<BR DESIGNTIMESP="19774">MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the<BR DESIGNTIMESP="19775">GNU General Public License for more details.<BR DESIGNTIMESP="19776"><BR DESIGNTIMESP="19777">You should have received a copy of the GNU General Public License<BR DESIGNTIMESP="19778">along with this program; if not, write to the Free Software<BR DESIGNTIMESP="19779">Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA<BR DESIGNTIMESP="19780"><BR DESIGNTIMESP="19781"><BR DESIGNTIMESP="19782">Also add information on how to contact you by electronic and paper mail.<BR DESIGNTIMESP="19783"><BR DESIGNTIMESP="19784">If the program is interactive, make it output a short notice like this<BR DESIGNTIMESP="19785">when it starts in an interactive mode:<BR DESIGNTIMESP="19786"><BR DESIGNTIMESP="19787">Gnomovision version 69, Copyright (C) year name of author<BR DESIGNTIMESP="19788">Gnomovision comes with ABSOLUTELY NO WARRANTY; for details type `show w\'.<BR DESIGNTIMESP="19789">This is free software, and you are welcome to redistribute it<BR DESIGNTIMESP="19790">under certain conditions; type `show c\' for details.<BR DESIGNTIMESP="19791"><BR DESIGNTIMESP="19792">The hypothetical commands `show w\' and `show c\' should show the appropriate<BR DESIGNTIMESP="19793">parts of the General Public License. Of course, the commands you use may<BR DESIGNTIMESP="19794">be called something other than `show w\' and `show c\'; they could even be<BR DESIGNTIMESP="19795">mouse-clicks or menu items--whatever suits your program.<BR DESIGNTIMESP="19796"><BR DESIGNTIMESP="19797">You should also get your employer (if you work as a programmer) or your<BR DESIGNTIMESP="19798">school, if any, to sign a "copyright disclaimer" for the program, if<BR DESIGNTIMESP="19799">necessary. Here is a sample; alter the names:<BR DESIGNTIMESP="19800"><BR DESIGNTIMESP="19801">Yoyodyne, Inc., hereby disclaims all copyright interest in the program<BR DESIGNTIMESP="19802">`Gnomovision\' (which makes passes at compilers) written by James Hacker.<BR DESIGNTIMESP="19803"><BR DESIGNTIMESP="19804"><SIGNATURE DESIGNTIMESP="19805" of Coon Ty>1 April 1989<BR DESIGNTIMESP="19806">Ty Coon, President of Vice<BR DESIGNTIMESP="19807"><BR DESIGNTIMESP="19808">This General Public License does not permit incorporating your program into<BR DESIGNTIMESP="19809">proprietary programs. If your program is a subroutine library, you may<BR DESIGNTIMESP="19810">consider it more useful to permit linking proprietary applications with the<BR DESIGNTIMESP="19811">library. If this is what you want to do, use the GNU Library General<BR DESIGNTIMESP="19812">Public License instead of this License. </P>');
INSERT INTO `pgn_text` VALUES (101909, '<P>Below you find a list with available downloads of N/X. Visit our <a HREF="http://sourceforge.net/project/showfiles.php?group_id=47362&release_id=143942" TARGET="_blank">download page at Sourceforge</A> for more information!</P>\r\n<P>&nbsp;</P>');
INSERT INTO `pgn_text` VALUES (100318, '<P DESIGNTIMESP="12203">1. Content <BR>The author reserves the right not to be responsible for the topicality, correctness, completeness or quality of the information provided. Liability claims regarding damage caused by the use of any information provided, including any kind of information which is incomplete or incorrect,will therefore be rejected. <BR>All offers are not-binding and without obligation. Parts of the pages or the complete publication including all offers and information might be extended, changed or partly or completely deleted by the author without separate announcement. <BR><BR>2. Referrals and links <BR>The author is not responsible for any contents linked or referred to from his pages - unless he has full knowledge of illegal contents and would be able to prevent the visitors of his site fromviewing those pages. If any damage occurs by the use of information presented there, only the author of the respective pages might be liable, not the one who has linked to these pages. Furthermore the author is not liable for any postings or messages published by users of discussion boards, guestbooks or mailinglists provided on his page. <BR><BR>3. Copyright <BR>The author intended not to use any copyrighted material for the publication or, if not possible, to indicatethe copyright of the respective object. <BR>The copyright for any material created by the author is reserved. Any duplication or use of objects such as diagrams, sounds or texts in other electronic or printed publications is not permitted without the author\'s agreement. <BR><BR>4. Privacy policy <BR>If the opportunity for the input of personal or business data (email addresses, name, addresses) is given, the input of these data takes place voluntarily. The use and payment of all offered services are permitted - if and so far technically possible and reasonable - without specification of any personal data or under specification of anonymized data or an alias. The use of published postal addresses, telephone or fax numbers and email addresses for marketing purposes is prohibited, offenders sending unwanted spam messages will be punished. <BR><BR>5. Legal validity of this disclaimer <BR>This disclaimer is to be regarded as part of the internet publication which you were referred from. If sections or individual terms of this statement are not legal or correct, the content or validity of the other parts remain uninfluenced by this fact. <BR><BR><BR>6. N/X is a project hosted at Sourceforge.net. For any questions contact Sven Weih (E-Mail: sven_at_nxsystems.org). </P>');
INSERT INTO `pgn_text` VALUES (101919, 'Please read our F.A.Q. first, before you post any questions. The F.A.Q. module also has a form, where you can ask us questions.');
INSERT INTO `pgn_text` VALUES (101928, 'We are collecting feedback of you all and are extracting&nbsp;common errors of first-time developers.');
INSERT INTO `pgn_text` VALUES (101938, 'Read online, how to setup N/X!&nbsp;We provide a very detailed description of how to configure N/X.');
INSERT INTO `pgn_text` VALUES (101948, 'Read our API-documentation online.');
INSERT INTO `pgn_text` VALUES (101958, 'We are thinking about system security. Read our whitepaper here.');
INSERT INTO `pgn_text` VALUES (101976, '<P DESIGNTIMESP="1049"><FONT size=4 DESIGNTIMESP="1050">Programming the website</FONT></P>\r\n<UL DESIGNTIMESP="1051">\r\n<LI DESIGNTIMESP="1052"><FONT size=2 DESIGNTIMESP="1053">The header.inc.php and/or the pagelayout.inc.php in www and wwwdev-folders are different. Make sure, you did not copy one version over the other!</FONT> </LI></UL>\r\n<P DESIGNTIMESP="1052"><BR DESIGNTIMESP="2265"></P>\r\n<UL DESIGNTIMESP="1051">\r\n<LI DESIGNTIMESP="1054"><FONT size=2 DESIGNTIMESP="1055">If you encounter trouble with live-authoring, e.g. the data you entered is not stored, make sure you have no forms in the page. you can strip the form-tag and the closing tag out by checking $sma which is true when you are in live authoring mode.</FONT> </LI></UL>\r\n<P DESIGNTIMESP="1054"><BR DESIGNTIMESP="2268"></P>\r\n<UL DESIGNTIMESP="1051">\r\n<LI DESIGNTIMESP="1056"><FONT size=2 DESIGNTIMESP="1057">When you launched a page or an article, nothing has changed in the live-website? Check the caching settings. Disable the query-cache if the page is under development. If needed also disable the dynamic cache.</FONT></LI></UL>\r\n<P DESIGNTIMESP="1056"><FONT size=2 DESIGNTIMESP="2272"></FONT>&nbsp;</P>\r\n<P DESIGNTIMESP="1056"><FONT size=2 DESIGNTIMESP="2274">Do you think, there is something missing? Please contact us!</FONT></P>');
INSERT INTO `pgn_text` VALUES (101989, '<UL>\r\n<LI>\r\n<DIV DESIGNTIMESP="135"><a HREF="/manuals/NXInstallEN.html" TARGET="_blank" DESIGNTIMESP="138" DESIGNTIMEURL="http://www.nxsystems.org/manuals/NX" ="N.html">Installation Guidelines (English)</A> </DIV></LI>\r\n<LI DESIGNTIMESP="139"><a HREF="/manuals/NXInstallDE.html" TARGET="_blank" DESIGNTIMESP="140" DESIGNTIMEURL="http://www.nxsystems.org/manuals/NX" ="E.html">Installation Guidelines (German)</A></LI></UL>');
INSERT INTO `pgn_text` VALUES (101995, '<P>Please take yourself one day of time to learn N/X with our Getting Started tutorial. After learning you will be able to create your own fascinating websites with the help of the N/X APIs.</P>\r\n<P>&nbsp;</P>\r\n<UL>\r\n<LI><a HREF="http://www.nxsystems.org/manuals/NXGettingStartedEN.html" TARGET="_blank">Getting Started (ENGLISH)</A></LI>\r\n<LI><a HREF="http://www.nxsystems.org/manuals/NXGettingStartedDE.html" TARGET="_blank">Getting Started (GERMAN)</A></LI></UL>');
INSERT INTO `pgn_text` VALUES (102000, '<P DESIGNTIMESP="18605"><FONT size=4 DESIGNTIMESP="19827">The N/X Website API (aka CDS-API)</FONT></P>\r\n<P DESIGNTIMESP="18605"><FONT size=4 DESIGNTIMESP="19904"></FONT>&nbsp;</P>\r\n<P DESIGNTIMESP="18605">The N/X Website API contains all functions that are needed to develop your own web-templates. The API is brought to you by including the file nxheader.inc.php in the wwwdev or www folder.</P>\r\n<P DESIGNTIMESP="18605">&nbsp;</P>\r\n<P DESIGNTIMESP="18605">You can access the N/X CDS-API at:</P>\r\n<UL DESIGNTIMESP="20385">\r\n<LI DESIGNTIMESP="20386">\r\n<DIV DESIGNTIMESP="18605"><a HREF="/manuals/website_api/index.html" TARGET="_blank" DESIGNTIMESP="20388" DESIGNTIMEURL="/manuals/website_api/index.html">http://www.nxsystems.org/manuals/website_api/index.html</A></DIV></LI></UL>\r\n<P DESIGNTIMESP="18609">&nbsp;</P>\r\n<P DESIGNTIMESP="18610">&nbsp;</P>\r\n<P DESIGNTIMESP="18610"><FONT size=4 DESIGNTIMESP="19913">The N/X Backoffice API</FONT></P>\r\n<P DESIGNTIMESP="18610">&nbsp;</P>\r\n<P DESIGNTIMESP="18610">This API is used for developing own modules, extending the system and making modifications. It is also used to build plugins.</P>\r\n<P DESIGNTIMESP="18610">&nbsp;</P>\r\n<P DESIGNTIMESP="18610">You can access the N/X API at:</P>\r\n<UL DESIGNTIMESP="20397">\r\n<LI DESIGNTIMESP="20398">\r\n<DIV DESIGNTIMESP="18610"><a HREF="/manuals/api/index.html" TARGET="_blank" DESIGNTIMESP="20400" DESIGNTIMEURL="/manuals/api/index.html">http://www.nxsystems.org/manuals/api/index.html</A></DIV></LI></UL>\r\n<P DESIGNTIMESP="18610">&nbsp;</P>\r\n<P DESIGNTIMESP="18610">&nbsp;</P>\r\n<P DESIGNTIMESP="18610">Alternatively we offer&nbsp;the APIs&nbsp;on our homepage for {NX:LINK PAGE="101879" DESIGNTIMESP="20404" DESIGNTIMEURL="/homepage/wwwdev/rssdisp.php?page=101214&v=1" V="1" GETVARS=""}download</A>.</P>');
INSERT INTO `pgn_text` VALUES (102453, 'roles are a set of system functions. Each user can have several roles. The system comes with the pre-defined roles editor, developer, quality manager and administrator. However sometimes it is needed to customize this roles or to create new ones. This can be done with the role editor.');
INSERT INTO `pgn_text` VALUES (102458, 'One of the most impressive modules of N/X 4.0 are the page access statistics.');
INSERT INTO `pgn_text` VALUES (102463, '<P>The picture shows the page impressions of the website. The user can define a custom time-span for analysis.</P>');
INSERT INTO `pgn_text` VALUES (102468, '<P>The picture shows the visitor statistics of the website. The user can define a custom time-span for analysis. </P>');
INSERT INTO `pgn_text` VALUES (102473, '<P>The picture shows the top pages of the website. You can also view the top entry and top exit pages of your website.</P>');
INSERT INTO `pgn_text` VALUES (102478, 'This picture shows the click-path analysis. The click-path , also known as click stream, shows the pages users viewed during their visit of your website in the correct order. The data is anonymized and shows top-paths, shortest paths and longest paths. The anaylsis is quite fast!');
INSERT INTO `pgn_text` VALUES (102483, '<P>The oulu team of finland created a help module for N/X. The pictures shows the integrated help. There are is also help within the system when you hover a form-element. The help-message popups after 2-3 seconds hovering the element. </P>');
INSERT INTO `pgn_text` VALUES (100195, '<P DESIGNTIMESP="24915">Read, what is new in the world of N/X. We will provide updates and news regularly here.</P>');
INSERT INTO `pgn_text` VALUES (102020, 'We created about 40 pages of introduction to give you an idea what you can do with N/X.');
INSERT INTO `pgn_text` VALUES (102032, 'Read here, what kind of software and hardware you need to run N/X on you server on your clients.');
INSERT INTO `pgn_text` VALUES (102039, 'You want to know more about the people behind N/X? Read here.');
INSERT INTO `pgn_text` VALUES (100275, '<P DESIGNTIMESP="7847"><FONT size=4 DESIGNTIMESP="10055">Who should use N/X</FONT></P>\r\n<UL DESIGNTIMESP="10056">\r\n<LI DESIGNTIMESP="10057">\r\n<DIV DESIGNTIMESP="7847">Professional&nbsp;developers with knowledge of&nbsp;PHP and databases</DIV>\r\n<LI DESIGNTIMESP="10059">\r\n<DIV DESIGNTIMESP="7847">Organisations, which need a flexible and adjustable system</DIV>\r\n<LI DESIGNTIMESP="10061">\r\n<DIV DESIGNTIMESP="7847">Internet agencies</DIV>\r\n<LI DESIGNTIMESP="10063">\r\n<DIV DESIGNTIMESP="7847">People who need to integrate data from several different sources <BR DESIGNTIMESP="10065">(you will love our plugin interfaces)</DIV>\r\n<LI DESIGNTIMESP="10066">\r\n<DIV DESIGNTIMESP="7847">Designers who are planning to built interactive flash films</DIV>\r\n<LI DESIGNTIMESP="10068">\r\n<DIV DESIGNTIMESP="7847">People who would like to structure their content into objects (clusters) and to reuse it.</DIV></LI></UL>\r\n<P DESIGNTIMESP="7847"><FONT size=4 DESIGNTIMESP="10071"></FONT>&nbsp;</P>\r\n<P DESIGNTIMESP="7847"><FONT size=4 DESIGNTIMESP="10073">Who should not use N/X</FONT></P>\r\n<UL DESIGNTIMESP="10074">\r\n<LI DESIGNTIMESP="10075">\r\n<DIV DESIGNTIMESP="7847"><FONT size=2 DESIGNTIMESP="10077">Anyone who has no technical background, except to editors of the website, which do not need to have any technical knowledge.</FONT></DIV>\r\n<LI DESIGNTIMESP="10078">\r\n<DIV DESIGNTIMESP="7847"><FONT size=2 DESIGNTIMESP="10080">Anyone who has not at least a few hours time&nbsp;for reading our documentation. </FONT></DIV>\r\n<LI DESIGNTIMESP="10078">\r\n<DIV DESIGNTIMESP="7847"><FONT size=2 DESIGNTIMESP="10083">Any designers with no experience with content management</FONT></DIV>\r\n<LI DESIGNTIMESP="10084">\r\n<DIV DESIGNTIMESP="7847"><FONT size=2 DESIGNTIMESP="10086">All the people who would like to quickly build a homepage - use Mambo instead</FONT></DIV>\r\n<LI DESIGNTIMESP="10087">\r\n<DIV DESIGNTIMESP="7847"><FONT size=2 DESIGNTIMESP="10089">All the people who would like to setup a standard portal - use Nuke or xoops instead</FONT></DIV></LI></UL>\r\n<P DESIGNTIMESP="7847"><FONT size=2 DESIGNTIMESP="10091"></FONT>&nbsp;</P>\r\n<P DESIGNTIMESP="7847"><FONT size=2 DESIGNTIMESP="10093">Please contact us, if you think this lists&nbsp;are incomplete.</FONT></P>\r\n<P DESIGNTIMESP="7847"><FONT size=2 DESIGNTIMESP="10095"></FONT>&nbsp;</P>');
INSERT INTO `pgn_text` VALUES (102345, '<P>Next to the sitemap-tree we already saw, N/X offers an article editor, with which you can create new channels. This tour is also made with a channel. Channels are referenced in the website tree whenever this is needed. So you can mix both concepts - develping the website sitemap based and developing the website based on channels.</P>');
INSERT INTO `pgn_text` VALUES (102350, 'Editing an article in the news-channel or another one is as simple as editing a website. You can customize the input-fields for each channel and you can also define multiple formats (based on the new compound clusters concept). In the website you have several possibilities for ordering the articles, e.g. by date or alphanumerically by name.');
INSERT INTO `pgn_text` VALUES (102355, '<P>Starting from atomic content like one image or one text you can build so called clusters with N/X. A cluster is a group of atomic content and/or other clusters. You can build lists, include content fixed (static)&nbsp;or editable (dynamically).</P>');
INSERT INTO `pgn_text` VALUES (102360, '<P>The rollout wizard allow you to copy single pages or a whole tree of a website. Consider you have developed a microsite for one&nbsp;shop of a customer. Just rollout the sample microsite now for other shops.</P>\r\n<P>&nbsp;</P>\r\n<P>The picture shows the selection page of the rollout-wizard.</P>');
INSERT INTO `pgn_text` VALUES (102365, '<P>With N/X you can do intelligent copies of single sites. Because every webpage and also every article is based on a cluster, you can reuse these clusters in other pages or articles. This means, you can get several representations or layouts of one content-page. For example one page XML, one WAP and one HTML. You could also do PDFs. </P>\r\n<P>&nbsp;</P>\r\n<P>What is very useful is sharing content with clusters. Editing one single text in a shared cluster makes the needed changes on every single page. Because you can group clusters and build subclusters you could change one content on every single webpage within minutes.</P>');
INSERT INTO `pgn_text` VALUES (102370, '<P>N/X 4.0 allows you sharing of templates and content with other N/X users.</P>\r\n<P>&nbsp;</P>\r\n<P>The picture shows the export wizard. The user has to select the type he wants to export.</P>');
INSERT INTO `pgn_text` VALUES (102375, 'The user now selects the data-object he wants to export. The files are stored in XML-format. So you can also reuse content in other applications or develop al filter to automate import of content to N/X.');
INSERT INTO `pgn_text` VALUES (102380, 'After adding a short description to the export-file, the system starts sending the data.');
INSERT INTO `pgn_text` VALUES (102383, '<P>After exporting the data the wizard shows a summary.</P>');
INSERT INTO `pgn_text` VALUES (102388, 'The import wizard is at least as intuitive as the export wizard. Before you start the import, the wizard shows you the summary of the file.');
INSERT INTO `pgn_text` VALUES (102393, '<P>Each sitepage is based on one template. N/X knows two template types: singlepages and multipages. A multipage is a collection of several pages with the same layout which located under one logical node. A single page always contains only one content.</P>\r\n<P>&nbsp;</P>\r\n<P>Mulitpages should no longer be used with N/X 4.0. Use Channels instead!</P>');
INSERT INTO `pgn_text` VALUES (102398, 'Page templates can be editied either within the webbrowser or with access to the webserver via webdav. Webdav requires configuration of the webserver by the administrator.');
INSERT INTO `pgn_text` VALUES (102403, '<P DESIGNTIMESP="6680">Each page is based on one cluster and each cluster has a cluster-template. The cluster-template is a definition of fields, that make the layout of a cluster. </P>\r\n<P DESIGNTIMESP="6681">&nbsp;</P>\r\n<P DESIGNTIMESP="6682">Example: You want your page to be made out of one headline, one text and one picture. You will create a cluster template which consists out of three elements: 1 for the headline, 1 for the text and 1 for the picture. More information can be found in the getting-started guide.</P>');
INSERT INTO `pgn_text` VALUES (102408, '<P>A lot of peple asked us, if it is possible to link a template to a cluster. Now it is!</P>\r\n<P>&nbsp;</P>\r\n<P>N/X 4.0 introduces <STRONG>compound clusters</STRONG>. A compound cluster is a cluster which cluster-template is linked to an layout-file. The picture shows the editor of the cluster-layout. It is written in php with the standard Website-API. The only difference is that the common object $cds is replaced by $me.</P>');
INSERT INTO `pgn_text` VALUES (102413, 'N/X 4.0 introduces <STRONG>compound groups</STRONG>. You already learned about compound clusters. You can group several compound clusters now to compound group. This gives you easy ways to create banner rotation or other random or ordered display of content.');
INSERT INTO `pgn_text` VALUES (102418, 'The picture shows the editor of the compound group. The user can add and remove cluster. He can also set a custom order. You may also want to use compound groups for teasering.');
INSERT INTO `pgn_text` VALUES (102423, 'N/X 4.0 introduces a new search engine. The search engine is based on phpDig with some special N/X extensions. The search engine works with an integrated spider which is going through the website to build the search index. This guarantees excellent search results!');
INSERT INTO `pgn_text` VALUES (102428, 'N/X offers a rhich set of maintenance functions to make the admins the administration easier. For example there are wizards that launch a whole website. So you do not need to launch page by page, which can be a very serious problem for larger sites.');
INSERT INTO `pgn_text` VALUES (102433, '<P>As you already know, N/X content library is based on plugins. The picture shows the plugin administration module.</P>');
INSERT INTO `pgn_text` VALUES (102438, 'Of course you can define your own users. Each user can use the system in his own language - if installed.');
INSERT INTO `pgn_text` VALUES (102443, 'Each user can have another right to access the system. The picture shows the permission editor of a user.');
INSERT INTO `pgn_text` VALUES (100228, '<P>&nbsp;</P>');
INSERT INTO `pgn_text` VALUES (102098, 'Take a look at all the sites built with N/X');
INSERT INTO `pgn_text` VALUES (102108, '<P DESIGNTIMESP="4455">Read here, what the media says about N/X.</P>');
INSERT INTO `pgn_text` VALUES (102187, '<P>The following pages have been developed with N/X WCMS. If you want to get listed, please contact us!</P>\r\n<UL>\r\n<LI>ModExotics: <a HREF="http://www.modexotics.com" TARGET="_blank">www.modexotics.com</A></LI>\r\n<LI>Dynamic Flash: <a HREF="http://www.dynamicflash.de" TARGET="_blank">www.dynamicflash.de</A></LI>\r\n<LI>Golf Club Orthenau: <a HREF="http://www.gc-orthenau.de" TARGET="_blank">www.gc-orthenau.de</A></LI>\r\n<LI>Eskapis: <a HREF="http://www.eskapis.de" TARGET="_blank">www.eskapis.de</A></LI>\r\n<LI>Karate Team: <a HREF="http://www.karate-team.de" TARGET="_blank">www.karate-team.de</A></LI>\r\n<LI>Karate Lahr: <a HREF="http://www.karate-lahr.de" TARGET="_blank">www.karate-lahr.de</A></LI>\r\n<LI>Uexkuell & Stollberg, Attornies: <a HREF="http://www.uex.de" TARGET="_blank">www.uex.de</A></LI>\r\n<LI>ELIXIA: <a HREF="http://www.elixia.de" TARGET="_blank">www.elixia.de</A></LI>\r\n<LI>KJG Freiburg: <a HREF="http://www.kjg-freiburg.de" TARGET="_blank">www.kjg-freiburg.de</A></LI></UL>');
INSERT INTO `pgn_text` VALUES (102280, '<P DESIGNTIMESP="14166">The getting started guide and installation manuals are already available for online reading. Take a look at them to get a clue, what was changed in N/X 4.0.</P>\r\n<P DESIGNTIMESP="14167">The new website was designed to give you an idea, what you can do with N/X 4.0. We focused on the N/X tour and online documentation to give you as much information as possible. Enjoy our new site.</P>');
INSERT INTO `pgn_text` VALUES (102281, '<P DESIGNTIMESP="14160">After&nbsp;two years of developments, we have almost finished the developments of N/X 4.0.&nbsp;The new website was built on N/X 4.0.&nbsp;</P>');
INSERT INTO `pgn_text` VALUES (102826, '<P DESIGNTIMESP="29756">Yes. The day has arrived! We will place the first&nbsp;public&nbsp;N/X 4.0 beta under your christmas tree on saturday, 25. december 2005. Thank you all for waiting so long and contributing ideas and code!</P>');
INSERT INTO `pgn_text` VALUES (102827, '<P DESIGNTIMESP="29776">The non-public beta-test began in march of this year. There are already about 25 sites in the web running with N/X 4.0. So we think, the new version can be used productive - but remember it is beta! Contact us, before you want to use it on big projects!</P>\r\n<P DESIGNTIMESP="29777">&nbsp;</P>\r\n<P DESIGNTIMESP="29778">All users who liked the concepts behind N/X 2002 will also love N/X 4.0. All users who did not like the old version due to its user interface or other reasons - take a look at&nbsp; our work: three years of evolution and revolution.</P>');
INSERT INTO `pgn_text` VALUES (102814, 'You might have heard&nbsp;about the confusion that N/X sites were hacked. In fact a worm called Net-Worm.Perl.Santy.a (read more on <a HREF="http://www.kaspersky.com/news?id=156681162" TARGET="_blank">Kaspersky.com</A>) attacked&nbsp;phpBB-based-forums - also our forum and so the N/X homepage which is located on the same server.');
INSERT INTO `pgn_text` VALUES (102815, '<P>The homepage is back. We will discontinue the forum for a while until everything is looking save again. </P>\r\n<P>We introduced {NX:LINK PAGE="101963" TARGET="_blank" GETVARS=""}new security features</A> to the N/X system. However we must admit that all the features are worthless unless the webserver is configured properly and all used software is save. For proper installation of N/X check our {NX:LINK PAGE="101943" TARGET="_blank" GETVARS=""}installation guide with hints to get more secure</A>. (sw)</P>\r\n<P>&nbsp;</P>\r\n<P>&nbsp;</P>');
INSERT INTO `pgn_text` VALUES (102794, '<P>As reported by <a HREF="http://www.heise.de/newsticker/meldung/54320" TARGET="_blank">heise.de</A>&nbsp;the php-versions 4.3.9 up to 5.0.2 have security problems with several functions. Buffer overflows may allow the intrusion of code. N/X 4.0 is&nbsp; not affected of this problems, because none of the buggy functions are used.</P>');
INSERT INTO `pgn_text` VALUES (102795, '<P>N/X is using its own session management without cookies so that any problems arising with cookies and the serialize()/unserialize() functions do not affect the system. </P>\r\n<P>&nbsp;</P>\r\n<P>We started {NX:LINK PAGE="101963" GETVARS=""}thinking about security</A> much earlier and introduced features like IP-locking and a intrusion detection, which parses all incoming variables. Other features like blacklists, whitelists and brute-force-attack-detection are&nbsp;under development. (sw)</P>');
INSERT INTO `pgn_text` VALUES (102292, '<P DESIGNTIMESP="14666">Do you remember the nasty UI of N/X 2002? Well, this times have gone away. N/X 4.0 offers theme based backends. Custimize the look and feel to your needs and create your own skins! Moreover we have rewritten almost every control. In this picture you see the new dynamic website tree.</P>');
INSERT INTO `pgn_text` VALUES (102300, '<P DESIGNTIMESP="14718">Editing content is as simple as in N/X 2002. By pressing the "Edit All" button, the editor can create content. Morever there are now 3 new content types for developers, called Channels - which we see in the picure, compound cluster, which is a cluster with encapsulated layout-routines and cluster-groups, where you can group clusters for automatic banner-rotation, teasering, displaying anything random and so on. N/X 4.0 also offers a new WYSIWYG-Editor for the website. We will cover this in a few steps.</P>');
INSERT INTO `pgn_text` VALUES (102305, 'The new richtext-editor is seemlessly integrated into the userinterface. You can work with tables, insert content from the content-library, place links within the site and so on. The edit control works with internet explorer only at the moment. A version that will also work with mozilla will come when the FCKEditor- Open-Source-Project have a stable release of their editor for firefox. You can also paste content form word, which is parsed and cleaned automatically.');
INSERT INTO `pgn_text` VALUES (102310, '<P>Have a look at the top of the picture. You can see the lanuages selector which says "Standard". You can also see a box which says "Translate from: Disable". </P>\r\n<P>N/X 4.0 offers you new translation capabilities. By selecting another languages and setting the translate from language, the editor gets the following screen.</P>');
INSERT INTO `pgn_text` VALUES (102315, 'Now we are in translation mode. The text you selected as source is displayed above the input field. So the translator can do his work without a need for switching windows or printing the website on paper.');
INSERT INTO `pgn_text` VALUES (102320, 'The completely new written content library stores all atomic content. Content is brought to N/X with plugins. So labels, pictures, texts... are all based on plugins. This enables you to create your own content types and gives you maximum flexibility. The picture show an overview of a folder in the content-library.');
INSERT INTO `pgn_text` VALUES (102325, '<P>You set individual access to&nbsp;pages and folders of the content library. This enables you to ensure, that people only have access to the objects they should have access to.&nbsp;</P>\r\n<P>&nbsp;</P>\r\n<P>The picture shows the access-panel with standard-permissions inherited from the parent object.</P>');
INSERT INTO `pgn_text` VALUES (102330, '<P>Even if a user has the permission to access a page or a folder, you can configure the actions the user can perform individually. Therefore N/X offers predefined roles. A role is a collection of actions a user can take. You can define for each object, which user-groups can access with which roles.</P>\r\n<P>&nbsp;</P>\r\n<P>Of course you can introduce your own roles and customize the permissions individually.</P>');
INSERT INTO `pgn_text` VALUES (102335, 'We are now again in our website. As you have already seen, you can set all properties and content in the tabbed form. The picture shows you settings for the menu text.');
INSERT INTO `pgn_text` VALUES (102340, '<P>This screen shows the property-settings of a page. You can define the livespan of the page, can do some menu settings and change the template.</P>\r\n<P>&nbsp;</P>\r\n<P>You can also do caching settings here. N/X can render static HTML for you (*.html files). You may use this for creating CD-ROMs also. Maybe you already know the trouble that happens when you relaunch one single page. You normally mus also refresh some other pages, when menues change. N/X is doing this automatically by refreshing the menu-entries of all pages on the same menu-level and one level down. You can also specifiy extra-pages, which will be refreshed.</P>');
INSERT INTO `pgn_text` VALUES (100186, '<P>Welcome to the N/X CMS Open Source Project.<BR>N/X is an extensible &nbsp;web content management system written for the lamp environment. </P>\r\n<P>Learn more about N/X and how to realize your visions on these pages.</P>');
INSERT INTO `pgn_text` VALUES (102448, 'N/X uses a group - user -role concept to edit the access to system resource. The picture shows the group editor.');
INSERT INTO `pgn_text` VALUES (102789, '<P>As reported by <a HREF="http://www.heise.de/newsticker/meldung/54320" TARGET="_blank">heise.de</A>&nbsp;the php-versions 4.3.9 up to 5.0.2 have security problems with several functions. Buffer overflows may allow the intrusion of code. N/X 4.0 is&nbsp; not affected of this problems, because none of the buggy functions are used.</P>');
INSERT INTO `pgn_text` VALUES (102790, '<P>N/X is using its own session management without cookies so that any problems arising with cookies and the serialize()/unserialize() functions do not affect the system. </P>\r\n<P>&nbsp;</P>\r\n<P>We started {NX:LINK PAGE="101323" GETVARS=""}thinking about security</A> much earlier and introduced features like IP-locking and a intrusion detection, which parses all incoming variables. Other features like blacklists, whitelists and brute-force-attack-detection are&nbsp;under development. (sw)</P>');
INSERT INTO `pgn_text` VALUES (102809, 'You might have heard&nbsp;about the confusion that N/X sites were hacked. In fact a worm called Net-Worm.Perl.Santy.a (read more on <a HREF="http://www.kaspersky.com/news?id=156681162" TARGET="_blank">Kaspersky.com</A>) attacked&nbsp;phpBB-based-forums - also our forum and so the N/X homepage which is located on the same server.');
INSERT INTO `pgn_text` VALUES (102810, '<P>The homepage is back. We will discontinue the forum for a while until everything is looking save again. </P>\r\n<P>We introduced {NX:LINK TARGET="_blank" PAGE="101323" GETVARS=""}new security features</A> to the N/X system. However we must admit that all the features are worthless unless the webserver is configured properly and all used software is save. For proper installation of N/X check our {NX:LINK TARGET="_blank" PAGE="101299" GETVARS=""}installation guide with hints to get more secure</A>. (sw)</P>\r\n<P>&nbsp;</P>\r\n<P>&nbsp;</P>');
INSERT INTO `pgn_text` VALUES (102821, '<P DESIGNTIMESP="29756">Yes. The day has arrived! We will place the first&nbsp;public&nbsp;N/X 4.0 beta under your christmas tree on saturday, 25. december 2005. Thank you all for waiting so long and contributing ideas and code!</P>');
INSERT INTO `pgn_text` VALUES (102822, '<P DESIGNTIMESP="29776">The non-public beta-test began in march of this year. There are already about 25 sites in the web running with N/X 4.0. So we think, the new version can be used productive - but remember it is beta! Contact us, before you want to use it on big projects!</P>\r\n<P DESIGNTIMESP="29777">&nbsp;</P>\r\n<P DESIGNTIMESP="29778">All users who liked the concepts behind N/X 2002 will also love N/X 4.0. All users who did not like the old version due to its user interface or other reasons - take a look at&nbsp; our work: three years of evolution and revolution.</P>');
INSERT INTO `pgn_text` VALUES (102834, '');

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `pot_accesslog`
#

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
) TYPE=MyISAM CHARSET=latin1 DELAY_KEY_WRITE=1;

#
# Daten für Tabelle `pot_accesslog`
#

INSERT INTO `pot_accesslog` VALUES (1606935154, 1103836515, 1442484102, 0, 1);
INSERT INTO `pot_accesslog` VALUES (1606935154, 1103836553, 441419973, 0, 0);
INSERT INTO `pot_accesslog` VALUES (1606935154, 1103836582, -993680202, 0, 0);
INSERT INTO `pot_accesslog` VALUES (1606935154, 1103836607, -1771750674, 0, 0);
INSERT INTO `pot_accesslog` VALUES (1606935154, 1103836766, 1442484102, 0, 0);

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `pot_add_data`
#

DROP TABLE IF EXISTS `pot_add_data`;
CREATE TABLE `pot_add_data` (
  `accesslog_id` int(11) NOT NULL default '0',
  `data_field` varchar(32) NOT NULL default '',
  `data_value` varchar(255) NOT NULL default '',
  KEY `accesslog_id` (`accesslog_id`)
) TYPE=MyISAM CHARSET=latin1 DELAY_KEY_WRITE=1;

#
# Daten für Tabelle `pot_add_data`
#


# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `pot_documents`
#

DROP TABLE IF EXISTS `pot_documents`;
CREATE TABLE `pot_documents` (
  `data_id` int(11) NOT NULL default '0',
  `string` varchar(255) NOT NULL default '',
  `document_url` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`data_id`)
) TYPE=MyISAM CHARSET=latin1 DELAY_KEY_WRITE=1;

#
# Daten für Tabelle `pot_documents`
#

INSERT INTO `pot_documents` VALUES (1442484102, '100176', 'http://localhost/nxhp/www/');
INSERT INTO `pot_documents` VALUES (441419973, '102025', 'http://localhost/nxhp/www/tour.php');
INSERT INTO `pot_documents` VALUES (-993680202, '100224', 'http://localhost/nxhp/www/index.php');
INSERT INTO `pot_documents` VALUES (-1771750674, '102184', 'http://localhost/nxhp/www/standard.php');

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `pot_exit_targets`
#

DROP TABLE IF EXISTS `pot_exit_targets`;
CREATE TABLE `pot_exit_targets` (
  `data_id` int(11) NOT NULL default '0',
  `string` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`data_id`)
) TYPE=MyISAM CHARSET=latin1 DELAY_KEY_WRITE=1;

#
# Daten für Tabelle `pot_exit_targets`
#


# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `pot_hostnames`
#

DROP TABLE IF EXISTS `pot_hostnames`;
CREATE TABLE `pot_hostnames` (
  `data_id` int(11) NOT NULL default '0',
  `string` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`data_id`)
) TYPE=MyISAM CHARSET=latin1 DELAY_KEY_WRITE=1;

#
# Daten für Tabelle `pot_hostnames`
#

INSERT INTO `pot_hostnames` VALUES (-1983701176, 'nadja');

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `pot_nxlog`
#

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
) TYPE=MyISAM CHARSET=latin1 DELAY_KEY_WRITE=1;

#
# Daten für Tabelle `pot_nxlog`
#

INSERT INTO `pot_nxlog` VALUES (1606935154, 4, 22, 1103836515, 1103836766, 5, 251);

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `pot_operating_systems`
#

DROP TABLE IF EXISTS `pot_operating_systems`;
CREATE TABLE `pot_operating_systems` (
  `data_id` int(11) NOT NULL default '0',
  `string` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`data_id`)
) TYPE=MyISAM CHARSET=latin1 DELAY_KEY_WRITE=1;

#
# Daten für Tabelle `pot_operating_systems`
#

INSERT INTO `pot_operating_systems` VALUES (630865406, 'Windows 2000');

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `pot_referers`
#

DROP TABLE IF EXISTS `pot_referers`;
CREATE TABLE `pot_referers` (
  `data_id` int(11) NOT NULL default '0',
  `string` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`data_id`)
) TYPE=MyISAM CHARSET=latin1 DELAY_KEY_WRITE=1;

#
# Daten für Tabelle `pot_referers`
#


# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `pot_search_engines`
#

DROP TABLE IF EXISTS `pot_search_engines`;
CREATE TABLE `pot_search_engines` (
  `accesslog_id` int(11) NOT NULL default '0',
  `search_engine` varchar(64) NOT NULL default '',
  `keywords` varchar(254) NOT NULL default '',
  PRIMARY KEY  (`accesslog_id`)
) TYPE=MyISAM CHARSET=latin1 DELAY_KEY_WRITE=1;

#
# Daten für Tabelle `pot_search_engines`
#


# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `pot_user_agents`
#

DROP TABLE IF EXISTS `pot_user_agents`;
CREATE TABLE `pot_user_agents` (
  `data_id` int(11) NOT NULL default '0',
  `string` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`data_id`)
) TYPE=MyISAM CHARSET=latin1 DELAY_KEY_WRITE=1;

#
# Daten für Tabelle `pot_user_agents`
#

INSERT INTO `pot_user_agents` VALUES (-795004555, 'compatible Mozilla/5.0');

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `pot_visitors`
#

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
) TYPE=MyISAM CHARSET=latin1 DELAY_KEY_WRITE=1;

#
# Daten für Tabelle `pot_visitors`
#

INSERT INTO `pot_visitors` VALUES (1606935154, 1606935154, 1, 630865406, -795004555, -1983701176, 0, 1103836515, 0);

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `registry`
#

DROP TABLE IF EXISTS `registry`;
CREATE TABLE `registry` (
  `REGID` bigint(20) NOT NULL default '0',
  `REGNAME` varchar(32) NOT NULL default '',
  `VALUE` varchar(255) NOT NULL default '',
  `PARENTREGID` bigint(20) NOT NULL default '0',
  PRIMARY KEY  (`REGID`)
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `registry`
#

INSERT INTO `registry` VALUES (100680, 'PLUGINS', '', 0);
INSERT INTO `registry` VALUES (100681, 'FAQ', '', 100680);
INSERT INTO `registry` VALUES (100682, 'CLT', '100712', 100681);
INSERT INTO `registry` VALUES (101146, 'SYSTEM', '', 0);
INSERT INTO `registry` VALUES (101147, 'MAINTENANCE', '', 101146);
INSERT INTO `registry` VALUES (101148, 'WWWDEV', '', 101147);
INSERT INTO `registry` VALUES (101149, 'WWW', '', 101147);
INSERT INTO `registry` VALUES (101150, 'BB', '', 101147);

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `role_sys_functions`
#

DROP TABLE IF EXISTS `role_sys_functions`;
CREATE TABLE `role_sys_functions` (
  `ROLE_ID` bigint(20) NOT NULL default '0',
  `FUNCTION_ID` char(16) NOT NULL default '',
  KEY `ROLE_ID` (`ROLE_ID`,`FUNCTION_ID`)
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `role_sys_functions`
#

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

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `roles`
#

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `ROLE_ID` bigint(20) NOT NULL default '0',
  `ROLE_NAME` varchar(32) NOT NULL default '',
  `DESCRIPTION` varchar(255) default NULL,
  PRIMARY KEY  (`ROLE_ID`)
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `roles`
#

INSERT INTO `roles` VALUES (1, 'Administrator', '');
INSERT INTO `roles` VALUES (2, 'Developer', '');
INSERT INTO `roles` VALUES (3, 'Editor', '');
INSERT INTO `roles` VALUES (5, 'Quality Manager', 'Checks, wether the quality of content is alright or not.');
INSERT INTO `roles` VALUES (100328, 'Portal Editor', '');
INSERT INTO `roles` VALUES (100329, 'Analyst', '');
INSERT INTO `roles` VALUES (100255, 'Community', '');

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `sequences`
#

DROP TABLE IF EXISTS `sequences`;
CREATE TABLE `sequences` (
  `seq` varchar(32) NOT NULL default '',
  `val` bigint(20) NOT NULL default '1000'
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `sequences`
#

INSERT INTO `sequences` VALUES ('GUID', 102909);
INSERT INTO `sequences` VALUES ('log', 101118);

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `sessions`
#

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `SESSKEY` varchar(32) NOT NULL default '',
  `EXPIRY` int(11) unsigned NOT NULL default '0',
  `DATA` text NOT NULL,
  PRIMARY KEY  (`SESSKEY`)
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `sessions`
#

INSERT INTO `sessions` VALUES ('f899b9d10a2766dc8282ff65c04d4e3d', 1103838207, '_phpOpenTracker_Config%7Ca%3A37%3A%7Bs%3A7%3A%22db_port%22%3Bs%3A7%3A%22default%22%3Bs%3A9%3A%22db_socket%22%3Bs%3A7%3A%22default%22%3Bs%3A21%3A%22additional_data_table%22%3Bs%3A12%3A%22pot_add_data%22%3Bs%3A15%3A%22accesslog_table%22%3Bs%3A13%3A%22pot_accesslog%22%3Bs%3A15%3A%22documents_table%22%3Bs%3A13%3A%22pot_documents%22%3Bs%3A18%3A%22exit_targets_table%22%3Bs%3A16%3A%22pot_exit_targets%22%3Bs%3A15%3A%22hostnames_table%22%3Bs%3A13%3A%22pot_hostnames%22%3Bs%3A23%3A%22operating_systems_table%22%3Bs%3A21%3A%22pot_operating_systems%22%3Bs%3A14%3A%22referers_table%22%3Bs%3A12%3A%22pot_referers%22%3Bs%3A17%3A%22user_agents_table%22%3Bs%3A15%3A%22pot_user_agents%22%3Bs%3A14%3A%22visitors_table%22%3Bs%3A12%3A%22pot_visitors%22%3Bs%3A16%3A%22document_env_var%22%3Bs%3A11%3A%22REQUEST_URI%22%3Bs%3A20%3A%22clean_referer_string%22%3Bs%3A1%3A%221%22%3Bs%3A18%3A%22clean_query_string%22%3Bs%3A1%3A%221%22%3Bs%3A20%3A%22get_parameter_filter%22%3Ba%3A0%3A%7B%7Ds%3A16%3A%22resolve_hostname%22%3Bs%3A1%3A%221%22%3Bs%3A15%3A%22group_hostnames%22%3Bs%3A1%3A%221%22%3Bs%3A17%3A%22group_user_agents%22%3Bs%3A1%3A%221%22%3Bs%3A24%3A%22track_returning_visitors%22%3Bs%3A1%3A%221%22%3Bs%3A25%3A%22returning_visitors_cookie%22%3Bs%3A14%3A%22pot_visitor_id%22%3Bs%3A34%3A%22returning_visitors_cookie_lifetime%22%3Bs%3A3%3A%22365%22%3Bs%3A7%3A%22locking%22%3Bs%3A0%3A%22%22%3Bs%3A10%3A%22log_reload%22%3Bs%3A0%3A%22%22%3Bs%3A12%3A%22jpgraph_path%22%3Bs%3A28%3A%22c%3A%2Fweb%2Fnxhp%2Fcms%2Fext%2Fjpgraph%2F%22%3Bs%3A22%3A%22merge_tables_threshold%22%3Bs%3A1%3A%226%22%3Bs%3A22%3A%22logging_engine_plugins%22%3Ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22nxlog%22%3Bi%3A1%3Bs%3A14%3A%22search_engines%22%3B%7Ds%3A11%3A%22query_cache%22%3Bs%3A0%3A%22%22%3Bs%3A15%3A%22query_cache_dir%22%3Bs%3A5%3A%22%2Ftmp%2F%22%3Bs%3A20%3A%22query_cache_lifetime%22%3Bs%3A4%3A%223600%22%3Bs%3A11%3A%22debug_level%22%3Bs%3A1%3A%221%22%3Bs%3A20%3A%22exit_on_fatal_errors%22%3Bs%3A0%3A%22%22%3Bs%3A10%3A%22log_errors%22%3Bs%3A0%3A%22%22%3Bs%3A7%3A%22db_type%22%3Bs%3A5%3A%22mysql%22%3Bs%3A7%3A%22db_host%22%3Bs%3A9%3A%22localhost%22%3Bs%3A7%3A%22db_user%22%3Bs%3A4%3A%22root%22%3Bs%3A11%3A%22db_password%22%3Bs%3A0%3A%22%22%3Bs%3A11%3A%22db_database%22%3Bs%3A3%3A%22nx4%22%3B%7D_phpOpenTracker_Container%7Ca%3A22%3A%7Bs%3A13%3A%22first_request%22%3Bb%3A0%3Bs%3A9%3A%22client_id%22%3Bi%3A1%3Bs%3A12%3A%22accesslog_id%22%3Bi%3A1606935154%3Bs%3A10%3A%22ip_address%22%3Bs%3A9%3A%22127.0.0.1%22%3Bs%3A9%3A%22host_orig%22%3Bs%3A5%3A%22nadja%22%3Bs%3A4%3A%22host%22%3Bs%3A5%3A%22nadja%22%3Bs%3A15%3A%22user_agent_orig%22%3Bs%3A84%3A%22Mozilla%2F5.0%20%28Windows%3B%20U%3B%20Windows%20NT%205.0%3B%20de-DE%3B%20rv%3A1.7.5%29%20Gecko%2F20041122%20Firefox%2F1.0%22%3Bs%3A16%3A%22operating_system%22%3Bs%3A12%3A%22Windows%202000%22%3Bs%3A10%3A%22user_agent%22%3Bs%3A22%3A%22compatible%20Mozilla%2F5.0%22%3Bs%3A7%3A%22host_id%22%3Bi%3A-1983701176%3Bs%3A19%3A%22operating_system_id%22%3Bi%3A630865406%3Bs%3A13%3A%22user_agent_id%22%3Bi%3A-795004555%3Bs%3A12%3A%22referer_orig%22%3Bs%3A0%3A%22%22%3Bs%3A7%3A%22referer%22%3Bs%3A0%3A%22%22%3Bs%3A10%3A%22referer_id%22%3Bi%3A0%3Bs%3A12%3A%22document_url%22%3Bs%3A35%3A%22http%3A%2F%2Flocalhost%2Fnxhp%2Fwww%2Findex.php%22%3Bs%3A8%3A%22document%22%3Bs%3A6%3A%22100176%22%3Bs%3A11%3A%22document_id%22%3Bi%3A1442484102%3Bs%3A9%3A%22timestamp%22%3Bi%3A1103836766%3Bs%3A10%3A%22visitor_id%22%3Bi%3A1606935154%3Bs%3A17%3A%22returning_visitor%22%3Bb%3A0%3Bs%3A13%3A%22last_document%22%3Bs%3A6%3A%22102184%22%3B%7D');

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `sitemap`
#

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
  PRIMARY KEY  (`MENU_ID`)
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `sitemap`
#

INSERT INTO `sitemap` VALUES (100142, 0, 100127, 'Downloads', 4, 0, 0, 0, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (100298, 0, 100297, 'Servicepages', 6, 0, 0, 0, 0, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (100135, 0, 100127, 'Services', 3, 0, 0, 0, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (100128, 0, 100127, 'About', 2, 0, 0, 0, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (100156, 0, 100127, 'References', 5, 0, 0, 0, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (100208, 100028, 100177, 'About', 2, 0, 0, 10, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (100210, 100028, 100177, 'Services', 3, 0, 0, 10, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (100209, 100028, 100177, 'Downloads', 4, 0, 0, 10, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (100211, 100028, 100177, 'References', 5, 0, 0, 10, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (100276, 100208, 100018, 'For whom is N/X?', 4, 0, 0, 10, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (100240, 100128, 100010, 'For whom is N/X?', 4, 0, 0, 0, 1, 1, 0, '');
INSERT INTO `sitemap` VALUES (100383, 100128, 100347, 'News', 1, 0, 0, 0, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (100302, 100298, 100010, 'Disclaimer', 2, 0, 0, 0, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (100313, 100028, 100309, 'Servicepages', 6, 0, 0, 10, 0, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (100319, 100313, 100018, 'Disclaimer', 2, 0, 0, 10, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (100389, 100128, 100347, 'News Archive', 5, 0, 0, 0, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (100459, 100298, 100458, 'Search', 3, 0, 0, 0, 1, 0, 0, NULL);
INSERT INTO `sitemap` VALUES (100475, 100313, 100477, 'Search', 3, 0, 0, 10, 1, 0, 0, NULL);
INSERT INTO `sitemap` VALUES (100486, 100208, 100489, 'News', 1, 0, 0, 10, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (100487, 100208, 100489, 'News Archive', 5, 0, 0, 10, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (100514, 0, 100297, 'RSS', 7, 0, 0, 0, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (100518, 100514, 100513, 'News', 1, 0, 0, 0, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (100573, 100298, 100572, 'Contact', 1, 0, 0, 0, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (100602, 100313, 100604, 'Contact', 1, 0, 0, 10, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (100601, 100028, 100309, 'RSS', 7, 0, 0, 10, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (100659, 100601, 100651, 'News', 1, 0, 0, 10, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (100716, 100135, 100715, 'FAQ', 2, 0, 0, 0, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (100740, 100716, 100739, 'Ask a Question', 1, 0, 0, 0, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (100774, 100210, 100769, 'FAQ', 2, 0, 0, 10, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (100793, 100774, 100776, 'Ask a Question', 1, 0, 0, 10, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (101152, 100128, 100010, 'Requirements', 3, 0, 0, 0, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (101191, 100135, 100010, 'Common Errors', 1, 0, 0, 0, 1, 1, 0, '');
INSERT INTO `sitemap` VALUES (101203, 100142, 100010, 'License', 2, 0, 0, 0, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (101213, 100142, 101212, 'Downloads', 1, 0, 0, 0, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (101284, 100156, 100010, 'List of N/X pages', 1, 0, 0, 0, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (101293, 100135, 101292, 'Forum', 3, 1, 0, 0, 1, 1, 0, '');
INSERT INTO `sitemap` VALUES (101298, 100135, 100010, 'Installation Documentation', 4, 0, 0, 0, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (101302, 100135, 100010, 'Getting Started Docs', 5, 0, 0, 0, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (101314, 100135, 100010, 'API', 6, 0, 0, 0, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (101346, 100128, 101345, 'N/X 4.0 Tour', 2, 0, 0, 0, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (101580, 100208, 100018, 'Requirements', 3, 0, 0, 10, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (101897, 100209, 100018, 'License', 2, 0, 0, 10, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (101898, 100209, 101900, 'Downloads', 1, 0, 0, 10, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (101965, 100210, 100018, 'Common Errors', 1, 0, 0, 10, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (101966, 100210, 101980, 'Forum', 3, 1, 0, 10, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (101967, 100210, 100018, 'Installation Documentation', 4, 0, 0, 10, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (101968, 100210, 100018, 'Getting Started Docs', 5, 0, 0, 10, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (101969, 100210, 100018, 'API', 6, 0, 0, 10, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (101581, 100208, 102089, 'N/X 4.0 Tour', 2, 0, 0, 10, 1, 1, 0, NULL);
INSERT INTO `sitemap` VALUES (102122, 100211, 100018, 'List of N/X pages', 1, 0, 0, 10, 1, 1, 0, NULL);

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `sitepage`
#

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
  PRIMARY KEY  (`SPID`)
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `sitepage`
#

INSERT INTO `sitepage` VALUES (100143, 100127, 100142, 1, 100144, NULL, NULL, 0, 0, 0);
INSERT INTO `sitepage` VALUES (100303, 100010, 100302, 1, 100304, NULL, NULL, 0, 0, 0);
INSERT INTO `sitepage` VALUES (100136, 100127, 100135, 1, 100137, NULL, NULL, 0, 0, 0);
INSERT INTO `sitepage` VALUES (100129, 100127, 100128, 1, 100130, '2004-07-08 00:00:00', '0000-00-00 00:00:00', 0, 0, 0);
INSERT INTO `sitepage` VALUES (100157, 100127, 100156, 1, 100158, NULL, NULL, 0, 0, 0);
INSERT INTO `sitepage` VALUES (100299, 100297, 100298, 1, 100300, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0);
INSERT INTO `sitepage` VALUES (100176, 100177, 100208, 1, 100183, '2004-07-08 00:00:00', '0000-00-00 00:00:00', 0, 0, 10);
INSERT INTO `sitepage` VALUES (100212, 100177, 100210, 1, 100213, NULL, NULL, 0, 0, 10);
INSERT INTO `sitepage` VALUES (100218, 100177, 100209, 1, 100219, NULL, NULL, 0, 0, 10);
INSERT INTO `sitepage` VALUES (100224, 100177, 100211, 1, 100225, NULL, NULL, 0, 0, 10);
INSERT INTO `sitepage` VALUES (100241, 100010, 100240, 1, 100242, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0);
INSERT INTO `sitepage` VALUES (100271, 100018, 100276, 1, 100272, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 10);
INSERT INTO `sitepage` VALUES (100308, 100309, 100313, 1, 100311, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 10);
INSERT INTO `sitepage` VALUES (100314, 100018, 100319, 1, 100315, NULL, NULL, 0, 0, 10);
INSERT INTO `sitepage` VALUES (100384, 100347, 100383, 1, 100385, NULL, NULL, 0, 0, 0);
INSERT INTO `sitepage` VALUES (100390, 100347, 100389, 1, 100391, NULL, NULL, 0, 0, 0);
INSERT INTO `sitepage` VALUES (100460, 100458, 100459, 1, 100461, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0);
INSERT INTO `sitepage` VALUES (100476, 100477, 100475, 1, 100482, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 10);
INSERT INTO `sitepage` VALUES (100488, 100489, 100486, 1, 100494, NULL, NULL, 0, 0, 10);
INSERT INTO `sitepage` VALUES (100515, 100297, 100514, 1, 100516, NULL, NULL, 0, 0, 0);
INSERT INTO `sitepage` VALUES (100519, 100513, 100518, 1, 100520, NULL, NULL, 0, 0, 0);
INSERT INTO `sitepage` VALUES (100574, 100572, 100573, 1, 100575, NULL, NULL, 0, 0, 0);
INSERT INTO `sitepage` VALUES (100603, 100604, 100602, 1, 100625, NULL, NULL, 0, 0, 10);
INSERT INTO `sitepage` VALUES (100647, 100309, 100601, 1, 100648, NULL, NULL, 0, 0, 10);
INSERT INTO `sitepage` VALUES (100650, 100651, 100659, 1, 100655, NULL, NULL, 0, 0, 10);
INSERT INTO `sitepage` VALUES (100717, 100715, 100716, 1, 100718, NULL, NULL, 0, 0, 0);
INSERT INTO `sitepage` VALUES (100741, 100739, 100740, 1, 100742, NULL, NULL, 0, 0, 0);
INSERT INTO `sitepage` VALUES (100768, 100769, 100774, 1, 100770, NULL, NULL, 0, 0, 10);
INSERT INTO `sitepage` VALUES (100775, 100776, 100793, 1, 100785, NULL, NULL, 0, 0, 10);
INSERT INTO `sitepage` VALUES (101153, 100010, 101152, 1, 101154, NULL, NULL, 0, 0, 0);
INSERT INTO `sitepage` VALUES (101192, 100010, 101191, 1, 101193, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0);
INSERT INTO `sitepage` VALUES (101204, 100010, 101203, 1, 101205, NULL, NULL, 0, 0, 0);
INSERT INTO `sitepage` VALUES (101214, 101212, 101213, 1, 101215, NULL, NULL, 0, 0, 0);
INSERT INTO `sitepage` VALUES (101285, 100010, 101284, 1, 101286, NULL, NULL, 0, 0, 0);
INSERT INTO `sitepage` VALUES (101294, 101292, 101293, 1, 101295, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0);
INSERT INTO `sitepage` VALUES (101299, 100010, 101298, 1, 101300, NULL, NULL, 0, 0, 0);
INSERT INTO `sitepage` VALUES (101303, 100010, 101302, 1, 101304, NULL, NULL, 0, 0, 0);
INSERT INTO `sitepage` VALUES (101315, 100010, 101314, 1, 101316, NULL, NULL, 0, 0, 0);
INSERT INTO `sitepage` VALUES (101347, 101345, 101346, 1, 101348, NULL, NULL, 0, 0, 0);
INSERT INTO `sitepage` VALUES (101575, 100018, 101580, 1, 101576, NULL, NULL, 0, 0, 10);
INSERT INTO `sitepage` VALUES (101889, 100018, 101897, 1, 101891, NULL, NULL, 0, 0, 10);
INSERT INTO `sitepage` VALUES (101879, 101900, 101898, 1, 101906, NULL, NULL, 0, 0, 10);
INSERT INTO `sitepage` VALUES (101933, 100018, 101965, 1, 101974, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 10);
INSERT INTO `sitepage` VALUES (101943, 100018, 101967, 1, 101987, NULL, NULL, 0, 0, 10);
INSERT INTO `sitepage` VALUES (101992, 100018, 101968, 1, 101993, NULL, NULL, 0, 0, 10);
INSERT INTO `sitepage` VALUES (101953, 100018, 101969, 1, 101998, NULL, NULL, 0, 0, 10);
INSERT INTO `sitepage` VALUES (102025, 102089, 101581, 1, 102090, NULL, NULL, 0, 0, 10);
INSERT INTO `sitepage` VALUES (102184, 100018, 102122, 1, 102185, NULL, NULL, 0, 0, 10);
INSERT INTO `sitepage` VALUES (100498, 100489, 100487, 1, 100499, NULL, NULL, 0, 0, 10);
INSERT INTO `sitepage` VALUES (101979, 101980, 101966, 1, 101983, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 10);

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `sitepage_master`
#

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
  PRIMARY KEY  (`SPM_ID`)
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `sitepage_master`
#

INSERT INTO `sitepage_master` VALUES (100010, 'Standard Page', 'Standard page with graphical headline and body.', 'standard.php', 100001, 1, 0, 'bild links oben.png', 0);
INSERT INTO `sitepage_master` VALUES (100018, 'Standard Page', 'Standard page with graphical headline and body.', 'standard.php', 100019, 1, 0, NULL, 10);
INSERT INTO `sitepage_master` VALUES (100127, 'Overview Page 1', 'Teaser overview page', 'index.php', 100122, 1, 0, 'default.png', 0);
INSERT INTO `sitepage_master` VALUES (100177, 'Overview Page 1', 'Teaser overview page', 'index.php', 100178, 1, 0, NULL, 10);
INSERT INTO `sitepage_master` VALUES (100297, 'Empty Page', '', 'empty.php', 100296, 1, 0, 'default.png', 0);
INSERT INTO `sitepage_master` VALUES (100309, 'Empty Page', '', 'empty.php', 100310, 1, 0, NULL, 10);
INSERT INTO `sitepage_master` VALUES (100347, 'Stage', 'Centerstage for displaying articles', 'stage.php', 100344, 1, 0, 'default.png', 0);
INSERT INTO `sitepage_master` VALUES (100458, 'Search Page', '', 'search.php', 100454, 1, 0, 'formular.png', 0);
INSERT INTO `sitepage_master` VALUES (100477, 'Search Page', '', 'search.php', 100478, 1, 0, NULL, 10);
INSERT INTO `sitepage_master` VALUES (100489, 'Stage', 'Centerstage for displaying articles', 'stage.php', 100490, 1, 0, NULL, 10);
INSERT INTO `sitepage_master` VALUES (100513, 'RSS-Feed', '', 'rss.php', 100511, 1, 0, 'default.png', 0);
INSERT INTO `sitepage_master` VALUES (100572, 'Contact Form', 'Contact form', 'contact.php', 100554, 1, 0, 'default.png', 0);
INSERT INTO `sitepage_master` VALUES (100604, 'Contact Form', 'Contact form', 'contact.php', 100605, 1, 0, NULL, 10);
INSERT INTO `sitepage_master` VALUES (100651, 'RSS-Feed', '', 'rss.php', 100652, 1, 0, NULL, 10);
INSERT INTO `sitepage_master` VALUES (100715, 'FAQ Overview', '', 'faq.php', 100001, 1, 0, 'default.png', 0);
INSERT INTO `sitepage_master` VALUES (100739, 'FAQ Form', '', 'faqform.php', 100732, 1, 0, 'default.png', 0);
INSERT INTO `sitepage_master` VALUES (100769, 'FAQ Overview', '', 'faq.php', 100019, 1, 0, NULL, 10);
INSERT INTO `sitepage_master` VALUES (100776, 'FAQ Form', '', 'faqform.php', 100777, 1, 0, NULL, 10);
INSERT INTO `sitepage_master` VALUES (101182, 'Inline Frame', '', 'inline.php', 101177, 1, 0, 'default.png', 0);
INSERT INTO `sitepage_master` VALUES (101212, 'RSS Display', 'Display a foreign rss feed', 'rssdisp.php', 101177, 1, 0, 'default.png', 0);
INSERT INTO `sitepage_master` VALUES (101292, 'External Page', 'Makes an redirect to an external page.', 'external.php', 101290, 1, 0, 'default.png', 0);
INSERT INTO `sitepage_master` VALUES (101345, 'Tour', 'Take a tour through a channel and show impressant features', 'tour.php', 100344, 1, 0, 'default.png', 0);
INSERT INTO `sitepage_master` VALUES (101980, 'External Page', 'Makes an redirect to an external page.', 'external.php', 101981, 1, 0, NULL, 10);
INSERT INTO `sitepage_master` VALUES (101860, 'Overview Page 2', '', 'overview2.php', 100122, 1, 0, 'default.png', 0);
INSERT INTO `sitepage_master` VALUES (101900, 'RSS Display', 'Display a foreign rss feed', 'rssdisp.php', 101901, 1, 0, NULL, 10);
INSERT INTO `sitepage_master` VALUES (102089, 'Tour', 'Take a tour through a channel and show impressant features', 'tour.php', 100490, 1, 0, NULL, 10);

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `sitepage_names`
#

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
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `sitepage_names`
#

INSERT INTO `sitepage_names` VALUES (100136, 1, 'Services', NULL, '', 0, 0);
INSERT INTO `sitepage_names` VALUES (100129, 1, 'About', '', '', 0, 0);
INSERT INTO `sitepage_names` VALUES (100299, 1, 'Servicepages', NULL, '', 0, 0);
INSERT INTO `sitepage_names` VALUES (100143, 1, 'Downloads', NULL, '', 0, 0);
INSERT INTO `sitepage_names` VALUES (100157, 1, 'References', NULL, '', 0, 0);
INSERT INTO `sitepage_names` VALUES (100176, 1, 'About', '', '', 0, 10);
INSERT INTO `sitepage_names` VALUES (100212, 1, 'Services', '', '', 0, 10);
INSERT INTO `sitepage_names` VALUES (100218, 1, 'Downloads', '', '', 0, 10);
INSERT INTO `sitepage_names` VALUES (100224, 1, 'References', '', '', 0, 10);
INSERT INTO `sitepage_names` VALUES (100271, 1, 'For whom is N/X?', '', '', 0, 10);
INSERT INTO `sitepage_names` VALUES (100241, 1, 'For whom is N/X?', NULL, '', 0, 0);
INSERT INTO `sitepage_names` VALUES (100303, 1, 'Disclaimer', NULL, '', 0, 0);
INSERT INTO `sitepage_names` VALUES (100308, 1, 'Servicepages', '', '', 0, 10);
INSERT INTO `sitepage_names` VALUES (100314, 1, 'Disclaimer', '', '', 0, 10);
INSERT INTO `sitepage_names` VALUES (100384, 1, 'News', NULL, '', 0, 0);
INSERT INTO `sitepage_names` VALUES (100390, 1, 'News Archive', NULL, '', 0, 0);
INSERT INTO `sitepage_names` VALUES (100460, 1, 'Search', NULL, '', 0, 0);
INSERT INTO `sitepage_names` VALUES (100476, 1, 'Search', '', '', 0, 10);
INSERT INTO `sitepage_names` VALUES (100488, 1, 'News', '', '', 0, 10);
INSERT INTO `sitepage_names` VALUES (100515, 1, 'RSS', NULL, '', 0, 0);
INSERT INTO `sitepage_names` VALUES (100519, 1, 'News', NULL, '', 0, 0);
INSERT INTO `sitepage_names` VALUES (100574, 1, 'Contact', NULL, '', 0, 0);
INSERT INTO `sitepage_names` VALUES (100603, 1, 'Contact', '', '', 0, 10);
INSERT INTO `sitepage_names` VALUES (100647, 1, 'RSS', '', '', 0, 10);
INSERT INTO `sitepage_names` VALUES (100650, 1, 'News', '', '', 0, 10);
INSERT INTO `sitepage_names` VALUES (100717, 1, 'FAQ', NULL, '', 0, 0);
INSERT INTO `sitepage_names` VALUES (100741, 1, 'Ask a Question', NULL, '', 0, 0);
INSERT INTO `sitepage_names` VALUES (100768, 1, 'FAQ', '', '', 0, 10);
INSERT INTO `sitepage_names` VALUES (100775, 1, 'Ask a Question', '', '', 0, 10);
INSERT INTO `sitepage_names` VALUES (101204, 1, 'License', NULL, '', 0, 0);
INSERT INTO `sitepage_names` VALUES (101214, 1, 'Downloads', NULL, '', 0, 0);
INSERT INTO `sitepage_names` VALUES (101192, 1, 'Common Errors', NULL, '', 0, 0);
INSERT INTO `sitepage_names` VALUES (101153, 1, 'Requirements', NULL, '', 0, 0);
INSERT INTO `sitepage_names` VALUES (101285, 1, 'List of N/X pages', NULL, '', 0, 0);
INSERT INTO `sitepage_names` VALUES (101294, 1, 'Forum', NULL, '', 0, 0);
INSERT INTO `sitepage_names` VALUES (101299, 1, 'Installation', '', '', 0, 0);
INSERT INTO `sitepage_names` VALUES (101303, 1, 'Getting Started', '', '', 0, 0);
INSERT INTO `sitepage_names` VALUES (101315, 1, 'API', NULL, '', 0, 0);
INSERT INTO `sitepage_names` VALUES (101347, 1, 'N/X 4.0 Tour', NULL, '', 0, 0);
INSERT INTO `sitepage_names` VALUES (101575, 1, 'Requirements', '', '', 0, 10);
INSERT INTO `sitepage_names` VALUES (101889, 1, 'License', '', '', 0, 10);
INSERT INTO `sitepage_names` VALUES (101879, 1, 'Downloads', '', '', 0, 10);
INSERT INTO `sitepage_names` VALUES (101933, 1, 'Common Errors', '', '', 0, 10);
INSERT INTO `sitepage_names` VALUES (101943, 1, 'Installation', '', '', 0, 10);
INSERT INTO `sitepage_names` VALUES (101992, 1, 'Getting Started', '', '', 0, 10);
INSERT INTO `sitepage_names` VALUES (101953, 1, 'API', '', '', 0, 10);
INSERT INTO `sitepage_names` VALUES (102025, 1, 'N/X 4.0 Tour', '', '', 0, 10);
INSERT INTO `sitepage_names` VALUES (102184, 1, 'List of N/X pages', '', '', 0, 10);
INSERT INTO `sitepage_names` VALUES (100498, 1, 'News Archive', '', '', 0, 10);
INSERT INTO `sitepage_names` VALUES (101979, 1, 'Forum', '', '', 0, 10);

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `sitepage_owner`
#

DROP TABLE IF EXISTS `sitepage_owner`;
CREATE TABLE `sitepage_owner` (
  `SPID` bigint(20) NOT NULL default '0',
  `GROUP_ID` bigint(20) NOT NULL default '0'
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `sitepage_owner`
#


# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `sitepage_types`
#

DROP TABLE IF EXISTS `sitepage_types`;
CREATE TABLE `sitepage_types` (
  `SPMTYPE_ID` bigint(20) NOT NULL default '0',
  `NAME` varchar(16) NOT NULL default ''
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `sitepage_types`
#

INSERT INTO `sitepage_types` VALUES (1, 'SINGLEPAGE');
INSERT INTO `sitepage_types` VALUES (2, 'MULTIPAGE');
INSERT INTO `sitepage_types` VALUES (3, 'PORTAL');

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `sitepage_variations`
#

DROP TABLE IF EXISTS `sitepage_variations`;
CREATE TABLE `sitepage_variations` (
  `SPM_ID` bigint(20) NOT NULL default '0',
  `VARIATION_ID` bigint(20) NOT NULL default '0'
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `sitepage_variations`
#

INSERT INTO `sitepage_variations` VALUES (100010, 1);
INSERT INTO `sitepage_variations` VALUES (100018, 101362);
INSERT INTO `sitepage_variations` VALUES (100127, 1);
INSERT INTO `sitepage_variations` VALUES (100177, 1);
INSERT INTO `sitepage_variations` VALUES (100297, 1);
INSERT INTO `sitepage_variations` VALUES (100309, 1);
INSERT INTO `sitepage_variations` VALUES (100324, 1);
INSERT INTO `sitepage_variations` VALUES (100347, 1);
INSERT INTO `sitepage_variations` VALUES (100458, 1);
INSERT INTO `sitepage_variations` VALUES (100477, 1);
INSERT INTO `sitepage_variations` VALUES (100489, 1);
INSERT INTO `sitepage_variations` VALUES (100513, 1);
INSERT INTO `sitepage_variations` VALUES (100572, 1);
INSERT INTO `sitepage_variations` VALUES (100604, 1);
INSERT INTO `sitepage_variations` VALUES (100651, 1);
INSERT INTO `sitepage_variations` VALUES (100715, 1);
INSERT INTO `sitepage_variations` VALUES (100739, 1);
INSERT INTO `sitepage_variations` VALUES (100769, 1);
INSERT INTO `sitepage_variations` VALUES (100776, 1);
INSERT INTO `sitepage_variations` VALUES (101182, 1);
INSERT INTO `sitepage_variations` VALUES (101212, 1);
INSERT INTO `sitepage_variations` VALUES (101292, 1);
INSERT INTO `sitepage_variations` VALUES (101343, 1);
INSERT INTO `sitepage_variations` VALUES (101345, 1);
INSERT INTO `sitepage_variations` VALUES (100010, 101362);
INSERT INTO `sitepage_variations` VALUES (100018, 1);
INSERT INTO `sitepage_variations` VALUES (101860, 101362);
INSERT INTO `sitepage_variations` VALUES (101860, 1);
INSERT INTO `sitepage_variations` VALUES (101900, 1);
INSERT INTO `sitepage_variations` VALUES (101980, 1);
INSERT INTO `sitepage_variations` VALUES (102089, 1);

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `state_translation`
#

DROP TABLE IF EXISTS `state_translation`;
CREATE TABLE `state_translation` (
  `IN_ID` bigint(20) NOT NULL default '0',
  `OUT_ID` bigint(20) NOT NULL default '0',
  `LEVEL` tinyint(4) NOT NULL default '1',
  `MODIFIED` timestamp NOT NULL,
  `EXPIRED` tinyint(4) NOT NULL default '0',
  KEY `IN_ID` (`IN_ID`)
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `state_translation`
#

INSERT INTO `state_translation` VALUES (100012, 100017, 10, '2004-06-17 20:22:29', 1);
INSERT INTO `state_translation` VALUES (100010, 100018, 10, '2004-05-13 00:43:21', 0);
INSERT INTO `state_translation` VALUES (100001, 100019, 10, '2004-12-23 22:12:22', 0);
INSERT INTO `state_translation` VALUES (2, 100020, 10, '2004-12-23 22:12:30', 0);
INSERT INTO `state_translation` VALUES (100002, 100021, 10, '2004-12-23 22:11:14', 0);
INSERT INTO `state_translation` VALUES (100003, 100022, 10, '2004-12-23 22:11:14', 0);
INSERT INTO `state_translation` VALUES (100013, 100023, 10, '2004-05-13 13:13:58', 0);
INSERT INTO `state_translation` VALUES (100014, 100024, 10, '2004-06-17 20:22:29', 1);
INSERT INTO `state_translation` VALUES (100015, 100025, 10, '2004-05-13 13:13:58', 0);
INSERT INTO `state_translation` VALUES (100016, 100026, 10, '2004-05-13 13:14:00', 0);
INSERT INTO `state_translation` VALUES (100011, 100027, 10, '2004-06-17 20:22:29', 1);
INSERT INTO `state_translation` VALUES (0, 100028, 10, '2004-12-23 22:13:24', 0);
INSERT INTO `state_translation` VALUES (100042, 100047, 10, '2004-06-17 20:22:16', 1);
INSERT INTO `state_translation` VALUES (100043, 100048, 10, '2004-06-17 18:41:43', 0);
INSERT INTO `state_translation` VALUES (100044, 100049, 10, '2004-06-17 20:22:16', 1);
INSERT INTO `state_translation` VALUES (100045, 100050, 10, '2004-06-17 18:41:43', 0);
INSERT INTO `state_translation` VALUES (100046, 100051, 10, '2004-06-17 18:41:44', 0);
INSERT INTO `state_translation` VALUES (100041, 100052, 10, '2004-06-17 20:22:16', 1);
INSERT INTO `state_translation` VALUES (100029, 100053, 10, '2004-06-17 20:22:46', 1);
INSERT INTO `state_translation` VALUES (100035, 100054, 10, '2004-06-17 20:22:59', 1);
INSERT INTO `state_translation` VALUES (100030, 100055, 10, '2004-06-17 20:22:46', 1);
INSERT INTO `state_translation` VALUES (100031, 100056, 10, '2004-05-13 14:13:19', 0);
INSERT INTO `state_translation` VALUES (100032, 100057, 10, '2004-06-17 20:22:46', 1);
INSERT INTO `state_translation` VALUES (100033, 100058, 10, '2004-05-13 14:13:19', 0);
INSERT INTO `state_translation` VALUES (100034, 100059, 10, '2004-05-13 14:13:20', 0);
INSERT INTO `state_translation` VALUES (100036, 100060, 10, '2004-06-17 20:22:59', 1);
INSERT INTO `state_translation` VALUES (100037, 100061, 10, '2004-05-13 14:13:49', 0);
INSERT INTO `state_translation` VALUES (100038, 100062, 10, '2004-06-17 20:22:59', 1);
INSERT INTO `state_translation` VALUES (100039, 100063, 10, '2004-05-13 14:13:49', 0);
INSERT INTO `state_translation` VALUES (100040, 100064, 10, '2004-05-13 14:13:49', 0);
INSERT INTO `state_translation` VALUES (100075, 100076, 10, '2004-06-22 11:48:26', 0);
INSERT INTO `state_translation` VALUES (100088, 100089, 10, '2004-12-23 22:11:14', 0);
INSERT INTO `state_translation` VALUES (100074, 100090, 10, '2004-12-23 22:11:58', 0);
INSERT INTO `state_translation` VALUES (100066, 100091, 10, '2004-12-23 22:11:02', 0);
INSERT INTO `state_translation` VALUES (100067, 100092, 10, '2004-12-23 22:11:02', 0);
INSERT INTO `state_translation` VALUES (100068, 100093, 10, '2004-12-23 22:11:02', 0);
INSERT INTO `state_translation` VALUES (100069, 100094, 10, '2004-12-23 22:11:02', 0);
INSERT INTO `state_translation` VALUES (100070, 100095, 10, '2004-12-23 22:11:02', 0);
INSERT INTO `state_translation` VALUES (100071, 100096, 10, '2004-12-23 22:11:02', 0);
INSERT INTO `state_translation` VALUES (100072, 100097, 10, '2004-12-23 22:11:02', 0);
INSERT INTO `state_translation` VALUES (100073, 100098, 10, '2004-12-23 22:11:02', 0);
INSERT INTO `state_translation` VALUES (100077, 100099, 10, '2004-12-23 22:11:04', 0);
INSERT INTO `state_translation` VALUES (100078, 100100, 10, '2004-12-23 22:11:05', 0);
INSERT INTO `state_translation` VALUES (100079, 100101, 10, '2004-12-23 22:11:05', 0);
INSERT INTO `state_translation` VALUES (100080, 100102, 10, '2004-12-23 22:11:05', 0);
INSERT INTO `state_translation` VALUES (100081, 100103, 10, '2004-12-23 22:11:05', 0);
INSERT INTO `state_translation` VALUES (100082, 100104, 10, '2004-12-23 22:11:06', 0);
INSERT INTO `state_translation` VALUES (100083, 100105, 10, '2004-12-23 22:11:06', 0);
INSERT INTO `state_translation` VALUES (100084, 100106, 10, '2004-12-23 22:11:06', 0);
INSERT INTO `state_translation` VALUES (100085, 100107, 10, '2004-12-23 22:11:07', 0);
INSERT INTO `state_translation` VALUES (100086, 100108, 10, '2004-12-23 22:11:07', 0);
INSERT INTO `state_translation` VALUES (100087, 100109, 10, '2004-12-23 22:11:07', 0);
INSERT INTO `state_translation` VALUES (100116, 100117, 10, '2004-06-17 20:01:29', 0);
INSERT INTO `state_translation` VALUES (100150, 100155, 10, '2004-06-17 20:25:33', 1);
INSERT INTO `state_translation` VALUES (100164, 100170, 10, '2004-06-17 20:32:37', 0);
INSERT INTO `state_translation` VALUES (100129, 100176, 10, '2004-12-23 22:12:18', 0);
INSERT INTO `state_translation` VALUES (100127, 100177, 10, '2004-06-17 21:11:59', 0);
INSERT INTO `state_translation` VALUES (100122, 100178, 10, '2004-12-23 22:12:22', 0);
INSERT INTO `state_translation` VALUES (100123, 100179, 10, '2004-12-23 22:11:00', 0);
INSERT INTO `state_translation` VALUES (100124, 100180, 10, '2004-12-23 22:11:01', 0);
INSERT INTO `state_translation` VALUES (100125, 100181, 10, '2004-12-23 22:11:01', 0);
INSERT INTO `state_translation` VALUES (100126, 100182, 10, '2004-12-23 22:11:08', 0);
INSERT INTO `state_translation` VALUES (100130, 100183, 10, '2004-12-23 22:12:18', 0);
INSERT INTO `state_translation` VALUES (100131, 100184, 10, '2004-06-22 23:38:09', 0);
INSERT INTO `state_translation` VALUES (100132, 100185, 10, '2004-12-23 22:11:51', 0);
INSERT INTO `state_translation` VALUES (100133, 100186, 10, '2004-12-23 22:11:51', 0);
INSERT INTO `state_translation` VALUES (100134, 100187, 10, '2004-12-23 22:11:51', 0);
INSERT INTO `state_translation` VALUES (100163, 100188, 10, '2004-12-23 22:11:52', 0);
INSERT INTO `state_translation` VALUES (100110, 100189, 10, '2004-12-23 22:12:04', 0);
INSERT INTO `state_translation` VALUES (100111, 100190, 10, '2004-12-23 22:11:10', 0);
INSERT INTO `state_translation` VALUES (100112, 100191, 10, '2004-12-23 22:11:10', 0);
INSERT INTO `state_translation` VALUES (100113, 100192, 10, '2004-12-23 22:11:10', 0);
INSERT INTO `state_translation` VALUES (100114, 100193, 10, '2004-12-23 22:11:10', 0);
INSERT INTO `state_translation` VALUES (100165, 100194, 10, '2004-12-23 22:11:52', 0);
INSERT INTO `state_translation` VALUES (100166, 100195, 10, '2004-12-23 22:11:52', 0);
INSERT INTO `state_translation` VALUES (100167, 100196, 10, '2004-12-23 22:11:52', 0);
INSERT INTO `state_translation` VALUES (100172, 100197, 10, '2004-10-06 12:38:28', 0);
INSERT INTO `state_translation` VALUES (100173, 100198, 10, '2004-10-06 12:38:28', 0);
INSERT INTO `state_translation` VALUES (100168, 100199, 10, '2004-12-23 22:11:52', 0);
INSERT INTO `state_translation` VALUES (100169, 100200, 10, '2004-10-06 12:38:28', 0);
INSERT INTO `state_translation` VALUES (100115, 100201, 10, '2004-10-06 12:38:28', 0);
INSERT INTO `state_translation` VALUES (100118, 100202, 10, '2004-10-06 12:38:28', 0);
INSERT INTO `state_translation` VALUES (100119, 100203, 10, '2004-10-06 12:38:30', 0);
INSERT INTO `state_translation` VALUES (100120, 100204, 10, '2004-10-06 12:38:30', 0);
INSERT INTO `state_translation` VALUES (100174, 100205, 10, '2004-10-06 12:38:30', 0);
INSERT INTO `state_translation` VALUES (100175, 100206, 10, '2004-10-06 12:38:30', 0);
INSERT INTO `state_translation` VALUES (100121, 100207, 10, '2004-10-06 12:38:30', 0);
INSERT INTO `state_translation` VALUES (100128, 100208, 10, '2004-12-23 22:12:18', 0);
INSERT INTO `state_translation` VALUES (100142, 100209, 10, '2004-12-23 22:12:10', 0);
INSERT INTO `state_translation` VALUES (100135, 100210, 10, '2004-12-23 22:12:14', 0);
INSERT INTO `state_translation` VALUES (100156, 100211, 10, '2004-12-23 22:12:22', 0);
INSERT INTO `state_translation` VALUES (100136, 100212, 10, '2004-12-23 22:12:14', 0);
INSERT INTO `state_translation` VALUES (100137, 100213, 10, '2004-12-23 22:12:14', 0);
INSERT INTO `state_translation` VALUES (100138, 100214, 10, '2004-06-22 23:38:08', 0);
INSERT INTO `state_translation` VALUES (100139, 100215, 10, '2004-12-23 22:11:32', 0);
INSERT INTO `state_translation` VALUES (100140, 100216, 10, '2004-12-23 22:11:33', 0);
INSERT INTO `state_translation` VALUES (100141, 100217, 10, '2004-12-23 22:11:33', 0);
INSERT INTO `state_translation` VALUES (100143, 100218, 10, '2004-12-23 22:12:10', 0);
INSERT INTO `state_translation` VALUES (100144, 100219, 10, '2004-12-23 22:12:10', 0);
INSERT INTO `state_translation` VALUES (100145, 100220, 10, '2004-06-17 21:12:19', 0);
INSERT INTO `state_translation` VALUES (100146, 100221, 10, '2004-12-23 22:11:09', 0);
INSERT INTO `state_translation` VALUES (100147, 100222, 10, '2004-12-23 22:11:09', 0);
INSERT INTO `state_translation` VALUES (100148, 100223, 10, '2004-12-23 22:11:09', 0);
INSERT INTO `state_translation` VALUES (100157, 100224, 10, '2004-12-23 22:12:22', 0);
INSERT INTO `state_translation` VALUES (100158, 100225, 10, '2004-12-23 22:12:22', 0);
INSERT INTO `state_translation` VALUES (100159, 100226, 10, '2004-06-17 21:13:53', 0);
INSERT INTO `state_translation` VALUES (100160, 100227, 10, '2004-12-23 22:12:03', 0);
INSERT INTO `state_translation` VALUES (100161, 100228, 10, '2004-12-23 22:12:03', 0);
INSERT INTO `state_translation` VALUES (100162, 100229, 10, '2004-12-23 22:12:04', 0);
INSERT INTO `state_translation` VALUES (100241, 100271, 10, '2004-12-23 22:12:19', 0);
INSERT INTO `state_translation` VALUES (100242, 100272, 10, '2004-12-23 22:12:19', 0);
INSERT INTO `state_translation` VALUES (100243, 100273, 10, '2004-06-22 23:38:13', 0);
INSERT INTO `state_translation` VALUES (100244, 100274, 10, '2004-12-23 22:11:56', 0);
INSERT INTO `state_translation` VALUES (100245, 100275, 10, '2004-12-23 22:11:56', 0);
INSERT INTO `state_translation` VALUES (100240, 100276, 10, '2004-12-23 22:12:19', 0);
INSERT INTO `state_translation` VALUES (100252, 100277, 10, '2004-12-22 18:12:36', 1);
INSERT INTO `state_translation` VALUES (100253, 100278, 10, '2004-12-22 18:12:36', 1);
INSERT INTO `state_translation` VALUES (100254, 100279, 10, '2004-12-08 14:46:57', 0);
INSERT INTO `state_translation` VALUES (100255, 100280, 10, '2004-12-22 18:12:35', 1);
INSERT INTO `state_translation` VALUES (100256, 100281, 10, '2004-12-08 14:46:50', 0);
INSERT INTO `state_translation` VALUES (100257, 100282, 10, '2004-12-08 14:46:50', 0);
INSERT INTO `state_translation` VALUES (100258, 100283, 10, '2004-12-08 14:46:50', 0);
INSERT INTO `state_translation` VALUES (100260, 100284, 10, '2004-12-22 18:12:37', 1);
INSERT INTO `state_translation` VALUES (100261, 100285, 10, '2004-12-08 14:46:57', 0);
INSERT INTO `state_translation` VALUES (100262, 100286, 10, '2004-12-22 18:12:37', 1);
INSERT INTO `state_translation` VALUES (100263, 100287, 10, '2004-12-08 14:46:50', 0);
INSERT INTO `state_translation` VALUES (100264, 100288, 10, '2004-12-08 14:46:50', 0);
INSERT INTO `state_translation` VALUES (100259, 100289, 10, '2004-12-22 18:12:37', 1);
INSERT INTO `state_translation` VALUES (100265, 100290, 10, '2004-12-22 18:12:40', 1);
INSERT INTO `state_translation` VALUES (100266, 100291, 10, '2004-12-22 18:12:40', 1);
INSERT INTO `state_translation` VALUES (100267, 100292, 10, '2004-12-08 14:46:57', 0);
INSERT INTO `state_translation` VALUES (100268, 100293, 10, '2004-12-22 18:12:40', 1);
INSERT INTO `state_translation` VALUES (100269, 100294, 10, '2004-12-08 14:46:50', 0);
INSERT INTO `state_translation` VALUES (100270, 100295, 10, '2004-12-08 14:46:50', 0);
INSERT INTO `state_translation` VALUES (100299, 100308, 10, '2004-12-23 22:12:12', 0);
INSERT INTO `state_translation` VALUES (100297, 100309, 10, '2004-06-22 14:13:20', 0);
INSERT INTO `state_translation` VALUES (100296, 100310, 10, '2004-12-23 22:12:23', 0);
INSERT INTO `state_translation` VALUES (100300, 100311, 10, '2004-12-23 22:12:12', 0);
INSERT INTO `state_translation` VALUES (100301, 100312, 10, '2004-06-22 23:38:07', 0);
INSERT INTO `state_translation` VALUES (100298, 100313, 10, '2004-12-23 22:12:12', 0);
INSERT INTO `state_translation` VALUES (100303, 100314, 10, '2004-12-23 22:12:12', 0);
INSERT INTO `state_translation` VALUES (100304, 100315, 10, '2004-12-23 22:12:12', 0);
INSERT INTO `state_translation` VALUES (100305, 100316, 10, '2004-06-22 23:38:07', 0);
INSERT INTO `state_translation` VALUES (100306, 100317, 10, '2004-12-23 22:11:24', 0);
INSERT INTO `state_translation` VALUES (100307, 100318, 10, '2004-12-23 22:11:24', 0);
INSERT INTO `state_translation` VALUES (100302, 100319, 10, '2004-12-23 22:12:12', 0);
INSERT INTO `state_translation` VALUES (100330, 100334, 10, '2004-12-08 13:52:49', 1);
INSERT INTO `state_translation` VALUES (100336, 100340, 10, '2004-07-27 21:06:40', 1);
INSERT INTO `state_translation` VALUES (100335, 100348, 10, '2004-07-27 21:05:57', 0);
INSERT INTO `state_translation` VALUES (100320, 100349, 10, '2004-12-23 22:12:28', 0);
INSERT INTO `state_translation` VALUES (100341, 100350, 10, '2004-12-23 22:12:24', 0);
INSERT INTO `state_translation` VALUES (100322, 100351, 10, '2004-12-23 22:12:24', 0);
INSERT INTO `state_translation` VALUES (100323, 100352, 10, '2004-12-23 22:12:25', 0);
INSERT INTO `state_translation` VALUES (100337, 100353, 10, '2004-07-27 21:05:57', 0);
INSERT INTO `state_translation` VALUES (100321, 100354, 10, '2004-06-23 13:07:59', 0);
INSERT INTO `state_translation` VALUES (100338, 100355, 10, '2004-07-27 21:05:57', 0);
INSERT INTO `state_translation` VALUES (100339, 100356, 10, '2004-07-27 21:05:57', 0);
INSERT INTO `state_translation` VALUES (100342, 100357, 10, '2004-07-27 21:05:57', 0);
INSERT INTO `state_translation` VALUES (100329, 100358, 10, '2004-10-05 12:07:25', 0);
INSERT INTO `state_translation` VALUES (100331, 100359, 10, '2004-10-05 12:07:25', 0);
INSERT INTO `state_translation` VALUES (100332, 100360, 10, '2004-10-05 12:07:25', 0);
INSERT INTO `state_translation` VALUES (100333, 100361, 10, '2004-10-05 12:07:25', 0);
INSERT INTO `state_translation` VALUES (100343, 100362, 10, '2004-10-05 12:07:25', 0);
INSERT INTO `state_translation` VALUES (100364, 100368, 10, '2004-06-23 17:19:35', 1);
INSERT INTO `state_translation` VALUES (100370, 100374, 10, '2004-06-23 17:08:50', 1);
INSERT INTO `state_translation` VALUES (100363, 100375, 10, '2004-06-23 17:19:33', 0);
INSERT INTO `state_translation` VALUES (100365, 100376, 10, '2004-06-23 17:19:33', 0);
INSERT INTO `state_translation` VALUES (100366, 100377, 10, '2004-06-23 17:19:33', 0);
INSERT INTO `state_translation` VALUES (100367, 100378, 10, '2004-06-23 17:19:33', 0);
INSERT INTO `state_translation` VALUES (100369, 100379, 10, '2004-06-23 17:03:45', 0);
INSERT INTO `state_translation` VALUES (100371, 100380, 10, '2004-06-23 17:03:45', 0);
INSERT INTO `state_translation` VALUES (100372, 100381, 10, '2004-06-23 17:03:45', 0);
INSERT INTO `state_translation` VALUES (100373, 100382, 10, '2004-06-23 17:03:45', 0);
INSERT INTO `state_translation` VALUES (100396, 100465, 10, '2004-12-23 22:11:02', 0);
INSERT INTO `state_translation` VALUES (100398, 100466, 10, '2004-12-23 22:11:02', 0);
INSERT INTO `state_translation` VALUES (100399, 100467, 10, '2004-12-23 22:11:03', 0);
INSERT INTO `state_translation` VALUES (100400, 100468, 10, '2004-12-23 22:11:03', 0);
INSERT INTO `state_translation` VALUES (100401, 100469, 10, '2004-12-23 22:11:03', 0);
INSERT INTO `state_translation` VALUES (100403, 100470, 10, '2004-12-23 22:11:07', 0);
INSERT INTO `state_translation` VALUES (100402, 100471, 10, '2004-12-23 22:11:08', 0);
INSERT INTO `state_translation` VALUES (100397, 100472, 10, '2004-12-23 22:11:08', 0);
INSERT INTO `state_translation` VALUES (100405, 100473, 10, '2004-12-23 22:11:08', 0);
INSERT INTO `state_translation` VALUES (100404, 100474, 10, '2004-12-23 22:11:08', 0);
INSERT INTO `state_translation` VALUES (100459, 100475, 10, '2004-12-23 22:12:13', 0);
INSERT INTO `state_translation` VALUES (100460, 100476, 10, '2004-12-23 22:12:13', 0);
INSERT INTO `state_translation` VALUES (100458, 100477, 10, '2004-06-28 23:51:44', 0);
INSERT INTO `state_translation` VALUES (100454, 100478, 10, '2004-12-23 22:12:13', 0);
INSERT INTO `state_translation` VALUES (100455, 100479, 10, '2004-12-23 22:11:25', 0);
INSERT INTO `state_translation` VALUES (100456, 100480, 10, '2004-12-23 22:11:25', 0);
INSERT INTO `state_translation` VALUES (100457, 100481, 10, '2004-12-23 22:11:25', 0);
INSERT INTO `state_translation` VALUES (100461, 100482, 10, '2004-12-23 22:12:13', 0);
INSERT INTO `state_translation` VALUES (100462, 100483, 10, '2004-06-28 23:54:56', 0);
INSERT INTO `state_translation` VALUES (100464, 100484, 10, '2004-12-23 22:11:26', 0);
INSERT INTO `state_translation` VALUES (100463, 100485, 10, '2004-12-23 22:11:26', 0);
INSERT INTO `state_translation` VALUES (100383, 100486, 10, '2004-12-23 22:12:20', 0);
INSERT INTO `state_translation` VALUES (100389, 100487, 10, '2004-12-23 22:12:20', 0);
INSERT INTO `state_translation` VALUES (100384, 100488, 10, '2004-12-23 22:12:19', 0);
INSERT INTO `state_translation` VALUES (100347, 100489, 10, '2004-06-28 23:51:55', 0);
INSERT INTO `state_translation` VALUES (100344, 100490, 10, '2004-12-23 22:12:21', 0);
INSERT INTO `state_translation` VALUES (100345, 100491, 10, '2004-12-23 22:11:57', 0);
INSERT INTO `state_translation` VALUES (100346, 100492, 10, '2004-12-23 22:11:57', 0);
INSERT INTO `state_translation` VALUES (100395, 100493, 10, '2004-12-23 22:11:58', 0);
INSERT INTO `state_translation` VALUES (100385, 100494, 10, '2004-12-23 22:12:20', 0);
INSERT INTO `state_translation` VALUES (100386, 100495, 10, '2004-06-28 23:51:55', 0);
INSERT INTO `state_translation` VALUES (100387, 100496, 10, '2004-12-23 22:11:58', 0);
INSERT INTO `state_translation` VALUES (100388, 100497, 10, '2004-12-23 22:11:58', 0);
INSERT INTO `state_translation` VALUES (100390, 100498, 10, '2004-12-23 22:12:20', 0);
INSERT INTO `state_translation` VALUES (100391, 100499, 10, '2004-12-23 22:12:20', 0);
INSERT INTO `state_translation` VALUES (100392, 100500, 10, '2004-12-23 22:11:59', 0);
INSERT INTO `state_translation` VALUES (100393, 100501, 10, '2004-12-23 22:11:59', 0);
INSERT INTO `state_translation` VALUES (100394, 100502, 10, '2004-12-23 22:11:59', 0);
INSERT INTO `state_translation` VALUES (100530, 100533, 10, '2004-06-30 16:23:43', 0);
INSERT INTO `state_translation` VALUES (100532, 100536, 10, '2004-06-30 14:17:08', 0);
INSERT INTO `state_translation` VALUES (100531, 100539, 10, '2004-10-05 12:16:46', 0);
INSERT INTO `state_translation` VALUES (100525, 100540, 10, '2004-10-05 12:16:46', 0);
INSERT INTO `state_translation` VALUES (100526, 100541, 10, '2004-10-05 12:16:46', 0);
INSERT INTO `state_translation` VALUES (100528, 100542, 10, '2004-10-05 12:16:46', 0);
INSERT INTO `state_translation` VALUES (100537, 100543, 10, '2004-10-05 12:16:46', 0);
INSERT INTO `state_translation` VALUES (100538, 100544, 10, '2004-10-05 12:16:46', 0);
INSERT INTO `state_translation` VALUES (100529, 100545, 10, '2004-10-05 12:16:46', 0);
INSERT INTO `state_translation` VALUES (100534, 100546, 10, '2004-10-05 12:16:46', 0);
INSERT INTO `state_translation` VALUES (100535, 100547, 10, '2004-10-05 12:16:46', 0);
INSERT INTO `state_translation` VALUES (100548, 100549, 10, '2004-10-05 12:16:46', 0);
INSERT INTO `state_translation` VALUES (100550, 100600, 10, '2004-12-23 22:11:03', 0);
INSERT INTO `state_translation` VALUES (100514, 100601, 10, '2004-12-23 22:12:23', 0);
INSERT INTO `state_translation` VALUES (100573, 100602, 10, '2004-12-23 22:12:13', 0);
INSERT INTO `state_translation` VALUES (100574, 100603, 10, '2004-12-23 22:12:13', 0);
INSERT INTO `state_translation` VALUES (100572, 100604, 10, '2004-06-30 16:22:06', 0);
INSERT INTO `state_translation` VALUES (100554, 100605, 10, '2004-12-23 22:12:13', 0);
INSERT INTO `state_translation` VALUES (100556, 100606, 10, '2004-12-23 22:11:27', 0);
INSERT INTO `state_translation` VALUES (100557, 100607, 10, '2004-12-23 22:11:27', 0);
INSERT INTO `state_translation` VALUES (100558, 100608, 10, '2004-12-23 22:11:27', 0);
INSERT INTO `state_translation` VALUES (100559, 100609, 10, '2004-12-23 22:11:27', 0);
INSERT INTO `state_translation` VALUES (100560, 100610, 10, '2004-12-23 22:11:27', 0);
INSERT INTO `state_translation` VALUES (100561, 100611, 10, '2004-12-23 22:11:27', 0);
INSERT INTO `state_translation` VALUES (100562, 100612, 10, '2004-12-23 22:11:27', 0);
INSERT INTO `state_translation` VALUES (100563, 100613, 10, '2004-12-23 22:11:27', 0);
INSERT INTO `state_translation` VALUES (100564, 100614, 10, '2004-12-23 22:11:27', 0);
INSERT INTO `state_translation` VALUES (100565, 100615, 10, '2004-12-23 22:11:27', 0);
INSERT INTO `state_translation` VALUES (100566, 100616, 10, '2004-12-23 22:11:28', 0);
INSERT INTO `state_translation` VALUES (100567, 100617, 10, '2004-12-23 22:11:28', 0);
INSERT INTO `state_translation` VALUES (100568, 100618, 10, '2004-12-23 22:11:28', 0);
INSERT INTO `state_translation` VALUES (100569, 100619, 10, '2004-12-23 22:11:28', 0);
INSERT INTO `state_translation` VALUES (100570, 100620, 10, '2004-12-23 22:11:28', 0);
INSERT INTO `state_translation` VALUES (100593, 100621, 10, '2004-12-23 22:11:28', 0);
INSERT INTO `state_translation` VALUES (100598, 100622, 10, '2004-12-23 22:11:28', 0);
INSERT INTO `state_translation` VALUES (100594, 100623, 10, '2004-12-23 22:11:28', 0);
INSERT INTO `state_translation` VALUES (100597, 100624, 10, '2004-12-23 22:11:28', 0);
INSERT INTO `state_translation` VALUES (100575, 100625, 10, '2004-12-23 22:12:13', 0);
INSERT INTO `state_translation` VALUES (100576, 100626, 10, '2004-06-30 16:22:06', 0);
INSERT INTO `state_translation` VALUES (100577, 100627, 10, '2004-12-23 22:11:29', 0);
INSERT INTO `state_translation` VALUES (100555, 100628, 10, '2004-06-30 16:22:06', 0);
INSERT INTO `state_translation` VALUES (100578, 100629, 10, '2004-12-23 22:11:29', 0);
INSERT INTO `state_translation` VALUES (100579, 100630, 10, '2004-12-23 22:11:29', 0);
INSERT INTO `state_translation` VALUES (100580, 100631, 10, '2004-12-23 22:11:29', 0);
INSERT INTO `state_translation` VALUES (100581, 100632, 10, '2004-12-23 22:11:29', 0);
INSERT INTO `state_translation` VALUES (100582, 100633, 10, '2004-12-23 22:11:30', 0);
INSERT INTO `state_translation` VALUES (100583, 100634, 10, '2004-12-23 22:11:30', 0);
INSERT INTO `state_translation` VALUES (100584, 100635, 10, '2004-12-23 22:11:30', 0);
INSERT INTO `state_translation` VALUES (100585, 100636, 10, '2004-12-23 22:11:30', 0);
INSERT INTO `state_translation` VALUES (100586, 100637, 10, '2004-12-23 22:11:30', 0);
INSERT INTO `state_translation` VALUES (100587, 100638, 10, '2004-12-23 22:11:30', 0);
INSERT INTO `state_translation` VALUES (100588, 100639, 10, '2004-12-23 22:11:30', 0);
INSERT INTO `state_translation` VALUES (100589, 100640, 10, '2004-12-23 22:11:31', 0);
INSERT INTO `state_translation` VALUES (100590, 100641, 10, '2004-12-23 22:11:31', 0);
INSERT INTO `state_translation` VALUES (100591, 100642, 10, '2004-12-23 22:11:31', 0);
INSERT INTO `state_translation` VALUES (100592, 100643, 10, '2004-12-23 22:11:31', 0);
INSERT INTO `state_translation` VALUES (100595, 100644, 10, '2004-12-23 22:11:31', 0);
INSERT INTO `state_translation` VALUES (100596, 100645, 10, '2004-12-23 22:11:31', 0);
INSERT INTO `state_translation` VALUES (100599, 100646, 10, '2004-12-23 22:11:31', 0);
INSERT INTO `state_translation` VALUES (100515, 100647, 10, '2004-12-23 22:12:23', 0);
INSERT INTO `state_translation` VALUES (100516, 100648, 10, '2004-12-23 22:12:23', 0);
INSERT INTO `state_translation` VALUES (100517, 100649, 10, '2004-06-30 16:22:24', 0);
INSERT INTO `state_translation` VALUES (100519, 100650, 10, '2004-12-23 22:12:23', 0);
INSERT INTO `state_translation` VALUES (100513, 100651, 10, '2004-06-30 16:22:24', 0);
INSERT INTO `state_translation` VALUES (100511, 100652, 10, '2004-12-23 22:12:23', 0);
INSERT INTO `state_translation` VALUES (100512, 100653, 10, '2004-12-23 22:12:07', 0);
INSERT INTO `state_translation` VALUES (100523, 100654, 10, '2004-12-23 22:12:07', 0);
INSERT INTO `state_translation` VALUES (100520, 100655, 10, '2004-12-23 22:12:24', 0);
INSERT INTO `state_translation` VALUES (100521, 100656, 10, '2004-06-30 16:22:24', 0);
INSERT INTO `state_translation` VALUES (100522, 100657, 10, '2004-12-23 22:12:08', 0);
INSERT INTO `state_translation` VALUES (100524, 100658, 10, '2004-12-23 22:12:08', 0);
INSERT INTO `state_translation` VALUES (100518, 100659, 10, '2004-12-23 22:12:24', 0);
INSERT INTO `state_translation` VALUES (100683, 100691, 10, '2004-07-01 15:37:50', 0);
INSERT INTO `state_translation` VALUES (100684, 100692, 10, '2004-07-01 15:37:50', 0);
INSERT INTO `state_translation` VALUES (100679, 100693, 10, '2004-07-01 15:37:50', 0);
INSERT INTO `state_translation` VALUES (100699, 100705, 10, '2004-07-01 15:39:43', 0);
INSERT INTO `state_translation` VALUES (100700, 100706, 10, '2004-07-01 15:39:43', 0);
INSERT INTO `state_translation` VALUES (100698, 100707, 10, '2004-07-01 15:39:43', 0);
INSERT INTO `state_translation` VALUES (100723, 100724, 10, '2004-07-01 16:18:02', 0);
INSERT INTO `state_translation` VALUES (100728, 100729, 10, '2004-07-01 16:18:55', 0);
INSERT INTO `state_translation` VALUES (100752, 100759, 10, '2004-07-02 14:41:48', 0);
INSERT INTO `state_translation` VALUES (100756, 100760, 10, '2004-07-02 14:42:03', 0);
INSERT INTO `state_translation` VALUES (100755, 100761, 10, '2004-07-02 14:44:54', 0);
INSERT INTO `state_translation` VALUES (100712, 100762, 10, '2004-07-02 14:44:54', 0);
INSERT INTO `state_translation` VALUES (1, 100763, 10, '2004-07-02 14:44:54', 0);
INSERT INTO `state_translation` VALUES (100714, 100764, 10, '2004-07-02 14:44:54', 0);
INSERT INTO `state_translation` VALUES (100713, 100765, 10, '2004-07-02 14:44:54', 0);
INSERT INTO `state_translation` VALUES (100757, 100766, 10, '2004-07-02 14:44:54', 0);
INSERT INTO `state_translation` VALUES (100758, 100767, 10, '2004-07-02 14:44:54', 0);
INSERT INTO `state_translation` VALUES (100717, 100768, 10, '2004-12-23 22:12:14', 0);
INSERT INTO `state_translation` VALUES (100715, 100769, 10, '2004-07-02 14:45:11', 0);
INSERT INTO `state_translation` VALUES (100718, 100770, 10, '2004-12-23 22:12:14', 0);
INSERT INTO `state_translation` VALUES (100719, 100771, 10, '2004-07-02 14:45:12', 0);
INSERT INTO `state_translation` VALUES (100720, 100772, 10, '2004-12-23 22:11:38', 0);
INSERT INTO `state_translation` VALUES (100721, 100773, 10, '2004-12-23 22:11:38', 0);
INSERT INTO `state_translation` VALUES (100716, 100774, 10, '2004-12-23 22:12:14', 0);
INSERT INTO `state_translation` VALUES (100741, 100775, 10, '2004-12-23 22:12:15', 0);
INSERT INTO `state_translation` VALUES (100739, 100776, 10, '2004-07-02 14:45:13', 0);
INSERT INTO `state_translation` VALUES (100732, 100777, 10, '2004-12-23 22:12:15', 0);
INSERT INTO `state_translation` VALUES (100733, 100778, 10, '2004-12-23 22:11:39', 0);
INSERT INTO `state_translation` VALUES (100734, 100779, 10, '2004-12-23 22:11:40', 0);
INSERT INTO `state_translation` VALUES (100735, 100780, 10, '2004-12-23 22:11:40', 0);
INSERT INTO `state_translation` VALUES (100736, 100781, 10, '2004-12-23 22:11:40', 0);
INSERT INTO `state_translation` VALUES (100737, 100782, 10, '2004-12-23 22:11:40', 0);
INSERT INTO `state_translation` VALUES (100738, 100783, 10, '2004-12-23 22:11:40', 0);
INSERT INTO `state_translation` VALUES (100749, 100784, 10, '2004-12-23 22:11:40', 0);
INSERT INTO `state_translation` VALUES (100742, 100785, 10, '2004-12-23 22:12:15', 0);
INSERT INTO `state_translation` VALUES (100743, 100786, 10, '2004-07-02 14:45:13', 0);
INSERT INTO `state_translation` VALUES (100744, 100787, 10, '2004-12-23 22:11:41', 0);
INSERT INTO `state_translation` VALUES (100745, 100788, 10, '2004-12-23 22:11:41', 0);
INSERT INTO `state_translation` VALUES (100746, 100789, 10, '2004-12-23 22:11:41', 0);
INSERT INTO `state_translation` VALUES (100747, 100790, 10, '2004-12-23 22:11:41', 0);
INSERT INTO `state_translation` VALUES (100748, 100791, 10, '2004-12-23 22:11:41', 0);
INSERT INTO `state_translation` VALUES (100750, 100792, 10, '2004-12-23 22:11:41', 0);
INSERT INTO `state_translation` VALUES (100740, 100793, 10, '2004-12-23 22:12:15', 0);
INSERT INTO `state_translation` VALUES (100799, 100801, 10, '2004-07-27 21:14:33', 0);
INSERT INTO `state_translation` VALUES (100800, 100802, 10, '2004-07-27 21:14:33', 0);
INSERT INTO `state_translation` VALUES (100804, 100809, 10, '2004-07-27 21:28:26', 1);
INSERT INTO `state_translation` VALUES (100805, 100810, 10, '2004-07-27 21:28:15', 0);
INSERT INTO `state_translation` VALUES (100806, 100811, 10, '2004-07-27 21:28:26', 1);
INSERT INTO `state_translation` VALUES (100808, 100812, 10, '2004-07-27 21:28:15', 0);
INSERT INTO `state_translation` VALUES (100807, 100813, 10, '2004-07-27 21:28:15', 0);
INSERT INTO `state_translation` VALUES (100803, 100814, 10, '2004-07-27 21:28:26', 1);
INSERT INTO `state_translation` VALUES (100358, 100840, 10, '2004-10-05 12:07:25', 0);
INSERT INTO `state_translation` VALUES (100349, 100841, 10, '2004-12-08 14:46:59', 0);
INSERT INTO `state_translation` VALUES (100020, 100842, 10, '2004-12-08 14:46:59', 0);
INSERT INTO `state_translation` VALUES (100352, 100843, 10, '2004-12-08 14:46:59', 0);
INSERT INTO `state_translation` VALUES (100351, 100844, 10, '2004-12-08 14:46:59', 0);
INSERT INTO `state_translation` VALUES (100350, 100845, 10, '2004-12-08 14:46:59', 0);
INSERT INTO `state_translation` VALUES (100334, 100846, 10, '2004-09-09 23:06:28', 0);
INSERT INTO `state_translation` VALUES (100362, 100847, 10, '2004-10-05 12:07:25', 0);
INSERT INTO `state_translation` VALUES (100361, 100848, 10, '2004-10-05 12:07:25', 0);
INSERT INTO `state_translation` VALUES (100360, 100849, 10, '2004-10-05 12:07:25', 0);
INSERT INTO `state_translation` VALUES (100359, 100850, 10, '2004-10-05 12:07:25', 0);
INSERT INTO `state_translation` VALUES (100354, 100851, 10, '2004-09-09 23:06:28', 0);
INSERT INTO `state_translation` VALUES (100864, 101033, 10, '2004-11-01 16:18:31', 1);
INSERT INTO `state_translation` VALUES (100871, 101034, 10, '2004-11-01 16:18:31', 1);
INSERT INTO `state_translation` VALUES (100865, 101035, 10, '2004-10-05 12:07:24', 0);
INSERT INTO `state_translation` VALUES (100866, 101036, 10, '2004-11-01 16:18:31', 1);
INSERT INTO `state_translation` VALUES (100867, 101037, 10, '2004-10-05 12:07:08', 0);
INSERT INTO `state_translation` VALUES (100868, 101038, 10, '2004-10-05 12:07:10', 0);
INSERT INTO `state_translation` VALUES (100869, 101039, 10, '2004-10-05 12:07:10', 0);
INSERT INTO `state_translation` VALUES (100870, 101040, 10, '2004-10-05 12:07:10', 0);
INSERT INTO `state_translation` VALUES (100877, 101041, 10, '2004-11-01 16:18:32', 1);
INSERT INTO `state_translation` VALUES (100873, 101042, 10, '2004-10-05 12:07:24', 0);
INSERT INTO `state_translation` VALUES (100874, 101043, 10, '2004-11-01 16:18:32', 1);
INSERT INTO `state_translation` VALUES (100875, 101044, 10, '2004-10-05 12:07:10', 0);
INSERT INTO `state_translation` VALUES (100876, 101045, 10, '2004-10-05 12:07:12', 0);
INSERT INTO `state_translation` VALUES (100872, 101046, 10, '2004-11-01 16:18:32', 1);
INSERT INTO `state_translation` VALUES (100878, 101047, 10, '2004-11-01 16:18:33', 1);
INSERT INTO `state_translation` VALUES (100897, 101048, 10, '2004-11-01 16:18:35', 1);
INSERT INTO `state_translation` VALUES (100903, 101049, 10, '2004-11-01 16:18:36', 1);
INSERT INTO `state_translation` VALUES (100884, 101050, 10, '2004-11-01 16:18:33', 1);
INSERT INTO `state_translation` VALUES (100879, 101051, 10, '2004-10-05 12:07:24', 0);
INSERT INTO `state_translation` VALUES (100880, 101052, 10, '2004-11-01 16:18:33', 1);
INSERT INTO `state_translation` VALUES (100881, 101053, 10, '2004-10-05 12:07:12', 0);
INSERT INTO `state_translation` VALUES (100882, 101054, 10, '2004-10-05 12:07:14', 0);
INSERT INTO `state_translation` VALUES (100883, 101055, 10, '2004-10-05 12:07:14', 0);
INSERT INTO `state_translation` VALUES (100890, 101056, 10, '2004-11-01 16:18:34', 1);
INSERT INTO `state_translation` VALUES (100886, 101057, 10, '2004-10-05 12:07:24', 0);
INSERT INTO `state_translation` VALUES (100887, 101058, 10, '2004-11-01 16:18:34', 1);
INSERT INTO `state_translation` VALUES (100888, 101059, 10, '2004-10-05 12:07:14', 0);
INSERT INTO `state_translation` VALUES (100889, 101060, 10, '2004-10-05 12:07:16', 0);
INSERT INTO `state_translation` VALUES (100885, 101061, 10, '2004-11-01 16:18:34', 1);
INSERT INTO `state_translation` VALUES (100891, 101062, 10, '2004-11-01 16:18:35', 1);
INSERT INTO `state_translation` VALUES (100896, 101063, 10, '2004-11-01 16:18:35', 1);
INSERT INTO `state_translation` VALUES (100892, 101064, 10, '2004-10-05 12:07:24', 0);
INSERT INTO `state_translation` VALUES (100893, 101065, 10, '2004-11-01 16:18:35', 1);
INSERT INTO `state_translation` VALUES (100894, 101066, 10, '2004-10-05 12:07:16', 0);
INSERT INTO `state_translation` VALUES (100895, 101067, 10, '2004-10-05 12:07:17', 0);
INSERT INTO `state_translation` VALUES (100902, 101068, 10, '2004-11-01 16:18:35', 1);
INSERT INTO `state_translation` VALUES (100898, 101069, 10, '2004-10-05 12:07:25', 0);
INSERT INTO `state_translation` VALUES (100899, 101070, 10, '2004-11-01 16:18:35', 1);
INSERT INTO `state_translation` VALUES (100900, 101071, 10, '2004-10-05 12:07:17', 0);
INSERT INTO `state_translation` VALUES (100901, 101072, 10, '2004-10-05 12:07:20', 0);
INSERT INTO `state_translation` VALUES (100908, 101073, 10, '2004-11-01 16:18:36', 1);
INSERT INTO `state_translation` VALUES (100904, 101074, 10, '2004-10-05 12:07:25', 0);
INSERT INTO `state_translation` VALUES (100905, 101075, 10, '2004-11-01 16:18:36', 1);
INSERT INTO `state_translation` VALUES (100906, 101076, 10, '2004-10-05 12:07:20', 0);
INSERT INTO `state_translation` VALUES (100907, 101077, 10, '2004-10-05 12:07:21', 0);
INSERT INTO `state_translation` VALUES (100840, 101078, 10, '2004-12-08 14:46:59', 0);
INSERT INTO `state_translation` VALUES (100841, 101079, 10, '2004-10-05 12:07:25', 0);
INSERT INTO `state_translation` VALUES (100842, 101080, 10, '2004-10-05 12:07:25', 0);
INSERT INTO `state_translation` VALUES (100843, 101081, 10, '2004-10-05 12:07:25', 0);
INSERT INTO `state_translation` VALUES (100844, 101082, 10, '2004-10-05 12:07:25', 0);
INSERT INTO `state_translation` VALUES (100845, 101083, 10, '2004-10-05 12:07:25', 0);
INSERT INTO `state_translation` VALUES (100846, 101084, 10, '2004-10-05 12:07:25', 0);
INSERT INTO `state_translation` VALUES (100849, 101085, 10, '2004-10-05 12:07:25', 0);
INSERT INTO `state_translation` VALUES (100848, 101086, 10, '2004-10-05 12:07:25', 0);
INSERT INTO `state_translation` VALUES (100847, 101087, 10, '2004-10-05 12:07:25', 0);
INSERT INTO `state_translation` VALUES (100850, 101088, 10, '2004-10-05 12:07:25', 0);
INSERT INTO `state_translation` VALUES (100851, 101089, 10, '2004-10-05 12:07:25', 0);
INSERT INTO `state_translation` VALUES (101353, 101356, 10, '2004-11-26 22:01:25', 0);
INSERT INTO `state_translation` VALUES (101358, 101361, 10, '2004-11-26 22:02:15', 0);
INSERT INTO `state_translation` VALUES (101367, 101469, 10, '2004-11-29 09:22:42', 0);
INSERT INTO `state_translation` VALUES (101471, 101478, 10, '2004-11-29 09:45:25', 0);
INSERT INTO `state_translation` VALUES (101475, 101479, 10, '2004-11-29 09:45:25', 0);
INSERT INTO `state_translation` VALUES (101481, 101501, 10, '2004-11-29 21:33:16', 0);
INSERT INTO `state_translation` VALUES (101485, 101502, 10, '2004-11-29 21:33:16', 0);
INSERT INTO `state_translation` VALUES (101489, 101503, 10, '2004-11-29 21:33:16', 0);
INSERT INTO `state_translation` VALUES (101493, 101504, 10, '2004-11-29 21:33:16', 0);
INSERT INTO `state_translation` VALUES (101497, 101505, 10, '2004-11-29 21:33:16', 0);
INSERT INTO `state_translation` VALUES (101124, 101547, 10, '2004-12-16 10:56:45', 1);
INSERT INTO `state_translation` VALUES (101122, 101548, 10, '2004-11-30 21:08:58', 0);
INSERT INTO `state_translation` VALUES (101121, 101549, 10, '2004-12-08 14:46:59', 0);
INSERT INTO `state_translation` VALUES (101144, 101550, 10, '2004-12-08 14:46:53', 0);
INSERT INTO `state_translation` VALUES (101134, 101551, 10, '2004-12-08 14:46:53', 0);
INSERT INTO `state_translation` VALUES (101133, 101552, 10, '2004-12-08 14:46:53', 0);
INSERT INTO `state_translation` VALUES (101132, 101553, 10, '2004-12-08 14:46:53', 0);
INSERT INTO `state_translation` VALUES (101131, 101554, 10, '2004-12-08 14:46:53', 0);
INSERT INTO `state_translation` VALUES (101130, 101555, 10, '2004-12-08 14:46:53', 0);
INSERT INTO `state_translation` VALUES (101128, 101556, 10, '2004-12-08 14:46:53', 0);
INSERT INTO `state_translation` VALUES (101127, 101557, 10, '2004-12-08 14:46:53', 0);
INSERT INTO `state_translation` VALUES (101125, 101558, 10, '2004-12-08 14:46:59', 0);
INSERT INTO `state_translation` VALUES (101126, 101559, 10, '2004-12-16 10:56:45', 1);
INSERT INTO `state_translation` VALUES (101137, 101560, 10, '2004-12-08 14:46:53', 0);
INSERT INTO `state_translation` VALUES (101136, 101561, 10, '2004-12-08 14:46:54', 0);
INSERT INTO `state_translation` VALUES (101135, 101562, 10, '2004-12-08 14:46:54', 0);
INSERT INTO `state_translation` VALUES (101129, 101563, 10, '2004-12-08 14:46:54', 0);
INSERT INTO `state_translation` VALUES (101145, 101564, 10, '2004-12-08 14:46:54', 0);
INSERT INTO `state_translation` VALUES (101143, 101565, 10, '2004-12-08 14:46:54', 0);
INSERT INTO `state_translation` VALUES (101142, 101566, 10, '2004-12-08 14:46:54', 0);
INSERT INTO `state_translation` VALUES (101141, 101567, 10, '2004-12-08 14:46:54', 0);
INSERT INTO `state_translation` VALUES (101140, 101568, 10, '2004-12-08 14:46:54', 0);
INSERT INTO `state_translation` VALUES (101139, 101569, 10, '2004-12-08 14:46:54', 0);
INSERT INTO `state_translation` VALUES (101138, 101570, 10, '2004-12-08 14:46:54', 0);
INSERT INTO `state_translation` VALUES (101123, 101571, 10, '2004-12-16 10:56:45', 1);
INSERT INTO `state_translation` VALUES (101153, 101575, 10, '2004-12-23 22:12:21', 0);
INSERT INTO `state_translation` VALUES (101154, 101576, 10, '2004-12-23 22:12:21', 0);
INSERT INTO `state_translation` VALUES (101155, 101577, 10, '2004-11-30 21:11:02', 0);
INSERT INTO `state_translation` VALUES (101157, 101578, 10, '2004-12-23 22:12:01', 0);
INSERT INTO `state_translation` VALUES (101156, 101579, 10, '2004-12-23 22:12:01', 0);
INSERT INTO `state_translation` VALUES (101152, 101580, 10, '2004-12-23 22:12:21', 0);
INSERT INTO `state_translation` VALUES (101346, 101581, 10, '2004-12-23 22:12:21', 0);
INSERT INTO `state_translation` VALUES (101507, 101601, 10, '2004-12-06 13:26:02', 0);
INSERT INTO `state_translation` VALUES (101511, 101602, 10, '2004-12-06 13:26:02', 0);
INSERT INTO `state_translation` VALUES (101515, 101603, 10, '2004-12-06 13:26:02', 0);
INSERT INTO `state_translation` VALUES (101519, 101604, 10, '2004-12-06 13:26:02', 0);
INSERT INTO `state_translation` VALUES (101523, 101605, 10, '2004-12-06 13:26:02', 0);
INSERT INTO `state_translation` VALUES (101607, 101702, 10, '2004-12-06 14:06:38', 1);
INSERT INTO `state_translation` VALUES (101527, 101703, 10, '2004-12-06 14:05:54', 0);
INSERT INTO `state_translation` VALUES (101611, 101704, 10, '2004-12-06 14:06:51', 1);
INSERT INTO `state_translation` VALUES (101531, 101705, 10, '2004-12-06 14:05:54', 0);
INSERT INTO `state_translation` VALUES (101615, 101706, 10, '2004-12-06 14:06:24', 1);
INSERT INTO `state_translation` VALUES (101535, 101707, 10, '2004-12-06 14:05:54', 0);
INSERT INTO `state_translation` VALUES (101539, 101708, 10, '2004-12-06 14:05:54', 0);
INSERT INTO `state_translation` VALUES (101619, 101709, 10, '2004-12-06 14:06:18', 1);
INSERT INTO `state_translation` VALUES (101543, 101710, 10, '2004-12-06 14:05:54', 0);
INSERT INTO `state_translation` VALUES (101623, 101711, 10, '2004-12-06 14:06:09', 1);
INSERT INTO `state_translation` VALUES (101627, 101712, 10, '2004-12-06 14:05:54', 0);
INSERT INTO `state_translation` VALUES (101631, 101713, 10, '2004-12-06 14:05:54', 0);
INSERT INTO `state_translation` VALUES (101635, 101714, 10, '2004-12-06 14:05:54', 0);
INSERT INTO `state_translation` VALUES (101639, 101715, 10, '2004-12-06 14:05:54', 0);
INSERT INTO `state_translation` VALUES (101643, 101716, 10, '2004-12-06 14:05:54', 0);
INSERT INTO `state_translation` VALUES (101622, 101717, 10, '2004-12-06 14:06:09', 0);
INSERT INTO `state_translation` VALUES (101647, 101720, 10, '2004-12-06 14:06:10', 0);
INSERT INTO `state_translation` VALUES (101618, 101721, 10, '2004-12-06 14:06:18', 0);
INSERT INTO `state_translation` VALUES (101651, 101724, 10, '2004-12-06 14:06:19', 0);
INSERT INTO `state_translation` VALUES (101614, 101725, 10, '2004-12-06 14:06:24', 0);
INSERT INTO `state_translation` VALUES (101655, 101728, 10, '2004-12-06 14:06:24', 0);
INSERT INTO `state_translation` VALUES (101606, 101729, 10, '2004-12-06 14:06:38', 0);
INSERT INTO `state_translation` VALUES (101659, 101732, 10, '2004-12-06 14:06:38', 0);
INSERT INTO `state_translation` VALUES (101610, 101733, 10, '2004-12-06 14:06:51', 0);
INSERT INTO `state_translation` VALUES (101663, 101736, 10, '2004-12-06 14:06:52', 0);
INSERT INTO `state_translation` VALUES (101667, 101737, 10, '2004-12-06 14:07:11', 0);
INSERT INTO `state_translation` VALUES (101671, 101738, 10, '2004-12-06 14:07:11', 0);
INSERT INTO `state_translation` VALUES (101675, 101739, 10, '2004-12-06 14:07:11', 0);
INSERT INTO `state_translation` VALUES (101679, 101740, 10, '2004-12-06 14:07:11', 0);
INSERT INTO `state_translation` VALUES (101683, 101741, 10, '2004-12-06 14:07:11', 0);
INSERT INTO `state_translation` VALUES (101687, 101742, 10, '2004-12-06 14:07:11', 0);
INSERT INTO `state_translation` VALUES (101691, 101743, 10, '2004-12-06 14:07:11', 0);
INSERT INTO `state_translation` VALUES (101695, 101744, 10, '2004-12-06 14:07:11', 0);
INSERT INTO `state_translation` VALUES (101699, 101745, 10, '2004-12-06 14:07:11', 0);
INSERT INTO `state_translation` VALUES (101866, 101870, 10, '2004-12-09 11:26:14', 0);
INSERT INTO `state_translation` VALUES (101835, 101871, 10, '2004-12-23 22:11:10', 0);
INSERT INTO `state_translation` VALUES (101836, 101872, 10, '2004-12-08 14:09:58', 0);
INSERT INTO `state_translation` VALUES (101837, 101873, 10, '2004-12-23 22:11:10', 0);
INSERT INTO `state_translation` VALUES (101838, 101874, 10, '2004-12-23 22:11:11', 0);
INSERT INTO `state_translation` VALUES (101839, 101875, 10, '2004-12-23 22:11:11', 0);
INSERT INTO `state_translation` VALUES (101758, 101876, 10, '2004-12-08 14:46:46', 0);
INSERT INTO `state_translation` VALUES (101757, 101877, 10, '2004-12-08 14:46:46', 0);
INSERT INTO `state_translation` VALUES (101840, 101878, 10, '2004-12-23 22:11:11', 0);
INSERT INTO `state_translation` VALUES (101214, 101879, 10, '2004-12-23 22:12:11', 0);
INSERT INTO `state_translation` VALUES (101834, 101880, 10, '2004-12-23 22:11:11', 0);
INSERT INTO `state_translation` VALUES (101841, 101881, 10, '2004-12-23 22:11:12', 0);
INSERT INTO `state_translation` VALUES (101842, 101882, 10, '2004-12-08 14:09:58', 0);
INSERT INTO `state_translation` VALUES (101843, 101883, 10, '2004-12-23 22:11:12', 0);
INSERT INTO `state_translation` VALUES (101844, 101884, 10, '2004-12-23 22:11:12', 0);
INSERT INTO `state_translation` VALUES (101845, 101885, 10, '2004-12-23 22:11:12', 0);
INSERT INTO `state_translation` VALUES (101766, 101886, 10, '2004-12-08 14:46:46', 0);
INSERT INTO `state_translation` VALUES (101765, 101887, 10, '2004-12-08 14:46:46', 0);
INSERT INTO `state_translation` VALUES (101846, 101888, 10, '2004-12-23 22:11:12', 0);
INSERT INTO `state_translation` VALUES (101204, 101889, 10, '2004-12-23 22:12:11', 0);
INSERT INTO `state_translation` VALUES (101205, 101891, 10, '2004-12-23 22:12:11', 0);
INSERT INTO `state_translation` VALUES (101206, 101892, 10, '2004-12-08 14:10:00', 0);
INSERT INTO `state_translation` VALUES (101208, 101893, 10, '2004-12-23 22:11:15', 0);
INSERT INTO `state_translation` VALUES (101210, 101894, 10, '2004-12-23 22:11:18', 0);
INSERT INTO `state_translation` VALUES (101211, 101895, 10, '2004-12-23 22:11:18', 0);
INSERT INTO `state_translation` VALUES (101207, 101896, 10, '2004-12-23 22:11:20', 0);
INSERT INTO `state_translation` VALUES (101203, 101897, 10, '2004-12-23 22:12:11', 0);
INSERT INTO `state_translation` VALUES (101213, 101898, 10, '2004-12-23 22:12:11', 0);
INSERT INTO `state_translation` VALUES (101212, 101900, 10, '2004-12-08 14:10:02', 0);
INSERT INTO `state_translation` VALUES (101177, 101901, 10, '2004-12-23 22:12:11', 0);
INSERT INTO `state_translation` VALUES (101181, 101902, 10, '2004-12-23 22:11:21', 0);
INSERT INTO `state_translation` VALUES (101180, 101903, 10, '2004-12-23 22:11:21', 0);
INSERT INTO `state_translation` VALUES (101179, 101904, 10, '2004-12-23 22:11:21', 0);
INSERT INTO `state_translation` VALUES (101178, 101905, 10, '2004-12-23 22:11:21', 0);
INSERT INTO `state_translation` VALUES (101215, 101906, 10, '2004-12-23 22:12:11', 0);
INSERT INTO `state_translation` VALUES (101216, 101907, 10, '2004-12-08 14:10:02', 0);
INSERT INTO `state_translation` VALUES (101219, 101908, 10, '2004-12-23 22:11:22', 0);
INSERT INTO `state_translation` VALUES (101218, 101909, 10, '2004-12-23 22:11:22', 0);
INSERT INTO `state_translation` VALUES (101217, 101910, 10, '2004-12-23 22:11:22', 0);
INSERT INTO `state_translation` VALUES (101804, 101916, 10, '2004-12-23 22:11:33', 0);
INSERT INTO `state_translation` VALUES (101805, 101917, 10, '2004-12-08 14:10:12', 0);
INSERT INTO `state_translation` VALUES (101806, 101918, 10, '2004-12-23 22:11:33', 0);
INSERT INTO `state_translation` VALUES (101807, 101919, 10, '2004-12-23 22:11:33', 0);
INSERT INTO `state_translation` VALUES (101808, 101920, 10, '2004-12-23 22:11:33', 0);
INSERT INTO `state_translation` VALUES (101762, 101921, 10, '2004-12-08 14:46:48', 0);
INSERT INTO `state_translation` VALUES (101761, 101922, 10, '2004-12-08 14:46:48', 0);
INSERT INTO `state_translation` VALUES (101809, 101923, 10, '2004-12-23 22:11:33', 0);
INSERT INTO `state_translation` VALUES (101800, 101924, 10, '2004-12-23 22:11:34', 0);
INSERT INTO `state_translation` VALUES (101810, 101925, 10, '2004-12-23 22:11:34', 0);
INSERT INTO `state_translation` VALUES (101811, 101926, 10, '2004-12-08 14:10:12', 0);
INSERT INTO `state_translation` VALUES (101812, 101927, 10, '2004-12-23 22:11:34', 0);
INSERT INTO `state_translation` VALUES (101813, 101928, 10, '2004-12-23 22:11:34', 0);
INSERT INTO `state_translation` VALUES (101814, 101929, 10, '2004-12-23 22:11:34', 0);
INSERT INTO `state_translation` VALUES (101756, 101930, 10, '2004-12-23 22:11:34', 0);
INSERT INTO `state_translation` VALUES (101755, 101931, 10, '2004-12-23 22:11:34', 0);
INSERT INTO `state_translation` VALUES (101815, 101932, 10, '2004-12-23 22:11:35', 0);
INSERT INTO `state_translation` VALUES (101192, 101933, 10, '2004-12-23 22:12:15', 0);
INSERT INTO `state_translation` VALUES (101801, 101934, 10, '2004-12-23 22:11:35', 0);
INSERT INTO `state_translation` VALUES (101816, 101935, 10, '2004-12-23 22:11:35', 0);
INSERT INTO `state_translation` VALUES (101817, 101936, 10, '2004-12-08 14:10:12', 0);
INSERT INTO `state_translation` VALUES (101818, 101937, 10, '2004-12-23 22:11:35', 0);
INSERT INTO `state_translation` VALUES (101819, 101938, 10, '2004-12-23 22:11:36', 0);
INSERT INTO `state_translation` VALUES (101820, 101939, 10, '2004-12-23 22:11:36', 0);
INSERT INTO `state_translation` VALUES (101764, 101940, 10, '2004-12-23 22:11:36', 0);
INSERT INTO `state_translation` VALUES (101763, 101941, 10, '2004-12-23 22:11:36', 0);
INSERT INTO `state_translation` VALUES (101821, 101942, 10, '2004-12-23 22:11:36', 0);
INSERT INTO `state_translation` VALUES (101299, 101943, 10, '2004-12-23 22:12:16', 0);
INSERT INTO `state_translation` VALUES (101802, 101944, 10, '2004-12-23 22:11:36', 0);
INSERT INTO `state_translation` VALUES (101822, 101945, 10, '2004-12-23 22:11:36', 0);
INSERT INTO `state_translation` VALUES (101823, 101946, 10, '2004-12-08 14:10:12', 0);
INSERT INTO `state_translation` VALUES (101824, 101947, 10, '2004-12-23 22:11:37', 0);
INSERT INTO `state_translation` VALUES (101825, 101948, 10, '2004-12-23 22:11:37', 0);
INSERT INTO `state_translation` VALUES (101826, 101949, 10, '2004-12-23 22:11:37', 0);
INSERT INTO `state_translation` VALUES (101752, 101950, 10, '2004-12-08 14:46:48', 0);
INSERT INTO `state_translation` VALUES (101751, 101951, 10, '2004-12-08 14:46:48', 0);
INSERT INTO `state_translation` VALUES (101827, 101952, 10, '2004-12-23 22:11:37', 0);
INSERT INTO `state_translation` VALUES (101315, 101953, 10, '2004-12-23 22:12:18', 0);
INSERT INTO `state_translation` VALUES (101803, 101954, 10, '2004-12-08 14:46:48', 0);
INSERT INTO `state_translation` VALUES (101828, 101955, 10, '2004-12-08 14:46:48', 0);
INSERT INTO `state_translation` VALUES (101829, 101956, 10, '2004-12-08 14:10:12', 0);
INSERT INTO `state_translation` VALUES (101830, 101957, 10, '2004-12-08 14:46:48', 0);
INSERT INTO `state_translation` VALUES (101831, 101958, 10, '2004-12-08 14:46:48', 0);
INSERT INTO `state_translation` VALUES (101832, 101959, 10, '2004-12-08 14:46:48', 0);
INSERT INTO `state_translation` VALUES (101770, 101960, 10, '2004-12-08 14:46:48', 0);
INSERT INTO `state_translation` VALUES (101769, 101961, 10, '2004-12-08 14:46:48', 0);
INSERT INTO `state_translation` VALUES (101833, 101962, 10, '2004-12-08 14:46:48', 0);
INSERT INTO `state_translation` VALUES (101323, 101963, 10, '2004-12-22 18:24:09', 1);
INSERT INTO `state_translation` VALUES (101191, 101965, 10, '2004-12-23 22:12:16', 0);
INSERT INTO `state_translation` VALUES (101293, 101966, 10, '2004-12-23 22:12:16', 0);
INSERT INTO `state_translation` VALUES (101298, 101967, 10, '2004-12-23 22:12:17', 0);
INSERT INTO `state_translation` VALUES (101302, 101968, 10, '2004-12-23 22:12:17', 0);
INSERT INTO `state_translation` VALUES (101314, 101969, 10, '2004-12-23 22:12:18', 0);
INSERT INTO `state_translation` VALUES (101318, 101970, 10, '2004-12-22 18:22:32', 1);
INSERT INTO `state_translation` VALUES (101322, 101971, 10, '2004-12-22 18:24:09', 1);
INSERT INTO `state_translation` VALUES (101193, 101974, 10, '2004-12-23 22:12:16', 0);
INSERT INTO `state_translation` VALUES (101194, 101975, 10, '2004-12-08 14:10:19', 0);
INSERT INTO `state_translation` VALUES (101196, 101976, 10, '2004-12-23 22:11:43', 0);
INSERT INTO `state_translation` VALUES (101195, 101977, 10, '2004-12-23 22:11:43', 0);
INSERT INTO `state_translation` VALUES (101294, 101979, 10, '2004-12-23 22:12:16', 0);
INSERT INTO `state_translation` VALUES (101292, 101980, 10, '2004-12-08 14:10:20', 0);
INSERT INTO `state_translation` VALUES (101290, 101981, 10, '2004-12-23 22:12:16', 0);
INSERT INTO `state_translation` VALUES (101291, 101982, 10, '2004-12-23 22:11:44', 0);
INSERT INTO `state_translation` VALUES (101295, 101983, 10, '2004-12-23 22:12:16', 0);
INSERT INTO `state_translation` VALUES (101296, 101984, 10, '2004-12-23 22:11:44', 0);
INSERT INTO `state_translation` VALUES (101297, 101985, 10, '2004-12-23 22:11:44', 0);
INSERT INTO `state_translation` VALUES (101300, 101987, 10, '2004-12-23 22:12:17', 0);
INSERT INTO `state_translation` VALUES (101301, 101988, 10, '2004-12-08 14:10:23', 0);
INSERT INTO `state_translation` VALUES (101327, 101989, 10, '2004-12-23 22:11:46', 0);
INSERT INTO `state_translation` VALUES (101326, 101990, 10, '2004-12-23 22:11:46', 0);
INSERT INTO `state_translation` VALUES (101303, 101992, 10, '2004-12-23 22:12:17', 0);
INSERT INTO `state_translation` VALUES (101304, 101993, 10, '2004-12-23 22:12:17', 0);
INSERT INTO `state_translation` VALUES (101305, 101994, 10, '2004-12-08 14:10:25', 0);
INSERT INTO `state_translation` VALUES (101329, 101995, 10, '2004-12-23 22:11:47', 0);
INSERT INTO `state_translation` VALUES (101328, 101996, 10, '2004-12-23 22:11:48', 0);
INSERT INTO `state_translation` VALUES (101316, 101998, 10, '2004-12-23 22:12:18', 0);
INSERT INTO `state_translation` VALUES (101317, 101999, 10, '2004-12-08 14:10:27', 0);
INSERT INTO `state_translation` VALUES (101337, 102000, 10, '2004-12-23 22:11:49', 0);
INSERT INTO `state_translation` VALUES (101336, 102001, 10, '2004-12-23 22:11:50', 0);
INSERT INTO `state_translation` VALUES (101319, 102003, 10, '2004-12-22 18:22:32', 1);
INSERT INTO `state_translation` VALUES (101320, 102004, 10, '2004-12-08 14:46:57', 0);
INSERT INTO `state_translation` VALUES (101321, 102005, 10, '2004-12-22 18:22:32', 1);
INSERT INTO `state_translation` VALUES (101331, 102006, 10, '2004-12-08 14:46:49', 0);
INSERT INTO `state_translation` VALUES (101330, 102007, 10, '2004-12-08 14:46:49', 0);
INSERT INTO `state_translation` VALUES (101324, 102009, 10, '2004-12-08 14:46:57', 0);
INSERT INTO `state_translation` VALUES (101325, 102010, 10, '2004-12-22 18:24:09', 1);
INSERT INTO `state_translation` VALUES (101333, 102011, 10, '2004-12-08 14:46:49', 0);
INSERT INTO `state_translation` VALUES (101332, 102012, 10, '2004-12-08 14:46:49', 0);
INSERT INTO `state_translation` VALUES (101768, 102014, 10, '2004-12-20 13:00:00', 0);
INSERT INTO `state_translation` VALUES (101767, 102015, 10, '2004-12-20 13:00:00', 0);
INSERT INTO `state_translation` VALUES (101779, 102016, 10, '2004-12-23 22:11:52', 0);
INSERT INTO `state_translation` VALUES (101782, 102017, 10, '2004-12-23 22:11:53', 0);
INSERT INTO `state_translation` VALUES (101783, 102018, 10, '2004-12-08 14:10:34', 0);
INSERT INTO `state_translation` VALUES (101784, 102019, 10, '2004-12-23 22:11:53', 0);
INSERT INTO `state_translation` VALUES (101785, 102020, 10, '2004-12-23 22:11:53', 0);
INSERT INTO `state_translation` VALUES (101786, 102021, 10, '2004-12-23 22:11:53', 0);
INSERT INTO `state_translation` VALUES (101778, 102022, 10, '2004-12-23 22:11:53', 0);
INSERT INTO `state_translation` VALUES (101777, 102023, 10, '2004-12-23 22:11:54', 0);
INSERT INTO `state_translation` VALUES (101787, 102024, 10, '2004-12-23 22:11:54', 0);
INSERT INTO `state_translation` VALUES (101347, 102025, 10, '2004-12-23 22:12:21', 0);
INSERT INTO `state_translation` VALUES (101780, 102026, 10, '2004-12-23 22:11:54', 0);
INSERT INTO `state_translation` VALUES (101788, 102027, 10, '2004-12-23 22:11:54', 0);
INSERT INTO `state_translation` VALUES (101789, 102028, 10, '2004-12-08 14:10:34', 0);
INSERT INTO `state_translation` VALUES (101792, 102029, 10, '2004-12-23 22:11:54', 0);
INSERT INTO `state_translation` VALUES (101772, 102030, 10, '2004-12-20 13:00:00', 0);
INSERT INTO `state_translation` VALUES (101771, 102031, 10, '2004-12-20 13:00:00', 0);
INSERT INTO `state_translation` VALUES (101791, 102032, 10, '2004-12-23 22:11:55', 0);
INSERT INTO `state_translation` VALUES (101790, 102033, 10, '2004-12-23 22:11:55', 0);
INSERT INTO `state_translation` VALUES (101793, 102034, 10, '2004-12-23 22:11:55', 0);
INSERT INTO `state_translation` VALUES (101781, 102035, 10, '2004-12-20 13:00:01', 0);
INSERT INTO `state_translation` VALUES (101794, 102036, 10, '2004-12-20 13:00:01', 0);
INSERT INTO `state_translation` VALUES (101795, 102037, 10, '2004-12-08 14:10:35', 0);
INSERT INTO `state_translation` VALUES (101796, 102038, 10, '2004-12-20 13:00:01', 0);
INSERT INTO `state_translation` VALUES (101797, 102039, 10, '2004-12-20 13:00:01', 0);
INSERT INTO `state_translation` VALUES (101798, 102040, 10, '2004-12-20 13:00:01', 0);
INSERT INTO `state_translation` VALUES (101776, 102041, 10, '2004-12-20 13:00:01', 0);
INSERT INTO `state_translation` VALUES (101775, 102042, 10, '2004-12-20 13:00:01', 0);
INSERT INTO `state_translation` VALUES (101799, 102043, 10, '2004-12-20 13:00:01', 0);
INSERT INTO `state_translation` VALUES (101860, 102046, 10, '2004-12-08 14:10:39', 0);
INSERT INTO `state_translation` VALUES (101171, 102048, 10, '2004-12-08 14:46:50', 0);
INSERT INTO `state_translation` VALUES (101172, 102049, 10, '2004-12-08 14:46:50', 0);
INSERT INTO `state_translation` VALUES (101158, 102050, 10, '2004-12-22 18:12:42', 1);
INSERT INTO `state_translation` VALUES (101164, 102051, 10, '2004-12-22 18:12:44', 1);
INSERT INTO `state_translation` VALUES (101184, 102052, 10, '2004-12-22 18:12:46', 1);
INSERT INTO `state_translation` VALUES (101197, 102053, 10, '2004-12-22 18:12:47', 1);
INSERT INTO `state_translation` VALUES (101175, 102055, 10, '2004-12-08 14:46:50', 0);
INSERT INTO `state_translation` VALUES (101176, 102056, 10, '2004-12-08 14:46:50', 0);
INSERT INTO `state_translation` VALUES (101159, 102058, 10, '2004-12-22 18:12:42', 1);
INSERT INTO `state_translation` VALUES (101160, 102059, 10, '2004-12-08 14:46:58', 0);
INSERT INTO `state_translation` VALUES (101161, 102060, 10, '2004-12-22 18:12:42', 1);
INSERT INTO `state_translation` VALUES (101163, 102061, 10, '2004-12-08 14:46:51', 0);
INSERT INTO `state_translation` VALUES (101173, 102062, 10, '2004-12-08 14:46:51', 0);
INSERT INTO `state_translation` VALUES (101174, 102063, 10, '2004-12-08 14:46:51', 0);
INSERT INTO `state_translation` VALUES (101162, 102064, 10, '2004-12-08 14:46:51', 0);
INSERT INTO `state_translation` VALUES (101165, 102066, 10, '2004-12-22 18:12:44', 1);
INSERT INTO `state_translation` VALUES (101166, 102067, 10, '2004-12-08 14:46:58', 0);
INSERT INTO `state_translation` VALUES (101167, 102068, 10, '2004-12-22 18:12:44', 1);
INSERT INTO `state_translation` VALUES (101169, 102069, 10, '2004-12-08 14:46:51', 0);
INSERT INTO `state_translation` VALUES (101168, 102070, 10, '2004-12-08 14:46:51', 0);
INSERT INTO `state_translation` VALUES (101185, 102072, 10, '2004-12-22 18:12:46', 1);
INSERT INTO `state_translation` VALUES (101182, 102073, 10, '2004-12-08 14:10:49', 0);
INSERT INTO `state_translation` VALUES (101186, 102074, 10, '2004-12-08 14:46:58', 0);
INSERT INTO `state_translation` VALUES (101187, 102075, 10, '2004-12-22 18:12:46', 1);
INSERT INTO `state_translation` VALUES (101190, 102076, 10, '2004-12-08 14:46:51', 0);
INSERT INTO `state_translation` VALUES (101189, 102077, 10, '2004-12-08 14:46:51', 0);
INSERT INTO `state_translation` VALUES (101188, 102078, 10, '2004-12-08 14:46:51', 0);
INSERT INTO `state_translation` VALUES (101198, 102080, 10, '2004-12-22 18:12:47', 1);
INSERT INTO `state_translation` VALUES (101199, 102081, 10, '2004-12-08 14:46:58', 0);
INSERT INTO `state_translation` VALUES (101200, 102082, 10, '2004-12-22 18:12:47', 1);
INSERT INTO `state_translation` VALUES (101202, 102083, 10, '2004-12-08 14:46:51', 0);
INSERT INTO `state_translation` VALUES (101201, 102084, 10, '2004-12-08 14:46:51', 0);
INSERT INTO `state_translation` VALUES (101345, 102089, 10, '2004-12-08 14:10:58', 0);
INSERT INTO `state_translation` VALUES (101348, 102090, 10, '2004-12-23 22:12:21', 0);
INSERT INTO `state_translation` VALUES (101349, 102091, 10, '2004-12-08 14:10:58', 0);
INSERT INTO `state_translation` VALUES (101351, 102092, 10, '2004-12-23 22:12:02', 0);
INSERT INTO `state_translation` VALUES (101350, 102093, 10, '2004-12-23 22:12:02', 0);
INSERT INTO `state_translation` VALUES (101848, 102095, 10, '2004-12-23 22:12:04', 0);
INSERT INTO `state_translation` VALUES (101849, 102096, 10, '2004-12-08 14:11:00', 0);
INSERT INTO `state_translation` VALUES (101850, 102097, 10, '2004-12-23 22:12:04', 0);
INSERT INTO `state_translation` VALUES (101851, 102098, 10, '2004-12-23 22:12:04', 0);
INSERT INTO `state_translation` VALUES (101852, 102099, 10, '2004-12-23 22:12:04', 0);
INSERT INTO `state_translation` VALUES (101774, 102100, 10, '2004-12-08 14:46:52', 0);
INSERT INTO `state_translation` VALUES (101773, 102101, 10, '2004-12-08 14:46:52', 0);
INSERT INTO `state_translation` VALUES (101853, 102102, 10, '2004-12-23 22:12:04', 0);
INSERT INTO `state_translation` VALUES (101262, 102103, 10, '2004-12-22 18:30:37', 1);
INSERT INTO `state_translation` VALUES (101847, 102104, 10, '2004-12-08 14:46:52', 0);
INSERT INTO `state_translation` VALUES (101854, 102105, 10, '2004-12-08 14:46:52', 0);
INSERT INTO `state_translation` VALUES (101855, 102106, 10, '2004-12-08 14:11:00', 0);
INSERT INTO `state_translation` VALUES (101856, 102107, 10, '2004-12-08 14:46:52', 0);
INSERT INTO `state_translation` VALUES (101857, 102108, 10, '2004-12-08 14:46:52', 0);
INSERT INTO `state_translation` VALUES (101858, 102109, 10, '2004-12-08 14:46:52', 0);
INSERT INTO `state_translation` VALUES (101754, 102110, 10, '2004-12-08 14:46:52', 0);
INSERT INTO `state_translation` VALUES (101753, 102111, 10, '2004-12-08 14:46:52', 0);
INSERT INTO `state_translation` VALUES (101859, 102112, 10, '2004-12-08 14:46:52', 0);
INSERT INTO `state_translation` VALUES (101269, 102113, 10, '2004-12-22 18:31:45', 1);
INSERT INTO `state_translation` VALUES (101263, 102115, 10, '2004-12-08 14:46:58', 0);
INSERT INTO `state_translation` VALUES (101264, 102116, 10, '2004-12-22 18:30:37', 1);
INSERT INTO `state_translation` VALUES (101267, 102117, 10, '2004-12-08 14:46:52', 0);
INSERT INTO `state_translation` VALUES (101266, 102118, 10, '2004-12-08 14:46:52', 0);
INSERT INTO `state_translation` VALUES (101265, 102119, 10, '2004-12-08 14:46:52', 0);
INSERT INTO `state_translation` VALUES (101261, 102120, 10, '2004-12-22 18:30:37', 1);
INSERT INTO `state_translation` VALUES (101268, 102121, 10, '2004-12-22 18:31:45', 1);
INSERT INTO `state_translation` VALUES (101284, 102122, 10, '2004-12-23 22:12:23', 0);
INSERT INTO `state_translation` VALUES (101221, 102124, 10, '2004-12-22 18:30:39', 1);
INSERT INTO `state_translation` VALUES (101222, 102125, 10, '2004-12-08 14:46:58', 0);
INSERT INTO `state_translation` VALUES (101223, 102126, 10, '2004-12-22 18:30:39', 1);
INSERT INTO `state_translation` VALUES (101225, 102127, 10, '2004-12-08 14:46:52', 0);
INSERT INTO `state_translation` VALUES (101251, 102128, 10, '2004-12-08 14:46:52', 0);
INSERT INTO `state_translation` VALUES (101252, 102129, 10, '2004-12-08 14:46:52', 0);
INSERT INTO `state_translation` VALUES (101224, 102130, 10, '2004-12-08 14:46:52', 0);
INSERT INTO `state_translation` VALUES (101220, 102131, 10, '2004-12-22 18:30:39', 1);
INSERT INTO `state_translation` VALUES (101226, 102132, 10, '2004-12-22 18:30:41', 1);
INSERT INTO `state_translation` VALUES (101232, 102133, 10, '2004-12-22 18:30:43', 1);
INSERT INTO `state_translation` VALUES (101238, 102134, 10, '2004-12-22 18:30:45', 1);
INSERT INTO `state_translation` VALUES (101244, 102135, 10, '2004-12-22 18:30:47', 1);
INSERT INTO `state_translation` VALUES (101227, 102137, 10, '2004-12-22 18:30:41', 1);
INSERT INTO `state_translation` VALUES (101228, 102138, 10, '2004-12-08 14:46:58', 0);
INSERT INTO `state_translation` VALUES (101229, 102139, 10, '2004-12-22 18:30:41', 1);
INSERT INTO `state_translation` VALUES (101231, 102140, 10, '2004-12-08 14:46:52', 0);
INSERT INTO `state_translation` VALUES (101255, 102141, 10, '2004-12-08 14:46:52', 0);
INSERT INTO `state_translation` VALUES (101256, 102142, 10, '2004-12-08 14:46:52', 0);
INSERT INTO `state_translation` VALUES (101230, 102143, 10, '2004-12-08 14:46:52', 0);
INSERT INTO `state_translation` VALUES (101233, 102145, 10, '2004-12-22 18:30:43', 1);
INSERT INTO `state_translation` VALUES (101234, 102146, 10, '2004-12-08 14:46:58', 0);
INSERT INTO `state_translation` VALUES (101235, 102147, 10, '2004-12-22 18:30:43', 1);
INSERT INTO `state_translation` VALUES (101237, 102148, 10, '2004-12-08 14:46:52', 0);
INSERT INTO `state_translation` VALUES (101259, 102149, 10, '2004-12-08 14:46:52', 0);
INSERT INTO `state_translation` VALUES (101260, 102150, 10, '2004-12-08 14:46:52', 0);
INSERT INTO `state_translation` VALUES (101236, 102151, 10, '2004-12-08 14:46:52', 0);
INSERT INTO `state_translation` VALUES (101239, 102153, 10, '2004-12-22 18:30:45', 1);
INSERT INTO `state_translation` VALUES (101240, 102154, 10, '2004-12-08 14:46:58', 0);
INSERT INTO `state_translation` VALUES (101241, 102155, 10, '2004-12-22 18:30:45', 1);
INSERT INTO `state_translation` VALUES (101243, 102156, 10, '2004-12-08 14:46:53', 0);
INSERT INTO `state_translation` VALUES (101253, 102157, 10, '2004-12-08 14:46:53', 0);
INSERT INTO `state_translation` VALUES (101254, 102158, 10, '2004-12-08 14:46:53', 0);
INSERT INTO `state_translation` VALUES (101242, 102159, 10, '2004-12-08 14:46:53', 0);
INSERT INTO `state_translation` VALUES (101245, 102161, 10, '2004-12-22 18:30:47', 1);
INSERT INTO `state_translation` VALUES (101246, 102162, 10, '2004-12-08 14:46:58', 0);
INSERT INTO `state_translation` VALUES (101247, 102163, 10, '2004-12-22 18:30:46', 1);
INSERT INTO `state_translation` VALUES (101249, 102164, 10, '2004-12-08 14:46:53', 0);
INSERT INTO `state_translation` VALUES (101257, 102165, 10, '2004-12-08 14:46:53', 0);
INSERT INTO `state_translation` VALUES (101258, 102166, 10, '2004-12-08 14:46:53', 0);
INSERT INTO `state_translation` VALUES (101248, 102167, 10, '2004-12-08 14:46:53', 0);
INSERT INTO `state_translation` VALUES (101270, 102169, 10, '2004-12-08 14:46:58', 0);
INSERT INTO `state_translation` VALUES (101271, 102170, 10, '2004-12-22 18:31:45', 1);
INSERT INTO `state_translation` VALUES (101274, 102171, 10, '2004-12-08 14:46:53', 0);
INSERT INTO `state_translation` VALUES (101273, 102172, 10, '2004-12-08 14:46:53', 0);
INSERT INTO `state_translation` VALUES (101272, 102173, 10, '2004-12-08 14:46:53', 0);
INSERT INTO `state_translation` VALUES (101276, 102175, 10, '2004-12-22 18:31:47', 1);
INSERT INTO `state_translation` VALUES (101277, 102176, 10, '2004-12-08 14:46:59', 0);
INSERT INTO `state_translation` VALUES (101278, 102177, 10, '2004-12-22 18:31:47', 1);
INSERT INTO `state_translation` VALUES (101280, 102178, 10, '2004-12-08 14:46:53', 0);
INSERT INTO `state_translation` VALUES (101282, 102179, 10, '2004-12-08 14:46:53', 0);
INSERT INTO `state_translation` VALUES (101283, 102180, 10, '2004-12-08 14:46:53', 0);
INSERT INTO `state_translation` VALUES (101279, 102181, 10, '2004-12-08 14:46:53', 0);
INSERT INTO `state_translation` VALUES (101275, 102182, 10, '2004-12-22 18:31:47', 1);
INSERT INTO `state_translation` VALUES (101285, 102184, 10, '2004-12-23 22:12:22', 0);
INSERT INTO `state_translation` VALUES (101286, 102185, 10, '2004-12-23 22:12:23', 0);
INSERT INTO `state_translation` VALUES (101287, 102186, 10, '2004-12-08 14:11:16', 0);
INSERT INTO `state_translation` VALUES (101289, 102187, 10, '2004-12-23 22:12:06', 0);
INSERT INTO `state_translation` VALUES (101288, 102188, 10, '2004-12-23 22:12:06', 0);
INSERT INTO `state_translation` VALUES (101865, 102279, 10, '2004-12-23 22:12:26', 0);
INSERT INTO `state_translation` VALUES (101869, 102280, 10, '2004-12-23 22:12:25', 0);
INSERT INTO `state_translation` VALUES (101868, 102281, 10, '2004-12-23 22:12:25', 0);
INSERT INTO `state_translation` VALUES (101867, 102282, 10, '2004-12-23 22:12:25', 0);
INSERT INTO `state_translation` VALUES (101078, 102285, 10, '2004-12-08 14:46:59', 0);
INSERT INTO `state_translation` VALUES (102283, 102286, 10, '2004-12-08 14:11:28', 0);
INSERT INTO `state_translation` VALUES (101352, 102288, 10, '2004-12-23 22:12:32', 0);
INSERT INTO `state_translation` VALUES (101340, 102289, 10, '2004-12-23 22:13:23', 0);
INSERT INTO `state_translation` VALUES (101342, 102290, 10, '2004-12-23 22:12:30', 0);
INSERT INTO `state_translation` VALUES (101341, 102291, 10, '2004-12-23 22:12:30', 0);
INSERT INTO `state_translation` VALUES (101355, 102292, 10, '2004-12-23 22:12:31', 0);
INSERT INTO `state_translation` VALUES (101354, 102293, 10, '2004-12-23 22:12:31', 0);
INSERT INTO `state_translation` VALUES (101388, 102294, 10, '2004-12-23 22:12:31', 0);
INSERT INTO `state_translation` VALUES (101387, 102295, 10, '2004-12-23 22:12:31', 0);
INSERT INTO `state_translation` VALUES (101357, 102296, 10, '2004-12-23 22:12:33', 0);
INSERT INTO `state_translation` VALUES (101359, 102297, 10, '2004-12-23 22:12:32', 0);
INSERT INTO `state_translation` VALUES (101390, 102298, 10, '2004-12-23 22:12:32', 0);
INSERT INTO `state_translation` VALUES (101389, 102299, 10, '2004-12-23 22:12:32', 0);
INSERT INTO `state_translation` VALUES (101360, 102300, 10, '2004-12-23 22:12:33', 0);
INSERT INTO `state_translation` VALUES (101366, 102301, 10, '2004-12-23 22:12:34', 0);
INSERT INTO `state_translation` VALUES (101368, 102302, 10, '2004-12-23 22:12:33', 0);
INSERT INTO `state_translation` VALUES (101392, 102303, 10, '2004-12-23 22:12:33', 0);
INSERT INTO `state_translation` VALUES (101391, 102304, 10, '2004-12-23 22:12:34', 0);
INSERT INTO `state_translation` VALUES (101369, 102305, 10, '2004-12-23 22:12:34', 0);
INSERT INTO `state_translation` VALUES (101470, 102306, 10, '2004-12-23 22:12:36', 0);
INSERT INTO `state_translation` VALUES (101472, 102307, 10, '2004-12-23 22:12:35', 0);
INSERT INTO `state_translation` VALUES (101394, 102308, 10, '2004-12-23 22:12:35', 0);
INSERT INTO `state_translation` VALUES (101393, 102309, 10, '2004-12-23 22:12:35', 0);
INSERT INTO `state_translation` VALUES (101473, 102310, 10, '2004-12-23 22:12:35', 0);
INSERT INTO `state_translation` VALUES (101474, 102311, 10, '2004-12-23 22:12:37', 0);
INSERT INTO `state_translation` VALUES (101476, 102312, 10, '2004-12-23 22:12:36', 0);
INSERT INTO `state_translation` VALUES (101396, 102313, 10, '2004-12-23 22:12:36', 0);
INSERT INTO `state_translation` VALUES (101395, 102314, 10, '2004-12-23 22:12:36', 0);
INSERT INTO `state_translation` VALUES (101477, 102315, 10, '2004-12-23 22:12:36', 0);
INSERT INTO `state_translation` VALUES (101480, 102316, 10, '2004-12-23 22:12:38', 0);
INSERT INTO `state_translation` VALUES (101482, 102317, 10, '2004-12-23 22:12:37', 0);
INSERT INTO `state_translation` VALUES (101400, 102318, 10, '2004-12-23 22:12:37', 0);
INSERT INTO `state_translation` VALUES (101399, 102319, 10, '2004-12-23 22:12:37', 0);
INSERT INTO `state_translation` VALUES (101483, 102320, 10, '2004-12-23 22:12:38', 0);
INSERT INTO `state_translation` VALUES (101484, 102321, 10, '2004-12-23 22:12:39', 0);
INSERT INTO `state_translation` VALUES (101486, 102322, 10, '2004-12-23 22:12:38', 0);
INSERT INTO `state_translation` VALUES (101402, 102323, 10, '2004-12-23 22:12:39', 0);
INSERT INTO `state_translation` VALUES (101401, 102324, 10, '2004-12-23 22:12:39', 0);
INSERT INTO `state_translation` VALUES (101487, 102325, 10, '2004-12-23 22:12:39', 0);
INSERT INTO `state_translation` VALUES (101488, 102326, 10, '2004-12-23 22:12:41', 0);
INSERT INTO `state_translation` VALUES (101490, 102327, 10, '2004-12-23 22:12:40', 0);
INSERT INTO `state_translation` VALUES (101404, 102328, 10, '2004-12-23 22:12:40', 0);
INSERT INTO `state_translation` VALUES (101403, 102329, 10, '2004-12-23 22:12:40', 0);
INSERT INTO `state_translation` VALUES (101491, 102330, 10, '2004-12-23 22:12:41', 0);
INSERT INTO `state_translation` VALUES (101492, 102331, 10, '2004-12-23 22:12:43', 0);
INSERT INTO `state_translation` VALUES (101494, 102332, 10, '2004-12-23 22:12:42', 0);
INSERT INTO `state_translation` VALUES (101406, 102333, 10, '2004-12-23 22:12:42', 0);
INSERT INTO `state_translation` VALUES (101405, 102334, 10, '2004-12-23 22:12:42', 0);
INSERT INTO `state_translation` VALUES (101495, 102335, 10, '2004-12-23 22:12:43', 0);
INSERT INTO `state_translation` VALUES (101496, 102336, 10, '2004-12-23 22:12:45', 0);
INSERT INTO `state_translation` VALUES (101498, 102337, 10, '2004-12-23 22:12:43', 0);
INSERT INTO `state_translation` VALUES (101408, 102338, 10, '2004-12-23 22:12:44', 0);
INSERT INTO `state_translation` VALUES (101407, 102339, 10, '2004-12-23 22:12:44', 0);
INSERT INTO `state_translation` VALUES (101499, 102340, 10, '2004-12-23 22:12:44', 0);
INSERT INTO `state_translation` VALUES (101506, 102341, 10, '2004-12-23 22:12:46', 0);
INSERT INTO `state_translation` VALUES (101508, 102342, 10, '2004-12-23 22:12:45', 0);
INSERT INTO `state_translation` VALUES (101410, 102343, 10, '2004-12-23 22:12:45', 0);
INSERT INTO `state_translation` VALUES (101409, 102344, 10, '2004-12-23 22:12:46', 0);
INSERT INTO `state_translation` VALUES (101509, 102345, 10, '2004-12-23 22:12:46', 0);
INSERT INTO `state_translation` VALUES (101510, 102346, 10, '2004-12-23 22:12:48', 0);
INSERT INTO `state_translation` VALUES (101512, 102347, 10, '2004-12-23 22:12:47', 0);
INSERT INTO `state_translation` VALUES (101412, 102348, 10, '2004-12-23 22:12:47', 0);
INSERT INTO `state_translation` VALUES (101411, 102349, 10, '2004-12-23 22:12:47', 0);
INSERT INTO `state_translation` VALUES (101513, 102350, 10, '2004-12-23 22:12:47', 0);
INSERT INTO `state_translation` VALUES (101514, 102351, 10, '2004-12-23 22:12:49', 0);
INSERT INTO `state_translation` VALUES (101516, 102352, 10, '2004-12-23 22:12:48', 0);
INSERT INTO `state_translation` VALUES (101414, 102353, 10, '2004-12-23 22:12:48', 0);
INSERT INTO `state_translation` VALUES (101413, 102354, 10, '2004-12-23 22:12:48', 0);
INSERT INTO `state_translation` VALUES (101517, 102355, 10, '2004-12-23 22:12:49', 0);
INSERT INTO `state_translation` VALUES (101518, 102356, 10, '2004-12-23 22:12:51', 0);
INSERT INTO `state_translation` VALUES (101520, 102357, 10, '2004-12-23 22:12:50', 0);
INSERT INTO `state_translation` VALUES (101416, 102358, 10, '2004-12-23 22:12:50', 0);
INSERT INTO `state_translation` VALUES (101415, 102359, 10, '2004-12-23 22:12:50', 0);
INSERT INTO `state_translation` VALUES (101521, 102360, 10, '2004-12-23 22:12:50', 0);
INSERT INTO `state_translation` VALUES (101522, 102361, 10, '2004-12-23 22:12:52', 0);
INSERT INTO `state_translation` VALUES (101524, 102362, 10, '2004-12-23 22:12:51', 0);
INSERT INTO `state_translation` VALUES (101418, 102363, 10, '2004-12-23 22:12:51', 0);
INSERT INTO `state_translation` VALUES (101417, 102364, 10, '2004-12-23 22:12:51', 0);
INSERT INTO `state_translation` VALUES (101525, 102365, 10, '2004-12-23 22:12:52', 0);
INSERT INTO `state_translation` VALUES (101526, 102366, 10, '2004-12-23 22:12:53', 0);
INSERT INTO `state_translation` VALUES (101528, 102367, 10, '2004-12-23 22:12:52', 0);
INSERT INTO `state_translation` VALUES (101422, 102368, 10, '2004-12-23 22:12:52', 0);
INSERT INTO `state_translation` VALUES (101421, 102369, 10, '2004-12-23 22:12:52', 0);
INSERT INTO `state_translation` VALUES (101529, 102370, 10, '2004-12-23 22:12:53', 0);
INSERT INTO `state_translation` VALUES (101530, 102371, 10, '2004-12-23 22:12:54', 0);
INSERT INTO `state_translation` VALUES (101532, 102372, 10, '2004-12-23 22:12:53', 0);
INSERT INTO `state_translation` VALUES (101424, 102373, 10, '2004-12-23 22:12:53', 0);
INSERT INTO `state_translation` VALUES (101423, 102374, 10, '2004-12-23 22:12:53', 0);
INSERT INTO `state_translation` VALUES (101533, 102375, 10, '2004-12-23 22:12:54', 0);
INSERT INTO `state_translation` VALUES (101534, 102376, 10, '2004-12-23 22:12:55', 0);
INSERT INTO `state_translation` VALUES (101536, 102377, 10, '2004-12-23 22:12:54', 0);
INSERT INTO `state_translation` VALUES (101426, 102378, 10, '2004-12-23 22:12:56', 0);
INSERT INTO `state_translation` VALUES (101425, 102379, 10, '2004-12-23 22:12:55', 0);
INSERT INTO `state_translation` VALUES (101537, 102380, 10, '2004-12-23 22:12:55', 0);
INSERT INTO `state_translation` VALUES (101538, 102381, 10, '2004-12-23 22:12:56', 0);
INSERT INTO `state_translation` VALUES (101540, 102382, 10, '2004-12-23 22:12:56', 0);
INSERT INTO `state_translation` VALUES (101541, 102383, 10, '2004-12-23 22:12:56', 0);
INSERT INTO `state_translation` VALUES (101542, 102384, 10, '2004-12-23 22:12:58', 0);
INSERT INTO `state_translation` VALUES (101544, 102385, 10, '2004-12-23 22:12:57', 0);
INSERT INTO `state_translation` VALUES (101420, 102386, 10, '2004-12-23 22:12:57', 0);
INSERT INTO `state_translation` VALUES (101419, 102387, 10, '2004-12-23 22:12:57', 0);
INSERT INTO `state_translation` VALUES (101545, 102388, 10, '2004-12-23 22:12:57', 0);
INSERT INTO `state_translation` VALUES (101626, 102389, 10, '2004-12-23 22:12:59', 0);
INSERT INTO `state_translation` VALUES (101628, 102390, 10, '2004-12-23 22:12:58', 0);
INSERT INTO `state_translation` VALUES (101430, 102391, 10, '2004-12-23 22:12:58', 0);
INSERT INTO `state_translation` VALUES (101429, 102392, 10, '2004-12-23 22:12:58', 0);
INSERT INTO `state_translation` VALUES (101629, 102393, 10, '2004-12-23 22:12:58', 0);
INSERT INTO `state_translation` VALUES (101630, 102394, 10, '2004-12-23 22:13:00', 0);
INSERT INTO `state_translation` VALUES (101632, 102395, 10, '2004-12-23 22:12:59', 0);
INSERT INTO `state_translation` VALUES (101432, 102396, 10, '2004-12-23 22:12:59', 0);
INSERT INTO `state_translation` VALUES (101431, 102397, 10, '2004-12-23 22:12:59', 0);
INSERT INTO `state_translation` VALUES (101633, 102398, 10, '2004-12-23 22:13:00', 0);
INSERT INTO `state_translation` VALUES (101634, 102399, 10, '2004-12-23 22:13:01', 0);
INSERT INTO `state_translation` VALUES (101636, 102400, 10, '2004-12-23 22:13:00', 0);
INSERT INTO `state_translation` VALUES (101434, 102401, 10, '2004-12-23 22:13:00', 0);
INSERT INTO `state_translation` VALUES (101433, 102402, 10, '2004-12-23 22:13:00', 0);
INSERT INTO `state_translation` VALUES (101637, 102403, 10, '2004-12-23 22:13:01', 0);
INSERT INTO `state_translation` VALUES (101638, 102404, 10, '2004-12-23 22:13:02', 0);
INSERT INTO `state_translation` VALUES (101640, 102405, 10, '2004-12-23 22:13:01', 0);
INSERT INTO `state_translation` VALUES (101436, 102406, 10, '2004-12-23 22:13:02', 0);
INSERT INTO `state_translation` VALUES (101435, 102407, 10, '2004-12-23 22:13:02', 0);
INSERT INTO `state_translation` VALUES (101641, 102408, 10, '2004-12-23 22:13:02', 0);
INSERT INTO `state_translation` VALUES (101642, 102409, 10, '2004-12-23 22:13:04', 0);
INSERT INTO `state_translation` VALUES (101644, 102410, 10, '2004-12-23 22:13:03', 0);
INSERT INTO `state_translation` VALUES (101438, 102411, 10, '2004-12-23 22:13:03', 0);
INSERT INTO `state_translation` VALUES (101437, 102412, 10, '2004-12-23 22:13:03', 0);
INSERT INTO `state_translation` VALUES (101645, 102413, 10, '2004-12-23 22:13:03', 0);
INSERT INTO `state_translation` VALUES (101646, 102414, 10, '2004-12-23 22:13:05', 0);
INSERT INTO `state_translation` VALUES (101648, 102415, 10, '2004-12-23 22:13:04', 0);
INSERT INTO `state_translation` VALUES (101440, 102416, 10, '2004-12-23 22:13:04', 0);
INSERT INTO `state_translation` VALUES (101439, 102417, 10, '2004-12-23 22:13:04', 0);
INSERT INTO `state_translation` VALUES (101649, 102418, 10, '2004-12-23 22:13:05', 0);
INSERT INTO `state_translation` VALUES (101650, 102419, 10, '2004-12-23 22:13:06', 0);
INSERT INTO `state_translation` VALUES (101652, 102420, 10, '2004-12-23 22:13:05', 0);
INSERT INTO `state_translation` VALUES (101442, 102421, 10, '2004-12-23 22:13:06', 0);
INSERT INTO `state_translation` VALUES (101441, 102422, 10, '2004-12-23 22:13:06', 0);
INSERT INTO `state_translation` VALUES (101653, 102423, 10, '2004-12-23 22:13:06', 0);
INSERT INTO `state_translation` VALUES (101654, 102424, 10, '2004-12-23 22:13:07', 0);
INSERT INTO `state_translation` VALUES (101656, 102425, 10, '2004-12-23 22:13:07', 0);
INSERT INTO `state_translation` VALUES (101446, 102426, 10, '2004-12-23 22:13:07', 0);
INSERT INTO `state_translation` VALUES (101445, 102427, 10, '2004-12-23 22:13:07', 0);
INSERT INTO `state_translation` VALUES (101657, 102428, 10, '2004-12-23 22:13:07', 0);
INSERT INTO `state_translation` VALUES (101658, 102429, 10, '2004-12-23 22:13:09', 0);
INSERT INTO `state_translation` VALUES (101660, 102430, 10, '2004-12-23 22:13:08', 0);
INSERT INTO `state_translation` VALUES (101448, 102431, 10, '2004-12-23 22:13:08', 0);
INSERT INTO `state_translation` VALUES (101447, 102432, 10, '2004-12-23 22:13:08', 0);
INSERT INTO `state_translation` VALUES (101661, 102433, 10, '2004-12-23 22:13:08', 0);
INSERT INTO `state_translation` VALUES (101662, 102434, 10, '2004-12-23 22:13:10', 0);
INSERT INTO `state_translation` VALUES (101664, 102435, 10, '2004-12-23 22:13:09', 0);
INSERT INTO `state_translation` VALUES (101450, 102436, 10, '2004-12-23 22:13:09', 0);
INSERT INTO `state_translation` VALUES (101449, 102437, 10, '2004-12-23 22:13:09', 0);
INSERT INTO `state_translation` VALUES (101665, 102438, 10, '2004-12-23 22:13:10', 0);
INSERT INTO `state_translation` VALUES (101666, 102439, 10, '2004-12-23 22:13:12', 0);
INSERT INTO `state_translation` VALUES (101668, 102440, 10, '2004-12-23 22:13:10', 0);
INSERT INTO `state_translation` VALUES (101452, 102441, 10, '2004-12-23 22:13:10', 0);
INSERT INTO `state_translation` VALUES (101451, 102442, 10, '2004-12-23 22:13:10', 0);
INSERT INTO `state_translation` VALUES (101669, 102443, 10, '2004-12-23 22:13:11', 0);
INSERT INTO `state_translation` VALUES (101670, 102444, 10, '2004-12-23 22:13:13', 0);
INSERT INTO `state_translation` VALUES (101672, 102445, 10, '2004-12-23 22:13:12', 0);
INSERT INTO `state_translation` VALUES (101456, 102446, 10, '2004-12-23 22:13:12', 0);
INSERT INTO `state_translation` VALUES (101455, 102447, 10, '2004-12-23 22:13:12', 0);
INSERT INTO `state_translation` VALUES (101673, 102448, 10, '2004-12-23 22:13:13', 0);
INSERT INTO `state_translation` VALUES (101674, 102449, 10, '2004-12-23 22:13:15', 0);
INSERT INTO `state_translation` VALUES (101676, 102450, 10, '2004-12-23 22:13:13', 0);
INSERT INTO `state_translation` VALUES (101454, 102451, 10, '2004-12-23 22:13:13', 0);
INSERT INTO `state_translation` VALUES (101453, 102452, 10, '2004-12-23 22:13:14', 0);
INSERT INTO `state_translation` VALUES (101677, 102453, 10, '2004-12-23 22:13:14', 0);
INSERT INTO `state_translation` VALUES (101678, 102454, 10, '2004-12-23 22:13:17', 0);
INSERT INTO `state_translation` VALUES (101680, 102455, 10, '2004-12-23 22:13:15', 0);
INSERT INTO `state_translation` VALUES (101458, 102456, 10, '2004-12-23 22:13:16', 0);
INSERT INTO `state_translation` VALUES (101457, 102457, 10, '2004-12-23 22:13:16', 0);
INSERT INTO `state_translation` VALUES (101681, 102458, 10, '2004-12-23 22:13:16', 0);
INSERT INTO `state_translation` VALUES (101682, 102459, 10, '2004-12-23 22:13:19', 0);
INSERT INTO `state_translation` VALUES (101684, 102460, 10, '2004-12-23 22:13:17', 0);
INSERT INTO `state_translation` VALUES (101460, 102461, 10, '2004-12-23 22:13:17', 0);
INSERT INTO `state_translation` VALUES (101459, 102462, 10, '2004-12-23 22:13:17', 0);
INSERT INTO `state_translation` VALUES (101685, 102463, 10, '2004-12-23 22:13:18', 0);
INSERT INTO `state_translation` VALUES (101686, 102464, 10, '2004-12-23 22:13:20', 0);
INSERT INTO `state_translation` VALUES (101688, 102465, 10, '2004-12-23 22:13:19', 0);
INSERT INTO `state_translation` VALUES (101462, 102466, 10, '2004-12-23 22:13:19', 0);
INSERT INTO `state_translation` VALUES (101461, 102467, 10, '2004-12-23 22:13:19', 0);
INSERT INTO `state_translation` VALUES (101689, 102468, 10, '2004-12-23 22:13:20', 0);
INSERT INTO `state_translation` VALUES (101690, 102469, 10, '2004-12-23 22:13:22', 0);
INSERT INTO `state_translation` VALUES (101692, 102470, 10, '2004-12-23 22:13:21', 0);
INSERT INTO `state_translation` VALUES (101464, 102471, 10, '2004-12-23 22:13:21', 0);
INSERT INTO `state_translation` VALUES (101463, 102472, 10, '2004-12-23 22:13:21', 0);
INSERT INTO `state_translation` VALUES (101693, 102473, 10, '2004-12-23 22:13:21', 0);
INSERT INTO `state_translation` VALUES (101694, 102474, 10, '2004-12-23 22:13:23', 0);
INSERT INTO `state_translation` VALUES (101696, 102475, 10, '2004-12-23 22:13:22', 0);
INSERT INTO `state_translation` VALUES (101466, 102476, 10, '2004-12-23 22:13:22', 0);
INSERT INTO `state_translation` VALUES (101465, 102477, 10, '2004-12-23 22:13:22', 0);
INSERT INTO `state_translation` VALUES (101697, 102478, 10, '2004-12-23 22:13:23', 0);
INSERT INTO `state_translation` VALUES (101698, 102479, 10, '2004-12-23 22:13:24', 0);
INSERT INTO `state_translation` VALUES (101700, 102480, 10, '2004-12-23 22:13:23', 0);
INSERT INTO `state_translation` VALUES (101468, 102481, 10, '2004-12-23 22:13:24', 0);
INSERT INTO `state_translation` VALUES (101467, 102482, 10, '2004-12-23 22:13:24', 0);
INSERT INTO `state_translation` VALUES (101701, 102483, 10, '2004-12-23 22:13:24', 0);
INSERT INTO `state_translation` VALUES (102486, 102488, 10, '2004-12-08 14:46:59', 0);
INSERT INTO `state_translation` VALUES (102279, 102490, 10, '2004-12-08 14:46:59', 0);
INSERT INTO `state_translation` VALUES (101870, 102491, 10, '2004-12-08 14:46:59', 0);
INSERT INTO `state_translation` VALUES (102282, 102492, 10, '2004-12-08 14:46:59', 0);
INSERT INTO `state_translation` VALUES (102281, 102493, 10, '2004-12-08 14:46:59', 0);
INSERT INTO `state_translation` VALUES (102280, 102494, 10, '2004-12-08 14:46:59', 0);
INSERT INTO `state_translation` VALUES (102285, 102495, 10, '2004-12-08 14:46:59', 0);
INSERT INTO `state_translation` VALUES (102488, 102496, 10, '2004-12-08 14:46:59', 0);
INSERT INTO `state_translation` VALUES (102296, 102498, 10, '2004-12-08 14:46:59', 0);
INSERT INTO `state_translation` VALUES (102289, 102499, 10, '2004-12-08 14:47:10', 0);
INSERT INTO `state_translation` VALUES (102290, 102500, 10, '2004-12-08 14:46:59', 0);
INSERT INTO `state_translation` VALUES (102291, 102501, 10, '2004-12-08 14:46:59', 0);
INSERT INTO `state_translation` VALUES (101361, 102502, 10, '2004-12-08 14:46:59', 0);
INSERT INTO `state_translation` VALUES (102297, 102503, 10, '2004-12-08 14:46:59', 0);
INSERT INTO `state_translation` VALUES (102298, 102504, 10, '2004-12-08 14:46:59', 0);
INSERT INTO `state_translation` VALUES (100028, 102505, 10, '2004-12-08 14:47:10', 0);
INSERT INTO `state_translation` VALUES (102299, 102506, 10, '2004-12-08 14:46:59', 0);
INSERT INTO `state_translation` VALUES (102300, 102507, 10, '2004-12-08 14:46:59', 0);
INSERT INTO `state_translation` VALUES (102288, 102508, 10, '2004-12-08 14:47:02', 0);
INSERT INTO `state_translation` VALUES (101356, 102509, 10, '2004-12-08 14:47:02', 0);
INSERT INTO `state_translation` VALUES (102293, 102510, 10, '2004-12-08 14:47:02', 0);
INSERT INTO `state_translation` VALUES (102294, 102511, 10, '2004-12-08 14:47:02', 0);
INSERT INTO `state_translation` VALUES (102295, 102512, 10, '2004-12-08 14:47:02', 0);
INSERT INTO `state_translation` VALUES (102292, 102513, 10, '2004-12-08 14:47:02', 0);
INSERT INTO `state_translation` VALUES (102301, 102514, 10, '2004-12-08 14:47:05', 0);
INSERT INTO `state_translation` VALUES (101469, 102515, 10, '2004-12-08 14:47:05', 0);
INSERT INTO `state_translation` VALUES (102302, 102516, 10, '2004-12-08 14:47:05', 0);
INSERT INTO `state_translation` VALUES (102303, 102517, 10, '2004-12-08 14:47:05', 0);
INSERT INTO `state_translation` VALUES (102304, 102518, 10, '2004-12-08 14:47:05', 0);
INSERT INTO `state_translation` VALUES (102305, 102519, 10, '2004-12-08 14:47:05', 0);
INSERT INTO `state_translation` VALUES (102306, 102520, 10, '2004-12-08 14:47:06', 0);
INSERT INTO `state_translation` VALUES (101478, 102521, 10, '2004-12-08 14:47:05', 0);
INSERT INTO `state_translation` VALUES (102307, 102522, 10, '2004-12-08 14:47:05', 0);
INSERT INTO `state_translation` VALUES (102308, 102523, 10, '2004-12-08 14:47:05', 0);
INSERT INTO `state_translation` VALUES (102309, 102524, 10, '2004-12-08 14:47:05', 0);
INSERT INTO `state_translation` VALUES (102310, 102525, 10, '2004-12-08 14:47:05', 0);
INSERT INTO `state_translation` VALUES (102311, 102526, 10, '2004-12-08 14:47:06', 0);
INSERT INTO `state_translation` VALUES (101479, 102527, 10, '2004-12-08 14:47:06', 0);
INSERT INTO `state_translation` VALUES (102312, 102528, 10, '2004-12-08 14:47:06', 0);
INSERT INTO `state_translation` VALUES (102313, 102529, 10, '2004-12-08 14:47:06', 0);
INSERT INTO `state_translation` VALUES (102314, 102530, 10, '2004-12-08 14:47:06', 0);
INSERT INTO `state_translation` VALUES (102315, 102531, 10, '2004-12-08 14:47:06', 0);
INSERT INTO `state_translation` VALUES (102316, 102532, 10, '2004-12-08 14:47:06', 0);
INSERT INTO `state_translation` VALUES (101501, 102533, 10, '2004-12-08 14:47:06', 0);
INSERT INTO `state_translation` VALUES (102317, 102534, 10, '2004-12-08 14:47:06', 0);
INSERT INTO `state_translation` VALUES (102318, 102535, 10, '2004-12-08 14:47:06', 0);
INSERT INTO `state_translation` VALUES (102319, 102536, 10, '2004-12-08 14:47:06', 0);
INSERT INTO `state_translation` VALUES (102320, 102537, 10, '2004-12-08 14:47:06', 0);
INSERT INTO `state_translation` VALUES (102321, 102538, 10, '2004-12-08 14:47:06', 0);
INSERT INTO `state_translation` VALUES (101502, 102539, 10, '2004-12-08 14:47:06', 0);
INSERT INTO `state_translation` VALUES (102322, 102540, 10, '2004-12-08 14:47:06', 0);
INSERT INTO `state_translation` VALUES (102323, 102541, 10, '2004-12-08 14:47:06', 0);
INSERT INTO `state_translation` VALUES (102324, 102542, 10, '2004-12-08 14:47:06', 0);
INSERT INTO `state_translation` VALUES (102325, 102543, 10, '2004-12-08 14:47:06', 0);
INSERT INTO `state_translation` VALUES (102326, 102544, 10, '2004-12-08 14:47:06', 0);
INSERT INTO `state_translation` VALUES (101503, 102545, 10, '2004-12-08 14:47:06', 0);
INSERT INTO `state_translation` VALUES (102327, 102546, 10, '2004-12-08 14:47:06', 0);
INSERT INTO `state_translation` VALUES (102328, 102547, 10, '2004-12-08 14:47:06', 0);
INSERT INTO `state_translation` VALUES (102329, 102548, 10, '2004-12-08 14:47:06', 0);
INSERT INTO `state_translation` VALUES (102330, 102549, 10, '2004-12-08 14:47:06', 0);
INSERT INTO `state_translation` VALUES (102331, 102550, 10, '2004-12-08 14:47:06', 0);
INSERT INTO `state_translation` VALUES (101504, 102551, 10, '2004-12-08 14:47:06', 0);
INSERT INTO `state_translation` VALUES (102332, 102552, 10, '2004-12-08 14:47:06', 0);
INSERT INTO `state_translation` VALUES (102333, 102553, 10, '2004-12-08 14:47:06', 0);
INSERT INTO `state_translation` VALUES (102334, 102554, 10, '2004-12-08 14:47:06', 0);
INSERT INTO `state_translation` VALUES (102335, 102555, 10, '2004-12-08 14:47:06', 0);
INSERT INTO `state_translation` VALUES (102336, 102556, 10, '2004-12-08 14:47:06', 0);
INSERT INTO `state_translation` VALUES (101505, 102557, 10, '2004-12-08 14:47:06', 0);
INSERT INTO `state_translation` VALUES (102337, 102558, 10, '2004-12-08 14:47:06', 0);
INSERT INTO `state_translation` VALUES (102338, 102559, 10, '2004-12-08 14:47:06', 0);
INSERT INTO `state_translation` VALUES (102339, 102560, 10, '2004-12-08 14:47:06', 0);
INSERT INTO `state_translation` VALUES (102340, 102561, 10, '2004-12-08 14:47:06', 0);
INSERT INTO `state_translation` VALUES (102341, 102562, 10, '2004-12-08 14:47:06', 0);
INSERT INTO `state_translation` VALUES (101601, 102563, 10, '2004-12-08 14:47:06', 0);
INSERT INTO `state_translation` VALUES (102342, 102564, 10, '2004-12-08 14:47:06', 0);
INSERT INTO `state_translation` VALUES (102343, 102565, 10, '2004-12-08 14:47:06', 0);
INSERT INTO `state_translation` VALUES (102344, 102566, 10, '2004-12-08 14:47:06', 0);
INSERT INTO `state_translation` VALUES (102345, 102567, 10, '2004-12-08 14:47:06', 0);
INSERT INTO `state_translation` VALUES (102346, 102568, 10, '2004-12-08 14:47:07', 0);
INSERT INTO `state_translation` VALUES (101602, 102569, 10, '2004-12-08 14:47:06', 0);
INSERT INTO `state_translation` VALUES (102347, 102570, 10, '2004-12-08 14:47:06', 0);
INSERT INTO `state_translation` VALUES (102348, 102571, 10, '2004-12-08 14:47:06', 0);
INSERT INTO `state_translation` VALUES (102349, 102572, 10, '2004-12-08 14:47:06', 0);
INSERT INTO `state_translation` VALUES (102350, 102573, 10, '2004-12-08 14:47:06', 0);
INSERT INTO `state_translation` VALUES (102351, 102574, 10, '2004-12-08 14:47:07', 0);
INSERT INTO `state_translation` VALUES (101603, 102575, 10, '2004-12-08 14:47:07', 0);
INSERT INTO `state_translation` VALUES (102352, 102576, 10, '2004-12-08 14:47:07', 0);
INSERT INTO `state_translation` VALUES (102353, 102577, 10, '2004-12-08 14:47:07', 0);
INSERT INTO `state_translation` VALUES (102354, 102578, 10, '2004-12-08 14:47:07', 0);
INSERT INTO `state_translation` VALUES (102355, 102579, 10, '2004-12-08 14:47:07', 0);
INSERT INTO `state_translation` VALUES (102356, 102580, 10, '2004-12-08 14:47:07', 0);
INSERT INTO `state_translation` VALUES (101604, 102581, 10, '2004-12-08 14:47:07', 0);
INSERT INTO `state_translation` VALUES (102357, 102582, 10, '2004-12-08 14:47:07', 0);
INSERT INTO `state_translation` VALUES (102358, 102583, 10, '2004-12-08 14:47:07', 0);
INSERT INTO `state_translation` VALUES (102359, 102584, 10, '2004-12-08 14:47:07', 0);
INSERT INTO `state_translation` VALUES (102360, 102585, 10, '2004-12-08 14:47:07', 0);
INSERT INTO `state_translation` VALUES (102361, 102586, 10, '2004-12-08 14:47:07', 0);
INSERT INTO `state_translation` VALUES (101605, 102587, 10, '2004-12-08 14:47:07', 0);
INSERT INTO `state_translation` VALUES (102362, 102588, 10, '2004-12-08 14:47:07', 0);
INSERT INTO `state_translation` VALUES (102363, 102589, 10, '2004-12-08 14:47:07', 0);
INSERT INTO `state_translation` VALUES (102364, 102590, 10, '2004-12-08 14:47:07', 0);
INSERT INTO `state_translation` VALUES (102365, 102591, 10, '2004-12-08 14:47:07', 0);
INSERT INTO `state_translation` VALUES (102366, 102592, 10, '2004-12-08 14:47:07', 0);
INSERT INTO `state_translation` VALUES (101703, 102593, 10, '2004-12-08 14:47:07', 0);
INSERT INTO `state_translation` VALUES (102367, 102594, 10, '2004-12-08 14:47:07', 0);
INSERT INTO `state_translation` VALUES (102368, 102595, 10, '2004-12-08 14:47:07', 0);
INSERT INTO `state_translation` VALUES (102369, 102596, 10, '2004-12-08 14:47:07', 0);
INSERT INTO `state_translation` VALUES (102370, 102597, 10, '2004-12-08 14:47:07', 0);
INSERT INTO `state_translation` VALUES (102371, 102598, 10, '2004-12-08 14:47:07', 0);
INSERT INTO `state_translation` VALUES (101705, 102599, 10, '2004-12-08 14:47:07', 0);
INSERT INTO `state_translation` VALUES (102372, 102600, 10, '2004-12-08 14:47:07', 0);
INSERT INTO `state_translation` VALUES (102373, 102601, 10, '2004-12-08 14:47:07', 0);
INSERT INTO `state_translation` VALUES (102374, 102602, 10, '2004-12-08 14:47:07', 0);
INSERT INTO `state_translation` VALUES (102375, 102603, 10, '2004-12-08 14:47:07', 0);
INSERT INTO `state_translation` VALUES (102376, 102604, 10, '2004-12-08 14:47:07', 0);
INSERT INTO `state_translation` VALUES (101707, 102605, 10, '2004-12-08 14:47:07', 0);
INSERT INTO `state_translation` VALUES (102377, 102606, 10, '2004-12-08 14:47:07', 0);
INSERT INTO `state_translation` VALUES (102378, 102607, 10, '2004-12-08 14:47:07', 0);
INSERT INTO `state_translation` VALUES (102379, 102608, 10, '2004-12-08 14:47:07', 0);
INSERT INTO `state_translation` VALUES (102380, 102609, 10, '2004-12-08 14:47:07', 0);
INSERT INTO `state_translation` VALUES (102381, 102610, 10, '2004-12-08 14:47:07', 0);
INSERT INTO `state_translation` VALUES (101708, 102611, 10, '2004-12-08 14:47:07', 0);
INSERT INTO `state_translation` VALUES (102382, 102612, 10, '2004-12-08 14:47:07', 0);
INSERT INTO `state_translation` VALUES (102383, 102613, 10, '2004-12-08 14:47:07', 0);
INSERT INTO `state_translation` VALUES (102384, 102614, 10, '2004-12-08 14:47:08', 0);
INSERT INTO `state_translation` VALUES (101710, 102615, 10, '2004-12-08 14:47:07', 0);
INSERT INTO `state_translation` VALUES (102385, 102616, 10, '2004-12-08 14:47:07', 0);
INSERT INTO `state_translation` VALUES (102386, 102617, 10, '2004-12-08 14:47:07', 0);
INSERT INTO `state_translation` VALUES (102387, 102618, 10, '2004-12-08 14:47:07', 0);
INSERT INTO `state_translation` VALUES (102388, 102619, 10, '2004-12-08 14:47:07', 0);
INSERT INTO `state_translation` VALUES (102389, 102620, 10, '2004-12-08 14:47:08', 0);
INSERT INTO `state_translation` VALUES (101712, 102621, 10, '2004-12-08 14:47:08', 0);
INSERT INTO `state_translation` VALUES (102390, 102622, 10, '2004-12-08 14:47:08', 0);
INSERT INTO `state_translation` VALUES (102391, 102623, 10, '2004-12-08 14:47:08', 0);
INSERT INTO `state_translation` VALUES (102392, 102624, 10, '2004-12-08 14:47:08', 0);
INSERT INTO `state_translation` VALUES (102393, 102625, 10, '2004-12-08 14:47:08', 0);
INSERT INTO `state_translation` VALUES (102394, 102626, 10, '2004-12-08 14:47:08', 0);
INSERT INTO `state_translation` VALUES (101713, 102627, 10, '2004-12-08 14:47:08', 0);
INSERT INTO `state_translation` VALUES (102395, 102628, 10, '2004-12-08 14:47:08', 0);
INSERT INTO `state_translation` VALUES (102396, 102629, 10, '2004-12-08 14:47:08', 0);
INSERT INTO `state_translation` VALUES (102397, 102630, 10, '2004-12-08 14:47:08', 0);
INSERT INTO `state_translation` VALUES (102398, 102631, 10, '2004-12-08 14:47:08', 0);
INSERT INTO `state_translation` VALUES (102399, 102632, 10, '2004-12-08 14:47:08', 0);
INSERT INTO `state_translation` VALUES (101714, 102633, 10, '2004-12-08 14:47:08', 0);
INSERT INTO `state_translation` VALUES (102400, 102634, 10, '2004-12-08 14:47:08', 0);
INSERT INTO `state_translation` VALUES (102401, 102635, 10, '2004-12-08 14:47:08', 0);
INSERT INTO `state_translation` VALUES (102402, 102636, 10, '2004-12-08 14:47:08', 0);
INSERT INTO `state_translation` VALUES (102403, 102637, 10, '2004-12-08 14:47:08', 0);
INSERT INTO `state_translation` VALUES (102404, 102638, 10, '2004-12-08 14:47:08', 0);
INSERT INTO `state_translation` VALUES (101715, 102639, 10, '2004-12-08 14:47:08', 0);
INSERT INTO `state_translation` VALUES (102405, 102640, 10, '2004-12-08 14:47:08', 0);
INSERT INTO `state_translation` VALUES (102406, 102641, 10, '2004-12-08 14:47:08', 0);
INSERT INTO `state_translation` VALUES (102407, 102642, 10, '2004-12-08 14:47:08', 0);
INSERT INTO `state_translation` VALUES (102408, 102643, 10, '2004-12-08 14:47:08', 0);
INSERT INTO `state_translation` VALUES (102409, 102644, 10, '2004-12-08 14:47:08', 0);
INSERT INTO `state_translation` VALUES (101716, 102645, 10, '2004-12-08 14:47:08', 0);
INSERT INTO `state_translation` VALUES (102410, 102646, 10, '2004-12-08 14:47:08', 0);
INSERT INTO `state_translation` VALUES (102411, 102647, 10, '2004-12-08 14:47:08', 0);
INSERT INTO `state_translation` VALUES (102412, 102648, 10, '2004-12-08 14:47:08', 0);
INSERT INTO `state_translation` VALUES (102413, 102649, 10, '2004-12-08 14:47:08', 0);
INSERT INTO `state_translation` VALUES (102414, 102650, 10, '2004-12-08 14:47:08', 0);
INSERT INTO `state_translation` VALUES (101720, 102651, 10, '2004-12-08 14:47:08', 0);
INSERT INTO `state_translation` VALUES (102415, 102652, 10, '2004-12-08 14:47:08', 0);
INSERT INTO `state_translation` VALUES (102416, 102653, 10, '2004-12-08 14:47:08', 0);
INSERT INTO `state_translation` VALUES (102417, 102654, 10, '2004-12-08 14:47:08', 0);
INSERT INTO `state_translation` VALUES (102418, 102655, 10, '2004-12-08 14:47:08', 0);
INSERT INTO `state_translation` VALUES (102419, 102656, 10, '2004-12-08 14:47:08', 0);
INSERT INTO `state_translation` VALUES (101724, 102657, 10, '2004-12-08 14:47:08', 0);
INSERT INTO `state_translation` VALUES (102420, 102658, 10, '2004-12-08 14:47:08', 0);
INSERT INTO `state_translation` VALUES (102421, 102659, 10, '2004-12-08 14:47:08', 0);
INSERT INTO `state_translation` VALUES (102422, 102660, 10, '2004-12-08 14:47:08', 0);
INSERT INTO `state_translation` VALUES (102423, 102661, 10, '2004-12-08 14:47:08', 0);
INSERT INTO `state_translation` VALUES (102424, 102662, 10, '2004-12-08 14:47:09', 0);
INSERT INTO `state_translation` VALUES (101728, 102663, 10, '2004-12-08 14:47:08', 0);
INSERT INTO `state_translation` VALUES (102425, 102664, 10, '2004-12-08 14:47:08', 0);
INSERT INTO `state_translation` VALUES (102426, 102665, 10, '2004-12-08 14:47:08', 0);
INSERT INTO `state_translation` VALUES (102427, 102666, 10, '2004-12-08 14:47:08', 0);
INSERT INTO `state_translation` VALUES (102428, 102667, 10, '2004-12-08 14:47:09', 0);
INSERT INTO `state_translation` VALUES (102429, 102668, 10, '2004-12-08 14:47:09', 0);
INSERT INTO `state_translation` VALUES (101732, 102669, 10, '2004-12-08 14:47:09', 0);
INSERT INTO `state_translation` VALUES (102430, 102670, 10, '2004-12-08 14:47:09', 0);
INSERT INTO `state_translation` VALUES (102431, 102671, 10, '2004-12-08 14:47:09', 0);
INSERT INTO `state_translation` VALUES (102432, 102672, 10, '2004-12-08 14:47:09', 0);
INSERT INTO `state_translation` VALUES (102433, 102673, 10, '2004-12-08 14:47:09', 0);
INSERT INTO `state_translation` VALUES (102434, 102674, 10, '2004-12-08 14:47:09', 0);
INSERT INTO `state_translation` VALUES (101736, 102675, 10, '2004-12-08 14:47:09', 0);
INSERT INTO `state_translation` VALUES (102435, 102676, 10, '2004-12-08 14:47:09', 0);
INSERT INTO `state_translation` VALUES (102436, 102677, 10, '2004-12-08 14:47:09', 0);
INSERT INTO `state_translation` VALUES (102437, 102678, 10, '2004-12-08 14:47:09', 0);
INSERT INTO `state_translation` VALUES (102438, 102679, 10, '2004-12-08 14:47:09', 0);
INSERT INTO `state_translation` VALUES (102439, 102680, 10, '2004-12-08 14:47:09', 0);
INSERT INTO `state_translation` VALUES (101737, 102681, 10, '2004-12-08 14:47:09', 0);
INSERT INTO `state_translation` VALUES (102440, 102682, 10, '2004-12-08 14:47:09', 0);
INSERT INTO `state_translation` VALUES (102441, 102683, 10, '2004-12-08 14:47:09', 0);
INSERT INTO `state_translation` VALUES (102442, 102684, 10, '2004-12-08 14:47:09', 0);
INSERT INTO `state_translation` VALUES (102443, 102685, 10, '2004-12-08 14:47:09', 0);
INSERT INTO `state_translation` VALUES (102444, 102686, 10, '2004-12-08 14:47:09', 0);
INSERT INTO `state_translation` VALUES (101738, 102687, 10, '2004-12-08 14:47:09', 0);
INSERT INTO `state_translation` VALUES (102445, 102688, 10, '2004-12-08 14:47:09', 0);
INSERT INTO `state_translation` VALUES (102446, 102689, 10, '2004-12-08 14:47:09', 0);
INSERT INTO `state_translation` VALUES (102447, 102690, 10, '2004-12-08 14:47:09', 0);
INSERT INTO `state_translation` VALUES (102448, 102691, 10, '2004-12-08 14:47:09', 0);
INSERT INTO `state_translation` VALUES (102449, 102692, 10, '2004-12-08 14:47:09', 0);
INSERT INTO `state_translation` VALUES (101739, 102693, 10, '2004-12-08 14:47:09', 0);
INSERT INTO `state_translation` VALUES (102450, 102694, 10, '2004-12-08 14:47:09', 0);
INSERT INTO `state_translation` VALUES (102451, 102695, 10, '2004-12-08 14:47:09', 0);
INSERT INTO `state_translation` VALUES (102452, 102696, 10, '2004-12-08 14:47:09', 0);
INSERT INTO `state_translation` VALUES (102453, 102697, 10, '2004-12-08 14:47:09', 0);
INSERT INTO `state_translation` VALUES (102454, 102698, 10, '2004-12-08 14:47:09', 0);
INSERT INTO `state_translation` VALUES (101740, 102699, 10, '2004-12-08 14:47:09', 0);
INSERT INTO `state_translation` VALUES (102455, 102700, 10, '2004-12-08 14:47:09', 0);
INSERT INTO `state_translation` VALUES (102456, 102701, 10, '2004-12-08 14:47:09', 0);
INSERT INTO `state_translation` VALUES (102457, 102702, 10, '2004-12-08 14:47:09', 0);
INSERT INTO `state_translation` VALUES (102458, 102703, 10, '2004-12-08 14:47:09', 0);
INSERT INTO `state_translation` VALUES (102459, 102704, 10, '2004-12-08 14:47:10', 0);
INSERT INTO `state_translation` VALUES (101741, 102705, 10, '2004-12-08 14:47:09', 0);
INSERT INTO `state_translation` VALUES (102460, 102706, 10, '2004-12-08 14:47:09', 0);
INSERT INTO `state_translation` VALUES (102461, 102707, 10, '2004-12-08 14:47:09', 0);
INSERT INTO `state_translation` VALUES (102462, 102708, 10, '2004-12-08 14:47:09', 0);
INSERT INTO `state_translation` VALUES (102463, 102709, 10, '2004-12-08 14:47:10', 0);
INSERT INTO `state_translation` VALUES (102464, 102710, 10, '2004-12-08 14:47:10', 0);
INSERT INTO `state_translation` VALUES (101742, 102711, 10, '2004-12-08 14:47:10', 0);
INSERT INTO `state_translation` VALUES (102465, 102712, 10, '2004-12-08 14:47:10', 0);
INSERT INTO `state_translation` VALUES (102466, 102713, 10, '2004-12-08 14:47:10', 0);
INSERT INTO `state_translation` VALUES (102467, 102714, 10, '2004-12-08 14:47:10', 0);
INSERT INTO `state_translation` VALUES (102468, 102715, 10, '2004-12-08 14:47:10', 0);
INSERT INTO `state_translation` VALUES (102469, 102716, 10, '2004-12-08 14:47:10', 0);
INSERT INTO `state_translation` VALUES (101743, 102717, 10, '2004-12-08 14:47:10', 0);
INSERT INTO `state_translation` VALUES (102470, 102718, 10, '2004-12-08 14:47:10', 0);
INSERT INTO `state_translation` VALUES (102471, 102719, 10, '2004-12-08 14:47:10', 0);
INSERT INTO `state_translation` VALUES (102472, 102720, 10, '2004-12-08 14:47:10', 0);
INSERT INTO `state_translation` VALUES (102473, 102721, 10, '2004-12-08 14:47:10', 0);
INSERT INTO `state_translation` VALUES (102474, 102722, 10, '2004-12-08 14:47:10', 0);
INSERT INTO `state_translation` VALUES (101744, 102723, 10, '2004-12-08 14:47:10', 0);
INSERT INTO `state_translation` VALUES (102475, 102724, 10, '2004-12-08 14:47:10', 0);
INSERT INTO `state_translation` VALUES (102476, 102725, 10, '2004-12-08 14:47:10', 0);
INSERT INTO `state_translation` VALUES (102477, 102726, 10, '2004-12-08 14:47:10', 0);
INSERT INTO `state_translation` VALUES (102478, 102727, 10, '2004-12-08 14:47:10', 0);
INSERT INTO `state_translation` VALUES (102479, 102728, 10, '2004-12-08 14:47:10', 0);
INSERT INTO `state_translation` VALUES (101745, 102729, 10, '2004-12-08 14:47:10', 0);
INSERT INTO `state_translation` VALUES (102480, 102730, 10, '2004-12-08 14:47:10', 0);
INSERT INTO `state_translation` VALUES (102481, 102731, 10, '2004-12-08 14:47:10', 0);
INSERT INTO `state_translation` VALUES (102482, 102732, 10, '2004-12-08 14:47:10', 0);
INSERT INTO `state_translation` VALUES (102483, 102733, 10, '2004-12-08 14:47:10', 0);
INSERT INTO `state_translation` VALUES (102759, 102765, 10, '2004-12-22 18:17:37', 1);
INSERT INTO `state_translation` VALUES (102760, 102766, 10, '2004-12-10 11:05:01', 0);
INSERT INTO `state_translation` VALUES (102761, 102767, 10, '2004-12-22 18:17:37', 1);
INSERT INTO `state_translation` VALUES (102763, 102768, 10, '2004-12-10 11:05:01', 0);
INSERT INTO `state_translation` VALUES (102764, 102769, 10, '2004-12-10 11:05:01', 0);
INSERT INTO `state_translation` VALUES (102758, 102770, 10, '2004-12-22 18:17:37', 1);
INSERT INTO `state_translation` VALUES (102749, 102771, 10, '2004-12-22 18:11:09', 1);
INSERT INTO `state_translation` VALUES (102750, 102772, 10, '2004-12-10 11:05:15', 0);
INSERT INTO `state_translation` VALUES (102751, 102773, 10, '2004-12-22 18:11:09', 1);
INSERT INTO `state_translation` VALUES (102753, 102774, 10, '2004-12-10 11:05:15', 0);
INSERT INTO `state_translation` VALUES (102754, 102775, 10, '2004-12-10 11:05:15', 0);
INSERT INTO `state_translation` VALUES (102748, 102776, 10, '2004-12-22 18:11:09', 1);
INSERT INTO `state_translation` VALUES (102787, 102791, 10, '2004-12-16 11:52:46', 0);
INSERT INTO `state_translation` VALUES (102786, 102792, 10, '2004-12-23 22:12:29', 0);
INSERT INTO `state_translation` VALUES (102788, 102793, 10, '2004-12-23 22:12:28', 0);
INSERT INTO `state_translation` VALUES (102789, 102794, 10, '2004-12-23 22:12:28', 0);
INSERT INTO `state_translation` VALUES (102790, 102795, 10, '2004-12-23 22:12:29', 0);
INSERT INTO `state_translation` VALUES (102807, 102811, 10, '2004-12-21 22:47:38', 0);
INSERT INTO `state_translation` VALUES (102806, 102812, 10, '2004-12-23 22:12:28', 0);
INSERT INTO `state_translation` VALUES (102808, 102813, 10, '2004-12-23 22:12:27', 0);
INSERT INTO `state_translation` VALUES (102809, 102814, 10, '2004-12-23 22:12:27', 0);
INSERT INTO `state_translation` VALUES (102810, 102815, 10, '2004-12-23 22:12:27', 0);
INSERT INTO `state_translation` VALUES (102819, 102823, 10, '2004-12-21 23:29:06', 0);
INSERT INTO `state_translation` VALUES (102818, 102824, 10, '2004-12-23 22:12:27', 0);
INSERT INTO `state_translation` VALUES (102820, 102825, 10, '2004-12-23 22:12:26', 0);
INSERT INTO `state_translation` VALUES (102821, 102826, 10, '2004-12-23 22:12:26', 0);
INSERT INTO `state_translation` VALUES (102822, 102827, 10, '2004-12-23 22:12:26', 0);

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `syndication`
#

DROP TABLE IF EXISTS `syndication`;
CREATE TABLE `syndication` (
  `IN_ID` bigint(20) NOT NULL default '0',
  `OUT_ID` bigint(20) NOT NULL default '0',
  `PROVIDER` varchar(32) NOT NULL default '',
  UNIQUE KEY `OUT_ID` (`OUT_ID`)
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `syndication`
#

INSERT INTO `syndication` VALUES (100366, 100551, 'WWW.ZOO-MUNICH.COM');
INSERT INTO `syndication` VALUES (101222, 100554, 'WWW.ZOO-MUNICH.COM');
INSERT INTO `syndication` VALUES (101237, 100572, 'WWW.ZOO-MUNICH.COM');

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `sys_functions`
#

DROP TABLE IF EXISTS `sys_functions`;
CREATE TABLE `sys_functions` (
  `FUNCTION_ID` varchar(16) NOT NULL default '',
  `PARENT_ID` varchar(16) NOT NULL default '0',
  `NAME` varchar(32) NOT NULL default '',
  `DESCRIPTION` varchar(255) default NULL,
  PRIMARY KEY  (`FUNCTION_ID`)
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `sys_functions`
#

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
INSERT INTO `sys_functions` VALUES ('ED_FOLDER_PROPS', 'GENERAL', 'Edit Folder Properties', 'Allow edit folder üroperties');
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

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `temp_vars`
#

DROP TABLE IF EXISTS `temp_vars`;
CREATE TABLE `temp_vars` (
  `NAME` varchar(128) NOT NULL default '',
  `USER_ID` varchar(16) NOT NULL default '',
  `VALUE` varchar(255) default NULL,
  PRIMARY KEY  (`NAME`,`USER_ID`)
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `temp_vars`
#

INSERT INTO `temp_vars` VALUES ('menu', '1', '');
INSERT INTO `temp_vars` VALUES ('pnode', '1', '100000');
INSERT INTO `temp_vars` VALUES ('clt', '1', '100122');
INSERT INTO `temp_vars` VALUES ('clusterbrowser.phpview', '1', '1');
INSERT INTO `temp_vars` VALUES ('mid', '1', '100135');
INSERT INTO `temp_vars` VALUES ('sitepagebrowser.phpview', '1', '1');
INSERT INTO `temp_vars` VALUES ('calsel', '1', '100867');
INSERT INTO `temp_vars` VALUES ('sdateview', '1', 'predefined');
INSERT INTO `temp_vars` VALUES ('sitf', '1', 'today');
INSERT INTO `temp_vars` VALUES ('senddate', '1', '2004/12/23');
INSERT INTO `temp_vars` VALUES ('user_general.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` VALUES ('user_general.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` VALUES ('user_general.phpfilter_column', '1', 'USER_NAME');
INSERT INTO `temp_vars` VALUES ('categories.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` VALUES ('categories.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` VALUES ('categories.phpfilter_column', '1', 'NAME');
INSERT INTO `temp_vars` VALUES ('edit_template.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` VALUES ('chsel', '1', '100324');
INSERT INTO `temp_vars` VALUES ('edit.phpview', '1', '1');
INSERT INTO `temp_vars` VALUES ('translation.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` VALUES ('translation.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` VALUES ('_dir', '1', 'DESC');
INSERT INTO `temp_vars` VALUES ('statslimit', '1', '10');
INSERT INTO `temp_vars` VALUES ('sitepage_master.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` VALUES ('sitepage_master.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` VALUES ('install.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` VALUES ('install.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` VALUES ('group_general.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` VALUES ('group_general.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` VALUES ('user_permissions.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` VALUES ('user_permissions.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` VALUES ('channels.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` VALUES ('channels.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` VALUES ('edit_template.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` VALUES ('compound_groups.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` VALUES ('searchphrase', '1', '');
INSERT INTO `temp_vars` VALUES ('searchcolumn', '1', 'ca.TITLE');
INSERT INTO `temp_vars` VALUES ('searchlive', '1', '1');
INSERT INTO `temp_vars` VALUES ('installun.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` VALUES ('installun.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` VALUES ('compound_groups.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` VALUES ('compound_group_members.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` VALUES ('compound_group_members.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` VALUES ('translation', '1', '0');
INSERT INTO `temp_vars` VALUES ('role_general.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` VALUES ('role_general.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` VALUES ('role_permissions.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` VALUES ('role_permissions.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` VALUES ('_page', '1', '1');
INSERT INTO `temp_vars` VALUES ('object_edit.phpview', '1', '1');
INSERT INTO `temp_vars` VALUES ('variation', '1', '');
INSERT INTO `temp_vars` VALUES ('variations.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` VALUES ('variations.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` VALUES ('metascheme.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` VALUES ('metascheme.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` VALUES ('meta.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` VALUES ('meta.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` VALUES ('searchexpired', '1', '1');
INSERT INTO `temp_vars` VALUES ('searchmissing', '1', '1');
INSERT INTO `temp_vars` VALUES ('_order', '1', 'EDITED');
INSERT INTO `temp_vars` VALUES ('sstartdate', '1', '2004/12/08');
INSERT INTO `temp_vars` VALUES ('import.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` VALUES ('import.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` VALUES ('variation', '102908', '1');
INSERT INTO `temp_vars` VALUES ('mid', '102907', '0');
INSERT INTO `temp_vars` VALUES ('variation', '102907', '1');
INSERT INTO `temp_vars` VALUES ('_showall', '1', 'yes');
INSERT INTO `temp_vars` VALUES ('lastaction', '1', '0');
INSERT INTO `temp_vars` VALUES ('mid', '102908', '0');

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `user_permissions`
#

DROP TABLE IF EXISTS `user_permissions`;
CREATE TABLE `user_permissions` (
  `GROUP_ID` bigint(20) default NULL,
  `ROLE_ID` bigint(20) default NULL,
  `USER_ID` varchar(16) default NULL
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `user_permissions`
#

INSERT INTO `user_permissions` VALUES (1, 1, '1');
INSERT INTO `user_permissions` VALUES (1, 3, '102907');
INSERT INTO `user_permissions` VALUES (1, 2, '102908');

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `user_session`
#

DROP TABLE IF EXISTS `user_session`;
CREATE TABLE `user_session` (
  `USER_ID` varchar(16) NOT NULL default '',
  `LAST_LOGIN` timestamp NOT NULL,
  `SESSION_ID` varchar(32) default NULL,
  `REMOTE_ADDRESS` varchar(64) default NULL,
  PRIMARY KEY  (`USER_ID`)
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `user_session`
#

INSERT INTO `user_session` VALUES ('1', '2004-12-23 22:00:32', '210b386ca787cc394483bf91c8859c04', '127.0.0.1');
INSERT INTO `user_session` VALUES ('102907', '2004-12-22 20:59:21', NULL, NULL);
INSERT INTO `user_session` VALUES ('102908', '2004-12-22 21:00:44', NULL, NULL);

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `users`
#

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `USER_ID` bigint(20) NOT NULL default '0',
  `USER_NAME` varchar(16) NOT NULL default '',
  `FULL_NAME` varchar(64) NOT NULL default '',
  `PASSWORD` varchar(32) NOT NULL default '',
  `EMAIL` varchar(64) default NULL,
  `ACTIVE` int(1) NOT NULL default '0',
  `REGISTRATION_DATE` timestamp NOT NULL,
  `BACKEND_LANGUAGE` tinyint(3) NOT NULL default '1',
  `LANGID` char(3) NOT NULL default 'EN',
  `USE_JAVASCRIPT` tinyint(1) NOT NULL default '0',
  `USE_AGENT` char(1) NOT NULL default '1',
  PRIMARY KEY  (`USER_ID`)
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `users`
#

INSERT INTO `users` VALUES (1, 'Administrator', 'Administrator', '7b7bc2512ee1fedcd76bdc68926d4f7b', 'pleaseEnterM@il', 1, '2004-12-22 20:56:40', 1, 'EN', 0, '0');
INSERT INTO `users` VALUES (102907, 'editor', 'Editor', '5aee9dbd2a188839105073571bee1b1f', 'editors@mail', 1, '2004-12-22 20:59:21', 1, 'EN', 0, '0');
INSERT INTO `users` VALUES (102908, 'developer', 'Developer', '5e8edd851d2fdfbd7415232c67367cc3', 'developer@mail', 1, '2004-12-22 21:00:44', 1, 'EN', 0, '0');

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `var_log`
#

DROP TABLE IF EXISTS `var_log`;
CREATE TABLE `var_log` (
  `NAME` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`NAME`)
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `var_log`
#


# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `variations`
#

DROP TABLE IF EXISTS `variations`;
CREATE TABLE `variations` (
  `VARIATION_ID` bigint(20) NOT NULL default '0',
  `NAME` varchar(32) NOT NULL default '',
  `SHORTTEXT` varchar(5) NOT NULL default '',
  `DESCRIPTION` varchar(255) NOT NULL default '',
  `DELETED` tinyint(4) default '0',
  PRIMARY KEY  (`VARIATION_ID`),
  UNIQUE KEY `VARIATION_ID` (`VARIATION_ID`,`NAME`,`SHORTTEXT`)
) TYPE=MyISAM CHARSET=latin1;

#
# Daten für Tabelle `variations`
#

INSERT INTO `variations` VALUES (1, 'Standard', 'std', 'Standard Value, No Variation', 0);
INSERT INTO `variations` VALUES (101362, 'Deutsch', 'de', 'German language variation', 0);

ALTER TABLE `pgn_link` CHANGE `LABEL` `LABEL` VARCHAR( 255 ) NULL DEFAULT NULL;
Delete from internal_resources WHERE RESID="LATEST";
Delete from internal_resources WHERE RESID="OLDEST";
Delete from internal_resources WHERE RESID="LATEST_CREATED";
Delete from internal_resources WHERE RESID="OLDEST_CREATED";
Delete from internal_resources WHERE RESID="RANDOM";
ALTER TABLE `channel_articles` ADD `POSITION` BIGINT DEFAULT '0' NOT NULL AFTER `CLT_ID` ;

