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
require_once "../../settings.inc.php";
$relative_script_path = $c["path"]."ext/phpdig";

include "$relative_script_path/includes/config.php";
include "$relative_script_path/admin/debug_functions.php";
include "$relative_script_path/libs/search_function.php";
 
// extract vars
extract(phpdigHttpVars(
     array('query_string'=>'string',
           'template_demo'=>'string',
           'refine'=>'integer',
           'refine_url'=>'string',
           'site'=>'integer',
           'limite'=>'integer',
           'option'=>'string',
           'search'=>'string',
           'lim_start'=>'integer',
           'browse'=>'integer',
           'path'=>'string'
           )
     ));
$results = phpdigSearch($id_connect, 'opener', $option, $refine,
              $refine_url, $lim_start, $limite, $browse,
              $site, $path, $relative_script_path, 'array');
              
var_dump($results);
?>