<?php
/*** *** *** *** *** ***
*	File: logout.php
*	Start: August 24th, 2006
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
include_once('includes/header.php');
if ($is_logged) {
$cookie_names = array('remember', 'session_id', 'password_hash', 'user_ip', 'user_id');
$session_id = (isset($_COOKIE[$config['cookie_prefix'] . 'session_id'])) ? sql_quote($_COOKIE[$config['cookie_prefix'] . 'session_id']) : sql_quote($_SESSION[$config['cookie_prefix'] . 'session_id']);
	for ($x = 0; $x < 5; $x++) {
	setcookie($config['cookie_prefix'] . $cookie_names[$x], '', time() - 3600, $config['cookie_path'], $config['cookie_domain'], $config['cookie_secure']);
	unset($_SESSION[$config['cookie_prefix'] . $cookie_names[$x]]);
	}
mysql_query("DELETE FROM `{$prefix}sessions` WHERE `session_id`='{$session_id}'");
}

header('Location: ' . $config['logout_redirect']);
exit;
include_once('includes/footer.php');
?>