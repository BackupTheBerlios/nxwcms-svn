<?PHP
  require_once "nxheader.inc.php";
  
  //extract the Link as array
  $link = $cds->content->get("URL", "ALL");
  
  // forward to the link
  header('Location: ' . $link["HREF"]);
  require_once "nxfooter.inc.php";
?>