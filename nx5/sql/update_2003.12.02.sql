ALTER TABLE `cluster_variations` ADD `CREATED_AT` BIGINT,
ADD `LAST_USER` VARCHAR( 32 ) ,
ADD `CREATE_USER` VARCHAR( 32 ) ;

ALTER TABLE `cluster_variations` ADD `LAUNCHED_AT` BIGINT,
ADD `LAUNCH_USER` VARCHAR( 32 ) ;

ALTER TABLE `cluster_variations` CHANGE `LAST_CHANGED` `LAST_CHANGED` BIGINT( 14 ) DEFAULT NULL;

#Channels

INSERT INTO `sys_functions` ( `FUNCTION_ID` , `PARENT_ID` , `NAME` , `DESCRIPTION` ) 
VALUES (
'CHANNELS', '0', 'Channels', 'Allow general access to channels'
);
 
INSERT INTO `sys_functions` ( `FUNCTION_ID` , `PARENT_ID` , `NAME` , `DESCRIPTION` ) 
VALUES (
'CHANNEL_ADMIN', 'CHANNELS', 'Channel Administration', 'Create, Modify and Delete Channels'
);

INSERT INTO `sys_functions` ( `FUNCTION_ID` , `PARENT_ID` , `NAME` , `DESCRIPTION` ) 
VALUES (
'CHANNEL_EDIT', 'CHANNELS', 'Edit Content', 'Edit the content in a channel'
);

INSERT INTO `sys_functions` ( `FUNCTION_ID` , `PARENT_ID` , `NAME` , `DESCRIPTION` ) 
VALUES (
'CHANNEL_DELETE', 'CHANNELS', 'Delete Article', 'Delete an article in a channel.'
);

INSERT INTO `sys_functions` ( `FUNCTION_ID` , `PARENT_ID` , `NAME` , `DESCRIPTION` ) 
VALUES (
'CHANNEL_LAUNCH', 'CHANNELS', 'Launch Article', 'Launch an article in a channel.'
);

CREATE TABLE `channels` (
`CHID` BIGINT NOT NULL ,
`NAME` VARCHAR( 32 ) NOT NULL ,
`CLT_ID` BIGINT NOT NULL ,
PRIMARY KEY ( `CHID` ) 
);

CREATE TABLE `channel_categories` (
`CH_CAT_ID` BIGINT NOT NULL ,
`NAME` VARCHAR( 64 ) NOT NULL ,
PRIMARY KEY ( `CH_CAT_ID` ) 
);

ALTER TABLE `channel_categories` ADD `CHID` BIGINT NOT NULL AFTER `CH_CAT_ID` ;

CREATE TABLE `channel_articles` (
`ARTICLE_ID` BIGINT NOT NULL ,
`CHID` BIGINT NOT NULL ,
`CH_CAT_ID` BIGINT NOT NULL ,
`TITLE` VARCHAR( 64 ) NOT NULL ,
`VERSION` BIGINT DEFAULT '0' NOT NULL ,
PRIMARY KEY ( `ARTICLE_ID` ) 
);




