<?
	/**********************************************************************
	 * @module Application
	 **********************************************************************/
	require_once "../../config.inc.php";

	$auth = new auth("Administrator");
	$page = new page("Designs");
	require_once "menudef.inc.php";
	
	$form = new SettingsForm($lang->get("menu_designs", "Menu Designs"));
	$ar = createNameValueArray('sitemap', 'NAME', 'MENU_ID');
	$designclasses = getDCFileList('designs/menu');	
	$form->addRadioSetting($lang->get('sel_menu', 'Select Menu Layout'), 'CDS/MENU', $designclasses);
	
	$mclass = reg_load('CDS/MENU');
	if ((value("set0", "", "") != $mclass) && (value("set0", "", "") != ""))
	  $mclass = value("set0");
	if ($mclass != "") {
	  $form->addHeadline($lang->get('sel_menustyle', 'Adjust Menu Type'));
	  $ref = createDCRef($c["path"]."designs/menu/".$mclass);
	  $ref->editConfiguration(&$form);
	  $form->add(new Spacer(2));
	}
	$page->add($form);	
	$page->draw();
	$db->close();
?>