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

  
$dispatcher->registerHandler('draw_category_icons', 'doDrawCategoryIcons');




/**
 * Draw a overview list with existing categories
 *
 * @param integer $categoryId 0, if all Categories shall be drawn or concrete ID, if a special Category should be drawn.
 */
function doDrawCategoryIcons(&$dispatcher) {
	global $cds;
	$result = "";
	// always start with base menu 11	
		// base category = 11.
		$categories = getChildCategories(11);
		$result.= '<table width="100%" border="0"  cellpadding="0" cellspacing="0">';
  	    // draw the category list
		for ($i=0; $i < count ($categories); $i++) {		  
			$result.= '<tr><td>';
  			$result.= $cds->layout->spacer(1,1);
  			$result.= '</td></tr>';
  			$result.= '<tr><td>';	
			$result.= _drawCategoryMenu($categories[$i]);	
			$result.= '</td></tr>';			
		}	
		$result.= '</table>';
	echo $result;
}


/**
 * Draw the menu-item of a single shop-category. Usually just a link is created and maybe subcategories are
 * resolved and drawn. You can also access the Object which is linked to the category and extract pictures or
 * texts out of it.
 *
 * @param integer $categoryId ID of the category, which is to be drawn.
 */
function _drawCategoryMenu($categoryId) {
    global $cds;
	$objectId = getClusterNodeIdFromCategoryId($categoryId);  	
	$object = $cds->cluster->getById($objectId);
	$href = $cds->docroot.'shop.php?category='.$categoryId.'&do=draw_category';
  	return '<a href="'.$href.'">'.$object->content->get("Icon").'</a>';
}
?>