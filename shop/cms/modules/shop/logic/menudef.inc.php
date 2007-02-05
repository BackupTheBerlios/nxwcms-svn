<?php
  $shopmenu = new StdMenu($lang->get("config_shop", "Configure Shop"));
  $shopmenu->addMenuEntry($lang->get("catalog", "Catalog"), "overview.php", "PRODADM");
  $shopmenu->addMenuEntry($lang->get("taxes", "Tax Setup"), "tax.php", "SHOPADM");
  $shopmenu->addMenuEntry($lang->get("configurator", "Configurator Setup"), "configurator.php", "SHOPADM");
  $page->addMenu($shopmenu);
?>