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
include "$relative_script_path/admin/robot_functions.php";

// extract http vars
extract(phpdigHttpVars(array('type' => 'string')));

set_time_limit(300);
?>
<?php include $relative_script_path.'/libs/htmlheader.php' ?>
<head>
<title>PhpDig : <?php phpdigPrnMsg('statistics') ?> </title>
<?php include $relative_script_path.'/libs/htmlmetas.php' ?>
</head>
<body bgcolor="white">
<table class="bcopy"><tr><td valign="top" class = "bcopy">
<h1><?php phpdigPrnMsg('statistics') ?></h1>
<a href="statistics.php?type=mostkeys&sid=<?php echo $sid; ?>">: <?php phpdigPrnMsg('mostkeywords') ?></a>
<br /><a href="statistics.php?type=mostpages&sid=<?php echo $sid; ?>">: <?php phpdigPrnMsg('richestpages') ?></a>
<br /><a href="statistics.php?type=mostterms&sid=<?php echo $sid; ?>">: <?php phpdigPrnMsg('mostterms') ?></a>
<br /><a href="statistics.php?type=largestresults&sid=<?php echo $sid; ?>">: <?php phpdigPrnMsg('largestresults') ?></a>
<br /><a href="statistics.php?type=mostempty&sid=<?php echo $sid; ?>">: <?php phpdigPrnMsg('mostempty') ?></a>
<br /><a href="statistics.php?type=lastqueries&sid=<?php echo $sid; ?>">: <?php phpdigPrnMsg('lastqueries') ?></a>
<br /><a href="statistics.php?type=responsebyhour&sid=<?php echo $sid; ?>">: <?php phpdigPrnMsg('responsebyhour') ?></a>
<br/>
<a href="index.php?sid=<?php echo $sid; ?>" >[<?php phpdigPrnMsg('back') ?>]</a> <?php phpdigPrnMsg('to_admin') ?>.
</td><td valign="top" class = "bcopy">
<?php
if ($type)
    {
    $query = "SET OPTION SQL_BIG_SELECTS=1";
    mysql_query($query,$id_connect);

    $start_table_template = "<table class=\"bcopy\" style=\"border:1px solid black;\">\n";
    $end_table_template = "</table>\n";
    $line_template = "<tr>%s</tr>\n";
    $title_cell_template = "\t<td>%s</td>\n";
    $cell_template[0] = "\t<td>%s</td>\n";
    $cell_template[1] = "\t<td>%s</td>\n";
    $cell_template[2] = "\t<td>%s</td>\n";
    $cell_template[3] = "\t<td>%s</td>\n";

    $mod_template = count($cell_template);
    flush();

    $result = phpdigGetLogs($id_connect,$type);

    if (is_array($result)) {
        print $start_table_template;
        // title line
        $title_line = '';
        list($i,$titles) = each($result);
        foreach($titles as $field => $useless) {
            $title_line .= sprintf($title_cell_template,ucwords(str_replace('_',' ',$field)));
        }
        printf($line_template,$title_line);
        foreach($result as $id => $row) {
           $this_line = '';
           $id_row_style = $id % $mod_template;
           foreach ($row as $value) {
                $this_line .= sprintf($cell_template[$id_row_style],$value);
           }
           printf($line_template,$this_line);
        }
        print $end_table_template;
    }
    }
?>
</td></tr></table>
</body>
</html>