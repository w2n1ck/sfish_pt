
#
# (C) Tenable Network Security
#
# The text description of this plugin is (C) Novell, Inc.
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);

if(description)
{
 script_id(29432);
 script_version ("$Revision: 1.6 $");
 script_name(english: "SuSE Security Update:  Security update for flash-player (flash-player-2065)");
 script_set_attribute(attribute: "synopsis", value: 
"The remote SuSE system is missing the security patch flash-player-2065");
 script_set_attribute(attribute: "description", value: "Multiple input validation errors have been identified in
Flash Player that could lead to the potential execution of
arbitrary code. These vulnerabilities could be accessed
through content delivered from a remote location via the
user's web browser, email client, or other applications
that include or reference the Flash Player.
(CVE-2006-3311, CVE-2006-3587, CVE-2006-3588)

These updates include changes to prevent circumvention of
the 'allowScriptAccess' option. (CVE-2006-4640)
");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:M/Au:N/C:P/I:P/A:P");
script_set_attribute(attribute: "solution", value: "Install the security patch flash-player-2065");
script_end_attributes();

script_cve_id("CVE-2006-3311", "CVE-2006-3587", "CVE-2006-3588", "CVE-2006-4640");
script_summary(english: "Check for the flash-player-2065 package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 script_family(english: "SuSE Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/SuSE/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/SuSE/rpm-list") ) exit(1, "Could not gather the list of packages");

if ( rpm_check( reference:"flash-player-7.0.68.0-1.2", release:"SLED10") )
{
	security_warning(port:0, extra:rpm_report_get());
	exit(0);
}
# END OF TEST
exit(0,"Host is not affected");
