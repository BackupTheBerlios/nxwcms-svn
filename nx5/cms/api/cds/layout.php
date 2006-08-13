<?
	
	/**
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
	 * This class paints the framework for a html-page
	 * Access this class with $cds->layout
	 */
	
	 class Layout {
		var $parent;
		var $pageTitle = 0;
		var $staticTitle = "";
		var $header = "";
		var $bodyAttributes = "";
		var $cssArray = array();
		var $jsArray = array();
		var $menu = null;
		var $dhtml = null;
		var $media = null;
		var $docType = '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">';
		var $contentType='text/html; charset=iso-8859-1';
		var $menuRef;
		
		/**
		* Standard constructor.
		*/
		function Layout(&$parent) { 
			global $c;
			$this->parent = &$parent; 
			$this->menu = new MenuLayout($this->parent);
			$this->dhtml = new DHTMLLayout($this->parent);
			$this->media = new MediaLayout($this->parent);
			if (!is_object($this->menuRef)) {
		   	   $menuType = reg_load('CDS/MENU');	
		   	   if ($menuType != "")	   	
		   	     $this->menuRef = createDCRef($c["path"]."designs/menu/".$menuType);
		    }
		   
		    if (is_object($this->menuRef))
		      $this->menuRef->setupPage($this);
		}
		
		/**
		 * Create an image-tag from image-array
		 * @param mixed ImageArray generated by plugins
		 * @param boolean display the thumbnail instead of image?
		 */
		function getImageTag($imageArray, $thumbnail=false) {
		  if ($thumbnail) {
		  	$result = '<img src="'.$imageArray["path"].'" border="0" width="'.$imageArray["width"].'" height="'.$imageArray["height"].'" alt="'.$imageArray["alt"].'"/>';
		  } else {
			$result = '<img src="'.$imageArray["tpath"].'" border="0" width="'.$imageArray["twidth"].'" height="'.$imageArray["theight"].'" alt="'.$imageArray["alt"].'"/>';
		  }
		  return $result;
		}
		
		/**
		 * Create a link from link-array
		 * @param mixed LinkArray generated by plugins
		 * @param string CSS-Class for link-Display
		 */
		function getLinkTag($linkArray, $cssClass="") {
			if ($cssClass != "") $cssClass=' class="'.$cssClass.'" ';
			$result = '<a href="'.$linkArray["HREF"].'" '.$cssClass.' target="'.$linkArray["TARGET"].'">'.$linkArray["LABEL"].'</a>';	
			return $result;
		}
		
		/**
		 * Return the N/X Logo for display on homepage
		 */
		function getNXLogo() {
			global $cds;
			$result = '<img src="'.$cds->docroot.'sys/nxpowered.gif" border="0" width="55" height="46">';
			$result = '<a href="http://www.nxsystems.org" target="_blank">'.$result."</a>";
			return $result;	
		}
			
		 
		/**
		 * Trim a text to a given size
		 * @param string $content to trim
		 * @param integer size
		 */
		function trimText($content, $size=150) {
			$content = strip_tags($content);
			if (strlen($content) > $size)
				$content = substr($content, 0, $size). " ...";	
			return $content;
		}
	       
	       /**
		* Draws a square for entering the editing mode of the Website
	 	*/
		function drawSMAEntry() {
			global $c;
			$out = '<a href="' . $c["docroot"] . 'modules/sma/sma.php?page=' . $this->parent->pageId . '&v=' . $this->parent->variation . '" target=_blank><img src="'.$c["devdocroot"].'sys/sma_start.gif" border="0" alt=""></a>';
			return $out;
		}
		
		/**
		 * Draws a spacer of width and height
		 * @param integer width
		 * @param integer height
		 */
		 function spacer($width, $height=1) {
		   global $c;
		   $out = '<img src="'.$this->parent->docroot.'images/ptrans.gif" border="0" alt="" width="'.$width.'" height="'.$height.'">';
		   return $out;
		 }
		
		/**
		 * Add a line to the header
		 * @param string Line you want to add
		 */
		 function addToHeader($line) {
			$this->header = $this->header . $line ."\n"; 	
		 }
		 
		 
		/**
		 * Add a static headline to the title of the page
		 * @param string Static title
		 */
		 function setStaticTitle($title) {
			$this->staticTitle = $title;
		 }
		 
		/**
		 * Overwrite automatic page-title generation with manual title.
		 * @param string page title
		 */
		 function setPageTitle($title) {
			$this->pageTitle = $title;
		 }
		 
		/**
		 * Set the DocumentType of the HTML-Page to generate.
		 * @param string DocumentType
		 */
		 function setDocType($doctype) {
			$this->docType = $doctype;
		 }

		 /**
		  * Add a stylesheets to the header. You can call this function as often you want.
		  * @param string Path to the CSS-Stylesheet
		  * @param string Mediatype of the CSS-Stylesheet. 
		  */
		  function addStyleSheet($css, $media="screen") {
		  	 array_push($this->cssArray, array("path"=> $css, "media" => $media));
		  }

		 /**
		  * Add a stylesheets to the header. You can call this function as often you want.
		  * @param string Path to the CSS-Stylesheet
		  */
		  function addJavascript($js) {
		  	 array_push($this->jsArray, $js);
		  }
		  
		  /**
		   * Add a link to an RSS feed, so that browsers automatically detect the RSS-Source
		   * @param link to the rss feed.
		   */
		  function addRSSFeed($link) {
		    $add = '<link rel="alternate" type="application/rss+xml" title="RSS" href="'.$link.'" />';			  
		    $this->header = $this->header."\n".$add;
		  }
		  
		/**
		 * Add attributes to body-tag
		 * @param string Line you want to add
		 */
		 function addToBodyAttributes($line) {
			$this->bodyAttributes = $this->bodyAttributes . $line ." "; 	
		 }
		 
		 
		 /**
		  * Draw the menu selected in designclasses.		  
		  */
		 function drawMenu() {
		 	$this->drawMenuHeader();
		 	$this->drawMenuFooter();		 	
		 }
		 
		 /**
		  * Draws the menuheader, use this instead of drawMenu for some special menus.
		  *
		  */
		 function drawMenuHeader() {
		    global $c;		 	
		    if (!is_object($this->menuRef)) {
		   	 $menuType = reg_load('CDS/MENU');		   	
		   	 if ($menuType != "") 
		   	   $this->menuRef = createDCRef($c["path"]."designs/menu/".$menuType);
		   }
		   echo $this->menuRef->getHeader();
		 }
		 
		 /**
		  * Draws the menu footer, use this instead of drawMenu for some special menus.
		  *
		  */
		 function drawMenuFooter() {
		 	global $c;
		 	if (!is_object($this->menuRef)) {
		   	 $menuType = reg_load('CDS/MENU');
		   	 if ($menuType != "")
		   	   $this->menuRef = createDCRef($c["path"]."designs/menu/".$menuType);
		   }
		   echo $this->menuRef->getFooter();
		 }
		 
		  
		/**
		  * Draw a header for the HTML-Page
		  */
		 function htmlHeader() {
		 	global $cds;
		 	echo $this->docType."\n";
		 	echo "<html>\n";
		 	echo "<head>\n";
		 	if ($this->pageTitle) {
		 		echo "<title>".$this->pageTitle."</title>\n";
		 	} else {
		 		echo "<title>".$this->staticTitle.$this->parent->menu->getTitle()."</title>\n";
		 	}
		 	
		 	// write meta-data
		 	echo '  <meta http-equiv="Content-Type" content="'.$this->contentType.'"/>'."\n";
			echo '  <meta name="generator" content="N/X WCMS 2004 - www.nxsystems.org"/>'."\n";
			echo '  <meta name="date" content = "'. gmdate("Y-m-d H:i:s") .'"/>'."\n";
			echo '  <meta name="keywords" content = "'.$this->parent->meta->get("Keywords").'"/>'."\n";
			echo '  <meta name="description" content = "'.$this->parent->meta->get("Description").'"/>'."\n";
			echo '  <meta name="revisit-after" content="7 days"/>'."\n";
			echo '  <meta name="robots" content="follow,index"/>'."\n";		 			 	
		 	
			// add css
			for ($i=0; $i<count($this->cssArray); $i++) {
		 		echo '  <link href="'.$cds->docroot.$this->cssArray[$i]["path"].'" media="'.$this->cssArray[$i]["media"].'" rel="stylesheet" type="text/css"/>'."\n";
		 	}
		 	
		 	// add js
		 	for ($i=0; $i<count($this->jsArray); $i++) {
		 		echo '  <script language="javascript" type="text/javascript" src="'.$cds->docroot.$this->jsArray[$i].'"></script>'."\n";
		 	}
		 	
			echo $this->header;
			echo "</head>\n";
		 	echo "<body ".$this->bodyAttributes.">\n";
		 }
		
		 /**
		  * Add CSS for Search-Engine
		  */
		  function setStandardSearchEngineCSS() {
		    $css = '<style type="text/css">'."\n";
		    $css.= '  .searchinformation { color: #008000; }'."\n";
		    $css.= '  .searchtext { color: black; }'."\n";
		    $css.= '  .phpdig {color: #0000cc; }'."\n";
		    $css.= '  .phpdigHighlight { font-weight:bolder; }'."\n";
		    $css.= '</style>'."\n";
		    $this->addToHeader($css);	
		  }
		
		 /**
		  * Draw a footer for the HTML-Page
		  */
		 function htmlFooter() {
		 	global $db, $c;
		 	if ($c["pagetracking"] && $this->parent->level==10) {
			  if ($c["usewebbug"]) {
			    echo "<img src=\"" . $c["livedocroot"] . "sys/image.php?document=".$this->parent->pageId."\" width=\"1\" height=\"1\">";			  
			  }
		 	}
		 	echo "\n</body>\n";
		 	echo "</html>\n";
		 	$db->close();
		 }
	}
