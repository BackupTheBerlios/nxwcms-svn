<?
/**********************************************************************
* @module Application
**********************************************************************/
require_once "../../config.inc.php";

$auth = new auth("SHOP");

$page = new page("Shop overview");
include("logic/menudef.inc.php");
include("logic/productviewer.php");

$page->setJS("TREE");
// initialize variables
$action = value("action");

// do the variation-handling
$variation = variation();
if ((value("changevariation") != "0" && value("changevariation") != ""))
$page_state = "";

$handled = false;
$pnode = value("pnode", "NUMERIC", "");
if ($pnode == "") $pnode = "11";

// Kategoriebaum erstellen
$browser = new Foldermenu($lang->get("shopcat", "Shop Categories"), "snode");
// category startnode for shop.
$browser->startNode = "11";
// Title for root Node
$browser->rootTitle = $lang->get("shop", "Shop");
$browser->action = $c["docroot"] . "modules/shop/overview.php";
$page->addMenu($browser);
require_once $c["path"] . "modules/shop/logic/shop_api.php";
require_once $c["path"] . "modules/shop/logic/category_logic.php";
require_once $c["path"] . "modules/shop/logic/products.php";

// Kategorieausgabe
if (!$handled) {

	$go = "view";
	$form = new Form($lang->get("shopoverview", "Shop Categoy Overview"));

	$form->buttonbar->add("action", $lang->get("new_product", "New Product"), "submit", "document.form1.processing.value = '';");
	$form->buttonbar->add("separator", "", "", "", "");
	$form->buttonbar->add("action", $lang->get("new_category", "New Category"), "submit", "document.form1.processing.value = '';");
	$form->buttonbar->add("action", $lang->get("edit_cat", "Edit Category"), "submit", "document.form1.processing.value= '';");

	if ($pnode != "11") {
		$form->buttonbar->add("action", $lang->get("del_cat", "Delete Category"), "submit", "document.form1.processing.value= '';");
	}

	// Build breadcrumb
	$str = pathToRootFolder($pnode, 11);

	$form->add(new Spacer(2));
	$form->add(new AlignedLabel('lnl', getBoxedText($str, 'headeryellow', '100%'), 'left', '', 2));
	$form->add(new Spacer(2));
	$form->add(new SubCategorySelector($pnode, $lang->get("avail_subcat", "Subcategories in this category"), $c["docroot"]."modules/shop/overview.php?sid=$sid&pnode="));
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

	$content = createDBCArray("shop_products", "PRODUCT_ID", "CATEGORY_ID = " . $pnode . $filtersql, "ORDER BY PRODUCT_CODE");
	includePGNSources();

	for ($i = 0; $i < count($content); $i++) {
		$form->add(new ProductViewer($content[$i]));
	}

	if (count($content) == 0) {
		$form->add(new Label("lbl", "<center>" . $lang->get("no_contents", "No Contents available in this folder."). "</center>", "standard", 2));
	}

	if (isset($topText)) {
		$form->addToTopText($topText);
		$form->topicon = "ii_success.gif";
	}

	$form->add(new Hidden("action", ""));
	$form->add(new Hidden("pnode", $pnode));
	$page->add($form);
	$page->draw();
}
$db->close();
echo $errors;

//echo "Error: $errors OID: $oid GO: $go PAGEACTION $page_action PAGESTATE $page_state PROCCESING $processing";
?>