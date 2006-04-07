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
  $faq = $cds->plugins->getApi("FAQ");
  $clusters = $faq->getClusterIds();
  
  $faqOutput = "";
  for ($i=0; $i < count($clusters); $i++) {
    $cluster = $cds->cluster->getById($clusters[$i]);	
    echo '<a href="#q'.$i.'"><li><b>'.$cluster->content->get("Question").'</b></li></a><br>';
    $faqOutput.='<a name="q'.$i.'"><b>'.$cluster->content->get("Question")."</b></a><br>";
    $faqOutput.=$cluster->content->get("Answer")."<br><br>";
  }  
  br();
  br();
  echo $faqOutput;
  
  include "modules/sitefooter.php";
  require_once "nxfooter.inc.php";
?>