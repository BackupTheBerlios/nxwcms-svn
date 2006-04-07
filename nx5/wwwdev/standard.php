<?PHP
  require_once "nxheader.inc.php";
  $cds->layout->addStyleSheet("css/styles.css");
  $cds->layout->htmlHeader(); 
  include "modules/siteheader.php";
  echo $cds->content->get("Headline");
  br();
  br();
  echo $cds->content->get("Body");
  
  include "modules/sitefooter.php";
  require_once "nxfooter.inc.php";
?>