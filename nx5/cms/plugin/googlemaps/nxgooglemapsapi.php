<?php

/**
* N/X API to Google Maps 
* Uses Google Maps API 2.0 to create customizable maps
* that can be embedded on your website
*
*    Copyright (C) 2006  Sven Weih <sven@nxsystems.org>
*
*    This program is free software; you can redistribute it and/or modify
*    it under the terms of the GNU General Public License as published by
*    the Free Software Foundation; either version 2 of the License, or
*    (at your option) any later version.
*
*    This program is distributed in the hope that it will be useful,
*    but WITHOUT ANY WARRANTY; without even the implied warranty of
*    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
*    GNU General Public License for more details.
*
*    You should have received a copy of the GNU General Public License
*    along with this program; if not, write to the Free Software
*    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA 
*/



/**
 * Allowed Controls:
 * GLargeMapControl - a large pan/zoom control used on Google Maps. Appears in the top left corner of the map.
 * GSmallMapControl - a smaller pan/zoom control used on Google Maps. Appears in the top left corner of the map.
 * GSmallZoomControl - a small zoom control (no panning controls) used in the small map blowup windows used to display driving directions steps on Google Maps.
 * GScaleControl - a map scale
 * GMapTypeControl - buttons that let the user toggle between map types (such as Map and Satellite)
 * GOverviewMapControl - a collapsible overview map in the corner of the screen
 */
 
  define( GLargeMapControl 		, 'GLargeMapControl()');
  define( GSmallMapControl 		,	 'GSmallMapControl()');
  define( GSmallZoomControl 	, 'GSmallZoomControl()');
  define( GScaleControl     	, 'GSCALEControl()');
  define( GMapTypeControl   	, 'GMapTypeControl()');
  define( GOverviewMapControl , 'GOverviewMapControl()');

/**
 * API-Class for accessing Google Maps 
 */
class NXGoogleMapsAPI {

  // The Google Maps API Key
  var $apiKey;
  
  // Width and Height of the Control
  var $width;
  var $height;
  
  // GoogleMaps output div id
  var $divId;
  
  // ZoomFactor
  var $zoomFactor;
  
  // Map Center Coords
  var $centerX;
  var $centerY;
  
  // Address Array
  var $addresses;
  
  // GeoPoint Array
  var $geopoints;
  
  // Arrays with the controls that will be displayed
  var $controls;
  

  /**
   * Constructor
   *
   * @param string $apiKey The Google Maps API-Key for your domain.
   */
  function NXGoogleMapsAPI($apiKey) {
    $this->apiKey = $apiKey;
    $this->_initialize();
  }
  
  
  /**
   * Add an address-marker to the map. The address is resolved by the webbrowser.
   * with the Google Geocoder.
   *
   * @param string address which should be add. test with google maps
   * @param string HTML-Code which will be displayed when the user clicks the address
   * @param boolean Set the Center to this point(true) or not (false)
   */
  function addAddress($address, $htmlinfo, $setCenter=true) {
    $ar = array(addSlashes($address), addSlashes($htmlinfo), $setCenter);
    array_push($this->addresses, $ar);	
  }
  
  /**
   * Add a geopoint to the map. 
   *
   * @param integer Longitude of the point
   * @param integer Latitude of the point
   * @param string HTML-Code which will be displayed when the user clicks the address
   * @param boolean Set the Center to this point(true) or not (false)
   */  
  function addGeoPoint($longitude, $latitude, $htmlinfo, $setCenter) {
    $ar = array($longitude, $latitude, addSlashes($htmlinfo), $setCenter);
    array_push($this->geopoints, $ar);	
  }
  
  /**
   * Adds a control to the map
   *
   * @param control Control-Type. Allowed are the constants described in the header of this file.
   *      
   */      
  function addControl($control) {
  	array_push($this->controls, $control);
  }
  
  /**
   * Set the ZoomFactor
   * The ZoomFactor is a value between 0 and 17
   *
   * @param integer $zoomFactor
   */
  function setZoomFactor($zoomFactor) {
  	 if ($zoomFactor > -1 && $zoomFactor < 18) {
  	   $this->zoomFactor = $zoomFactor;
  	 }
  }
  
