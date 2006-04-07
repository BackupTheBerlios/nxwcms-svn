<?php

/**********************************************************************
 *	N/X - Web Content Management System
 *	Copyright 2004 Sven Weih
 *
 *      $Id: channel.php,v 1.11 2005/05/09 19:13:30 sven_weih Exp $ *
 *
 *	This file is part of N/X.
 *	The initial has been setup as a small diploma thesis (Studienarbeit) at the FZI.
 *	It was be coached by Prof. Werner Zorn and Dipl.-Inform Thomas Gauweiler.
 *
 *	N/X is free software; you can redistribute it and/or modify
 *	it under the terms of the GNU General Public License as published by
 *	the Free Software Foundation; either version 2 of the License, or
 *	(at your option) any later version.
 *
 *	N/X is distributed in the hope that it will be useful,
 *	but WITHOUT ANY WARRANTY; without even the implied warranty of
 *	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *	GNU General Public License for more details.
 *
 *	You should have received a copy of the GNU General Public License
 *	along with N/X; if not, write to the Free Software
 *	Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 **********************************************************************/
    

  /**
   * Delete a whole channel incl. all containing articles.
   * param integer Channel-ID
   */
  function deleteChannel($channelId) {
  	global $db;
  		// first we'll delete all containing articles
  		$sql = "SELECT ARTICLE_ID FROM channel_articles WHERE CHID=$channelId";
  		$query = new query($db, $sql);
  		while ($query->getrow()) {
  			deleteArticle($query->field("ARTICLE_ID"));
  		}
  		
  		deleteRow("channel_categories", "CHID = $channelId");
  		deleteRow("channel_cluster_templates", "CHID = $channelId");
  		deleteRow("channels", "CHID = $channelId");
  		
  }
  
  /**
   * Deletes a category in a channel and all its articles and clusters.
   * @param integer ID of the Channel Category to delete
   */
  function deleteChannelCategory($categoryId) {
  		global $db;
  		$sql = "SELECT ARTICLE_ID FROM channel_articles WHERE CH_CAT_ID=$categoryId";
  		$query = new query($db, $sql);
  		while ($query->getrow()) {
  			deleteArticle($query->field("ARTICLE_ID"));
  		}
  		
  		deleteRow("channel_categories", "CH_CAT_ID = $categoryId");  	
  }
  

  /**
   * Creates an Article out of a page
   * @param integer $spid ID of the sitepage
   * @param integer $channel ID of the channel
   * @param $category ID of the Channelcategory
   */
  function importClusterToArticle($spid, $channel, $category) {
    $clnid = getDBCell("sitepage", "CLNID", "SPID=".$spid);
    $menues = createNameValueArrayEx("sitepage_names", "NAME", "VARIATION_ID", "SPID=".$spid, "ORDER BY VARIATION_ID ASC");
    $clt = getDBCell("cluster_node", "CLT_ID", "CLNID=".$clnid);
    $cs = new CreateSet("channel_articles");
    $cs->add("ARTICLE_ID", $clnid, "NUMBER");
    $cs->add("CHID", $channel, "NUMBER");
    $cs->add("CH_CAT_ID", $category, "NUMBER");
    $cs->add("VERSION", "0", "NUMBER");
    $cs->add("CLT_ID", $clt, "NUMBER");
    $cs->add("TITLE", $menues[0][0], "TEXT"); 
    $cs->add("POSITION", 999, "NUMBER");
    $cs->execute();
    processSaveSets();   	
  }
  
  /**
   * Returns the values for a channel-category dropdown box.
   */
  function getChannelDropDownValues() {
  	global $db;
  	$chcat = array();
  	$channels = createNameValueArrayEx("channels", "NAME", "CHID", "1 ORDER BY NAME ASC");
  	if (!is_array($channels)) $channels=array();
  	foreach ($channels as $channel){
  		$categories = createNameValueArrayEx("channel_categories", "NAME", "CH_CAT_ID", "CHID = ".$channel[1]." ORDER BY NAME");
  		if (count($categories)>0) {
  			foreach ($categories as $category) {
  				$chcat[] = array($channel[0]." - ".$category[0], $category[1]);
  			}
  		}
  	}
    return $chcat;  	
  }

  /**
   * get the allowed variations of a channel
   * @param integer id of the channel
   */
  function getChannelVariations($channelId) {
    global $db, $c, $variation;
    $variation = variation();
    $isInVariations = false;
    $result = array();
    $sql = "SELECT v.NAME AS NAM, v.VARIATION_ID AS VAR FROM variations v, sitepage_variations s WHERE s.SPM_ID = $channelId AND s.VARIATION_ID = v.VARIATION_ID";
    $query = new query($db, $sql);
    while ($query->getrow()) {
      $ar[0] = $query->field("NAM");
      $ar[1] = $query->field("VAR");
      $result[] = $ar;	
      if ($ar[1] == $variation)
        $isInVariations=true;
    }
    
    if (! $isInVariations) {
      pushVar("variation", $result[0][1]);
      $variation = $result[0][1];

      if ($variation == "")
	$variation = $c["stdvariation"];	
    }
    return $result;
  }
  
  /**
   * Delete an article
   * param integer Article-ID
   */
  function deleteArticle($articleId) {
           $variations = createDBCArray("variations", "VARIATION_ID", "1");
           foreach ($variations as $variation){
                      expireArticle($articleId, 10, $variation);
           }
           deleteClusterNode($articleId);
           deleteRow("channel_articles", "ARTICLE_ID = $articleId");
  }
  
     /**
      * Create a new container for saving the data of a Centerstage
      * @param integer FKID ID to reference all.
      */
     function createCenterstage($fkid){
       global $db;
       $sql = "INSERT INTO centerstage (STAGE_ID, SORT_ALGORITHM) VALUES ($fkid, 1)";
       $query = new query($db, $sql);
       $query->free();
     }
     
   /**
	 * ActionHandler, which is called whenever a new article for a channel is created. Takes over thie oids-variable.
	 */
	function createClusterNodeForArticle() {
		global $db, $oid, $chid;
		$clt = getDBCell("channel_articles", "CLT_ID", "ARTICLE_ID = $oid");
		$name = value("channel_articles_TITLE");		
		$sql = "INSERT INTO cluster_node (CLNID, CLT_ID, NAME, DELETED, VERSION) VALUES ($oid, $clt, '$name', 0,0)";	
		$query = new query($db, $sql);
		$query->free();
	}
	
	/**
	 * Assure, that the article is existant in given variation
	 * @param integer Article-ID
	 * @param integer Variation-ID
	 */
	function syncArticleVariation($articleId, $variation) {
	  global $db, $auth;	
	  $clid = getDBCell("cluster_variations", "CLID", "CLNID = $articleId AND VARIATION_ID = $variation");
	  if ($clid != "") {
		$sql = "UPDATE cluster_variations SET DELETED=0 WHERE CLNID = $articleId AND VARIATION_ID = $variation";
	  } else {
	  	$clid = nextGUID();
		$sql = "INSERT INTO cluster_variations (CLNID, VARIATION_ID, CLID, DELETED,CREATED_AT, CREATE_USER, LAST_CHANGED, LAST_USER ) VALUES ( $articleId, $variation, $clid, 0, NOW()+0, '".$auth->userName."', NOW()+0, '".$auth->userName."')";	
	  }
	  $query = new query($db, $sql);
	  $query->free(); 
	  return $clid;
	}
	
    /**
     * Launch Centerstage
     * @param integer Centerstage-ID
     * @param integer Level to launch to
     */
    function launchCenterstage($in, $level){
         $out = translateState($in, $level);
         $replacement["STAGE_ID"] = $out;
         deleteRow("centerstage", "STAGE_ID = $out");
         copyRow("centerstage", "STAGE_ID = $in", $replacement);
         return $out;
    }
    
    // needed for launchArticle to word properly
    require_once ($c["path"]."api/tools/datatypes.php");
    
    /**
     * Launch an article
     * @param integer ID of the article to launch
     * @param integer ID of the level that will be launched
     * @param integer ID of the variation to launch
     */
      function launchArticle($articleId, $level, $variation) {
      	     $articleIdTrans = launchCluster($articleId, $level, $variation);
             $replacements["CLT_ID"] = getDBCell("cluster_node", "CLT_ID", "CLNID = $articleIdTrans");
             $replacements["ARTICLE_ID"] = $articleIdTrans;
             $replacements["VERSION"] = $level;
             deleteRow("channel_articles", "ARTICLE_ID = $articleIdTrans");
             copyRow('channel_articles', "ARTICLE_ID = $articleId", $replacements);       
             return $articleIdTrans;
    }
    
    /**
     * Launch a channel
     * @param integer ID of the channel
     */
    function launchChannel($channelId) {
    	global $db;  		
  		$var = getVariations();
    	$sql = "SELECT ARTICLE_ID FROM channel_articles WHERE CHID=$channelId AND VERSION=0";
  		$query = new query($db, $sql);
  		while ($query->getrow()) {
  			for ($j=0; $j<count($var); $j++) 
  				launchArticle($query->field("ARTICLE_ID"),10,$var[$j]);
  		}
    }
    
    /**
     * Launches all channels
     */
    function launchAllChannels() {
    	$channels = getChannels();
    	for($i=0; $i<count($channels); $i++) {
    		launchChannel($channels[$i]);	
    	}	
    }
     
     /**
      * Returns an array with the GUIDs of all channels in the system
      */
      function getChannels() {
        return createDBCArray("channels", "CHID");
	}


    /**
     * Expire an article
     * @param integer ID of the article to expire
     * @param integer ID of the level that will be expired
     * @param integer ID of the variation to expire
     */
     function expireArticle($articleId, $level, $variation){
          global $db;
          $articleIdTrans = translateState($articleId, $level, false);
          deleteRow("channel_articles", "ARTICLE_ID = $articleIdTrans");
          expireCluster($articleId, $variation);
     }	
 
 ?>