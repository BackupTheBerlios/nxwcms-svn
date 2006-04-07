# phpMyAdmin SQL Dump
# version 2.5.5-rc1
# http://www.phpmyadmin.net
#
# Host: localhost
# Erstellungszeit: 05. Oktober 2004 um 10:08
# Server Version: 4.0.20
# PHP-Version: 5.0.0RC3
# 
# Datenbank: `nxclean`
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
) TYPE=MyISAM;

#
# Daten für Tabelle `acl_management`
#

INSERT INTO `acl_management` VALUES (1, 1, 0, 0, 0, 0, 1, NULL, NULL);

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
) TYPE=MyISAM;

#
# Daten für Tabelle `acl_relations`
#


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
) TYPE=MyISAM;

#
# Daten für Tabelle `categories`
#


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
) TYPE=MyISAM;

#
# Daten für Tabelle `centerstage`
#


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
) TYPE=MyISAM;

#
# Daten für Tabelle `channel_articles`
#


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
) TYPE=MyISAM;

#
# Daten für Tabelle `channel_categories`
#


# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `channel_cluster_templates`
#

DROP TABLE IF EXISTS `channel_cluster_templates`;
CREATE TABLE `channel_cluster_templates` (
  `CHID` bigint(20) NOT NULL default '0',
  `CLT_ID` bigint(20) NOT NULL default '0',
  `POSITION` bigint(20) NOT NULL default '0'
) TYPE=MyISAM;

#
# Daten für Tabelle `channel_cluster_templates`
#


# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `channels`
#

DROP TABLE IF EXISTS `channels`;
CREATE TABLE `channels` (
  `CHID` bigint(20) NOT NULL default '0',
  `NAME` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`CHID`)
) TYPE=MyISAM;

#
# Daten für Tabelle `channels`
#


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
) TYPE=MyISAM;

#
# Daten für Tabelle `cluster_content`
#


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
) TYPE=MyISAM;

#
# Daten für Tabelle `cluster_node`
#


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
) TYPE=MyISAM;

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
) TYPE=MyISAM;

#
# Daten für Tabelle `cluster_template_items`
#


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
) TYPE=MyISAM;

#
# Daten für Tabelle `cluster_templates`
#


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
) TYPE=MyISAM;

#
# Daten für Tabelle `cluster_variations`
#


# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `compound_group_members`
#

DROP TABLE IF EXISTS `compound_group_members`;
CREATE TABLE `compound_group_members` (
  `CGID` bigint(20) NOT NULL default '0',
  `CGMID` bigint(20) NOT NULL default '0',
  `POSITION` bigint(20) NOT NULL default '0'
) TYPE=MyISAM;

#
# Daten für Tabelle `compound_group_members`
#


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
) TYPE=MyISAM;

#
# Daten für Tabelle `compound_groups`
#


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
  `CREATED` timestamp(14) NOT NULL,
  `LAST_MOD_DATE` timestamp(14) NOT NULL default '00000000000000',
  `LAST_MODIFIER` varchar(32) default NULL,
  `DELETED` tinyint(4) NOT NULL default '0',
  `VERSION` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`CID`),
  UNIQUE KEY `CID` (`CID`),
  KEY `NAME` (`NAME`)
) TYPE=MyISAM;

#
# Daten für Tabelle `content`
#


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
) TYPE=MyISAM;

#
# Daten für Tabelle `content_variations`
#


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
) TYPE=MyISAM;

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
) TYPE=MyISAM AUTO_INCREMENT=1 ;

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
) TYPE=MyISAM AUTO_INCREMENT=1 ;

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
  `l_ts` timestamp(14) NOT NULL,
  `l_time` float NOT NULL default '0',
  PRIMARY KEY  (`l_id`),
  UNIQUE KEY `l_id` (`l_id`),
  KEY `l_includes` (`l_includes`),
  KEY `l_excludes` (`l_excludes`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

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
  `upddate` timestamp(14) NOT NULL,
  `username` varchar(32) default NULL,
  `password` varchar(32) default NULL,
  `port` smallint(6) default NULL,
  `locked` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`site_id`),
  UNIQUE KEY `site_id` (`site_id`),
  UNIQUE KEY `site_id_2` (`site_id`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

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
  `upddate` timestamp(14) NOT NULL,
  `md5` varchar(50) default NULL,
  `site_id` mediumint(9) NOT NULL default '0',
  `path` varchar(127) NOT NULL default '',
  `num_words` int(11) NOT NULL default '1',
  `last_modified` timestamp(14) NOT NULL default '00000000000000',
  `filesize` int(11) NOT NULL default '0',
  PRIMARY KEY  (`spider_id`),
  UNIQUE KEY `spider_id` (`spider_id`),
  UNIQUE KEY `spider_id_2` (`spider_id`),
  KEY `site_id` (`site_id`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

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
  `upddate` timestamp(14) NOT NULL,
  `error` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `id_2` (`id`),
  KEY `site_id` (`site_id`),
  KEY `site_id_2` (`site_id`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

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
) TYPE=MyISAM;

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
) TYPE=MyISAM;

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
INSERT INTO `internal_resources` VALUES ('HELP_ARTICLES', 'EN', 'The form displays articles.<br><br>The color codes are:<li>red: article not published<li>grey: article not translated<li>green: article published', '');
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
) TYPE=MyISAM;

#
# Daten für Tabelle `internal_resources_languages`
#

INSERT INTO `internal_resources_languages` VALUES ('EN', 'English', '0x0409', 'B8F2846E-CE36-11D0-AC83-00C04FD97575', '6,0,0,0');
INSERT INTO `internal_resources_languages` VALUES ('DE', 'Deutsch', '0x0407', '1D87F5B5-05F1-11d2-AD7C-0000F8799342', '1,0,0,0');
INSERT INTO `internal_resources_languages` VALUES ('IT', 'Italian', '0x0410', '1D87F5B6-05F1-11d2-AD7C-0000F8799342', '1,0,0,0');
INSERT INTO `internal_resources_languages` VALUES ('MND', 'Chineese (Mandarin)', '', '', '');
INSERT INTO `internal_resources_languages` VALUES ('PL', 'Polish2', '12', '32', '65');

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
  `LOG_TIME` timestamp(14) NOT NULL,
  KEY `LOG_TIME` (`LOG_TIME`),
  KEY `CATEGORY` (`CATEGORY`)
) TYPE=MyISAM;

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
) TYPE=MyISAM;

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
) TYPE=MyISAM;

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
) TYPE=MyISAM;

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
) TYPE=MyISAM;

#
# Daten für Tabelle `meta_template_items`
#


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
) TYPE=MyISAM;

#
# Daten für Tabelle `meta_templates`
#

INSERT INTO `meta_templates` VALUES (2, '-', NULL, 0, 0);

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
) TYPE=MyISAM;

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
) TYPE=MyISAM;

#
# Daten für Tabelle `modules`
#

INSERT INTO `modules` VALUES (100012, 'Image', 'Image. Allowed formats are GIF, JPEG and PNG.', 1, 100010, 'pgnImage', 'image/pgn_image.php', 1);
INSERT INTO `modules` VALUES (100018, 'Label', 'Text-Content with one line for input.', 1, 100016, 'pgnLabel', 'label/pgn_label.php', 1);
INSERT INTO `modules` VALUES (100024, 'Text', 'Text-Content with any length and format.', 2, 100022, 'pgnText', 'text/pgn_text.php', 1);
INSERT INTO `modules` VALUES (100288, 'Auth', 'Community Authentification', 1, 1, 'pgnAuth', 'auth/pgn_auth.php', 1);
INSERT INTO `modules` VALUES (100048, 'Link', 'Link to pages', 1, 100047, 'pgnLink', 'link/pgn_link.php', 1);
INSERT INTO `modules` VALUES (100009, 'TextImageCreator', 'Text-Content which creates graphical images.', 1, 100007, 'pgnTextImageCreator', 'textimagecreator/pgn_textimagecreator.php', 1);
INSERT INTO `modules` VALUES (100233, 'CDSTextImageCreator', 'Class-3-Plugin for extending the CDS with a function for painting text-images on the fly.', 1, 100232, 'pgnCDSTextImageCreator', 'cdstextimagecreator/pgn_cdstextimagecreator.php', 3);
INSERT INTO `modules` VALUES (100450, 'Media', 'Media Files. Allowed formats are GIF, JPEG, PNG and SWF (Flash Films).', 1, 100448, 'pgnMedia', 'media/pgn_media.php', 1);
INSERT INTO `modules` VALUES (100506, 'RSSReader', 'CDS-API-Extension for reading rss feeds', 1, 100505, 'pgnRSSReader', 'rssreader/pgn_rssreader.php', 3);
INSERT INTO `modules` VALUES (100510, 'RSSCreator', 'CDS-API-Extension for creating RSS-Feeds', 1, 100509, 'pgnRSSCreator', 'rsscreator/pgn_rsscreator.php', 3);
INSERT INTO `modules` VALUES (100663, 'CMS', 'CDS-API-Extension for creating, launching and editing Clusters.', 1, 100662, 'pgnCMS', 'cms/pgn_cms.php', 3);
INSERT INTO `modules` VALUES (100711, 'FAQ', 'CDS-API-Extension for realizing a FAQ', 1, 100710, 'pgnFAQ', 'faq/pgn_faq.php', 3);
INSERT INTO `modules` VALUES (100863, 'E-Mail Obfuscator', 'Filters email-addresses form texts and recodes them to avoid spidering', 1, 100862, 'pgnEmailobfuscator', 'emailobfuscator/pgn_emailobfuscator.php', 4);
INSERT INTO `modules` VALUES (100940, 'WetterCom', 'CDS-API-Extension for including weather forecast.', 1, 100939, 'pgnWetterCom', 'wettercom/pgn_wettercom.php', 3);

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `pgn_auth`
#

DROP TABLE IF EXISTS `pgn_auth`;
CREATE TABLE `pgn_auth` (
  `FKID` bigint(20) NOT NULL default '0',
  `GROUP_ID` bigint(20) NOT NULL default '0',
  PRIMARY KEY  (`FKID`)
) TYPE=MyISAM;

#
# Daten für Tabelle `pgn_auth`
#

INSERT INTO `pgn_auth` VALUES (100289, 0);
INSERT INTO `pgn_auth` VALUES (100296, 0);
INSERT INTO `pgn_auth` VALUES (100301, 0);
INSERT INTO `pgn_auth` VALUES (100305, 0);
INSERT INTO `pgn_auth` VALUES (100306, 0);
INSERT INTO `pgn_auth` VALUES (100307, 0);
INSERT INTO `pgn_auth` VALUES (100308, 0);
INSERT INTO `pgn_auth` VALUES (100309, 0);
INSERT INTO `pgn_auth` VALUES (100310, 0);
INSERT INTO `pgn_auth` VALUES (100311, 0);
INSERT INTO `pgn_auth` VALUES (100312, 0);
INSERT INTO `pgn_auth` VALUES (100313, 0);
INSERT INTO `pgn_auth` VALUES (100314, 0);
INSERT INTO `pgn_auth` VALUES (100315, 0);
INSERT INTO `pgn_auth` VALUES (100320, 0);
INSERT INTO `pgn_auth` VALUES (100321, 0);
INSERT INTO `pgn_auth` VALUES (100326, 100290);
INSERT INTO `pgn_auth` VALUES (100333, 100290);
INSERT INTO `pgn_auth` VALUES (100340, 100290);
INSERT INTO `pgn_auth` VALUES (100347, 100290);
INSERT INTO `pgn_auth` VALUES (100416, 0);
INSERT INTO `pgn_auth` VALUES (100432, 0);
INSERT INTO `pgn_auth` VALUES (100438, 0);
INSERT INTO `pgn_auth` VALUES (100455, 0);
INSERT INTO `pgn_auth` VALUES (100464, 0);
INSERT INTO `pgn_auth` VALUES (100470, 0);
INSERT INTO `pgn_auth` VALUES (100474, 0);
INSERT INTO `pgn_auth` VALUES (100482, 0);
INSERT INTO `pgn_auth` VALUES (100488, 0);
INSERT INTO `pgn_auth` VALUES (100497, 0);
INSERT INTO `pgn_auth` VALUES (100505, 0);
INSERT INTO `pgn_auth` VALUES (100510, 0);
INSERT INTO `pgn_auth` VALUES (100520, 0);
INSERT INTO `pgn_auth` VALUES (100526, 0);
INSERT INTO `pgn_auth` VALUES (100535, 0);
INSERT INTO `pgn_auth` VALUES (100541, 0);
INSERT INTO `pgn_auth` VALUES (100545, 100290);
INSERT INTO `pgn_auth` VALUES (100551, 100290);
INSERT INTO `pgn_auth` VALUES (100558, 100290);
INSERT INTO `pgn_auth` VALUES (100566, 100290);

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
) TYPE=MyISAM;

#
# Daten für Tabelle `pgn_config_store`
#

