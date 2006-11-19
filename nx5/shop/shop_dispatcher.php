<?php
/**********************************************************************
 *	N/X - Web Content Management System
 *	Copyright 2002-2006 Sven Weih
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


// Purpose of this script:
//
// Central dispatcher of the shoppings system. This class analyses the given GET and POST parameters and
// decides, which method are to be called to draw the page.


/**
 * This class analyses the given GET and POST parameters and
 * decides, which method are to be called to draw the page.
 *
 */
class ShopDispatcher {
	
	var $action;
	var $categoryId;
	var $categoryObject;
	var $productId;
	var $productObject;	
	var $storedProductObjectId;
	var $handlers;
	var $registered;
	
	/**
	 * Constructor of the central shopping dispatching unit.
	 * This class analyses the given GET and POST parameters and
 	 * decides, which method are to be called to draw the page.
	 * 
	 * Calling the initialization of the POST and GET-Values.
	 *
	 * @return ShopDispatcher
	 */
	function ShopDispatcher() {
		$this->_initialize();
	}
	
	
	
	/**
	 * Return the content-object (cluster) of the category which is set.
	 *
	 * @param boolean $forceReload Forces to reload the object completely. Useful if you changed the category Id of the dispatcher
	 * @return Cluster Object with the defined contents of a category.
	 */
	function getCategoryObject($forceReload = false) {
	  global $cds;
	  if (($this->categoryObject == null) || $forceReload) {
	  	$clnid = getClusterNodeIdFromCategoryId($this->categoryId);
	  	$this->categoryObject = $cds->cluster->getById($clnid);	  	
	  }
	  return $this->categoryObject;
	}
	
	/**
	 * Return the content-object (cluster) of the product.
	 *
	 */
	function getProductObject() {
	  global $cds;
	  if (($this->productObject == null) || ($this->productId != $this->storedProductObjectId)) {
	  	$clnid = getClusterNodeIdFromProductId($this->productId);
	  	$this->productObject = $cds->cluster->getById($clnid);
	  	$this->storedProductObjectId = $this->productId;
	  }
	  return $this->productObject;
	}
	
	
	/**
	 * Return the logical product name (product code)
	 *
	 */
	function getProductName() {
		return getDBCell('shop_prodcuts', 'PRODUCT_CODE', 'PRODUCT_ID='.$this->productId);
	}
	
	/**
	 * Return the name of a category.
	 *	 
	 */
	function getCategoryName() {
		return getDBCell("categories", "CATEGORY_NAME", "CATEGORY_ID=".$this->categoryId);
	}
	
	/**
	 * Create a URL which can be used to link to products and categories with a given action
	 *
	 * @param string $action Action-handler that will be called, if a user clicks on the url. e.g. draw_product_details.
	 * @return unknown
	 */
	 function getShopURL($action="") {
		global $cds;
		$url = $cds->docroot;
		$url.= 'shop.php?do='.$action;
		if ($this->productId != 0) $url.="&amp;product=".$this->productId;
		if ($this->categoryId != 0) $url.="&amp;category=".$this->categoryId;
		return $url;
	}
	
	
	/**
	 * Heart of the dispatcher. Analyses the given paramters and 
	 * calls the draw-functions. You can optionally pass an do-job
	 * to make the dispatcher running a given action
	 * 
	 * @param string $certainAction Make the dispatcher running a certain action and forbid make use of the automatic default handling.
	 * 
	 */
	function execute($certainAction="") {
	  global $cds;
	  $this->_registerDefaultHandlers();
	  $executed = false; 
	  // set action
	  if ($certainAction == "") {	  	
	  	$action = $this->action;
	  } else {	  	
	  	$action = $certainAction;
	  }

	  // try to find an action and run it.
	  for ($i=0; $i<count($this->handlers); $i++) {
	  	if ($action == $this->handlers[$i][0]) {
	  		eval($this->handlers[$i][1].'($this);');
	    	$executed = true;
	    	break;
	    }
	  }
	  // fallback.
	  if (!$executed) $this->defaultHandler();
	}
	
		
	
	/**
	 * Fallback handler, which defines what is to be done, if no action
	 * or no registered action is called by the script. You may edit this
	 * handler for your requirements.
	 *
	 */
	function defaultHandler() {
		
	}
	
	/**
	 * Register a action-name and a function-handler that will be called if the action is
	 * found. For example the shop is called by shop.php?do=print_product&product=10.
	 * You register the handler with ..('print_product', 'doPrintProduct') where 
	 * doPrintProduct is function doPrintProduct(&$shopDispatcher).
	 * 
	 *
	 * @param string $actionName Name of the action, which is called with the do=<actionname> parameter
	 * @param string $functionReference Name of a function, which will be called. The function must have the
	 * * the signature function <functionName>(&$shopDispatcher)
	 */
	function registerHandler($actionName, $functionReference) {
	  $this->handlers[]	= array($actionName, $functionReference);
	}
	
	
	/**
	 * Read all the handler_ - files in the handler dir and register the handlers.
	 *
	 */
	function _registerDefaultHandlers() {
	  global $c, $cds, $dispatcher;
	  if (! $this->registered) {
	  	$files = $this->_getFileList('handlers', 'handler_');
	  	for ($i=0; $i < count($files); $i++) {
		  	require_once($c["basepath"].'shop/handlers/'.$files[$i]);
		}
		$this->registered = true;
	  }
	}
	
	/**
	 * Read the GET- and POST-parameters.
	 * Set default values.
	 * Internally called only.
	 */
	function _initialize() {
		$this->action = strtolower(value("do"));
		$this->categoryId = value("category", "NUMERIC",0);
		$this->productId  = value("product", "NUMERIC",0);	
		$this->storedProductObjectId = 0;
		$this->registered = false;
		$this->handlers = array();	
		$this->categoryObject = null;
	}
	
	
	/**
	 * Read all the files in the specified directory, whicht start with a given prefix.
	 *
	 * @param string $subdirName Relative path of the subdir, which will be scanned. the path is relative to the shop-folder
	 * @param string $prefix     Prefix of the files, that will be scanned for.
	 * @return unknown
	 */
	function _getFileList($subdirName, $prefix) {
		global $c;
		$ret = array ();
		$dirhandle = opendir($c["basepath"].'shop/'.$subdirName);
		
		while (false !== ($fname = readdir ($dirhandle))):	 	  
		  if (! is_dir ($c["basepath"].'shop/'.$fname) && strtolower(substr($fname, 0, strlen($prefix))) == $prefix):
		    $ret[] = $fname;
		  endif;
		endwhile;
		
		closedir($dirhandle);
		return $ret;
	}
	
	
}



?>