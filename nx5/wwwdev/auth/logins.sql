
CREATE TABLE `qls_admin_sessions` (
  `id` mediumint(8) NOT NULL auto_increment,
  `value` varchar(32) NOT NULL default '',
  `time` bigint(20) NOT NULL default '0',
  `username` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `time` (`time`),
  KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;


CREATE TABLE `qls_config` (
  `id` mediumint(8) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

-- 
-- Daten für Tabelle `qls_config`
-- 

INSERT INTO `qls_config` (`id`, `name`, `value`) VALUES 
(1, 'gzip', '0'),
(2, 'cookie_prefix', 'nx'),
(3, 'cookie_secure', '0'),
(4, 'cookie_path', '/'),
(5, 'cookie_expiration', '31449600'),
(6, 'cookie_domain', '.localhost'),
(7, 'max_login_attempts', '5'),
(8, 'login_redirect', 'index.php'),
(9, 'logout_redirect', 'index.php'),
(10, 'template_directory', 'templates'),
(11, 'compiled_directory', 'compiled'),
(12, 'cur_version', '2.0.0'),
(13, 'auth_guest_profile', '1'),
(14, 'default_template', '1'),
(15, 'max_about_you', '20000'),
(16, 'auth_profile_image', '1'),
(17, 'language', 'en'),
(18, 'site_name', ''),
(19, 'email_signature', 'email signature'),
(20, 'from_email', ''),
(21, 'image_verification', '1'),
(22, 'activate', '1');

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `qls_image_verification`
-- 

CREATE TABLE `qls_image_verification` (
  `id` mediumint(8) NOT NULL auto_increment,
  `random_id` varchar(32) NOT NULL default '',
  `real_text` varchar(10) NOT NULL default '',
  `time_set` bigint(20) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `random_id` (`random_id`),
  KEY `time_set` (`time_set`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;


CREATE TABLE `qls_info` (
  `id` mediumint(8) NOT NULL auto_increment,
  `username` varchar(32) NOT NULL default '',
  `password` varchar(32) NOT NULL default '',
  `salt` varchar(32) NOT NULL default '',
  `active` tinyint(1) NOT NULL default '0',
  `code` varchar(8) NOT NULL default '',
  `login_attempts` tinyint(2) NOT NULL default '0',
  `email` varchar(255) NOT NULL default '',
  `signature` varchar(255) NOT NULL default '',
  `tz` tinyint(1) NOT NULL default '0',
  `template` mediumint(8) NOT NULL default '0',
  `msn` varchar(255) NOT NULL default '',
  `yim` varchar(255) NOT NULL default '',
  `aim` varchar(255) NOT NULL default '',
  `skype` varchar(255) NOT NULL default '',
  `icq` varchar(255) NOT NULL default '',
  `website` varchar(255) NOT NULL default '',
  `hobbies` varchar(255) NOT NULL default '',
  `occupation` varchar(255) NOT NULL default '',
  `show_email` tinyint(1) NOT NULL default '0',
  `profile_image` varchar(255) NOT NULL default '',
  `show_profile` tinyint(1) NOT NULL default '0',
  `about_you` text NOT NULL,
  `status` tinyint(1) NOT NULL default '0',
  `joined` bigint(20) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;


-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `qls_sessions`
-- 

CREATE TABLE `qls_sessions` (
  `id` mediumint(8) NOT NULL auto_increment,
  `name` varchar(32) NOT NULL default '',
  `value` varchar(32) NOT NULL default '',
  `userid` mediumint(8) NOT NULL default '0',
  `userip` varchar(16) NOT NULL default '',
  `time` bigint(20) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `name` (`name`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

-- 
-- Tabellenstruktur für Tabelle `qls_templates`
-- 

CREATE TABLE `qls_templates` (
  `id` mediumint(8) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `dir` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- 
-- Daten für Tabelle `qls_templates`
-- 

INSERT INTO `qls_templates` (`id`, `name`, `dir`) VALUES 
(1, 'Default', 'default');
