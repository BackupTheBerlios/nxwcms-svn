<?
	/**
	 * Menu Layout Help functions
	 * @package CDS
	 */
	 
	/**********************************************************************
	 *	N/X - Web Content Management System
	 *	Copyright 2003 Sven Weih
	 *	This file is part of N/X.
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
	
	 /**
	  * This class contains functions for drawing menus. It is thought to help
	  * you when programming sites.
	  * Access this class with $cds->layout->menu
	  */
	 class MenuLayout {
		var $parent;
		
		/**
		* Standard constructor.
		*/
		function MenuLayout(&$parent) { 
			$this->parent = &$parent; 
		
		}
	 
	 
	 	/**
	 	 * Draw a Breadcrumb.
	 	 * The functions assigns the css-class breadcrumb to each link on default.
	 	 * @param menu-object which is start-point for the breadcrumb. null for current page
	 	 * @param string delimiter between two links
	 	 * @param string CSS-Class to use for the links
	 	 * @param string Name of the Startpage.
	 	 */
		function breadcrumb($menu=null, $delimiter="&nbsp;&gt;&nbsp;", $css="breadcrumb", $home="Home" ) {
	 		global $cds;
	 		$result = "";
			if ($menu==null) $menu = $this->parent->menu;
			$start= new Menu(null, $this->parent->management->getStartPage(), $this->variation, $this->parent->level);
			
			foreach($menu->getPathToRoot() as $pos=>$object) {
				if ($start->pageId != $object->pageId)
				  $result = $delimiter.$this->getLinkIndividual($object->getLink(), $object->getTitle(), $css).$result;
	 		}	
	 				
	 		$result = $this->getLinkIndividual($cds->docroot, $home, $css).$result;
	 		return $result;
	 	}
	 	
	 	/**
	 	 * creates a link-tag
	 	 * @param string href of the link
	 	 * @param string text of the link
	 	 * @param string CSS-Class of the link
	 	 */
	 	 function getLinkIndividual($href, $text, $css="") {
	 	   $result = '<a href="' .$href. '"';
	 	   if ($css !="") $result.=' class="'.$css.'"';
	 	   $result.=">".$text."</a>";
	 	   return $result;	
	 	 }
	 	 
	 	 /**
	 	  * Creates a link Tag from a Menu Object
	 	  * @param mixed Menu Object
	 	  * @param string CSS-Stylesheet
	 	  */
	 	 function getLink($menuObject, $css="") {
	 	   $result = '<a href="' .$menuObject->getLink(). '"';
	 	   if ($css !="") $result.=' class="'.$css.'"';
	 	   if ($menuObject->isPopup()) $result.= ' target="_blank"';
	 	   $result.=">".$menuObject->getTitle()."</a>";
	 	   return $result;	
	 	 }
	 	
	 }
?>