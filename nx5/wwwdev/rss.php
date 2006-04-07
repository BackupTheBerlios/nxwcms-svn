<?PHP
  require_once "nxheader.inc.php";
  $link = $cds->content->get("Baselink", "ALL");
  $articles = $cds->channel->get("Stage"); 
  $rssCreator = $cds->plugins->getApi("RSSCreator");
  $rssCreator->addArticles($articles, "Headline", "Body", $c["host"].$link["HREF"]."&" );
  echo $rssCreator->saveFeed("RSS1.0", "feed.xml"); 
  $db->close();
?>