<?php
  // DEMOHOMEPAGE
  
  // Add CSS and JS to the Header, Setup the Title of the homepage 
  $cds->layout->setStaticTitle($cds->content->getByAccessKey("HomepageTitle"));
 
  // Check, if an rss-link is defined and set if.
  $rss = $cds->content->getByAccessKey("rssfeed", "ALL");  
  $rsslink = $rss["HREF"];
  if (strlen($rsslink) > 0 ) {
  	$cds->layout->addRSSFeed($cds->servername.$rsslink);
  }
  
  // Draw the HTML Header with title tags, js, css.... 
  $cds->layout->htmlHeader(); 
  
  // Draw the Menu. Some Menues consist of Header and Footer. The footer is drawn with
  // the call $cds->layout->drawMenuFooter() in footer.php.
  $cds->layout->drawMenuHeader();
    
  // Draw the table, which separates the content from the sidebar.
  // Draw the breadcrumb now
  echo $cds->layout->menu->breadcrumb().'<br/>';
?>