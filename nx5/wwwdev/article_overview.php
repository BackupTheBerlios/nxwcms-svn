<?PHP
  require_once "nxheader.inc.php";
  require_once $cds->path."inc/header.php";
  
  // draw the Headline and the body
  echo '<h1>'.$cds->content->get("Headline").'</h1>';
  br();
  $body = $cds->content->get("Body");
  if ($body != "") {
  	echo $body;
  	br();
  }
    
  // get the article list
  $articles = $cds->channel->get("Articles");
  
  if (count($articles) > 0) {  
    // draw all the article headlines with links and short text.
    echo '<table width="100%" cellpadding="2" cellspacing="0" border="0">';
    for ($i=0; $i<count($articles); $i++) {
    	// if you want to format the article-date, set the formatstring as second parameter.
    	$date = $cds->channel->getArticleDate($articles[$i]); 
    	// get the link to the article
  	  $link = $cds->channel->getlink($articles[$i]);
  	
  	  // fetch the content of the article
    	$cluster = $cds->cluster->getById($articles[$i]);
    	$title = $cluster->content->get("Headline");
    	$body = "";
  	  if ($cluster->content->field_exists("Body")) {
  	    $body = $cluster->content->get("Body");
  	    $body = $cds->tools->shortenText($body, 200, ' ...');
    	}
    	echo '<tr><td valign="top>'.$date.'</td><td valign="top"><a href="'.$link.'">'.$title.'</a></td></tr>';
    	if ($body != "") {
  	    echo '<tr><td colspan="2">'.$body.'<br></td></tr>';	
    	} 	  	
    }
    echo '</table>';
  }
      
  require_once $cds->path."inc/footer.php";
  require_once "nxfooter.inc.php";
?>