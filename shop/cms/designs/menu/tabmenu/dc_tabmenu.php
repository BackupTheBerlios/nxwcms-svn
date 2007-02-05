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

	class Tabmenu extends AbstractDesign {
		
		var $pathToRoot;
		
		/**
		 * Returns the name and the description of the DesignClass for Backoffice adjustments.
		 *
		 * @return string
		 */
		function getName() {
			return "Tabmenu";
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

  	  $out = '';
  	  $out.= '<table cellpadding="0" width="100%" cellspacing="0" border="0">';
  	  $out.= '<tr>';
  	   for ($i=0; $i < count($firstLevelMenues); $i++) {
  	  	 $this->drawTab($firstLevelMenues[$i], $firstLevelMenues[$i]->pageId == $topMenu->pageId, $out);
  	  }
  	  $out.= '<td width="100%">&nbsp;</td>';
  	  $out.= '</tr>';
  	  $out.='</table>';	
  	  $out.= '<table border="0" align="center" width="100%" cellpadding="0" cellspacing="0" id="subTabs">';
  	  $out.= '<tr><td class=>';	  
  	  $this->drawSubTabs($topMenu, $out);  
      $out.='</td></tr></table><br/>';
  
  	  return $out;
  	}
  	
  	/**
  	 * Draw a single tab element
  	 *
  	 * @param integer $position Position of the tab in the menuarray
  	 * @param string $out String to add the tab.
  	 */
  	function drawTab($mainmenu, $active, &$out) {  	  
  	  $href = $mainmenu->getLink();
  	  $title   = $mainmenu->getTitle();  	  
  	  $isPopup = $mainmenu->isPopup(); 
  	  
  	  $onclick = "document.location.href='$href'"; 		
  	  
  	  if ($active) {
  	    // active tab	
  	    $out.= '<td nowrap class="activeTab">';
  	    $out.= '<div class="active1"><div class="active2"><div class="active3"></div></div></div>';
  	    $out.= '<div class="activeTabText">&nbsp;&nbsp;<a href="'.$href.'">';
  	    $out.= $title;
  	    $out.= '</a>&nbsp;&nbsp;</div>';
  	    $out.= '</td>';
  	  } else {
  	  	// inactive tab  	  	
  	  	$out.= '<td nowrap class="inactiveTab" onclick="'.$onclick.'">';
  	  	$out.= '<div class="inactive1"><div class="inactive2"><div class="inactive3"></div></div></div>';
  	    $out.= '<div class="inactiveTabText">&nbsp;&nbsp;<a href="'.$href.'" >';
  	    $out.= $title;
  	    $out.= '</a>&nbsp;&nbsp;</div>';
  	    $out.= '</td>';  	    
  	  }  	  
  	  $out.= '<td>&nbsp;&nbsp;</td>';
  	}
  	
  	/**
  	 * Draw the submenu
  	 *
  	 * @param string $out String where to add the menu
  	 */
  	function drawSubTabs($mainmenu, &$out) {  	   
  	  $menues = $mainmenu->lowerLevel();  	 
  	  if (is_array($this->pathToRoot))
  	    $submenu = array_pop($this->pathToRoot);
  	  $activeSubmenu = $submenu->pageId;
  	  
  	  for ($i=0; $i < count($menues); $i++) {  	 
  	    $href    = $menues[$i]->getLink();
  	    $title   = $menues[$i]->getTitle();
  	    $isPopup = $menues[$i]->isPopup();
  	  	
  	    if ( $activeSubmenu == $menues[$i]->pageId) {
  	    	// aktives Submenu
  	    	$out.= '<span class="activeText">';
  	    	$out.= $title;
  	    	$out.= '</span>';
  	    } else {
  	    	// inaktives Submenu
  	    	$out.= '<span class="inactiveText">';
  	    	$out.= '<a href="' . $href . '"';
  	    	if ($isPopup)
  	    	  $out.=' target="_blank"';
  	    	$out.='>';
  	    	$out.= $title;
  	    	$out.= '</a>';
  	    	$out.= '</span>';	    	
  	    }
  	    if ($i < count($menues)-1) 
  	      $out.= ' | ';
  	  }    	
  	} 
  	
  	
  	/**
  	 * Setup the CSS for the Tabmenu
  	 *
  	 * @param unknown_type $layout
  	 */
  	function setupPage(&$layout)	{
  			global $c;
  			
  			$acb  = reg_load('CDS/MENU/COLORACTIVE');
  			$act  = reg_load('CDS/MENU/COLORTACTIVE');
  			$acst = reg_load('CDS/MENU/COLORSTACTIVE');
  			$ict  = reg_load('CDS/MENU/COLORTINACTIVE');
  			$icb  = reg_load('CDS/MENU/COLORINACTIVE');
  			
			$css = '<style type="text/css">
			div.active1 {
				height: 4px;
				background: url(' . $c["docroot"] . '/img/alb.gif) no-repeat top left;
			}

			div.active2 {
				height: 4px;
				background: url(' . $c["docroot"] . '/img/arb.gif) no-repeat top right;
				padding: 1px 6px;
			}
						
			
			div.inactive1 {
				height: 4px;
				background: url(' . $c["docroot"] . '/img/ilb.gif) no-repeat top left;
			}

			div.inactive2 {
				height: 4px;
				background: url(' . $c["docroot"] . '/img/irb.gif) no-repeat top right;
				padding: 0 4px;
			}
			
			td.activeTab, td.inactiveTab {
  				text-align:middle;
  				text-align:top;
  				color:'.$ict.';
			}

			td.activeTab {
  				font-weight:bold;
  				color:'.$act.';
  				background-color:'.$acb.';
			}

			td.inactiveTab {
  				background-color:'.$icb.';
  				color:'.$ict.';
  				cursor: pointer;
			}

			div.inactive3 {
				  border-top: 1px solid #cccccc;
			}

			div.inactiveTabText {
  				border-left: 1px solid #cccccc;
  				border-right: 1px solid #cccccc;
  				padding: 0px 1em 2px;
  				color: blue;
  				white-space: nowrap;
			}

			div.inactiveTabText a, div.inactiveTabText a:visisted {
  				text-decoration: none;
  				color: '.$ict.';
			}


			div.activeTabText a, div.activeTabText a:visited {
  				padding: 0px 0px 2px;
  				color: '.$act.';
  				white-space: nowrap;
  				text-decoration:none;
			}

			div.activeTabText {
  				border-left: 1px solid #cccccc;
  				border-right: 1px solid #cccccc;
  				padding: 0px 1em 2px;
  				color: '.$act.';
  				white-space: nowrap;
  				text-decoration:none;
			}


			#subtabs {
	  			background-color:#'.$acb.';
	  			height:4px;
	  			padding:1 4px;
			}

			#subTabs td {
  				color: #'.$ict.';
			    padding: 4px;
 			    padding-left:8px;
  				background: '.$acb.';
  				white-space: nowrap;
			}
	
			#subTabs span.activeText {
  				font-weight: bold;
  				color: '.$acst.';
  				display: inline;
			}

			#subTabs span.inactiveText {
  				color: '.$ict.';
  				margin: 0 1px;
  				display: inline;
  				text-decoration:none;
			}

			#subTabs span.inactiveText a {
  				color: #'.$ict.';
			}
			</style>';
			$layout->addToHeader($css);
  	}
  	
  	
  	/**
  	 * Edit-Configuration for the Tab-Menu, esp. Colors.
  	 *
  	 * @param SettingsForm $settingsForm
  	 */
  	function editConfiguration(&$settingsForm) {
  	  global $lang;
  	  $settingsForm->addColorSetting($lang->get("activeColor", "Active Background-Color"), 'CDS/MENU/COLORACTIVE', '#6699cc');
  	  $settingsForm->addColorSetting($lang->get("activeTColor", "Active Text-Color"), 'CDS/MENU/COLORTACTIVE', '#cbe5ff');
  	  $settingsForm->addColorSetting($lang->get("activeTSColor", "Active SubText-Color"), 'CDS/MENU/COLORSTACTIVE', '#ffffff');
  	  $settingsForm->addColorSetting($lang->get("inactiveColor", "Inactive Background-Color"), 'CDS/MENU/COLORINACTIVE', '#efefef');
  	  $settingsForm->addColorSetting($lang->get("inactiveTColor", "Inactive Text-Color"), 'CDS/MENU/COLORTINACTIVE', '#0000ff');
  	}
	}
?>