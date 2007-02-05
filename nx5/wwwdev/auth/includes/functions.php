<?php
/*** *** *** *** *** ***
*	File: functions.php
*	Start: August 7th, 2006
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
if (!defined('IN_LOGIN_SYS')) {
die('Hacking is not permitted.');
}

// Thanks to the Sphider Search Engine for this :)
// It is a really great free Search Engine, you should
// check it out here:
// http://www.cs.ioc.ee/~ando/sphider/
function get_file_contents($url) {
$urlparts = parse_url($url);
$path = $urlparts['path'];
$host = $urlparts['host'];
	if ($urlparts['query'] != '') {
	$path .= '?' . $urlparts['query'];
	}

	if (isset($urlparts['port'])) {
	$port = (int) $urlparts['port'];
	} 
	else {
		if ($urlparts['scheme'] == 'http') {
		$port = 80;
		} 
		else {
			if ($urlparts['scheme'] == 'https') {
			$port = 443;
			}

			if ($port == 80) {
			$portq = '';
			} 
			else {
			$portq = ':' . $port;
			}
		}
	}

	$all = '*/*';
	$request = "GET {$path} HTTP/1.0\r\nHost: {$host}{$portq}\r\nAccept: {$all}\r\nAccept-Encoding: identity\r\nUser-Agent: {$_SERVER['HTTP_USER_AGENT']}\r\n\r\n";
	$fsocket_timeout = 30;
	if (substr($url, 0, 5) == 'https') {
	$target = 'ssl://' . $host;
	} 
	else {
	$target = $host;
	}

	$errno = 0;
	$errstr = '';
	$fp = @fsockopen($target, $port, $errno, $errstr, $fsocket_timeout);
	if (!$fp) {
	$contents['state'] = 'NOHOST';
	printConnectErrorReport($errstr);
	return $contents;
	} 
	else {
		if (!fputs($fp, $request)) {
		$contents['state'] = 'Cannot send request';
		return $contents;
		}

	$data = null;
	socket_set_timeout($fp, $fsocket_timeout);
	$status = socket_get_status($fp);
		while (!feof($fp) && !$status['timed_out']) {
		$data .= fgets($fp, 8192);
		}

	fclose($fp);
		if ($status['timed_out'] == 1) {
		$contents['state'] = 'timeout';
		} 
		else {
		$contents['state'] = 'ok';
		}

	$contents['file'] = substr($data, strpos($data, "\r\n\r\n") + 4);
	}

return $contents;
}

function qls_version_compare($version1, $version2) {
$new_version1 = preg_replace('/\./i', '', $version1);
$new_version2 = preg_replace('/\./i', '', $version2);
	if ($new_version1 < $new_version2) {
	return true;
	}
	else {
	return false;
	}
}

function sql_quote($object) {
	if (get_magic_quotes_gpc()) {
	$object = stripslashes($object);
	}
	
	if (function_exists('mysql_real_escape_string')) {
	$object = mysql_real_escape_string($object);
	}
	else {
	$object = addslashes($object);
	}

return $object;
}

function sql_last_id() {
return mysql_insert_id();
}

function templateid2name($template_id) {
global $prefix;
$result = mysql_query("SELECT * FROM `{$prefix}templates` WHERE `id`='{$template_id}'") or die(mysql_error());
$row = mysql_fetch_array($result);
return stripslashes($row['name']);
}

function templateid2dir($template_id) {
global $prefix;
$result = mysql_query("SELECT * FROM `{$prefix}templates` WHERE `id`='{$template_id}'") or die(mysql_error());
$row = mysql_fetch_array($result);
return stripslashes($row['dir']);
}

class User {
var $user_id;
var $failed = false;
	function load_user_info() {
	$result = mysql_query("SELECT * FROM `{$GLOBALS['prefix']}info` WHERE `id`='{$this->user_id}'") or die(mysql_error());
	$row = mysql_fetch_array($result);
		if ($row['id'] == "") {
		return false;
		}
		else {
			foreach ($row as $key => $value) {
			$userinfo[$key] = $value;
			}
		return $userinfo;
		}
	}

	function validate_admin_session() {
	global $user_info;
	$user_info['username'] = stripslashes($user_info['username']);
	$result = mysql_query("SELECT * FROM `{$GLOBALS['prefix']}admin_sessions` WHERE `username`='{$user_info['username']}'") or die(mysql_error());
	$row = mysql_fetch_array($result);
		if (isset($_SESSION[$GLOBALS['config']['cookie_prefix'] . 'admin_session']) && $row['value'] != '' && $row['value'] == $_SESSION[$GLOBALS['config']['cookie_prefix'] . 'admin_session']) {
		return true;
		}
		else {
		return false;
		}
	}

