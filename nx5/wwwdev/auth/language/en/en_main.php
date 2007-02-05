<?php
/*** *** *** *** *** ***
*	File: en_main.php
*	Start: August 3rd, 2006
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
*** *** *** *** *** ***
* In this file you may find things like %1$s %b %u - do not edit these out or
* some functionality will be lost :)
*** *** *** *** *** ***/
if (!defined('IN_LOGIN_SYS')) {
die('Hacking is not permitted.');
}

/* Start of error/success messages */

$l['banned'] = 'You have been banned from this site.';

$l['login_loggedin'] = 'You are already logged in! If you want to login as someone else, you must logout first.';

$l['activate_alreadyactive'] = 'The specified account has already been activated. You may now <a href="login.php">login</a>.';

$l['login_failed'] = 'You have failed to login, please try a different user/password combination. You may have used up all of your attempts';

$l['activate_error'] = 'There was an error while trying to activate your account. The user/code combination is incorrect';

$l['activate_success'] = 'You have successfully activated your account. You may now <a href="login.php">login</a>.';

$l['register_success'] = 'You have successfully registered, you can now activate your account';

$l['register_error'] = 'There was an error while trying to register your account. Please recheck the field values.%1$s';

$l['register_alreadyregistered'] = 'You have already registered for this site, and you are already logged in.';

$l['register_notvalidemail'] = 'That email is not valid.';

$l['register_fieldinvalid'] = 'One of the fields was invalid.';

$l['register_passemailnotequal'] = 'Your passwords/emails did not match. Please retype them carefully!';

$l['register_tooshort'] = 'Your username/password was too short.';

$l['register_notvalidusername'] = 'Your username is not in a valid format (starts with letter or underscore, following by any amount of numbers, underscores, or letters).';

$l['register_useralreadyexists'] = 'That user already exists in our database. Please try a different username.';

$l['register_wrongimagecode'] = 'Sorry but the code from the image you entered was incorrect.';

$l['register_errors_returned'] = 'Errors Returned:';

$l['register_error_go_back_same_values'] = '&laquo; Go back with same values';

$l['profile_baduserid'] = 'That is not a valid user id, please try again. If you followed a valid link, please contact the owner of this site.';

$l['profile_badcommand'] = 'Sorry but this command does not exist.';

$l['profile_badcommandguest'] = 'Sorry but you are not authorized to execute this command. You can register <a href="register.php">here</a> or login <a href="login.php?dest=profile.php%1$s">here</a>.';

$l['profile_notlogged'] = 'Sorry but only registered users are allowed to access the profiles, you can register <a href="register.php">here</a> or login <a href="login.php?dest=profile.php%1$s">here</a>.';

$l['profile_doesntexist'] = 'That profile doesn\'t seem to exist.';

$l['profile_noshow'] = 'This user has disabled their profile to the public.';

$l['profile_failed'] = 'You have failed to update your profile, please go back and check the values.';

$l['profile_success'] = 'You have successfully updated your profile, you can edit it more <a href="profile.php?type=edit">here</a> or view it <a href="profile.php?type=view&amp;id=%1$s">here</a>.';

$l['admin_noaccess'] = 'Sorry but you don\'t have permission to access the administrator control panel. You may be logged out, or you may just not be an administrator. If you are an admin, please login <a href="login.php?dest=admin.php">here</a>.';

$l['admin_failed'] = 'Sorry but you have failed to login to the administrator control panel.';

$l['admin_deleteusersuccess'] = 'You have successfully deleted the user \'<em>%1$s</em>\'. You can go back to the admin control panel <a href="admin.php">here</a>.';

$l['admin_editusersuccess'] = 'You have successfully edited the user \'<em>%1$s</em>\'. You can go back to the admin control panel <a href="admin.php">here</a>.';

$l['admin_newfielderror'] = 'There was an error while trying to create that field, make sure the name starts with a letter or underscore, followed by any amount of letters, numbers, or underscores. You may return to the admin control panel <a href="admin.php">here</a>.';

$l['admin_newfieldsuccess'] = 'You have successfully created the new field \'<em>%1$s</em>\'. You may return to the admin control panel <a href="admin.php">here</a>.';

$l['admin_newuserfailed'] = 'There was an error while trying to create a new user, please recheck the form values. You can return to the admin control panel <a href="admin.php">here</a>.%1$s';

$l['admin_newusersuccess'] = 'You have successfully created the user \'<em>%1$s</em>\'. You can return to the admin control panel <a href="admin.php">here</a>.';

$l['admin_settingssuccess'] = 'You have successfully updated the site settings. You may return to the admin control panel <a href="admin.php">here</a>.';

$l['admin_settingsfailed'] = 'There was an error while trying to update the site settings. Please recheck the form values. You may return to the admin control panel <a href="admin.php">here</a>.';

$l['admin_unbanusersuccess'] = 'You have successfully unbanned that user. You can return to the admin control panel <a href="admin.php">here</a>.';

$l['admin_banusersuccess'] = 'You have successfully banned that user. You can return to the admin control panel <a href="admin.php">here</a>.';

