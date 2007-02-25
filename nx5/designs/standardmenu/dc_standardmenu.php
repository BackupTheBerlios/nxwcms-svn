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
		 *  Draw the Footer
		 *
		 */
		function getFooter() {
		  $out = "</td></tr></table>";
		  return $out;
		}

	/**
  	 * Draw the Header
  	 */
  	function getHeader() {
  	  // draw a table around the menu
  	  $out = '<table width="100%" border="0" cellpadding="0" cellspacing="0">';
  	  $out.= '<tr><td colspan="3" id="navheader">&nbsp;</td></tr>';
  	  $out.= '<tr><td valign="top" width="180" align="left" id="navbox">';
  		
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
			
			$this->prefix = '&rsaquo;'."&nbsp;";
			
			// Draw the menu
			//$out.= '<div id="navbox" align="left"><ul>';
			$out.='<ul>';
 			for ($i=0; $i < count($firstLevelMenues); $i++) {			
 				$title = $firstLevelMenues[$i]->getTitle();
 				$link  = $firstLevelMenues[$i]->getLink();
 				$isPopup = $firstLevelMenues[$i]->isPopup();
 				
 				// setup formating for active menu
 				$add="";
 				if ($firstLevelMenues[$i]->pageId == $topMenu->pageId) 
 				  $add = ' class="menuactive" ';
 				
 				// build a-tag
 				
 				$tag = '<a '.$add.'href="'.$link.'" ';
 				if ($isPopup) {
 				  $tag.= ' target="_blank"'; 				  
 				} 				
 				$tag.='>'.$this->prefix.$title.'</a>'; 				
 				
 				
 				$out.= '<li>'.$tag;
 				
 				// draw submenu
 				if ($firstLevelMenues[$i]->pageId == $topMenu->pageId) {
 				  $out.='<ul>';
 				  $out.= $this->drawSubMenu($firstLevelMenues[$i], 1);
 				  $out.='</ul>';
 				 }
 				
 				 // close menu
 				 $out.="</li>";
 			}
			$out.='</ul>';
  			
			// close the menu cell and open the output cell.
			$out.='</td><td width="10">&nbsp;&nbsp;</td><td valign="top" style="padding-top:5px;">';
  	  return $out;
  	}
  	

		/**
		 * Draw a submenu
		 *
		 * @param object $startPage Menu-Object
		 * @param integer $level depth of menu
		 */
	function drawSubMenu($mainmenu, $level) {

	  $menues = $mainmenu->lowerLevel();  	 
  	  if (is_array($this->pathToRoot))
  	    $submenu = array_pop($this->pathToRoot);
  	    $activeSubmenu = $submenu->pageId;
		  
		$max = count($menues)-1;
  	    for ($i=0; $i < count($menues); $i++) {  	 
  	      $href    = $menues[$i]->getLink();
  	      $title   = $menues[$i]->getTitle();
  	      $isPopup = $menues[$i]->isPopup();
  	      $add = "";

  	      if ($i == $max) {
  	      	$add2 = 'class="bottom"';
  	      }
  	      if ( $activeSubmenu == $menues[$i]->pageId)
  	    	$add = 'class="menuactive"';
  	    	// inaktives Submenu

  	      $out.= '<li '.$add2.'>';
  	      $out.= '<a '.$add.' href="' . $href . '"';
  	      if ($isPopup)
  	    	  $out.=' target="_blank"';
  	      $out.=' '.$add.'>';
  	      $out.= $this->prefix.$title;
  	      $out.= '</a>';
  	      if ($activeSubmenu == $menues[$i]->pageId && $level < 3) {
  	    		$out.= '<ul>';
  	    		$out.= $this->drawSubMenu($menues[$i], $level+1);  	    		
  	    		$out.= '</ul>';
  	      }
  	      $out.= '</li>';	    	
  	    
		}
		return $out;
	 }
  	
  	
  	/**
  	 * Setup the CSS for the Tabmenu
  	 *
  	 * @param unknown_type $layout
  	 */
  	function setupPage(&$layout)	{
  			global $c; 
  			$tag = '<link href="'.$layout->parent->docroot.'sys/designs/menu/standardmenu/menu.css" rel="stylesheet" type="text/css" media="screen, projection, print">'; 			  			
			$layout->addToHeader($tag);
  	}
  	
  	
  	/**
  	 * Edit-Configuration for the Tab-Menu, esp. Colors.
  	 *
  	 * @param SettingsForm $settingsForm
  	 */
  	function editConfiguration(&$settingsForm) {
  	  global $lang;
		// @todo: Add hint to edit colors and with in css-files  
  	}
	}
?>