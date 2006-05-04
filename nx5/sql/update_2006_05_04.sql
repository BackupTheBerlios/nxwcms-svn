CREATE TABLE `address` (
`GGUID` BIGINT NOT NULL ,
`Name` VARCHAR( 64 ) ,
`Firstname` VARCHAR( 64 ) ,
`Title` VARCHAR( 64 ) ,
`AddressLetter` VARCHAR( 128 ) ,
`MailAddress` VARCHAR( 128 ) ,
`Birthday` DATE,
`Company` VARCHAR( 128 ) ,
`Street1` VARCHAR( 128 ) ,
`Street2` VARCHAR( 128 ) ,
`ZIP` VARCHAR( 32 ) ,
`City` VARCHAR( 64 ) ,
`Region` VARCHAR( 64 ) ,
`Country` VARCHAR( 64 ) ,
`Phone` VARCHAR( 32 ) ,
`Fax` VARCHAR( 32 ) ,
`Cellphone` VARCHAR( 32 ) ,
`Website` VARCHAR( 128 ) ,
`Notes` TEXT,
`Last_Modified` DATETIME,

PRIMARY KEY ( `GGUID` ) 
) TYPE = MYISAM ;

INSERT INTO `sys_functions` ( `FUNCTION_ID` , `PARENT_ID` , `NAME` , `DESCRIPTION` ) 
VALUES (
'ESERVICES', '0', 'Menu E-Services', 'Allow the user to display the menu E-Services'
);

INSERT INTO `sys_functions` ( `FUNCTION_ID` , `PARENT_ID` , `NAME` , `DESCRIPTION` ) 
VALUES (
'ADDRESS', 'ESERVICES', 'Address Editor', 'Allow displaying, editing and deleting Contacts'
);