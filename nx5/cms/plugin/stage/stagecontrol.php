<?php
	/**********************************************************************
	 *	N/X - Web Content Management System
	 *	Copyright 2007 Sven Weih, FZI Research Center for Information Technologies
	 *	www.fzi.de
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

class StageControl extends WUIInterface {

  var $id;
  
  function StageControl($id) {
    $this->id = $id;
  }
  
  /**
   * Draw the widget
   */
  function draw() {
  	global $lang;
  	echo '<td colspan="2">';
  	echo '<table width="100%" border="0" cellpadding="0" cellspacing="0" class="standardlight">';
  	echo '<tr><td>';
    $this->drawLayoutDefinition();
  	echo '</td></tr>';
  	echo '</table>';
  	echo '</td>';
  }
  
  /**
   * Draw the layout definition controls
   */
  function drawLayoutDefinition() {
  	global $lang;
  	echo '<table width="100%" border="0" cellpadding="0" cellspacing="0" class="standardlight">';
  	echo '<tr><td>';
    echo $lang->get("columns", "Columns");
    echo '</td>';
    $values = array();
    for ($i=1; $i<5; $i++) {
      $values[] = array($i, $i);
    }
    $select = new Select("columns".$id, $values, "standardlight", 0, 1, $width = 20);
    $select->draw(); 
    echo '<td>';
    echo $lang->get("rows", "Rows");
    echo '</td>';
    
    $values = array();
    for ($i=1; $i<16; $i++) {
      $values[] = array($i, $i);
    }
    $select = new Select("rows".$id, $values, "standardlight", 0, 1, $width = 20);
    $select->draw();     
    echo '</tr>';    
    echo '<td>'.$lang->get("withcol1", "Width Column 1 (px)").'</td>';
    echo '<td>'.$lang->get("withcol2", "Width Column 2 (px)").'</td>';
    echo '<td>'.$lang->get("withcol3", "Width Column 3 (px)").'</td>';
    echo '<td>'.$lang->get("withcol4", "Width Column 4 (px)").'</td>';
    echo '</tr>';
    echo '</table>' ;
  }

}


?>