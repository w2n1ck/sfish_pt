# This script was automatically generated from the dsa-1321
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(25615);
 script_version("$Revision: 1.5 $");
 script_xref(name: "DSA", value: "1321");
 script_cve_id("CVE-2007-3257");

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-1321 security update');
 script_set_attribute(attribute: 'description', value:
'It was discovered that the IMAP code in the Evolution Data Server
performs insufficient sanitising of a value later used an array index,
which can lead to the execution of arbitrary code.
For the oldstable distribution (sarge) a different source package
is affected and will be fixed separately.
For the stable distribution (etch) this problem has been fixed in
version 1.6.3-5etch1.
');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2007/dsa-1321');
 script_set_attribute(attribute: 'solution', value: 
'The Debian project recommends that you upgrade your evolution-data-server packages.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:M/Au:N/C:P/I:P/A:P');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA1321] DSA-1321-1 evolution-data-server");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-1321-1 evolution-data-server");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'evolution-data-server', release: '4.0', reference: '1.6.3-5etch1');
deb_check(prefix: 'evolution-data-server-common', release: '4.0', reference: '1.6.3-5etch1');
deb_check(prefix: 'evolution-data-server-dbg', release: '4.0', reference: '1.6.3-5etch1');
deb_check(prefix: 'evolution-data-server-dev', release: '4.0', reference: '1.6.3-5etch1');
deb_check(prefix: 'libcamel1.2-8', release: '4.0', reference: '1.6.3-5etch1');
deb_check(prefix: 'libcamel1.2-dev', release: '4.0', reference: '1.6.3-5etch1');
deb_check(prefix: 'libebook1.2-5', release: '4.0', reference: '1.6.3-5etch1');
deb_check(prefix: 'libebook1.2-dev', release: '4.0', reference: '1.6.3-5etch1');
deb_check(prefix: 'libecal1.2-6', release: '4.0', reference: '1.6.3-5etch1');
deb_check(prefix: 'libecal1.2-dev', release: '4.0', reference: '1.6.3-5etch1');
deb_check(prefix: 'libedata-book1.2-2', release: '4.0', reference: '1.6.3-5etch1');
deb_check(prefix: 'libedata-book1.2-dev', release: '4.0', reference: '1.6.3-5etch1');
deb_check(prefix: 'libedata-cal1.2-5', release: '4.0', reference: '1.6.3-5etch1');
deb_check(prefix: 'libedata-cal1.2-dev', release: '4.0', reference: '1.6.3-5etch1');
deb_check(prefix: 'libedataserver1.2-7', release: '4.0', reference: '1.6.3-5etch1');
deb_check(prefix: 'libedataserver1.2-dev', release: '4.0', reference: '1.6.3-5etch1');
deb_check(prefix: 'libedataserverui1.2-6', release: '4.0', reference: '1.6.3-5etch1');
deb_check(prefix: 'libedataserverui1.2-dev', release: '4.0', reference: '1.6.3-5etch1');
deb_check(prefix: 'libegroupwise1.2-10', release: '4.0', reference: '1.6.3-5etch1');
deb_check(prefix: 'libegroupwise1.2-dev', release: '4.0', reference: '1.6.3-5etch1');
deb_check(prefix: 'libexchange-storage1.2-1', release: '4.0', reference: '1.6.3-5etch1');
deb_check(prefix: 'libexchange-storage1.2-dev', release: '4.0', reference: '1.6.3-5etch1');
if (deb_report_get()) security_warning(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");
