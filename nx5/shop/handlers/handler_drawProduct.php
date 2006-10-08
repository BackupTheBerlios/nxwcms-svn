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

  
$dispatcher->registerHandler('draw_product', 'doDrawProduct');


/**
 * Draw the Product Preview in the list of a product.
 *
 * @param ShopDispatcher $dispatcher
 */
function doDrawProduct(&$dispatcher) {	
	$obj = $dispatcher->getProductObject();
	echo '<table width="100%" cellpadding="2" cellspacing="2" border="0">';
	echo '<tr><td width="100">&nbsp;</td>';
	echo '<td width="30">&nbsp;</td>';
	echo '<td width="600" style="font-weight:bold;">'.$obj->content->get("name").'</td>';
	echo '<td width="50">&nbsp;</td>';
	echo '</tr>';
	echo '<tr><td valign="top" align="center">'.$obj->content->get("Image").'</td>';
	echo '<td width="30">&nbsp;</td>';
	echo '<td valign="top">'.$obj->content->get("Description").'</td>';
	echo '<td width="50">&nbsp;</td>';
	echo '</tr>';
	echo '</table>';
}

?>