# This script was automatically generated from the 603-1 Ubuntu Security Notice
# It is released under the Nessus Script Licence.
# Ubuntu Security Notices are (C) 2005 Canonical, Inc.
# USN2nasl Convertor is (C) 2005 Tenable Network Security, Inc.
# See http://www.ubuntulinux.org/usn/
# Ubuntu(R) is a registered trademark of Canonical, Inc.

if (! defined_func("bn_random")) exit(0);
include('compat.inc');

if (description) {
script_id(32028);
script_version("$Revision: 1.3 $");
script_copyright("Ubuntu Security Notice (C) 2009 Canonical, Inc. / NASL script (C) 2009 Tenable Network Security, Inc.");
script_category(ACT_GATHER_INFO);
script_family(english: "Ubuntu Local Security Checks");
script_dependencies("ssh_get_info.nasl");
script_require_keys("Host/Ubuntu", "Host/Ubuntu/release", "Host/Debian/dpkg-l");

script_xref(name: "USN", value: "603-1");
script_summary(english:"poppler vulnerability");
script_name(english:"USN603-1 : poppler vulnerability");
script_set_attribute(attribute:'synopsis', value: 'These remote packages are missing security patches :
- libpoppler-dev 
- libpoppler-glib-dev 
- libpoppler-glib2 
- libpoppler-qt-dev 
- libpoppler-qt2 
- libpoppler-qt4-2 
- libpoppler-qt4-dev 
- libpoppler1 
- libpoppler1-glib 
- libpoppler1-qt 
- libpoppler1-qt4 
- libpoppler2 
- poppler-utils 
');
script_set_attribute(attribute:'description', value: 'It was discovered that the poppler PDF library did not correctly handle
certain malformed embedded fonts.  If a user or an automated system were
tricked into opening a malicious PDF, a remote attacker could execute
arbitrary code with user privileges.');
script_set_attribute(attribute:'solution', value: 'Upgrade to : 
- libpoppler-dev-0.6-0ubuntu2.2 (Ubuntu 7.10)
- libpoppler-glib-dev-0.6-0ubuntu2.2 (Ubuntu 7.10)
- libpoppler-glib2-0.6-0ubuntu2.2 (Ubuntu 7.10)
- libpoppler-qt-dev-0.6-0ubuntu2.2 (Ubuntu 7.10)
- libpoppler-qt2-0.6-0ubuntu2.2 (Ubuntu 7.10)
- libpoppler-qt4-2-0.6-0ubuntu2.2 (Ubuntu 7.10)
- libpoppler-qt4-dev-0.6-0ubuntu2.2 (Ubuntu 7.10)
- libpoppler1-0.5.4-0ubuntu8.3 (Ubuntu 7.04)
- libpoppler1-glib-0.5.4-0ubuntu8.3 (Ubuntu 7.04)
- libpoppler1-qt-0.5.4-0ubuntu8.3 (Ubuntu 7.04)
- libpoppler1-qt
[...]');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:M/Au:N/C:P/I:P/A:P');
script_end_attributes();

script_cve_id("CVE-2008-1693");
exit(0);
}

include('ubuntu.inc');

if ( ! get_kb_item('Host/Ubuntu/release') ) exit(1, 'Could not gather the list of packages');

extrarep = NULL;

found = ubuntu_check(osver: "7.10", pkgname: "libpoppler-dev", pkgver: "0.6-0ubuntu2.2");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libpoppler-dev-',found,' is vulnerable in Ubuntu 7.10
Upgrade it to libpoppler-dev-0.6-0ubuntu2.2
');
}
found = ubuntu_check(osver: "7.10", pkgname: "libpoppler-glib-dev", pkgver: "0.6-0ubuntu2.2");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libpoppler-glib-dev-',found,' is vulnerable in Ubuntu 7.10
Upgrade it to libpoppler-glib-dev-0.6-0ubuntu2.2
');
}
found = ubuntu_check(osver: "7.10", pkgname: "libpoppler-glib2", pkgver: "0.6-0ubuntu2.2");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libpoppler-glib2-',found,' is vulnerable in Ubuntu 7.10
Upgrade it to libpoppler-glib2-0.6-0ubuntu2.2
');
}
found = ubuntu_check(osver: "7.10", pkgname: "libpoppler-qt-dev", pkgver: "0.6-0ubuntu2.2");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libpoppler-qt-dev-',found,' is vulnerable in Ubuntu 7.10
Upgrade it to libpoppler-qt-dev-0.6-0ubuntu2.2
');
}
found = ubuntu_check(osver: "7.10", pkgname: "libpoppler-qt2", pkgver: "0.6-0ubuntu2.2");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libpoppler-qt2-',found,' is vulnerable in Ubuntu 7.10
Upgrade it to libpoppler-qt2-0.6-0ubuntu2.2
');
}
found = ubuntu_check(osver: "7.10", pkgname: "libpoppler-qt4-2", pkgver: "0.6-0ubuntu2.2");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libpoppler-qt4-2-',found,' is vulnerable in Ubuntu 7.10
Upgrade it to libpoppler-qt4-2-0.6-0ubuntu2.2
');
}
found = ubuntu_check(osver: "7.10", pkgname: "libpoppler-qt4-dev", pkgver: "0.6-0ubuntu2.2");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libpoppler-qt4-dev-',found,' is vulnerable in Ubuntu 7.10
Upgrade it to libpoppler-qt4-dev-0.6-0ubuntu2.2
');
}
found = ubuntu_check(osver: "7.04", pkgname: "libpoppler1", pkgver: "0.5.4-0ubuntu8.3");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libpoppler1-',found,' is vulnerable in Ubuntu 7.04
Upgrade it to libpoppler1-0.5.4-0ubuntu8.3
');
}
found = ubuntu_check(osver: "7.04", pkgname: "libpoppler1-glib", pkgver: "0.5.4-0ubuntu8.3");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libpoppler1-glib-',found,' is vulnerable in Ubuntu 7.04
Upgrade it to libpoppler1-glib-0.5.4-0ubuntu8.3
');
}
found = ubuntu_check(osver: "7.04", pkgname: "libpoppler1-qt", pkgver: "0.5.4-0ubuntu8.3");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libpoppler1-qt-',found,' is vulnerable in Ubuntu 7.04
Upgrade it to libpoppler1-qt-0.5.4-0ubuntu8.3
');
}
found = ubuntu_check(osver: "7.04", pkgname: "libpoppler1-qt4", pkgver: "0.5.4-0ubuntu8.3");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libpoppler1-qt4-',found,' is vulnerable in Ubuntu 7.04
Upgrade it to libpoppler1-qt4-0.5.4-0ubuntu8.3
');
}
found = ubuntu_check(osver: "7.10", pkgname: "libpoppler2", pkgver: "0.6-0ubuntu2.2");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libpoppler2-',found,' is vulnerable in Ubuntu 7.10
Upgrade it to libpoppler2-0.6-0ubuntu2.2
');
}
found = ubuntu_check(osver: "7.10", pkgname: "poppler-utils", pkgver: "0.6-0ubuntu2.2");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package poppler-utils-',found,' is vulnerable in Ubuntu 7.10
Upgrade it to poppler-utils-0.6-0ubuntu2.2
');
}

if (w) { security_warning(port: 0, extra: extrarep); }
else exit(0, "Host is not vulnerable");
