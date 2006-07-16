<?
 /**
  * CDS API
  * @package CDS
  */
  
/**********************************************************************
 *	N/X - Web Content Management System
 *	Copyright 2002 Sven Weih and Fabian Koenig
 *
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

 require_once $c["path"] . "api/tools/jpcache.php";

  /**
   * Base class for the oo CDS-API
   */
 class CDSApi extends AbstractCDSApi {
	
 	
 	var $pageId = 0; 	
	var $management = null;
	var $layout = null;
	var $menu = null;
	var $searchengine = NULL;
    var $plugins = NULL;
	
 	/**
 	 * Constructor for creating the CDS API interface
 	 * @param boolean Flag, if the CDS should get content from live-server or not
 	 * @param integer pageId of a page to set as start node
	 * @param integer Id of the variation to set as default
 	 */
	function CDSApi($is_development, $pageId=0, $variation=0) {
 		global $c;
				
		$this->is_development = $is_development;
		if (! $this->is_development) {
		    global $db;
		    $this->level = _LIVE;
		    $db->cache = true;
		}
 		
		($pageId==0) ? $this->pageId = value("page", "NUMERIC"): $this->pageId = $pageId;
		 ($variation==0) ? $this->variation = value("v", "NUMERIC"): $this->variation = $variation; 
		 if ($this->variation==0) {
		  	$this->variation = $c["stdvariation"];
		 }
		
		$this->management = new Management($this);	
		$this->messages = new Messages($this);		
		// Check PageId
		if ($this->pageId == "0" || $this->pageId == "") {
			$this->pageId = $this->management->getStartPage();				
		} else {			
			if ($this->management->isSPExpired($this->pageId))	{
				$this->messages->draw("pageExpired");
				
				// if the request to this expired page comes from our own host, we assume it comes from within our live site...
				if (stristr($_SERVER["HTTP_REFERER"], $c["host"])) {
					// so we'll clear the JPCache to make sure all pages get a new menu ;)
					clearJPCache();
					echo "<!-- JPCache has been cleared -->";
					// and we'll switch off jpcache for the moment to prevent this message from being cached :)
					global $JPCACHE_ON;
					$JPCACHE_ON = false;
				}
				exit;
			}
		}

 		AbstractCDSApi::AbstractCDSApi($is_development, $this->management->getClusterNodeFromPage($this->pageId), $this->variation);
 		$this->layout = new Layout($this);
 		$this->menu = new Menu($this);
 		$this->searchengine = new CDSSearchengine();
        $this->plugins = new CDSPlugins();
 	}
 	
 		/**
	 	 * Return a CDSApi-Object
 	 	 * @param boolean Flag, if the CDS should get content from live-server or not
		 * @param integer pageId of a page to set as start node
		 * @param integer Id of the variation to set as default
		 */
		 function createInstance($is_development, $pageId, $variation) {
		 		return new CDSApi($is_development, $pageId, $variation);
		 }
 			
		/**
		 * Returns a CDS-object with the page corresponding to the path
		 * @param string Path to query for a new menu-object. format "/page1/page2/page3"
		 */
		function getPageByPath($path="/") {
			$liste = explode("/", strtoupper($path));
			if ($path == "/" || $path=="") {
				$management = new Management($this);
				$page = $management->getStartPage($this->variation);	
			} else {
				if ($this->level != 0) {
			    	$page = getDBCell("state_translation", "OUT_ID", "IN_ID=0 AND LEVEL=".$this->level);
		    	} else {
				    $page = 0;
			    }
			
		    	for ($i = 1; $i < count($liste); $i++) {
			    	if ($page == "")
				    	$page = 0;

			    	if ($liste[$i] != "") 
				    	$page = getDBCell("sitemap", "MENU_ID", "PARENT_ID=$page AND UPPER(NAME)='" . $liste[$i] . "'");
				    }   
			    if ($page != "") 
				    $page = getDBCell("sitepage", "SPID", "MENU_ID=$page AND DELETED=0");
			}
	
		    if ($page == "") $page = getDBCell("state_translation", "OUT_ID", "IN_ID=0 AND LEVEL=".$this->level);	
		    return $this->createInstance($this->is_development, $page, $this->variation);
		}
		
		/**
		 * Returns a CDS-object with the page corresponding to the pageId
		 * @param integer PageID, you want to set as menu start node.
		 */
		function getPageById($pageId) {												
			if (countRows("sitepage", "SPID", "SPID=$pageId") < 1) {
				echo countRows("sitepage", "SPID", "SPID=$pageId");
				return null;				
			} else {				
			  return $this->createInstance($this->is_development, $pageId, $this->variation);
			}  
		}
		
	/**
	 * Use this function for directly referencing a sitepage you know the name of.
	 * Works relative to current page
	 * @param string		Name of the Sitepage
	 */
	function getPageRelative($pagename) {
		$pagename = strtoupper($pagename);
		$menuId = getDBCell("sitepage", "MENU_ID", "SPID=" . $this->pageId);
		$id = getDBCell("sitemap", "MENU_ID", "PARENT_ID = $menuId AND UPPER(NAME) = '" . $pagename . "'");
		$pageId = getDBCell("sitepage", "SPID", "MENU_ID = $id");
		return $this->createInstance($this->is_development, $pageId, $this->variation);
	}
	
	/**
	 * Returns the URI of the current page with querystring
	 */
	 function getPageURI() {
	   return $_SERVER['REQUEST_URI'];	
	 }
	 
	/**
	 * Return the URL of the current page (witout querysting)
	 */
	 function getPageURL() {
	 	return $_SERVER['SCRIPT_NAME'];
	 }
			
 }
 
?>