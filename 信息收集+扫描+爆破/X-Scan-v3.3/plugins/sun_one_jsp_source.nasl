#
# (C) Tenable Network Security
#

# Ref:
# From: "SPI Labs" <spilabs@spidynamics.com>
# To: <bugtraq@securityfocus.com>
# Subject: Multiple Vulnerabilities in Sun-One Application Server
# Date: Tue, 27 May 2003 18:48:04 -0400  


include("compat.inc");

if(description)
{
 script_id(11658);
 script_version("$Revision: 1.13 $");
 script_cve_id("CVE-2003-0411");
 script_bugtraq_id(7709);
 script_xref(name:"OSVDB", value:"11709");
 
 script_name(english:"Sun ONE Application Server Upper Case Request JSP Source Disclosure");
 
 script_set_attribute(attribute:"synopsis", value:
"The remote web server is affected by an information disclosure
vulnerability." );
 script_set_attribute(attribute:"description", value:
"It is possible to make the remote web server disclose the source code
of its JSP pages by requesting the pages with a different case (ie:
filename.JSP instead of filename.jsp). 

An attacker may use this flaw to get the source code of your CGIs and
possibly obtain passwords and other relevant information about this
host." );
 script_set_attribute(attribute:"solution", value:
"Unknown at this time." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:P/I:N/A:N" );
script_end_attributes();

 
 script_summary(english:"Attempts to read the source of a jsp page");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2003-2009 Tenable Network Security, Inc.");
 script_family(english:"CGI abuses");
 script_dependencie("find_service1.nasl", "http_version.nasl");
 script_require_ports("Services/www", 80);
 exit(0);
}

# Check starts here

include("global_settings.inc");
include("misc_func.inc");
include("http.inc");

function check(file)
{
 local_var	r;
 global_var	port;
 r = http_send_recv3(method: "GET", item:file, port:port);
 if (isnull(r)) exit(0);
 if("<%" >< r[2]) return 1;
 return 0;
}

port = get_http_port(default:80);

if(get_port_state(port))
{
 files = get_kb_list(string("www/", port, "/content/extensions/jsp"));
 if(isnull(files))files = make_list("/index.jsp");
 n = 0;
 foreach file (files)
  {
  if(check(file:file) == 0)
   {
   file2 = str_replace(string:file, find:".jsp", replace:".JSP");
   if(check(file:file2))
   {
    if (report_verbosity >= 1)
    {
      txt = strcat('\nFor example :\n', build_url(port: port, qs: file), '\n',
      	  build_url(port: port, qs: file2), '\n');
      security_warning(port, extra: txt);
    }
    else
    security_warning(port);
    exit(0);
    }
  }
  n ++;
  if(n > 20)exit(0);
 }
}
