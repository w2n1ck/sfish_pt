#
# (C) Tenable Network Security, Inc.
#


include("compat.inc");

if(description)
{
 script_id(10263);
 script_version ("$Revision: 1.49 $");

 script_name(english:"SMTP Server Detection");
 
 script_set_attribute(attribute:"synopsis", value:
"An SMTP server is listening on the remote port." );
 script_set_attribute(attribute:"description", value:
"The remote host is running a mail (SMTP) server on this port. 

Since SMTP servers are the targets of spammers, it is recommended you
disable it if you do not use it." );
 script_set_attribute(attribute:"solution", value:
"Disable this service if you do not use it, or filter incoming traffic
to this port." );
 script_set_attribute(attribute:"risk_factor", value:"None" );
script_end_attributes();

 script_summary(english:"SMTP Server Detection");
 script_category(ACT_GATHER_INFO);
 script_copyright(english:"This script is Copyright (C) 2005-2009 Tenable Network Security, Inc.");
 script_family(english:"Service detection");
 script_dependencie("find_service_3digits.nasl", "doublecheck_std_services.nasl", "check_smtp_helo.nasl", "smtpscan.nasl");
 script_require_ports("Services/smtp", 25);
 exit(0);
}

include("smtp_func.inc");

port = get_kb_item("Services/smtp");
if ( ! port ) port = 25;
if ( ! get_port_state(port) ) exit(0);

banner = get_smtp_banner(port:port);
if ( banner && banner =~ "^220" && "220 CCProxy " >!< banner )
 {
   report = '\nRemote SMTP server banner :\n\n' + banner;
   security_note(port:port, extra:report);
 }
