<?php
  // close the content cell and include the sidebar.
  echo '</td>';
  echo '<td valign="top" id="sidebar">';
  include "sidebar.php";
  echo '</td></tr></table></div>';
  
  
  $cds->layout->drawMenuFooter(); 
  
  // Close the maindiv.
  echo '</div>';
?>