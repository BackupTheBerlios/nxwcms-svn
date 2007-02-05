<?php
	/**********************************************************************
	 *	N/X - Web Content Management System
	 *	Copyright 2002-2006 Sven Weih
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
	
	require_once "../../config.inc.php";

	$auth = new auth("SHOPADM");
	$page = new page("Tax configuration");
  include("logic/menudef.inc.php");		
	
	$filter = new Filter("shop_tax", "TAX_ID");
	$filter->addRule($lang->get("name"), "NAME", "NAME");
	$filter->type_name = $lang->get("tax", "Tax");
	$filtermenu = new Filtermenu($lang->get("tax"), $filter);
	
	$deleteHandler = new ActionHandler("Delete");
	$deleteHandler->addDBAction("Delete from shop_tax Where TAX_ID = <oid>");
	
	$form = new StdEDForm($lang->get("edit_tax", "Edit tax"));
	$cond = $form->setPK("shop_tax", "TAX_ID");
	$form->add(new TextInput($lang->get("name"), "shop_tax", "NAME", $cond, "type:text,width:300,size:128", "MANDATORY&UNIQUE"));
	$form->add(new TextInput($lang->get("percent", "Percent (%)"), "shop_tax", "PERCENT", $cond, "type:text,width:50,size:6", "NUMBER&MANDATORY"));
	$form->registerActionHandler($deleteHandler);
	 
	
	$page->addMenu($filtermenu);
	$page->add($form);
	$page->draw(); 
?>	 