UPDATE meta_templates SET MT_ID=2 WHERE MT_ID = 0;
UPDATE content SET MT_ID=2 WHERE MT_ID=0;
UPDATE cluster_templates SET MT_ID=2 WHERE MT_ID=0;
UPDATE modules SET MT_ID=2 WHERE MT_ID=0;
UPDATE meta_templates SET NAME="-" WHERE MT_ID=2;
INSERT INTO `sys_functions` ( `FUNCTION_ID` , `PARENT_ID` , `NAME` , `DESCRIPTION` ) VALUES ('BACKUP', 'ADMINISTRATION_M', 'Backup', 'Backup Database and Filesystem');