INSERT INTO `pgn_config_store` VALUES (100002, 'West', '#152B36', '#F4FEFD', 'Zrnic', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100111, 'NorthWest', '#152b36', '#f4fefd', 'Zrnic', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 24, 200, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100123, 'West', '#152b36', '#f4fefd', 'Zrnic', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100321, 'West', '#152b36', '#f4fefd', 'Zrnic', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100322, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100345, 'West', '#152b36', '#f4fefd', 'Zrnic', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100455, 'West', '#152b36', '#f4fefd', 'Zrnic', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100527, '400', '80', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100556, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100598, 'West', '#152b36', '#f4fefd', 'Zrnic', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100733, 'West', '#152b36', '#f4fefd', 'Zrnic', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, 400, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100714, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pgn_config_store` VALUES (100832, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
) TYPE=MyISAM;

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
INSERT INTO `pgn_image` VALUES (101405, '101405.', '', 0, 0, '');
INSERT INTO `pgn_image` VALUES (101414, '101414.jpg', 'Sven Weih', 152, 200, '');
INSERT INTO `pgn_image` VALUES (101419, '101419.', '', 0, 0, '');
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
INSERT INTO `pgn_image` VALUES (100198, '100198.jpg', '', 100, 75, '');
INSERT INTO `pgn_image` VALUES (100206, '100206.jpg', '', 100, 75, '');
INSERT INTO `pgn_image` VALUES (100534, '100534.jpg', '', 400, 80, '');
INSERT INTO `pgn_image` VALUES (100537, '100537.jpg', '', 400, 80, '');
INSERT INTO `pgn_image` VALUES (100543, '100543.jpg', '', 400, 80, '');
INSERT INTO `pgn_image` VALUES (100546, '100546.jpg', '', 400, 80, '');
INSERT INTO `pgn_image` VALUES (100796, '100796.gif', 'test', 209, 141, 'test');
INSERT INTO `pgn_image` VALUES (100800, '100800.png', '', 800, 600, '');
INSERT INTO `pgn_image` VALUES (100802, '100802.png', '', 800, 600, '');

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
) TYPE=MyISAM;

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
INSERT INTO `pgn_label` VALUES (100221, '');
INSERT INTO `pgn_label` VALUES (100222, 'Message');
INSERT INTO `pgn_label` VALUES (100223, 'Phone');
INSERT INTO `pgn_label` VALUES (100228, 'Can Opener');
INSERT INTO `pgn_label` VALUES (100235, 'Whire Whisk');
INSERT INTO `pgn_label` VALUES (100242, 'Scissors');
INSERT INTO `pgn_label` VALUES (100249, 'Professoren');
INSERT INTO `pgn_label` VALUES (100256, 'The team');
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
INSERT INTO `pgn_label` VALUES (100501, 'News Archive');
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
INSERT INTO `pgn_label` VALUES (101195, '1');
INSERT INTO `pgn_label` VALUES (101196, '3');
INSERT INTO `pgn_label` VALUES (101197, '2');
INSERT INTO `pgn_label` VALUES (101219, '');
INSERT INTO `pgn_label` VALUES (101206, '8');
INSERT INTO `pgn_label` VALUES (101200, '6');
INSERT INTO `pgn_label` VALUES (101220, '');
INSERT INTO `pgn_label` VALUES (101202, '5');
INSERT INTO `pgn_label` VALUES (101203, '4');
INSERT INTO `pgn_label` VALUES (101205, '7');
INSERT INTO `pgn_label` VALUES (101223, '');
INSERT INTO `pgn_label` VALUES (101224, '');
INSERT INTO `pgn_label` VALUES (101226, '');
INSERT INTO `pgn_label` VALUES (101227, '');
INSERT INTO `pgn_label` VALUES (101229, '23');
INSERT INTO `pgn_label` VALUES (101230, '2');
INSERT INTO `pgn_label` VALUES (101231, '154');
INSERT INTO `pgn_label` VALUES (101232, '56');
INSERT INTO `pgn_label` VALUES (101233, '45649999999999966');
INSERT INTO `pgn_label` VALUES (101234, 'ein schnuckeliger text also.');
INSERT INTO `pgn_label` VALUES (101235, 'test');
INSERT INTO `pgn_label` VALUES (101236, 'ein schöner Text, den wir hier eingeben, finden Sie nicht.');
INSERT INTO `pgn_label` VALUES (101237, '1234');
INSERT INTO `pgn_label` VALUES (101238, '123456789012345679812,456791,45679');
INSERT INTO `pgn_label` VALUES (101246, '');
INSERT INTO `pgn_label` VALUES (101248, 'So hätte ich es gerne, aber man kann nicht alles im Leben haben :-(');
INSERT INTO `pgn_label` VALUES (101249, '123456789');
INSERT INTO `pgn_label` VALUES (101298, 'Test Sven 2');
INSERT INTO `pgn_label` VALUES (101303, 'Test Sven 3');
INSERT INTO `pgn_label` VALUES (101332, 'Das ist der einfache Test :-)');
INSERT INTO `pgn_label` VALUES (101328, '');
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
INSERT INTO `pgn_label` VALUES (100263, 'Sven Weih');
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
INSERT INTO `pgn_label` VALUES (100015, 'Philosophy');
INSERT INTO `pgn_label` VALUES (100025, 'Philosophy');
INSERT INTO `pgn_label` VALUES (100033, 'N/X 4.0');
INSERT INTO `pgn_label` VALUES (100039, 'N/X 2002');
INSERT INTO `pgn_label` VALUES (100045, 'About us');
INSERT INTO `pgn_label` VALUES (100050, 'About us');
INSERT INTO `pgn_label` VALUES (100058, 'N/X 4.0');
INSERT INTO `pgn_label` VALUES (100063, 'N/X 2002');
INSERT INTO `pgn_label` VALUES (100118, 'TEST TEST TEST');
INSERT INTO `pgn_label` VALUES (100132, 'About us');
INSERT INTO `pgn_label` VALUES (100139, 'Services');
INSERT INTO `pgn_label` VALUES (100146, '');
INSERT INTO `pgn_label` VALUES (100153, '');
INSERT INTO `pgn_label` VALUES (100160, '');
INSERT INTO `pgn_label` VALUES (100165, 'About us');
INSERT INTO `pgn_label` VALUES (100185, 'About us');
INSERT INTO `pgn_label` VALUES (100194, 'About us');
INSERT INTO `pgn_label` VALUES (100202, 'TEST TEST TEST');
INSERT INTO `pgn_label` VALUES (100227, '');
INSERT INTO `pgn_label` VALUES (100215, 'Services');
INSERT INTO `pgn_label` VALUES (100244, 'For whom is N/X');
INSERT INTO `pgn_label` VALUES (100250, '');
INSERT INTO `pgn_label` VALUES (100331, 'N/X 4.0 BETA available');
INSERT INTO `pgn_label` VALUES (100269, 'Fabian König');
INSERT INTO `pgn_label` VALUES (100274, 'For whom is N/X');
INSERT INTO `pgn_label` VALUES (100281, 'The team');
INSERT INTO `pgn_label` VALUES (100287, 'Sven Weih');
INSERT INTO `pgn_label` VALUES (100294, 'Fabian König');
INSERT INTO `pgn_label` VALUES (100798, '');
INSERT INTO `pgn_label` VALUES (100343, 'N/X 4.0 BETA');
INSERT INTO `pgn_label` VALUES (100807, '');
INSERT INTO `pgn_label` VALUES (100362, 'N/X 4.0 BETA');
INSERT INTO `pgn_label` VALUES (100402, 'News');
INSERT INTO `pgn_label` VALUES (100463, 'Search engine');
INSERT INTO `pgn_label` VALUES (100470, 'Latest Forum Threads');
INSERT INTO `pgn_label` VALUES (100474, 'Site of the month');
INSERT INTO `pgn_label` VALUES (100484, 'Your search query returned no results.');
INSERT INTO `pgn_label` VALUES (100485, 'Search engine');
INSERT INTO `pgn_label` VALUES (100496, 'News');
INSERT INTO `pgn_label` VALUES (100577, 'Contact the N/X team!');
INSERT INTO `pgn_label` VALUES (100584, 'Phone');
INSERT INTO `pgn_label` VALUES (100585, 'Fax');
INSERT INTO `pgn_label` VALUES (100586, 'E-Mail');
INSERT INTO `pgn_label` VALUES (100587, 'Submit');
INSERT INTO `pgn_label` VALUES (100588, 'Reset');
INSERT INTO `pgn_label` VALUES (100589, 'Thank you for your message!');
INSERT INTO `pgn_label` VALUES (100590, 'Ooops! There is something wrong with your data.');
INSERT INTO `pgn_label` VALUES (100591, 'sven@nxsystems.org');
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
INSERT INTO `pgn_label` VALUES (100642, 'sven@nxsystems.org');
INSERT INTO `pgn_label` VALUES (100643, 'Message in Homepage');
INSERT INTO `pgn_label` VALUES (100644, 'Subject');
INSERT INTO `pgn_label` VALUES (100645, 'Your Message');
INSERT INTO `pgn_label` VALUES (100646, 'Your message to the N/X team!');
INSERT INTO `pgn_label` VALUES (100720, 'FAQ');
INSERT INTO `pgn_label` VALUES (100725, 'test 1');
INSERT INTO `pgn_label` VALUES (100730, 'test 2');
INSERT INTO `pgn_label` VALUES (100744, 'Ask a Question');
INSERT INTO `pgn_label` VALUES (100746, 'Your Question');
INSERT INTO `pgn_label` VALUES (100747, 'Send');
INSERT INTO `pgn_label` VALUES (100748, 'Reset');
INSERT INTO `pgn_label` VALUES (100750, 'We received your question:');
INSERT INTO `pgn_label` VALUES (100753, 'How can I determine the startpage of my website?');
INSERT INTO `pgn_label` VALUES (100757, 'How can I determine the startpage of my website?');
INSERT INTO `pgn_label` VALUES (100766, 'How can I determine the startpage of my website?');
INSERT INTO `pgn_label` VALUES (100772, 'FAQ');
INSERT INTO `pgn_label` VALUES (100787, 'Ask a Question');
INSERT INTO `pgn_label` VALUES (100789, 'Your Question');
INSERT INTO `pgn_label` VALUES (100790, 'Send');
INSERT INTO `pgn_label` VALUES (100791, 'Reset');
INSERT INTO `pgn_label` VALUES (100792, 'We received your question:');
INSERT INTO `pgn_label` VALUES (100813, '');
INSERT INTO `pgn_label` VALUES (100847, 'N/X 4.0 BETA');
INSERT INTO `pgn_label` VALUES (100867, 'About us');
INSERT INTO `pgn_label` VALUES (100875, 'For whom is N/X');
INSERT INTO `pgn_label` VALUES (100881, 'The team');
INSERT INTO `pgn_label` VALUES (100888, 'Sven Weih');
INSERT INTO `pgn_label` VALUES (100894, 'Fabian König');
INSERT INTO `pgn_label` VALUES (100900, 'News');
INSERT INTO `pgn_label` VALUES (100906, 'News Archive');

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
) TYPE=MyISAM;

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
INSERT INTO `pgn_link` VALUES (100121, 'more...', 0, '', 100129, '');
INSERT INTO `pgn_link` VALUES (100168, 'more...', 0, '', 100129, '');
INSERT INTO `pgn_link` VALUES (100199, 'more...', 0, '', 100176, '');
INSERT INTO `pgn_link` VALUES (100207, 'more...', 0, '', 100176, '');
INSERT INTO `pgn_link` VALUES (100524, '', 0, '', 100519, '');
INSERT INTO `pgn_link` VALUES (100535, '', 0, '', 100129, '');
INSERT INTO `pgn_link` VALUES (100538, '', 0, '', 100136, '');
INSERT INTO `pgn_link` VALUES (100544, '', 0, '', 100212, '');
INSERT INTO `pgn_link` VALUES (100547, '', 0, '', 100176, '');
INSERT INTO `pgn_link` VALUES (100658, '', 0, '', 100650, '');

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `pgn_media`
#

DROP TABLE IF EXISTS `pgn_media`;
CREATE TABLE `pgn_media` (
  `FKID` bigint(20) NOT NULL default '0',
  `FILENAME` varchar(32) default NULL,
  `WIDTH` smallint(6) default NULL,
  `HEIGHT` smallint(6) default NULL,
  `COPYRIGHT` varchar(64) default NULL,
  PRIMARY KEY  (`FKID`),
  UNIQUE KEY `FKID` (`FKID`)
) TYPE=MyISAM;

#
# Daten für Tabelle `pgn_media`
#

INSERT INTO `pgn_media` VALUES (100452, '100452.mp3', 0, 0, '');

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
) TYPE=MyISAM;

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
INSERT INTO `pgn_text` VALUES (100257, '<P>Who is who, in the world of N/X</P>');
INSERT INTO `pgn_text` VALUES (100264, 'learn more about Sven.');
INSERT INTO `pgn_text` VALUES (100270, 'learn more about Fabian.');
INSERT INTO `pgn_text` VALUES (100275, '<P>Learn more about who should use N/X.</P>');
INSERT INTO `pgn_text` VALUES (100282, '<P>Who is who, in the world of N/X</P>');
INSERT INTO `pgn_text` VALUES (100288, 'learn more about Sven.');
INSERT INTO `pgn_text` VALUES (100295, 'learn more about Fabian.');
INSERT INTO `pgn_text` VALUES (100307, '<P>All the legal stuff.</P>');
INSERT INTO `pgn_text` VALUES (100318, '<P>All the legal stuff.</P>');
INSERT INTO `pgn_text` VALUES (100332, '<P>You have been waiting long for N/X Revolution. Here it is!</P>');
INSERT INTO `pgn_text` VALUES (100333, 'N/X 4.0 BETA is launched today for public preview. There are allready a lot of pages running the beta version. However we would like you to consider, that Version 4.0 is still BETA!');
INSERT INTO `pgn_text` VALUES (100812, '');
INSERT INTO `pgn_text` VALUES (100848, 'N/X 4.0 BETA is launched today for public preview. There are allready a lot of pages running the beta version. However we would like you to consider, that Version 4.0 is still BETA!');
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
INSERT INTO `pgn_text` VALUES (100360, '<P>You have been waiting long for N/X Revolution. Here it is!</P>');
INSERT INTO `pgn_text` VALUES (100361, 'N/X 4.0 BETA is launched today for public preview. There are allready a lot of pages running the beta version. However we would like you to consider, that Version 4.0 is still BETA!');
INSERT INTO `pgn_text` VALUES (100578, '<P>&nbsp;</P>');
INSERT INTO `pgn_text` VALUES (100629, '<P>&nbsp;</P>');
INSERT INTO `pgn_text` VALUES (100721, '<P>Want to know something special? Try searching our FAQ-Database.</P>');
INSERT INTO `pgn_text` VALUES (100726, '<P>test 1 test 1 test 1 test 1<BR>we love testing... we love testing&nbsp; we love testing...we love testing... we love testing&nbsp; we love testing...we love testing... we love testing&nbsp; we love testing...we love testing... we love testing&nbsp; we love testing...we love testing... we love testing&nbsp; we love testing...we love testing... we love testing&nbsp; we love testing...we love testing... we love testing&nbsp; we love testing...</P>');
INSERT INTO `pgn_text` VALUES (100731, 'we love testing... we love testing&nbsp; we love testing...we love testing... we love testing&nbsp; we love testing...we love testing... we love testing&nbsp; we love testing...we love testing... we love testing&nbsp; we love testing...we love testing... we love testing&nbsp; we love testing...we love testing... we love testing&nbsp; we love testing...we love testing... we love testing&nbsp; we love testing...we love testing... we love testing&nbsp; we love testing...we love testing... we love testing&nbsp; we love testing...');
INSERT INTO `pgn_text` VALUES (100745, '<P>You did not find the answer to your questions? Ask a Question and we will try to reply in our FAQ-database soon!</P>');
INSERT INTO `pgn_text` VALUES (100754, '');
INSERT INTO `pgn_text` VALUES (100758, '<P>The startpage of your website is found with the&nbsp;$cds-&gt;menu-&gt;getStartPage() method. The method returns a new Menu-Interface of the startpage. This means you can work with it like $startpage-&gt;lowerLevel() for getting all its child-menues.</P>');
INSERT INTO `pgn_text` VALUES (100767, '<P>The startpage of your website is found with the&nbsp;$cds-&gt;menu-&gt;getStartPage() method. The method returns a new Menu-Interface of the startpage. This means you can work with it like $startpage-&gt;lowerLevel() for getting all its child-menues.</P>');
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
INSERT INTO `pgn_text` VALUES (101329, '');
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
INSERT INTO `pgn_text` VALUES (101541, '');
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
INSERT INTO `pgn_text` VALUES (100026, 'N/X will help you building your website quick and with high quality!');
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
INSERT INTO `pgn_text` VALUES (100016, 'N/X will help you building your website quick and with high quality!');
INSERT INTO `pgn_text` VALUES (100034, '<P>Read information about N/X 4.0</P>');
INSERT INTO `pgn_text` VALUES (100040, 'Get information about N/X 2002.');
INSERT INTO `pgn_text` VALUES (100046, 'Read information about the N/X Team.');
INSERT INTO `pgn_text` VALUES (100051, 'Read information about the N/X Team.');
INSERT INTO `pgn_text` VALUES (100059, '<P>Read information about N/X 4.0</P>');
INSERT INTO `pgn_text` VALUES (100064, 'Get information about N/X 2002.');
INSERT INTO `pgn_text` VALUES (100119, 'This is just for testing.This is just for testing.This is just for testing.This is just for testing.This is just for esting.This is just for testing.');
INSERT INTO `pgn_text` VALUES (100133, 'Learn more about the N/X WCMS Open Source Project on these pages.222');
INSERT INTO `pgn_text` VALUES (100140, '&nbsp;&nbsp;&nbsp;&nbsp;Learn more about our services!');
INSERT INTO `pgn_text` VALUES (100147, '');
INSERT INTO `pgn_text` VALUES (100154, '');
INSERT INTO `pgn_text` VALUES (100161, '');
INSERT INTO `pgn_text` VALUES (100166, 'What is the N/X WCMS Team? What are we doing? What are our goals?');
INSERT INTO `pgn_text` VALUES (100186, 'Learn more about the N/X WCMS Open Source Project on these pages.222');
INSERT INTO `pgn_text` VALUES (100195, 'What is the N/X WCMS Team? What are we doing? What are our goals?');
INSERT INTO `pgn_text` VALUES (100203, 'This is just for testing.This is just for testing.This is just for testing.This is just for testing.This is just for esting.This is just for testing.');
INSERT INTO `pgn_text` VALUES (100222, '');
INSERT INTO `pgn_text` VALUES (100228, '');
INSERT INTO `pgn_text` VALUES (100216, '&nbsp;&nbsp;&nbsp;&nbsp;Learn more about our services!');
INSERT INTO `pgn_text` VALUES (100239, '<P>A Who is Who in the world of N/X.</P>');
INSERT INTO `pgn_text` VALUES (100245, '<P>Learn more about who should use N/X.</P>');
INSERT INTO `pgn_text` VALUES (100251, '');
INSERT INTO `pgn_text` VALUES (100849, '<P>You have been waiting long for N/X Revolution. Here it is!</P>');
INSERT INTO `pgn_text` VALUES (100868, 'Learn more about the N/X WCMS Open Source Project on these pages.222');
INSERT INTO `pgn_text` VALUES (100876, '<P>Learn more about who should use N/X.</P>');
INSERT INTO `pgn_text` VALUES (100882, '<P>Who is who, in the world of N/X</P>');
INSERT INTO `pgn_text` VALUES (100889, 'learn more about Sven.');
INSERT INTO `pgn_text` VALUES (100895, 'learn more about Fabian.');

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
) TYPE=MyISAM DELAY_KEY_WRITE=1;

#
# Daten für Tabelle `pot_accesslog`
#


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
) TYPE=MyISAM DELAY_KEY_WRITE=1;

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
) TYPE=MyISAM DELAY_KEY_WRITE=1;

#
# Daten für Tabelle `pot_documents`
#


# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `pot_exit_targets`
#

DROP TABLE IF EXISTS `pot_exit_targets`;
CREATE TABLE `pot_exit_targets` (
  `data_id` int(11) NOT NULL default '0',
  `string` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`data_id`)
) TYPE=MyISAM DELAY_KEY_WRITE=1;

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
) TYPE=MyISAM DELAY_KEY_WRITE=1;

#
# Daten für Tabelle `pot_hostnames`
#


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
) TYPE=MyISAM DELAY_KEY_WRITE=1;

#
# Daten für Tabelle `pot_nxlog`
#


# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `pot_operating_systems`
#

DROP TABLE IF EXISTS `pot_operating_systems`;
CREATE TABLE `pot_operating_systems` (
  `data_id` int(11) NOT NULL default '0',
  `string` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`data_id`)
) TYPE=MyISAM DELAY_KEY_WRITE=1;

#
# Daten für Tabelle `pot_operating_systems`
#


# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `pot_referers`
#

DROP TABLE IF EXISTS `pot_referers`;
CREATE TABLE `pot_referers` (
  `data_id` int(11) NOT NULL default '0',
  `string` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`data_id`)
) TYPE=MyISAM DELAY_KEY_WRITE=1;

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
) TYPE=MyISAM DELAY_KEY_WRITE=1;

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
) TYPE=MyISAM DELAY_KEY_WRITE=1;

#
# Daten für Tabelle `pot_user_agents`
#


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
) TYPE=MyISAM DELAY_KEY_WRITE=1;

#
# Daten für Tabelle `pot_visitors`
#


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
) TYPE=MyISAM;

#
# Daten für Tabelle `registry`
#

INSERT INTO `registry` VALUES (100680, 'PLUGINS', '', 0);
INSERT INTO `registry` VALUES (100681, 'FAQ', '', 100680);
INSERT INTO `registry` VALUES (100682, 'CLT', '100712', 100681);

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `role_sys_functions`
#

DROP TABLE IF EXISTS `role_sys_functions`;
CREATE TABLE `role_sys_functions` (
  `ROLE_ID` bigint(20) NOT NULL default '0',
  `FUNCTION_ID` char(16) NOT NULL default '',
  KEY `ROLE_ID` (`ROLE_ID`,`FUNCTION_ID`)
) TYPE=MyISAM;

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
) TYPE=MyISAM;

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
) TYPE=MyISAM;

#
# Daten für Tabelle `sequences`
#


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
) TYPE=MyISAM;

#
# Daten für Tabelle `sessions`
#


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
  `DELETED` tinyint(4) NOT NULL default '0',
  `VERSION` tinyint(4) NOT NULL default '0',
  `IS_DISPLAYED` tinyint(1) NOT NULL default '1',
  `IS_CACHED` tinyint(1) NOT NULL default '1',
  `IS_LOCKED` tinyint(4) NOT NULL default '0',
  `CC_ON_LAUNCH` varchar(255) default NULL,
  PRIMARY KEY  (`MENU_ID`)
) TYPE=MyISAM;

#
# Daten für Tabelle `sitemap`
#


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
  `DELETED` tinyint(4) NOT NULL default '0',
  `VERSION` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`SPID`)
) TYPE=MyISAM;

#
# Daten für Tabelle `sitepage`
#


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
) TYPE=MyISAM;

#
# Daten für Tabelle `sitepage_master`
#


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
) TYPE=MyISAM;

#
# Daten für Tabelle `sitepage_names`
#


# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `sitepage_owner`
#

DROP TABLE IF EXISTS `sitepage_owner`;
CREATE TABLE `sitepage_owner` (
  `SPID` bigint(20) NOT NULL default '0',
  `GROUP_ID` bigint(20) NOT NULL default '0'
) TYPE=MyISAM;

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
) TYPE=MyISAM;

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
) TYPE=MyISAM;

#
# Daten für Tabelle `sitepage_variations`
#


# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `state_translation`
#

DROP TABLE IF EXISTS `state_translation`;
CREATE TABLE `state_translation` (
  `IN_ID` bigint(20) NOT NULL default '0',
  `OUT_ID` bigint(20) NOT NULL default '0',
  `LEVEL` tinyint(4) NOT NULL default '1',
  `MODIFIED` timestamp(14) NOT NULL,
  `EXPIRED` tinyint(4) NOT NULL default '0',
  KEY `IN_ID` (`IN_ID`)
) TYPE=MyISAM;

#
# Daten für Tabelle `state_translation`
#


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
) TYPE=MyISAM;

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
) TYPE=MyISAM;

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
) TYPE=MyISAM;

#
# Daten für Tabelle `temp_vars`
#

INSERT INTO `temp_vars` VALUES ('menu', '1', '');
INSERT INTO `temp_vars` VALUES ('pnode', '1', '0');
INSERT INTO `temp_vars` VALUES ('clt', '1', '100454');
INSERT INTO `temp_vars` VALUES ('clusterbrowser.phpview', '1', '1');
INSERT INTO `temp_vars` VALUES ('mid', '1', '0');
INSERT INTO `temp_vars` VALUES ('sitepagebrowser.phpview', '1', '1');
INSERT INTO `temp_vars` VALUES ('variation', '1', '1');
INSERT INTO `temp_vars` VALUES ('calsel', '1', '100867');
INSERT INTO `temp_vars` VALUES ('sdateview', '1', 'individual');
INSERT INTO `temp_vars` VALUES ('sitf', '1', 'previous_month');
INSERT INTO `temp_vars` VALUES ('sstartdate', '1', '2003-1-1');
INSERT INTO `temp_vars` VALUES ('senddate', '1', '2010-1-1');
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
INSERT INTO `temp_vars` VALUES ('_dir', '1', 'ASC');
INSERT INTO `temp_vars` VALUES ('_order', '1', 'NAME');
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
INSERT INTO `temp_vars` VALUES ('lastaction', '1', '0');
INSERT INTO `temp_vars` VALUES ('variations.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` VALUES ('variations.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` VALUES ('metascheme.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` VALUES ('metascheme.phpfilter_page', '1', '1');
INSERT INTO `temp_vars` VALUES ('meta.phpfilter_rule', '1', '');
INSERT INTO `temp_vars` VALUES ('meta.phpfilter_page', '1', '1');

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `user_permissions`
#

DROP TABLE IF EXISTS `user_permissions`;
CREATE TABLE `user_permissions` (
  `GROUP_ID` bigint(20) default NULL,
  `ROLE_ID` bigint(20) default NULL,
  `USER_ID` varchar(16) default NULL
) TYPE=MyISAM;

#
# Daten für Tabelle `user_permissions`
#

INSERT INTO `user_permissions` VALUES (1, 1, '1');

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `user_session`
#

DROP TABLE IF EXISTS `user_session`;
CREATE TABLE `user_session` (
  `USER_ID` varchar(16) NOT NULL default '',
  `LAST_LOGIN` timestamp(14) NOT NULL,
  `SESSION_ID` varchar(32) default NULL,
  `REMOTE_ADDRESS` varchar(64) default NULL,
  PRIMARY KEY  (`USER_ID`)
) TYPE=MyISAM;

#
# Daten für Tabelle `user_session`
#

INSERT INTO `user_session` VALUES ('1', 20041005100822, '0ebb631c3491b74be96a74d67635ed50', '192.168.2.2');

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
  `REGISTRATION_DATE` timestamp(14) NOT NULL,
  `BACKEND_LANGUAGE` tinyint(3) NOT NULL default '1',
  `LANGID` char(3) NOT NULL default 'EN',
  `USE_JAVASCRIPT` tinyint(1) NOT NULL default '0',
  `USE_AGENT` char(1) NOT NULL default '1',
  PRIMARY KEY  (`USER_ID`)
) TYPE=MyISAM;

#
# Daten für Tabelle `users`
#

INSERT INTO `users` VALUES (1, 'Administrator', 'Administrator', '7b7bc2512ee1fedcd76bdc68926d4f7b', 'pleaseEnterM@il', 1, 20040512175908, 1, 'EN', 0, '0');

# --------------------------------------------------------

#
# Tabellenstruktur für Tabelle `var_log`
#

DROP TABLE IF EXISTS `var_log`;
CREATE TABLE `var_log` (
  `NAME` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`NAME`)
) TYPE=MyISAM;

#
# Daten für Tabelle `var_log`
#

INSERT INTO `var_log` VALUES ('acl_owner1');
INSERT INTO `var_log` VALUES ('acl_owner100001');
INSERT INTO `var_log` VALUES ('acl_owner100002');
INSERT INTO `var_log` VALUES ('acl_owner100065');
INSERT INTO `var_log` VALUES ('acl_owner100480');
INSERT INTO `var_log` VALUES ('acstate');
INSERT INTO `var_log` VALUES ('action');
INSERT INTO `var_log` VALUES ('ADD_SITEPAGE');
INSERT INTO `var_log` VALUES ('ADD_SP_MASTER');
INSERT INTO `var_log` VALUES ('ADMINISTRATION_M');
INSERT INTO `var_log` VALUES ('allChecked');
INSERT INTO `var_log` VALUES ('ALLOW_CMS_LOGIN');
INSERT INTO `var_log` VALUES ('article');
INSERT INTO `var_log` VALUES ('back');
INSERT INTO `var_log` VALUES ('B_CL_EDIT_ALL');
INSERT INTO `var_log` VALUES ('B_CL_USAGE');
INSERT INTO `var_log` VALUES ('B_DESTROY_TREE');
INSERT INTO `var_log` VALUES ('B_EDIT_ALL');
INSERT INTO `var_log` VALUES ('B_EXPIRE_LAUNCH');
INSERT INTO `var_log` VALUES ('B_LIVE_AUTHORING');
INSERT INTO `var_log` VALUES ('B_PREVIEW_PAGE');
INSERT INTO `var_log` VALUES ('B_RELAUNCH_INST');
INSERT INTO `var_log` VALUES ('B_RELAUNCH_TREE');
INSERT INTO `var_log` VALUES ('B_USAGE');
INSERT INTO `var_log` VALUES ('CALENDAR');
INSERT INTO `var_log` VALUES ('CALENDAR_EDIT');
INSERT INTO `var_log` VALUES ('callback');
INSERT INTO `var_log` VALUES ('calsel');
INSERT INTO `var_log` VALUES ('categories_CATEGORY_NAME');
INSERT INTO `var_log` VALUES ('categories_PARENT_CATEGORY_ID');
INSERT INTO `var_log` VALUES ('centerstage_CHID');
INSERT INTO `var_log` VALUES ('centerstage_CHID100219');
INSERT INTO `var_log` VALUES ('centerstage_CHID100231');
INSERT INTO `var_log` VALUES ('centerstage_CHID100251');
INSERT INTO `var_log` VALUES ('centerstage_CHID100388');
INSERT INTO `var_log` VALUES ('centerstage_CHID100394');
INSERT INTO `var_log` VALUES ('centerstage_CHID100397');
INSERT INTO `var_log` VALUES ('centerstage_CHID100522');
INSERT INTO `var_log` VALUES ('centerstage_CHID113725');
INSERT INTO `var_log` VALUES ('centerstage_CHID113726');
INSERT INTO `var_log` VALUES ('centerstage_CHID113727');
INSERT INTO `var_log` VALUES ('centerstage_CHID113728');
INSERT INTO `var_log` VALUES ('centerstage_CHID113729');
INSERT INTO `var_log` VALUES ('centerstage_CHID113730');
INSERT INTO `var_log` VALUES ('centerstage_CHID113732');
INSERT INTO `var_log` VALUES ('centerstage_CHID113816');
INSERT INTO `var_log` VALUES ('centerstage_CHID113817');
INSERT INTO `var_log` VALUES ('centerstage_CHID113818');
INSERT INTO `var_log` VALUES ('centerstage_CHID113819');
INSERT INTO `var_log` VALUES ('centerstage_MAXCARD100219');
INSERT INTO `var_log` VALUES ('centerstage_MAXCARD100231');
INSERT INTO `var_log` VALUES ('centerstage_MAXCARD100251');
INSERT INTO `var_log` VALUES ('centerstage_MAXCARD100388');
INSERT INTO `var_log` VALUES ('centerstage_MAXCARD100394');
INSERT INTO `var_log` VALUES ('centerstage_MAXCARD100397');
INSERT INTO `var_log` VALUES ('centerstage_MAXCARD100522');
INSERT INTO `var_log` VALUES ('centerstage_MAXCARD113725');
INSERT INTO `var_log` VALUES ('centerstage_MAXCARD113726');
INSERT INTO `var_log` VALUES ('centerstage_MAXCARD113727');
INSERT INTO `var_log` VALUES ('centerstage_MAXCARD113728');
INSERT INTO `var_log` VALUES ('centerstage_MAXCARD113729');
INSERT INTO `var_log` VALUES ('centerstage_MAXCARD113730');
INSERT INTO `var_log` VALUES ('centerstage_MAXCARD113732');
INSERT INTO `var_log` VALUES ('centerstage_MAXCARD113816');
INSERT INTO `var_log` VALUES ('centerstage_MAXCARD113817');
INSERT INTO `var_log` VALUES ('centerstage_MAXCARD113818');
INSERT INTO `var_log` VALUES ('centerstage_MAXCARD113819');
INSERT INTO `var_log` VALUES ('centerstage_SORT_ALGORITHM100219');
INSERT INTO `var_log` VALUES ('centerstage_SORT_ALGORITHM100231');
INSERT INTO `var_log` VALUES ('centerstage_SORT_ALGORITHM100251');
INSERT INTO `var_log` VALUES ('centerstage_SORT_ALGORITHM100388');
INSERT INTO `var_log` VALUES ('centerstage_SORT_ALGORITHM100394');
INSERT INTO `var_log` VALUES ('centerstage_SORT_ALGORITHM100397');
INSERT INTO `var_log` VALUES ('centerstage_SORT_ALGORITHM100522');
INSERT INTO `var_log` VALUES ('centerstage_SORT_ALGORITHM113725');
INSERT INTO `var_log` VALUES ('centerstage_SORT_ALGORITHM113726');
INSERT INTO `var_log` VALUES ('centerstage_SORT_ALGORITHM113727');
INSERT INTO `var_log` VALUES ('centerstage_SORT_ALGORITHM113728');
INSERT INTO `var_log` VALUES ('centerstage_SORT_ALGORITHM113729');
INSERT INTO `var_log` VALUES ('centerstage_SORT_ALGORITHM113730');
INSERT INTO `var_log` VALUES ('centerstage_SORT_ALGORITHM113732');
INSERT INTO `var_log` VALUES ('centerstage_SORT_ALGORITHM113816');
INSERT INTO `var_log` VALUES ('centerstage_SORT_ALGORITHM113817');
INSERT INTO `var_log` VALUES ('centerstage_SORT_ALGORITHM113818');
INSERT INTO `var_log` VALUES ('centerstage_SORT_ALGORITHM113819');
INSERT INTO `var_log` VALUES ('changedate');
INSERT INTO `var_log` VALUES ('changetop');
INSERT INTO `var_log` VALUES ('changetranslation');
INSERT INTO `var_log` VALUES ('changevariation');
INSERT INTO `var_log` VALUES ('channels_CLT_ID');
INSERT INTO `var_log` VALUES ('channels_NAME');
INSERT INTO `var_log` VALUES ('channel_articles_ARTICLE_DATE_ti');
INSERT INTO `var_log` VALUES ('channel_articles_CH_CAT_ID');
INSERT INTO `var_log` VALUES ('channel_articles_CLT_ID');
INSERT INTO `var_log` VALUES ('channel_articles_EXPIRE_DATE');
INSERT INTO `var_log` VALUES ('channel_articles_EXPIRE_DATE_tim');
INSERT INTO `var_log` VALUES ('channel_articles_LAUNCH_DATE');
INSERT INTO `var_log` VALUES ('channel_articles_LAUNCH_DATE_tim');
INSERT INTO `var_log` VALUES ('channel_articles_NAME');
INSERT INTO `var_log` VALUES ('channel_articles_TITLE');
INSERT INTO `var_log` VALUES ('channel_categories_NAME');
INSERT INTO `var_log` VALUES ('channel_cluster_templates');
INSERT INTO `var_log` VALUES ('channel_cluster_templatessel');
INSERT INTO `var_log` VALUES ('channel_cluster_templatesselecti');
INSERT INTO `var_log` VALUES ('checkednow');
INSERT INTO `var_log` VALUES ('chsel');
INSERT INTO `var_log` VALUES ('CIDRES');
INSERT INTO `var_log` VALUES ('clearsearch');
INSERT INTO `var_log` VALUES ('CLEAR_CACHE');
INSERT INTO `var_log` VALUES ('clt');
INSERT INTO `var_log` VALUES ('clti');
INSERT INTO `var_log` VALUES ('cltid');
INSERT INTO `var_log` VALUES ('cluster');
INSERT INTO `var_log` VALUES ('cluster_content_FKID100012');
INSERT INTO `var_log` VALUES ('cluster_content_FKID100018');
INSERT INTO `var_log` VALUES ('cluster_content_FKID100025');
INSERT INTO `var_log` VALUES ('cluster_content_FKID100030');
INSERT INTO `var_log` VALUES ('cluster_content_FKID100044');
INSERT INTO `var_log` VALUES ('cluster_content_FKID100045');
INSERT INTO `var_log` VALUES ('cluster_content_FKID100087');
INSERT INTO `var_log` VALUES ('cluster_content_FKID100099');
INSERT INTO `var_log` VALUES ('cluster_content_FKID100120');
INSERT INTO `var_log` VALUES ('cluster_content_FKID100134');
INSERT INTO `var_log` VALUES ('cluster_content_FKID100141');
INSERT INTO `var_log` VALUES ('cluster_content_FKID100167');
INSERT INTO `var_log` VALUES ('cluster_content_FKID100169');
INSERT INTO `var_log` VALUES ('cluster_content_FKID100243');
INSERT INTO `var_log` VALUES ('cluster_content_FKID100258');
INSERT INTO `var_log` VALUES ('cluster_content_FKID101193');
INSERT INTO `var_log` VALUES ('cluster_content_FKID101210');
INSERT INTO `var_log` VALUES ('cluster_content_FKID101228');
INSERT INTO `var_log` VALUES ('cluster_content_FKID101239');
INSERT INTO `var_log` VALUES ('cluster_content_FKID101240');
INSERT INTO `var_log` VALUES ('cluster_content_FKID101241');
INSERT INTO `var_log` VALUES ('cluster_content_FKID101242');
INSERT INTO `var_log` VALUES ('cluster_content_FKID101243');
INSERT INTO `var_log` VALUES ('cluster_content_FKID101244');
INSERT INTO `var_log` VALUES ('cluster_content_FKID101245');
INSERT INTO `var_log` VALUES ('cluster_content_FKID101247');
INSERT INTO `var_log` VALUES ('cluster_content_FKID101258');
INSERT INTO `var_log` VALUES ('cluster_content_FKID101259');
INSERT INTO `var_log` VALUES ('cluster_content_FKID101260');
INSERT INTO `var_log` VALUES ('cluster_content_FKID101261');
INSERT INTO `var_log` VALUES ('cluster_content_FKID101263');
INSERT INTO `var_log` VALUES ('cluster_content_FKID101265');
INSERT INTO `var_log` VALUES ('cluster_content_FKID101274');
INSERT INTO `var_log` VALUES ('cluster_content_FKID101276');
INSERT INTO `var_log` VALUES ('cluster_content_FKID101279');
INSERT INTO `var_log` VALUES ('cluster_content_FKID101281');
INSERT INTO `var_log` VALUES ('cluster_content_FKID101282');
INSERT INTO `var_log` VALUES ('cluster_content_FKID101283');
INSERT INTO `var_log` VALUES ('cluster_content_FKID101318');
INSERT INTO `var_log` VALUES ('cluster_content_FKID101319');
INSERT INTO `var_log` VALUES ('cluster_content_FKID101320');
INSERT INTO `var_log` VALUES ('cluster_content_FKID101325');
INSERT INTO `var_log` VALUES ('cluster_content_FKID101326');
INSERT INTO `var_log` VALUES ('cluster_content_FKID101327');
INSERT INTO `var_log` VALUES ('cluster_content_FKID101330');
INSERT INTO `var_log` VALUES ('cluster_content_FKID101331');
INSERT INTO `var_log` VALUES ('cluster_content_FKID101333');
INSERT INTO `var_log` VALUES ('cluster_content_FKID101334');
INSERT INTO `var_log` VALUES ('cluster_content_FKID101335');
INSERT INTO `var_log` VALUES ('cluster_content_FKID101336');
INSERT INTO `var_log` VALUES ('cluster_content_FKID101337');
INSERT INTO `var_log` VALUES ('cluster_content_FKID101491');
INSERT INTO `var_log` VALUES ('cluster_content_FKID101492');
INSERT INTO `var_log` VALUES ('cluster_content_FKID101514');
INSERT INTO `var_log` VALUES ('cluster_content_FKID101658');
INSERT INTO `var_log` VALUES ('cluster_content_FKID101663');
INSERT INTO `var_log` VALUES ('cluster_content_FKID101704');
INSERT INTO `var_log` VALUES ('cluster_content_FKID102357');
INSERT INTO `var_log` VALUES ('cluster_content_FKID113716');
INSERT INTO `var_log` VALUES ('cluster_content_FKID113717');
INSERT INTO `var_log` VALUES ('cluster_content_FKID113718');
INSERT INTO `var_log` VALUES ('cluster_content_FKID113721');
INSERT INTO `var_log` VALUES ('cluster_content_FKID113722');
INSERT INTO `var_log` VALUES ('cluster_content_FKID113724');
INSERT INTO `var_log` VALUES ('cluster_content_FKID113802');
INSERT INTO `var_log` VALUES ('cluster_content_FKID113810');
INSERT INTO `var_log` VALUES ('cluster_name');
INSERT INTO `var_log` VALUES ('cluster_node_NAME');
INSERT INTO `var_log` VALUES ('cluster_node_NAME100129');
INSERT INTO `var_log` VALUES ('cluster_node_NAME100134');
INSERT INTO `var_log` VALUES ('cluster_node_NAME100141');
INSERT INTO `var_log` VALUES ('cluster_node_NAME100169');
INSERT INTO `var_log` VALUES ('cluster_node_NAME100241');
INSERT INTO `var_log` VALUES ('cluster_node_NAME100253');
INSERT INTO `var_log` VALUES ('cluster_node_NAME100258');
INSERT INTO `var_log` VALUES ('cluster_node_NAME100260');
INSERT INTO `var_log` VALUES ('cluster_node_NAME100266');
INSERT INTO `var_log` VALUES ('cluster_node_NAME100384');
INSERT INTO `var_log` VALUES ('cluster_node_NAME100390');
INSERT INTO `var_log` VALUES ('cluster_templates_CATEGORY_ID');
INSERT INTO `var_log` VALUES ('cluster_templates_CLT_TYPE_ID');
INSERT INTO `var_log` VALUES ('cluster_templates_DESCRIPTION');
INSERT INTO `var_log` VALUES ('cluster_templates_MT_ID');
INSERT INTO `var_log` VALUES ('cluster_templates_NAME');
INSERT INTO `var_log` VALUES ('cluster_templates_TEMPLATE');
INSERT INTO `var_log` VALUES ('cluster_template_items_FKID');
INSERT INTO `var_log` VALUES ('cluster_template_items_MAXCARD');
INSERT INTO `var_log` VALUES ('cluster_template_items_MINCARD');
INSERT INTO `var_log` VALUES ('cluster_template_items_NAME');
INSERT INTO `var_log` VALUES ('cluster_template_items_POSITION');
INSERT INTO `var_log` VALUES ('cluster_variations_VARIATION_ID_');
INSERT INTO `var_log` VALUES ('CL_BROWSER');
INSERT INTO `var_log` VALUES ('CL_PROPS');
INSERT INTO `var_log` VALUES ('CL_TEMP_BROWSER');
INSERT INTO `var_log` VALUES ('CL_USAGE');
INSERT INTO `var_log` VALUES ('commit');
INSERT INTO `var_log` VALUES ('COMMUNITY_LOGIN');
INSERT INTO `var_log` VALUES ('compound_groups_DESCRIPTION');
INSERT INTO `var_log` VALUES ('compound_groups_NAME');
INSERT INTO `var_log` VALUES ('compound_groups_SORTMODE');
INSERT INTO `var_log` VALUES ('compound_group_members');
INSERT INTO `var_log` VALUES ('compound_group_memberssel');
INSERT INTO `var_log` VALUES ('compound_group_membersselection');
INSERT INTO `var_log` VALUES ('configdata');
INSERT INTO `var_log` VALUES ('content');
INSERT INTO `var_log` VALUES ('content_DESCRIPTION');
INSERT INTO `var_log` VALUES ('content_KEYWORDS');
INSERT INTO `var_log` VALUES ('content_MODULE_ID');
INSERT INTO `var_log` VALUES ('content_MT_ID');
INSERT INTO `var_log` VALUES ('content_NAME');
INSERT INTO `var_log` VALUES ('content_variations_VARIATION_ID_');
INSERT INTO `var_log` VALUES ('copyname');
INSERT INTO `var_log` VALUES ('create');
INSERT INTO `var_log` VALUES ('createpage');
INSERT INTO `var_log` VALUES ('creating');
INSERT INTO `var_log` VALUES ('C_ACTIVE');
INSERT INTO `var_log` VALUES ('C_CACHE');
INSERT INTO `var_log` VALUES ('d');
INSERT INTO `var_log` VALUES ('dateview');
INSERT INTO `var_log` VALUES ('decision');
INSERT INTO `var_log` VALUES ('del');
INSERT INTO `var_log` VALUES ('delete');
INSERT INTO `var_log` VALUES ('deleteobject');
INSERT INTO `var_log` VALUES ('DELETE_CL');
INSERT INTO `var_log` VALUES ('DELETE_CL_TEMP');
INSERT INTO `var_log` VALUES ('DELETE_FOLDER');
INSERT INTO `var_log` VALUES ('DELETE_OBJECT');
INSERT INTO `var_log` VALUES ('DELETE_SITEPAGE');
INSERT INTO `var_log` VALUES ('DELETE_SP_MASTER');
INSERT INTO `var_log` VALUES ('deletion');
INSERT INTO `var_log` VALUES ('demotest');
INSERT INTO `var_log` VALUES ('destination_');
INSERT INTO `var_log` VALUES ('destroycluster');
INSERT INTO `var_log` VALUES ('destroypages');
INSERT INTO `var_log` VALUES ('diagram');
INSERT INTO `var_log` VALUES ('did');
INSERT INTO `var_log` VALUES ('dir');
INSERT INTO `var_log` VALUES ('DIRECT_URL');
INSERT INTO `var_log` VALUES ('editing');
INSERT INTO `var_log` VALUES ('EDIT_CL_CONTENT');
INSERT INTO `var_log` VALUES ('EDIT_CL_TEMP');
INSERT INTO `var_log` VALUES ('EDIT_CONTENT');
INSERT INTO `var_log` VALUES ('EDIT_META_DATA');
INSERT INTO `var_log` VALUES ('EDIT_OBJECT');
INSERT INTO `var_log` VALUES ('ED_CL_TEMP_PROPS');
INSERT INTO `var_log` VALUES ('ED_FOLDER_PROPS');
INSERT INTO `var_log` VALUES ('eid');
INSERT INTO `var_log` VALUES ('expired');
INSERT INTO `var_log` VALUES ('EXPLORE_SITE_M');
INSERT INTO `var_log` VALUES ('EXPLORE_SITE_S');
INSERT INTO `var_log` VALUES ('exp_description');
INSERT INTO `var_log` VALUES ('filename');
INSERT INTO `var_log` VALUES ('filenameselect');
INSERT INTO `var_log` VALUES ('filter');
INSERT INTO `var_log` VALUES ('filter_column');
INSERT INTO `var_log` VALUES ('filter_rule');
INSERT INTO `var_log` VALUES ('folder');
INSERT INTO `var_log` VALUES ('folders');
INSERT INTO `var_log` VALUES ('gallery');
INSERT INTO `var_log` VALUES ('generate');
INSERT INTO `var_log` VALUES ('go');
INSERT INTO `var_log` VALUES ('goon');
INSERT INTO `var_log` VALUES ('groups_DESCRIPTION');
INSERT INTO `var_log` VALUES ('groups_GROUP_NAME');
INSERT INTO `var_log` VALUES ('guid');
INSERT INTO `var_log` VALUES ('height');
INSERT INTO `var_log` VALUES ('htxt_100148');
INSERT INTO `var_log` VALUES ('id');
INSERT INTO `var_log` VALUES ('internal_resources_languages_AGE');
INSERT INTO `var_log` VALUES ('internal_resources_languages_LAN');
INSERT INTO `var_log` VALUES ('internal_resources_languages_NAM');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPACL_AC');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPACL_GR');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPACL_IN');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPACL_OW');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPACL_PA');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPACL_RO');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPACL_TI');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPACTIVE');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPADDITI');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPADD_LI');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPAFTER');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPAGENT_');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPALC_OW');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPALL');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPARTICL');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPAR_EXP');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPAR_LAU');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPAUTHOR');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPAUTH_G');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPAVAIL_');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPAVERAG');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPAVG_CL');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPAVG_VI');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPBACK');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPBACKUP');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPBACK_I');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPBACK_S');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPBACK_T');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPBAK_FI');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPBEGIN');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPBG_COL');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPBY');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCACHED');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCALEND');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCAL_BT');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCAL_ED');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCAL_NA');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCANCEL');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCATEGO');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCAT_NA');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCHANNE');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCHOOSE');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCH_ADM');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCH_ART');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCH_CAT');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCLASS_');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCLEAR');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCLEAR_');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCLI');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCLI_DE');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCLI_ED');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCLI_NO');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCLK_PA');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCLLINK');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCLT');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCLTI_D');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCLTPOS');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCLT_BR');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCLT_DE');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCLT_EX');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCLT_MA');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCLT_MI');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCLT_NA');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCLT_NE');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCLT_PR');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCLT_SC');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCLT_SE');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCLUSTE');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCL_BRO');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCL_CRE');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCL_DEL');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCL_EDI');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCL_EXP');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCL_LAU');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCL_NAM');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCL_NEW');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCL_NOT');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCL_PRO');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCL_SEL');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCMPTYP');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCOLOR');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCOMB_A');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCOMB_N');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCOMMEN');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCOMMIT');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCONFIG');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCONFIR');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCONTAI');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCONTEN');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCOPY_C');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCOUNT');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCPG_ME');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCP_GRO');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCREATE');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPCR_CON');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPDATE');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPDELETE');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPDEL_AR');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPDEL_FO');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPDESC');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPDESCRI');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPDESTRO');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPDISABL');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPDISPLA');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPDOSOME');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPDOWN');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPDWEXT_');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPEDIT');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPEDITED');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPEDIT_A');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPEDIT_C');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPEDIT_F');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPEDIT_S');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPEDIT_T');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPED_CLT');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPED_CON');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPED_CPG');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPED_DIS');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPED_MET');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPED_PRO');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPEMPTY');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPENDATE');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPENDTIM');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPENVIRO');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPERROR');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPERROR_');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPEXEC_E');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPEXPIRE');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPEXPLOR');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPEXPL_E');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPEXPL_S');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPEXPORT');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPEXP_RE');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPFILTER');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPFIND_O');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPFOLDER');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPFONT');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPFONTSI');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPFULL_N');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPGO');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPGOTO_C');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPGROUP_');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPGR_TEX');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPHEIGHT');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPHELP');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPHELP_A');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPHELP_B');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPHELP_C');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPHELP_D');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPHELP_M');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPHELP_O');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPHELP_P');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPHELP_R');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPHELP_S');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPHELP_V');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPHIDE');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPHOUR');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPHOURS_');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPIMPORT');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPINDIV_');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPIND_TI');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPINSNAM');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPINSTAN');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPIN_CHA');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPIS_COM');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPIS_FIL');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPI_AFTE');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPKEEP_C');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPKEYWOR');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPLASTMO');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPLASTWE');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPLASTYE');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPLAST_L');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPLAST_M');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPLATEST');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPLAUNCH');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPLEAVE_');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPLIBRAR');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPLINKED');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPLIVE_A');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPLOCATI');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPLOCK_M');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPLOGFIL');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPLOGGED');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPLOGIN_');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPLOGS');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPLOGS_I');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPLONGES');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPMANDAT');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPMAXIMU');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPMEDIAN');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPMENU');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPMESSAG');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPMETATE');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPMH_GET');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPMH_GLO');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPMINIMU');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPMT_ADD');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPMT_BAS');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPMT_DEL');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPMT_DW_');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPMT_GEN');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPMT_LWS');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPMT_LW_');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPMT_MOD');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPMT_PRO');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPMT_SCH');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPMT_SPI');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPMT_SYN');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPMT_TIT');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPMULTIP');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPM_ACCE');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPM_ADMI');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPM_BACK');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPM_BROW');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPM_CHAN');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPM_CLB');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPM_CLT');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPM_CLTB');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPM_CLUS');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPM_COMB');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPM_ES');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPM_EXPO');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPM_HELP');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPM_HOME');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPM_IMPO');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPM_INST');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPM_LIB');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPM_LOGO');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPM_MAIN');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPM_META');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPM_MYPR');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPM_PGN');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPM_PRTM');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPM_PTEM');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPM_PURG');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPM_REPO');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPM_ROLL');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPM_SPM');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPM_TEMP');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPM_TRAN');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPM_UMAN');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPM_VAR');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPM_WWW');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPNAME');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPNEW');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPNEW_AR');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPNEW_CO');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPNEW_FO');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPNEXT');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPNO');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPNODE_A');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPNOSPTI');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPNOTCON');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPNOTNUM');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPNOT_SE');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPNOT_SP');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPNO_CLU');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPNO_CON');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPNO_OBJ');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPNO_VAR');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPNUMBER');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPNUM_OF');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPOBJLAU');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPOK');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPOLDEST');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPORDER');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPORDERA');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPORDERC');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPOTHERS');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPOVERVI');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPO_ALT');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPO_BROW');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPO_COPY');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPO_DEL');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPO_DELM');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPO_EDIT');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPO_NAME');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPO_NEW');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPO_PREV');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPO_PROP');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPO_TEXT');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPPAGE');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPPAGES');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPPAGE_T');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPPASSWO');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPPATH');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPPATHS');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPPERCEN');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPPGNTXT');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPPG_ALR');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPPG_CHO');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPPG_ERR');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPPG_FIL');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPPG_INS');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPPG_NEW');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPPG_TIT');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPPG_UNI');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPPG_UPG');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPPI');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPPI_OVE');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPPOSITI');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPPOS_IN');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPPO_BRO');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPPO_CRS');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPPO_EDI');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPPO_MYP');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPPO_OWN');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPPREDEF');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPPREVIE');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPPREV_A');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPPRINT');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPPROCER');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPPROMPT');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPPROPER');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPPTEMPL');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPPURGE');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPPURGE_');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPPWDNOT');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPPWDTOO');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPRANDOM');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPRANK');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPRATERE');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPRB_CAC');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPREADY_');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPREFERE');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPREMAIN');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPRESET');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPRESET_');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPRET_VI');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPRL_PER');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPROLE_D');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPROLE_F');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPROLE_G');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPROLE_H');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPROLE_L');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPROLE_N');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPROLE_P');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPR_DELE');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPR_DELF');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPR_EDIT');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPR_FOLD');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPR_HOME');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPR_MOVE');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPR_NEWF');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPR_PARE');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSAVE');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSAVEER');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSAVESU');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSAVE_B');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSEARCH');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSEASRC');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSELECT');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSELMUL');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSEL_AR');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSEL_CH');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSEL_CL');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSEL_EV');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSEL_FI');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSEL_ME');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSEL_PT');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSEL_VA');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSET');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSHORTE');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSHOW');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSHOW_A');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSHOW_P');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSMA_EX');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSPM');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSPM_CL');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSPM_ED');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSPM_LA');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSPM_ME');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSPM_PA');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSPM_RL');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSPM_SE');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSPM_TH');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSPM_TY');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSPM_VA');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSP_BRO');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSP_CLN');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSP_CON');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSP_DEL');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSP_EDI');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSP_EXP');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSP_IPR');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSP_LAU');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSP_LIN');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSP_MEN');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSP_NEW');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSP_PDE');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSP_PRE');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSP_PRO');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSP_RLT');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSR_SEL');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSTARTD');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSTARTT');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSTART_');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSTATS');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSTATS_');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSTATUS');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSTEP');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSTNAME');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPSYNC_C');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPTEMPLA');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPTESTS');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPTEXT_A');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPTEXT_C');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPTEXT_S');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPTF');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPTHISMO');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPTHISWE');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPTHISYE');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPTIME_B');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPTIPP_T');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPTITLE');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPTMPL_N');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPTODAY');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPTOP');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPTOP_BR');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPTOP_EN');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPTOP_EX');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPTOP_HO');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPTOP_OS');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPTOP_PA');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPTOP_RE');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPTOP_SI');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPTOP_SK');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPTOTAL');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPTRANSL');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPTRANS_');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPTT_REF');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPTT_RST');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPTYPE');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPUNIQUE');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPUP');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPUPL_TE');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPUP_INT');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPUSAGE');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPUSERPE');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPUSER_A');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPUSER_B');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPUSER_E');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPUSER_F');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPUSER_G');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPUSER_H');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPUSER_J');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPUSER_L');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPUSER_N');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPUSER_P');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPUSER_S');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPUSER_T');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPVARIAT');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPVAR_SU');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPVISITO');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPVISITS');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPVIS_FI');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPVIS_ON');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPVIS_PE');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPVIS_RE');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPV_EDIT');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPV_NAME');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPV_SHOR');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPWEBSIT');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPWEEKDA');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPWHEN');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPWIDTH');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPWRONGD');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPWZE_AR');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPWZE_EX');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPWZE_IM');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPWZT_AR');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPWZT_DE');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPWZT_EX');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPWZT_IM');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPWZT_KE');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPWZT_SE');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPWZ_ART');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPWZ_EXP');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPWZ_IMP');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPYES');
INSERT INTO `var_log` VALUES ('internal_resources_TOOLTIPYESTER');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEACL_ACCE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEACL_GROU');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEACL_INFO');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEACL_INHE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEACL_OWNE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEACL_PARE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEACL_ROLE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEACL_TITL');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEACTIVE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEACTIVE_V');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEADDITION');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEADD_LINK');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEAFTER');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEAGENT_CA');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEAGENT_EX');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEAGENT_GO');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEAGENT_LO');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEAGENT_NX');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEAGENT_WE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEALC_OWNE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEALL');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEARTICLES');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEARTICLE_');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEAR_EXPIR');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEAR_LAUNC');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEAUTHOR');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEAUTH_GRO');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEAVAIL_IT');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEAVAIL_VA');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEAVERAGE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEAVG_CLIC');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEAVG_VISI');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEAVG_VIS_');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEBACK');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEBACKUP');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEBACK_INF');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEBACK_SP');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEBACK_TO_');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEBAK_FILE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEBEGIN');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEBG_COLOR');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEBY');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECACHED');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECALENDAR');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECAL_BTO');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECAL_EDIT');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECAL_NAME');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECANCEL');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECATEGORY');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECAT_NAME');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECHANNEL');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECHANNELS');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECHANNEL_');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECHOOSEFI');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECH_ADMIN');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECH_ARTIC');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECH_CAT');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECH_CAT2');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECLASS_WR');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECLEAR');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECLEAR_ME');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECLI');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECLI_DELE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECLI_EDIT');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECLI_NOTD');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECLK_PATH');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECLLINK');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECLT');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECLTI_DEL');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECLTPOSIT');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECLT_BROW');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECLT_DELE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECLT_DELM');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECLT_EXCL');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECLT_MAXC');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECLT_MINC');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECLT_NAME');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECLT_NEW');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECLT_PROP');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECLT_SCHE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECLT_SELE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECLUSTER');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECLUSTER_');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECL_BROWS');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECL_CREAT');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECL_DEL');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECL_DELME');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECL_EDIT');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECL_EXPIR');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECL_LAUNC');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECL_NAME');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECL_NEW');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECL_NOTIT');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECL_PROPE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECL_SELEC');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECMPTYPE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECOLOR');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECOMB_ALL');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECOMB_NON');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECOMMENT');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECOMMIT');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECONFIG');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECONFIGUR');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECONFIRM_');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECONTAINE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECONTENT');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECONTENTI');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECONTENTT');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECONTENT_');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECOPY_CLU');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECOUNT');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECPG_MEMB');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECP_GROUP');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECREATE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECREATED');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECREATED_');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECREATENE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECREATE_A');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECREATE_I');
INSERT INTO `var_log` VALUES ('internal_resources_VALUECR_CONTE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEDATE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEDELETE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEDELETESU');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEDELETE_P');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEDEL_ARTI');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEDEL_FOLD');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEDESC');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEDESCRIPT');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEDESTROY_');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEDISABLE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEDISPLAY');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEDOSOMETH');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEDOWN');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEDWEXT_CO');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEEDIT');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEEDITED');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEEDIT_ACC');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEEDIT_ALL');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEEDIT_ART');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEEDIT_CON');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEEDIT_FOL');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEEDIT_SPM');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEEDIT_TEM');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEED_CLT');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEED_CONTE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEED_CPGRO');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEED_DISPA');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEED_META');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEED_PROPE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEEMPTY');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEENDATE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEENDTIME');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEENVIRONM');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEERROR');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEERROR_SE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEEXEC_EXP');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEEXPIRE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEEXPLORE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEEXPL_EXE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEEXPL_SEL');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEEXPORT_D');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEEXP_REPO');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEFILTER_C');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEFILTER_R');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEFIND_OBJ');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEFOLDER');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEFOLDER_D');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEFONT');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEFONTSIZE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEFULL_NAM');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEGO');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEGOTO_CL');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEGROUP_DE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEGROUP_FI');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEGROUP_HE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEGROUP_LI');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEGROUP_NA');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEGR_TEXT');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEHEIGHT');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEHELP');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEHELP_ACC');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEHELP_ART');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEHELP_BAC');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEHELP_CHA');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEHELP_CLB');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEHELP_CLT');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEHELP_COM');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEHELP_DW');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEHELP_MET');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEHELP_OBJ');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEHELP_PAG');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEHELP_PGN');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEHELP_PUR');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEHELP_ROL');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEHELP_SP');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEHELP_SYN');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEHELP_VAR');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEHIDE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEHOUR');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEHOURS_AS');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEIMPORT_D');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEINDIV_CO');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEIND_TIME');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEINSNAME');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEINSTANCE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEIN_CHANN');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEIS_COMPO');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEIS_FILTE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEI_AFTER');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEKEEP_CLU');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEKEYWORDS');
INSERT INTO `var_log` VALUES ('internal_resources_VALUELASTMONT');
INSERT INTO `var_log` VALUES ('internal_resources_VALUELASTWEEK');
INSERT INTO `var_log` VALUES ('internal_resources_VALUELASTYEAR');
INSERT INTO `var_log` VALUES ('internal_resources_VALUELAST_LAU');
INSERT INTO `var_log` VALUES ('internal_resources_VALUELAST_MOD');
INSERT INTO `var_log` VALUES ('internal_resources_VALUELATEST');
INSERT INTO `var_log` VALUES ('internal_resources_VALUELATEST_C');
INSERT INTO `var_log` VALUES ('internal_resources_VALUELAUNCH');
INSERT INTO `var_log` VALUES ('internal_resources_VALUELEAVE_EM');
INSERT INTO `var_log` VALUES ('internal_resources_VALUELIBRARY');
INSERT INTO `var_log` VALUES ('internal_resources_VALUELINKED');
INSERT INTO `var_log` VALUES ('internal_resources_VALUELIVE_AUT');
INSERT INTO `var_log` VALUES ('internal_resources_VALUELOCATION');
INSERT INTO `var_log` VALUES ('internal_resources_VALUELOCK_MEN');
INSERT INTO `var_log` VALUES ('internal_resources_VALUELOGFILE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUELOGGED_A');
INSERT INTO `var_log` VALUES ('internal_resources_VALUELOGIN_FA');
INSERT INTO `var_log` VALUES ('internal_resources_VALUELOGS');
INSERT INTO `var_log` VALUES ('internal_resources_VALUELOGS_INF');
INSERT INTO `var_log` VALUES ('internal_resources_VALUELONGEST_');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEMANDATOR');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEMAXIMUM');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEMAXIMUMA');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEMEDIAN');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEMENU');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEMESSAGE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEMETATEMP');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEMH_GETST');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEMH_GLOSS');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEMINIMUM');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEMINIMUMA');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEMT_ADDIT');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEMT_BASE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEMT_DELET');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEMT_DW_CO');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEMT_GENER');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEMT_LWS_M');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEMT_LW_SI');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEMT_MODUL');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEMT_PROPE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEMT_SCHEM');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEMT_SPIDE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEMT_SYNC_');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEMT_TITLE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEMULTIPAG');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEM_ACCESS');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEM_ADMIN');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEM_BACKUP');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEM_BROWSE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEM_CHANNE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEM_CLB');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEM_CLT');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEM_CLTB');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEM_CLUSTE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEM_COMBOB');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEM_ES');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEM_EXPORT');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEM_HELP');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEM_HOME');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEM_IMPORT');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEM_INSTAL');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEM_LIB');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEM_LOGOUT');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEM_MAINTE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEM_META');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEM_MYPROF');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEM_MYPRT');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEM_PGN');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEM_PRTMAN');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEM_PTEMP');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEM_PURGE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEM_REPORT');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEM_ROLLOU');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEM_SPM');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEM_TEMP');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEM_TRANSL');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEM_UMAN');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEM_VAR');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEM_WWW');
INSERT INTO `var_log` VALUES ('internal_resources_VALUENAME');
INSERT INTO `var_log` VALUES ('internal_resources_VALUENEW');
INSERT INTO `var_log` VALUES ('internal_resources_VALUENEW_ARTI');
INSERT INTO `var_log` VALUES ('internal_resources_VALUENEW_CONT');
INSERT INTO `var_log` VALUES ('internal_resources_VALUENEW_FOLD');
INSERT INTO `var_log` VALUES ('internal_resources_VALUENEXT');
INSERT INTO `var_log` VALUES ('internal_resources_VALUENO');
INSERT INTO `var_log` VALUES ('internal_resources_VALUENODE_ACC');
INSERT INTO `var_log` VALUES ('internal_resources_VALUENOSPTITL');
INSERT INTO `var_log` VALUES ('internal_resources_VALUENOTCONFI');
INSERT INTO `var_log` VALUES ('internal_resources_VALUENOTNUMBE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUENOT_SELE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUENOT_SPEC');
INSERT INTO `var_log` VALUES ('internal_resources_VALUENO_CLUST');
INSERT INTO `var_log` VALUES ('internal_resources_VALUENO_CONTE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUENO_OBJ');
INSERT INTO `var_log` VALUES ('internal_resources_VALUENO_VARIA');
INSERT INTO `var_log` VALUES ('internal_resources_VALUENUMBER');
INSERT INTO `var_log` VALUES ('internal_resources_VALUENUMBER_O');
INSERT INTO `var_log` VALUES ('internal_resources_VALUENUM_OF_A');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEOBJLAUNC');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEOK');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEOLDEST');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEOLDEST_C');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEORDER');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEORDERART');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEORDERCOM');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEOTHERS');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEOVERVIEW');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEO_ALT');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEO_BROWSE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEO_COPYRI');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEO_DEL');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEO_DELMES');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEO_EDIT');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEO_NAME');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEO_NEW');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEO_PREVIE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEO_PROPER');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEO_TEXT');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEPAGE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEPAGES');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEPAGE_TEM');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEPASSWORD');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEPATH');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEPATHS');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEPERCENT');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEPGNTXT_S');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEPG_ALREA');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEPG_CHOOS');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEPG_ERROR');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEPG_FILEW');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEPG_INSTA');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEPG_NEWER');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEPG_TITLE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEPG_UNINS');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEPG_UPGRA');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEPI');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEPI_OVERV');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEPOSITION');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEPOS_IN_M');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEPO_BROWS');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEPO_CRSUC');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEPO_EDIT');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEPO_MYPOR');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEPO_OWNER');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEPREDEF_T');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEPREVIEW');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEPREV_AVA');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEPRINT');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEPROCERRO');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEPROMPTDE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEPROPERTI');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEPTEMPL');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEPURGE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEPURGE_CL');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEPURGE_CO');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEPURGE_EX');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEPURGE_FO');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEPURGE_ME');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEPURGE_PA');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEPURGE_VA');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEPWDNOTMA');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEPWDTOOSH');
INSERT INTO `var_log` VALUES ('internal_resources_VALUERANDOM');
INSERT INTO `var_log` VALUES ('internal_resources_VALUERANK');
INSERT INTO `var_log` VALUES ('internal_resources_VALUERATERES');
INSERT INTO `var_log` VALUES ('internal_resources_VALUERB_CACHE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEREADY_TO');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEREFERER');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEREMAIN_P');
INSERT INTO `var_log` VALUES ('internal_resources_VALUERESET');
INSERT INTO `var_log` VALUES ('internal_resources_VALUERESET_FO');
INSERT INTO `var_log` VALUES ('internal_resources_VALUERESET_LO');
INSERT INTO `var_log` VALUES ('internal_resources_VALUERET_VIS');
INSERT INTO `var_log` VALUES ('internal_resources_VALUERL_PERM');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEROLE_DES');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEROLE_FIL');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEROLE_GEN');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEROLE_HEA');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEROLE_LIN');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEROLE_NAM');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEROLE_PER');
INSERT INTO `var_log` VALUES ('internal_resources_VALUER_DELETE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUER_DELFOL');
INSERT INTO `var_log` VALUES ('internal_resources_VALUER_EDITFO');
INSERT INTO `var_log` VALUES ('internal_resources_VALUER_FOLDER');
INSERT INTO `var_log` VALUES ('internal_resources_VALUER_HOME');
INSERT INTO `var_log` VALUES ('internal_resources_VALUER_MOVEOB');
INSERT INTO `var_log` VALUES ('internal_resources_VALUER_NEWFOL');
INSERT INTO `var_log` VALUES ('internal_resources_VALUER_PARENT');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESAVE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESAVEERRO');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESAVESUCC');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESAVE_BAC');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESEARCH');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESEARCHIN');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESEARCHRE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESEARCH_C');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESEARCH_E');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESEARCH_L');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESEASRCH_');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESELECT');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESELECTED');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESELECTOB');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESELECTON');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESELECT_C');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESELECT_V');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESELMULTI');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESEL_ARTI');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESEL_CH');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESEL_CHAN');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESEL_CLUS');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESEL_EVEN');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESEL_FILE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESEL_MEM');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESEL_PTML');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESEL_VAR');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESET');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESHORTEST');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESHOW');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESHOW_ADV');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESHOW_ALL');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESHOW_PAG');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESMA_EXT_');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESPM');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESPM_CLUS');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESPM_EDIT');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESPM_LAUC');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESPM_META');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESPM_PATH');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESPM_RLAU');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESPM_SELE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESPM_THUM');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESPM_TYPE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESPM_VARI');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESP_BROWS');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESP_CLNEW');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESP_CONFD');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESP_CONFI');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESP_DELET');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESP_DELME');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESP_EDIT');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESP_EXPIR');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESP_IPROP');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESP_LAUNC');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESP_LINK');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESP_MENUD');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESP_MENUH');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESP_MENUN');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESP_MENUP');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESP_NEWIN');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESP_NEWPA');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESP_PDELE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESP_PDELM');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESP_PREVI');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESP_PROPE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESP_RLTRE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESR_SELEC');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESTARTDAT');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESTARTTIM');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESTART_BA');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESTATS');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESTATS_HE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESTATUS');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESTEP');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESTNAME');
INSERT INTO `var_log` VALUES ('internal_resources_VALUESYNC_CLU');
INSERT INTO `var_log` VALUES ('internal_resources_VALUETEMPLATE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUETESTS');
INSERT INTO `var_log` VALUES ('internal_resources_VALUETEXT_ALI');
INSERT INTO `var_log` VALUES ('internal_resources_VALUETEXT_COL');
INSERT INTO `var_log` VALUES ('internal_resources_VALUETEXT_STY');
INSERT INTO `var_log` VALUES ('internal_resources_VALUETF');
INSERT INTO `var_log` VALUES ('internal_resources_VALUETHISMONT');
INSERT INTO `var_log` VALUES ('internal_resources_VALUETHISWEEK');
INSERT INTO `var_log` VALUES ('internal_resources_VALUETHISYEAR');
INSERT INTO `var_log` VALUES ('internal_resources_VALUETIME_BET');
INSERT INTO `var_log` VALUES ('internal_resources_VALUETIPP_TEM');
INSERT INTO `var_log` VALUES ('internal_resources_VALUETITLE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUETMPL_NAM');
INSERT INTO `var_log` VALUES ('internal_resources_VALUETODAY');
INSERT INTO `var_log` VALUES ('internal_resources_VALUETOP');
INSERT INTO `var_log` VALUES ('internal_resources_VALUETOP_BROW');
INSERT INTO `var_log` VALUES ('internal_resources_VALUETOP_ENTR');
INSERT INTO `var_log` VALUES ('internal_resources_VALUETOP_EXIT');
INSERT INTO `var_log` VALUES ('internal_resources_VALUETOP_HOST');
INSERT INTO `var_log` VALUES ('internal_resources_VALUETOP_OS');
INSERT INTO `var_log` VALUES ('internal_resources_VALUETOP_PAGE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUETOP_PATH');
INSERT INTO `var_log` VALUES ('internal_resources_VALUETOP_REFE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUETOP_SI');
INSERT INTO `var_log` VALUES ('internal_resources_VALUETOP_SKW');
INSERT INTO `var_log` VALUES ('internal_resources_VALUETOTAL');
INSERT INTO `var_log` VALUES ('internal_resources_VALUETRANSLAT');
INSERT INTO `var_log` VALUES ('internal_resources_VALUETRANS_TE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUETRANS_TH');
INSERT INTO `var_log` VALUES ('internal_resources_VALUETT_REFRE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUETT_RSTCI');
INSERT INTO `var_log` VALUES ('internal_resources_VALUETYPE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEUNIQUE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEUP');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEUPL_TEXT');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEUP_INTRO');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEUSAGE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEUSERPERM');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEUSER_ACT');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEUSER_AGE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEUSER_BL');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEUSER_EMA');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEUSER_FIL');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEUSER_GEN');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEUSER_HEA');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEUSER_JS');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEUSER_LIN');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEUSER_NAM');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEUSER_PER');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEUSER_PRO');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEUSER_SET');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEUSER_TO_');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEVARIATIO');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEVAR_SUCC');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEVISITORS');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEVISITS');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEVISITS_O');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEVIS_FIRS');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEVIS_ONL');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEVIS_PER_');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEVIS_RET');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEV_EDIT');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEV_NAME');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEV_SHORT');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEWEBSITE');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEWEEKDAY');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEWEEKDAY_');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEWHEN');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEWIDTH');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEWRONGDAT');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEWZE_ARTI');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEWZE_EXPO');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEWZE_IMPO');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEWZT_ARTI');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEWZT_DESC');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEWZT_EXPO');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEWZT_IMPO');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEWZT_KEEP');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEWZT_SEL_');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEWZ_ARTIC');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEWZ_EXPOR');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEWZ_IMPOR');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEYES');
INSERT INTO `var_log` VALUES ('internal_resources_VALUEYESTERDA');
INSERT INTO `var_log` VALUES ('itf');
INSERT INTO `var_log` VALUES ('jump');
INSERT INTO `var_log` VALUES ('keep_cluster');
INSERT INTO `var_log` VALUES ('label');
INSERT INTO `var_log` VALUES ('laction');
INSERT INTO `var_log` VALUES ('launchchannels');
INSERT INTO `var_log` VALUES ('limit');
INSERT INTO `var_log` VALUES ('linkset');
INSERT INTO `var_log` VALUES ('login');
INSERT INTO `var_log` VALUES ('MAINTENANCE');
INSERT INTO `var_log` VALUES ('MENU');
INSERT INTO `var_log` VALUES ('meta');
INSERT INTO `var_log` VALUES ('META_TEMP');
INSERT INTO `var_log` VALUES ('meta_templates_DESCRIPTION');
INSERT INTO `var_log` VALUES ('meta_templates_NAME');
INSERT INTO `var_log` VALUES ('meta_template_items_NAME');
INSERT INTO `var_log` VALUES ('meta_template_items_POSITION');
INSERT INTO `var_log` VALUES ('meta_VALUE100149');
INSERT INTO `var_log` VALUES ('meta_VALUE100150');
INSERT INTO `var_log` VALUES ('meta_VALUE100157');
INSERT INTO `var_log` VALUES ('meta_VALUE100158');
INSERT INTO `var_log` VALUES ('meta_VALUE100185');
INSERT INTO `var_log` VALUES ('meta_VALUE100186');
INSERT INTO `var_log` VALUES ('meta_VALUE100195');
INSERT INTO `var_log` VALUES ('meta_VALUE100196');
INSERT INTO `var_log` VALUES ('meta_VALUE100205');
INSERT INTO `var_log` VALUES ('meta_VALUE100206');
INSERT INTO `var_log` VALUES ('meta_VALUE101672');
INSERT INTO `var_log` VALUES ('meta_VALUE101673');
INSERT INTO `var_log` VALUES ('meta_VALUE101675');
INSERT INTO `var_log` VALUES ('meta_VALUE101676');
INSERT INTO `var_log` VALUES ('meta_VALUE101707');
INSERT INTO `var_log` VALUES ('meta_VALUE101708');
INSERT INTO `var_log` VALUES ('meta_VALUE102360');
INSERT INTO `var_log` VALUES ('meta_VALUE102361');
INSERT INTO `var_log` VALUES ('meta_VALUE113805');
INSERT INTO `var_log` VALUES ('meta_VALUE113806');
INSERT INTO `var_log` VALUES ('meta_VALUE113813');
INSERT INTO `var_log` VALUES ('meta_VALUE113814');
INSERT INTO `var_log` VALUES ('mid');
INSERT INTO `var_log` VALUES ('MY_PORTALS');
INSERT INTO `var_log` VALUES ('MY_PROFILE');
INSERT INTO `var_log` VALUES ('neu');
INSERT INTO `var_log` VALUES ('newitem');
INSERT INTO `var_log` VALUES ('NEW_CL_TEMP');
INSERT INTO `var_log` VALUES ('NEW_FOLDER');
INSERT INTO `var_log` VALUES ('NEW_OBJECT');
INSERT INTO `var_log` VALUES ('notselvals');
INSERT INTO `var_log` VALUES ('number_of_instances');
INSERT INTO `var_log` VALUES ('number_of_instances100042');
INSERT INTO `var_log` VALUES ('number_of_instances100055');
INSERT INTO `var_log` VALUES ('number_of_instances100067');
INSERT INTO `var_log` VALUES ('number_of_instances100068');
INSERT INTO `var_log` VALUES ('number_of_instances100069');
INSERT INTO `var_log` VALUES ('number_of_instances100070');
INSERT INTO `var_log` VALUES ('number_of_instances100126');
INSERT INTO `var_log` VALUES ('number_of_instances100171');
INSERT INTO `var_log` VALUES ('number_of_instances100207');
INSERT INTO `var_log` VALUES ('number_of_instances101178');
INSERT INTO `var_log` VALUES ('number_of_instances101192');
INSERT INTO `var_log` VALUES ('number_of_instances101194');
INSERT INTO `var_log` VALUES ('number_of_instances101262');
INSERT INTO `var_log` VALUES ('number_of_instances101275');
INSERT INTO `var_log` VALUES ('number_of_instances102368');
INSERT INTO `var_log` VALUES ('number_of_instances113815');
INSERT INTO `var_log` VALUES ('OBJECT_BROWSER');
INSERT INTO `var_log` VALUES ('OBJECT_PROPS');
INSERT INTO `var_log` VALUES ('OBJ_USAGE');
INSERT INTO `var_log` VALUES ('oid');
INSERT INTO `var_log` VALUES ('order');
INSERT INTO `var_log` VALUES ('OVERALL_RESULT');
INSERT INTO `var_log` VALUES ('page');
INSERT INTO `var_log` VALUES ('passwd');
INSERT INTO `var_log` VALUES ('pattern');
INSERT INTO `var_log` VALUES ('pdo');
INSERT INTO `var_log` VALUES ('PGFK');
INSERT INTO `var_log` VALUES ('PGFKpgn_cal_appointmentLINK');
INSERT INTO `var_log` VALUES ('pgn_auth_GROUP_ID100279');
INSERT INTO `var_log` VALUES ('pgn_auth_GROUP_ID100289');
INSERT INTO `var_log` VALUES ('pgn_auth_GROUP_ID100296');
INSERT INTO `var_log` VALUES ('pgn_auth_GROUP_ID100301');
INSERT INTO `var_log` VALUES ('pgn_auth_GROUP_ID100326');
INSERT INTO `var_log` VALUES ('pgn_auth_GROUP_ID100333');
INSERT INTO `var_log` VALUES ('pgn_auth_GROUP_ID100340');
INSERT INTO `var_log` VALUES ('pgn_auth_GROUP_ID100347');
INSERT INTO `var_log` VALUES ('pgn_cal_appointment_CATID');
INSERT INTO `var_log` VALUES ('pgn_cal_appointment_DESCRIPTION');
INSERT INTO `var_log` VALUES ('pgn_cal_appointment_ENDDATE');
INSERT INTO `var_log` VALUES ('pgn_cal_appointment_ENDTIME');
INSERT INTO `var_log` VALUES ('pgn_cal_appointment_IMAGE');
INSERT INTO `var_log` VALUES ('pgn_cal_appointment_STARTDATE');
INSERT INTO `var_log` VALUES ('pgn_cal_appointment_STARTTIME');
INSERT INTO `var_log` VALUES ('pgn_cal_appointment_TITLE');
INSERT INTO `var_log` VALUES ('pgn_cal_calendars_DESCRIPTION');
INSERT INTO `var_log` VALUES ('pgn_cal_calendars_NAME');
INSERT INTO `var_log` VALUES ('pgn_cal_calendars__NAME');
INSERT INTO `var_log` VALUES ('pgn_cal_categories_COLOR');
INSERT INTO `var_log` VALUES ('pgn_cal_categories_DESCRIPTION');
INSERT INTO `var_log` VALUES ('pgn_cal_categories_NAME');
INSERT INTO `var_log` VALUES ('pgn_config_store_NUMBER1');
INSERT INTO `var_log` VALUES ('pgn_config_store_NUMBER2');
INSERT INTO `var_log` VALUES ('pgn_config_store_NUMBER3');
INSERT INTO `var_log` VALUES ('pgn_config_store_TEXT1');
INSERT INTO `var_log` VALUES ('pgn_config_store_TEXT2');
INSERT INTO `var_log` VALUES ('pgn_config_store_TEXT3');
INSERT INTO `var_log` VALUES ('pgn_config_store_TEXT4');
INSERT INTO `var_log` VALUES ('pgn_config_store_TEXT5');
INSERT INTO `var_log` VALUES ('pgn_gallery_COLS');
INSERT INTO `var_log` VALUES ('pgn_gallery_DESCRIPTION');
INSERT INTO `var_log` VALUES ('pgn_gallery_IMAGE_FOLDER_ID');
INSERT INTO `var_log` VALUES ('pgn_gallery_NAME');
INSERT INTO `var_log` VALUES ('pgn_gallery_ROWS');
INSERT INTO `var_log` VALUES ('pgn_image_ALT');
INSERT INTO `var_log` VALUES ('pgn_image_ALT100027');
INSERT INTO `var_log` VALUES ('pgn_image_ALT100028');
INSERT INTO `var_log` VALUES ('pgn_image_ALT100058');
INSERT INTO `var_log` VALUES ('pgn_image_ALT100077');
INSERT INTO `var_log` VALUES ('pgn_image_ALT100078');
INSERT INTO `var_log` VALUES ('pgn_image_ALT100079');
INSERT INTO `var_log` VALUES ('pgn_image_ALT100080');
INSERT INTO `var_log` VALUES ('pgn_image_ALT100081');
INSERT INTO `var_log` VALUES ('pgn_image_ALT100082');
INSERT INTO `var_log` VALUES ('pgn_image_ALT100083');
INSERT INTO `var_log` VALUES ('pgn_image_ALT100084');
INSERT INTO `var_log` VALUES ('pgn_image_ALT100085');
INSERT INTO `var_log` VALUES ('pgn_image_ALT100086');
INSERT INTO `var_log` VALUES ('pgn_image_ALT100087');
INSERT INTO `var_log` VALUES ('pgn_image_ALT100095');
INSERT INTO `var_log` VALUES ('pgn_image_ALT100110');
INSERT INTO `var_log` VALUES ('pgn_image_ALT100181');
INSERT INTO `var_log` VALUES ('pgn_image_ALT100182');
INSERT INTO `var_log` VALUES ('pgn_image_ALT100183');
INSERT INTO `var_log` VALUES ('pgn_image_ALT100191');
INSERT INTO `var_log` VALUES ('pgn_image_ALT100192');
INSERT INTO `var_log` VALUES ('pgn_image_ALT100193');
INSERT INTO `var_log` VALUES ('pgn_image_ALT100201');
INSERT INTO `var_log` VALUES ('pgn_image_ALT100202');
INSERT INTO `var_log` VALUES ('pgn_image_ALT100203');
INSERT INTO `var_log` VALUES ('pgn_image_ALT100230');
INSERT INTO `var_log` VALUES ('pgn_image_ALT100237');
INSERT INTO `var_log` VALUES ('pgn_image_ALT100244');
INSERT INTO `var_log` VALUES ('pgn_image_ALT100251');
INSERT INTO `var_log` VALUES ('pgn_image_ALT100534');
INSERT INTO `var_log` VALUES ('pgn_image_ALT100537');
INSERT INTO `var_log` VALUES ('pgn_image_ALT101163');
INSERT INTO `var_log` VALUES ('pgn_image_ALT101300');
INSERT INTO `var_log` VALUES ('pgn_image_ALT101305');
INSERT INTO `var_log` VALUES ('pgn_image_ALT101548');
INSERT INTO `var_log` VALUES ('pgn_image_ALT102347');
INSERT INTO `var_log` VALUES ('pgn_image_ALT113740');
INSERT INTO `var_log` VALUES ('pgn_image_COPYRIGHT');
INSERT INTO `var_log` VALUES ('pgn_image_COPYRIGHT100027');
INSERT INTO `var_log` VALUES ('pgn_image_COPYRIGHT100028');
INSERT INTO `var_log` VALUES ('pgn_image_COPYRIGHT100058');
INSERT INTO `var_log` VALUES ('pgn_image_COPYRIGHT100077');
INSERT INTO `var_log` VALUES ('pgn_image_COPYRIGHT100078');
INSERT INTO `var_log` VALUES ('pgn_image_COPYRIGHT100079');
INSERT INTO `var_log` VALUES ('pgn_image_COPYRIGHT100080');
INSERT INTO `var_log` VALUES ('pgn_image_COPYRIGHT100081');
INSERT INTO `var_log` VALUES ('pgn_image_COPYRIGHT100082');
INSERT INTO `var_log` VALUES ('pgn_image_COPYRIGHT100083');
INSERT INTO `var_log` VALUES ('pgn_image_COPYRIGHT100084');
INSERT INTO `var_log` VALUES ('pgn_image_COPYRIGHT100085');
INSERT INTO `var_log` VALUES ('pgn_image_COPYRIGHT100086');
INSERT INTO `var_log` VALUES ('pgn_image_COPYRIGHT100087');
INSERT INTO `var_log` VALUES ('pgn_image_COPYRIGHT100095');
INSERT INTO `var_log` VALUES ('pgn_image_COPYRIGHT100110');
INSERT INTO `var_log` VALUES ('pgn_image_COPYRIGHT100181');
INSERT INTO `var_log` VALUES ('pgn_image_COPYRIGHT100182');
INSERT INTO `var_log` VALUES ('pgn_image_COPYRIGHT100183');
INSERT INTO `var_log` VALUES ('pgn_image_COPYRIGHT100191');
INSERT INTO `var_log` VALUES ('pgn_image_COPYRIGHT100192');
INSERT INTO `var_log` VALUES ('pgn_image_COPYRIGHT100193');
INSERT INTO `var_log` VALUES ('pgn_image_COPYRIGHT100201');
INSERT INTO `var_log` VALUES ('pgn_image_COPYRIGHT100202');
INSERT INTO `var_log` VALUES ('pgn_image_COPYRIGHT100203');
INSERT INTO `var_log` VALUES ('pgn_image_COPYRIGHT100230');
INSERT INTO `var_log` VALUES ('pgn_image_COPYRIGHT100237');
INSERT INTO `var_log` VALUES ('pgn_image_COPYRIGHT100244');
INSERT INTO `var_log` VALUES ('pgn_image_COPYRIGHT100251');
INSERT INTO `var_log` VALUES ('pgn_image_COPYRIGHT100534');
INSERT INTO `var_log` VALUES ('pgn_image_COPYRIGHT100537');
INSERT INTO `var_log` VALUES ('pgn_image_COPYRIGHT101163');
INSERT INTO `var_log` VALUES ('pgn_image_COPYRIGHT101300');
INSERT INTO `var_log` VALUES ('pgn_image_COPYRIGHT101305');
INSERT INTO `var_log` VALUES ('pgn_image_COPYRIGHT101548');
INSERT INTO `var_log` VALUES ('pgn_image_COPYRIGHT102347');
INSERT INTO `var_log` VALUES ('pgn_image_COPYRIGHT113740');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100015');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100019');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100033');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100035');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100036');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100037');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100039');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100045');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100056');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100059');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100061');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100069');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100071');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100072');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100073');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100074');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100075');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100076');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100079');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100080');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100082');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100083');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100084');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100086');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100092');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100108');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100111');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100118');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100121');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100127');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100132');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100133');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100139');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100143');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100145');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100147');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100151');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100155');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100161');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100163');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100165');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100169');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100175');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100179');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100181');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100187');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100189');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100199');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100217');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100219');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100220');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100221');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100222');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100223');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100228');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100229');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100235');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100236');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100237');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100238');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100240');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100242');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100244');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100249');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100256');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100258');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100263');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100264');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100265');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100266');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100267');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100268');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100269');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100285');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100286');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100287');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100297');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100304');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100306');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100327');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100331');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100334');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100337');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100341');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100342');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100343');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100348');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100365');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100371');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100387');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100393');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100402');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100403');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100404');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100405');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100463');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100464');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100572');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100577');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100579');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100580');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100581');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100582');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100583');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100584');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100585');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100586');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100587');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100588');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100589');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100590');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100591');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100592');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100595');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100596');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100599');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100720');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100725');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100730');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100744');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100746');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100747');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100748');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100750');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT100757');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT101161');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT101195');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT101196');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT101197');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT101198');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT101199');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT101200');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT101202');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT101203');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT101205');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT101206');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT101209');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT101229');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT101230');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT101231');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT101232');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT101233');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT101234');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT101235');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT101236');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT101237');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT101238');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT101248');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT101249');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT101298');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT101303');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT101328');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT101332');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT101546');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT101657');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT101662');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT101703');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT102345');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT102356');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT113719');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT113723');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT113738');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT113801');
INSERT INTO `var_log` VALUES ('pgn_label_CONTENT113809');
INSERT INTO `var_log` VALUES ('pgn_link_HREF');
INSERT INTO `var_log` VALUES ('pgn_link_HREF100121');
INSERT INTO `var_log` VALUES ('pgn_link_HREF100168');
INSERT INTO `var_log` VALUES ('pgn_link_HREF100208');
INSERT INTO `var_log` VALUES ('pgn_link_HREF100209');
INSERT INTO `var_log` VALUES ('pgn_link_HREF100210');
INSERT INTO `var_log` VALUES ('pgn_link_HREF100221');
INSERT INTO `var_log` VALUES ('pgn_link_HREF100222');
INSERT INTO `var_log` VALUES ('pgn_link_HREF100223');
INSERT INTO `var_log` VALUES ('pgn_link_HREF100241');
INSERT INTO `var_log` VALUES ('pgn_link_HREF100316');
INSERT INTO `var_log` VALUES ('pgn_link_HREF100317');
INSERT INTO `var_log` VALUES ('pgn_link_HREF100318');
INSERT INTO `var_log` VALUES ('pgn_link_HREF100524');
INSERT INTO `var_log` VALUES ('pgn_link_HREF100535');
INSERT INTO `var_log` VALUES ('pgn_link_HREF100538');
INSERT INTO `var_log` VALUES ('pgn_link_LABEL');
INSERT INTO `var_log` VALUES ('pgn_link_LABEL100121');
INSERT INTO `var_log` VALUES ('pgn_link_LABEL100168');
INSERT INTO `var_log` VALUES ('pgn_link_LABEL100208');
INSERT INTO `var_log` VALUES ('pgn_link_LABEL100209');
INSERT INTO `var_log` VALUES ('pgn_link_LABEL100210');
INSERT INTO `var_log` VALUES ('pgn_link_LABEL100221');
INSERT INTO `var_log` VALUES ('pgn_link_LABEL100222');
INSERT INTO `var_log` VALUES ('pgn_link_LABEL100223');
INSERT INTO `var_log` VALUES ('pgn_link_LABEL100241');
INSERT INTO `var_log` VALUES ('pgn_link_LABEL100316');
INSERT INTO `var_log` VALUES ('pgn_link_LABEL100317');
INSERT INTO `var_log` VALUES ('pgn_link_LABEL100318');
INSERT INTO `var_log` VALUES ('pgn_link_LABEL100524');
INSERT INTO `var_log` VALUES ('pgn_link_LABEL100535');
INSERT INTO `var_log` VALUES ('pgn_link_LABEL100538');
INSERT INTO `var_log` VALUES ('pgn_link_SPID');
INSERT INTO `var_log` VALUES ('pgn_link_SPID100121');
INSERT INTO `var_log` VALUES ('pgn_link_SPID100168');
INSERT INTO `var_log` VALUES ('pgn_link_SPID100208');
INSERT INTO `var_log` VALUES ('pgn_link_SPID100209');
INSERT INTO `var_log` VALUES ('pgn_link_SPID100210');
INSERT INTO `var_log` VALUES ('pgn_link_SPID100221');
INSERT INTO `var_log` VALUES ('pgn_link_SPID100222');
INSERT INTO `var_log` VALUES ('pgn_link_SPID100223');
INSERT INTO `var_log` VALUES ('pgn_link_SPID100241');
INSERT INTO `var_log` VALUES ('pgn_link_SPID100316');
INSERT INTO `var_log` VALUES ('pgn_link_SPID100317');
INSERT INTO `var_log` VALUES ('pgn_link_SPID100318');
INSERT INTO `var_log` VALUES ('pgn_link_SPID100524');
INSERT INTO `var_log` VALUES ('pgn_link_SPID100535');
INSERT INTO `var_log` VALUES ('pgn_link_SPID100538');
INSERT INTO `var_log` VALUES ('pgn_link_TARGET');
INSERT INTO `var_log` VALUES ('pgn_link_TARGET100121');
INSERT INTO `var_log` VALUES ('pgn_link_TARGET100168');
INSERT INTO `var_log` VALUES ('pgn_link_TARGET100208');
INSERT INTO `var_log` VALUES ('pgn_link_TARGET100209');
INSERT INTO `var_log` VALUES ('pgn_link_TARGET100210');
INSERT INTO `var_log` VALUES ('pgn_link_TARGET100221');
INSERT INTO `var_log` VALUES ('pgn_link_TARGET100222');
INSERT INTO `var_log` VALUES ('pgn_link_TARGET100223');
INSERT INTO `var_log` VALUES ('pgn_link_TARGET100241');
INSERT INTO `var_log` VALUES ('pgn_link_TARGET100316');
INSERT INTO `var_log` VALUES ('pgn_link_TARGET100317');
INSERT INTO `var_log` VALUES ('pgn_link_TARGET100318');
INSERT INTO `var_log` VALUES ('pgn_link_TARGET100524');
INSERT INTO `var_log` VALUES ('pgn_link_TARGET100535');
INSERT INTO `var_log` VALUES ('pgn_link_TARGET100538');
INSERT INTO `var_log` VALUES ('pgn_media_COPYRIGHT');
INSERT INTO `var_log` VALUES ('pgn_media_HEIGHT');
INSERT INTO `var_log` VALUES ('pgn_media_WIDTH');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100016');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100020');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100026');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100034');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100040');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100046');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100057');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100062');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100081');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100087');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100093');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100109');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100119');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100122');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100128');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100133');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100134');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100140');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100144');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100146');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100148');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100152');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100156');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100162');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100164');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100166');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100170');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100176');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100180');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100182');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100188');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100190');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100200');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100218');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100229');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100230');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100236');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100239');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100242');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100243');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100245');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100250');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100257');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100259');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100264');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100267');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100269');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100270');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100298');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100307');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100328');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100332');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100333');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100335');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100338');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100339');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100342');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100349');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100366');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100367');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100372');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100373');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100573');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100578');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100721');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100726');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100731');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100745');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT100758');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT101162');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT101299');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT101304');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT101329');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT101547');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT101659');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT101664');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT101705');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT102346');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT102358');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT113720');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT113739');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT113803');
INSERT INTO `var_log` VALUES ('pgn_text_CONTENT113811');
INSERT INTO `var_log` VALUES ('phpedit');
INSERT INTO `var_log` VALUES ('plugin');
INSERT INTO `var_log` VALUES ('PLUGINS_M');
INSERT INTO `var_log` VALUES ('pnode');
INSERT INTO `var_log` VALUES ('PORTAL_MANAGER');
INSERT INTO `var_log` VALUES ('position');
INSERT INTO `var_log` VALUES ('prcstate');
INSERT INTO `var_log` VALUES ('processing');
INSERT INTO `var_log` VALUES ('props');
INSERT INTO `var_log` VALUES ('replace');
INSERT INTO `var_log` VALUES ('resetfilter');
INSERT INTO `var_log` VALUES ('RESOURCES_M');
INSERT INTO `var_log` VALUES ('resource_type');
INSERT INTO `var_log` VALUES ('ressource_type');
INSERT INTO `var_log` VALUES ('roles_DESCRIPTION');
INSERT INTO `var_log` VALUES ('roles_ROLE_NAME');
INSERT INTO `var_log` VALUES ('ROLLOUT');
INSERT INTO `var_log` VALUES ('s');
INSERT INTO `var_log` VALUES ('s100002');
INSERT INTO `var_log` VALUES ('s100003');
INSERT INTO `var_log` VALUES ('s100004');
INSERT INTO `var_log` VALUES ('s100005');
INSERT INTO `var_log` VALUES ('s100006');
INSERT INTO `var_log` VALUES ('s100007');
INSERT INTO `var_log` VALUES ('s100008');
INSERT INTO `var_log` VALUES ('s100013');
INSERT INTO `var_log` VALUES ('s100014');
INSERT INTO `var_log` VALUES ('s100015');
INSERT INTO `var_log` VALUES ('s100016');
INSERT INTO `var_log` VALUES ('s100017');
INSERT INTO `var_log` VALUES ('s100023');
INSERT INTO `var_log` VALUES ('s100024');
INSERT INTO `var_log` VALUES ('s100029');
INSERT INTO `var_log` VALUES ('s100030');
INSERT INTO `var_log` VALUES ('s100031');
INSERT INTO `var_log` VALUES ('s100032');
INSERT INTO `var_log` VALUES ('s100037');
INSERT INTO `var_log` VALUES ('s100038');
INSERT INTO `var_log` VALUES ('s100039');
INSERT INTO `var_log` VALUES ('s100040');
INSERT INTO `var_log` VALUES ('s100041');
INSERT INTO `var_log` VALUES ('s100042');
INSERT INTO `var_log` VALUES ('s100043');
INSERT INTO `var_log` VALUES ('s100044');
INSERT INTO `var_log` VALUES ('s100047');
INSERT INTO `var_log` VALUES ('s100048');
INSERT INTO `var_log` VALUES ('s100049');
INSERT INTO `var_log` VALUES ('s100050');
INSERT INTO `var_log` VALUES ('s100051');
INSERT INTO `var_log` VALUES ('s100053');
INSERT INTO `var_log` VALUES ('s100054');
INSERT INTO `var_log` VALUES ('s100055');
INSERT INTO `var_log` VALUES ('s100061');
INSERT INTO `var_log` VALUES ('s100062');
INSERT INTO `var_log` VALUES ('s100063');
INSERT INTO `var_log` VALUES ('s100064');
INSERT INTO `var_log` VALUES ('s100065');
INSERT INTO `var_log` VALUES ('s100066');
INSERT INTO `var_log` VALUES ('s100067');
INSERT INTO `var_log` VALUES ('s100068');
INSERT INTO `var_log` VALUES ('s100069');
INSERT INTO `var_log` VALUES ('s100070');
INSERT INTO `var_log` VALUES ('s100071');
INSERT INTO `var_log` VALUES ('s100072');
INSERT INTO `var_log` VALUES ('s100073');
INSERT INTO `var_log` VALUES ('s100088');
INSERT INTO `var_log` VALUES ('s100094');
INSERT INTO `var_log` VALUES ('s100098');
INSERT INTO `var_log` VALUES ('s100111');
INSERT INTO `var_log` VALUES ('s100112');
INSERT INTO `var_log` VALUES ('s100113');
INSERT INTO `var_log` VALUES ('s100114');
INSERT INTO `var_log` VALUES ('s100115');
INSERT INTO `var_log` VALUES ('s100123');
INSERT INTO `var_log` VALUES ('s100124');
INSERT INTO `var_log` VALUES ('s100125');
INSERT INTO `var_log` VALUES ('s100126');
INSERT INTO `var_log` VALUES ('s100133');
INSERT INTO `var_log` VALUES ('s100134');
INSERT INTO `var_log` VALUES ('s100135');
INSERT INTO `var_log` VALUES ('s100137');
INSERT INTO `var_log` VALUES ('s100138');
INSERT INTO `var_log` VALUES ('s100139');
INSERT INTO `var_log` VALUES ('s100140');
INSERT INTO `var_log` VALUES ('s100169');
INSERT INTO `var_log` VALUES ('s100170');
INSERT INTO `var_log` VALUES ('s100171');
INSERT INTO `var_log` VALUES ('s100172');
INSERT INTO `var_log` VALUES ('s100190');
INSERT INTO `var_log` VALUES ('s100191');
INSERT INTO `var_log` VALUES ('s100192');
INSERT INTO `var_log` VALUES ('s100193');
INSERT INTO `var_log` VALUES ('s100194');
INSERT INTO `var_log` VALUES ('s100196');
INSERT INTO `var_log` VALUES ('s100197');
INSERT INTO `var_log` VALUES ('s100198');
INSERT INTO `var_log` VALUES ('s100199');
INSERT INTO `var_log` VALUES ('s100200');
INSERT INTO `var_log` VALUES ('s100201');
INSERT INTO `var_log` VALUES ('s100202');
INSERT INTO `var_log` VALUES ('s100203');
INSERT INTO `var_log` VALUES ('s100205');
INSERT INTO `var_log` VALUES ('s100206');
INSERT INTO `var_log` VALUES ('s100207');
INSERT INTO `var_log` VALUES ('s100208');
INSERT INTO `var_log` VALUES ('s100209');
INSERT INTO `var_log` VALUES ('s100212');
INSERT INTO `var_log` VALUES ('s100213');
INSERT INTO `var_log` VALUES ('s100214');
INSERT INTO `var_log` VALUES ('s100215');
INSERT INTO `var_log` VALUES ('s100216');
INSERT INTO `var_log` VALUES ('s100217');
INSERT INTO `var_log` VALUES ('s100218');
INSERT INTO `var_log` VALUES ('s100258');
INSERT INTO `var_log` VALUES ('s100259');
INSERT INTO `var_log` VALUES ('s100260');
INSERT INTO `var_log` VALUES ('s100261');
INSERT INTO `var_log` VALUES ('s100262');
INSERT INTO `var_log` VALUES ('s100272');
INSERT INTO `var_log` VALUES ('s100278');
INSERT INTO `var_log` VALUES ('s100282');
INSERT INTO `var_log` VALUES ('s100283');
INSERT INTO `var_log` VALUES ('s100284');
INSERT INTO `var_log` VALUES ('s100303');
INSERT INTO `var_log` VALUES ('s100319');
INSERT INTO `var_log` VALUES ('s100321');
INSERT INTO `var_log` VALUES ('s100322');
INSERT INTO `var_log` VALUES ('s100323');
INSERT INTO `var_log` VALUES ('s100341');
INSERT INTO `var_log` VALUES ('s100345');
INSERT INTO `var_log` VALUES ('s100346');
INSERT INTO `var_log` VALUES ('s100395');
INSERT INTO `var_log` VALUES ('s100396');
INSERT INTO `var_log` VALUES ('s100398');
INSERT INTO `var_log` VALUES ('s100399');
INSERT INTO `var_log` VALUES ('s100400');
INSERT INTO `var_log` VALUES ('s100401');
INSERT INTO `var_log` VALUES ('s100455');
INSERT INTO `var_log` VALUES ('s100456');
INSERT INTO `var_log` VALUES ('s100457');
INSERT INTO `var_log` VALUES ('s100512');
INSERT INTO `var_log` VALUES ('s100523');
INSERT INTO `var_log` VALUES ('s100526');
INSERT INTO `var_log` VALUES ('s100527');
INSERT INTO `var_log` VALUES ('s100528');
INSERT INTO `var_log` VALUES ('s100550');
INSERT INTO `var_log` VALUES ('s100555');
INSERT INTO `var_log` VALUES ('s100556');
INSERT INTO `var_log` VALUES ('s100557');
INSERT INTO `var_log` VALUES ('s100558');
INSERT INTO `var_log` VALUES ('s100559');
INSERT INTO `var_log` VALUES ('s100560');
INSERT INTO `var_log` VALUES ('s100561');
INSERT INTO `var_log` VALUES ('s100562');
INSERT INTO `var_log` VALUES ('s100563');
INSERT INTO `var_log` VALUES ('s100564');
INSERT INTO `var_log` VALUES ('s100565');
INSERT INTO `var_log` VALUES ('s100566');
INSERT INTO `var_log` VALUES ('s100567');
INSERT INTO `var_log` VALUES ('s100568');
INSERT INTO `var_log` VALUES ('s100569');
INSERT INTO `var_log` VALUES ('s100570');
INSERT INTO `var_log` VALUES ('s100571');
INSERT INTO `var_log` VALUES ('s100593');
INSERT INTO `var_log` VALUES ('s100594');
INSERT INTO `var_log` VALUES ('s100597');
INSERT INTO `var_log` VALUES ('s100598');
INSERT INTO `var_log` VALUES ('s100713');
INSERT INTO `var_log` VALUES ('s100714');
INSERT INTO `var_log` VALUES ('s100733');
INSERT INTO `var_log` VALUES ('s100734');
INSERT INTO `var_log` VALUES ('s100735');
INSERT INTO `var_log` VALUES ('s100736');
INSERT INTO `var_log` VALUES ('s100737');
INSERT INTO `var_log` VALUES ('s100738');
INSERT INTO `var_log` VALUES ('s100749');
INSERT INTO `var_log` VALUES ('s100826');
INSERT INTO `var_log` VALUES ('s100827');
INSERT INTO `var_log` VALUES ('s100829');
INSERT INTO `var_log` VALUES ('s100830');
INSERT INTO `var_log` VALUES ('s100832');
INSERT INTO `var_log` VALUES ('s100833');
INSERT INTO `var_log` VALUES ('s100835');
INSERT INTO `var_log` VALUES ('s100836');
INSERT INTO `var_log` VALUES ('s100838');
INSERT INTO `var_log` VALUES ('s100839');
INSERT INTO `var_log` VALUES ('s100918');
INSERT INTO `var_log` VALUES ('s100919');
INSERT INTO `var_log` VALUES ('s100920');
INSERT INTO `var_log` VALUES ('s100921');
INSERT INTO `var_log` VALUES ('s100922');
INSERT INTO `var_log` VALUES ('s100923');
INSERT INTO `var_log` VALUES ('s100924');
INSERT INTO `var_log` VALUES ('s100925');
INSERT INTO `var_log` VALUES ('s100926');
INSERT INTO `var_log` VALUES ('s100927');
INSERT INTO `var_log` VALUES ('s100928');
INSERT INTO `var_log` VALUES ('s100929');
INSERT INTO `var_log` VALUES ('s100930');
INSERT INTO `var_log` VALUES ('s100931');
INSERT INTO `var_log` VALUES ('s100932');
INSERT INTO `var_log` VALUES ('s100933');
INSERT INTO `var_log` VALUES ('s100934');
INSERT INTO `var_log` VALUES ('s100935');
INSERT INTO `var_log` VALUES ('s100936');
INSERT INTO `var_log` VALUES ('s101156');
INSERT INTO `var_log` VALUES ('s101157');
INSERT INTO `var_log` VALUES ('s101158');
INSERT INTO `var_log` VALUES ('s101164');
INSERT INTO `var_log` VALUES ('s101178');
INSERT INTO `var_log` VALUES ('s101179');
INSERT INTO `var_log` VALUES ('s101192');
INSERT INTO `var_log` VALUES ('s101194');
INSERT INTO `var_log` VALUES ('s101262');
INSERT INTO `var_log` VALUES ('s101275');
INSERT INTO `var_log` VALUES ('s101602');
INSERT INTO `var_log` VALUES ('s101603');
INSERT INTO `var_log` VALUES ('s101604');
INSERT INTO `var_log` VALUES ('s102368');
INSERT INTO `var_log` VALUES ('s102369');
INSERT INTO `var_log` VALUES ('s113815');
INSERT INTO `var_log` VALUES ('saction');
INSERT INTO `var_log` VALUES ('search');
INSERT INTO `var_log` VALUES ('searchcolumn');
INSERT INTO `var_log` VALUES ('searchexpired');
INSERT INTO `var_log` VALUES ('searchin');
INSERT INTO `var_log` VALUES ('searchlive');
INSERT INTO `var_log` VALUES ('searchmissing');
INSERT INTO `var_log` VALUES ('searchphrase');
INSERT INTO `var_log` VALUES ('selected');
INSERT INTO `var_log` VALUES ('selval');
INSERT INTO `var_log` VALUES ('selvals');
INSERT INTO `var_log` VALUES ('sel_object');
INSERT INTO `var_log` VALUES ('sid');
INSERT INTO `var_log` VALUES ('sitemap_IS_CACHED');
INSERT INTO `var_log` VALUES ('sitemap_IS_DISPLAYED');
INSERT INTO `var_log` VALUES ('sitemap_IS_LOCKED');
INSERT INTO `var_log` VALUES ('sitemap_NAME');
INSERT INTO `var_log` VALUES ('sitemap_PARENT_ID');
INSERT INTO `var_log` VALUES ('sitemap_POSITION');
INSERT INTO `var_log` VALUES ('sitemap_SPM_ID');
INSERT INTO `var_log` VALUES ('sitepage_CLNID');
INSERT INTO `var_log` VALUES ('sitepage_EXPIRE_DATE');
INSERT INTO `var_log` VALUES ('sitepage_EXPIRE_DATE_time');
INSERT INTO `var_log` VALUES ('sitepage_LAUNCH_DATE');
INSERT INTO `var_log` VALUES ('sitepage_LAUNCH_DATE_time');
INSERT INTO `var_log` VALUES ('SITEPAGE_MASTER');
INSERT INTO `var_log` VALUES ('sitepage_master_CLT_ID');
INSERT INTO `var_log` VALUES ('sitepage_master_DESCRIPTION');
INSERT INTO `var_log` VALUES ('sitepage_master_NAME');
INSERT INTO `var_log` VALUES ('sitepage_master_SPMTYPE_ID');
INSERT INTO `var_log` VALUES ('sitepage_master_TEMPLATE_PATH');
INSERT INTO `var_log` VALUES ('sitepage_master_THUMBNAIL');
INSERT INTO `var_log` VALUES ('sitepage_names_DIRECT_URL');
INSERT INTO `var_log` VALUES ('sitepage_names_HELP');
INSERT INTO `var_log` VALUES ('sitepage_names_NAME');
INSERT INTO `var_log` VALUES ('sitepage_POSITION');
INSERT INTO `var_log` VALUES ('SITEPAGE_PROPS');
INSERT INTO `var_log` VALUES ('sitepage_variations_VARIATION_ID');
INSERT INTO `var_log` VALUES ('site_id');
INSERT INTO `var_log` VALUES ('sname');
INSERT INTO `var_log` VALUES ('source_');
INSERT INTO `var_log` VALUES ('source_type');
INSERT INTO `var_log` VALUES ('spid');
INSERT INTO `var_log` VALUES ('spider');
INSERT INTO `var_log` VALUES ('spm');
INSERT INTO `var_log` VALUES ('status');
INSERT INTO `var_log` VALUES ('step');
INSERT INTO `var_log` VALUES ('submitted');
INSERT INTO `var_log` VALUES ('sync');
INSERT INTO `var_log` VALUES ('todo');
INSERT INTO `var_log` VALUES ('TRAFFIC');
INSERT INTO `var_log` VALUES ('translation');
INSERT INTO `var_log` VALUES ('update');
INSERT INTO `var_log` VALUES ('upload');
INSERT INTO `var_log` VALUES ('url');
INSERT INTO `var_log` VALUES ('users_ACTIVE');
INSERT INTO `var_log` VALUES ('users_EMAIL');
INSERT INTO `var_log` VALUES ('users_FULL_NAME');
INSERT INTO `var_log` VALUES ('users_LANGID');
INSERT INTO `var_log` VALUES ('users_PASSWORD_1');
INSERT INTO `var_log` VALUES ('users_PASSWORD_2');
INSERT INTO `var_log` VALUES ('users_USER_NAME');
INSERT INTO `var_log` VALUES ('users_USE_AGENT');
INSERT INTO `var_log` VALUES ('users_USE_JAVASCRIPT');
INSERT INTO `var_log` VALUES ('v');
INSERT INTO `var_log` VALUES ('value');
INSERT INTO `var_log` VALUES ('variation');
INSERT INTO `var_log` VALUES ('variations');
INSERT INTO `var_log` VALUES ('variations_DESCRIPTION');
INSERT INTO `var_log` VALUES ('variations_NAME');
INSERT INTO `var_log` VALUES ('variations_SHORTTEXT');
INSERT INTO `var_log` VALUES ('view');
INSERT INTO `var_log` VALUES ('width');

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
) TYPE=MyISAM;

#
# Daten für Tabelle `variations`
#

INSERT INTO `variations` VALUES (1, 'Standard', 'std', 'Standard Value, No Variation', 0);

ALTER TABLE `pgn_link` CHANGE `LABEL` `LABEL` VARCHAR( 255 ) NULL DEFAULT NULL;
Delete from internal_resources WHERE RESID="LATEST";
Delete from internal_resources WHERE RESID="OLDEST";
Delete from internal_resources WHERE RESID="LATEST_CREATED";
Delete from internal_resources WHERE RESID="OLDEST_CREATED";
Delete from internal_resources WHERE RESID="RANDOM";
ALTER TABLE `channel_articles` ADD `POSITION` BIGINT DEFAULT '0' NOT NULL AFTER `CLT_ID` ;


