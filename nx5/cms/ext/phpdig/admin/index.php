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
Header('Pragma: no-cache');
require_once "../prepend.php";

include "$relative_script_path/includes/config.php";
//include "$relative_script_path/libs/auth.php";

// extract vars
extract( phpdigHttpVars(
     array('message'=>'string')
     ));

?>
<?php include $relative_script_path.'/libs/htmlheader.php' ?>
<head>
<title>PhpDig : <?php phpdigPrnMsg('admin') ?></title>
<?php include $relative_script_path.'/libs/htmlmetas.php' ?>
</head>
<body bgcolor="white">
<table width="100%"><tr><td colspan="2" class="stats_title1" align="left">
 Run Spider
 </td></tr><tr><td>
<?php
$phpdig_tables = array('sites'=>'Hosts','spider'=>'Pages','engine'=>'Index','keywords'=>'Keywords','tempspider'=>'Temporary table');
print "<table style=\"border:1px solid #666666\" class=\"bcopy\">\n";
print "<tr><td class=\"stats_title2\" colspan='2' align='center'><b>".phpdigMsg('databasestatus')."</b></td></tr>\n";
while (list($table,$name) = each($phpdig_tables))
       {
       $result = mysql_fetch_array(mysql_query("SELECT count(*) as num FROM ".PHPDIG_DB_PREFIX."$table"),MYSQL_ASSOC);
       print "<tr>\n\t<td class=\"greyFormLight\">\n$name : </td>\n\t<td class=\"greyForm\">\n<b>".$result['num']."</b>".phpdigMsg('entries')."</td>\n</tr>\n";
       }
print "</table>\n";
?>
</td></tr>
<tr>
<td>&nbsp;</td><td>&nbsp;</td>
</tr>
<tr><td valign="top" colspan="2" class="bcopy">
<h3><?php phpdigPrnMsg('index_uri') ?></h3>
<form class="grey" action="spider.php" method="post">
<input class="phpdigSelect" type="text" name="url" value="<?php echo $c["host"].$c["livedocroot"]; ?>" size="56"/>
<br/>
<?php phpdigPrnMsg('spider_depth') ?> :
<select class="phpdigSelect" name="limit">
<?php
//select list for the depth limit of spidering
for($i = 1; $i <= SPIDER_MAX_LIMIT; $i++) {
    print "\t<option value=\"$i\">$i</option>\n";
} ?>
</select>
<input type="submit" name="spider" value="Dig this !" />
<input type="hidden" name="sid" value="<?php echo $sid; ?>">
</form>
<p class="blue">
<?php if ($message) { phpdigPrnMsg($message); } ?>
</p>

<a href="cleanup_engine.php?sid=<?php echo $sid; ?>"><?php print phpdigMsg('clean')." ".phpdigMsg('t_index'); ?></a> |
<a href="cleanup_keywords.php?sid=<?php echo $sid; ?>"><?php print phpdigMsg('clean')." ".phpdigMsg('t_dic'); ?></a> |
<a href="cleanup_common.php?sid=<?php echo $sid; ?>"><?php print phpdigMsg('clean')." ".phpdigMsg('t_stopw'); ?></a> |
<a href="statistics.php?sid=<?php echo $sid; ?>"><?php phpdigPrnMsg('statistics') ?></a>
<br><br>
</td></tr><tr><td colspan="2" class="bcopy" valign="top">

<h3><?php phpdigPrnMsg('site_update') ?></h3>
<form action="update_frame.php" >
<select class="phpdigSelect" name="site_ids[]" multiple="multiple" size="10" style="width:250px;">
<?php
//list of sites in the database
$query = "SELECT site_id,site_url,port,locked FROM ".PHPDIG_DB_PREFIX."sites ORDER BY site_url";
$result_id = mysql_query($query,$id_connect);
while (list($id,$url,$port,$locked) = mysql_fetch_row($result_id))
    {
    if ($port)
        $url .= " (port #$port)";
    if ($locked) {
        $url = '*'.phpdigMsg('locked').'* '.$url;
    }
    print "\t<option value='$id'>$url</option>\n";
    }
?>
</select>
<br/>
<input type="submit" name="update" value="<?php phpdigPrnMsg('updateform'); ?>" />
<input type="submit" name="delete" value="<?php phpdigPrnMsg('deletesite'); ?>" />
<input type="hidden" name="sid" value="<?php echo $sid; ?>">
</form>
<br/>

</td></tr></table>

</body>
</html>