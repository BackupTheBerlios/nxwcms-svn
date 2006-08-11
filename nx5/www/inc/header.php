<?php
  // DEMOHOMEPAGE
  
  // Add CSS and JS to the Header, Setup the Title of the homepage
  $cds->layout->addStyleSheet('css/styles.css');
  
  // Draw the HTML Header with title tags, js, css.... 
  $cds->layout->htmlHeader(); 
  
  // draw the box, to limit the width and to align the page.
  echo '<div id="maindiv">';
  
  // Draw the header of the page.
  include "drawheader.php";
  
  // Draw the Menu. Some Menues consist of Header and Footer. The footer is drawn with
  // the call $cds->layout->drawMenuFooter() in footer.php.
  $cds->layout->drawMenuHeader();
    
  // Draw the table, which separates the content from the sidebar.
  echo '<div style="display:block;clear:both;"><table width="100%" border="0" cellpadding="0" cellspacing="0">';
  echo '<tr>';
  echo '<td valign="top" id="content">';
  // Draw the breadcrumb now
  echo $cds->layout->menu->breadcrumb().'<br/>';
?>