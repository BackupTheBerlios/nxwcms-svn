<?php
/*** *** *** *** *** ***
*	File: register.php
*	Start: August 9th, 2006
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
define('PAGE', 5);
include_once('includes/header.php');
if ($is_logged) {
$tmpl->assign('MESSAGE', $l['register_alreadyregistered']);
$tmpl->display('message.html');
}
else {
	if ($_POST['process'] == 'yes') {
	$register = $user->register_user($_POST['username'], 
	$_POST['password'], 
	$_POST['c_password'], 
	$_POST['email'], 
	$_POST['c_email'], 
	$_POST['signature'], 
	$_POST['tz'], 
	$_POST['template'], 
	$_POST['msn'], 
	$_POST['yim'], 
	$_POST['aim'], 
	$_POST['skype'], 
	$_POST['icq'], 
	$_POST['website'], 
	$_POST['hobbies'], 
	$_POST['occupation'], 
	$_POST['show_email'], 
	$_POST['profile_image'],
	$_POST['image_code'],
	$_POST['random_id'],
	$_POST['about_you']);
		if ($register) {
		$tmpl->assign('MESSAGE', $l['register_success']);
		}
		else {
		$count = 0;
			foreach ($_SESSION['errors'] as $key => $value) {
			$count++;
				switch ($value) {
					case 1:
					$value = $l['register_notvalidemail'];
					break;
					case 2:
					$value = $l['register_fieldinvalid'];
					break;
					case 3:
					$value = $l['register_passemailnotequal'];
					break;
					case 4:
					$value = $l['register_tooshort'];
					break;
					case 5:
					$value = $l['register_notvalidusername'];
					break;
					case 6:
					$value = $l['register_wrongimagecode'];
					break;
					case 7:
					$value = $l['register_useralreadyexists'];
					break;
				}

				if ($count == 1) {
				$errorstring = ' ' . $l['register_errors_returned'] . ':<br /><br /><span style="color:#ff0000;">[' . $count . ']</span> ' . $value . '<br />';
				}
				else {
				$errorstring .= '<span style="color:#ff0000;">[' . $count . ']</span> ' . $value . '<br />';
				}
			}

			if (get_magic_quotes_gpc()) {
				foreach ($_POST as $key => $value) {
				$_POST[$key] = stripslashes($value);
				}
			}

		$errorstring .= "<br /><a href=\"register.php?username={$_POST['username']}&amp;signature={$_POST['signature']}&amp;tz={$_POST['tz']}&amp;template={$_POST['template']}&amp;msn={$_POST['msn']}&amp;yim={$_POST['yim']}&amp;aim={$_POST['aim']}&amp;skype={$_POST['skype']}&amp;icq={$_POST['icq']}&amp;website={$_POST['website']}&amp;hobbies={$_POST['hobbies']}&amp;occupation={$_POST['occupation']}&amp;show_email={$_POST['show_email']}&amp;profile_image={$_POST['profile_image']}&amp;about_you={$_POST['about_you']}\">{$l['register_error_go_back_same_values']}</a>";
		$tmpl->assign('MESSAGE', sprintf($l['register_error'], $errorstring));
		}
	$tmpl->display('message.html');
	}
	else {
	$random_id = md5(md5(time() + time() + sha1(rand())) + sha1(mt_rand()) + sha1(mt_rand()) + sha1(mt_rand() + md5(time())));
	$chars = array('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '1', '2', '3', '4', '5', '6', '7', '8', '9');
	$num_chars = rand(7, 10);
		for ($x = 0; $x < $num_chars; $x++) {
		$real_text .= $chars[array_rand($chars)];
		}

	$time_set = time();
	mysql_query("INSERT INTO `{$prefix}image_verification` (`random_id`,`real_text`,`time_set`) VALUES('{$random_id}','{$real_text}','{$time_set}')") or die(mysql_error());
	$style_result = mysql_query("SELECT * FROM `{$prefix}templates`") or die(mysql_error());
		while ($style_row = mysql_fetch_array($style_result)) {
		$template_array[] = $style_row;
		}

	$tmpl->assign(array('templates' => $template_array,
		'random_id' => $random_id,
		'form_submit' => 'register.php'));
	$tmpl->display('register_form.html');
	}
}
include_once('includes/footer.php');
?>