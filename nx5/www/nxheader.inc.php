<?php
	/*
	 * Include this file in your page-templates
	 */

	 require_once "../cms/config.inc.php";
	 include_once $c["path"]."api/cds/track_exit_pages.php";
	 
	 if ($c["pagetracking"]  && ! $c["usewebbug"]) {
	    include_once $c["path"].'modules/stats/phpOpenTracker.php';
	    $page = value("page", "NUMERIC",$c["startepageid"]);	    
	    @phpOpenTracker::log(array('document' => $page));	
	 }
	 require_once $c["path"]."ext/jpcache/jpcache.php";
	 require_once $c["path"]."api/cds/lib.inc.php";
	 includePGNISources();
	
	 $cds = new CDSApi(false);
?>