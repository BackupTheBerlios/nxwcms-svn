<?php


/** 
* ObjectParser
* Converts object code to objects.
**/ 
class ObjectParser {
	
	/**
	 *  Parses the placeholders [xxx] and replaces them with code.
	 *
	 * @param string $text text to parse;
	 */
	function parse($text) {
	  global $variation;
	  if (preg_match_all('/\[(.+?)\]/is', $text, $matches)) {
	  	$tags = $matches[1];
  		  foreach($tags as $tag) {
  		    $id = getDBCell('content', 'CID', 'UPPER(ACCESSKEY) = "'.strtoupper($tag).'"');
  		    if ($id != "") {
  		    	$pgnRef = createPGNRef2($id, $variation);     
            	if (! is_object($pgnRef)) return " ";
            	if (!$pgnRef->exists()) {
              	  $pgnRef = createPGNRef2($id, $c["stdvariation"]);
          		}
          		$res = $pgnRef->draw();
          		$text = str_ireplace('['.$tag.']', $res, $text);                 
  		    }	
  		 }
	  }	
	  return $text;
	}
	
	
}

?>