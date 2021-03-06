#
# (C) Tenable Network Security
#
#
# The text of this plugin is (C) Red Hat Inc.

include("compat.inc");
if ( ! defined_func("bn_random") ) exit(0);
if(description)
{
 script_id(12378);
 script_version ("$Revision: 1.7 $");
 script_cve_id("CVE-2003-0150", "CVE-2003-0073");

 script_name(english:"RHSA-2003-094: mysql");
 script_set_attribute(attribute:"synopsis", value:
"The remote host is missing the patch for the advisory RHSA-2003-094");
 
 script_set_attribute(attribute:"description", value:
'
  Updated packages are available that fix both a double-free security
  vulnerability and a remote root exploit security vulnerability found in the
  MySQL server.

  [Updated 11 Aug 2003]
  Updated mysqlclient9 packages are now included. These were previously
  missing from this erratum.

  MySQL is a multi-user, multi-threaded SQL database server.

  A double-free vulnerability in mysqld, for MySQL before version 3.23.55,
  allows attackers with MySQL access to cause a denial of service (crash) by
  creating a carefully crafted client application.

  A remote root exploit vulnerability in mysqld, for MySQL before version
  3.23.56, allows MySQL users to gain root privileges by overwriting
  configuration files.

  Previous versions of the MySQL packages do not contain the thread safe
  client library (libmysqlclient_r).

  All users of MySQL are advised to upgrade to these errata packages
  containing MySQL 3.23.56.
');
 script_set_attribute(attribute:"see_also", value: "http://rhn.redhat.com/errata/RHSA-2003-094.html");
 script_set_attribute(attribute:"solution", value: "Get the newest RedHat updates.");
 script_set_attribute(attribute:"cvss_vector", value:"CVSS2#AV:N/AC:L/Au:S/C:C/I:C/A:C");
 script_end_attributes();
 
 script_summary(english: "Check for the version of the mysql packages"); 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2004-2009 Tenable Network Security");
 script_family(english: "Red Hat Local Security Checks"); 
 script_dependencies("ssh_get_info.nasl");
 
 script_require_keys("Host/RedHat/rpm-list");
 exit(0);
}

include("rpm.inc");
if ( rpm_check( reference:"mysql-3.23.56-1.72", release:"RHEL2.1") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"mysql-devel-3.23.56-1.72", release:"RHEL2.1") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"mysql-server-3.23.56-1.72", release:"RHEL2.1") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"mysqlclient9-3.23.22-8", release:"RHEL2.1") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}

exit(0, "Host is not affected");
