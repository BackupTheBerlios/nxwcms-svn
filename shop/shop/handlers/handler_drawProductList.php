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

  
$dispatcher->registerHandler('draw_product_list', 'doDrawProductList');


/**
 * Draw the Product Preview in the list of a product.
 *
 * @param ShopDispatcher $dispatcher
 */
function doDrawProductList(&$dispatcher) {
  global $cds;
  $products = getProducts($dispatcher->categoryId);
  $categoryColor = $dispatcher->getCategoryObject()->content->get("ProductColor"); 
  br();  
  
  echo '<table width="560" cellpadding="0" cellspacing="0" border="0">';
  for ($i=0; $i < count($products); $i++) {
  	echo '<tr><td style="background-color:'.$categoryColor.';">';
  	$dispatcher->productId = $products[$i];
  	$dispatcher->execute("draw_product");
  	echo '</td></tr>';
  	echo '<tr><td style="height:4px;">';
  	echo $cds->layout->spacer(10,4);
  	echo '</td></tr>';  	
  	
  }
  
  echo '</table>'; 
}

?>