$l['admin_new_template_success'] = 'You have successfully installed that template. You may return to the admin control panel <a href="admin.php">here</a>.';

$l['admin_new_template_error'] = 'There was an error while trying to install the specified template, please try again. You can go back to the admin control panel <a href="admin.php">here</a>.';

$l['index_notlogged'] = 'Sorry but you must be logged in to be able to view this section of the site. You can register <a href="register.php">here</a> or login <a href="login.php">here</a>.';

$l['image_gd_library'] = 'This file requires the GD library, and support for the <a href="http://www.php.net/imagettfbbox" target="_blank">imagettfbbox()</a> function and for the <a href="http://www.php.net/imagettftext" target="_blank">imagettftext()</a> function. If you have PHP 4.3.0 or greater, the GD library should already be bundled with PHP and these functions will work.';
/* End of error/success messages */

/* Misc Text */
$l['lang_message'] = 'Message';

$l['lang_activate_your_account'] = 'Activate Your Account';

$l['lang_user_id'] = 'User id';

$l['lang_code'] = 'Code';

$l['lang_go'] = 'Go';

$l['lang_login_to_your_account'] = 'Login To Your Account';

$l['lang_username'] = 'Username';

$l['lang_password'] = 'Password';

$l['lang_register_a_new_account'] = 'Register a New Account';

$l['lang_confirm_password'] = 'Confirm Password';

$l['lang_email'] = 'Email';

$l['lang_confirm_email'] = 'Confirm Email';

$l['lang_signature'] = 'Signature';

$l['lang_timezone'] = 'Time Zone';

$l['lang_tz_1'] = 'Eniwetok, Kwaialein';

$l['lang_tz_2'] = 'Midway Atoll, Samoa';

$l['lang_tz_3'] = 'Hawaii, Honolulu';

$l['lang_tz_4'] = 'Marquesas Islands';

$l['lang_tz_5'] = 'Alaska';

$l['lang_tz_6'] = 'Anchorage, Los Angeles, San Francisco, Seattle, Vancouver';

$l['lang_tz_7'] = 'Denver, Edmonton, Phoenix, Salt Lake City';

$l['lang_tz_8'] = 'Chicago, Guatamala, Houston, Mexico City, Saskatchewan';

$l['lang_tz_9'] = 'Bogota, Havanna, Lima, Miami, Montreal, New York, Ottawa';

$l['lang_tz_10'] = 'Caracas, La Paz, Santiago';

$l['lang_tz_11'] = 'Labrador, Newfoundland';

$l['lang_tz_12'] = 'Brasilia, Buenos Aires, Georgetown, Luxembourg, Rio de Janeiro';

$l['lang_tz_13'] = 'Mid-Atlantic';

$l['lang_tz_14'] = 'Azores, Cape Verde Islands';

$l['lang_tz_15'] = 'Abidjan, Casablanca, Dublin, Edinburgh, Glasgow, Lisbon, London, Reykjavik';

$l['lang_tz_16'] = 'Adis Abeba, Alger, Amsterdam';

$l['lang_tz_17'] = 'Athens, Cairo, Cape Town, Damascus';

$l['lang_tz_18'] = 'Dar-es-Salaam, Kuwait, Moscow, Nairobi, Riyadh';

$l['lang_tz_19'] = 'Tehran';

$l['lang_tz_20'] = 'Abu Dhabi, Baghdad, Muscat, Tblisi';

$l['lang_tz_21'] = 'Kabul';

$l['lang_tz_22'] = 'Maldives, Volgograd';

$l['lang_tz_23'] = 'Calcutta, Colombo, Islamabad, Madras, New Delhi';

$l['lang_tz_24'] = 'Nepal';

$l['lang_tz_25'] = 'Almaty, Dhakar, Kathmandu, Novosibirsk, Omsk';

$l['lang_tz_26'] = 'Cocos Islands, Myanmar';

$l['lang_tz_27'] = 'Bangkok, Hanoi, Jakarta, Ho Chi Min City, Singapore';

$l['lang_tz_28'] = 'Beijing, Bombay, Delhi, Hong Kong, Kuala Lumpar, Manila, Perth, Singapore, Taipei';

$l['lang_tz_29'] = 'Osaka, Seoul, Sapporo, Seoul, Tokyo, Yakutsk';

$l['lang_tz_30'] = 'Darwin, Adelaide';

$l['lang_tz_31'] = 'Brisbane, Canberra, Guam, Hobart, Melbourne, Port Moresby, Sydney, Vladivostok';

$l['lang_tz_32'] = 'Lord How Island';

$l['lang_tz_33'] = 'Magadan, New Caledonia';

$l['lang_tz_34'] = 'Norfolk Island';

$l['lang_tz_35'] = 'Auckland, Fiji, Kamchatka, Marshall Islands, Wellington, Suva';

$l['lang_tz_36'] = 'Chatham Islands';

$l['lang_tz_37'] = 'Phoenix Islands, Rawaki Islands, Tonga';

