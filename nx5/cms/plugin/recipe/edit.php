<?php
    /**********************************************************************
     *    N/X - Web Content Management System
     *    Copyright 2002-2006 Sven Weih
     *
     *    This file is part of N/X.
     *    The initial has been setup as a small diploma thesis (Studienarbeit) at the FZI.
     *    It was be coached by Prof. Werner Zorn and Dipl.-Inform Thomas Gauweiler.
     *
     *    N/X is free software; you can redistribute it and/or modify
     *    it under the terms of the GNU General Public License as published by
     *    the Free Software Foundation; either version 2 of the License, or
     *    (at your option) any later version.
     *
     *    N/X is distributed in the hope that it will be useful,
     *    but WITHOUT ANY WARRANTY; without even the implied warranty of
     *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
     *    GNU General Public License for more details.
     *
     *    You should have received a copy of the GNU General Public License
     *    along with N/X; if not, write to the Free Software
     *    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
     **********************************************************************/

  require_once "../../config.inc.php";
  require_once "ingredient_editor.php";
  
  $auth = new auth("ADMINISTRATOR");
  $page = new Page("Edit Recipe");
  
  $form = new stdEDForm($lang->get("edrecipe", "Edit Recipe"));
  $cond = $form->setPK("pgn_recipes", "ID");
  
  $form->addHeaderLink(crHeaderLink($lang->get("back"), "plugin/recipe/overview.php?sid=".$sid));
  
  $form->add(new TextInput($lang->get("name", "NAME"), "pgn_recipes", "NAME", $cond, "type:text,size:64,width:200", "MANDATORY"));
  $form->add(new SubTitle("st", $lang->get("preparation", "Preparation"), 2));        
  $form->add(new RichEditInput($lang->get("description"), "pgn_recipes", "DESCRIPTION", $cond, "type:rich,width:350,size:6", ""));               
  $form->add(new TextInput($lang->get("preparation", "Preparation"), "pgn_recipes", "PREPARATION", $cond, "type:textarea,size:6,width:300", "")); 
  $form->add(new IngredientEditor("pgn_recipes", $cond));
  $page->add($form);
  $page->draw();
?>