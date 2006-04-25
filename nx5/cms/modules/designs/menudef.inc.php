<?php
  $menu = new StdMenu($lang->get("designs"));
  $menu->addMenuEntry($lang->get("menu_designs", "Menu Designs"), $c["docroot"].'modules/designs/overview.php');		
  $page->addMenu($menu);
?>