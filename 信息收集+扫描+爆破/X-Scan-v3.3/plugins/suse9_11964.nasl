
#
# (C) Tenable Network Security
#
# The text description of this plugin is (C) Novell, Inc.
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);

if(description)
{
 script_id(41165);
 script_version("$Revision: 1.1 $");
 script_name(english: "SuSE9 Security Update:  Security update for perl (11964)");
 script_set_attribute(attribute: "synopsis", value: 
"The remote SuSE9 system is missing the security patch 11964");
 script_set_attribute(attribute: "description", value: 'Specially crafted regular expressions could lead to a buffer
overflow in perl\'s regular expressions engine. Scripts
processing data from untrusted sources could therefore
potentially be exploited by attackers to execute arbitrary
code.
Depending on the purpose of the scripts, the vulnerability
can be exploited remotely or locally.
The vulnerability has been tracked by CVE-2007-5116.
');
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P");
script_set_attribute(attribute: "solution", value: "Install the security patch 11964");
script_end_attributes();

script_cve_id("CVE-2007-5116");
script_summary(english: "Check for the security advisory #11964");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 script_family(english: "SuSE Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/SuSE/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/SuSE/rpm-list") ) exit(1, "Could not gather the list of packages");
if ( rpm_check( reference:"perl-5.8.3-32.12", release:"SUSE9", cpu: "i586") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
# END OF TEST
exit(0,"Host is not affected");
