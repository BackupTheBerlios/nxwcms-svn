<html>
<?php
require "nxgooglemapsapi.php";


$api = new NXGoogleMapsAPI();

// setup the visual design of the control
$api->setWidth(800);
$api->setHeight(600);
$api->setZoomFactor(6);
$api->addControl(GSmallMapControl);

// define points
$points = array(array(50,10,'Point1'), array(51,15, 'Point2'));

// add a point. 
for ($i=0; $i<count($points); $i++) {
  $api->addGeoPoint($points[$i][0],$points[$i][1], $points[$i][2] , true);
}

//define addresses
$addresses = array(array('Stuttgart, Germany', 'Stuttgart'), array('Munich, Germany', 'Munich'));

// add the addresses
for ($i=0; $i<count($addresses); $i++) {
  $api->addAddress($addresses[$i][0], $addresses[$i][1], true);
}


?>
<head>

<?php echo $api->getHeadCode(); ?>

</head>

<body onLoad="<?php echo $api->getOnLoadCode(); ?>">

<h1> Scrolling the map </h1>

<?php echo $api->getBodyCode(); ?>
<br><br>
<?php
// draw the links for the geopoints
for ($i=0; $i< count($points); $i++) {
  echo '<a href="#" onclick="moveToGeopoint('.$i.');">Move to '.$points[$i][2].'</a><br>';
}

// draw the links for the addresses
for ($i=0; $i< count($addresses); $i++) {
  echo '<a href="#" onclick="moveToGeopoint('.$i.');">Move to '.$addresses[$i][1].'</a><br>';
}


?>

</body>
</html>