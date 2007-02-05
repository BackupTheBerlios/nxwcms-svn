<?php
/*** *** *** *** *** ***
*	File: show_profile.php
*	Start: August 25th, 2006
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
if (!defined('IN_PROFILE') || !defined('IN_LOGIN_SYS')) {
ob_end_clean();
die('Hacking is not permitted.');
}

$result = mysql_query("SELECT * FROM `{$prefix}info` WHERE `id`='" . USER_ID . "'");
$row = mysql_fetch_array($result);
if ($row['id'] == '') {
$tmpl->assign('MESSAGE', $l['profile_doesntexist']);
$tmpl->display('message.html');
}
else {
	if ($row['show_profile'] == 1) {
		foreach ($row as $key => $value) {
		$row[$key] = stripslashes($value);
		}

	$tmpl->assign('user_info', $row);
	$tmpl->display('profile.html');
	}
	else {
	$tmpl->assign('MESSAGE', $l['profile_noshow']);
	$tmpl->display('message.html');
	}
}
?>