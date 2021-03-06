#
# (C) Tenable Network Security, Inc.
#


include("compat.inc");

if(description)
{
 script_id(17151);
 script_bugtraq_id(5566, 5567);
 script_cve_id("CVE-2002-1451");
 script_xref(name:"OSVDB", value:"10466");
 script_xref(name:"OSVDB", value:"10467");

 script_version("$Revision: 1.8 $");
 
 name["english"] = "Blazix Trailing Character JSP Source Disclosure";
 script_name(english:name["english"]);
 
 script_set_attribute(attribute:"synopsis", value:
"The remote web server is affected by an information disclosure
vulnerability." );
 script_set_attribute(attribute:"description", value:
"The remote host is running the Blazix web server, a web server written
in Java. 

The installed version of Blazix discloses the source code of its JSP
pages by requesting the pages while appending a plus sign or a
backslash to its name.  An attacker may use this flaw to get the
source code of your CGIs and possibly obtain passwords and other
relevant information about this host." );
 script_set_attribute(attribute:"see_also", value:"http://archives.neohapsis.com/archives/bugtraq/2002-08/0259.html" );
 script_set_attribute(attribute:"solution", value:
"Upgrade to Blazix 1.2.2 or newer." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:P/I:N/A:N" );

script_end_attributes();

 
 summary["english"] = "Attempts to read the source of a jsp page";
 
 script_summary(english:summary["english"]);
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2005-2009 Tenable Network Security, Inc.");
 family["english"] = "CGI abuses";
 script_family(english:family["english"]);
 script_dependencie("find_service1.nasl", "http_version.nasl");
 script_exclude_keys("Settings/disable_cgi_scanning");
 script_require_ports("Services/www", 80);
 exit(0);
}

# Check starts here

include("global_settings.inc");
include("misc_func.inc");
include("http.inc");

port = get_http_port(default:80);


function check(file)
{
 local_var r, res;

 r = http_send_recv3(method:"GET", item:file, port:port);
 res = strcat(r[0], r[1], '\r\n', r[2]);
 if("<%" >< res) return 1;
 return 0;
}

banner = get_http_banner(port:port);
if ("Server: Blazix Java Server" >!< banner ) exit(0);

if(get_port_state(port))
{
 files = get_kb_list(string("www/", port, "/content/extensions/jsp"));
 if(isnull(files))files = make_list("/index.jsp");
 n = 0;
 foreach file (files)
  {
  if(check(file:file) == 0)
   {
   file = str_replace(string:file, find:".jsp", replace:".jsp+");
   if(check(file:file)) { security_warning(port); exit(0); }
  }
  n++;
  if(n > 10)exit(0);
 }
}
