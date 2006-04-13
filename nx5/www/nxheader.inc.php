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
	 
	 if (!isset($page))
	    $page = value("page", "NUMERIC",$c["startepageid"]);	    
	 if (!isset($v))
	   $v = value("variation", "NUMERIC", $c["stdvariation"]);
	 
	 if ($c["pagetracking"]  && ! $c["usewebbug"]) {
	    include_once $c["path"].'modules/stats/phpOpenTracker.php';
	    @phpOpenTracker::log(array('document' => $page));	
	 }
	 require_once $c["path"]."ext/jpcache/jpcache.php";
	 require_once $c["path"]."api/cds/lib.inc.php";
	 includePGNISources();
	
	 $cds = new CDSApi(false, $page, $v);
?>