$l['lang_tz_38'] = 'Line Islands';

$l['lang_template'] = 'Template';

$l['lang_msn'] = 'MSN';

$l['lang_yim'] = 'YIM';

$l['lang_aim'] = 'AIM';

$l['lang_skype'] = 'Skype';

$l['lang_icq'] = 'ICQ';

$l['lang_website'] = 'Website';

$l['lang_hobbies'] = 'Hobbies';

$l['lang_occupation'] = 'Occupation';

$l['lang_show_email'] = 'Show Email?';

$l['lang_show'] = 'Show';

$l['lang_dont_show'] = 'Don\'t Show';

$l['lang_profile_image'] = 'Profile Image';

$l['lang_show_profile'] = 'Show Profile?';

$l['lang_about_you'] = 'About You';

$l['lang_edit_your_profile'] = 'Edit Your Profile';

$l['lang_new_password'] = 'New Password (leave blank for same)';

$l['lang_confirm_new_password'] = 'Confirm New Password';

$l['lang_leave_the_same'] = 'Leave the same';

$l['lang_enter_your_password'] = 'Enter Your Password';

$l['lang_delete_a_user'] = 'Delete a User';

$l['lang_are_you_sure'] = 'Are you sure?';

$l['lang_create_a_new_field'] = 'Create a New Field';

$l['lang_new_field_name'] = 'New field name';

$l['lang_edit_a_user'] = 'Edit a User';

$l['lang_ban_a_user'] = 'Ban a User';

$l['lang_unban_a_user'] = 'Unban a User';

$l['lang_change_settings'] = 'Change Settings';

$l['lang_enabled'] = 'Enabled';

$l['lang_disabled'] = 'Disabled';

$l['lang_gzip'] = 'GZIP Compression';

$l['lang_cookie_prefix'] = 'Cookie Prefix';

$l['lang_cookie_secure'] = 'Cookie Secure';

$l['lang_cookie_path'] = 'Cookie Path';

$l['lang_cookie_expiration'] = 'Cookie Expiration (seconds from time set)';

$l['lang_cookie_domain'] = 'Cookie Domain (no www or http://)';

$l['lang_max_login_attempts'] = 'Max. Login Attempts';

$l['lang_login_redirect_location'] = 'Login Redirect Location';

$l['lang_logout_redirect_location'] = 'Logout Redirect Location';

$l['lang_template_directory'] = 'Template Directory';

$l['lang_compiled_directory'] = 'Compiled Templates Directory';

$l['lang_auth_guest_profile'] = 'Guests can view profiles?';

$l['lang_yes'] = 'Yes';

$l['lang_no'] = 'No';

$l['lang_default_template'] = 'Default Template';

$l['lang_max_about_you'] = 'Max. About You (profile, in bytes)';

$l['lang_auth_profile_image'] = 'Users can have profile image?';

$l['lang_pass_complex_num'] = 'Users need at least 1 number in password?';

$l['lang_pass_complex_special'] = 'Users need at least 1 special character in password?';

$l['lang_language'] = 'Language';

$l['lang_site_name'] = 'Site Name';

$l['lang_email_signature'] = 'Email Signature';

$l['lang_from_email'] = 'From Email';

$l['lang_image_verification'] = 'Image Verification';

$l['lang_about_me'] = 'About Me';

$l['lang_image_code'] = 'Image Code';

$l['lang_remember_me'] = 'Remember Me';

$l['lang_menu_main'] = 'Main';

$l['lang_menu_logout'] = 'Logout';

$l['lang_menu_edit_your_profile'] = 'Edit Your Profile';

$l['lang_menu_login'] = 'Login';

$l['lang_menu_register'] = 'Register';

$l['lang_menu_activate_your_account'] = 'Activate Your Account';

$l['lang_menu_view_your_profile'] = 'View Your Profile';

$l['lang_bug_fix'] = 'Bug fix';

$l['lang_security_issue'] = 'Security issue';

$l['lang_important'] = 'Important';

$l['lang_better_version'] = 'Better version';

$l['lang_version_up_to_date'] = 'Your version is up to date';

$l['lang_version_not_up_to_date'] = 'Your version is not up to date';

$l['lang_reason'] = 'Reason';

$l['lang_upgrade_here'] = 'Upgrade here';

$l['lang_admin_control_panel'] = 'Admin Control Panel';

$l['lang_register_new_user'] = 'Register a new User';

$l['lang_require_activation'] = 'Require Activation?';

$l['lang_complete_member_list'] = 'Complete Member List';

$l['lang_joined'] = 'Joined';

$l['lang_items_per_page'] = 'Items Perpage';

$l['lang_all'] = 'Show All';

$l['lang_page'] = 'Select Page';

$l['lang_install_a_template'] = 'Install a new Template';

$l['lang_template_directory'] = 'Template Directory';

$l['lang_template_name'] = 'Template Name';

foreach ($l as $key => $value) {
	if (preg_match('/^lang_(.*?)$/', $key)) {
	$tmpl->assign($key, $value);
	}
}
?>