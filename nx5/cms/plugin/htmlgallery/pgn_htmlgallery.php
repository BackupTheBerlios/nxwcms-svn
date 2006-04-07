<?
	/**********************************************************************
	 *	N/X - Web Content Management System
	 *	Copyright 2003 Fabian Koenig
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
	 * HTMLGallery PlugIn
	 * Version 1.0
	 *
	 * @package Plugins
	 */
	class HTMLGallery extends Plugin {

		
        
		var $pluginType = 3; //CDS-API-Extension
        
		/**
		   * This function is used for drawing the html-code out to the templates.
		   * It just returns the code
		   * @param 		string	Optional parameters for the draw-function. There are none supported.
		   * @return		string	HTML-CODE to be written into the template.
		   */
		function draw($param = "") {
			return new CDS_HTMLGallery();
		}
	

		/**
		   * Specifies information for installation and deinstallation of the plugin.
		   */
		function registration() {
			global $auth;	
			if ($auth->checkPermission("ADMINISTRATOR")) {
				Plugin::registration();
				$this->name = "HTMLGallery";
				$this->description = "CDS-API-Extension for drawing a HTML-Photo-Gallery from a list of images.";
				$this->version = 1;
				$mtid = nextGUID(); // getting next GUID.
				global $source, $classname; // the source path has to be provided by the calling template
				$modId = nextGUID();
				$this->installHandler->addDBAction("INSERT INTO modules (MODULE_ID, MODULE_NAME, DESCRIPTION, VERSION, MT_ID, CLASS, SOURCE, MODULE_TYPE_ID) VALUES ($modId, '$this->name', '$this->description', $this->version, $mtid, '$classname', '$source', 3)");
			}
		}
	}
	
	/**
	 * Paints weather buttons of germany from wetter.com
	 */
	class CDS_HTMLGallery {
		
		var $thumbPrefix;
		var $columns;
		var $class;
		var $style;
		var $fullclass;
		var $fullstyle;
		var $width;
	
		/**
		 * Standard constructor
		 */
		 function CDS_HTMLGallery() {
		 	
		 	$this->thumbPrefix = "t";
		 	$this->columns = 3;
		 	$this->quickLinks = true;
		 	$this->width = 550;
		 	$this->spacing = 5;
		 	
		 	$this->twidth = (($this->width - ($this->spacing * ($this->columns - 1))) / $this->columns);
		 	
		 }
		 
		 
		/**
		 * Draws the main view of the gallery
		 * @param		array	Array of images to be retrieved with getContentField(ALL) or $api->content->getField(ALL)
		 * @return		string	HTML-CODE to be written into the template.
		 */		
		function draw($array) {
			$image = value("image");
			
			if ($image > 0) {
		 		return $this->drawFullScreen($array, $image);	
		 	} else {
		 		return $this->drawGallery($array);
		 	}
		}
		
		/**
		 * Draws the main view of the gallery
		 * @return		string	HTML-CODE to be written into the template.
		 */
		function drawGallery($array) {
			global $page, $cds, $v;
			
			if (!isset($page))
				$page = value("page");
				
			if (!isset($v))
				$v = value("v");

			$output =  "<table border='0' class='$this->class' style='$this->style'>\n";
			for ($i=0; $i < ceil((count($array)/$this->columns)); $i++) {
				$output .= "<tr>\n";
				for ($k=0; $k<$this->columns; $k++) {
					$imageID = ($this->columns * $i) + $k;
					if ($array[$imageID]["width"] > 0) {
						if ($array[$imageID]["twidth"] > 0) {
							$theight = $array[$imageID]["theight"] * $this->twidth / $array[$imageID]["twidth"];
							$tpath = $array[$imageID]["tpath"];
						} else {
							$theight = $array[$imageID]["height"] * $this->twidth / $array[$imageID]["width"];
							$tpath = $array[$imageID]["path"];
						}
						$output .= "<td>\n";
						$output .= "<a href='".doc()."?page=".$page."&v=$v&image=".($imageID+1)."'>";
						$output .= "<img src='".$tpath."' width='".floor($this->twidth)."' height='".floor($theight)."' border='0'>";
						$output .= "</a>\n";
						$output .= "</td>\n";
						if ($k < ($this->columns-1)) {
							$output .= "<td>\n";
							$output .= $cds->tools->spacer($this->spacing, $this->spacing);
							$output .= "</td>\n";
						}
					}
				}
				$output .= "</tr>\n";	
				
				$output .= "<tr>\n";
				$output .= "<td colspan='".(($this->columns*2)-1)."'>\n";
				$output .= $cds->tools->spacer($this->spacing, $this->spacing);
				$output .= "</td>\n";
				$output .= "</tr>\n";
			}
			$output .= "</table>\n";
			
			return $output;
		}
		
		/**
		 * Draws the fullscreen-view of an image
		 * @param 	array	array of images
		 * @param 	integer ID of the image to draw.
		 * @return	string	HTML-CODE to be written into the template.
		 */
		function drawFullScreen($array, $id) {
			$imageID = $id-1;
			$width = floor($array[$imageID]["width"]);
			$height = floor($array[$imageID]["height"]);
			if ($this->width < $array[$imageID]["width"]) {
				$width = floor($this->width);
				$height = floor($array[$imageID]["height"] * $width / $array[$imageID]["width"]);
			}
			$output = "<center><img src='".$array[$imageID]["path"]."' width='$width' height='$height' border='0' class='$this->fullclass' style='$this->fullstyle'></center>";
			$output .= "<br>\n";
			$output .= $this->drawNavigation($array, $id);
			
			return $output;
		}
		
		
		/**
		 * Draws the navigation elements to go back and forth in fullscreen-view.
		 */
		function drawNavigation($array, $id) {
			global $page, $v;
			
			if (!isset($page))
				$page = value("page");
				
			if (!isset($v))
				$v = value("v");
				
			$previous = "&nbsp;<a href='".doc()."?page=$page&v=$v&image=".($id-1)."'>[<-]</a>&nbsp;\n";
			$index = "&nbsp;<a href='".doc()."?page=$page&v=$v&image=0'>[Index]</a>&nbsp;\n";
			$next = "&nbsp;<a href='".doc()."?page=$page&v=$v&image=".($id+1)."'>[->]</a>&nbsp;\n";
			
			$output = "<center>";
			if ($id > 1)
				$output .= $previous;
				
			$output .= $index;
			
			if ($id < count($array))
				$output .= $next;
				
			$output .= "</center>";
			
			return $output;
		}
		
		/**
		 * Draws the quick-links to directly switch from one image to another in fullscreen-view
		 * @return		string	HTML-CODE to be written into the template.
		 */
		function drawQuickLinks() {
			
		}
		
		 /**
		  * Draws current weather of a town.
		  * @param string ZIP of the town (PLZ)
		  * @param string design of the button (Numeric 0-9)
		  */
		 function drawCurrentWeather($zip, $design, $region="DEPLZ") {
		 	return $this->_draw('C', $zip, $this->_getDesign($design), $region);
		 }
		 
		 /**
		  * Draws forecast weather of a town.
		  * @param string ZIP of the town (PLZ)
		  * @param string design of the button (Numeric 0-9)
		  */
		 function drawForecastWeather($zip, $design, $region="DEPLZ") {
		   return $this->_draw('F', $zip, $this->_getDesign($design), $region);	
		 }
		 
		 /**
		  * Translate numeric-values into wetter.com-design
		  * @param integer Number (0-9) of design
		  */
		 function _getDesign($design) {
		   $designs=array("1", "1b", "1c", "1d", "2", "2b", "2c", "3", "4", "5");
		   return $designs[$design];	
		 }
		 
		 /**
		  * Draw the html of the button
		  * @param string C or F, depending on Current or Forecast
		  * @param string Zip
		  * @param string Design of _getDesign
		  * @param string Region, e.g. DEPLZ
		  */
		 function _draw($when, $zip, $design, $region) {
		    return '<a href="http://www.wetter.com/home/extern/ex_search.php?ms=1&ss=1&sss=2&search='.$zip.'"><img src="http://www.wetter.com/home/woys/woys.php?,'.$when.','.$design.','.$region.','.$zip.'" border="0" alt=""></a>';	
		 }
		
		
	}

?>