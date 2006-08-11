<?PHP
  require_once "nxheader.inc.php";
  $link = $cds->content->get("link", "ALL");
  $articles = $cds->channel->get("Channel"); 
  $rssCreator = $cds->plugins->getApi("RSSCreator");
  $rssCreator->addArticles($articles, "Headline", "Body", $c["host"].$link."&" );
  echo $rssCreator->saveFeed("RSS1.0", "feed.xml"); 
  $db->close();
?>