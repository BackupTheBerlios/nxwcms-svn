<?PHP
    
 // echo $menuCluster->content->get("LNews");
  br();
  
  //$newsChannel = $menuCluster->channel->get("News");  
  //for ($i=0; $i<count($newsChannel); $i++) {
  	br();
  	//$newsCluster = $cds->cluster->getById($newsChannel[$i]);
  //	echo '<a href="'.$cds->channel->getLink($newsChannel[$i]).'"><b>'.$newsCluster->content->get("Headline").'</b></a>';
  	br();
  //	echo $newsCluster->content->get("Abstract");
  	br();
  //}
  br();
  /**
  uncomment to display an rss feed in the sidebar.
  echo $menuCluster->content->get("LRSS");
  br();  
  $rssReader = $cds->plugins->getApi("RSSReader");
 // $rssReader->proxy = "";
  $feedUrl = "http://sourceforge.net/export/rss2_projsummary.php?group_id=47362";
  $feed = $rssReader->get($feedUrl);
  echo '<div style="font-size:10px">';
  echo $feed["items"][1]["title"]; br();   
  echo $feed["items"][10]["title"]; br();  
  echo $feed["items"][3]["title"]; br();   
  echo $feed["items"][2]["title"]; br();   
  echo '</div>';
  br();
  */
?>