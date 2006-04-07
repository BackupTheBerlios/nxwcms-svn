<?
	/**********************************************************************
	 *	N/X - Web Content Management System
	 *	Copyright 2002 Sven Weih, FZI Research Center for Information Technologies
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

	/**
	 * Form for prompting a question to the user and awaiting the answer.
	 *
	 * @package WebUserInterface
	 */
	class YesNoForm extends Form {

		/**
		  * Standard constructor
		  * @param $title Title of the form
		  * @param $prompt Prompt-message of the form
		  */
		function YesNoForm($title, $prompt) {
			Form::Form($title);

			$this->addToTopText($prompt);
			$this->topicon = "ii_question.gif";
		}

		/**
		  * processes the form. Used internally only.
		  */
		function process() { }

		/**
		 * internal. Draws the buttons of your form.
		 */
		function draw_buttons() {
			global $lang;

			echo "<tr><td align=\"right\" colspan=\"2\">";			
			$resetbutton = new ButtonInline("decision", $lang->get("no"), "navelement", "submit", $this->getWaitupScreen());
			echo $resetbutton->draw();
			
			echo "&nbsp;&nbsp;&nbsp;";
			$submitbutton = new ButtonInline("decision", $lang->get("yes"), "navelement", "submit", $this->getWaitupScreen());
			echo $submitbutton->draw();
			
			echo '<input type="hidden" name="decision" value=""><br/>';			
			echo "</td></tr>";
		}
	}
?>