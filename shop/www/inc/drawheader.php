<?php
 // This files draws the banner and the logo of the homepage. 
 // If you want to edit the area over the menu, this is the right file.
?>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td align="center">
      <?php echo $cds->content->getByAccessKey("Banner1"); ?>
    </td>
    <td align="right">
      <?php echo $cds->content->getByAccessKey("Logo"); ?>
    </td>
  </tr>
</table>
<br/>