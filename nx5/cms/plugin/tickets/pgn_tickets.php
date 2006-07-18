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
  * Event PlugIn
  * Version 1.0
  * by Sven Weih
  *
  * @package Plugins
  */
  
  class pgnTickets extends Plugin {
  	
  	// Name of the Management's Table Primary Key
  	var $pk_name = "FKID";
	// Name of the Plugin's Management Table. All tables should start with pgn_
	var $management_table = "";
	// configuration Variables
	var $isSingleConfig = false;
	var $pluginType = 2; // 1= Content Plugin, 2= System Extension
 	
 	var $globalConfigPage = "plugin/tickets/index.php";
	var $globalConfigRoles = "ADMINISTRATOR|CUSTOMER-CARE";
  	var $name="Tickets";
 	
 	/**
 	 * Creates the input fields for editing text
 	 * @param integer &$form link to the form the input-fields are to be created in 
 	 */
 	function edit(&$form) {
  	}	
 
 	/** 
 	 * Used, for painting a preview of the content in the cms. Note, that the data
 	 * is to be drawn in a table cell. Therefore you may design any html output, but
 	 * you must return it as return value!
 	 */
 	 function preview() {
 	 }
	 
 	/**
  	 * This function is used for drawing the html-code out to the templates.
  	 * It just returns the code
  	 * @param 		string	Optional parameters for the draw-function. There are none supported.
  	 * @return		string	HTML-CODE to be written into the template.
  	 */
  	function draw($param="") {
  	}
  	
  	
 	/**
 	 * Create a new Record with the given $this->fkid in the database.
 	 * Initialize with standard values!
 	 */
  	function createRecord() {
  	}
  
    /**
     * This Function provides all actions for deleting a complete recordset
     * of a plugin. It shoul use the $this->fkid for identifying the record.
     */
  	function deleteRecord() {
  	}
  
  	/**
  	 * Create the sql-code for a version of the selected object
  	 * @param integer ID of new Version.
  	 * @returns string SQL Code for new Version.
  	 */
  	 function createVersion($newid) {
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
  			$this->name = "Tickets";
  			// A short description, what the Plugin is for.
  			$this->description = "Ticket tracker";
  			// Version of the plugin. Use integer numbers only. Is important for future releases.
  			$this->version = 1;
			
			// Every module can have its own and individual META-Data in NX. The following Handler is
			// for creating a META-Data-Template and for assigning it to the Plugin.
			// IF you do not want to declare an individual META-Scheme, then set $mtid=0 and delete
			// everything between del1 and /del1!
			
			/**** do not change from this point ****/
			$mtid = nextGUID(); // getting next GUID.
			$rlid = nextGUID(); // getting next GUID.
  					  			  			
  			// SQL for creating the tables in the database. Do not call, if you do not need any tables in the database 
  						
  			
			$sql1="CREATE TABLE pgn_tickets (  subject text,  name text,  email text,  phone text,  status enum('open','closed') NOT NULL default 'open',  rate int(2) default NULL,  rep int(5) default NULL,  ID int(6) NOT NULL default '0',  cat int(5) NOT NULL default '0',  priority tinyint(1) NOT NULL default '2', tracking varchar(32), INSERTTIMESTAMP DATETIME NOT NULL  PRIMARY KEY  (ID))";
			$sql2="CREATE TABLE pgn_tickets_answers (  ID int(7) NOT NULL auto_increment,  ticket varchar(20) default NULL,  message text,  timestamp int(10) NOT NULL default '0',  rep int(5) NOT NULL default '0',  reference int(7) default NULL,  PRIMARY KEY  (ID))";
			$sql3="CREATE TABLE pgn_tickets_categories (  id int(5) NOT NULL auto_increment,  name varchar(100) NOT NULL default '',  pophost varchar(200) NOT NULL default '',  popuser varchar(200) NOT NULL default '',  poppass varchar(200) NOT NULL default '',  replyto varchar(200) NOT NULL default '',  PRIMARY KEY  (id))";
			$sql4="CREATE TABLE `pgn_tickets_textblocks` (`BLOCK_ID` BIGINT NOT NULL, `NAME` VARCHAR(32) NOT NULL, `CONTENT` LONGTEXT,PRIMARY KEY (`BLOCK_ID`),UNIQUE (`NAME`))"; 
			$sql5="CREATE TABLE pgn_tickets_messages (  ID int(7) NOT NULL auto_increment,  ticket varchar(20) default NULL,  message text,  timestamp int(10) NOT NULL default '0',  PRIMARY KEY  (ID))";
  			
  			  						  			
  			$this->installHandler->addDBAction($sql1); 
  			$this->installHandler->addDBAction($sql2); 
  			$this->installHandler->addDBAction($sql3); 
  			$this->installHandler->addDBAction($sql4); 
  			$this->installHandler->addDBAction($sql5); 
  			$this->installHandler->addDBAction("INSERT INTO roles (ROLE_ID, ROLE_NAME, DESCRIPTION) VALUES ($rlid, 'Customer-Care', 'Manager for question from customers.')");
  			
  			// SQL for deleting the tables from the database. 
  			$this->uninstallHandler->addDBAction("DROP TABLE `pgn_tickets`");
  			$this->uninstallHandler->addDBAction("DROP TABLE `pgn_tickets_answers`");
  			$this->uninstallHandler->addDBAction("DROP TABLE `pgn_tickets_categories`");
  			$this->uninstallHandler->addDBAction("DROP TABLE `pgn_tickets_textblocks`");
  			$this->uninstallHandler->addDBAction("DROP TABLE `pgn_tickets_messages`");
  			$this->uninstallHandler->addDBAction("DELETE FROM roles WHERE ROLE_NAME = 'Customer-Care'");
  			
  			/**** change nothing beyond this point ****/
  			global $source, $classname; // the source path has to be provided by the calling template
  			$modId = nextGUID();
  			$this->installHandler->addDBAction("INSERT INTO modules (MODULE_ID, MODULE_NAME, DESCRIPTION, VERSION, MT_ID, CLASS, SOURCE, MODULE_TYPE_ID) VALUES ($modId, '$this->name', '$this->description', $this->version, $mtid, '$classname', '$source', $this->pluginType)"); 
		
  		}
  	}
  	
  }
  


 ?>