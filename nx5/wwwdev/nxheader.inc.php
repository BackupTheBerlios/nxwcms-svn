<?php
	/*
	 * Include this file in your page-templates
	 */	 
	 if (!isset($c)) require_once "../cms/config.inc.php";
	 require_once $c["path"]."api/cds/lib.inc.php";
	 includePGNISources();

	if (value("sma") == "1" || $sma == "1") {
		require_once $c["path"] . "api/auth/auth_sma.php";
		require_once $c["path"]."api/common/lang.php";		
		$sma=1;
		$auth = new authSMA("B_LIVE_AUTHORING");
		$sid = $_COOKIE["sid"];
		if ($sid != "" && !is_numeric($sid))
			$sid = "";
		$cds = new SMA_CDSApi(true);
	} else {
 		$cds = new CDSApi(true);
	}
?>