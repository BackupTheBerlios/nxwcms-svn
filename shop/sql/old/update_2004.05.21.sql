ALTER TABLE `cluster_template_items` ADD `EXCLUSIVE` TINYINT DEFAULT '0' NOT NULL AFTER `CLTITYPE_ID` ;

INSERT INTO `sys_functions` ( `FUNCTION_ID` , `PARENT_ID` , `NAME` , `DESCRIPTION` ) VALUES ('EDIT_EXCLUSIVE', 'EDIT_CL_CONTENT', 'Edit Developer Content', 'Allow user to edit Developer Content');