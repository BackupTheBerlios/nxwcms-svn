<?
	$startfile = "../cms/config.inc.php";

	//$startfile = "test.php";
	require_once $startfile;

	$filestack = array ();
	$missedfiles = array ();
	$missedclasses = array ();
	$parsedfiles = array ();
	array_push($filestack, $startfile);

	class ClassTree {
		var $name;

		var $classes;
		var $counter;
		var $haschild;

		function ClassTree($name) {
			$this->name = $name;

			$this->classes = array ();
			$this->counter = 0;
			$this->haschild = 0;
		}

		function add($class) {
			$this->classes[$this->counter] = new ClassTree($class);

			$this->counter++;
		}

		function extend($parent, $child, $recursive = false) {
			global $missedclasses, $class_added;

			$class_added = false;

			for ($i = 0; $i < count($this->classes); $i++) {
				if ($this->classes[$i]->name == $parent) {
					$this->classes[$i]->haschild = 1;

					$this->classes[$i]->add($child);
					$class_added = true;
					break;
				}
			}

			if (!$class_added) {
				for ($i = 0; $i < count($this->classes); $i++) {
					$this->classes[$i]->extend($parent, $child, true);

					if ($class_added) {
						break;
					}
				}
			}

			if (!$class_added && !$recursive) {
				array_push($missedclasses, array (
					$parent,
					$child
				));
			}
		}

		function draw() {
			echo "<HTML>\n<HEAD>\n<TITLE>Class-Structure of N/X WCMS</TITLE>\n</HEAD>";

			echo "<BODY>\n";
			echo "<font styleface=\"MS Sans Serif, Sans Serif, Arial\">\n";
			$this->draw_tree();
			echo "</font>\n";
			echo "</BODY>\n";
			echo "</HTML>";
		}

		function draw_tree() {
			for ($i = 0; $i < count($this->classes); $i++) {
				sort ($this->classes);

				echo "<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr>\n<td valign=\"top\">&nbsp;+--</td><td valign=\"top\">";
				echo $this->classes[$i]->name;
				echo "</td>\n</tr>";

				if ($this->classes[$i]->haschild) {
					echo "<tr>\n<td>&nbsp;</td><td valign=\"top\">";

					echo "\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr>\n<td valign=\"top\">&nbsp;</td><td valign=\"top\">";
					$this->classes[$i]->draw_tree();
					echo "</td>\n</tr></table>";
					echo "</td>\n</tr>";
				}

				echo "</table>";
			}
		}
	}

	$classtree = new ClassTree("main");

	while (count($filestack) > 0) {
		$filename = array_pop($filestack);

		array_push($parsedfiles, $filename);
		$f[0] = fopen($filename, "r");

		while (!feof($f[0])) {
			$extend = "";

			$classname = "";
			$classid = "";

			$s = trim(fgets($f[0], 4096));

			if (substr($s, 0, 1) == "/" || substr($s, 0, 1) == "*" || substr($s, 0, 1) == "}" || substr($s, 0, 1) == "$") { }
			else {
				$class = "";

				$class = stristr($s, "class ");

				if (substr($s, 0, 6) == "class ") {
					$classid = substr($class, strpos($class, " "), strlen($class) - strpos($class, " "));

					$end = strpos($classid, " ", 2);

					if ($end === false) {
						$classname = trim(substr($classid, 0));
					} else {
						$classname = trim(substr($classid, 0, strpos($classid, " ", 2)));
					}

					$extend = stristr($classid, "extends");

					if ($extend) {
						$parent1 = stristr($extend, " ");

						$end = strpos($parent1, "{", 2);

						if ($end === false) {
							$parent = trim(substr($parent1, 0));
						} else {
							$parent = trim(substr($parent1, 0, $end));
						}

						$classtree->extend($parent, $classname);
					} else {
						$classtree->add($classname);
					}
				}

				$require = "";
				$require = stristr($s, "require");

				if (substr($s, 0, 7) == "require") {
					$begin = strpos($require, " ");

					$reqstring = substr($require, $begin);
					$evalstring = "\$reqname = " . $reqstring;
					eval ($evalstring);

					if (is_file($reqname)) {
						if (!array_search($reqname, $filestack) && !array_search($reqname, $parsedfiles))
							array_push($filestack, $reqname);
					} else {
						array_push($missedfiles, $reqname);
					}
				}
			}
		}
	}

	$missedcounter = 0;

	while (count($missedclasses) > 0) {
		$missedclass = array_shift($missedclasses);

		$classtree->extend($missedclass[0], $missedclass[1]);
		$missedcounter++;

		if ($missedcounter > 700)
			break;
	}

	$classtree->draw();
?>