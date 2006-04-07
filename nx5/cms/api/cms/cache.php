<?
	/**
	 * @module Cache
	 * @package ContentManagement
	 */
	$cc = array ();

	/**
	 * renders a SitePage and stores output in a file in temporary cache-folder $c["tmpcachepath"]
	 *
	 * @param integer SPID of the SitePage to render
	 * @param integer Variation-ID of the SitePage to render
	 */
	function renderTMPSitePage($spid, $variation) {
		global $c, $db;
 
		if ($c["renderstatichtml"]) {
			$template = getTemplate($spid);

			$filename = $c["livepath"] . $template;
			$content_array = @file($filename);

			if (is_array($content_array)) {
				$content_string = implode("", $content_array);
				$full_url = $c["hostlivedocroot"] . $template . "?page=" . $spid . "&v=" . $variation;
				forceDirectories ($c["tmpcachepath"]);
				$fp = fopen($full_url, "r");
				if ($fp != "") {
					while (!feof($fp)) $content .= fgets($fp, 128);
	
					fclose ($fp);
					$spname = getSPNameUrlSafe($spid);
					$cache_file = fopen($c["tmpcachepath"] .$spname ."_" . $spid . "_v" . $variation . ".html", "w");
					fwrite($cache_file, $content);
					fclose ($cache_file);
				}
			}
			return true;
		}
	}

	/**
		* moves cached files from temporary cache-dir to their final destination
		* 
	 */
	function launchCache($spid, $variation) {
		global $c;

		if ($c["renderstatichtml"]) {
			forceDirectories ($c["tmpcachepath"]);

			$spname = getSPNameUrlSafe($spid);
			nxCopy($c["tmpcachepath"] .$spname ."_" . $spid . "_v" . $variation . ".html", $c["cachepath"], $spname."_". $spid . "_v" . $variation . ".html");
			@unlink ($c["tmpcachepath"]. $spname ."_" . $spid . "_v" . $variation . ".html");
		}
	}

	/**
	  * renders a SitePage and stores output in a file in $c["cachepath"]
	  *
	  * @param integer SPID of the SitePage to render
	  * @param integer Variation-ID of the SitePage to render
	  */
	function renderSitePage($spid, $variation) {
		global $c, $db;

		if ($c["renderstatichtml"] && !checkCC($spid)) {
			global $cc, $deploy;
			array_push($cc, $spid);
			$template = getTemplate($spid);

			if ($template != "") {
				$filename = $c["livepath"] . $template;

				$content_array = file($filename);
				$content_string = implode("", $content_array);
				forceDirectories ($c["cachepath"]);
				$full_url = $c["hostlivedocroot"] . $template . "?page=" . $spid . "&v=" . $variation;
				$fp = fopen($full_url, "r");
				if ($fp != "") {
					while (!feof($fp)) $content .= fgets($fp, 128);

					fclose ($fp);
					$spname = getSPNameUrlSafe($spid);
					$cache_file = fopen($c["cachepath"] .$spname."_" . $spid . "_v" . $variation . ".html", "w");
					fwrite($cache_file, $content);
					fclose ($cache_file);
					if (count($deploy)>0)
						nxCopy($c["cachepath"] .$spname."_" . $spid . "_v" . $variation . ".html", $c["cachepath"], $spname."_".$spid."_v".$variation.".html");
				}
			}

			return true;
		}
	}

	/**
	 * rebuilds the complete cache of the whole website.
	 *
	 */
	function rebuildCache() {
		global $c, $db;
		if ($c["renderstatichtml"]) {
			$maxtime = ini_get("max_execution_time");
			ini_set("max_execution_time", $c["timeout"]);
			$sp_sql = "SELECT SPID FROM sitepage WHERE DELETED=0 AND VERSION=10";
			$sp_query = new query($db, $sp_sql);
			$clist_id = 0;
			while ($sp_query->getrow()) {
				$my_spid = $sp_query->field("SPID");

				$sv_sql = "SELECT VARIATION_ID FROM variations";
				$sv_query = new query($db, $sv_sql);
				while ($sv_query->getrow()) {
					$my_variation = $sv_query->field("VARIATION_ID");

					if (isCached($my_spid, $my_variation)) {
						if (SPVarExists($my_spid, $my_variation)) {
							flushSitePage($my_spid, $my_variation);
							renderTMPSitePage($my_spid, $my_variation);
							$cacheList[$clist_id]["SPID"] = $my_spid;
							$cacheList[$clist_id]["VARI"] = $my_variation;
							$clist_id++;
						}
					}
				}
			}

			ini_set("max_execution_time", $maxtime);

			for ($clist_id = 0; $clist_id < count($cacheList); $clist_id++) {
				launchCache($cacheList[$clist_id]["SPID"], $cacheList[$clist_id]["VARI"]);
			}
		}
	}

	/**
		* removes the cached version of a SitePage from $c["cachepath"]
		*
		* @param integer LIVE-SPID of the SitePage to remove from cache
		* @param integer Variation-ID of the SitePage to remove from cache
		*/
	function flushSitePage($spid, $variation) {
		global $c;

		if ($c["renderstatichtml"]) {
			$spname = getSPNameUrlSafe($spid);
			nxDelete ($c["cachepath"], $spname."_" . $spid . "_v" . $variation . ".html");
		}
	}

	/**
		* checks if a SitePage is allowed to be cached and returns true in case it is, or false if not.
		*
		* @param integer SPID of the SitePage to check
		* @param integer Variation-ID of the SitePage to check
		*/
	function isCached($spid, $variation) {
		global $c;

		if ($c["renderstatichtml"]) {
			$menuId = getDBCell("sitepage", "MENU_ID", "SPID=$spid");

			$cached = 0;

			if ($menuId != "0" && $menuId != 0 && $menuId != "")
				$cached = getDBCell("sitemap", "IS_CACHED", "MENU_ID = " . $menuId);

			if ($cached == 1) {
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}
	}

	function forceDirectories($path) {
		if (strlen($path) == 0) {
			return 0;
		}

		if (strlen($path) < 3) {
			return 1; // avoid 'xyz:\' problem.
		} elseif (is_dir($path)) {
			return 1; // avoid 'xyz:\' problem.
		} elseif (dirname($path) == $path) {
			return 1; // avoid 'xyz:\' problem.
		}

		return (ForceDirectories(dirname($path))and mkdir($path, 0775));
	}

	/**
	 * Checks, whether a page-cache has already been renedered to avoid resource waste.
	 * again.
	 * @param integer LIVE-SPID of the page.
	 */
	function checkCC($in) {
		global $cc;

		return in_array($in, $cc);
	}

	/**
	 * Deletes the whole dynamic cache
	 */
	function removeDynamicCache() {
		global $c, $JPCACHE_ON, $JPCACHE_FILEPREFIX;

		if (!ini_get("safe_mode")) {
			// Deletes all the files in the dynamic cache directory!
		
			if ($JPCACHE_ON) {
				$d = dir($c["dyncachepath"]);

				while ($entry = $d->read()) {
					if ($entry != "." && $entry != "..") {
						@unlink ($c["dyncachepath"] . $entry);
				}
				}

				$d->close();
			}
		}
	}
	
	/* jpcacheFilename
	 * @param integer pageId id of the page 
	 * @param integer Variation Id of the page.
     */
    function jpcacheFilename($pageid, $variation)
    {                        
        global $c;
    	$get = array("page" => "$pageid", "v" => "$variation"); 
    	$varkey .= "GET=".serialize($get);
    	$name = $c["livedocroot"].getTemplate($pageid);
    	$key = md5($name.$varkey);
        return $key;
    }

    
?>