<html>
<?php
require "nxgooglemapsapi.php";


$api = new NXGoogleMapsAPI();

// setup the visual design of the control
$api->setWidth(800);
$api->setHeight(600);
$api->setZoomFactor(10);
$api->addControl(GSmallMapControl);
$api->divId = "mapid";
// center to a point
$api->setCenter(51,11);


?>
<head>

<?php echo $api->getHeadCode(); ?>

</head>

<body onLoad="<?php echo $api->getOnLoadCode(); ?>">

<h1> Getting Geocodes </h1>

<?php echo $api->getBodyCode(); ?>
<br><br>
Search for an address. Drag the red flag afterwards.
<input type="text" value="" name="address" id="address"><input type="button" value="Search Address" onClick="moveToAddressDMarker(document.getElementById('address').value);"> 

<!-- Coordinates are always written to coordX and coordY -->
X: <input type="text" value="" id="coordX">  Y: <input type="text" value="" id="coordY">


</body>
</html>