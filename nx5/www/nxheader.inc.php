<?php
	/*
	 * Include this file in your page-templates
	 */
	 if (isset($c["path"])) {
	 	require_once $c["path"]."config.inc.php";
	 } else {
	   require_once "../cms/config.inc.php";
	 }
	 include_once $c["path"]."api/cds/track_exit_pages.php";
	 require_once $c["path"]."api/cds/lib.inc.php";
	
	 
	 // determine startpage and forward to startpage if no pageid isset.	 
	 if (!isset($page)) {
	    $page = value("page", "NUMERIC","0");  
	    if ($page == "0") { 		
	 			 $forward = getStartPageURI(0,10);	 			 
	 			 if ($forward != "") 
	 			   header("location: ".$forward); 
	    }    	
	 } 
	 
	 if (!isset($v))
	   $v = value("variation", "NUMERIC", $c["stdvariation"]);
	 
	 if ($c["pagetracking"]  && ! $c["usewebbug"]) {
	    include_once $c["path"].'modules/stats/phpOpenTracker.php';
	    @phpOpenTracker::log(array('document' => $page));	
	 }
	 require_once $c["path"]."ext/jpcache/jpcache.php";
	 includePGNISources();		
	 	 
	 $cds = new CDSApi(false, $page, $v);
	 	 
?>