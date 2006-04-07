<?PHP
  require_once "nxheader.inc.php";
  $cds->layout->addStyleSheet("css/styles.css");
  $cds->layout->setStandardSearchEngineCSS();
  $cds->layout->htmlHeader(); 
  include "modules/siteheader.php";

  echo $cds->content->get("Headline");
  
  
  // output of content
  $cds->searchengine->drawSearchForm();
  if (value("searchphrase") != "0") 
    $cds->searchengine->drawResultList($cds->searchengine->search(value("searchphrase")), $cds->content->get("No Results"));
  
  include "modules/sitefooter.php";
  require_once "nxfooter.inc.php";
?>