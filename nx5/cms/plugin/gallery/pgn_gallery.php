<?
/**********************************************************************
*	N/X - Web Content Management System
*	Copyright 2002 Sven Weih
*  Flashfilm Copyright 2002 by Eric Funk <eric.funk@bbdo-interone.de>
*
*	This file is part of N/X 2003.
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

$pgnIG = array();
/**
	 * Gallery PlugIn
	 * Version 1.0
	 *
	 * @package Plugins
	 */
class pgnGallery extends Plugin {

	// Name of the Management's Table Primary Key
	var $pk_name = "GALLERY_ID";

	// Name of the Plugin's Management Table. All tables should start with pgn_
	var $management_table = "pgn_gallery";

	// configuration Variables
	var $isSingleConfig = false;
	var $pluginType = 1; // 1= Content Plugin, 2= System Extension
	var $allowSearch = false;
	var $helpfile = "gallery/plugin_gallery.pdf";

	/**
		  * Creates the input fields for editing text
		  * @param integer &$form link to the form the input-fields are to be created in 
		  */
	function edit(&$form) {
		global $lang, $sid, $c;

		$condition = "GALLERY_ID = $this->fkid";
		$form->add(new TextInput($lang->get("galname", "Gallery Name"), "pgn_gallery", "NAME", $condition, "type:text,width:350,size:64", "MANDATORY"));
		$form->add(new TextInput($lang->get("galdesc", "Gallery Description"), "pgn_gallery", "DESCRIPTION", $condition, "type:textarea,width:350,size:4"));
		$form->add(new FolderDropdown($lang->get("gafolder", "Image-Folder"), "pgn_gallery", "IMAGE_FOLDER_ID", $condition));
		$form->add(new TextInput($lang->get("galrows", "Rows"), "pgn_gallery", "ROWS", $condition, "type:text,width:30,size:2", "MANDATORY", "NUMBER"));
		$form->add(new TextInput($lang->get("galcols", "Columns"), "pgn_gallery", "COLS", $condition, "type:text,width:30,size:2", "MANDATORY", "NUMBER"));
		$form->add(new CheckboxInput($lang->get("flashgal", "Flash Gallery"), "pgn_gallery", "GALLERYTYPE", $condition, "1", "0", "NUMBER"));
	}

	/**
	  * Used, for painting a preview of the content in the cms. Note, that the data
	  * is to be drawn in a table cell. Therefore you may design any html output, but
	  * you must return it as return value!
	  */
	function preview() {
		global $c, $variation, $lang;

		$flash = getDBCell("pgn_gallery", "GALLERYTYPE", "GALLERY_ID=".$this->fkid);
		if ($flash ==1) {
			$v = $variation;
			$width = 725;
			$height = 530;
			$content = '<object CLASSID="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" CODEBASE="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="' . $width . '" HEIGHT="' . $height . '" HSPACE="0" VSPACE="0">';
			$content .= '<param NAME="movie" VALUE="' . $c["devdocroot"] . 'sys/pg.swf?pageid=' . $this->fkid . '&v=' . $v . '&xmlfile=' . $c["devdocroot"] . 'sys/galxml.php" />';
			$content .= '<param NAME="quality" VALUE="high" />';
			$content .= '<embed SRC="' . $c["devdocroot"] . 'sys/pg.swf?pageid=' . $this->fkid . '&v=' . $v . '&xmlfile=' . $c["devdocroot"] . 'sys/galxml.php" width="' . $width . '" HEIGHT="' . $height . '" HSPACE="0" VSPACE="0" QUALITY="high" PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer" TYPE="application/x-shockwave-flash"></embed></object>';
			return $content;
		} else {
			return $lang->get("no_preview", "No preview available.");
		}
	}

