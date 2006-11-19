<?php
/**
 * IFrame Item Editor for Shop Configurator
 * @package Userinterface
 * @subpackage Special Widgets
 */


/**********************************************************************
 *	N/X - Web Content Management System
 *	Copyright 2004 Sven Weih
 *
  *
 *	This file is part of N/X.
 *	The initial has been setup as a small diploma thesis (Studienarbeit) at the FZI.
 *	It was be coached by Prof. Werner Zorn and Dipl.-Inform Thomas Gauweiler.
 *
 *	N/X is free software; you can redistribute it and/or modify
 *	it under the terms of the GNU General Public License as published by
 *	the Free Software Foundation; either version 2 of the License, or
 *	(at your option) any later version.
 *
 *	N/X is distributed in the hope that it will be useful,
 *	but WITHOUT ANY WARRANTY; without even the implied warranty of
 *	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *	GNU General Public License for more details.
 *
 *	You should have received a copy of the GNU General Public License
 *	along with N/X; if not, write to the Free Software
 *	Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 **********************************************************************/
 
 require_once "../../../config.inc.php";
 $auth = new auth('SHOPADM'); 

 $width = value("width", "NUMERIC", 600);
 if ($width < 200) $width = 200;
 drawIFOHeader();
 $configuratorId = value("value", "NUMERIC", 0);
 br();
 if ($configuratorId != 0) {
   $action = value("action", "NOSPACES", 0);
    
   
   // draw list with all items.
    $page = new page("foo"); // dummy page with no use.
    $form = new MenuForm($lang->get("configurator_settings", "Configurator Settings"), array($lang->get("position0", 'Position'), $lang->get("name","Name"), $lang->get("value", "Value")), "shop_configurator_item", "GUID", array("POSITION","TITLE", "VALUE"), "1", 10); 
 	$form->addFilterRule($lang->get("name"), "TITLE");
 	$form->width=700;
 	$form->newAction = doc().'&action=create';
 	$form->editAction = doc();
 	echo $form->draw();	
 }
 
 /**
 td($style);
 echo $lang->get("sel_clt");
 tde();
 tr();
 $clts=array();
 createCLTTree($clts);
 $sb = new Dropdown("clt", $clts, $style, $clt, $width);
 $sb->params = 'onChange="if (this.value != \'-1\') document.ifoform.submit();"';
 $sb->draw(); 
 tr();
 td($style);
 echo drawSpacer(5);
 echo '<script language="JavaScript">';
 echo '  parent.document.getElementById("'.$callback.'").value = "'.$clnid.'";';
 echo '</script>';
 tde();
 if ($clt != "-1" && $clt != "0" && $clt != "") {
   $clusters = createNameValueArray("cluster_node", "NAME", "CLNID", "CLT_ID = $clt AND VERSION=0 AND DELETED=0");
   tr();
   td($style);
   echo $lang->get("sel_cluster", "Select Cluster")." (".(count($clusters)-1).")";
   tde();
   tr();
   $sb2 = new Dropdown("clnid", $clusters, $style, $clnid, $width);
   $sb2->params = 'onChange="'.drawIfoSave($callback, "clnid").'"';
   $sb2->draw(); 
   
 }
 */
 echo $errros;
 drawIFOFooter();
 ?>