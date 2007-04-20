<?php
  define('ACCESS_CONTENT_ONLY', true);
  require_once  "../../../cms/config.inc.php";
  require_once  "../../nxheader.inc.php";
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>Add URL</title>
	<link rel="stylesheet" href="styles.css" type="text/css">
</head>

<body>

<table width="100%" height="100%">
	<tr>
		<td align="center" valign="middle">
			
			
			<?php

//******************************************************************* 
//  File:		inc.recommend.php © Big Lick Media - BigLickMedia.com
//  Author:		D Stewart
//  Date:		04-16-2006
//  Version:	2.4
//*******************************************************************


/* Config Section */


$sitename = $cds->content->getByAccessKey("title");				// Name of your site.
$errorstyleclass = 'error';					// The class that specifies the CSS error color.
$errormessages = array(); 
$errorfields = array(); 
$entryadded = false;
if(count($_POST) > 0) { 
    if(get_magic_quotes_gpc()) $_POST = strip_magic_quotes($_POST); 

}
?> 

<?php 
if($entryadded) { 
	echo empty($sent) ? '' : '<p>'.$cds->content->getByAccessKey("taf_success").' ' . implode(', ', $sent) . '</p>'; 
	echo empty($failed) ? '' : '<p>'.$cds->content->getByAccessKey("taf_failed").' '. implode(', ', $failed);
} else { 
    if(count($_POST) > 0 && !empty($errormessages)) { 
        echo '<table><tr><td><span class="' , $errorstyleclass , '">'; 
        echo $cds->content->getByAccessKey('taf_errors').'<br />'; 
        foreach($errormessages as $value) { 
            echo ' &nbsp; &nbsp; &raquo; ' ,$value , '<br />'; 
        } 
        echo '</span><br /></td></tr></table>'; 
    } 
?> 

<table>
<form method="post" action="<?php echo $_SERVER['PHP_SELF'];?>">
	<tr>
		<td class="formtexttitle" colspan="2">Add a Page to the Linklist</td>
	</tr>
    <tr>
        <td class="formtext">Website title</td>
        <td><input type="text" name="title" value="<?php echo isset($_POST['title']) ? $_POST['title'] : '';?>" class="<?php echo in_array('title', $errorfields) ? $errorstyleclass : ''; ?>" onfocus="this.style.borderColor='#0072BC';" onblur="this.style.borderColor='silver';">
        </td>
    </tr>
    <tr>
        <td class="formtext">Website URL</td>
        <td><input type="text" name="url" value="<?php echo isset($_POST['url']) ? $_POST['url'] : 'http://';?>" class="<?php echo in_array('url', $errorfields) ? $errorstyleclass : ''; ?>" onfocus="this.style.borderColor='#0072BC';" onblur="this.style.borderColor='silver';">
        </td>
    </tr>
    <tr>
        <td class="formtext">Backlink URL</td>
        <td><input type="text" name="backlink" value="<?php echo isset($_POST['backlink']) ? $_POST['backlink'] : 'http://';?>" class="<?php echo in_array('backlink', $errorfields) ? $errorstyleclass : ''; ?>" onfocus="this.style.borderColor='#0072BC';" onblur="this.style.borderColor='silver';">
        </td>
    </tr>
    <tr>
        <td class="formtext">Your Name (will not be displayed)</td>
        <td><input type="text" name="name" value="<?php echo isset($_POST['name']) ? $_POST['name'] : '';?>" class="<?php echo in_array('name', $errorfields) ? $errorstyleclass : ''; ?>" onfocus="this.style.borderColor='#0072BC';" onblur="this.style.borderColor='silver';">
        </td>
    </tr>
    <tr>
        <td class="formtext">EMail Address (will not be displayed)</td>
        <td><input type="text" name="email" value="<?php echo isset($_POST['email']) ? $_POST['email'] : '';?>" class="<?php echo in_array('email', $errorfields) ? $errorstyleclass : ''; ?>" onfocus="this.style.borderColor='#0072BC';" onblur="this.style.borderColor='silver';">
        </td>
    </tr>
        
    <tr>
        <td class="formtext">Description</td><td>
		       <textarea name="description" rows="5" cols="31" class="<?php echo in_array('messsage', $errorfields) ? $errorstyleclass : ''; ?>" onfocus="this.style.borderColor='#0072BC';" onblur="this.style.borderColor='silver';"><?php echo isset($_POST['description']) ? $_POST['description'] : '';?></textarea>
        </td>
    </tr>
    
    <tr>
        <td colspan="2">
            <table>
                <tr>
                    <td><input class="send" type="submit" value="Submit Form"/></td>
                    <td class="formtext">&nbsp;</td>
                    <td><input class="reset" type="reset" value="Reset Form" /></td>
                </tr>
            </table>
        </td>
    </tr>
</form>
</table>
<?php 
} 
?>

<?php 
function strip_magic_quotes($arr) { 
    foreach($arr as $k => $v) { 
        if(is_array($v)) { 
            $arr[$k] = strip_magic_quotes($v); 
        } else { 
            $arr[$k] = stripslashes($v); 
        } 
    } 
    return $arr; 
} 

?>
			
			
			
			<br><a href="javascript:window.close()"><?php echo $cds->content->getByAccessKey("taf_close"); ?></a>
		</td>
	</tr>
</table>

</body>
</html>
<?php
  require_once "../../nxfooter.inc.php";
?>