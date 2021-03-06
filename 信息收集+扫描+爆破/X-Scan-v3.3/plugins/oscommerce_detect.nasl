#
# (C) Tenable Network Security, Inc.
#


include("compat.inc");


if (description) 
{
  script_id(42349);
  script_version("$Revision: 1.1 $");

  script_name(english:"osCommerce Detection");
  script_summary(english:"Looks for traces of osCommerce");
 
  script_set_attribute(
    attribute:"synopsis",
    value:"The remote web server hosts a PHP-based e-commerce application."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"The remote host is hosting osCommerce, an open source e-commerce
application written in PHP."
  );
  script_set_attribute(
    attribute:"see_also", 
    value:"http://www.oscommerce.com/"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"n/a"
  );
  script_set_attribute(
    attribute:"risk_factor", 
    value:"None"
  );
  script_set_attribute(
    attribute:"plugin_publication_date", 
    value:"2009/11/03"
  );
  script_end_attributes();
 
  script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security, Inc.");

  script_category(ACT_GATHER_INFO);
  script_family(english:"CGI abuses");
 
  script_dependencies("http_version.nasl");
  script_exclude_keys("Settings/disable_cgi_scanning");
  script_require_ports("Services/www", 80);

  exit(0);
}


include("global_settings.inc");
include("misc_func.inc");
include("http.inc");
include("webapp_func.inc");


port = get_http_port(default:80);
if (!can_host_php(port:port)) exit(0, "The web server on port "+port+" does not support PHP scripts.");


# Loop through various directories.
if (thorough_tests) dirs = list_uniq(make_list("/oscommerce", "/catalog", "/store", "/shop", cgi_dirs()));
else dirs = make_list(cgi_dirs());

foreach dir (dirs)
{
  # Grab the initial page.
  url = string(dir, "/");

  res = http_get_cache(item:url, port:port);
  if (isnull(res)) exit(1, "The web server on port "+port+" failed to respond.");

  # If it's osCommerce...
  if (
    '</a><br>Powered by <a href="http://www.oscommerce.com"' >< res ||
    '</a><br />Powered by <a href="http://www.oscommerce.com"' >< res ||
    'alt="osCommerce" title=" osCommerce " width="' >< res ||
    '<meta name="generator" content="osCommerce' >< res ||
    ' [osC_Services_debug]</li>' >< res ||
    '<input type="hidden" name="osCsid" value="' >< res ||
    'shipping_cart.php?osCsid=' >< res ||
    egrep(pattern:'^Set-Cookie: .*osCsid=[a-fA-F0-9]+(;|$)', string:res)
  )
  {
    version = NULL;

    # Try the admin page.
    if (isnull(version))
    {
      url2 = string(dir, "/admin/login.php");

      res2 = http_send_recv3(port:port, method:"GET", item:url2);
      if (!isnull(res2))
      {
        # eg,
        #   <span class="poweredBy">Powered By</span><span class="osCommerce">osCommerce Online Merchant v3.0a5</span></a></span></div>

        pat = '(alt=" *|title=" *|class="osCommerce">)osCommerce Online Merchant v([0-9][^"<]+) *["<]';
        matches = egrep(pattern:pat, string:res2[2]);
        if (matches)
        {
          foreach match (split(matches, keep:FALSE))
          {
            item = eregmatch(pattern:pat, string:match);
            if (!isnull(item))
            {
              version = item[2];
              break;
            }
          }
        }
      }
    }

    installs = add_install(
      appname  : "oscommerce",
      installs : installs,
      port     : port,
      dir      : dir,
      ver      : version
    );

    # Scan for multiple installations only if "Thorough Tests" is checked.
    if (!thorough_tests) break;
  }
}
if (isnull(installs)) exit(1, "osCommerce was not detected on the web server on port "+port+".");


# Report findings.
if (report_verbosity > 0)
{
  report = get_install_report(
    port         : port,
    installs     : installs,
    display_name : "osCommerce"
  );
  security_note(port:port, extra:report);
}
else security_note(port);