	function generate_admin_session($password, $user_id, $username, $salt) {
	$now = time();
	$now_minus = time() - 1;
	$string = md5(md5(mt_rand() + sha1($user_id) + sha1($user_id + $username) + sha1($password + $user_id + $username + $salt) + md5(sha1($user_id + sha1($username + sha1($password + sha1($salt)) + md5(md5(' ') + sha1(time()))))) + md5($username) + md5($salt) + md5($user_id)) + md5($password + $user_id + $username + $salt + mydb_password));
	mysql_query("DELETE FROM `{$GLOBALS['prefix']}admin_sessions` WHERE `time`<'{$now_minus}' AND `username`='{$username}'") or die(mysql_error());
	mysql_query("INSERT INTO `{$GLOBALS['prefix']}admin_sessions` (`value`,`time`,`username`) VALUES('{$string}','{$now}','{$username}')") or die(mysql_error());
	return $string;
	}

	function generate_password_salt($password) {
	return md5(rand(1, rand(2, 200000)) + sha1(md5($password) + sha1(md5($password) + sha1(time()) + rand(rand(-213596, -1), rand(1, 143023)))) + md5(time() + microtime()) + $password + sha1(md5(sha1(md5(sha1(sha1(sha1(' ' + $password))))))));
	}

	function generate_password($password, $salt) {
	return md5(sha1($salt) + sha1($password) + md5($salt + $password));
	}

