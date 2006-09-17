<?php
if (($action == $lang->get("new_product")) || ($action == "product_update")) {
	// Set the Handled flag to avoid category drawing
	$handled = true;
	// Set editmode to create, if no other editmode is set.
	if ($action ==  $lang->get("new_product")) {
	  $go = "CREATE";
	  $page_action = "INSERT";
	  $title = $lang->get("create_product", "Create new Product");
	} else {
		$page_action = "UPDATE";
		$title = $lang->get("edproduct", "Edit Product");
	}
	$form = new stdEDForm($title,"");	
	$form->enableVariationSelector();
	$cond = $form->setPK("shop_products", "PRODUCT_ID");
	$oname = new TextInput($lang->get("productcode", "Product Code"), "shop_products", "PRODUCT_CODE", $cond, "type:text,width:300,size:64", "MANDATORY");
	$form->add($oname);
    $form->add(new TextInput($lang->get("price", "Price"), "shop_products", "PRICE", $cond, "type:text,size:10,width:100", "NUMBER", "NUMBER"));	
	$form->add(new ClusterInput($lang->get("prodtemp", "Product Template"), "shop_products", "CLNID", $cond, "IS_SHOP_PRODUCT=1", variation(), "PROCUT_CODE"));
	
	$form->add(new Hidden("action", $action));
	$form->add(new Hidden("pnode", $pnode));
	$form->add(new NonDisplayedValueOnInsert("shop_products", "CATEGORY_ID", $cond, $pnode, "NUMBER"));
	$form->add(new NonDisplayedValueOnInsert("shop_products", "DATE_ADDED", $cond, "NOW()", "NUMBER"));
	$form->add(new NonDisplayedValue("shop_products", "DATE_MODIFIED", $cond, "NOW()", "NUMBER"));
	$form->add(new NonDisplayedValueOnInsert("shop_products", "PERSON_ADDED", $cond,$auth->userName ,"TEXT"));
	$form->forbidDelete(true);
	$page->add($form);
	$page->draw();
	
}
?>