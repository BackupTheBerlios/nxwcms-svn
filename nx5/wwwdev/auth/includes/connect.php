<?php
/*** *** *** *** *** ***
*	File: connect.php
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
if (!defined('IN_LOGIN_SYS')) {
die('Hacking is not permitted.');
}

include_once('includes/config.php');
$link = ($persistent) ? mysql_pconnect($server_name, $db_username, $db_password) : mysql_connect($server_name, $db_username, $db_password);
if (!$link) {
die('Error connecting to the database.');
}
else {
$db = mysql_select_db($db_name);
	if (!$db) {
	die('Error selecting database.');
	}
}

unset($db_password);
?>