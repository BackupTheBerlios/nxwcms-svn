<?PHP
  require_once "nxheader.inc.php";
  $cds->layout->addStyleSheet("css/styles.css");
  $cds->layout->htmlHeader(); 
  include "modules/siteheader.php";

  echo $cds->content->get("Headline");
  br();
  br();
  echo $cds->content->get("Body");
  br();
  br();
  br();
  
  $childs = $cds->menu->lowerLevel();
  for ($i=0; $i < count($childs); $i++) {
    echo "<li>";
    echo $cds->layout->menu->getLink($childs[$i]);
    echo "</li>";  	  	
  }
 
 
  include "modules/sitefooter.php";
  require_once "nxfooter.inc.php";
?>