<?php 
  $subMenu = $topMenu->lowerLevel();
  echo '<table height="100%" width="150px" cellspacing="0" cellpadding="0" border="0">';

  
  for ($i=0; $i < count($subMenu); $i++) {
  	echo '<tr>';
  	
	if ($subMenu[$i]->pageId == $pathToRoot[count($pathToRoot)-1]->pageId) {  		
		echo ' <td style="cursor:pointer;" class="menulinkactive">';
		echo '<div style="padding-top:3px; padding-bottom:3px; padding-left:2px;">';
  		echo $subMenu[$i]->getTitle();
  		echo '</div>';
  		$subSubMenu = $subMenu[$i]->lowerLevel();
  		if (count($subSubMenu) > 0) {
  		  echo '</td></tr>';	
  		  echo '<tr><td height="1px"><img src="sys/menu_separator.gif" width="150" height="1"></td></tr>';
  		  echo '<tr><td valign="top" class="menuarea">';
  		}
  		for ($j = 0; $j < count($subSubMenu); $j++) {
  		  if ($subSubMenu[$j]->pageId == $pathToRoot[0]->pageId) {
  			  echo "&nbsp;&nbsp;&nbsp;&nbsp;".$cds->layout->menu->getLink($subSubMenu[$j], "menuareaactive");	
  			  br();    	  		  
  		  } else {
  			  echo "&nbsp;&nbsp;&nbsp;&nbsp;".$cds->layout->menu->getLink($subSubMenu[$j], "menuarea");	    	  		  
  			  br();
  		  }
  		}  
		echo '</td>';   		
    } else {
    	echo ' <td class="menulink" style="cursor:hand;" ';
    	if ($subMenu[$i]->isPopup()) {
    	  echo 'onClick="window.open(\'' .$subMenu[$i]->getLink() . '\', \'_blank\');"';
		} else {
		  echo 'onClick="document.location.href=\'' .$subMenu[$i]->getLink() . '\';"';
		}
		echo  ' onMouseover="this.className=\'menulinkactive\';" onMouseOut="this.className=\'menulink\';">';  		

		$menuTitle= $subMenu[$i]->getTitle(); // cache title.
    	echo '<div style="padding-top:3px; padding-bottom:3px; padding-left:2px;">';
    	echo $menuTitle;
    	echo '</div>';
		echo '</td>';   
    }
	
    echo '</tr>';	
    echo '<tr><td height="1px"><img src="sys/menu_separator.gif" width="150" height="1"></td></tr>';  		      
  }
  echo '<tr><td valign="bottom" class="menuarea" height="100%">'.$cds->tools->spacer(27,1).'<A href="http://sourceforge.net/projects/nxwcms" target="_blank"><IMG src="http://sourceforge.net/sflogo.php?group_id=47362" border="0" alt="SourceForge Logo"></A><br><br></td></tr>';
  echo '</table>'
  
?>