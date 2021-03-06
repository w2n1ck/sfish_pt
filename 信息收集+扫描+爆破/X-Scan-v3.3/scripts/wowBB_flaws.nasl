#
# This script was written by David Maciejak <david dot maciejak at kyxar dot fr>
# 
# Ref: Positive Technologies - www.maxpatrol.com
# This script is released under the GNU GPLv2
#

if(description)
{
  script_id(15557);
  script_bugtraq_id(11429);
  script_version("$Revision: 1.2 $");
  script_name(english:"wowBB multiple flaws");
 
 desc["english"] = "
The remote host is running wowBB, a web based forum  written in PHP.

This version is vulnerable to XSS and SQL injection attacks. A malicious 
user can access users cookies including authentication cookies and inject SQL
commands to be executed on the underlying database.

Solution: Upgrade to the latest version of this software
Risk factor : High";

  script_description(english:desc["english"]);

  script_summary(english:"Checks wowBB version");
  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2004 David Maciejak");
  script_family(english:"CGI abuses : XSS");
  script_require_ports("Services/www", 80);
  script_dependencie("http_version.nasl");
  exit(0);
}

# the code!

include("http_func.inc");
include("http_keepalive.inc");

function check(req)
{
  buf = http_get(item:string(req,"/index.php"), port:port);
  r = http_keepalive_send_recv(port:port, data:buf, bodyonly:1);
  if( r == NULL )exit(0);
  if(egrep(pattern:"WowBB Forums</TITLE>.*TITLE=.WowBB Forum Software.*>WowBB (0\..*|1\.([0-5][0-9]|60|61))</A>", string:r))
  {
 	http_close_socket(soc);
 	security_hole(port);
	exit(0);
  }
}

port = get_http_port(default:80);
if ( ! port ) exit(0);
if(!get_port_state(port)) exit(0);
if(!can_host_php(port:port))exit(0);

soc = http_open_socket(port);
if(soc)
{
  foreach dir (cgi_dirs())
  {
    check(req:dir);
  }
  http_close_socket(soc);
}
exit(0);
