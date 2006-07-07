<?
	/**
	 * @module Config
	 * @package Management
	 */
	startBenchmark();
    $c["staticMenues"] = false;
	// Anti-Cycle-List Array
	$acl = array ();

	/**
	if (ini_get("register_globals") == true) {
		echo "We are doing a refactoring of N/X at the moment. You need to turn register_globals off, to start the system.";

		echo "Please report any failures to sven@nxsystems.org!";
		exit();
	}
	*/
	
	// set variables that should not be parsed.
	$excludeFromIDS = array (
		"pgn_text_CONTENT",
		"pgn_cal_appointment_DESCRIPTION",
		"htxt_",
		"phpedit"
	);

	// running intrusion detection
	if (is_array($_GET))
		$_GET = securityIDS($_GET);

	if (is_array($_POST))
		$_POST = securityIDS($_POST);

	if (is_array($_COOKIE))
		$_COOKIE = securityIDS($_COOKIE);

	//if (is_array($_SERVER)) $_SERVER = securityIDS($_SERVER); 
	//if (is_array($_ENV)) $_SERVER = securityIDS($_ENV); 

		
	// setting version
	$nx_version = "4.5.0.45";
	// Global variables
	// database related
	$recordsets = null;
	$insertstatements = null;
	$updatestatements = null;
	$deletestatements = null;
	$rawstatements = null;
	$oids = null;
	$temp_oid = 0;
	$splevel = 0;
	$debug = false;  // show some sql statements
	$panic = false;  // show all sql in the page.

	$specialID = ""; // used to give form_fields special names as appendix.

	// page processing
	$errors = "";
	$formErrors = "";
	$page_state = "start";
	$page_action = "";

	if (value("processing") == "yes") {
		$page_state = "processing";
	}

	$go = value("go");
	$goon = value("goon");

	if ($go == "0")
		unset ($go);

	if ($goon != "0")
		$go = $goon;

	if (isset($go)) {
		if (strtoupper($go) == "CREATE")
			$page_action = "INSERT";

		if (strtoupper($go) == "UPDATE")
			$page_action = "UPDATE";
	}

	$delete = value("deletion");

	if ($delete != "0") {
		$page_action = "DELETE";

		$go = "DELETE";
	}

	$oid = value("oid", "NOSPACES");
	$sid = value("sid", "NOSPACES");

	if ($oid == "0") {
		$oid = "";
	} else {
		if ($oid < 1000) {
			// one may insert additional security checks here!
			}
	}

	$c["debug"] = false;
	
?>