<?php
	if ($auth->checkAccessToFunction("CHANNEL_EDIT")) {
		$cond = "ARTICLE_ID = $oid";
		$oname = new TextInput($lang->get("name"), "channel_articles", "TITLE", $cond, "type:text,width:300,size:64", "MANDATORY");
		$propPanel->add($oname);
		$propPanel->add(new PositionInput($lang->get("position", "Position"), "channel_articles", "POSITION", $cond, "<chcat> AND VERSION=0", "size:4,width:50"));
		$propPanel->add(new SelectOneInput($lang->get("category"), "channel_articles", "CH_CAT_ID", "channel_categories", "NAME", "CH_CAT_ID", "CHID = $chid", $cond, "type:dropdown", "MANDATORY"));		 	
  	    $propPanel->add(new DateTimeInput($lang->get("ch_article_date", "Article Date"), "channel_articles", "ARTICLE_DATE", $cond));
		$propPanel->add(new SubTitle("st", $lang->get("sp_launchdates"), 3));
		$propPanel->add(new DateTimeInput($lang->get("sp_launchdate"), "channel_articles", "LAUNCH_DATE", $cond));
		$propPanel->add(new DateTimeInput($lang->get("sp_expiredate"), "channel_articles", "EXPIRE_DATE", $cond));
	}
	 
	$propPanel->add(new FormButtons());
?>