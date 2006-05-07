<?
	/**********************************************************************
	 * @module Application
	 **********************************************************************/
	require_once "../../config.inc.php";

	$auth = new auth("SHOP");
	
	$page = new page("Shop overview");
	$page->setJS("TREE");
	
	// initialize variables
	$action = value("action");
	$handled = false;
	
	// Kategoriebaum erstellen
	$browser = new Foldermenu($lang->get("shopcat", "Shop Categories"));
	// category startnode for shop.
	$browser->startNode = "11"; 
	// Title for root Node
	$browser->rootTitle = $lang->get("shop", "Shop");
	$browser->action = $c["docroot"] . "modules/shop/overview.php";
	$page->addMenu($browser);		
	require_once $c["path"] . "modules/shop/logic/category_logic.php";
	
	// Kategorieausgabe
	if (!$handled) {
		
		$go = "view";
		$form = new Form($lang->get("shopoverview", "Shop Categoy Overview"));

        $form->buttonbar->add("action", $lang->get("new_product", "New Product"), "submit", "document.form1.processing.value = '';");
		$form->buttonbar->add("separator", "", "", "", "");		
		$form->buttonbar->add("action", $lang->get("new_category", "New Category"), "submit", "document.form1.processing.value = '';");

	    if ($pnode != "11") {		
			$form->buttonbar->add("action", $lang->get("edit_cat", "Edit Category"), "submit", "document.form1.processing.value= '';");
			$form->buttonbar->add("action", $lang->get("del_cat", "Delete Category"), "submit", "document.form1.processing.value= '';");
		}

		// Build breadcrumb
		if ($pnode == "")
			$pnode = "11";

		//$str = pathToRootFolder($pnode);
		
		$form->add(new Spacer(2));
		$form->add(new AlignedLabel('lnl', getBoxedText($str, 'headergrey', '100%'), 'left', '', 2));
		$form->add(new Spacer(2));

		// add contents
		if ($filter != "0") {
			pushVar("filter", $filter);
		} else {
			$filter = getVar("filter");
		}

		if ($linkset != "0") {
			pushVar("linkset", $linkset);
		} else {
			$linkset = getVar("linkset");

			if ($linkset == "") {
				$linkset = "LIB";
			}
		}		
		if (strlen($linkset) > 3) $disableMenu = true;

		
		if ($sname != "0") {
			pushVar("sname", $sname);
		} else {
			$sname = getVar("sname");	
		}

		$filtersql = "";
		
		$content = createDBCArray("content", "CID", "VERSION=0 AND DELETED=0 AND CATEGORY_ID = " . $pnode . $filtersql, "ORDER BY NAME");
		includePGNSources();

		for ($i = 0; $i < count($content); $i++) {
			$form->add(new LibraryViewer($content[$i], 2, $linkset, "image"));
		}

		if (count($content) == 0) {
			$form->add(new Label("lbl", "<center>" . $lang->get("no_contents", "No Contents available in this folder."). "</center>", "standard", 2));
		}

		if (isset($topText)) {
			$form->addToTopText($topText);
			$form->topicon = "ii_success.gif";
		}
		
		$form->add(new Hidden("action", ""));
		$page->add($form);

	}
	
	

	
	
	$page->draw();
	$db->close();
//echo "Error: $errors OID: $oid GO: $go PAGEACTION $page_action PAGESTATE $page_state PROCCESING $processing";
?>