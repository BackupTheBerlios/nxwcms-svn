<?PHP
  require_once "nxheader.inc.php";
  $cds->layout->addStyleSheet("css/styles.css");
  $cds->layout->htmlHeader(); 
  include "modules/siteheader.php";

  echo $cds->content->get("Headline");
  br();
  br();
  br();
  echo '<table width="100%" border="0" cellpadding="0" cellspacing="0">';
  echo '<tr><td width="50%" valign="top">';
  // Article menu
  $articles = $cds->channel->get("Stage");
  $article = value("article", "NUMERIC", $articles[0]);
  for ($i=0; $i < count($articles); $i++) {  	
  	$arCluster = $cds->cluster->getById($articles[$i]);
  	if ($article == $articles[$i]) {
  		$style = ' style="font-weight:bold;" ';
  	} else {
  	    $style = '';	
  	}
  	echo '<a '.$style.' href="'.$cds->channel->getLink($articles[$i]).'">';
    echo $arCluster->channel->getArticleDate($articles[$i], '%d-%m-%Y').': '.$arCluster->content->get("Headline");	    
    echo '</a>';
    br();
  }
  
  echo '</td><td width="20">'.$cds->tools->spacer(20,1).'</td>';
  echo '<td width="50%" valign="top">';
  // Article
  echo $cds->cluster->draw($article);
  echo '</td></tr>';
  echo '</table>';
  
  include "modules/sitefooter.php";
  require_once "nxfooter.inc.php";
?>