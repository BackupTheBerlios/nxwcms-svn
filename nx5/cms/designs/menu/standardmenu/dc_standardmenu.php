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

	class StandardMenu extends AbstractDesign {
		
		var $pathToRoot;
		var $width="160";
		var $prefix;
		
		/**
		 * Returns the name and the description of the DesignClass for Backoffice adjustments.
		 *
		 * @return string
		 */
		function getName() {
			return "Standard-Menu";
		}
		
		/**
		 *  Draw the menu
		 *
		 */
		function getHeader() {
		  return $this->draw();
		}

	/**
  	 * Draw the tabbar.
  	 */
  	function draw() {
  	  // get the path of menues, e.g. if a thrid-level page is active you 
  	  // get the corresponding3rd/2nd/1st level menues
  	  
  	  $this->pathToRoot = $this->cds->menu->getPathToRoot();
  	  // get the actice toplevelmenu
	  // get the startpage
  	  $startMenu = $this->cds->menu->getMenuByPath("/");  	  
      // get the first menu level.
  	  $firstLevelMenues = $startMenu->sameLevel();

  	  $topMenu = array_pop($this->pathToRoot);
      if ($topMenu == null) $topMenu = $startMenu;
			
			$this->prefix = reg_load('CDS/MENU/PREFIX');
			
			// Draw the menu
			$out.= '<div id="navbox"><ul id="navigation">';
 			for ($i=0; $i < count($firstLevelMenues); $i++) {			
 				$title = $firstLevelMenues[$i]->getTitle();
 				$link  = $firstLevelMenues[$i]->getLink();
 				$isPopup = $firstLevelMenues[$i]->isPopup();
 				
 				// setup formating for active menu
 				$add="";
 				if ($firstLevelMenues[$i]->pageId == $topMenu->pageId) 
 				  $add = 'class="menuactive"';
 				
 				// build a-tag
 				
 				$tag = '<a href="'.$link.'" ';
 				if ($isPopup) {
 				  $tag.= ' target="_blank"'; 				  
 				} 				
 				$tag.=' '.$add.'>'.$this->prefix."&nbsp;".$title.'</a>'; 				
 				
 				
 				$out.= '<li>'.$tag.'</li>';
 				
 				// draw submenu
 				if ($firstLevelMenues[$i]->pageId == $topMenu->pageId) {
 				  $out.='</ul><ul id="subnavigation">';
 				  $out.= $this->drawSubMenu($firstLevelMenues[$i], "&nbsp;&nbsp;");
 				  $out.='</ul><ul id="navigation">';
 				 }
 			}
			$out.='</ul></div>';
  	
  	  return $out;
  	}
  	

		/**
		 * Draw a submenu
		 *
		 * @param integer $startPage Menu-Object
		 * @param string $prefix Prefix in menu
		 */
		function drawSubMenu($mainmenu, $prefix) {
  	  $menues = $mainmenu->lowerLevel();  	 
  	  if (is_array($this->pathToRoot))
  	    $submenu = array_pop($this->pathToRoot);
  	  $activeSubmenu = $submenu->pageId;
		  
		  for ($i=0; $i < count($menues); $i++) {  	 
  	    $href    = $menues[$i]->getLink();
  	    $title   = $menues[$i]->getTitle();
  	    $isPopup = $menues[$i]->isPopup();
  	  	
  	    
  	    $add = "";
  	    if ( $activeSubmenu == $menues[$i]->pageId)
  	    	$add = 'class="mnactive"';
  	    	// inaktives Submenu
  	    	$out.= '<li class="mnactive">';
  	    	$out.= '<a href="' . $href . '"';
  	    	if ($isPopup)
  	    	  $out.=' target="_blank"';
  	    	$out.=' '.$add.'>';
  	    	$out.= $title;
  	    	$out.= '</a>';
  	    	$out.= '</li>';	    	
  	    
			}
			return $out;
		}
  	
  	
  	/**
  	 * Setup the CSS for the Tabmenu
  	 *
  	 * @param unknown_type $layout
  	 */
  	function setupPage($layout)	{
  			global $c;
  			
  			$bg1  = reg_load('CDS/MENU/BG1');
  			$bg2  = reg_load('CDS/MENU/BG2');
  			$t1 = reg_load('CDS/MENU/TEXT1');
  			$t2 = reg_load('CDS/MENU/TEXT2');
  			$hbg = reg_load('CDS/MENU/HIGH2');
  			$ht = reg_load('CDS/MENU/HTEXT2');
  			$border = reg_load('CDS/MENU/BORDERC');  			
  			
			  $css = '<style type="text/css">' ."\n"
			  			.' div#navbox {margin:0;  padding:0; text-align:center; width: '.$this->width.'px; float:left;}'."\n"
							.' ul#navigation { float: left; width: '.$this->width.'px;  margin:0; padding: 0 0 0 0;  text-align:left;  border-top:1px dotted '.$border.';}'."\n"
							.' ul#navigation li { list-style: none;  margin: 0; padding: 0;  border-bottom:1px dotted '.$border.';}'."\n"
   						.' ul#navigation a { display: block;  padding: 0.2em;  padding-left: 7px; text-decoration:none;}'."\n"
							.' ul#navigation a:link { color: '.$t1.'; background-color: '.$bg1.';}'."\n"
							.' ul#navigation a:visited {color: '.$t1.'; background-color: '.$bg1.';}'."\n"
							.' ul#navigation a:hover { color: '.$ht.'; background-color: '.$hbg.';}'."\n"
							. 'ul#navigation a:active { color: '.$ht.'; background-color: '.$hbg.';}'."\n"
							.' ul#subnavigation { float: left; width: '.$this->width.'px;  margin:0; padding: 0 0 0 0;  text-align:left;  border-top:1px dotted '.$border.';}'."\n"
							.' ul#subnavigation li { list-style: none;  margin: 0; padding: 0;  border-bottom:1px dotted '.$border.';}'."\n"
   						.' ul#subnavigation a { display: block;  padding: 0.2em;  padding-left: 15px; text-decoration:none;}'."\n"
							.' ul#subnavigation a:link { color: '.$t2.'; background-color: '.$bg2.';}'."\n"
							.' ul#subnavigation a:visited {color: '.$t2.'; background-color: '.$bg2.';}'."\n"
							.' ul#subnavigation a:hover { color: '.$ht.'; background-color: '.$hbg.';}'."\n"
							.' ul#subnavigation a:active { color: '.$ht.'; background-color: '.$hbg.';} '."\n"
							.' .mnactive {color: '.$ht.'; background-color: '.$hbg.';}'."\n"
 		  			  .'</style>'."\n";
			$layout->addToHeader($css);
  	}
  	
  	
  	/**
  	 * Edit-Configuration for the Tab-Menu, esp. Colors.
  	 *
  	 * @param SettingsForm $settingsForm
  	 */
  	function editConfiguration(&$settingsForm) {
  	  global $lang;
  	  $settingsForm->addColorSetting($lang->get("bg1", "Mainmenu Background"), 'CDS/MENU/BG1', '#6699cc');
  	  $settingsForm->addColorSetting($lang->get("text1", "Mainmenu Text"), 'CDS/MENU/TEXT1', '#ffffff');
  	  $settingsForm->addColorSetting($lang->get("border", "Border"), 'CDS/MENU/BORDERC', '#ffffff');
  	  $settingsForm->addColorSetting($lang->get("bg2", "SubMenu Background"), 'CDS/MENU/BG2', '#cbe5ff');
  	  $settingsForm->addColorSetting($lang->get("text2", "SubMenu Text"), 'CDS/MENU/TEXT2', '#efefef');
  	  $settingsForm->addColorSetting($lang->get("hightxt2", "Highlight Text"), 'CDS/MENU/HTEXT2', '#6699cc');  	  
  	  $settingsForm->addColorSetting($lang->get("highl2", "Highlight Background"), 'CDS/MENU/HIGH2', '#ffffff');  	  
  	  $settingsForm->addTextSetting($lang->get("icon", "Menu Prefix"), 'CDS/MENU/PREFIX', '&gt; ');  	  
  	}
	}
?>