<?PHP
	$menuCluster = $cds->cluster->get("Menu");
?>      
	<table width="100%" style="height:150px" border="0" cellpadding="0" cellspacing="0">
	<tr>
	  <td style="height:65; width:150px;">
	    <?php
	      echo $cds->layout->spacer(150,1);	          
	      echo $menuCluster->content->get("Logo");
	    ?>
	   
	  </td>
	  <td style="height:65;" width="550" align="center">
	     <?php
	       // This is the n/x integrated banner
	       //echo $cds->layout->spacer(550,1);	          
	       //br();
	       //$cpg = $menuCluster->cluster->getCompoundGroup("Banner");       
	       //if (count($cpg) >0) echo $cpg[0]->cluster->draw();	      
	       
	       // use google ads instead. 
	     ?>		  
	     <script type="text/javascript"><!--
			google_ad_client = "pub-9320408685906498";
			google_ad_width = 728;
			google_ad_height = 90;
			google_ad_format = "728x90_as";
			google_ad_type = "image";
			google_ad_channel ="";
			//--></script>
			<script type="text/javascript"
  				src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
			</script>
	  </td>
	  <td style="height:65;"><?php //echo $menuCluster->content->get("Paypal"); ?></td>
	</tr>
	<tr>
	  <td colspan="3" style="background-color:#000000; height:3px;"></td>
	</tr>