	function register_user($username, $password, $c_password, $email, $c_email, $signature, $tz, $template, $msn, $yim, $aim, $skype, $icq, $website, $hobbies, $occupation, $show_email, $profile_image, $image_code, $random_id, $about_you) {
		if (isset($_SESSION['errors'])) {
		unset($_SESSION['errors']);
		}
		else {
		$_SESSION['errors'] = array();
		}

		if (!eregi('^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$', $email)) {
		$this->failed = true;
		$_SESSION['errors'][] = 1;
		}
		
		if (strlen($hobbies) > 255) {
		$hobbies = substr($hobbies, 0, 255);
		}
		
		if (strlen($occupation) > 255) {
		$occupation = substr($occupation, 0, 255);
		}

		if (strlen($about_you) > $GLOBALS['config']['max_about_you']) {
		$about_you = substr($about_you, 0, $GLOBALS['config']['max_about_you']);
		}

		if (!eregi('^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$', $msn)) {
		$msn = '';
		}

		if (!is_numeric($icq) && $icq != '') {
		$icq = '';
		}

		if (!is_numeric($tz) || !is_numeric($template) || !is_numeric($show_email)) {
		$this->failed = true;
		$_SESSION['errors'][] = 2;
		}
		
		if (!preg_match('#^http[s]?:\/\/#i', $website)) {
		$website = 'http://' . $website;
		}
		
		if (!preg_match('#^http[s]?\\:\\/\\/[a-z0-9\-]+\.([a-z0-9\-]+\.)?[a-z]+(.*?)#i', $website)) {
		$website = '';
		}
		
		if (!preg_match('#^http[s]?:\/\/#i', $profile_image)) {
		$profile_image = 'http://' . $profile_image;
		}
		
		if (!preg_match('#^http[s]?\\:\\/\\/[a-z0-9\-]+\.([a-z0-9\-]+\.)?[a-z]+(.*?)#i', $profile_image)) {
		$profile_image = '';
		}
		else {
		$extension = trim(strtolower(strrchr($profile_image, '.')));
		$valid_images = array('.gif', '.png', '.bmp', '.jpg', '.jpeg', '.jfif', '.jpe', '.tiff', '.tff');
			if (!@getimagesize($profile_image)) {
			$profile_image = '';
			}
			else {
			list($width, $height) = getimagesize($profile_image);
				if ($width > 900 || $height > 300 || $width < 1 || $height < 1) {
				$profile_image = '';
				}
				else {
					if (!in_array($extension, $valid_images)) {
					$profile_image = '';
					}
				}
			}
		}
		
		if (($password != $c_password) || ($email != $c_email)) {
		$this->failed = true;
		$_SESSION['errors'][] = 3;
		}
		
		if (strlen($username) < 4 || strlen($password) < 4) {
		$this->failed = true;
		$_SESSION['errors'][] = 4;
		}
		
		if (!preg_match('/^[a-zA-Z_\x7f-\xff][a-zA-Z0-9_\x7f-\xff]*$/', $username)) {
		$this->failed = true;
		$_SESSION['errors'][] = 5;
		}
		
		if ($GLOBALS['config']['image_verification'] == 1) {
		$time_minus_7 = time() - (60 * 7);
		mysql_query("DELETE FROM `{$GLOBALS['prefix']}image_verification` WHERE `time_set`<'{$time_minus_7}'") or die(mysql_error());
		$real_image_code = mysql_query("SELECT * FROM `{$GLOBALS['prefix']}image_verification` WHERE `random_id`='{$random_id}'") or die(mysql_error());
		$real_image_code = mysql_fetch_array($real_image_code);
			if ($real_image_code['real_text'] != $image_code) {
			$this->failed = true;
			$_SESSION['errors'][] = 6;
			}
		}

	$salt = $this->generate_password_salt($c_password);
	$password_hash = $this->generate_password($password, $salt);
	$username = sql_quote($username);
	$result = mysql_query("SELECT * FROM `{$GLOBALS['prefix']}info` WHERE `username`='{$username}'") or die(mysql_error());
	$row = mysql_fetch_array($result);
		if ($row['id'] != '') {
		$this->failed = true;
		$_SESSION['errors'][] = 7;
		}
	$joined = time();
	$email = sql_quote($email);
	$signature = sql_quote($signature);
	$tz = sql_quote($tz);
	$template = sql_quote($template);
	$msn = sql_quote($msn);
	$yim = sql_quote($yim);
	$aim = sql_quote($aim);
	$skype = sql_quote($skype);
	$icq = sql_quote($icq);
	$website = sql_quote($website);
	$hobbies = sql_quote($hobbies);
	$occupation = sql_quote($occupation);
	$show_email = sql_quote($show_email);
	$profile_image = sql_quote($profile_image);
	$about_you = sql_quote($about_you);
		if ($this->failed) {
		return false;
		}
		else {
			if ($GLOBALS['config']['activate'] == 1) {
			$active = 1;
			$code = '';
			}
			else {
			$active = 0;
			$code = substr(md5(time() + sha1(mt_rand())), 0, 8);
			}

		mysql_query("INSERT INTO `{$GLOBALS['prefix']}info` (`username`,`password`,`salt`,`email`,`active`,`code`,`signature`,`joined`,`tz`,`template`,`msn`,`yim`,`aim`,`skype`,`icq`,`website`,`hobbies`,`occupation`,`show_email`,`profile_image`,`about_you`,`status`) VALUES('{$username}','{$password_hash}','{$salt}','{$email}','{$active}','{$code}','{$signature}','{$joined}','{$tz}','{$template}','{$msn}','{$yim}','{$aim}','{$skype}','{$icq}','{$website}','{$hobbies}','{$occupation}','{$show_email}','{$profile_image}','{$about_you}','1')") or die(mysql_error());
		$file_handle = fopen($GLOBALS['main_path'] . '/language/' . $GLOBALS['config']['language'] . '/' . $GLOBALS['config']['language'] . '_email_register.txt', 'r');
		$file_data = fread($file_handle, filesize($GLOBALS['main_path'] . '/language/' . $GLOBALS['config']['language'] . '/' . $GLOBALS['config']['language'] . '_email_register.txt'));
		fclose($file_handle);
		$file_data = preg_replace('/\.username\./i', stripslashes($username), $file_data);
		$file_data = preg_replace('/\.password\./i', $password, $file_data);
		$file_data = preg_replace('/\.userid\./i', sql_last_id(), $file_data);
		$file_data = preg_replace('/\.site_name\./i', stripslashes($GLOBALS['config']['site_name']), $file_data);
		$file_data = preg_replace('/\.email_signature\./i', stripslashes($GLOBALS['config']['email_signature']), $file_data);
		$file_data = preg_replace('/\.code\./i', $code, $file_data);
		$contents = explode('||', $file_data);
		$charset = ereg_replace('Charset:', '', $contents[0]);
		$subject = ereg_replace('Subject:', '', trim($contents[1]));
		$body = wordwrap(ereg_replace('Message:', '', $contents[2]), 69, "\n", 1);
		$body = ereg_replace("\r\n", "\n", $body);
		$body = ereg_replace("\r", "\n", $body);
		$headers = 'From: ' . stripslashes(trim($GLOBALS['config']['site_name'])) . ' <' . trim($GLOBALS['config']['from_email']) . '>' . "\r\n";
		@mail($email, $subject, $body, $headers);
		return true;
		}
	}
	
	function check_login_info($username, $password) {
	$username = sql_quote($username);
	$result = mysql_query("SELECT * FROM `{$GLOBALS['prefix']}info` WHERE `username`='{$username}'") or die(mysql_error());
	$row = mysql_fetch_array($result);
	$generate_password = $this->generate_password($password, $row['salt']);
		if ($generate_password == $row['password']) {
		return true;
		}
		else {
		return false;
		}
	}
}
?>