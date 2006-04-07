  <br><br>
	</td><tr>
  <tr><td align="center"><?PHP
    
    $services = $cds->menu->getMenuByPath("/Servicepages");
    $servicePages = $services->lowerLevel();
    for ($i=0; $i < count($servicePages); $i++) {
      if ($i>0 && $i<(count($servicePages))) echo "&nbsp;|&nbsp;";  // draw the separator
      echo $cds->layout->menu->getLink($servicePages[$i]);
    }
  
  ?><br><br></td></tr>
  </table>
  </td>	
    <td valign="top" height="100%" width="210"><table width="190" cellpadding="2" cellspacing="0" border="0">
    <tr>
      <td colspan="2"><?php echo $cds->tools->spacer( 1, 60); ?></td>
    </tr> 
    <tr>
      <td valign="top" width="3"><img src="sys/sepline.gif" width="2" border="0"></td>
       <td valign="top" width="7">&nbsp;</td>
      <td valign="top" width="160"><?php include "sidebar.php"; ?></td>
      </tr>
    </table></td>
  </tr>
</table>
