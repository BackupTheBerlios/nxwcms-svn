<?PHP
  require_once "nxheader.inc.php";
  $cds->layout->addToHeader($cds->content->get("Gallery", array("HEAD", 800,600)));
  require_once $cds->path."inc/header.php";

    // draw the Headline and the body
  echo $cds->content->get("Headline");
  br();
  $body = $cds->content->get("Body");
  if ($body != "") {
  	echo $body;
  	br();
  }
  
  echo $cds->content->get("Gallery", array("BODY", 800,600));
  
  require_once $cds->path."inc/footer.php";
  require_once "nxfooter.inc.php";
?>