<?php
/*** *** *** *** *** ***
*	File: profile.php
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
define('IN_LOGIN_SYS', true);
define('PAGE', 4);
include_once('includes/header.php');
$user_id = (isset($_GET['id']) && is_numeric($_GET['id'])) ? $_GET['id'] : 0;
$type = (isset($_GET['type']) && $_GET['type'] != '') ? $_GET['type'] : 'view';
if ($user_id < 1 && $type == 'view') {
$tmpl->assign('MESSAGE', $l['profile_baduserid']);
$tmpl->display('message.html');
}
else {
	if ($is_logged) {
		if ($type == 'view') {
		define('USER_ID', $user_id);
		define('IN_PROFILE', true);
		include_once('show_profile.php');
		}
		elseif ($type == 'edit') {
			if ($_POST['process'] == 'yes') {
			$signature = sql_quote($_POST['signature']);
			$template = sql_quote($_POST['template']);
			$email = sql_quote($_POST['email']);
			$c_email = sql_quote($_POST['c_email']);
			$password = sql_quote($_POST['new_pword']);
			$c_password = sql_quote($_POST['c_new_pword']);
			$msn = sql_quote($_POST['msn']);
			$yim = sql_quote($_POST['yim']);
			$aim = sql_quote($_POST['aim']);
			$skype = sql_quote($_POST['skype']);
			$icq = sql_quote($_POST['icq']);
			$website = sql_quote($_POST['website']);
			$hobbies = sql_quote($_POST['hobbies']);
			$occupation = sql_quote($_POST['occupation']);
			$show_email = sql_quote($_POST['show_email']);
			$profile_image = sql_quote($_POST['profile_image']);
			$show_profile = sql_quote($_POST['show_profile']);
			$about_you = sql_quote($_POST['about_you']);
			$failed = false;
				if (strlen($about_you) > $config['max_about_you']) {
				$about_you = substr($about_you, 0, $config['max_about_you']);
				}

				if ($config['auth_profile_image'] == 0) {
				$profile_image = '';
				}

				if (!preg_match('#^http[s]?:\/\/#i', $profile_image)) {
				$profile_image = 'http://' . $profile_image;
				}

				if (!preg_match('#^http[s]?:\/\/#i', $website)) {
				$website = 'http://' . $website;
				}

				if (!preg_match('#^http[s]?\\:\\/\\/[a-z0-9\-]+\.([a-z0-9\-]+\.)?[a-z]+(.*?)#i', $profile_image)) {
				$profile_image = '';
				}
				else {
				$extension = trim(strtolower(strrchr($profile_image, '.')));
				$valid_images = array('.gif', '.png', '.bmp', '.jpg', '.jpeg', '.jfif', '.jpe', '.tiff', '.tff');
					if (!@getimagesize($profile_image)) {
					$profile_image = '';
					}
					else {
					list($width, $height) = getimagesize($profile_image);
						if ($width > 900 || $height > 300 || $width < 1 || $height < 1) {
						$profile_image = '';
						}
						else {
							if (!in_array($extension, $valid_images)) {
							$profile_image = '';
							}
						}
					}
				}

				if (!preg_match('#^http[s]?\\:\\/\\/[a-z0-9\-]+\.([a-z0-9\-]+\.)?[a-z]+(.*?)#i', $website)) {
				$website = '';
				}

				if (!eregi('^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$', $msn)) {
				$msn = '';
				}

				if (!is_numeric($template) || !is_numeric($show_email) || !is_numeric($show_profile)) {
				$failed = true;
				}

				if (!eregi('^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$', $email) || $email != $c_email) {
				$failed = true;
				}

				if ($password != $c_password) {
				$failed = true;
				}

				if (strlen($signature) > 255) {
				$signature = substr($signature, 0, 255);
				}

				if (strlen($hobbies) > 255) {
				$hobbies = substr($hobbies, 0, 255);
				}

				if (strlen($occupation) > 255) {
				$occupation = substr($occupation, 0, 255);
				}

				if ($failed) {
				$tmpl->assign('MESSAGE', $l['profile_failed']);
				}
				else {
					if ($password == '') {
					$sql_bit = '';
					}
					else {
					$sql_bit = ",`password`='{$generated_password}'";
					}

				$generated_password = $user->generate_password($password, $user_info['salt']);
				mysql_query("UPDATE `{$prefix}info` SET `email`='{$email}',`signature`='{$signature}',`template`='{$template}',`msn`='{$msn}',`yim`='{$yim}',`aim`='{$aim}',`skype`='{$skype}',`icq`='{$icq}',`website`='{$website}',`hobbies`='{$hobbies}',`occupation`='{$occupation}',`show_email`='{$show_email}',`profile_image`='{$profile_image}',`show_profile`='{$show_profile}',`about_you`='{$about_you}'{$sql_bit} WHERE `id`='{$user_info['id']}'");
				$file_handle = fopen('language/' . $config['language'] . '/' . $config['language'] . '_email_profile.txt', 'r');
				$file_data = fread($file_handle, filesize('language/' . $config['language'] . '/' . $config['language'] . '_email_profile.txt'));
				fclose($file_handle);
				$file_data = preg_replace('/\.username\./i', stripslashes($user_info['username']), $file_data);
				$file_data = preg_replace('/\.site_name\./i', stripslashes($config['site_name']), $file_data);
				$file_data = preg_replace('/\.password\./i', $password, $file_data);
				$file_data = preg_replace('/\.email_signature\./i', stripslashes($config['email_signature']), $file_data);
				$contents = explode('||', $file_data);
				$charset = ereg_replace('Charset:', '', $contents[0]);
				$subject = ereg_replace('Subject:', '', trim($contents[1]));
				$body = wordwrap(ereg_replace('Message:', '', $contents[2]), 69, "\n", 1);
				$body = ereg_replace("\r\n", "\n", $body);
				$body = ereg_replace("\r", "\n", $body);
				$headers = 'From: ' . stripslashes(trim($config['site_name'])) . ' <' . trim($config['from_email']) . '>' . "\r\n";
				@mail($email, $subject, $message, $headers);
				$tmpl->assign('MESSAGE', sprintf($l['profile_success'], $user_info['id']));
				}
			$tmpl->display('message.html');
			}
			else {
			$templates = mysql_query("SELECT * FROM `{$prefix}templates`");
				while ($template_row = mysql_fetch_array($templates)) {
				$build_array[] = array('id' => $template_row['id'], 'name' => stripslashes($template_row['name']));
				}

			$user_info['template_name'] = templateid2name($user_info['template']);
				foreach ($user_info as $key => $value) {
				$user_info[$key] = stripslashes($value);
				}

			$tmpl->assign(array('user_info' => $user_info,
				'templates' => $build_array));
			$tmpl->display('profile_edit_form.html');
			}
		}
		else {
		$tmpl->assign('MESSAGE', $l['profile_badcommand']);
		$tmpl->display('message.html');
		}
	}
	else {
	$query_string = urlencode('?id=' . $user_id . '&type=' . $type);
		if ($config['auth_guest_profile'] == 1) {
			if ($type == 'view') {
			define('USER_ID', $user_id);
			define('IN_PROFILE', true);
			include_once('show_profile.php');
			}
			else {
			$tmpl->assign('MESSAGE', sprintf($l['profile_badcommandguest'], $query_string));
			$tmpl->display('message.html');
			}
		}
		else {
		$tmpl->assign('MESSAGE', sprintf($l['profile_notlogged'], $query_string));
		$tmpl->display('message.html');
		}
	}
}
include_once('includes/footer.php');
?>