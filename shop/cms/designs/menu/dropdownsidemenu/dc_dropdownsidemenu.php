<?php
	/**********************************************************************
	 *	N/X - Web Content Management System
	 *	Copyright 2002- 2006 Sven Weih, FZI Research Center for Information Technologies
	 *	www.fzi.de
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

	class DropdownSideMenu extends AbstractDesign {
		
		var $pathToRoot;
		var $pathToRootIds;
		var $themeName;
		var $activeMenuId;
		var $sideMenu;

		/**
		 * Returns the name and the description of the DesignClass for Backoffice adjustments.
		 *
		 * @return string
		 */
		function getName() {
			return "DropdownSideMenu";
		}
		
		/**
		 *  Draw the menu
		 *
		 */
		function getFooter() {
		  $out = '</td></tr></table></div>';
		  return $out;
		}

	/**
  	 * Draw the menu.
  	 */
  	function getHeader() {
  	  global $cds;  	  
  	  
  	  // get the path of menues, e.g. if a thrid-level page is active you 
  	  // get the corresponding3rd/2nd/1st level menues
  	    	  
  	  $this->pathToRoot = $this->cds->menu->getPathToRoot();  	   
  	  // get the ids of the menuobjects
  	  $this->pathToRootIds = array();
  	  for ($i=0; $i<count($this->pathToRoot); $i++) {
  	    array_push($this->pathToRootIds, $this->pathToRoot[$i]->menuId);	
  	  }
  	  
  	  // get the actice toplevelmenu
	  // get the startpage
  	  $startMenu = $this->cds->menu->getMenuByPath("/");  	  
      // get the first menu level.
  	  $firstLevelMenues = $startMenu->sameLevel();

  	  $topMenu = array_pop($this->pathToRoot);
      if ($topMenu == null) $topMenu = $startMenu;
       
      $out= '<div id="mainmenu"><div id="mainmenuleft"></div><div id="mainmenucenter">';
      $out.= "
	  <SCRIPT type='text/javascript'>
		var dsMenu =
		[";
    
 	 
  	  for ($i=0; $i<count($firstLevelMenues); $i++) {
			$out.=$this->drawMenu($firstLevelMenues[$i]); 	
			if (($i+1) < count($firstLevelMenues))  	  	
			  $out.=',';
  	  }
  	  $out.=']; </SCRIPT><DIV ID="dsMenu"></DIV>

	<SCRIPT type="text/javascript">cmDraw ("dsMenu", dsMenu, "hbr", cmTheme'.$this->themeName.', "Theme'.$this->themeName.'");</SCRIPT>';
    $out.= '</div><div id="mainmenuright"></div></div>';
    $out.= '<br/>';
    $out.= '<div style="display:block;clear:both;">';
    $out.= '<table width="100%" border="0" cellpadding="0" cellspacing="0">';
    $out.= '<tr><td valign="top" width="150">';
    $out.= $this->getSideMenu();
    $out.= '</td><td width="20">&nbsp;</td><td valign="top">';
  	return $out;
  	}
  	

  /**
   * Draw menustructure
   *
   * @param menuObject $menuObject
   */
  function drawMenu($menuObject, $level=0) {
    $title = $menuObject->getTitle();
 	  $link  = $menuObject->getLink();
 	  $isPopup = $menuObject->isPopup();
	
 	if ($isPopup)  {
		$target = "'_blank'";
	} else {
		$target="null";
	}
  	$out = "['', '$title', '$link', $target, ''";
  	
  	if ($level<1) {
  	   $out.=',';
  		$lowerLevels = $menuObject->lowerLevel();
  	   for ($i=0; $i<count($lowerLevels); $i++)	{  	   	
  	   	 $out.=$this->drawMenu($lowerLevels[$i], $level+1); 	
		 if (($i+1) < count($lowerLevels))  	  	
		   $out.=',';
  	   }
  	} else if ((in_array($menuObject->menuId, $this->pathToRootIds) && ($menuObject->hasLowerLevel()))) {
  		  $this->sideMenu = $menuObject->lowerLevel();
  	}
  	
  	$out.= "]";
	
    return $out;						   	
   }
   
   
   /**
    *  Get the HTML for the sidemenu.
    */
   function getSideMenu() {
   	 $out = "Sidemenu.";
   	 return $out;
   }
  	
  	/**
  	 * Setup the CSS for the Tabmenu
  	 *
  	 * @param unknown_type $layout
  	 */
  	function setupPage($layout)	{ 
  		global $cds; 						
  		$this->themeName = 'NX';
  		$out = '<SCRIPT type="text/javascript" LANGUAGE="JavaScript" SRC="'.$layout->parent->docroot.'sys/designs/menu/dropdownmenu/JSCookMenu.js"></SCRIPT>
<LINK REL="stylesheet" HREF="'.$layout->parent->docroot.'sys/designs/menu/dropdownmenu/Theme'.$this->themeName.'/theme.css" TYPE="text/css"/>
<SCRIPT LANGUAGE="JavaScript" type="text/javascript" SRC="'.$layout->parent->docroot.'sys/designs/menu/dropdownmenu/Theme'.$this->themeName.'/theme.js"></SCRIPT>  		
  		';
  		$layout->addToHeader($out);
  	}
  	
	}
?>