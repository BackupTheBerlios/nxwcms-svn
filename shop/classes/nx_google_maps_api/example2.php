<html>
<?php
require "nxgooglemapsapi.php";


$api = new NXGoogleMapsAPI();

// setup the visual design of the control
$api->setWidth(800);
$api->setHeight(600);
$api->setZoomFactor(5);
$api->addControl(GSmallMapControl);

// add a point. 
$api->addGeoPoint(50,10, "Somewhere in Germany", false);
// center to a point
$api->setCenter(51,11);


// set to hybrid mode
$api->setMapType(VTHybrid);


?>
<head>

<?php echo $api->getHeadCode(); ?>

</head>

<body onLoad="<?php echo $api->getOnLoadCode(); ?>">

<h1> Adding Geopoints to the map and view map in hybrid mode</h1>

<?php echo $api->getBodyCode(); ?>

</body>
</html>