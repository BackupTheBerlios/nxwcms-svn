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

  
$dispatcher->registerHandler('draw_product_detail', 'doDrawProductDetails');


/**
 * Draw the Product Preview in the list of a product.
 *
 * @param ShopDispatcher $dispatcher
 */
function doDrawProductDetails(&$dispatcher) {			
	$dispatcher->execute("draw_header");
	$obj = $dispatcher->getProductObject();
	br();
	echo '<table width="560" cellpadding="0" cellspacing="0" border="0" style="background-color:#333333;border-top:1px solid #ffffff;border-left:1px solid #ffffff;border-right:1px solid #ffffff;height:342px;margin-left:10px;">';
	echo '<tr height="15"><td width="50">'.drawSpacer(50,1).'</td>';
	echo '<td width="450" valign="top">&nbsp;</td>';
	echo '<td width="40">'.drawSpacer(40,1).'</td>';
	echo '<td width="12" align="center" style="border-left:1px solid #ffffff; border-bottom:1px solid #ffffff;"><a style="color:white;" href="'.$dispatcher->getShopURL("draw_category").'">x</a></td>';
	echo '</tr>';
	
	// Foto und Konfiguration.
	echo '<tr heigth="100"><td width="50">'.drawSpacer(50,1).'</td>';
	echo '<td width="450" valign="top">';
	echo '<table width="100%" border="0" cellpadding="0" cellspacing="0">';
    echo '<tr><td width="200" valign="top">';
      // Image;
      echo $dispatcher->getProductObject()->content->get("Image");
    echo '</td><td width="50">'.drawSpacer(50,1).'</td>';
    echo '<td width="200" valign="top">';
      // Konfigurator
    drawConfigurator($dispatcher);  
    echo '</td></tr>';
	
	echo '</table>';
	echo '</td>';
	echo '<td width="40" colspan="2">'.drawSpacer(40,1).'</td>';	
	echo '</tr>';
	
	echo '<tr height="150"><td width="50">&nbsp;</td>';
	echo '<td width="450" valign="top">';
	echo '<table width="450" style="height:270px;" border="0" cellpadding="0" cellspacing="0">';
	// Title und Beschreibung.
	echo '<tr>';
	echo '<td><b>'.$dispatcher->getProductObject()->content->get("Name").'</b><br>'.$dispatcher->getProductObject()->content->get("Description").'</td>';	
	echo '</tr>';
	echo '</table>';
	echo '</td>';
	echo '<td colspan="2">&nbsp;</td>';
	echo '</tr>';
	
	// Footezeile
	echo '<tr><td colspan="4">&nbsp;</td></tr>';

	echo '</table>';
}


/**
 * Draw the Configurator of the product
 *
 * @param Shopdispatcher $dispatcher
 */
function drawConfigurator(&$dispatcher) {
  $category = $dispatcher->getCategoryName();
  if (sameText('Schals', $category)) {
  	drawSchalsConfigurator($dispatcher);
  } else if (sameText('Mützen', $category)) {
  	drawMuetzenConfigurator($dispatcher);
  }   	
}

/**
 * DrawSchalConfigurator
 *
 * @param unknown_type $dispatcher
 */
function drawSchalsConfigurator(&$dispatcher) {
	echo '<table width="200" border="0" cellpadding="2" cellspacing="0">';
	echo '<tr>';
	echo '<td align="right">Länge</td>';
	echo '<td class="inputfields"></td>';
	echo '</tr>';
	
	echo '</table>';
}

/**
 * DrawMuetzenConfigurator
 *
 * @param unknown_type $dispatcher
 */
function drawMuetzenCongifurator(&$dispatcher) {
	echo 'Mützenkonfigurator';
	
}

?>