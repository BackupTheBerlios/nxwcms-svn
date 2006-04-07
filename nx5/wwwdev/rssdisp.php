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
  br();
  echo '<base target="_blank">';
  $rssReader = $cds->plugins->getApi("RSSReader");
   
  $feed = $rssReader->get($cds->content->get("Address"));
  for ($i=0; $i < count($feed["items"]); $i++) {
  	$item = $feed["items"][$i];
  	echo "\t<b><a href=\"".$item["link"]."\" target=\"_blank\">$item[title]</a></b>\n";
			$item["description"] = str_replace("&#60;", "<", $item["description"]);
			$item["description"] = str_replace("&#62;", ">", $item["description"]);
			$item["description"] = str_replace("&#34;", '"', $item["description"]);
			echo $item["description"]."<br><br><br>";
  }
  echo '</base>'; 
  include "modules/sitefooter.php";
  require_once "nxfooter.inc.php";
?>