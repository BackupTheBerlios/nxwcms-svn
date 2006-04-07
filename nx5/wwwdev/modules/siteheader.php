<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top" width="100%" style="height:150px;" colspan="3"><?php
        include "topmenu.php";
      ?></td></tr>
  <tr><td valign="top" width="150" height="100%"><?php
        echo $cds->layout->spacer(150,1);
        include "sidemenu.php";
      ?></td><td valign="top" width="70%" style="padding-left:20px; padding-right:20px;" height="100%" width="100%">
      <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
      <td height="100%" width="600" valign="top">
	<?php
          echo $cds->layout->spacer(550,12);
          br();
          echo $cds->layout->menu->breadcrumb();
          br();
          echo $cds->layout->spacer(550,20);
    ?><br>