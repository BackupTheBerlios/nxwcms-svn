INSERT INTO `cluster_template_item_types` ( `CLTITYPE_ID` , `NAME` , `DESCRIPTION` )
VALUES (
'8', 'Channel', 'Linking content of channels.'
);

CREATE TABLE `centerstage` (
`STAGE_ID` BIGINT NOT NULL ,
`CHID` BIGINT,
`CH_CAT_ID` BIGINT,
`SORT_ALGORITHM` TINYINT DEFAULT '1' NOT NULL ,
`MAXCARD` BIGINT DEFAULT '3' NOT NULL ,
`CLNID` BIGINT,
PRIMARY KEY ( `STAGE_ID` )
);