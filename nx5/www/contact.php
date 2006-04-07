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
  
  $fname = value("name", "", "");
  $fsurname = value("surname", "", "");
  $fstreet = value("street", "", "");
  $fzip = value("zip", "", "");
  $fcity = value("city", "", "");
  $ftel = value("tel", "", "");
  $ffax = value("fax", "", "");
  $femail = value("email", "","");
  $fsubject = value("subject", "", "");
  $fmessage = value("message", "", "");
  if (value("submit") != "0" && $femail != "") {
    $mailstring = $headline ."\n";
    $mailstring.= $body."\n";
    $mailstring.= "\n";
    $mailstring.= "Name:     ".$fname."\n";
    $mailstring.= "Vorname:  ".$fsurname."\n";
    $mailstring.= "Strasse:  ".$fstreet."\n";
    $mailstring.= "PLZ:      ".$fzip."\n";
    $mailstring.= "Ort:      ".$fcity."\n";
    $mailstring.= "Telefon:  ".$ftel."\n";
    $mailstring.= "Fax:      ".$ffax."\n";
    $mailstring.= "E-Mail:   ".$femail."\n\n";
    $mailstring.= $fmessage."\n";
    $mailstring.= "\n\n";    	
    @mail ( $cds->content->get("SendTo"), "[Homepage] ".$fsubject, $mailstring, 'From: '.$femail);
    echo $cds->content->get("success");
  } else {  
  

  if ($sma != 1) echo '<form name="contact" method="post">';
  echo '<table width="424" cellpadding=1" cellspacing="0" border="0">';

  echo '<tr>';
  echo   '<td width="88" class="copy1" valign="middle">'.$cds->content->get("name").'</td>';
  if ($sma != 1) echo   '<td width="326"><input type="text" style="width:326px" name="name" value="'.$fname.'"></td>';
  echo '</tr>';
  
  echo '<tr>';
  echo   '<td width="88" class="copy1" valign="middle">'.$cds->content->get("Christian Name").'</td>';
  if ($sma != 1) echo   '<td width="326"><input type="text" style="width:326px" name="surname" value="'.$fsurname.'"></td>';
  echo '</tr>';
  
  echo '<tr>';
  echo   '<td width="88" class="copy1" valign="middle">'.$cds->content->get("STREET").'</td>';
  if ($sma != 1) echo   '<td width="326"><input type="text" style="width:326px" name="street" value="'.$fstreet.'"></td>';
  echo '</tr>';
  
  echo '<tr>';
  echo   '<td width="88" class="copy1" valign="middle">'.$cds->content->get("ZIP").'</td>';
  if ($sma != 1) echo   '<td width="326"><input type="text" style="width:40px" maxsize="7" name="zip" value="'.$fzip.'"></td>';
  echo '</tr>';

  echo '<tr>';
  echo   '<td width="88" class="copy1" valign="middle">'.$cds->content->get("City").'</td>';
  if ($sma != 1) echo   '<td width="326"><input type="text" style="width:326px" name="city" value="'.$fcity.'"></td>';
  echo '</tr>';
  
  echo '<tr>';
  echo   '<td width="88" class="copy1" valign="middle">'.$cds->content->get("TEL").'</td>';
  if ($sma != 1) echo   '<td width="326"><input type="text" style="width:326px" name="tel" value="'.$ftel.'"></td>';
  echo '</tr>';  

  echo '<tr>';
  echo   '<td width="88" class="copy1" valign="middle">'.$cds->content->get("FAX").'</td>';
  if ($sma != 1) echo   '<td width="326"><input type="text" style="width:326px" name="fax" value="'.$ffax.'"></td>';
  echo '</tr>';  
  
  echo '<tr>';
  echo   '<td width="88" class="copy1" valign="middle"><b>'.$cds->content->get("E-Mail").'</b></td>';
  if ($sma != 1) echo   '<td width="326"><input type="text" style="width:326px" name="email" value="'.$femail.'"></td>';
  echo '</tr>';
  
  echo '<tr><td colspan="'.(2-$sma).'" height="8">'.$cds->tools->spacer(1,8).'</td></tr>';
  
  echo '<tr>';
  echo   '<td width="88" class="copy1" valign="middle">'.$cds->content->get("Subject").'</td>';
  if ($sma != 1) echo   '<td width="326"><input type="text" style="width:326px" name="subject" value="'.$fsubject.'"></td>';
  echo '</tr>';

  echo '<tr>';
  echo   '<td width="88" class="copy1" valign="top">'.$cds->content->get("Mailbody").'</td>';
  if ($sma != 1) echo   '<td width="326"><textarea style="width:326px; height:100px;" name="message">'.$fmessage.'</textarea></td>';
  echo '</tr>';
  
  echo '<tr><td colspan="'.(2-$sma).'" height="8">'.$cds->tools->spacer(1,8).'</td></tr>';
  echo '<tr>';
  echo   '<td width="88" class="copy1" valign="middle">&nbsp;</td>';
  if ($sma != 1) echo   '<td width="326"><input type="reset" name="reset" value="'.$cds->content->get("reset").'">&nbsp;<input type="submit" name="submit" value="'.$cds->content->get("submit").'"></td>';
  echo '</tr>';
  echo '</table>';  
  if ($sma != 1) echo '</form>';
  }
  
  include "modules/sitefooter.php";
  require_once "nxfooter.inc.php";
?>