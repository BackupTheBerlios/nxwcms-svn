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

	class DropdownMenu extends AbstractDesign {
		
		var $pathToRoot;
		
		/**
		 * Returns the name and the description of the DesignClass for Backoffice adjustments.
		 *
		 * @return string
		 */
		function getName() {
			return "DropdownMenu";
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

  	  $out = '<div id="menuleft">&nbsp;</div><div id="menu">';
  	  for ($i=0; $i<count($firstLevelMenues); $i++) {
  	  	$out.='<ul>'.$this->drawMenu($firstLevelMenues[$i]).'</ul>';
  	  }
  	  $out.='</div><div id="menuright">&nbsp;</div>';
  	  return $out;
  	}
  	

  /**
   * Draw menustructure
   *
   * @param menuObject $menuObject
   */
  function drawMenu($menuObject) {
    $title = $menuObject->getTitle();
 	$link  = $menuObject->getLink();
 	$isPopup = $menuObject->isPopup();
				 				
  	$out = '<li>';
    $out.= '<a '.$add.'href="'.$link.'" ';
 	if ($isPopup) {
 	  $out.= ' target="_blank"'; 				  
 	} 				
 	$out.='>'.$title.'</a>'; 		
    $lowerLevel = $menuObject->lowerLevel();
    if (count($lowerLevel) > 0) {
      $out.="\n".'<ul>';
      for ($i=0; $i<count($lowerLevel); $i++) {
        if ($lowerLevel[$i]->hasLowerLevel()) {      	  
        	$out.="\n".$this->drawMenu($lowerLevel[$i])."\n";    	
        } else {
          
          $title = $lowerLevel[$i]->getTitle();
 	      $link  = $lowerLevel[$i]->getLink();
 	      $isPopup = $lowerLevel[$i]->isPopup();
				 				
  		  $out.= '<li>';
    	  $out.= '<a href="'.$link.'" ';
 		  if ($isPopup) {
 	  			$out.= ' target="_blank"'; 				  
 		  } 				
 		  $out.='>'.$title.'</a></li>'."\n"; 		        	
        }
      }
      $out.='</ul>';
    }     
    $out.= "\n".'</li>'; 	
    return $out;						   	
   }
  	
  	/**
  	 * Setup the CSS for the Tabmenu
  	 *
  	 * @param unknown_type $layout
  	 */
  	function setupPage($layout)	{ 
  		global $cds; 						
  		$out = '
  		<style type="text/css"> 
#menu {
  padding-top:12px;
  padding-bottom: 22px;
  padding-left:5px;
  background-image:url(' .$cds->docroot. 'sys/designs/menu/dropdownmenu/menubg.gif);
  background-repeat:repeat-x;
  float: left;
  cursor:pointer;  
}
#menuleft {
 padding:0px;
 margin:0px;
 background-image:url(' .$cds->docroot. 'sys/designs/menu/dropdownmenu/menubgleft.gif);
 float:left;
 background-repeat:no-repeat;
 width:20px;
 height:50px;
}

#menuright {
 padding:0px;
 margin:0px;
 background-image:url(' .$cds->docroot. 'sys/designs/menu/dropdownmenu/menubgright.gif);
 float:left;
 background-repeat:no-repeat;
 width:20px;
 height:50px;
}

#menu ul {
  list-style: none;
  margin: 0;
  padding:2px;
  width: 130px;
  float: left;
  z-index:500;
}

#menu a, #menu h2 {
  font: 12px arial, helvetica, sans-serif;
  color: #999999
  display: block;
  border-width: 0px;
  border-style: solid;
  margin: 0;
  padding: 2px 3px;
}

#menu h2 {
  color: #999999;
}

#menu a {
  color: #999999;
  text-decoration: none;
}

#menu a:hover {
  color: #990000;
}

#menu li {position: relative;}

#menu ul ul {
  width:125px;
  background-color:#ffffff;
  color:#666666;
  border:1px #cccccc solid;
  position: relative;
  z-index: 500;
}

#menu ul ul a:hover {
  color:#990000;
}

#menu ul ul a {
  background-color:#ffffff;
  color:#999999;
  text-align:left;
}


#menu ul ul ul {
position: absolute;
top: 0;
left: 100%;
}

div#menu ul ul,
div#menu ul li:hover ul ul,
div#menu ul ul li:hover ul ul
{display: none;}

div#menu ul li:hover ul,
div#menu ul ul li:hover ul,
div#menu ul ul ul li:hover ul
{display: block;}

</style>
<!--[if IE]>
<style type="text/css" media="screen">
 #menu ul li {float: left; width: 100%;}
</style>
<![endif]-->
<!--[if lt IE 7]>
<style type="text/css" media="screen">
body {
  behavior: url(' .$cds->docroot. 'sys/designs/menu/dropdownmenu/csshover.htc);
}

#menu ul li a {height: 1%;} 

#menu a, #menu h2 {
font: 12px arial, helvetica, sans-serif;
}
</style>
<![endif]-->';
	
			$layout->addToHeader($out);
  	}
  	
	}
?>