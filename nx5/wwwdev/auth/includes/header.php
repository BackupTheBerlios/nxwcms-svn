<?php
/*** *** *** *** *** ***
*	File: header.php
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

if (@ini_get('register_globals') == 1 || strtoupper(@ini_get('register_globals') == 'ON')) {
	if (!@ini_set('register_globals', 'Off') && !@ini_set('register_globals', 0)) {
	die('Could not turn register globals off. This is a major security risk and must be turned off.');
	}
}

header('Content-Type: text/html; charset=utf-8');
header('Cache-Control: no-store, no-cache, must-revalidate');
header('Cache-Control: post-check=0, pre-check=0', false);
header('Pragma: no-cache');
session_start();

if (isset($_POST['GLOBALS']) || isset($_GET['GLOBALS']) || isset($_FILES['GLOBALS']) || isset($_SESSION['GLOBALS']) || isset($_COOKIE['GLOBALS'])) {
die('Hacking is not permitted.');
}

if (isset($_SESSION) && !is_array($_SESSION)) {
die('Hacking is not permitted.');
}

if (!isset($_SESSION) && !is_array($_SESSION)) {
$_SESSION = array();
}

$globals_names = array('HTTP_POST_VARS', 'HTTP_GET_VARS', 'HTTP_POST_FILES', 'HTTP_SESSION_VARS', 'HTTP_SERVER_VARS', 'HTTP_ENV_VARS', 'HTTP_COOKIE_VARS', 'GLOBALS');
$globals = array_merge($_POST, $_GET, $_FILES, $_SESSION, $_SERVER, $_ENV, $_COOKIE);

while (list($name, $value) = each($globals)) {
	if (in_array($name, $globals_names)) {
	die('Hacking is not permitted.');
	}
}

unset($globals);
$include_path = dirname(__FILE__);

include_once($include_path . '/connect.php');
if (!SYSTEM_INSTALLED) {
die('The system is not installed.');
}

if (file_exists($main_path . '/install.php')) {
die('Please remove the <b>install.php</b> from your main directory.');
}

include_once($include_path . '/sessions.php');
include_once($include_path . '/functions.php');
include_once($include_path . '/Smarty.class.php');
$result = mysql_query("SELECT * FROM `{$prefix}config`") or die(mysql_error());

while ($row = mysql_fetch_array($result)) {
$config[$row['name']] = $row['value'];
}

define('QLS_VERSION', $row['cur_version']);
if (extension_loaded('zlib') && $config['gzip'] == 1) {
ob_start('ob_gzhandler');
}
else {
$ext_prefix = (PHP_SHLIB_SUFFIX === 'dll') ? 'php_' : '';
	if (@dl($ext_prefix . 'zlib.' . PHP_SHLIB_SUFFIX) && $config['gzip'] == 1) {
	ob_start('ob_gzhandler');
	}
	else {
	ob_start();
	}
}
ob_implicit_flush(0);

$tmpl = new Smarty;
$session = new Session;
$cookie_prefix = $config['cookie_prefix'];
include_once($main_path . '/language/' . $config['language'] . '/'. $config['language'] . '_main.php');
$config['old_template_directory'] = $config['template_directory'];
$config['old_compiled_directory'] = $config['compiled_directory'];
$config['template_directory'] = $main_path . '/' . $config['template_directory'];
$config['compiled_directory'] = $main_path . '/' . $config['compiled_directory'];
$tmpl->assign('config', $config);

if (isset($_COOKIE[$cookie_prefix . 'remember']) || isset($_SESSION[$cookie_prefix . 'remember'])) {
$user_id = (isset($_COOKIE[$cookie_prefix . 'remember']) ? $_COOKIE[$cookie_prefix . 'remember'] : $_SESSION[$cookie_prefix . 'remember']);
$user = new User;
$user->user_id = $user_id;
$user_info = $user->load_user_info();
	if (
		(isset($_COOKIE[$cookie_prefix . 'session_thing']) || isset($_SESSION[$cookie_prefix . 'session_thing'])) && (isset($_COOKIE[$cookie_prefix . 'password_hash']) || isset($_SESSION[$cookie_prefix . 'password_hash'])) && (isset($_COOKIE[$cookie_prefix . 'user_ip']) || isset($_SESSION[$cookie_prefix . 'user_ip']))) {
	$session_id = (isset($_COOKIE[$cookie_prefix . 'session_id']) ? $_COOKIE[$cookie_prefix . 'session_thing'] : $_SESSION[$cookie_prefix . 'session_id']);
	$password_hash_session = (isset($_COOKIE[$cookie_prefix . 'password_hash']) ? $_COOKIE[$cookie_prefix . 'password_hash'] : $_SESSION[$cookie_prefix . 'password_hash']);
	$user_ip = (isset($_COOKIE[$cookie_prefix . 'user_ip']) ? $_COOKIE[$cookie_prefix . 'user_ip'] : $_SESSION[$cookie_prefix . 'user_ip']);
	$session->password_hash = $user_info['password'];
	$session->password_hash_session = $password_hash_session;
	$session->user_id = $user_id;
	$session->salt = $user_info['salt'];
	$session->user_ip = $user_ip;
	$valid_session = $session->validate_session($session_id);
		if ($valid_session === true) {
			if ($user_info['status'] == 0) {
			die($l['banned']);
			}
			else {
			$is_logged = true;
			$tmpl->template_dir = $config['template_directory'] . '/' . templateid2dir($user_info['template']);			
			$template = templateid2dir($user_info['template']);
			}
		}
		else {
		die('Hacking is not permitted.');
		}
	}
	else {
	die('Hacking is not permitted.');
	}
}
else {
$is_logged = false;
$tmpl->template_dir = $config['template_directory'] . '/' . templateid2dir($config['default_template']);

$template = templateid2dir($config['default_template']);
$user = new User;
}
$tmpl->compile_dir = $config['compiled_directory'];

switch (PAGE) {
	case 1:
	/* activate.php */
	$page_title = 'Activate Your Account';
	break;
	case 2:
	/* index.php */
	$page_title = 'Welcome!';
	break;
	case 3:
	/* login.php */
	$page_title = 'Login To Your Account';
	break;
	case 4:
	/* profile.php */
	$page_title = 'Profiles';
	break;
	case 5:
	/* register.php */
	$page_title = 'Register For This Site';
	break;
	case 6:
	/* admin.php */
	$page_title = 'AdminCP';
	break;
	case 7:
	/* layout.php */
	$page_title = 'Members Only Layout';
	break;
}

$tmpl->assign(array('PAGE_TITLE' => $page_title . base64_decode('IC0gUXVhZG9kbyBMb2dpbiBTeXN0ZW0='),
	'TEMPLATE' => $template,
	'SITE_NAME' => stripslashes($config['site_name']),
	'IS_LOGGED' => $is_logged,
	'USERID' => $user_info['id'],
	base64_decode('Zm9vdGVy') => base64_decode('UG93ZXJlZCBieTogPGEgY2xhc3M9ImlubGluZSIgaHJlZj0iaHR0cDovL3F1YWRvZG8ueGVud2ViLm5ldC8iIHRhcmdldD0iX2JsYW5rIj5RdWFkb2RvLmxvZ2luIHN5c3RlbSB2Mi4wLjA8L2E+PGJyIC8+')));
if (!defined('HEADER')) {
define('HEADER', true);
}

if (!defined('GUEST')) {
define('GUEST', true);
}

if (HEADER) {
	if (!GUEST && !$is_logged) {
	
	}
	else {
	$tmpl->display('header.html');
	}
}
else {
	if (GUEST && !$is_logged) {
	$tmpl->display('header.html');
	}
}
?>