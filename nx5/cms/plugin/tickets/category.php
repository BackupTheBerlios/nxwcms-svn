<?
/**********************************************************************
 * @module Application
 **********************************************************************/

 require_once "../../config.inc.php";
 $auth= new auth("ADMINISTRATOR");
 $page= new page ("Tickets Category Administration");

 $filter = new Filter("pgn_tickets_categories", "id");
 $filter->addRule("Category", "name", "name");

$menu = new Filtermenu("Edit Categories", $filter);
$menu->addMenuEntry("Open Requests", "index.php");
$menu->addMenuEntry("Closed Requests", "index.php?status=closed&sid=$sid");
$menu->addMenuEntry("Edit Textblocks", "texts.php");
$menu->addMenuEntry("Browse Contacts", "contacts.php");
$menu->addMenuEntry("Edit Categories", "category.php");
  
 $deleteHandler = new ActionHandler("DELETE");
 $deleteHandler->addDbAction("DELETE FROM pgn_tickets_categories where id=$oid");
 
 $form = new stdEDForm("Edit Ticket Categories", "");
 $cond = $form->setPK("pgn_tickets_categories", "id");
 $form->add(new TextInput("Name", "pgn_tickets_categories", "name", $cond, "type:text,width:200,size:32", "MANDATORY&UNIQUE"));
 $form->add(new TextInput("POP-Server", "pgn_tickets_categories", "pophost", $cond, "type:text,width:200,size:32", "MANDATORY"));
 $form->add(new TextInput("POP-Username", "pgn_tickets_categories", "popuser", $cond, "type:text,width:200,size:32", "MANDATORY"));
 $form->add(new TextInput("POP-Password", "pgn_tickets_categories", "poppass", $cond, "type:text,width:200,size:32", "MANDATORY"));
 $form->add(new TextInput("Reply-To-Address", "pgn_tickets_categories", "replyto", $cond, "type:text,width:200,size:32", "MANDATORY"));

 $form->add(new TextInput("Notify From", "pgn_tickets_categories", "notify_from", $cond, "type:text,width:200,size:64", ""));
 $form->add(new TextInput("Notify To", "pgn_tickets_categories", "notify_to", $cond, "type:text,width:200,size:64", ""));
 $form->add(new TextInput("Notify Subject", "pgn_tickets_categories", "notify_subject", $cond, "type:text,width:200,size:64", ""));
 $form->add(new TextInput("Notify ReplyTo", "pgn_tickets_categories", "notify_replyto", $cond, "type:text,width:200,size:64", ""));
 $form->add(new TextInput("Notify Body", "pgn_tickets_categories", "notify_body", $cond, "type:textarea,width:350,size:6", ""));
 $form->add(new TextInput("Notify Headers", "pgn_tickets_categories", "notify_headers", $cond, "type:textarea,width:350,size:6", ""));

 $form->registerActionHandler($deleteHandler);

 $page->addMenu($menu);
 $page->add($form);
 $page->draw();
 $db->close();
?>