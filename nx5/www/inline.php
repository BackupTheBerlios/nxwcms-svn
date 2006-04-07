<?PHP  
  require_once "nxheader.inc.php";
  $cds->layout->addStyleSheet("css/styles.css");
  $cds->layout->htmlHeader(); 
  include "modules/siteheader.php";
  $headline = $cds->content->get("Headline");
  $body = $cds->content->get("Body");
  
  if ($headline != "") {
    echo $headline;
    br();
    br();
  }
  
  if ($body !="") {
  	echo $cds->content->get("Body");
  }
 
  br();
  echo '<iframe  frameborder="0" width="100%" height="70%" src="'.$cds->content->get("Address").'"></iframe>';
   
  include "modules/sitefooter.php";
  require_once "nxfooter.inc.php";
?>