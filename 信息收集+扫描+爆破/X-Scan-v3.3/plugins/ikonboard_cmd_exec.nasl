#
# (C) Tenable Network Security, Inc.
#


include("compat.inc");

if(description)
{
 script_id(11605);
 script_bugtraq_id(7361);
 script_xref(name:"OSVDB", value:"11739");
 script_cve_id("CVE-2003-0770");
 script_version ("$Revision: 1.12 $");
 
 script_name(english:"Ikonboard FUNC.pm lang Cookie Arbitrary Command Execution");
 
 script_set_attribute(attribute:"synopsis", value:
"The remote web server is hosting a CGI application that is affected by
a remote command execution vulnerability." );
 script_set_attribute(attribute:"description", value:
"The remote server is running IkonBoard, a forum management CGI.

The installed version fails to properly sanitize the 'lang' cookie
when it contains illegal characters.  An attacker, exploiting this
flaw, could execute arbitrary code on the remote host when the cookie
is inserted into a Perl 'eval' statement." );
 script_set_attribute(attribute:"see_also", value:"http://archives.neohapsis.com/archives/bugtraq/2003-04/0027.html" );
 script_set_attribute(attribute:"see_also", value:"http://archives.neohapsis.com/archives/bugtraq/2003-09/0102.html" );
 script_set_attribute(attribute:"see_also", value:"http://archives.neohapsis.com/archives/bugtraq/2003-09/0259.html" );
 script_set_attribute(attribute:"solution", value:
"There is no known solution at this time." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P" );


script_end_attributes();

 
 summary["english"] = "Checks for Ikonboard.cgi";
 
 script_summary(english:summary["english"]);
 
 script_category(ACT_GATHER_INFO);
 
 
 script_copyright(english:"This script is Copyright (C) 2003-2009 Tenable Network Security, Inc.");
 family["english"] = "CGI abuses";
 script_family(english:family["english"]);
 script_dependencie("http_version.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 exit(0);
}

include("global_settings.inc");
include("misc_func.inc");
include("http.inc");

port = get_http_port(default:80);

init_cookiejar();
foreach d (cgi_dirs())
{
 set_http_cookie(name: "lang", value: "%2E%00%22");
 r = http_send_recv3(method: "GET", item:d+"/ikonboard.cgi", port:port);
 if (isnull(r)) exit(0);
 if (ereg(pattern:"^HTTP/[0-9]\.[0-9] 200 ", string: r[0]))
 {
  if(egrep(pattern:".*EOF.*\(eval 6\) line 1", string:r[2]))
  	{
	security_hole(port);
	exit(0);
	}
 }
}
