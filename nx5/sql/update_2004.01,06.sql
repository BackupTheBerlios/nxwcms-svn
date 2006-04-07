ALTER TABLE `syndication` DROP PRIMARY KEY;
INSERT INTO `sys_functions` ( `FUNCTION_ID` , `PARENT_ID` , `NAME` , `DESCRIPTION` )
VALUES (
'SYNDICATION', '0', 'Syndication', 'Allow import and export of data'
);
 INSERT INTO `sys_functions` ( `FUNCTION_ID` , `PARENT_ID` , `NAME` , `DESCRIPTION` )
VALUES (
'IMPORT', 'SYNDICATION', 'Import Data', 'Import Clusters, Templates and so on.'
);
INSERT INTO `sys_functions` ( `FUNCTION_ID` , `PARENT_ID` , `NAME` , `DESCRIPTION` )
VALUES (
'EXPORT', 'SYNDICATION', 'Export Data', 'Export clusters, templates and so on.'
);