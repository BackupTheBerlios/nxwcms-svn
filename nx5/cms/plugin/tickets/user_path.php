<?php
  require "../../config.inc.php";
  require $c_path."common/cds/menu.inc.php";
  //$auth=new auth("CUSTOMER-CARE|ADMINISTRATOR");
?>
<html>
<head><title>User path</title></head>
<?
echo "<link rel=stylesheet type=\"text/css\" href=\"".$c_docroot."common/css/styles.css\">\n";
?>
<body bgcolor="white" link="black" vlink="black" text="black">

<?

  $uid = value("uid");
  if ($uid != "0") {
    echo "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">";
    echo "<tr class=\"formtitle\"><td>Rank</td><td>Page</td><td>Time</td><td>Duration</td></tr>";
    echo "<tr class=\"informationheader\"><td colspan=\"5\"><input type=\"button\" name=\"back\" value=\"Back\" onClick=\"history.back();\"></td></tr>";
    $sql = "SELECT * FROM pot_accesslog WHERE accesslog_id = $uid order by timestamp desc";
    $query = new query($db, $sql);
    $i=0;
    $oldtime = 0;
    $olddate = "";
    while ($query->getrow()) {
    	$i++;
    	$time = $query->field("timestamp");
    	$document = $query->field("document_id");
  	$doc_id = getDBCell("pot_documents", "string", "data_id = $document");
  	$docname = getSPName($doc_id);
  	$link = getDBCell("pot_documents", "document_url", "data_id = $document");
  	echo "<tr class=\"informationheader\"><td width=\"10%\">$i.</td>";
  	echo "<td width=\"40%\"><a href=\"$link\" target=\"_blank\">$docname</a></td>";
  	echo "<td width=\"40%\">".strftime("%a, %d.%m.%Y %H:%M", $time)."</td>";
  	$nowtime=60*strftime("%H", $time) + strftime("%M", $time);
  	$nowdate=strftime("%d%m%Y");
  	if ($oldtime != 0 && $nowdate==$olddate) {
  		$dif = $oldtime - $nowtime;
  		echo "<td>".$dif." min.</td>";
  	} else {
  		echo "<td>&nbsp</td>";	
  	}
  	$oldtime=$nowtime;
  	$olddate = $nowdate;
  	echo "</tr>";
    }
  $query->free();
  echo "</table>";
  }
  
?>
</html>
</body>
  