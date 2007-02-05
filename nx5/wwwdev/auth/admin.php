<?php
/*** *** *** *** *** ***
*	File: admin.php
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
define('PAGE', 6);
include_once('includes/header.php');
if ($is_logged && $user_info['status'] == 2) {
	if ($user->validate_admin_session()) {
	$type = (isset($_GET['type']) && $_GET['type'] != '') ? $_GET['type'] : 'main';
		switch ($type) {
			default:
			$updates = get_file_contents('http://quadodo.xenweb.net/updates/qls_updates.html');
			$row = explode('||', $updates['file']);
			$row['new_version'] = &$row[0];
			$row['reason'] = &$row[1];
			$row['link'] = &$row[2];
				if (qls_version_compare(QLS_VERSION, $row['new_version'])) {
				$tmpl->assign('UP_TO_DATE', true);
				}
				else {
					switch ($row['reason']) {
						case 1:
						$reason = $l['lang_bug_fix'];
						break;
						case 2:
						$reason = '<span style="color: #ff0000;">' . $l['lang_security_issue'] . ' (' . $l['lang_important'] . '!)</span>';
						break;
						case 3:
						$reason = $l['lang_better_version'];
						break;
					}

				$tmpl->assign(array('UP_TO_DATE' => false,
					'NEW_VERSION' => $row['new_version'],
					'REASON' => $reason,
					'LINK' => $row['link']));
				}

			$tmpl->display('admin_main.html');
			break;
			case 'unbanuser':
				if ($_POST['process'] == 'yes') {
				$username = sql_quote($_POST['username']);
				mysql_query("UPDATE `{$prefix}info` SET `status`='1' WHERE `username`='{$username}'") or die(mysql_error());
				$tmpl->assign('MESSAGE', $l['admin_unbanusersuccess']);
				$tmpl->display('message.html');
				}
				else {
				$tmpl->display('admin_unban_user_form.html');
				}
			break;
			case 'banuser':
				if ($_POST['process'] == 'yes') {
				$username = sql_quote($_POST['username']);
				mysql_query("UPDATE `{$prefix}info` SET `status`='0' WHERE `username`='{$username}'") or die(mysql_error());
				$tmpl->assign('MESSAGE', $l['admin_banusersuccess']);
				$tmpl->display('message.html');
				}
				else {
				$tmpl->display('admin_ban_user_form.html');
				}
			break;
			case 'edituser':
				if ($_POST['process'] == 'yes') {
				$username = sql_quote($_POST['username']);
					if ($_POST['process_b'] == 'yes') {
					$result = mysql_query("SELECT * FROM `{$prefix}info` WHERE `username`='{$username}'") or die(mysql_error());
					$row = mysql_fetch_array($result);
					$password = sql_quote($_POST['password']);
					$password_c = sql_quote($_POST['password_c']);
					$email = sql_quote($_POST['email']);
					$email_c = sql_quote($_POST['email_c']);
					$signature = sql_quote($_POST['signature']);
					$tz = sql_quote($_POST['tz']);
					$template = sql_quote($_POST['template']);
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
					$about_you = sql_quote($_POST['about_you']);
					$failed = false;
						if ($password == '' || $password_c == '') {
						$password_hash = $row['password'];
						}
						else {
							if ($password != $password_c) {
							$failed = true;
							}
							else {
							$password_hash = $user->generate_password($password_c, $row['salt']);
							}
						}

						if (!eregi('^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$', $email) || $email != $email_c) {
						$failed = true;
						}

						if (!eregi('^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$', $msn)) {
						$msn = '';
						}

						if (!preg_match('#^http[s]?:\/\/#i', $website)) {
						$website = 'http://' . $website;
						}

						if (!preg_match('#^http[s]?\\:\\/\\/[a-z0-9\-]+\.([a-z0-9\-]+\.)?[a-z]+(.*?)#i', $website)) {
						$website = '';
						}

						if (!preg_match('#^http[s]?:\/\/#i', $profile_image)) {
						$profile_image = 'http://' . $profile_image;
						}

						if (!preg_match('#^http[s]?\\:\\/\\/[a-z0-9\-]+\.([a-z0-9\-]+\.)?[a-z]+(.*?)#i', $profile_image)) {
						$profile_image = '';
						}

						if (strlen($password) < 4 || !is_numeric($show_email) || !is_numeric($icq) || !is_numeric($template) || !is_numeric($tz)) {
						$failed = true;
						}

						if ($config['pass_complex_num'] == 1 && !preg_match('/[0-9]*/i', $password)) {
						$failed = true;
						}

						if ($config['pass_complex_special'] == 1 && !preg_match('/[\$!@#%\^&\*\(\)-_\x7f-\xff\[\]\+=\.,\?\/><:;"\']*/', $password)) {
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

						if (strlen($about_you) > $config['max_about_you']) {
						$about_you = substr($about_you, 0, $config['max_about_you']);
						}

					mysql_query("UPDATE `{$prefix}info` SET `email`='{$email}',`signature`='{$signature}',`template`='{$template}',`tz`='{$tz}',`msn`='{$msn}',`yim`='{$yim}',`aim`='{$aim}',`skype`='{$skype}',`icq`='{$icq}',`website`='{$website}',`hobbies`='{$hobbies}',`occupation`='{$occupation}',`show_email`='{$show_email}',`profile_image`='{$profile_image}',`show_profile`='{$show_profile}',`about_you`='{$about_you}',`password`='{$password_hash}' WHERE `username`='{$username}'") or die(mysql_error());
					$tmpl->assign('MESSAGE', sprintf($l['admin_editusersuccess'], stripslashes($username)));
					$tmpl->display('message.html');
					}
					else {
					$result = mysql_query("SELECT * FROM `{$prefix}info` WHERE `username`='{$username}'");
					$row = mysql_fetch_array($result);
					$gettemplates = mysql_query("SELECT * FROM `{$prefix}templates`") or die(mysql_error());
						while ($template_row = mysql_fetch_array($gettemplates)) {
						$templates[] = array(stripslashes($template_row['name']), $template_row['id']);
						}
					$tmpl->assign(array('user_info' => $row,
						'templates' => $templates,
						'username' => $username));
					$tmpl->display('admin_edit_user_form.html');
					}
				}
				else {
				$tmpl->display('admin_edit_form.html');
				}
			break;
			case 'newfield':
				if ($_POST['process'] == 'yes') {
				$new_field_name = trim($_POST['new_field_name']);
					if (!preg_match('/^[a-zA-Z_\x7f-\xff][a-zA-Z0-9_\x7f-\xff]*$/', $new_field_name) || strlen($new_field_name) > 100) {
					$tmpl->assign('MESSAGE', $l['admin_newfielderror']);
					}
					else {
					mysql_query("ALTER TABLE `{$prefix}info` ADD `{$new_field_name}` VARCHAR(255) NOT NULL");
					$tmpl->assign('MESSAGE', $l['admin_newfieldsuccess']);
					}
				$tmpl->display('message.html');
				}
				else {
				$tmpl->display('admin_new_field_form.html');
				}
			break;
			case 'settings':
				if ($_POST['process'] == 'yes') {
				$gzip = sql_quote($_POST['gzip']);
				$cookie_prefix = sql_quote($_POST['cookie_prefix']);
				$cookie_secure = sql_quote($_POST['cookie_secure']);
				$cookie_path = sql_quote($_POST['cookie_path']);
				$cookie_expiration = sql_quote($_POST['cookie_expiration']);
				$cookie_domain = sql_quote($_POST['cookie_domain']);
				$max_login_attempts = sql_quote($_POST['max_login_attempts']);
				$login_redirect = sql_quote($_POST['login_redirect']);
				$logout_redirect = sql_quote($_POST['logout_redirect']);
				$template_directory = sql_quote($_POST['template_directory']);
				$compiled_directory = sql_quote($_POST['compiled_directory']);
				$auth_guest_profile = sql_quote($_POST['auth_guest_profile']);
				$default_template = sql_quote($_POST['default_template']);
				$max_about_you = sql_quote($_POST['max_about_you']);
				$auth_profile_image = sql_quote($_POST['auth_profile_image']);
				$activate = sql_quote($_POST['activate']);
				$language = sql_quote($_POST['language']);
				$site_name = sql_quote($_POST['site_name']);
				$email_signature = sql_quote($_POST['email_signature']);
				$from_email = sql_quote($_POST['from_email']);
				$image_verification = sql_quote($_POST['image_verification']);
				$fields = array('gzip', 'cookie_prefix', 'cookie_secure', 'cookie_path', 'cookie_expiration', 'cookie_domain', 'max_login_attempts', 'login_redirect', 'logout_redirect', 'template_directory', 'compiled_directory', 'auth_guest_profile', 'default_template', 'max_about_you', 'language', 'site_name', 'email_signature', 'from_email', 'image_verification', 'activate');
				$numeric = array('gzip', 'cookie_secure', 'max_login_attempts', 'auth_guest_profile', 'default_template', 'max_about_you', 'auth_profile_image', 'image_verification', 'activate');
				$failed = false;
					for ($x = 0; $x < count($numeric); $x++) {
						if (!is_numeric(${$numeric[$x]})) {
						$failed = true;
						}
					}

					if (strlen($cookie_prefix) > 255) {
					$cookie_prefix = substr($cookie_prefix, 0, 255);
					}

					if ($max_about_you > 20000) {
					$max_about_you = 20000;
					}

					if (!file_exists($main_path . '/language/' . $language . '/' . $language . '_main.php')) {
					$failed = true;
					}

					if (!eregi('^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$', $from_email)) {
					$failed = true;
					}

					if (strlen($email_signature) > 255) {
					$email_signature = substr($email_signature, 0, 255);
					}

					if (strlen($site_name) > 255) {
					$site_name = substr($site_name, 0, 255);
					}

					for ($y = 0; $y < count($fields); $y++) {
					$name = $fields[$y];
					$value = ${$name};
					mysql_query("UPDATE `{$prefix}config` SET `value`='{$value}' WHERE `name`='{$name}'");
					}

					if ($failed) {
					$tmpl->assign('MESSAGE', $l['admin_settingsfailed']);
					}
					else {
					$tmpl->assign('MESSAGE', $l['admin_settingssuccess']);
					}
				$tmpl->display('message.html');
				}
				else {
				$result = mysql_query("SELECT * FROM `{$prefix}templates`") or die(mysql_error());
					while ($row = mysql_fetch_array($result)) {
					$templates[] = array(stripslashes($row['name']), $row['id']);
					}
				$tmpl->assign(array('templates' => $templates,
					'image' => extension_loaded('gd')));
				$tmpl->display('admin_settings_form.html');
				}
			break;
			case 'deleteuser':
				if ($_POST['process'] == 'yes') {
				$username = sql_quote($_POST['username']);
				mysql_query("DELETE FROM `{$prefix}info` WHERE `username`='{$username}'") or die(mysql_error());
				$tmpl->assign('MESSAGE', sprintf($l['admin_deleteusersuccess'], stripslashes($username)));
				$tmpl->display('message.html');
				}
				else {
				$tmpl->display('admin_delete_user_form.html');
				}
			break;
			case 'newuser':
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
				$username = sql_quote($_POST['username']);
					if ($register) {
					$tmpl->assign('MESSAGE', sprintf($l['admin_newusersuccess'], stripslashes($username)));
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
			
					$errorstring .= "<br /><a href=\"admin.php?type=newuser&amp;username={$_POST['username']}&amp;signature={$_POST['signature']}&amp;tz={$_POST['tz']}&amp;template={$_POST['template']}&amp;msn={$_POST['msn']}&amp;yim={$_POST['yim']}&amp;aim={$_POST['aim']}&amp;skype={$_POST['skype']}&amp;icq={$_POST['icq']}&amp;website={$_POST['website']}&amp;hobbies={$_POST['hobbies']}&amp;occupation={$_POST['occupation']}&amp;show_email={$_POST['show_email']}&amp;profile_image={$_POST['profile_image']}&amp;about_you={$_POST['about_you']}\">{$l['register_error_go_back_same_values']}</a>";
					$tmpl->assign('MESSAGE', sprintf($l['admin_newuserfailed'], $errorstring));
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

				$tmpl->assign(array('form_submit' => 'admin.php?type=newuser',
					'random_id' => 	$random_id,
					'templates' => $template_array));
				$tmpl->display('register_form.html');
				}
			break;
			case 'memberlist':
			$page = (isset($_GET['page'])) ? $_GET['page'] : 1;
				if (!is_numeric($page)) {
				$page = 1;
				}

			$perpage = (isset($_GET['pp'])) ? $_GET['pp'] : 10;
				if (!is_numeric($perpage)) {
				$perpage = 10;
				}

			$offset = ($page - 1) * $perpage;
				if (!is_numeric($offset)) {
				$offset = 0;
				}

			$all_members = mysql_query("SELECT * FROM `{$prefix}info`") or die(mysql_error());
			$all_members_count = mysql_num_rows($all_members);
			$num_pages = ceil($all_members_count / $perpage);
				if ($offset != 0 && ($offset - $perpage) > 0) {
				$offset = $offset - $perpage;
				}
			
				for ($x = 1; $x < $num_pages; $x++) {
				$pages[] = $x;
				}

			$result = mysql_query("SELECT * FROM `{$prefix}info` ORDER BY `id` DESC LIMIT {$offset},{$perpage}") or die(mysql_error());
				while ($row = mysql_fetch_array($result)) {
				$user_array[] = array('id' => $row['id'], 'username' => stripslashes($row['username']), 'email' => $row['email'], 'joined' => gmdate('D M d, Y g:i a', $row['joined']));
				}

			$tmpl->assign(array('member_info' => $user_array,
				'total_members' => $all_members_count,
				'pages' => $pages,
				'current_page' => $page,
				'current_perpage' => $perpage));
			$tmpl->display('admin_memberlist.html');
			break;
			case 'installtemplate':
				if ($_POST['process'] == 'yes') {
				$template_name = sql_quote($_POST['template_name']);
				$template_dir = sql_quote($_POST['template_dir']);
					if ($template_name == '' || $template_dir == '') {
					$tmpl->assign('MESSAGE', $l['admin_new_template_error']);
					}
					else {
					mysql_query("INSERT INTO `{$prefix}templates` (`name`,`dir`) VALUES('{$template_name}','{$template_dir}')") or die(mysql_error());
					$tmpl->assign('MESSAGE', $l['admin_new_template_success']);
					}

				$tmpl->display('message.html');
				}
				else {
					foreach (glob(dirname(__FILE__) . '/templates/*') as $file_name) {
					$file_name = ereg_replace(dirname(__FILE__) . '\/templates\/', '', $file_name);
						if ($file_name != 'index.html' && $file_name != '..' && $file_name != '.') {
						$build_array[] = stripslashes(sql_quote($file_name));
						}
					}

				$tmpl->assign('templates', $build_array);
				$tmpl->display('admin_template_form.html');
				}
			break;
		}
	}
	else {
		if ($_POST['process'] == 'yes') {
		$password = $_POST['password'];
		$result = mysql_query("SELECT * FROM `{$prefix}info` WHERE `id`='{$user_info['id']}'") or die(mysql_error());
		$row = mysql_fetch_array($result);
		$generated_password = $user->generate_password($password, $user_info['salt']);
			if ($row['password'] == $generated_password) {
			ob_end_clean();
			$_SESSION[$config['cookie_prefix'] . 'admin_session'] = $user->generate_admin_session($password, $user_info['id'], $user_info['username'], $user_info['salt']);
			header('Location: admin.php');
			exit;
			}
			else {
			$tmpl->assign('MESSAGE', $l['admin_failed']);
			$tmpl->display('message.html');
			}
		}
		else {
		$tmpl->display('admin_login_form.html');
		}
	}
}
else {
$tmpl->assign('MESSAGE', $l['admin_noaccess']);
$tmpl->display('message.html');
}
include_once('includes/footer.php');
?>