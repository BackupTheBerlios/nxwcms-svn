<?php
/*** *** *** *** *** ***
*	File: sessions.php
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

class Session {
var $user_id;
var $salt;
var $user_ip;
var $password_hash;
var $password_hash_session;
	function generate_session_info() {
	$time = time();
	$string1 = $this->salt . $this->password_hash . $this->user_id . md5($this->user_ip);
	$string2 = $this->password_hash . $salt;
	$string3 = base64_encode($string1 + $string2);
	$name = md5($string1 + $string2 + md5(sha1($this->password_hash) + md5($this->salt + $string1) + sha1(md5($time + $string2) + sha1(md5($this->password_hash + md5($string3))))));
	$value = md5($name + $time + $string1 + sha1($string2 + $this->password_hash + md5($salt + sha1(md5(sha1($time + $string1 + $string2))) + md5($name)) + sha1($this->user_ip + $string3)) + md5(base64_encode($this->user_id)) + sha1($this->password_hash));
	return array($name, $value, $this->user_id, $this->user_ip, $time);
	}

	function create_session($username) {
	$result = mysql_query("SELECT * FROM `{$GLOBALS['prefix']}info` WHERE `username`='" . sql_quote($username) . "'") or die(mysql_error());
	$row = mysql_fetch_array($result);
	$this->user_id = $row['id'];
	$this->salt = $row['salt'];
	$this->password_hash = $row['password'];
	$session_info = $this->generate_session_info();
	mysql_query("INSERT INTO `{$GLOBALS['prefix']}sessions` (`name`,`value`,`userid`,`userip`,`time`)  VALUES('{$session_info[0]}','{$session_info[1]}','{$session_info[2]}','{$session_info[3]}','{$session_info[4]}')");
	$session_id = mysql_query("SELECT MAX(id) as `count` FROM `{$GLOBALS['prefix']}sessions`") or die(mysql_error());
	$session_id = mysql_fetch_array($session_id);
	return array($session_info[0], $session_info[1], $session_id['count']);
	}

	function validate_session($id) {
	$cookie_prefix = $GLOBALS['config']['cookie_prefix'];
	$session = mysql_query("SELECT * FROM `{$GLOBALS['prefix']}sessions` WHERE `id`='{$id}'") or die(mysql_error());
	$session = mysql_fetch_array($session);
	$failed = false;
		if ($session['value'] != $_SESSION[$cookie_prefix . $session['name']]) {
			if ($session['value'] != $_COOKIE[$cookie_prefix . $session['name']]) {
			$failed = true;
			}
		}

		if ($session['userid'] != $_SESSION[$cookie_prefix . $session['remember']]) {
			if ($session['userid'] != $_COOKIE[$cookie_prefix . $session['remember']]) {
			$failed = true;
			}
		}
		
		if ($this->password_hash_session != $this->password_hash) {
		$failed = true;
		}

		if ($failed) {
		return false;
		}
		else {
		return true;
		}
	}
}
?>