<?PHP
  require_once "nxheader.inc.php";
  header('Location: ' . $cds->content->get("Address"));
  require_once "nxfooter.inc.php";
?>