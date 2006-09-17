<?php
	/**********************************************************************
	 *	N/X - Web Content Management System
	 *	Copyright 2002-2006 Sven Weih <sven@nxsystems.org>
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
	 **********************************************************************/

/**
 * Views details of an product.
 */
class ProductViewer extends WUIInterface {

	var $id;
	/**
	 * Standard constructor
	 *
	 * @param integer $id ID of the product
	 * @return ProductViewer
	 */
	function ProductViewer($id) {
		$this->id = $id;		
	}
	
	
	/**
	 * Draw product information
	 *
	 */
	function draw() {
		global $sid, $lang;
		echo '<td colspan="2">';
		echo '<table width="100%" cellpadding="0" cellspacing="0" border="0">';
		echo '<tr><td colspan="2" class="headbox">'.getDBCell("shop_products", "PRODUCT_CODE", "PRODUCT_ID=".$this->id).'</td>';
		echo '<td class="headbox" width="150" align="right">';
		echo crLink($lang->get("delete"), doc()."?sid=$sid&oid=$this->id&action=delete");
		echo '&nbsp;&nbsp;';
		echo crLink($lang->get("edit"), doc()."?sid=$sid&oid=$this->id&action=product_update");
		echo '</td></tr>';		
		echo '<tr><td colspan="3">'.drawSpacer(1,20).'</td></tr>';
		echo '</table>';
		echo '</td>';
		return 2;		
	}
	
}


?>