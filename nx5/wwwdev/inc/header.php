<?php
  // DEMOHOMEPAGE
  
  // Draw the HTML Header with title tags, js, css.... 
  $cds->layout->htmlHeader(); 
  
  // Draw the header of the page.
  include "drawheader.php";
  
  // Draw the Menu. Some Menues consist of Header and Footer. The footer is drawn with
  // the call $cds->layout->drawMenuFooter() in footer.php.
  $cds->layout->drawMenuHeader();
?>