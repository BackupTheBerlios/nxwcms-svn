<?PHP
  require_once "nxheader.inc.php";
  include $cds->path."inc/header.php";

  // Start of individual template
  echo $cds->content->get("Headline");
  br();
  echo $cds->content->get("Body");  
  
 
  include $cds->path."inc/footer.php";
  require_once "nxfooter.inc.php";
?>