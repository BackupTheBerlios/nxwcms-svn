<?php
  echo $cds->content->getByAccessKey('logo', array('class' => 'logo'));
?>
<br>
<h3><span><?php echo $cds->content->getByAccessKey('title'); ?></span></h3>
<br>
<h4><?php echo $cds->content->getByAccessKey('subtitle'); ?></h4>