INSERT INTO `sys_functions` ( `FUNCTION_ID` , `PARENT_ID` , `NAME` , `DESCRIPTION` ) VALUES ('CHANGE_TEMPLATE', 'SITEPAGE_PROPS', 'Change Template', 'Change Templates based on same Cluster Template');
INSERT INTO `sys_functions` VALUES ('RICH_TEXT_EDIT', 'EDIT_CONTENT', 'Rich Text Editor', NULL);
INSERT INTO `sys_functions` VALUES ('SIMPLE_EDIT', 'RICH_TEXT_EDIT', 'Simple Edit', 'Very few options');
INSERT INTO `sys_functions` VALUES ('PROF_EDIT', 'RICH_TEXT_EDIT', 'Professional Editing', 'Advanced editing with almost all functions');
INSERT INTO `sys_functions` VALUES ('EXPERT_EDIT', 'RICH_TEXT_EDIT', 'Expert Edit', 'Editor with all functions');
