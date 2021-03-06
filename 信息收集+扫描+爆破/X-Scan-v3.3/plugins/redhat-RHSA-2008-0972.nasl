
#
# (C) Tenable Network Security
#
# The text of this plugin is (C) Red Hat Inc.
#

include("compat.inc");
if ( ! defined_func("bn_random") ) exit(0);

if(description)
{
 script_id(34841);
 script_version ("$Revision: 1.5 $");
 script_name(english: "RHSA-2008-0972: kernel");
 script_set_attribute(attribute: "synopsis", value: 
"The remote host is missing the patch for the advisory RHSA-2008-0972");
 script_set_attribute(attribute: "description", value: '
  Updated kernel packages that resolve several security issues and fix
  various bugs are now available for Red Hat Enterprise Linux 4.

  This update has been rated as having important security impact by the Red
  Hat Security Response Team.

  The kernel packages contain the Linux kernel, the core of any Linux
  operating system.

  * a flaw was found in the Linux kernel\'s Direct-IO implementation. This
  could have allowed a local unprivileged user to cause a denial of service.
  (CVE-2007-6716, Important)

  * when running ptrace in 31-bit mode on an IBM S/390 or IBM System z
  kernel, a local unprivileged user could cause a denial of service by
  reading from or writing into a padding area in the user_regs_struct32
  structure. (CVE-2008-1514, Important)

  * the do_truncate() and generic_file_splice_write() functions did not clear
  the setuid and setgid bits. This could have allowed a local unprivileged
  user to obtain access to privileged information. (CVE-2008-4210, Important)

  * Tobias Klein reported a missing check in the Linux kernel\'s Open Sound
  System (OSS) implementation. This deficiency could have led to an
  information leak. (CVE-2008-3272, Moderate)

  * a potential denial of service attack was discovered in the Linux kernel\'s
  PWC USB video driver. A local unprivileged user could have used this flaw
  to bring the kernel USB subsystem into the busy-waiting state.
  (CVE-2007-5093, Low)

  * the ext2 and ext3 file systems code failed to properly handle corrupted
  data structures, leading to a possible local denial of service issue when
  read or write operations were performed. (CVE-2008-3528, Low)

  In addition, these updated packages fix the following bugs:

  * when using the CIFS "forcedirectio" option, appending to an open file on
  a CIFS share resulted in that file being overwritten with the data to be
  appended.

  * a kernel panic occurred when a device with PCI ID 8086:10c8 was present
  on a system with a loaded ixgbe driver.

  * due to an aacraid driver regression, the kernel failed to boot when trying
  to load the aacraid driver and printed the following error message:
  "aac_srb: aac_fib_send failed with status: 8195".

  * due to an mpt driver regression, when RAID 1 was configured on Primergy
  systems with an LSI SCSI IME 53C1020/1030 controller, the kernel panicked
  during boot.

  * the mpt driver produced a large number of extraneous debugging messages
  when performing a "Host reset" operation.

  * due to a regression in the sym driver, the kernel panicked when a SCSI
  hot swap was performed using MCP18 hardware.

  * all cores on a multi-core system now scale their frequencies in
  accordance with the policy set by the system\'s CPU frequency governor.

  * the netdump subsystem suffered from several stability issues. These are
  addressed in this updated kernel.

  * under certain conditions, the ext3 file system reported a negative count
  of used blocks.

  * reading /proc/self/mem incorrectly returned "Invalid argument" instead of
  "input/output error" due to a regression.

  * under certain conditions, the kernel panicked when a USB device was
  removed while the system was busy accessing the device.

  * a race condition in the kernel could have led to a kernel crash during
  the creation of a new process.

  All Red Hat Enterprise Linux 4 Users should upgrade to these updated
  packages, which contain backported patches to correct these issues.


');
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:M/Au:N/C:N/I:N/A:C");
script_set_attribute(attribute: "see_also", value: "http://rhn.redhat.com/errata/RHSA-2008-0972.html");
script_set_attribute(attribute: "solution", value: "Get the newest RedHat Updates.");
script_end_attributes();

script_cve_id("CVE-2007-5093", "CVE-2007-6716", "CVE-2008-1514", "CVE-2008-3272", "CVE-2008-3528", "CVE-2008-4210");
script_summary(english: "Check for the version of the kernel packages");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 script_family(english: "Red Hat Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 
 script_require_keys("Host/RedHat/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/RedHat/rpm-list") ) exit(1, "Could not get the list of packages");

if ( rpm_check( reference:"kernel-2.6.9-78.0.8.EL", release:'RHEL4') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"kernel-devel-2.6.9-78.0.8.EL", release:'RHEL4') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"kernel-doc-2.6.9-78.0.8.EL", release:'RHEL4') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"kernel-hugemem-2.6.9-78.0.8.EL", release:'RHEL4') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"kernel-hugemem-devel-2.6.9-78.0.8.EL", release:'RHEL4') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"kernel-smp-2.6.9-78.0.8.EL", release:'RHEL4') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"kernel-smp-devel-2.6.9-78.0.8.EL", release:'RHEL4') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"kernel-xenU-2.6.9-78.0.8.EL", release:'RHEL4') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"kernel-xenU-devel-2.6.9-78.0.8.EL", release:'RHEL4') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
exit(0, "Host if not affected");
