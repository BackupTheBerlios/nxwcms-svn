<?
	/**********************************************************************
	 * @module Application
	 **********************************************************************/
	require_once "../../config.inc.php";

	$auth = new auth("SITEPAGE_MASTER");
	$page = new page("Sitepage-Master");

	$filter = new Filter("sitepage_master", "SPM_ID");
	$filter->addRule($lang->get("name"), "NAME", "NAME");
	$filter->addRule($lang->get("description"), "DESCRIPTION", "NAME");
	$filter->setAdditionalCondition("DELETED = 0 AND VERSION=0");
	$filter->setNewAction($c["docroot"]."modules/pagetemplate/sitepage_master.php");
	$filter->icon = "li_template.gif";
	$filter->type_name = "Templates";

	$filtermenu = new Filtermenu($lang->get("spm"), $filter);
	if ($oid!="") {
	  $title = getDBCell("sitepage_master", "NAME", "SPM_ID = $oid");
	} else {
	  $title = "";	
	}
	
	$form = new MessageForm('Functionality Not Available in Demo', 'Because of security and safety concerns, this function is not available in the N/X WCMS Online Demo.', '');
	

	$page->addMenu($filtermenu);
	$page->add($form);
	$page->draw();
	$db->close();
?>