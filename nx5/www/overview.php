<?PHP
  require_once "nxheader.inc.php";
  $cds->layout->addStyleSheet("css/styles.css");
  $cds->layout->htmlHeader(); 
  include "modules/siteheader.php";

  echo $cds->content->get("Headline");
  br();
  br();
  echo $cds->content->get("Body");
  br();
  br();
  br();
  
  echo '<table width="620" border="0" cellpadding="0" cellspacing="0">';
  echo '<tr>';
    echo '<td width="260">'.$cds->tools->spacer(300,1)."</td>";
    echo '<td width="20">'.$cds->tools->spacer(20,1)."</td>";
    echo '<td width="260">'.$cds->tools->spacer(300,1)."</td>";
  echo '</tr>';
  
  $teaser = $cds->cluster->getField("Teaser");
  for ($i=0; $i< count($teaser); $i++) {
  	if (($i%2) == 0) {
  		echo "<tr><td valign=top>";  		
  		echo $teaser[$i]->cluster->draw();
  		echo "</td>";
  	} else {
  		echo "<td>&nbsp;</td>";
  		echo "<td valign=top>";
  		echo $teaser[$i]->cluster->draw();  		
  		echo "</td>";
  		echo "</tr>";		  	
  		// draw row for some pixel space
  		echo "<tr><td colspan=3>".$cds->tools->spacer(10,10)."</td></tr>";
  
  	}
  }

  // close last row.
  if ((count($teaser)%2) == 1) {  	
  	echo "<td colspan=\"2\">&nbsp;</td></tr>";
  } 
  echo '</table>';
  
 
  include "modules/sitefooter.php";
  require_once "nxfooter.inc.php";
?>