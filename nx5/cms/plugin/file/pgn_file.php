<?
	/**********************************************************************
	 *	N/X - Web Content Management System
	 *	Copyright 2003 Sven Weih, FZI Research Center for Information Technologies
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
	 * File PlugIn
	 * Version 1.0
	 *
	 * @package Plugins
	 */
	class pgnFile extends Plugin {

		// Name of the Management's Table Primary Key
		var $pk_name = "FKID";

		// Name of the Plugin's Management Table. All tables should start with pgn_
		var $management_table = "pgn_file";

		/**
		  * Creates the input fields for editing images
		  * @param integer &$form link to the form the input-fields are to be created in 
		  */
		function edit(&$form) {
			global $lang, $c;

			require_once $c["path"] . "plugin/file/fileupload.inc.php";
			$condition = "FKID = $this->fkid";
			$form->add(new TextInput($lang->get("NAME"), "pgn_file", "NAME", $condition, "type:text,width:300,size:64", "MANDATORY"));
			$form->add(new TextInput($lang->get("DESC", "Description"), "pgn_file", "DESCRIPTION", $condition, "type:textarea,width:300,size:3", ""));
			$form->add(new TextInput($lang->get("LOCATION", "Location, if external"), "pgn_file", "LOCATION", $condition, "type:text,width:300,size:64", ""));

			$form->add(new FileUpload($lang->get("choosefile"), $this->fkid));
			$form->add(new Label("lbl", $lang->get("CLEAR_MEDIA", "Remove file from database"), "standard"));
			$form->add(new Checkbox("REMOVE", "1", "standard"));
		}

		/** 
		  * Used, for painting a preview of the content in the cms. Note, that the data
		  * is to be drawn in a table cell. Therefore you may design any html output, but
		  * you must return it as return value!
		  */
		function preview() {
			global $c;

			$width = getDBCell("pgn_image", "WIDTH", "FKID = $this->fkid");
			$height = getDBCell("pgn_image", "HEIGHT", "FKID = $this->fkid");

			if ($width == 0 && $height == 0)
				return "<div align=\"center\">No image uploaded yet.</div>";

			// Scaling down image.
			$scale_to = 200; //scale to 200px.
			$scale = 1;
			$dwidth = $width;
			$dheight = $height;

			if ($width > $scale_to || $height > $scale_to) {
				$scale_w = $width / $scale_to;

				$scale_h = $height / $scale_to;
				$scale = max($scale_w, $scale_h);
				//scale down
				$dwidth = $width / $scale;
				$dheight = $height / $scale;
			}

			$alt = getDBCell("pgn_image", "ALT", "FKID = $this->fkid");
			$filename = getDBCell("pgn_image", "FILENAME", "FKID = $this->fkid");
			$copyright = getDBCell("pgn_image", "COPYRIGHT", "FKID = $this->fkid");

			// painting preview.
			mt_srand ((double)microtime() * 1000000);
			$randval = mt_rand();
			$output = "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\n";
			$output .= "<tr><td class=\"standardlight\"><b>Width:</b> $width<br><b>Height:</b> $height<br><br><b>ALT-Tag:</b> $alt<br><b>Copyright:</b> $copyright</td><td><a href=\"#\" border=\"0\" onClick=\"preview = window.open('" . $c["devfilesdocroot"] . $filename . "', '', 'width=$width,height=$height,scrollbars=no,status=no,menubar=no');\"><img src=\"" . $c["devfilesdocroot"] . $filename . "?$randval\" width=\"$dwidth\" height=\"$dheight\" alt=\"$alt\" border=\"0\"></a></td></tr>";
			$output .= "</table>";
			return $output;
		}

	

		/**
		   * This function is used for drawing the html-code out to the templates.
		   * @param 		string  Parameters of Image. Allowed are ALL and TAG.
								   If ALL is set, an array of following form is returned: 
								   array["path"], array["width"], array["height"], array["alt"], array["copyright"] 
		   * @returns		string	HTML-CODE to be written into the template.
		   */
		function draw($param = "") {
			global $c, $db, $splevel, $cds;

			$sql = "SELECT * FROM $this->management_table WHERE $this->pk_name = $this->fkid";
			$query = new query($db, $sql);
			$query->getrow();
			$filename = $query->field("FILENAME");
			
			if (is_object($cds)) {
			  $splevel = $cds->level;
			}
			if ($splevel == 10) {
				$im["path"] = $c["livefilesdocroot"] . $filename; // splevel=10 is for live-site, 0 for development.
			//  $im["tpath"] = $c["livefilesdocroot"]."t".$filename;
			//  $im["gtpath"] = $c["livefilesdocroot"]."gt".$filename;
			}

			if ($splevel == 0) {
				$im["path"] = $c["devfilesdocroot"] . $filename;
			//  $im["tpath"] = $c["devfilesdocroot"]."t".$filename;
			//  $im["gtpath"] = $c["devfilesdocroot"]."gt".$filename;
			}

			$im["width"] = $query->field("WIDTH");
			$im["height"] = $query->field("HEIGHT");

			//$this->width = $im["width"];
			//$this->height = $im["height"];
			//$scaled = $this->scale();
			//$im["twidth"] = $scaled["WIDTH"];
			//$im["theight"] = $scaled["HEIGHT"];
			$im["copyright"] = $query->field("COPYRIGHT");
			$im["alt"] = $query->field("ALT");

			if (stristr($param, "ALL"))
				return $im;

			if ($im["width"] != 0) {
				$tag = "<img src=\"" . $im["path"] . "\" width=\"" . $im["width"] . "\" height=\"" . $im["height"] . "\" alt=\"" . $im["alt"] . "\" border=\"0\" >";
			} else {
				$tag = "";
			}

			$query->free();
			return $tag;
		}

		/**
		  * Create a new Record with the given $this->fkid in the database.
		  * Initialize with standard values!
		  */
		function createRecord() {
			$createHandler = new ActionHandler("CREATE");

			$createHandler->addDBAction("INSERT INTO $this->management_table ($this->pk_name, FILENAME, ALT, WIDTH, HEIGHT, COPYRIGHT) VALUES ($this->fkid, '', '', 0,0,'')");
			$createHandler->process("CREATE");
		}

		/**
		 * This Function provides all actions for deleting a complete recordset
		 * of a plugin. It shoul use the $this->fkid for identifying the record.
		 */
		function deleteRecord() { Plugin::deleteRecord();
			// does not need to be changed as long working on one table only!
			}

		/**
		   * Create the sql-code for a version of the selected object
		   * @param integer ID of new Version.
		   * @returns string SQL Code for new Version.
		   */
		function createVersion($newid, $copy = false) {
			// query for content
			global $db, $c;

			$destinationPath = $c["livefilespath"];

			if ($copy)
				$destinationPath = $c["devfilespath"];

			$querySQL = "SELECT * FROM $this->management_table WHERE $this->pk_name = $this->fkid";
			$query = new query($db, $querySQL);
			$query->getrow();
			$width = addslashes($query->field("WIDTH"));
			$height = addslashes($query->field("HEIGHT"));
			$alt = addslashes($query->field("ALT"));
			$copyright = addslashes($query->field("COPYRIGHT"));
			$filename = $query->field("FILENAME");
			$query->free();
			// copy image to new version
			$fileparts = explode(".", $filename);
			$suffix = strtolower($fileparts[(count($fileparts) - 1)]);
			$newfile = $newid . "." . $suffix;

			if (!$copy) {
				nxDelete ($destinationPath , $newfile);
			}

			//if (file_exists($c["livefilespath"]."t".$newfile) && $filename != "") unlink($c["livefilespath"]."t".$newfile);
			//if (file_exists($c["livefilespath"]."gt".$newfile) && $filename != "") unlink($c["livefilespath"]."gt".$newfile);
			if ($suffix != "") {
				nxCopy($c["devfilespath"] . $filename, $destinationPath , $newfile);
			}

			//if ($filename != "") copy($c["devfilespath"]."t".$filename, $c["livefilespath"]."t".$newfile);
			//if ($filename != "") copy($c["devfilespath"]."gt".$filename, $c["livefilespath"]."gt".$newfile);
			$sql = "INSERT INTO $this->management_table ($this->pk_name, FILENAME, ALT, WIDTH, HEIGHT, COPYRIGHT) VALUES ($newid, '$newfile', '$alt', $width, $height, '$copyright')";
			return $sql;
		}

		function copyRecord($newid) { return $this->createVersion($newid, true); }

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
				$this->name = "File";
				// A short description, what the Plugin is for.
				$this->description = "File Uploads. Accepts all type of files.";
				// Version of the plugin. Use integer numbers only. Is important for future releases.
				$this->version = 1;

				// Every module can have its own and individual META-Data in NX. The following Handler is
				// for creating a META-Data-Template and for assigning it to the Plugin.
				// IF you do not want to declare an individual META-Scheme, then set $mtid=0 and delete
				// everything between del1 and /del1!
				$mtid = nextGUID();

				// SQL for creating the tables in the database. Do not call, if you do not need any tables in the database 
				$this->installHandler->addDBAction("CREATE TABLE `pgn_file` (`FKID` BIGINT NOT NULL ,`NAME` VARCHAR( 64 ) NOT NULL ,`DESCRIPTION` VARCHAR( 255 ) ,`FILENAME` VARCHAR( 255 ) ,`FILETYPE` VARCHAR( 32 ) ,`LOCATION` VARCHAR( 128 ), `DOWNLOADS` BIGINT ,PRIMARY KEY ( `FKID` ))");

				// SQL for deleting the tables from the database. 
				$this->uninstallHandler->addDBAction("DROP TABLE `pgn_file`");

				/**** change nothing beyond this point ****/
				global $source, $classname; // the source path has to be provided by the calling template
				$modId = nextGUID();
				$this->installHandler->addDBAction("INSERT INTO modules (MODULE_ID, MODULE_NAME, DESCRIPTION, VERSION, MT_ID, CLASS, SOURCE) VALUES ($modId, '$this->name', '$this->description', $this->version, $mtid, '$classname','$source')");
			}
		}
	}
?>