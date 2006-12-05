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

	class NXMenu extends AbstractDesign {
		
		var $pathToRoot;
		var $prefix;
		
		/**
		 * Returns the name and the description of the DesignClass for Backoffice adjustments.
		 *
		 * @return string
		 */
		function getName() {
			return "N/X-Menu";
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
  	  	global $cds;
  		$out = '<table width="100%" border="0" cellpadding="0" cellspacing="0">';
  	  	$out.= '<tr><td width="318" height="180"><img src="'.$cds->docroot.'sys/designs/menu/nxmenu/logoplaceholder.jpg" alt=""></td>';
  	  	$out.= '<td valign="top">hallo</td></tr>'; 	
  	  	$out.= '</table>';
  	  	
		
  	  	// draw mainmenu
  	  	$out.= '<table width="990" border="0" cellpadding="0" cellspacing="0">';
  	  	$out.= '<tr>';
  	  	$out.= '<td width="200">'.drawSpacer(200,1).'</td>';
  	  	
  	  	// get the first menu level.
  	  	$startMenu = $this->cds->menu->getMenuByPath("/");  	  
        $firstLevelMenues = $startMenu->sameLevel();
        for ($i=0; $i< count($firstLevelMenues); $i++) {
          $out.= '<td class="mainmenu">';
          $title = $firstLevelMenues[$i]->getTitle();
 		  $link  = $firstLevelMenues[$i]->getLink();
 		  $isPopup = $firstLevelMenues[$i]->isPopup();
          $out.= '<a class="mainmenu" href="'.$link.'" ';
          if ($isPopup) $out.= 'target="_blank"';
          $out.= '><nobr>'.strtoupper($title).'</nobr></a>';                 
          $out.= '</td>'; 	       	
        } 	  
  	  	$out.= '<td width="40%" class="mainmenu">&nbsp;</td>';
        $out.= '</tr>';
  	  	$out.= '</table>';
  	  	$out.= '<br>';
  	  	
  	  	// submenu
  	  	$this->pathToRoot = $this->cds->menu->getPathToRoot();
  	  	$topMenu = array_pop($this->pathToRoot);
        if ($topMenu == null) $topMenu = $startMenu; 
  	  	$out.= '<table width="" cellpadding="0" cellspacing="0" border="0">';
  	  	$out.= '<tr><td width="180" height="400" class="cellsubmenu" valign="top">'; 	  	  	  	
  	  	$out.= '<table width="100%" border="0" cellpadding="0" cellspacing="1">';
  	  	// submenu malen.
  	  	$out.= $this->drawSubMenu($topMenu);
  	  	$out.= '</table>';
  	  	$out.= '</td><td>';
  	  		  	
  	  	 $out.= "</td></tr></table>";
  	  	return $out;
  	
    	}
  	

		/**
		 * Draw a submenu
		 *
		 * @param object $startPage Menu-Object
		 * @param integer $level depth of menu
		 */
	function drawSubMenu($mainmenu, $level=1) {
		
	  $menues = $mainmenu->lowerLevel();  	 
  	  if (is_array($this->pathToRoot))
  	    $submenu = array_pop($this->pathToRoot);
  	    $activeSubmenu = $submenu->pageId;
		  
		$max = count($menues)-1;
  	    for ($i=0; $i < count($menues); $i++) {  	 
  	      $href    = $menues[$i]->getLink();
  	      $title   = $menues[$i]->getTitle();
  	      $isPopup = $menues[$i]->isPopup();


		  $out.= '<tr><td class="submenu'.$level.'">';  	      
  	      $out.= '<a '.$add.' href="' . $href . '"';
  	      if ($isPopup)
  	    	  $out.=' target="_blank"';
  	      $out.=' '.$add.' class="submenu'.$level.'">';
  	      $out.= $this->prefix.$title;
  	      $out.= '</a>';

  	      if ($activeSubmenu == $menues[$i]->pageId && $level < 3) {	
  	    	 $out.= $this->drawSubMenu($menues[$i], $level+1);  	    		
  	      }
  	      $out.= '</td></tr>';	    	
  	    
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
  			$tag = '<link href="'.$layout->parent->docroot.'sys/designs/menu/nxmenu/menu.css" rel="stylesheet" type="text/css" media="screen, projection, print">'; 			  			
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