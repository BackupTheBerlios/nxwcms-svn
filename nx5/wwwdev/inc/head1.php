<?php
  echo '<a href="'.$cds->docroot.'">'.$cds->content->getByAccessKey('logo', array('class' => 'logo')).'</a>';
?>
<br>
<h3><span><?php echo $cds->content->getByAccessKey('title'); ?></span></h3>
<br>
<h4><?php echo $cds->content->getByAccessKey('subtitle'); ?></h4>