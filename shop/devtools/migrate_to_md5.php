<?
	require_once "config.inc.php";

	$sql = "SELECT DECODE(PASSWORD, \"" . $c["dbcode"] . "\") as pw, USER_ID FROM users WHERE 1";
	$query = new query($db, $sql);

	while ($query->getrow()) {
		$pw = md5($query->field("pw"));

		$uid = $query->field("USER_ID");
		$sql = "UPDATE users SET PASSWORD='$pw' WHERE USER_ID = $uid";
		$q2 = new query($db, $sql);
	}
?>