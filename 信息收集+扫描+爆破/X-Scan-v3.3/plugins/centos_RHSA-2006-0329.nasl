#
# (C) Tenable Network Security, Inc.
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);

if ( description )
{
 script_id(21898);
 script_version("$Revision: 1.8 $");
 script_name(english:"CentOS : RHSA-2006-0329");
 script_set_attribute(attribute: "synopsis", value: "The remote host is missing a security update.");
 script_set_attribute(attribute: "description", value: 
"The remote CentOS system is missing a security update which has been 
documented in Red Hat advisory RHSA-2006-0329.");
 script_set_attribute(attribute: "see_also", value:
"https://rhn.redhat.com/errata/RHSA-2006-0329.html");
 script_set_attribute(attribute: "solution", value:
"Upgrade to the newest packages by doing :

  yum update");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:C/I:C/A:C");
script_end_attributes();

script_cve_id("CVE-2006-0748","CVE-2006-0749","CVE-2006-0884","CVE-2006-1724","CVE-2006-1727","CVE-2006-1728","CVE-2006-1729","CVE-2006-1730","CVE-2006-1731","CVE-2006-1732","CVE-2006-1733","CVE-2006-1734","CVE-2006-1735","CVE-2006-1737","CVE-2006-1738","CVE-2006-1739","CVE-2006-1740","CVE-2006-1741","CVE-2006-1742","CVE-2006-1790");

 script_summary(english:"Checks for missing updates on the remote CentOS system");
 script_category(ACT_GATHER_INFO);
 script_copyright(english:"This script is (C) 2009 Tenable Network Security, Inc.");
 script_family(english:"CentOS Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/CentOS/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/CentOS/rpm-list") ) exit(1, "Could not obtain the list of packages");

if ( rpm_check(reference:"mozilla-1.7.13-1.4.1.centos4", release:"CentOS-4", cpu:"ia64") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-chat-1.7.13-1.4.1.centos4", release:"CentOS-4", cpu:"ia64") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-devel-1.7.13-1.4.1.centos4", release:"CentOS-4", cpu:"ia64") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-dom-inspector-1.7.13-1.4.1.centos4", release:"CentOS-4", cpu:"ia64") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-js-debugger-1.7.13-1.4.1.centos4", release:"CentOS-4", cpu:"ia64") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-mail-1.7.13-1.4.1.centos4", release:"CentOS-4", cpu:"ia64") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-nspr-1.7.13-1.4.1.centos4", release:"CentOS-4", cpu:"ia64") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-nspr-devel-1.7.13-1.4.1.centos4", release:"CentOS-4", cpu:"ia64") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-nss-1.7.13-1.4.1.centos4", release:"CentOS-4", cpu:"ia64") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-nss-devel-1.7.13-1.4.1.centos4", release:"CentOS-4", cpu:"ia64") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-1.7.13-1.1.3.1.centos3", release:"CentOS-3", cpu:"ia64") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-chat-1.7.13-1.1.3.1.centos3", release:"CentOS-3", cpu:"ia64") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-devel-1.7.13-1.1.3.1.centos3", release:"CentOS-3", cpu:"ia64") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-dom-inspector-1.7.13-1.1.3.1.centos3", release:"CentOS-3", cpu:"ia64") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-js-debugger-1.7.13-1.1.3.1.centos3", release:"CentOS-3", cpu:"ia64") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-mail-1.7.13-1.1.3.1.centos3", release:"CentOS-3", cpu:"ia64") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-nspr-1.7.13-1.1.3.1.centos3", release:"CentOS-3", cpu:"ia64") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-nspr-devel-1.7.13-1.1.3.1.centos3", release:"CentOS-3", cpu:"ia64") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-nss-1.7.13-1.1.3.1.centos3", release:"CentOS-3", cpu:"ia64") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-nss-devel-1.7.13-1.1.3.1.centos3", release:"CentOS-3", cpu:"ia64") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"devhelp-0.9.2-2.4.8", release:"CentOS-4", cpu:"i386") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"devhelp-devel-0.9.2-2.4.8", release:"CentOS-4", cpu:"i386") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-1.7.13-1.4.1.centos4", release:"CentOS-4", cpu:"i386") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-chat-1.7.13-1.4.1.centos4", release:"CentOS-4", cpu:"i386") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-devel-1.7.13-1.4.1.centos4", release:"CentOS-4", cpu:"i386") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-dom-inspector-1.7.13-1.4.1.centos4", release:"CentOS-4", cpu:"i386") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-js-debugger-1.7.13-1.4.1.centos4", release:"CentOS-4", cpu:"i386") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-mail-1.7.13-1.4.1.centos4", release:"CentOS-4", cpu:"i386") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-nspr-1.7.13-1.4.1.centos4", release:"CentOS-4", cpu:"i386") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-nspr-devel-1.7.13-1.4.1.centos4", release:"CentOS-4", cpu:"i386") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-nss-1.7.13-1.4.1.centos4", release:"CentOS-4", cpu:"i386") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-nss-devel-1.7.13-1.4.1.centos4", release:"CentOS-4", cpu:"i386") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"devhelp-0.9.2-2.4.8", release:"CentOS-4", cpu:"x86_64") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"devhelp-devel-0.9.2-2.4.8", release:"CentOS-4", cpu:"x86_64") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-1.7.13-1.4.1.centos4", release:"CentOS-4", cpu:"x86_64") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-chat-1.7.13-1.4.1.centos4", release:"CentOS-4", cpu:"x86_64") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-devel-1.7.13-1.4.1.centos4", release:"CentOS-4", cpu:"x86_64") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-dom-inspector-1.7.13-1.4.1.centos4", release:"CentOS-4", cpu:"x86_64") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-js-debugger-1.7.13-1.4.1.centos4", release:"CentOS-4", cpu:"x86_64") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-mail-1.7.13-1.4.1.centos4", release:"CentOS-4", cpu:"x86_64") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-nspr-1.7.13-1.4.1.centos4", release:"CentOS-4", cpu:"x86_64") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-nspr-devel-1.7.13-1.4.1.centos4", release:"CentOS-4", cpu:"x86_64") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-nss-1.7.13-1.4.1.centos4", release:"CentOS-4", cpu:"x86_64") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-nss-devel-1.7.13-1.4.1.centos4", release:"CentOS-4", cpu:"x86_64") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-1.7.13-1.1.3.1.centos3", release:"CentOS-3", cpu:"i386") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-chat-1.7.13-1.1.3.1.centos3", release:"CentOS-3", cpu:"i386") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-devel-1.7.13-1.1.3.1.centos3", release:"CentOS-3", cpu:"i386") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-dom-inspector-1.7.13-1.1.3.1.centos3", release:"CentOS-3", cpu:"i386") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-js-debugger-1.7.13-1.1.3.1.centos3", release:"CentOS-3", cpu:"i386") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-mail-1.7.13-1.1.3.1.centos3", release:"CentOS-3", cpu:"i386") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-nspr-1.7.13-1.1.3.1.centos3", release:"CentOS-3", cpu:"i386") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-nspr-devel-1.7.13-1.1.3.1.centos3", release:"CentOS-3", cpu:"i386") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-nss-1.7.13-1.1.3.1.centos3", release:"CentOS-3", cpu:"i386") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-nss-devel-1.7.13-1.1.3.1.centos3", release:"CentOS-3", cpu:"i386") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-1.7.13-1.1.3.1.centos3", release:"CentOS-3", cpu:"x86_64") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-chat-1.7.13-1.1.3.1.centos3", release:"CentOS-3", cpu:"x86_64") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-devel-1.7.13-1.1.3.1.centos3", release:"CentOS-3", cpu:"x86_64") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-dom-inspector-1.7.13-1.1.3.1.centos3", release:"CentOS-3", cpu:"x86_64") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-js-debugger-1.7.13-1.1.3.1.centos3", release:"CentOS-3", cpu:"x86_64") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-mail-1.7.13-1.1.3.1.centos3", release:"CentOS-3", cpu:"x86_64") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-nspr-1.7.13-1.1.3.1.centos3", release:"CentOS-3", cpu:"x86_64") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-nspr-devel-1.7.13-1.1.3.1.centos3", release:"CentOS-3", cpu:"x86_64") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-nss-1.7.13-1.1.3.1.centos3", release:"CentOS-3", cpu:"x86_64") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mozilla-nss-devel-1.7.13-1.1.3.1.centos3", release:"CentOS-3", cpu:"x86_64") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
exit(0, "Host is not affected");
