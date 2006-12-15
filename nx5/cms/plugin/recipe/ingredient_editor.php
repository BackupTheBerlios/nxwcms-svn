<?php

class IngredientEditor extends WUIInterface {
	
  var $table;
  var $cond;
  var $values;
  
  
  function IngredientEditor($table, $cond)	{
    $this->values = array();
    $this->cond = $cond;
    $this->table = $table;	
    
    
  }
	
	function draw() {
		echo '<td colspan="2">';
		echo '<table width="100%" cellpadding="2" cellspacing="0" border="0" class="standardlight">';
		echo '<tr><td  style="border-bottom:1px solid #222299;"width="200"><b>Quantity</b></td><td  style="border-bottom:1px solid #222299;" width="400"><b>Ingredient</b></td></tr>';
		for ($i=1; $i<18; $i++) {
			echo '<tr><td><input type="text" size="128" style="width:190px;" value="'.$this->values[$i][0].'" name="quantity'.$i.'"/></td>';
			echo '<td><input type="text" size="256" style="width:390px;" value="'.$this->values[$i][1].'" name="ingredient'.$i.'"/></td></tr>';
		}
		echo '</table>';
		echo '</td>';
		return 2;
	}
}

?>