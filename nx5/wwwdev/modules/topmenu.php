<?PHP
  require "layoutheader.php";
?>      
	<tr>
	  <td colspan="3" valign="top" style="height:85px;">
	     <table width="100%" cellpadding="0" cellspacing="0" border="0" style="height:85px;">
	       <tr>
		 <td valign="top" style="width:400; height:85px;">
		 <?PHP
			  $searchMenu = $cds->menu->getMenuByPath("/Servicepages/Search");
			  $searchForm = $searchMenu->getLink();

			  if (! $sma) {   
		?>	 
			<form name="searchform2" action="<?php echo $searchForm ?>" method="POST">  
		<?PHP 
			  }
		?>
		<table width="400" style="height:85px;" cellpadding="0" cellspacing="0" border="0">
		     <tr>
		       <td colspan="2" style="height:60px;width:400px;"><?php echo $menuCluster->content->get("Key Visual"); ?></td>
		     </tr>
		     <tr>
			<td valign="middle" style="height:25px;background-color:#44555E;" width="135" align="right"><input type="text" style="width:130px; border: 1px solid #152b36; font-size:11px;" name="searchphrase"></td>
			<td valign="middle" style="height:25px;background-color:#44555E;" width="265"><a href="#" onClick="document.searchform2.submit();"><img src="sys/search.png" border="0"></a></td>
		     </tr>
		   </table></td>
		   <?php 
		     if (!$sma) echo '</form>';
		    $pathToRoot = $cds->menu->getPathToRoot();
            $topMenu = array_pop($pathToRoot);
            if ($topMenu == null) $topMenu = $cds->menu;
		    $startMenu = $cds->menu->getMenuByPath("/");	// get the startpage.
		    $firstLevelMenues = $startMenu->sameLevel();
		    for ($k=0; $k < min(4, count($firstLevelMenues)); $k++) { // limit to 4 entries for avoiding errors in display .
		  ?>

		   <td valign="top" style="width:100px; height:85px;"><table style="height:85px;" cellpadding="0" cellspacing="0" border="0">
		     <tr>
		       <td style="height:85px;width:100px;"><? 
		        $menuField = $menuCluster->content->getField("Menu ".($k+1), "ALL");			   
		        if ($topMenu->pageId == $firstLevelMenues[$k]->pageId) {
		           echo '<a href="'.$firstLevelMenues[$k]->getLink().'"><img src="'.$menuField[1]["path"].'" width="'.$menuField[1]["width"].'" height="'.$menuField[1]["height"].'" border="0"></a>';
		        } else {
		           echo '<a href="'.$firstLevelMenues[$k]->getLink().'">'.$cds->layout->dhtml->imageMouseOver($menuField).'</a>';
		        }
		        ?></td></tr>
		   </table></td>

		 <?php } ?><td valign="top" width="100%" style="height:85px;"><table width="100%" style="height:85px;" cellpadding="0" cellspacing="0" border="0">
		     <tr>
		       <td width="100%" style="height:60px;background-color:#152b36;">&nbsp;</td>
			 </tr>
			 <tr>
		       <td width="100%" style="height:25px;background-color:#44555E;">&nbsp;</td>
		    </tr>
		   </table></td>
	   </tr>  
	 </table></td></tr></table>