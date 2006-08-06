ALTER TABLE `pgn_link` CHANGE `LABEL` `LABEL` VARCHAR( 255 ) NULL DEFAULT NULL;
Delete from internal_resources WHERE RESID="LATEST";
Delete from internal_resources WHERE RESID="OLDEST";
Delete from internal_resources WHERE RESID="LATEST_CREATED";
Delete from internal_resources WHERE RESID="OLDEST_CREATED";
Delete from internal_resources WHERE RESID="RANDOM";
ALTER TABLE `channel_articles` ADD `POSITION` BIGINT DEFAULT '0' NOT NULL AFTER `CLT_ID` ;


