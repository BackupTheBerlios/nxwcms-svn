<?
/* This script is called by a form on your website used by your clients to submit a support ticket. */

include("phpTickets/tickets.inc.php");

$ticket = CreateTicket($ticket_subject, $ticket_name, $ticket_email, $ticket_category, $ticket_phone, $ticket_pri);
if ($ticket == false)
	mail ($trouble_email, "{TROUBLE} $ticket_subject", "[ERROR: CreateTicket failed]\n".$ticket_message, "From: $ticket_name\nReply-To: $ticket_email");
else {
	if (!PostMessage($ticket, $ticket_message)) {
		mail ($trouble_email, "{TROUBLE} $ticket_subject", "[ERROR: PostMessage failed]\n".$ticket_message, "From: $ticket_name\nReply-To: $ticket_email");
	}	
}
$cat_res = mysql_query("select replyto from categories where id = $category");
$cat_row = mysql_fetch_array($cat_res);

/* Modify the following to include a header and a footer so it matches the rest of your site... */
		
		if ($ticket) { 
?>
		A support ticket as been created (#<? print $ticket; ?>) and a representative will get back to you shortly by email.
		If you wish to send additional information regarding this ticket, please do not create another ticket. Instead,
		send an email with "[#<? print $ticket; ?>]" in the subject to <? print $cat_row["replyto"]; ?>.<br><Br>
<? 
		} else {  
			/* It did not work but the message as been sent to $trouble_email... */	
			print "We will get back to you shortly.";
		} 
?>