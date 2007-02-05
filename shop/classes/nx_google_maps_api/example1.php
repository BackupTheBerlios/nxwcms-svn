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

// add an address. the address is geocoded in the webbrowser, not by the server!
$api->addAddress("10 market st, san francisco", "Market St<br>This is the info for this point", true);
$api->addAddress("10 california st, san francisco", "California St<br>This is the info for this point", false);


?>
<head>

<?php echo $api->getHeadCode(); ?>

</head>

<body onLoad="<?php echo $api->getOnLoadCode(); ?>">

<h1> Adding Addresses to the map </h1>

<?php echo $api->getBodyCode(); ?>

</body>
</html>