# This script was automatically generated from 
#  http://www.gentoo.org/security/en/glsa/glsa-200801-12.xml
# It is released under the Nessus Script Licence.
# The messages are release under the Creative Commons - Attribution /
# Share Alike license. See http://creativecommons.org/licenses/by-sa/2.0/
#
# Avisory is copyright 2001-2006 Gentoo Foundation, Inc.
# GLSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description)
{
 script_id(30117);
 script_version("$Revision: 1.5 $");
 script_xref(name: "GLSA", value: "200801-12");
 script_cve_id("CVE-2008-0225", "CVE-2008-0238");

 script_set_attribute(attribute:'synopsis', value: 'The remote host is missing the GLSA-200801-12 security update.');
 script_set_attribute(attribute:'description', value: 'The remote host is affected by the vulnerability described in GLSA-200801-12
(xine-lib: User-assisted execution of arbitrary code)


    Luigi Auriemma reported that xine-lib does not properly check
    boundaries when processing SDP attributes of RTSP streams, leading to
    heap-based buffer overflows.
  
Impact

    An attacker could entice a user to play specially crafted RTSP video
    streams with a player using xine-lib, potentially resulting in the
    execution of arbitrary code with the privileges of the user running the
    player.
  
Workaround

    There is no known workaround at this time.
  
');
script_set_attribute(attribute:'solution', value: '
    All xine-lib users should upgrade to the latest version:
    # emerge --sync
    # emerge --ask --oneshot --verbose ">=media-libs/xine-lib-1.1.9.1"
  ');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P');
script_set_attribute(attribute: 'see_also', value: 'http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-0225');
script_set_attribute(attribute: 'see_also', value: 'http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-0238');

script_set_attribute(attribute: 'see_also', value: 'http://www.gentoo.org/security/en/glsa/glsa-200801-12.xml');

script_end_attributes();

 script_copyright(english: "(C) 2009 Tenable Network Security, Inc.");
 script_name(english: '[GLSA-200801-12] xine-lib: User-assisted execution of arbitrary code');
 script_category(ACT_GATHER_INFO);
 script_family(english: "Gentoo Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys('Host/Gentoo/qpkg-list');
 script_summary(english: 'xine-lib: User-assisted execution of arbitrary code');
 exit(0);
}

include('qpkg.inc');

if ( ! get_kb_item('Host/Gentoo/qpkg-list') ) exit(1, 'No list of packages');
if (qpkg_check(package: "media-libs/xine-lib", unaffected: make_list("ge 1.1.9.1"), vulnerable: make_list("lt 1.1.9.1")
)) { security_hole(0); exit(0); }
exit(0, "Host is not affected");
