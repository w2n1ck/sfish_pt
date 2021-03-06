
#
# (C) Tenable Network Security, Inc.
#
# This plugin text was extracted from Fedora Security Advisory 2009-0483
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);
if(description)
{
 script_id(37860);
 script_version ("$Revision: 1.2 $");
script_name(english: "Fedora 10 2009-0483: xine-lib");
 script_set_attribute(attribute: "synopsis", value: 
"The remote host is missing the patch for the advisory FEDORA-2009-0483 (xine-lib)");
 script_set_attribute(attribute: "description", value: "This package contains the Xine library. Xine is a free multimedia player.
It can play back various media. It also decodes multimedia files from local
disk drives, and displays multimedia streamed over the Internet. It
interprets many of the most common multimedia formats available - and some
of the most uncommon formats, too.  --with/--without rpmbuild options
(some default values depend on target distribution): aalib, caca, directfb,
imagemagick, freetype, antialiasing (with freetype), pulseaudio, xcb.

-
Update Information:

This updates xine-lib to the upstream 1.1.16 release. This fixes several bugs,
including the security issues CVE-2008-5234 vector 1, CVE-2008-5236,
CVE-2008-5237, CVE-2008-5239, CVE-2008-5240 vectors 3 & 4 and CVE-2008-5243. Se
e
[9]http://sourceforge.net/project/shownotes.php?release_id=652075&group_id=9655
for
the full list of changes.    In addition, the Fedora xine-lib package now
includes the demuxers for the MPEG container format, which are not patent-
encumbered. (The decoders for actual MPEG video and audio data are still
excluded due to software patents.)
");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:M/Au:N/C:C/I:C/A:C");
script_set_attribute(attribute: "solution", value: "Get the newest Fedora Updates");
script_end_attributes();

 script_cve_id("CVE-2008-5236", "CVE-2008-5243");
script_summary(english: "Check for the version of the xine-lib package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security, Inc.");
 script_family(english: "Fedora Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/RedHat/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( rpm_check( reference:"xine-lib-1.1.16-1.fc10", release:"FC10") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
exit(0, "Host is not affected");
