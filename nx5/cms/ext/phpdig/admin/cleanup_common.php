<?php
/*
--------------------------------------------------------------------------------
PhpDig 1.6.x
This program is provided under the GNU/GPL license.
See LICENSE file for more informations
All contributors are listed in the CREDITS file provided with this package

PhpDig Website : http://phpdig.toiletoine.net/
Contact email : phpdig@toiletoine.net
Author and main maintainer : Antoine Bajolet (fr) bajolet@toiletoine.net
--------------------------------------------------------------------------------
*/
require_once "../prepend.php";
include "$relative_script_path/includes/config.php";
include "$relative_script_path/libs/auth.php";
?>
<?php include $relative_script_path.'/libs/htmlheader.php' ?>
<head>
<title>PhpDig : Cleanup common words</title>
<?php include $relative_script_path.'/libs/htmlmetas.php' ?>
</head>
<body bgcolor="white">
<h2><?php phpdigPrnMsg('cleanupcommon'); ?></h2>
<?php
$locks = phpdigMySelect($id_connect,'SELECT locked FROM '.PHPDIG_DB_PREFIX.'sites WHERE locked = 1');
if (is_array($locks)) {
    phpdigPrnMsg('onelock');
}
else {
mysql_query('UPDATE '.PHPDIG_DB_PREFIX.'sites SET locked=1',$id_connect);
//set the max time to an hour
set_time_limit(3600);
$numtot = 0;
$common_words = phpdigComWords("$relative_script_path/includes/common_words.txt");
while (list($common) = each($common_words))
       {
       //list of common words in the keywords table
       $query = "select key_id from ".PHPDIG_DB_PREFIX."keywords where keyword like '$common'";
       $res = mysql_query($query,$id_connect);
       if ($res)
       {
       while (list($key_id) = mysql_fetch_row($res))
              {
              //delete references to this keyword in the engine table
              $query = "DELETE FROM ".PHPDIG_DB_PREFIX."engine WHERE key_id=$key_id";
              mysql_query($query,$id_connect);
              $numdel = mysql_affected_rows($id_connect);
              print "$numdel".phpdigMsg('deletedfor')."$common ($key_id)<br />";
              $numtot += $numdel;
              }
       //delete this common word from the keywords table
       $query = "DELETE from ".PHPDIG_DB_PREFIX."keywords where keyword like '$common'";
       }
       mysql_query($query,$id_connect);
       }
print "<h3>".phpdigMsg('cleanuptotal')."$numtot".phpdigMsg('cleaned')."</h3>";
mysql_query('UPDATE '.PHPDIG_DB_PREFIX.'sites SET locked=0',$id_connect);
}
?>
<br /><br />
<a href="index.php?sid=<?php echo $sid; ?>">[<?php phpdigPrnMsg('back'); ?>]</a> <?php phpdigPrnMsg('to_admin'); ?>.
<br/>
</body>
</html>