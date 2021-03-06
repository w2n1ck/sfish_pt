#
# (C) Tenable Network Security, Inc.
#

include( 'compat.inc' );

if(description)
{
  script_id(10520);
  script_version ("$Revision: 1.17 $");
  script_cve_id("CVE-2000-1022");
  script_bugtraq_id(1698);
  script_xref(name:"OSVDB", value:"419");

  script_name(english:"Cisco PIX Firewall Mailguard Feature SMTP Content Filter Bypass");
  script_summary(english:"Attempts to communicate directly with the remote SMTP server");

   script_set_attribute(
    attribute:'synopsis',
    value:'The remote service is vulnerable to an access control breach.'
  );

  script_set_attribute(
    attribute:'description',
    value:'The remote SMTP server seems to be protected by a content
filtering firewall probably Cisco\'s PIX.

However, an attacker may bypass this content filtering
by issuing a DATA command before a MAIL command,
that allow him to directly communicate with the real SMTP daemon.'
  );

  script_set_attribute(
    attribute:'solution',
    value:'http://www.cisco.com/warp/public/707/PIXfirewallSMTPfilter-pub.shtml'
  );

  script_set_attribute(
    attribute:'see_also',
    value:'http://archives.neohapsis.com/archives/bugtraq/2000-09/0241.html'
  );

  script_set_attribute(
    attribute:'cvss_vector',
    value:'CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P'
  );

  script_end_attributes();
 script_category(ACT_GATHER_INFO);
 script_copyright(english:"This script is Copyright (C) 2000-2009 Tenable Network Security, Inc.");
 script_family(english:"Firewalls");
 script_dependencie("find_service1.nasl", "smtpserver_detect.nasl", "sendmail_expn.nasl");
 script_exclude_keys("SMTP/wrapped", "SMTP/qmail", "SMTP/postfix");
 script_require_ports("Services/smtp", 25);
 exit(0);
}

#
# The script code starts here
#

include("smtp_func.inc");
port = get_kb_item("Services/smtp");
if(!port)port = 25;
if (get_kb_item('SMTP/'+port+'/broken')) exit(0);

if(get_port_state(port))
{
 soc = open_sock_tcp(port);
 if(soc)
 {
 data = smtp_recv_banner(socket:soc);
 if(data && ereg(string:data, pattern:"^220.*"))
 {
   cmd = string("HELP\r\n");
   send(socket:soc, data:cmd);
   r = recv_line(socket:soc, length:1024);
   if(ereg(string:r, pattern:"^500.*"))
   {
     cmd = string("DATA\r\n");
     send(socket:soc, data:cmd);
     r = recv_line(socket:soc, length:1024);
     cmd = string("HELP\r\n");
     r = recv_line(socket:soc, length:1024);
     if(ereg(string:r, pattern:"^214.*"))security_hole(port);
   }
 }
 close(soc);
 }
}
