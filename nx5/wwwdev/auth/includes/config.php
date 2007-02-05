<?php
/*** *** *** *** *** ***
* File: config.php
* Start: August 28th, 2006
*	Author: Douglas Rennehan
* License Info: http://www.opensource.org/licenses/gpl-license.php
*** *** *** *** *** ***
* This file is part of the Quadodo Login System.
*
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

$server_name = 'localhost';
$db_name = 'logins';
$db_password = 'test';
$db_username = 'root';
$persistent = true;
$port = '';
$prefix = 'qls_';
$main_path = 'c:/web/login';
define('SYSTEM_INSTALLED', true);
?>