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


// Purpose of this script:
//
// draw the preview of one product. Used in products overview.


function drawProductPreview($productId) {
	global $cds;
	
	// initialize the output
	$result = '';
	
	// get the product object
	$productClusterNodeId = getClusterNodeIdFromProductId($productId);
	$productObject = $cds->cluster->getById($productClusterNodeId);			
	
	// format the output
	$image = $productObject->content->get("Image", "ALL");
	$result.='<table width="100%" border="0" cellpadding="0" cellspacing="0">';
	$result.='<tr><td valign="top" width="120">';
	$result.=$cds->layout->getImageTag($image, false);
	$result.='</td><td>'.$cds->layout->spacer(10,1).'</td><td valign="top" width="100%"><b>';
	$result.=$productObject->content->get("Name");
	$result.='</b><br>'.$productObject->content->get("Description");	
	$result.='<br>'.getPrice($productId);
	$result.='</td></tr></table>';		
	// return the output
	return $result;
}

?>