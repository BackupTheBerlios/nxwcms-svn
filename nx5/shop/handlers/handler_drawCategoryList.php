<?php
/**********************************************************************
 *	N/X - Web Content Management System
 *	Copyright 2002-2006 Sven Weih
 *
 *	This file is part of N/X.
 *	The initial has been setup as a small diploma thesis (Studienarbeit) at the FZI.
 *	It was be coached by Prof. Werner Zorn and Dipl.-Inform Thomas Gauweiler.
 *
 *	N/X is free software; you can redistribute it and/or modify
 *	it under the terms of the GNU General Public License as published by
 *	the Free Software Foundation; either version 2 of the License, or
 *	(at your option) any later version.
 *
 *	N/X is distributed in the hope that it will be useful,
 *	but WITHOUT ANY WARRANTY; without even the implied warranty of
 *	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *	GNU General Public License for more details.
 *
 *	You should have received a copy of the GNU General Public License
 *	along with N/X; if not, write to the Free Software
 *	Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

  
$dispatcher->registerHandler('draw_category', 'doDrawCategory');


/**
 * Draw a category. This means category header, subcategory-list and products
 *
 * @param ShopDispatcher $dispatcher Reference to the shop-dispatcher
 */
function doDrawCategory(&$dispatcher) {
	global $cds;	
	$categoryObject = $dispatcher->getCategoryObject();
	
	// Draw the layout.
	drawCategoryHeader($categoryObject);	
	drawCategory($dispatcher);
}

/**
 * Draw the Header of a category. Usually the name of the category.
 *
 * @param Cluster $categoryObject Content-Object, which is linked to the category.
 */
function drawCategoryHeader($categoryObject) {
	global $cds;
	echo '<table width="100%" cellpadding="0" cellspacing="0" border="0">';
	echo '<tr><td align="right" style="border-bottom:1px solid #333333;">';
	echo $categoryObject->content->get("Visual");
	echo '</td></tr>';
	echo '</table>';		
}

/**
 * Draw the product list and the headline
 *
 * @param Cluster $categoryObject Content-Object, which is linked to the category.
 */
function drawCategory(&$dispatcher) {
  echo '<div style="width:649px; height:354px; padding-left:10px;overflow:auto;">';
  br();
  $categoryObject = $dispatcher->getCategoryObject();
  echo $categoryObject->content->get("Headline");
  $dispatcher->execute("draw_product_list");
  echo '</div>';
}

?>