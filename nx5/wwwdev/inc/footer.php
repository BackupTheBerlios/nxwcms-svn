<?php
  // close the content cell and include the sidebar.  
  br();
  echo '<center>';
  echo $cds->layout->menu->getPrevForwardLinks();
  echo '</center>';   
  $cds->layout->drawMenuFooter(); 
    
  // Draw the pixel for editing the website.
  echo '<div align="right" style="float:right">';
  echo $cds->layout->drawSMAEntry();
  echo '</div>';
?>