  /**
   * Center the map to the coordinates
   *
   * @param integer $x Longitude
   * @param integer $y Latitude
   */
  function setCenter($x, $y) {
  	$this->centerX = $x;
  	$this->centerY = $y;
  }
  
  
  /**
   * Returns the HTML-Code, which must be placed within the <HEAD>-Tags of your page.
   *
   * @returns string
   */
  function getHeadCode() {
  	$out = '
 <style type="text/css">
  	 v\:* {
       behavior:url(#default#VML);
     }
    </style>
    <script src="http://maps.google.com/maps?file=api&v=2&key='.$this->apiKey.'"  type="text/javascript"></script>';
   $out.= $this->_getGMapInitCode();
   return $out;
  }
  
  /**
   * Get the BodyCode and draw the map.
   *
   * @returns string
   */
  function getBodyCode() {
  	$out = '<div id="'.$this->divId.'" style="width:'.$this->width.'px;height:'.$this->height.'px;"></div>';  	
  	return $out;
  }
  
  /**
   * Get the code, which must be passed to the <body>-attribute onLoad.
   *
   * @returns string
   */
  function getOnLoadCode() {
  	$out = "initNXGMap(document.getElementById('$this->divId'));";
  	return $out;
  }
  
  
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////// Internal functions /////////////////////////////////////////////////////////////////////////////////  
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////  
  
  /** 
   * Compiles the Javascript to initialize the map.
   * Is automatically called, so do not call yourself.
   */
  function _getGMapInitCode() {
  	$out = '
<script type="text/javascript">
//<![CDATA[
var map = null;
var geocoder = null;';
      
			 // Add Geopoints Array
			 $out.="\n";
      if ( count($this->geopoints) > 0 ) {      	
      	$out.= 'var geopoints = new Array(';
      	for ($i=0; $i < count($this->geopoints); $i++) {
      	  	$out.= ' new Array('.$this->geopoints[$i][0].','.$this->geopoints[$i][1].' ,"'.$this->geopoints[$i][2].'", ';
      	  	// move to this address?
      	  	if ($this->geopoints[$i][3]) {
      	  		$out.='true';
      	  	} else {
      	  		$out.='false';
      	  	}
      	  	$out.=')';
      	  	if ($i < (count($this->geopoints)-1)) $out.=', ';
      	}
      	$out.=");\n";
      } else {
      	  $out.="var geopoints = new Array();\n";
      }
      
			 // Add Addresses Array      
      $out.="\n";
      if ( count($this->addresses) > 0 ) {      	
      	$out.= 'var addresses = new Array(';
      	for ($i=0; $i < count($this->addresses); $i++) {
      	  	$out.= ' new Array("'.$this->addresses[$i][0].'", "'.$this->addresses[$i][1].'", ';
      	  	// move to this address?
      	  	if ($this->addresses[$i][2]) {
      	  		$out.='true';
      	  	} else {
      	  		$out.='false';
      	  	}
      	  	$out.=')';
      	  	if ($i < (count($this->addresses)-1)) $out.=', ';
      	}
      	$out.=");\n";
      } else {
      	  $out.="var addresses = new Array();\n";
      }
    	
    	// Draw standard js-functions and initialization code.
    	$out.='
function showAddresses() {
  for (i=0; i < addresses.length; i++) {
 	  	showAddress(addresses[i][0], addresses[i][1], addresses[i][2]);
  }	
}
    	
function showAddress(address, htmlInfo, moveToPoint) {
 if (geocoder) {
   geocoder.getLatLng(
     address,
     function(point) {
       if (!point) {
         alert("Location not found:" + address);
       } else {              
         if (moveToPoint) {
           map.setCenter(point, '.$this->zoomFactor.');
         }
         var marker = new GMarker(point);
         map.addOverlay(marker);
         if (htmlInfo != "") {
           GEvent.addListener(marker, "click", function() {
              marker.openInfoWindowHtml(htmlInfo);
           });              
         }
       }
     }
   );
  }
}

function showGeopoints() {
  for (i=0; i < geopoints.length; i++) {
 	  	showGeopoint(geopoints[i][0], geopoints[i][1], geopoints[i][2], geopoints[i][3]);
  }	
}

function showGeopoint(longitude, latitude, htmlInfo, moveToPoint) {
  if (moveToPoint) {
    map.setCenter(new GLatLng(longitude, latitude), '.$this->zoomFactor.');
  }
  var marker = new GMarker(new GLatLng(longitude, latitude));
  map.addOverlay(marker);
  if (htmlInfo != "") {
    GEvent.addListener(marker, "click", function() {
      marker.openInfoWindowHtml(htmlInfo);
    });              
     }   
}

function moveToGeopoint(index) {
	map.panTo(geopoints[index][0], geopoints[index][1]);
}

function moveToAddress(index) {
 if (geocoder) {
 
   geocoder.getLatLng(
     addresses[index][0],
     function(point) {
       if (!point) {
         alert("Location not found:" + address);
       } else {              
          map.panTo(point);                  
       }
     });    
  }
}
    	
function initNXGMap(mapElement) {
 	if (GBrowserIsCompatible()) {
		map = new GMap2(mapElement);        
		geocoder = new GClientGeocoder();';
      
      // Add controls to the map
   
      if (count($this->controls) > 0) {
        for ($i=0; $i<count($this->controls); $i++) {
          $out.=" map.addControl(new ".$this->controls[$i].");\n";
        }
      }
      
      // Center the map
      if (($this->centerX != -1000) && ($this->centerY != -1000)) {      	
      	$out.= '    map.setCenter(new GLatLng('.$this->centerX.', '.$this->centerY.'), '.$this->zoomFactor.');'."\n";      	
      }
      
      // Add AddressPoints
			$out.="    showAddresses();\n";  
			// Add GeoPoints
			$out.="    showGeopoints();\n";
          
     $out.="\n";
     $out.=' 	}
    	}
     //]]>
  	 </script>';
  	return $out;
  }
  
  /**
   * Initializes the standard values of the class. 
   * Is automatically called by the constructor.
   */
  function _initialize() {
  	$this->width 			= 600;
  	$this->height 		= 450;
  	$this->divId    	= 'map';
  	$this->zoomFactor = 14;
  	$this->centerX    = -1000;
  	$this->centerY    = -1000;
  	$this->addresses  = array();
  	$this->geopoints  = array();
  	$this->controls   = array();
  }

}

?>