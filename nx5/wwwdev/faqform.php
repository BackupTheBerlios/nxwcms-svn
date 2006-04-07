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
  if (value("question") != "0") {
  	$question = parseSQL(value("question"));
  	$faq = $cds->plugins->getApi("FAQ");
  	$faq->createEntry($question);
  	echo "<b>".$cds->content->get("success")."</b>";
  	br();
  	echo $question;
  	br();
  	br(); 	
  }
  
  if ($sma != 1) echo '<form method="POST">';
  echo $cds->content->get("Question");
  br();
  if ($sma != 1) echo '<input type="text" name="question" value="" size="255" style="width:300px">';
  br();
  br();
  if ($sma != 1) echo '<input type="reset" name="reset" value="'.$cds->content->get("Reset").'">&nbsp;';
  if ($sma != 1)  echo '<input type="submit" name="submit" value="'.$cds->content->get("Submit").'">';
  if ($sma != 1) echo '</form>';
  
  include "modules/sitefooter.php";
  require_once "nxfooter.inc.php";
  
?>