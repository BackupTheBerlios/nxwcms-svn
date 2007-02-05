<?
	/**
	 * N/X Today-Page
	 * @module Index
	 * @package Layout
	 */

	/**********************************************************************
	 *	N/X - Web Content Management System
	 *	Copyright 2004 Fabian K�nig, fkoenig@fkhosting.de
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
	
	require_once "../../config.inc.php";
	$auth = new auth("ANY");
	require_once "nxtoday.inc.php";

	$nxtoday = new NXToday();
	$nxtoday->QuickLinks->add(new NXToday_SPLink(100140));
	$nxtoday->QuickLinks->add(new NXToday_ChannelLink("News"));
	$nxtoday->QuickLinks->add(new NXToday_SPLink(100083));
	$nxtoday->QuickLinks->add(new NXToday_ChannelLink("test"));


$page = new Page('N/X Today');
$page->add($nxtoday);
$page->draw();
?>