# This script was automatically generated from 
#  http://www.gentoo.org/security/en/glsa/glsa-200412-08.xml
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
 script_id(15955);
 script_version("$Revision: 1.7 $");
 script_xref(name: "GLSA", value: "200412-08");
 script_cve_id("CVE-2004-0946", "CVE-2004-1014");

 script_set_attribute(attribute:'synopsis', value: 'The remote host is missing the GLSA-200412-08 security update.');
 script_set_attribute(attribute:'description', value: 'The remote host is affected by the vulnerability described in GLSA-200412-08
(nfs-utils: Multiple remote vulnerabilities)


    Arjan van de Ven has discovered a buffer overflow on 64-bit
    architectures in \'rquota_server.c\' of nfs-utils (CAN-2004-0946). A
    remotely exploitable flaw on all architectures also exists in the
    \'statd.c\' file of nfs-utils (CAN-2004-1014), which can be triggered by
    a mishandled SIGPIPE.
  
Impact

    A remote attacker could potentially cause a Denial of Service, or
    even execute arbitrary code (64-bit architectures only) on a remote NFS
    server.
  
Workaround

    There is no known workaround at this time.
  
');
script_set_attribute(attribute:'solution', value: '
    All nfs-utils users should upgarde to the latest version:
    # emerge --sync
    # emerge --ask --oneshot --verbose ">=net-fs/nfs-utils-1.0.6-r6"
  ');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:L/Au:N/C:C/I:C/A:C');
script_set_attribute(attribute: 'see_also', value: 'http://cve.mitre.org/cgi-bin/cvename.cgi?name=CAN-2004-0946');
script_set_attribute(attribute: 'see_also', value: 'http://cve.mitre.org/cgi-bin/cvename.cgi?name=CAN-2004-1014');

script_set_attribute(attribute: 'see_also', value: 'http://www.gentoo.org/security/en/glsa/glsa-200412-08.xml');

script_end_attributes();

 script_copyright(english: "(C) 2009 Tenable Network Security, Inc.");
 script_name(english: '[GLSA-200412-08] nfs-utils: Multiple remote vulnerabilities');
 script_category(ACT_GATHER_INFO);
 script_family(english: "Gentoo Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys('Host/Gentoo/qpkg-list');
 script_summary(english: 'nfs-utils: Multiple remote vulnerabilities');
 exit(0);
}

include('qpkg.inc');

if ( ! get_kb_item('Host/Gentoo/qpkg-list') ) exit(1, 'No list of packages');
if (qpkg_check(package: "net-fs/nfs-utils", unaffected: make_list("ge 1.0.6-r6"), vulnerable: make_list("lt 1.0.6-r6")
)) { security_hole(0); exit(0); }
exit(0, "Host is not affected");
