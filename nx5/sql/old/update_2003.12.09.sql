ALTER TABLE `channels` DROP `CLT_ID` ;
CREATE TABLE `channel_cluster_templates` (
`CHID` BIGINT NOT NULL ,
`CLT_ID` BIGINT NOT NULL
);
ALTER TABLE `channel_cluster_templates` ADD `POSITION` BIGINT NOT NULL ;
ALTER TABLE `channel_articles` ADD `CLT_ID` BIGINT NOT NULL AFTER `CH_CAT_ID` ;