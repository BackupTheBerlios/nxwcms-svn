<?
	/**********************************************************************
	 * @module Application
	 **********************************************************************/

	/**
	 * Logic for processing shop categories.
	 * @package InternalLogic
	 */


	
	// initialize
	$action = value("action");
	$oid = value("oid", "NUMERIC");
	$deleteobject = value("deleteobject");
	
	// processing page actions
	if ($action != "0") {
		
		// Create new Category
		
		if ($action == $lang->get("new_category")) {
			if ((value("go") == "0") && (value("goon") == "0"))
				$go = "insert";
			if ($go == "insert")
				$page_action = "INSERT";
			$form = new stdEDForm($lang->get("new_category"));
			$cond = $form->setPK("categories", "CATEGORY_ID");
			$catname = new TextInput($lang->get("cat_name", "Category Name"), "categories", "CATEGORY_NAME", $cond, "type:text,width:200,size:32", "MANDATORY&UNIQUE");
			$catname->setFilter("PARENT_CATEGORY_ID = $pnode");
			$form->add($catname);
			$form->add(new Hidden("action", $lang->get("new_category")));
			$form->add(new Hidden("pnode", $pnode));
			$form->add(new NonDisplayedValueOnInsert("categories", "PARENT_CATEGORY_ID", $cond, $pnode, "NUMBER"));
			$form->add(new NonDisplayedValueOnInsert("categories", "DELETED", $cond, 0, "NUMBER"));			
			$form->forbidDelete(true);
			$page->add($form);
			$handled = true;
		
		// Delete existing Category
		
		} else if ($action == $lang->get("del_cat") && $pnode != "11") {
			if (!isset($go))
				$go = "start";
			$delhandler = new ActionHandler("deletefolder");
			
			// removed comment-out from following line because deleting folders didn't work anymore.
			$oid = $pnode;
			if ($go != $lang->get("Cancel")) {
   			$amount = 0;

				//$sql1 = "SELECT COUNT(CATEGORY_ID) AS ANZ FROM content WHERE CATEGORY_ID = $oid AND DELETED=0";
				//$sql2 = "SELECT COUNT(CATEGORY_ID) AS ANZ FROM cluster_templates WHERE CATEGORY_ID = $oid AND DELETED=0";
				$sql3 = "SELECT COUNT(CATEGORY_ID) AS ANZ FROM categories WHERE PARENT_CATEGORY_ID = $oid AND DELETED=0";

				/**
				$query = new query($db, $sql1);
				$query->getrow();
				$amount += $query->field("ANZ");
				$query = new query($db, $sql2);
				$query->getrow();
				$amount += $query->field("ANZ");
				*/
				$query = new query($db, $sql3);
				$query->getrow();
				$amount += $query->field("ANZ");
				$delHandler = new ActionHandler("DELETE");				
				if ($amount == 0) {
					if (value("decision") == $lang->get("yes")) {
						// set new folder-id.
						$parentId = getDBCell("categories", "PARENT_CATEGORY_ID", "CATEGORY_ID = " . $oid);
						pushVar("snode", $parentId);			
						// delete folder.
						$delhandler->addDBAction("DELETE FROM categories WHERE CATEGORY_ID = $oid");
						$delhandler->addDBAction("Delete From categories_info Where CATEGORY_ID=$oid");
						$delhandler->process("deletefolder");
						// set new id.
						$oid = $pnode = $parentId;
					} else if (value("decision") != $lang->get("no")) {
						$title = getDBCell("categories", "CATEGORY_NAME", "CATEGORY_ID = " . $oid);
						$form = new YesNoForm($lang->get("r_catdel", "Delete Category"). " $title", $lang->get("cat_delmes", "Do you really want to delete this category?"));
						$form->add(new Hidden("action", $lang->get("del_cat")));
						$form->add(new Hidden("pnode", $pnode));
						$page->add($form);
						$handled = true;
					}
				} else {
					$title = getDBCell("categories", "CATEGORY_NAME", "CATEGORY_ID = $oid");
					$delform = new MessageForm($lang->get("del_cat"). " $title", $lang->get("r_catnotempty", "The category you want to delete is not empty."), doc(). "?" . $auth->getSid());
					$page->add($delform);
					$handled = true;
				}
			}
	
		
		// Edit existing category.
	
		} else if ($action == $lang->get("edit_cat") && $pnode != "11") {
			$go = "UPDATE";

			$isFolder = true;
			$oid = $pnode;
			if (! categoryInfoExists($oid, $variation)) 
			  createCategoryInfo($oid, $variation);
			$page_action = "UPDATE";
			$form = new EditForm($lang->get("r_editfolder"), "i_folderproperties.gif");
			$cond = $form->setPK("categories", "CATEGORY_ID");
			$form->add(new TextInput($lang->get("cat_name"), "categories", "CATEGORY_NAME", $cond, "type:text,width:200,size:32", "MANDATORY"));
			$fd = new FolderDropdown($lang->get("parent_cat", "Parent Category"), "categories", "PARENT_CATEGORY_ID", $cond);
			$fd->baseNode = "11";
			$fd->stopNode = $pnode;
			$form->headerlink = crHeaderLink($lang->get("back"), "modules/shop/overview.php?sid=$sid&pnode=$oid");
			$form->buttonbar->setVariationSelector(createNameValueArrayEx("variations", "NAME", "VARIATION_ID", "1", "ORDER BY NAME ASC"), $variation);
			$form->add($fd);
			$form->add(new Hidden("pnode", $pnode));
			$form->add(new Hidden("action", $lang->get("edit_cat")));
			$cond2 = $cond." AND VARIATION_ID=$variation";
			
			
			$specialID = $variation;
			// label
			
			$form->add(new TextInput($lang->get("disptitle", "Display Name"), "categories_info", "TITLE", $cond2, "type:text,width:350,size:255", "MANDATORY"));
			$form->add(new SubTitle("st", $lang->get("sel_image", "Select image"),2));
			$form->add(new LibrarySelect("categories_info", "IMAGE", $cond, "IMAGE"));
			
			$form->add(new SubTitle("st", $lang->get("header")));
			$form->add(new RicheditInput($lang->get("header", "Header"), "categories_info", "HEADER", $cond2, "type:rich,width:580,size:6", ""));		
			$form->add(new SubTitle("st", $lang->get("footer")));
			$form->add(new RicheditInput($lang->get("footer", "Footer"), "categories_info", "FOOTER", $cond2, "type:rich,width:580,size:6", ""));		

			$page->add($form);
			$handled = true;				
		} 
	} // end isset($action)

	/**
	 * internally used only for creating a array for deleting a folder tree.
	 */
	function createDelArray(&$handler, $id) {
		global $db;

		$sql = "SELECT CATEGORY_ID FROM categories WHERE PARENT_CATEGORY_ID = $id";
		$query = new query($db, $sql);

		while ($query->getrow()) {
			$cid = $query->field("CATEGORY_ID");

			$dsql = "UPDATE categories SET DELETED = 1 WHERE CATEGORY_ID = $cid";
			$handler->addDBAction($dsql);
			createDelArray($handler, $cid);
		}

		$query->free();
		$dsql = "UPDATE categories SET DELETED = 1 WHERE CATEGORY_ID = $id";
		$handler->addDBAction($dsql);
	}
?>