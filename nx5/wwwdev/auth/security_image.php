<?php
/*** *** *** *** *** ***
*	File: security_image.php
*	Start: August 27th, 2006
*	Author: Douglas Rennehan
*	License Info: http://www.opensource.org/licenses/gpl-license.php
*** *** *** *** *** ***
* This program is free software; you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation; either version 2 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program; if not, write to the Free Software
* Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
*** *** *** *** *** ***/
define('IN_LOGIN_SYS', true);
include_once('includes/connect.php');
$ext_prefix = (PHP_SHLIB_SUFFIX == 'dll') ? 'php_' : '';
if (!extension_loaded('gd') && !@dl($ext_prefix . 'gd.' . PHP_SHLIB_SUFFIX)) {
die($l['image_gd_library']);
}

header('Content-Type: image/png', true);
$height = rand(100, 150);
$width = rand(300, 350);
$random_id = (isset($_GET['id']) && strlen($_GET['id']) == 32) ? $_GET['id'] : '';
	if ($random_id == '') {
	$text_string = 'Quadodo Login System';
	}
	else {
	$result = mysql_query("SELECT * FROM `{$prefix}image_verification` WHERE `random_id`='{$random_id}'") or die(mysql_error());
	$row = mysql_fetch_array($result);
		if ($row['id'] == '') {
		$text_string = 'Quadodo Login System';
		}
		else {
			if ($row['real_text'] == '') {
			$text_string = 'Quadodo Login System';
			}
			else {
			$text_string = $row['real_text'];
			}
		}
	}

$image = imagecreatetruecolor($width, $height);
$colors = array(
	imagecolorallocate($image, 255, 255, 255),
	imagecolorallocate($image, 255, 0, 0),
	imagecolorallocate($image, 0, 255, 0),
	imagecolorallocate($image, 0, 0, 255),
	imagecolorallocate($image, 255, 255, 0),
	imagecolorallocate($image, 255, 0, 255),
	imagecolorallocate($image, 0, 255, 255));
$total_dots = $width * $height;

for ($x = 0; $x < $width; $x++) {
	for ($y = 0; $y < $height; $y++) {
	$random_color = imagecolorallocate($image, rand(rand(100, 120), 255), rand(rand(100, 120), 255), rand(rand(100, 120), 255));
	imagesetpixel($image, $x, $y, $random_color);
	}
}

$random_increment = array(rand(rand(4, 5), rand(5, 10)), rand(rand(5, 6), rand(7, 15)));
for ($x = 0; $x < $width; $x++) {
	if (($x % $random_increment[0]) == 0) {
	imagesetthickness($image, rand(1, 2));
	imageline($image, $x, 0, $x, $height, $colors[array_rand($colors)]);
	}
}

for ($x = 0; $x < $height; $x++) {
	if (($x % $random_increment[1]) == 0) {
	imagesetthickness($image, rand(1, 2));
	imageline($image, 0, $x, $width, $x, $colors[array_rand($colors)]);
	}
}


foreach (glob(dirname(__FILE__) . '/fonts/*.ttf') as $file_name) {
$fonts[] = $file_name;
}

$font = $fonts[array_rand($fonts)];
$chars = array('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '1', '2', '3', '4', '5', '6', '7', '8', '9', '!', '$', '#', '%', '^', '&', '*');
for ($x = 0; $x < rand(200, 250); $x++) {
$font_size = rand(5, 10);
$font_angle = rand(-30, 40);
$font_color = imagecolorallocate($image, rand(0, 255), rand(0, 255), rand(0, 255));
$random_char = $chars[array_rand($chars)];
$text = imagettfbbox($font_size, $font_angle, $font, $random_char);
$text_width = abs($text[2] - $text[0]);
$text_height = abs($text[5] - $text[3]);
$text_x = rand(0, $width);
$text_y = rand(0, $height);
imagettftext($image, $font_size, $font_angle, $text_x, $text_y, $font_color, $font, $random_char);
}

for ($x = 0; $x < rand(10, 20); $x++) {
$ellipse_height = rand(0, ($height / 2));
$ellipse_width = rand(0, ($width / 2));
$ellipse_y = rand($ellipse_height, $height);
$ellipse_x = rand($ellipse_width, $width);
$ellipse_color = imagecolorallocate($image, rand(0, 255), rand(0, 255), rand(0, 255));
imagesetthickness($image, rand(1, 10));
imageellipse($image, $ellipse_x, $ellipse_y, $ellipse_width, $ellipse_height, $ellipse_color);
}

$font_color = imagecolorallocate($image, rand(0, 10), rand(0, 10), rand(0, 10));
$font_size = rand(30, 40);
$font_angle = rand(-6, 6);
$text = imagettfbbox($font_size, $font_angle, $font, $text_string);
$text_width = abs($text[2] - $text[0]);
$text_height = abs($text[5] - $text[3]);
$text_x = ($width / 2) - ($text_width / 2) + rand(-10, 10);
	if ($font_angle > 4 || $font_angle < -4) {
	$text_y = (($height / 2) - ($text_height / 2));
	}
	else {
	$text_y = (($height) - ($text_height / 2));
	}
imagettftext($image, $font_size, $font_angle, $text_x, $text_y, $font_color, $font, $text_string);
imagepng($image);
imagedestroy($image);
exit;
include_once('includes/footer.php');
?>