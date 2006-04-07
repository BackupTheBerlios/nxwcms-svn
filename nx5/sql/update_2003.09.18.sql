INSERT INTO `cluster_template_item_types` ( `CLTITYPE_ID` , `NAME` , `DESCRIPTION` ) 
VALUES (
'7', 'Compound Group', 'Group Compounds and select group for content'
);

CREATE TABLE `compound_groups` (
  `CGID` bigint(20) NOT NULL default '0',
  `NAME` varchar(64) NOT NULL default '',
  `DESCRIPTION` varchar(255) default NULL,
  PRIMARY KEY  (`CGID`)
) TYPE=MyISAM;

INSERT INTO `compound_groups` VALUES (201, 'All', 'Any compound of the system');
