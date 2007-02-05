<?php
/*** *** *** *** *** ***
*	File: activate.php
*	Start: August 5th, 2006
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
define('PAGE', 1);
include_once('includes/header.php');
if ($is_logged) {
$tmpl->assign('MESSAGE', $l['activate_alreadyactive']);
$tmpl->display('message.html');
}
else {
$userid = sql_quote($_GET['userid']);
$code = sql_quote($_GET['code']);
	if (($userid != "" && is_numeric($userid)) && ($code != "" && strlen($code) == 8)) {
	$check = mysql_query("SELECT `active`,`code` FROM `{$prefix}info` WHERE `id`='{$userid}'");
	$check = mysql_fetch_array($check);
		if ($check[0] == 1 || $check[1] != $code) {
		$tmpl->assign('MESSAGE', $l['activate_error']);
		$tmpl->display('message.html');
		}
		else {
		mysql_query("UPDATE `{$prefix}info` SET `active`='1' WHERE `id`='{$userid}'");
		$tmpl->assign('MESSAGE', $l['activate_success']);
		$tmpl->display('message.html');
		}
	}
	else {
	$tmpl->display('activate_form.html');
	}
}
include_once('includes/footer.php');
?>