	/**
		   * This function is used for drawing the html-code out to the templates.
		   * It just returns the code
		   * @param 		string	Optional parameters for the draw-function. There are none supported.
		   * @return		string	HTML-CODE to be written into the template.
		   */
	function draw($param = "") {
		global $c, $v, $variation, $cds, $pgnIG;

		$flash = getDBCell("pgn_gallery", "GALLERYTYPE", "GALLERY_ID=".$this->fkid);
		$imFolder = getDBCell("pgn_gallery", "IMAGE_FOLDER_ID", "GALLERY_ID=" .$this->fkid);
		$width = $param[1];
		$height= $param[2];

		if ($flash ==1) {

			global $c, $splevel, $v;

			if ($splevel == 10) {
				$root = $c["livedocroot"];
			} else {
				$root = $c["devdocroot"];
			}

			$content = '<object CLASSID="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" CODEBASE="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="' . $width . '" HEIGHT="' . $height . '" HSPACE="0" VSPACE="0">';
			$content .= '<param NAME="movie" VALUE="' . $c["devdocroot"] . 'sys/pg.swf?pageid=' . $this->fkid . '&v=' . $v . '&xmlfile=' . $root . 'sys/galxml.php" />';
			$content .= '<param NAME="quality" VALUE="high" />';
			$content .= '<embed SRC="' . $c_root . 'sys/pg.swf?pageid=' . $this->fkid . '&v=' . $v . '&xmlfile=' . $c_root . 'sys/galxml.php" width="' . $width . '" HEIGHT="' . $height . '" HSPACE="0" VSPACE="0" QUALITY="high" PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer" TYPE="application/x-shockwave-flash"></embed></object>';
			return $content;
		} else {
			// ajax gallerie
			if (strtoupper($param[0]) == "HEAD") {

				// get the images from n/x.
				$live = $this->isLive($this->fkid);
				if ($live) {
					$impath = $c["livefilesdocroot"];
				} else {
					$impath = $c["devfilesdocroot"];
				}
				$impath = $c["host"].$impath;
				$syspath = $c["host"]	.$cds->docroot. 'sys/';
				$content = '
	<link rel="stylesheet" href="'.$syspath.'gal.css" type="text/css">
	<script type="text/JavaScript" charset="utf-8">
			
	var photoDir = "'.$impath.'"; // Location of photos for gallery
	var photoIndex = 0;
	var photoArray = new Array(';
				// correct gallery size:
				$width-= 10;
				$height-=40;

				$syspath = $c["host"].$cds->docroot.'sys/';

				$imagePGNId = getDBCell("modules", "MODULE_ID", "UPPER(MODULE_NAME) ='IMAGE'");
				$imageList = createDBCArray("content", "CID", "MODULE_ID = $imagePGNId AND CATEGORY_ID = $imFolder");
				for ($i = 0; $i < count($imageList); $i++) {
					$cid = $imageList[$i];

					if ($live == $this->isLive($cid)) {
						$fkid = getDBCell("content_variations", "FK_ID", "CID = $cid AND DELETED=0 AND VARIATION_ID = $cds->variation");
						$filename = getDBCell("pgn_image", "FILENAME", "FKID=$fkid");
						$iwidth = getDBCell("pgn_image", "WIDTH", "FKID=$fkid");
						$iheight = getDBCell("pgn_image", "HEIGHT", "FKID=$fkid");
						$alt = getDBCell("pgn_image", "ALt", "FKID=$fkid");

						$owidth = $iwidth;
						$oheight = $iheight;

						// Scaling down image.

						$scale = 1;

						if ($iwidth > $width || $iheight > $height) {
							$scale_w = $iwidth / $width;
							$scale_h = $iheight / $height;
							$scale = max($scale_w, $scale_h);
							//scale down
							$iwidth = $iwidth / $scale;
							$iheight = $iheight / $scale;
						}

						if ($i==0) {
							$pgnIG["src"]	 = $impath.$filename;
							$pgnIG["width"] = $iwidth;
							$pgnIG["height"] = $iheight;
							$pgnIG["owidth"] = $owidth;
							$pgnIG["oheight"] = $oheight;
							$pgnIG["alt"] = $alt;
							$pgnIG["count"] = 0;
						}
						$pgnIG["count"]++;

						$content.= 'new Array("'.$filename.'", "'.$iwidth.'", "'.$iheight.'", "'.$alt.'",'.$owidth.','.$oheight.')';
						if ($i+2 < count($imageList)) {
							$content.= ',';
						}
					}
				}
				$pgnIG["count"]--;

				$content.=");
	// Number of photos in this gallery
	var photoNum = photoArray.length-1;
	
	function pgnIGNext() {
	  photoIndex++;
	  if (photoIndex >= photoNum) photoIndex = 0;
	  showPhoto(photoIndex);
	}
	
	function pgnIGPrev() {
	  photoIndex--;
	  if (photoIndex < 0 ) photoIndex = photoNum-1;	  
	  showPhoto(photoIndex);
	}
	
	function showPhoto(imgNum) {
	  var photo = photoArray[imgNum];
	  var src = photoDir + photo[0];
	  var width = photo[1];
	  var height = photo[2];
	  var alt = photo[3];
	  img = document.getElementById('pgnIGImage');
	  img.src = src;
	  img.height = height;
	  img.width = width;
	  img.alt = alt;
	  
	  desc = document.getElementById('pgnIGDescription');
	  desc.innerHTML = '<b>' + (imgNum+1).toString() + '/' + (photoNum+1).toString() + '</b><br>' + alt;
	}
	
	function popupImg() {
	  var photo = photoArray[photoIndex];
	  var src = photoDir + photo[0];
	  var width = photo[4] + 10;
	  var height = photo[5] + 25;  
	  wnd = window.open(src, 'gal', 'height=' + height.toString() + ',width=' + width.toString() + ',toolbar=no,scroobars=no,menubar=no,titlebar=no');	  
	  wnd.focus();
	}
	
	</script>
      ";
				return $content;

			}

			if (strtoupper($param[0]) == "BODY") {
				// get first image.



				$syspath = $c["host"].$cds->docroot.'sys/';
				$content = '<div id="pgnIGContainer" style="width:'.$width.'px;height:'.$height.'px;">
			  <img onClick="popupImg();" style="cursor:pointer;" src="'.$pgnIG["src"].'" alt="'.$pgnIG["alt"].'" width="'.$pgnIG["width"].'" height="'.$pgnIG["height"].'" id="pgnIGImage"/>
	          <div id="pgnIGDescription" align="center"><b>1/'.($pgnIG["count"]+1).'</b><br/>'.$pgnIG["alt"].'</div>
			  <div id="pgnIGButtons" align="center"><a href="#" onClick="pgnIGPrev();return false;"/><img src="'.$syspath.'galprev.gif" border="0" alt="prev"/></a>&nbsp;&nbsp;<a href="#" onClick="pgnIGNext(); return false;"/><img src="'.$syspath.'galnext.gif" border="0" alt="next"/></a></div>
			  </div>';

				return $content;

			}
		}
	}


	/**
	 * Checks, wheter the id is launched or not.
	 *
	 * @param unknown_type $id
	 * @return unknown
	 */
	function isLive($id) {
		if (getDBCell("state_translation", "OUT_ID", "OUT_ID=$id") != "")
		return true;

		return false;
	}

	/**
		  * Create a new Record with the given $this->fkid in the database.
		  * Initialize with standard values!
		  */
	function createRecord() {
		$createHandler = new ActionHandler("CREATE");

		$createHandler->addDBAction("INSERT INTO $this->management_table ($this->pk_name, NAME) VALUES ($this->fkid, ' ')");
		$createHandler->process("CREATE");
	}

	/**
		 * This Function provides all actions for deleting a complete recordset
		 * of a plugin. It shoul use the $this->fkid for identifying the record.
		 */
	function deleteRecord() { Plugin::deleteRecord();
	// does not need to be canged as long working on one table only!
	}

	/**
		   * Create the sql-code for a version of the selected object
		   * @param integer ID of new Version.
		   * @returns string SQL Code for new Version.
		   */
	function createVersion($newid) {
		// query for content
		global $db, $variation;

		$querySQL = "SELECT * FROM pgn_gallery WHERE $this->pk_name = $this->fkid";
		$query = new query($db, $querySQL);
		$query->getrow();
		$name = $query->field("NAME");
		$desc = $query->field("DESCRIPTION");
		$folder = $query->field("IMAGE_FOLDER_ID");
		$cols = $query->field("COLS");
		$rows = $query->field("ROWS");
		$type = $query->field("GALLERYTYPE");
		$query->free();

		// Launch Images.....
		$mod = getDBCell("modules", "MODULE_ID", "UPPER(MODULE_NAME) = 'IMAGE'");
		$images = createDBCArray("content", "CID", "CATEGORY_ID = " . $folder . " AND DELETED=0 AND MODULE_ID = $mod");

		for ($i = 0; $i < count($images); $i++) {
			$image = $images[$i];

			launchContent($image, 10, $variation);
		}

		$sql = "INSERT INTO $this->management_table ($this->pk_name, NAME, DESCRIPTION, COLS, ROWS, IMAGE_FOLDER_ID, GALLERYTYPE) VALUES ($newid, '$name', '$desc', $cols, $rows, $folder, $type)";
		return $sql;
	}

	/**
		 * returns array with names, which need to be deployed when the plugin is installed
		 */
	function getInstallationFiles() {
		return array("galxml.php", "pg.swf", "gal.css", "galnext.gif", "galprev.gif");
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
			$this->name = "Gallery";
			// A short description, what the Plugin is for.
			$this->description = "Gallery Plugin";
			// Version of the plugin. Use integer numbers only. Is important for future releases.
			$this->version = 1;

			// Every module can have its own and individual META-Data in NX. The following Handler is
			// for creating a META-Data-Template and for assigning it to the Plugin.
			// IF you do not want to declare an individual META-Scheme, then set $mtid=0 and delete
			// everything between del1 and /del1!

			/**** do not change from this point ****/
			$mtid = nextGUID(); // getting next GUID.
			//del1
			$this->metaInstallHandler->addDBAction("INSERT INTO meta_templates (MT_ID, NAME, DESCRIPTION, INTERNAL) VALUES ($mtid, '$this->name PlugIn-Scheme', 'internally used for assigning $this->name plugin meta data', 1)");

			define("_TEXT", 1);
			define("_TEXTAREA", 2);
			define("_COLOR", 3);

			/**** add META-Data now ****/
			$guid = nextGUID();
			$this->metaInstallHandler->addDBAction("INSERT INTO meta_template_items (MTI_ID, MT_ID, NAME, POSITION, MTYPE_ID) VALUES($guid, $mtid, 'Keywords', 1, " . _TEXTAREA . ")");

			/**** end adding META-Data ****/
			// /del1

			// SQL for creating the tables in the database. Do not call, if you do not need any tables in the database
			$this->installHandler->addDBAction(
			"CREATE TABLE `pgn_gallery` ( `GALLERY_ID` BIGINT NOT NULL, `NAME` VARCHAR(64) NOT NULL, `DESCRIPTION` VARCHAR(255), `IMAGE_FOLDER_ID` BIGINT NOT NULL, `COLS` TINYINT DEFAULT '2' NOT NULL, `ROWS` TINYINT DEFAULT '4' NOT NULL, `GALLERYTYPE` TINYINT DEFAULT '0' NOT NULL, PRIMARY KEY (`GALLERY_ID`) );");
			// SQL for deleting the tables from the database.
			$this->uninstallHandler->addDBAction("DROP TABLE `pgn_gallery`");

			/**** change nothing beyond this point ****/
			global $source, $classname; // the source path has to be provided by the calling template
			$modId = nextGUID();
			$this->installHandler->addDBAction("INSERT INTO modules (MODULE_ID, MODULE_NAME, DESCRIPTION, VERSION, MT_ID, CLASS, SOURCE, MODULE_TYPE_ID) VALUES ($modId, '$this->name', '$this->description', $this->version, $mtid, '$classname', '$source', $this->pluginType)");
		}
	}
}


?>