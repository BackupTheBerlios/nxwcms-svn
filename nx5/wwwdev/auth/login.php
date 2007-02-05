<?php
/*** *** *** *** *** ***
*	File: login.php
*	Start: August 3rd, 2006
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
define('PAGE', 3);
include_once('includes/header.php');
if ($is_logged) {
$tmpl->assign('MESSAGE', $l['login_loggedin']);
$tmpl->display('message.html');
}
else {
	if ($_GET['type'] == 2) {
	$check = $user->check_login_info($_POST['username'], $_POST['password']);
		if ($check) {
			if (get_magic_quotes_gpc()) {
			$_POST['username'] = stripslashes($_POST['username']);
			}
		$result = mysql_query("SELECT * FROM `{$prefix}info` WHERE `username`='" . sql_quote($_POST['username']) . "'") or die(mysql_error());
		$some_session_stuff = $session->create_session($_POST['username']);
		$row = mysql_fetch_array($result);
		$session->user_id = $row['id'];
		$session->salt = $row['salt'];
		$session->password_hash = $row['password'];
		$session->user_ip = $_SERVER['REMOTE_ADDR'];
		$session_info = $session->generate_session_info();
		$session_id = mysql_query("SELECT id FROM `{$prefix}sessions` ORDER BY id DESC LIMIT 0,1") or die(mysql_error());
		$session_id = mysql_fetch_array($session_id);
			if ($_POST['remember'] == 1) {
			setcookie($config['cookie_prefix'] . 'remember', $row['id'], time() + $config['cookie_expiration'], $config['cookie_path'], $config['cookie_domain'], $config['cookie_secure']);
			setcookie($config['cookie_prefix'] . 'password_hash', $row['password'], time() + $config['cookie_expiration'], $config['cookie_path'], $config['cookie_domain'], $config['cookie_secure']);
			setcookie($config['cookie_prefix'] . 'user_ip', $session->user_ip, time() + $config['cookie_expiration'], $config['cookie_path'], $config['cookie_domain'], $config['cookie_secure']);
			setcookie($config['cookie_prefix'] . 'session_thing', $session_id[0], time() + $config['cookie_expiration'], $config['cookie_path'], $config['cookie_domain'], $config['cookie_secure']);
			setcookie($config['cookie_prefix'] . $session_info[0], $session_info[1], time() + $config['cookie_expiration'], $config['cookie_path'], $config['cookie_domain'], $config['cookie_secure']);
			}

		$_SESSION[$config['cookie_prefix'] . 'remember'] = $row['id'];
		$_SESSION[$config['cookie_prefix'] . 'password_hash'] = $row['password'];
		$_SESSION[$config['cookie_prefix'] . 'user_ip'] = $session->user_ip;
		$_SESSION[$config['cookie_prefix'] . 'session_thing'] = $session_id[0];
		$_SESSION[$config['cookie_prefix'] . $session_info[0]] = $session_info[1];
			if (isset($_GET['dest']) && $_GET['dest'] != '') {
			header('Location: ' . $_GET['dest']);
			}
			else {
			header('Location: ' . $config['login_redirect']);
			}
		exit;
		}
		else {
		$tmpl->assign('MESSAGE', $l['login_failed']);
		$tmpl->display('message.html');
		}
	}
	else {
	$tmpl->display('login_form.html');
	}
}
include_once('includes/footer.php');
?>