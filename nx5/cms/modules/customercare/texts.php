<?
/**********************************************************************
 * @module Application
 **********************************************************************/

 require_once "../../config.inc.php";
$auth= new auth("CUSTOMERCAREADMIN");
 $page= new page ("Textblock Administration");

 $filter = new Filter("pgn_tickets_textblocks", "BLOCK_ID");
 $filter->addRule("Blockname", "NAME", "NAME");

$menu = new Filtermenu("Edit Textblocks", $filter);
$menu->addMenuEntry("Open Requests", "index.php");
$menu->addMenuEntry("Closed Requests", "index.php?status=closed&sid=$sid");
$menu->addMenuEntry("Edit Textblocks", "texts.php");
$menu->addMenuEntry("Browse Contacts", "contacts.php");
if ($auth->checkPermission("ADMINISTRATOR")) $menu->addMenuEntry("Edit Categories", "category.php");
  
 $deleteHandler = new ActionHandler("DELETE");
 $deleteHandler->addDbAction("DELETE FROM pgn_tickets_textblocks where BLOCK_ID=$oid");
 
 $form = new stdEDForm("Edit Textblock", "");
 $cond = $form->setPK("pgn_tickets_textblocks", "BLOCK_ID");
 $form->add(new TextInput("Name", "pgn_tickets_textblocks", "NAME", $cond, "type:text,width:200,size:32", "MANDATORY&UNIQUE"));
 $form->add(new TextInput("Text", "pgn_tickets_textblocks", "CONTENT", $cond, "type:textarea,width:340,size:7", ""));
 $form->registerActionHandler($deleteHandler);

 $page->addMenu($menu);
 $page->add($form);
 $page->draw();
 $db->close();
 ?>
