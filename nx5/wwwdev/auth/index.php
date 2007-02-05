<?php
/*** *** *** *** *** ***
*	File: index.php
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
define('PAGE', 2);
define('HEADER', false);
define('GUEST', true);
include_once('includes/header.php');
if ($is_logged) {
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/xhtml1/DTD/xhtml1-transitional.dtd">

<html xml:lang="en" lang="en" xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<title>Members!</title>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
		<style type="text/css">
		<!--
		body {
			background: #afafaf url('templates/<?php echo $tmpl->_tpl_vars['TEMPLATE']; ?>/images/bg.png') repeat-x;
		}

		#container {
			width:99%;
			border:1px solid #000000;
			background: #ffffff;
			padding: 6px;
		}
		
		a {
			color: #000000;
			font-weight:bold;
			text-decoration: underline;
		}
		
		a:hover {
			color: #000000;
			font-weight: bold;
			font-style: italic;
			text-decoration: underline;
		}
		-->
		</style>
	</head>
	
	<body>
	
		<div id="container" align="center">
			Welcome! This is an example of a members page, read the PHP source, it will explain how to set up many like it!<br />
			<a href="logout.php">Logout</a> | <a href="profile.php?type=edit">Edit Profile</a> | <a href="profile.php?type=view&amp;id=<?php echo $user_info['id']; ?>">View Your Profile</a>
		</div>
		
	</body>

</html>
<?php
exit;
}
else {
$tmpl->assign('MESSAGE', $l['index_notlogged']);
$tmpl->display('message.html');
}
include_once('includes/footer.php');
?>