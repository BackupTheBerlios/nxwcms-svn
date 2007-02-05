<?
	/**********************************************************************
	 *	N/X - Web Content Management System
	 *	Copyright 2002 Sven Weih, FZI Research Center for Information Technologies
	 *	www.fzi.de
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
	 * Rate PlugIn
	 * Version 1.0
	 *
	 * @package Plugins
	 */
	class pgnRate extends Plugin {

		// Name of the Management's Table Primary Key
		var $pk_name = "SOURCEID";
        var $globalConfigPage = "plugin/rate/rate_results.php";
		// Name of the Plugin's Management Table. All tables should start with pgn_
		var $management_table = "pgn_rate";
        var $pluginType = 3; //CDS-API-Extension
        
		/**
		   * This function is used for drawing the html-code out to the templates.
		   * It just returns the code
		   * @param 		string	Optional parameters for the draw-function. There are none supported.
		   * @return		string	HTML-CODE to be written into the template.
		   */
		function draw($param = "") {
			return new CDS_Rate($param["id"]);
		}
	

		/**
		 * returns array with names, which need to be deployed when the plugin is installed
		 */
		function getInstallationFiles() {
		  return array("rate0.gif", "rate1.gif");
		}
		
		/**
		   * Specifies information for installation and deinstallation of the plugin.
		   */
		function registration() {
			global $auth;	
			if ($auth->checkPermission("ADMINISTRATOR")) {
				Plugin::registration();
				$this->name = "Rate";
				$this->description = "CDS-API-Extension for rating items.";
				$this->version = 1;
				$mtid = nextGUID(); // getting next GUID.
				$this->installHandler->addDBAction("CREATE TABLE `pgn_rating` (  `RATINGID` bigint(20) NOT NULL auto_increment,  `SOURCEID` bigint(20) NOT NULL default '0',  `VOTE` tinyint(4) NOT NULL default '0',  `COMMENT` text NOT NULL,  `timestamp` timestamp(14) NOT NULL,  PRIMARY KEY  (`RATINGID`)) TYPE=MyISAM AUTO_INCREMENT=1 ;");
				$this->uninstallHandler->addDBAction("DROP TABLE `pgn_rating`");
				global $source, $classname; // the source path has to be provided by the calling template
				$modId = nextGUID();
				$this->installHandler->addDBAction("INSERT INTO modules (MODULE_ID, MODULE_NAME, DESCRIPTION, VERSION, MT_ID, CLASS, SOURCE, MODULE_TYPE_ID) VALUES ($modId, '$this->name', '$this->description', $this->version, $mtid, '$classname', '$source', 3)");
			}
		}
	}
	
	/**
	 * CDS-API for Rate-Plugin
	 */
	 class CDS_Rate {
	 
	   var $sourceId = 0;
	   
	   /**
	    * standard constucor
	    */
	   function CDS_Rate($sourceId) {
	     $this->sourceId = $sourceId;
	   }
	   
	   /**
	    * Draw the plugin
	    * @param string Question
	    * @param string Poor-Label
	    * @param string Good-Label
	    * @param string Comment-Label
	    * @param string Average-rating label
	    * @param string Submitbutton-text
	    * @param string Thankyou-Text
	    */
	   function drawForm($question="How did you rate the quality of this content?", $poor="Poor", $good="Outstanding", $comment="Your Comment", $rating="Average Rating", $submit="Submit", $thankyou="Thank you for your vote!" ) {
	        $out = '<table class="rate_table">'."<tr>\n";
	        $out.= '<form name="rate" method="post">';
	        if ($this->_processForm()) {
	            $out.= '<td class="rate_copy">'.$thankyou."</td>\n</tr>\n<tr>";
	            $out.= '<td class="rate_copy">'.$this->drawResults()."</td>\n</tr>\n";
	        } else {;
	            $out.= '<td colspan="11" class="rate_label">'.$question."</td>\n</tr>\n<tr>";
	            $out.= '<td colspan="11" class="rate_copy"><img src="sys/ptrans.gif" border="0" height="5" width="1">'."</td>\n</tr>\n<tr>";
	            $out.= '<td class="rate_label" width="10%">&nbsp;<input type="hidden" name="pgnratingsend'.$this->sourceId.'" value="1"></td>';
	            for ($i=1; $i < 10; $i++) {
    	            $out.= '<td class="rate_copy" align="center" width="10%">'.$i.'</td>';
	            }    
	            $out.= '<td class="rate_copy" width="10%">&nbsp;</td>'."\n</tr>\n<tr>";
	            $out.= '<td class="rate_label" width="10%">'.$poor.'</td>';
	            for ($i=1; $i < 10; $i++) {
	                $out.= '<td class="rate_copy" align="center" width="10%"><input type="radio" name="pgnrating'.$this->sourceId.'" value="'.$i.'"></td>';
	            }
	            $out.= '<td class="rate_copy" width="10%">'.$good.'</td>'."\n</tr>\n<tr>";
	            $out.= '<td colspan="11" class="rate_copy"><img src="sys/ptrans.gif" border="0" height="5" width="1">'."</td>\n</tr>\n<tr>";
	            $out.= '<td colspan="11" class="rate_label">'.$comment."</td>\n</tr>\n<tr>";
	            $out.= '<td colspan="11" class="rate_copy"><textarea class="rate_textarea" name="pgnratingcomment'.$this->sourceId.'" size="4"></textarea>'."</td>\n</tr>\n<tr>";
	            $out.= '<td colspan="11" class="rate_copy"><input type="submit" name="submit" value="'.$submit.'">'."</td>\n</tr>";
	        }
	        $out.= '</form>';
	        $out.= '</table>'."\n";    
	        return $out;
	   }
	 
	   /**
	    * Draw result list
	    */
	   function drawResults($average="Average Rating", $count="Ratings") {
	      $out = '<table class="rate_table">'."\n";
	      $out.= '<tr>';
	      $out.= '<td valign="middle" class="rate_label">'.$average."</td>\n";
	      $data = $this->getData();
	      for ($i=0; $i< $data["average"]; $i++) {
	         $out.= '<td valign="middle" class="rate_label"><img src="sys/rate1.gif" border="0" width="16" height="16"></td>'."\n";
	      }
	      for ($i=0; $i< (9 - $data["average"]); $i++) {
	         $out.= '<td valign="middle" class="rate_label"><img src="sys/rate0.gif" border="0" width="16" height="16"></td>'."\n";
	      }
	      $out.= '<td valign="middle" class="rate_label">('.sprintf("%01.2f",$data["average"]).")</td>\n";
	      $out.= '<td colspan="11" class="rate_copy"><img src="sys/ptrans.gif" border="0" height="5" width="25">'."</td>\n";
	      $out.= '<td valign="middle" class="rate_label">'.$count.": ".$data["ratings"]."</td>\n";
	      $out.= '</tr>';
	      $out.= '</table>'."\n";    
	      return $out;
	   }
	 
	   /**
	    * Store a vote
	    * @param integer Vote of user (1-8)
	    * @param string comment of user
	    */
	   function saveData($vote, $comment="") {
	     if ($vote>0 && $vote <10) {
	       global $db;
	       $sql = "INSERT INTO pgn_rating (VOTE, COMMENT, SOURCEID) VALUES($vote, '".addslashes($comment)."', $this->sourceId)";
	       $query = new query($db, $sql);
	       $query->free();
	       return true;  
	     }
	     return false;
	   }
	   
	   /**
	    * Process the formfields, if set. Takes fields pgnratingcomment<id>, pgnratingvote<id>,
	    * pgnratingsend<id>
	    */
	    function _processForm() {
	      if (value("pgnratingsend".$this->sourceId) == "1") {
	        return $this->saveData(value("pgnrating".$this->sourceId, "NUMERIC"), value("pgnratingcomment".$this->sourceId, "", ""));
	      }
	      return false;
	    }
	   
	   /**
	    * Returns array with rated data.
	    * ["ratings"] # of ratings
	    * ["average"] average rating
	    */
	   function getData() {
	        global $db;
	        $sql = "SELECT AVG(VOTE) AS CALC FROM pgn_rating WHERE SOURCEID = ".$this->sourceId;
	        $query = new query($db, $sql);
	        if ($query->getrow()) 
	          $out["average"] = $query->field("CALC");
	   
	        $sql = "SELECT COUNT(VOTE) AS CALC FROM pgn_rating WHERE SOURCEID = ".$this->sourceId;
	        $query = new query($db, $sql);
	        if ($query->getrow()) 
	          $out["ratings"] = $query->field("CALC");
	        $query->free();
	        return $out;
	   }
	   
	   /**
	    * Get comments last posted
	    * @param integer Number of Posts to limit+
	    */
	   function getComments($limit=5) {
	     global $db;
	     $result = array();
	     $sql= "SELECT COMMENT, TIMESTAMP FROM pgn_rating WHERE COMMENT <> '' ORDER BY TIMESTAMP DESC LIMIT ".$limit;
	     $query = new query($db, $sql);
	     while ($query->getrow()) {
	       $result[] = array("comment" => $query->field("COMMENT"), "date" => $query->field("TIMESTAMP"));
	     }
	     $query->free();
	     return $result;
	   }
	 }

?>