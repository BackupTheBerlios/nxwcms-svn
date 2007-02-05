<html>
<?php
require "nxgooglemapsapi.php";


$api = new NXGoogleMapsAPI();

// setup the visual design of the control
$api->setWidth(800);
$api->setHeight(600);
$api->setZoomFactor(16);
$api->addControl(GLargeMapControl);
$api->addControl(GMapTypeControl);
$api->addControl(GOverviewMapControl);

// geocode address and add the points to form afterwards.
// if the geocoding fails, longitude and latitude are both set to 0.
$coord1 = $api->geoCodeAddress("10 market st, san francisco");
$coord2 = $api->geoCodeAddress("10 california st, san francisco");

$api->addGeoPoint($coord1['longitude'], $coord1['latitude'], "Market St<br>This is the info for this point", true);
$api->addGeoPoint($coord2['longitude'], $coord2['latitude'], "California St<br>This is the info for this point", false);


?>
<head>

<?php echo $api->getHeadCode(); ?>

</head>

<body onLoad="<?php echo $api->getOnLoadCode(); ?>">

<h1> Adding Addresses to the Map with server-side geocoding</h1>

<?php echo $api->getBodyCode(); ?>

</body>
</html>