<?
	/**********************************************************************
	 *	N/X - Web Content Management System
	 *	Copyright 2006 Sven Weih
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
	 * Adsense PlugIn
	 * Version 1.0
	 *
	 * @package Plugins
	 */
	class pgnGoogleMaps extends Plugin {

		// Name of the Management's Table Primary Key
		var $pk_name = "FKID";

		// Name of the Plugin's Management Table. All tables should start with pgn_
		var $management_table = "pgn_googlemaps";
		var $isSingleConfig = false;
		
		/**
		  * Creates the input fields for editing text
		  * @param integer &$form link to the form the input-fields are to be created in 
		  */
		function edit(&$form) {
			global $lang, $sid, $c;
			// add button for external editor.
			$condition = "FKID = $this->fkid";
		//	$form->add(new TextInput($lang->get("adtextas", "AD-Javascript (copy from Google Adsense Homepage)"), "pgn_adsense", "ADTEXT", $condition, "type:textarea,width:350,size:10", ""));
		}
		

		/** 
		  * Used, for painting a preview of the content in the cms. Note, that the data
		  * is to be drawn in a table cell. Therefore you may design any html output, but
		  * you must return it as return value!
		  */
		function preview() {
			global $lang;			
		
		}

		/**
		   * This function is used for drawing the html-code out to the templates.
		   * It just returns the code
		   * @param 		string	Optional parameters for the draw-function. There are none supported.
		   * @return		string	HTML-CODE to be written into the template.
		   */
		function draw($param = "") {
			global $cds, $c;
			return $content;
		}
		
 		/**
		  * Create a new Record with the given $this->fkid in the database.
		  * Initialize with standard values!
		  */
		function createRecord() {
			$createHandler = new ActionHandler("CREATE");
			$createHandler->addDBAction("INSERT INTO $this->management_table ($this->pk_name) VALUES ($this->fkid)");
			$createHandler->process("CREATE");
		}

		

		/**
		   * Create the sql-code for a version of the selected object
		   * @param integer ID of new Version.
		   * @returns string SQL Code for new Version.
		   */
		function createVersion($newid) {
			// query for content
			global $db;

		//	$querySQL = "SELECT ADTEXT FROM $this->management_table WHERE $this->pk_name = $this->fkid";
		//	$query = new query($db, $querySQL);
		//	$query->getrow();
		//	$content = addslashes($query->field("ADTEXT"));
		//	$query->free();

			// $sql = "INSERT INTO $this->management_table ($this->pk_name, ADTEXT) VALUES ($newid, '$content')";
			return $sql;
		}

		/**
		   * Specifies information for installation and deinstallation of the plugin.
		   */
		function registration() {
			global $auth;

			// Authentification is require_onced for changing system configuration. Do not change.
			if ($auth->checkPermission("ADMINISTRATOR")) {

				// parent registration function for initializing. Do not change.
				Plugin::registration();

				// Name of the Plugin. The name will be displayed in the WCMS for selection
				$this->name = "Google Maps";
				// A short description, what the Plugin is for.
				$this->description = "Google Maps.";
				// Version of the plugin. Use integer numbers only. Is important for future releases.
				$this->version = 1;

				/**** do not change from this point ****/
				$mtid = nextGUID(); // getting next GUID.
				//del1

				// SQL for creating the tables in the database. Do not call, if you do not need any tables in the database 
				$this->installHandler->addDBAction("CREATE TABLE `pgn_googlemaps` (`FKID` BIGINT,`APIKEY` VARCHAR( 128 ) ,`HEIGHT` INT( 8 ) ,`WIDTH` INT( 8 ) ,`ZOOMLEVEL` INT( 8 ) ,`CONTROL` VARCHAR( 32 ) ,`VIEWTYPE` VARCHAR( 32 ) ,PRIMARY KEY ( `FKID` )) TYPE = MYISAM ;");
				$this->installHandler->addDBAction("CREATE TABLE `pgn_googlemaps_poi` (  `GUID` bigint(20) NOT NULL default '0',  `FKID` bigint(20) NOT NULL default '0',  `POSITION` bigint(20) NOT NULL default '0',  `XCOORD` double NOT NULL default '0',  `YCOORD` double NOT NULL default '0',  `ADDRESS` varchar(255) collate utf8_unicode_ci default NULL,  `HTML` text collate utf8_unicode_ci NOT NULL,  PRIMARY KEY  (`GUID`)) ENGINE=MyISAM ;");

				// SQL for deleting the tables from the database. 
				$this->uninstallHandler->addDBAction("DROP TABLE `pgn_googlemaps`");
				$this->uninstallHandler->addDBAction("DROP TABLE `pgn_googlemaps_poi`");
				/**** change nothing beyond this point ****/
				global $source, $classname; // the source path has to be provided by the calling template
				$modId = nextGUID();				
			}
		}
	}
?>
