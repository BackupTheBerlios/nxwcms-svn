
DROP TABLE IF EXISTS pot_search_engines;

CREATE TABLE pot_search_engines (
  accesslog_id  int(11)       NOT NULL,
  search_engine varchar(64)   NOT NULL,
  keywords      varchar(254)  NOT NULL,

  PRIMARY KEY   (accesslog_id)
) DELAY_KEY_WRITE=1;

CREATE TABLE `pot_nxlog` (
`accesslog_id` INT( 11 ) NOT NULL ,
`weekday` INT( 1 ) NOT NULL ,
`starttime` INT( 10 ) NOT NULL ,
`endtime` INT( 10 ) NOT NULL,

  PRIMARY KEY   (accesslog_id)
) DELAY_KEY_WRITE=1; 

ALTER TABLE `pot_nxlog` ADD `hour` INT( 2 ) NOT NULL AFTER `weekday` ;
ALTER TABLE `pot_nxlog` ADD `pi` INT( 4 ) NOT NULL , ADD `duration` INT( 11 ) NOT NULL ;