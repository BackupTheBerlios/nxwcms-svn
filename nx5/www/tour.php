<?PHP
  require_once "nxheader.inc.php";
  $cds->layout->addStyleSheet("css/styles.css");
  $cds->layout->htmlHeader(); 
  include "modules/siteheader.php";

  echo $cds->content->get("Headline");
  br();
  br();
  
  $articles = $cds->channel->get("Stage"); 
  $article = value("article", "NUMERIC", $articles[0]);
  
  $position = 1;
  
  for ($i=0; $i < count($articles); $i++) {  	  	
  	if ($article == $articles[$i]) {
  		$position = $i + 1;
  	} 
  }
  
  if ($position == 0) {
  	$article = $articles[0];
  	$position = 1;
  }
  
  echo '<div align="center">'; 
  if ($position > 1) {
    echo '<a href="'.$cds->getPageURL().'?v='.$cds->variation.'&page='.$cds->pageId.'&article='.$articles[0].'">&lt;&lt;</a>';
    echo '&nbsp;&nbsp;';
    echo '<a href="'.$cds->getPageURL().'?v='.$cds->variation.'&page='.$cds->pageId.'&article='.$articles[$position-2].'">&lt;</a>';
    echo '&nbsp;&nbsp;';
  } else {
  	echo '&lt;&lt;';
    echo '&nbsp;&nbsp;';
    echo '&lt;';	
    echo '&nbsp;&nbsp;';
  }
  
  echo $position.'/'.count($articles);

  if ($position < count($articles)) {
    echo '&nbsp;&nbsp;';
    echo '<a href="'.$cds->getPageURL().'?v='.$cds->variation.'&page='.$cds->pageId.'&article='.$articles[$position].'">&gt;</a>';
    echo '&nbsp;&nbsp;';
    echo '<a href="'.$cds->getPageURL().'?v='.$cds->variation.'&page='.$cds->pageId.'&article='.$articles[count($articles)-1].'">&gt;&gt;</a>';
  } else {
  	echo '&nbsp;&nbsp;';
    echo '&gt;';
    echo '&nbsp;&nbsp;';
    echo '&gt;&gt;';  
  }
  echo '</div>';
  br();br();
  
  // Article
  echo $cds->cluster->draw($article);
  
  //code duplication. not the clean way.
  br(); br();
  echo '<div align="center">';
  
  if ($position > 1) {
    echo '<a href="'.$cds->getPageURL().'?v='.$cds->variation.'&page='.$cds->pageId.'&article='.$articles[0].'">&lt;&lt;</a>';
    echo '&nbsp;&nbsp;';
    echo '<a href="'.$cds->getPageURL().'?v='.$cds->variation.'&page='.$cds->pageId.'&article='.$articles[$position-2].'">&lt;</a>';
    echo '&nbsp;&nbsp;';
  } else {
  	echo '&lt;&lt;';
    echo '&nbsp;&nbsp;';
    echo '&lt;';	
    echo '&nbsp;&nbsp;';
  }
  
  echo $position.'/'.count($articles);

  if ($position < count($articles)) {
    echo '&nbsp;&nbsp;';
    echo '<a href="'.$cds->getPageURL().'?v='.$cds->variation.'&page='.$cds->pageId.'&article='.$articles[$position].'">&gt;</a>';
    echo '&nbsp;&nbsp;';
    echo '<a href="'.$cds->getPageURL().'?v='.$cds->variation.'&page='.$cds->pageId.'&article='.$articles[count($articles)-1].'">&gt;&gt;</a>';
  } else {
  	echo '&nbsp;&nbsp;';
    echo '&gt;';
    echo '&nbsp;&nbsp;';
    echo '&gt;&gt;';  
  }
  
  echo '</div>'; 
  include "modules/sitefooter.php";
  require_once "nxfooter.inc.php";
?>