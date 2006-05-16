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
	 **********************************************************************/

	
	/**
	 * Create the table entry for a category in categories_info
	 *
	 * @param integer $categoryId
	 * @param integer $variationId
	 */
	function createCategoryInfo($categoryId, $variationId) {
		global $db;
		$sql = "INSERT INTO categories_info (CATEGORY_ID,VARIATION_ID,SORT_ORDER,DATE_ADDED) VALUES ($categoryId, $variationId,0,NOW())";
		$query = new query($db, $sql);
	}
	
	
	/**
	 * Checks, whether the table entry for category_info exists or not.
	 *
	 * @param integer $categoryId
	 * @param integer $variationId
	 */
	function categoryInfoExists($categoryId, $variationId) {
	  $cat = getDBCell("categories_info", "CATEGORY_ID", "CATEGORY_ID=$categoryId and VARIATION_ID=$variationId");
	  $result = ($cat != "");
	  return $result;		
	}

?>