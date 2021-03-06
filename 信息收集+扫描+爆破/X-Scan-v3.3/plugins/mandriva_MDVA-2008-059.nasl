
#
# (C) Tenable Network Security
#
# This plugin text was extracted from Mandriva Linux Security Advisory ADVISORY
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);
if(description)
{
 script_id(36353);
 script_version ("$Revision: 1.1 $");
 script_name(english: "MDVA-2008:059: drakx-kbd-mouse-x11");
 script_set_attribute(attribute: "synopsis", value: 
"The remote host is missing the patch for the advisory MDVA-2008:059 (drakx-kbd-mouse-x11).");
 script_set_attribute(attribute: "description", value: "An updated XFdrake is available that corrects a number of bugs:
- never write a ModeLine when using the fglrx driver (bug #30934)
- if the EDID gives a valid EISA_ID, a valid 16/10 preferred
resolution, but no HorizSync/VertRefresh, use a generic flat panel
HorizSync/VertRefresh (needed for edid.lcd.Elonex-PR600)
- add 800x480 (used on belinea s.book)
- add 1024x600 (used on Samsung Q1Ultra) (bug #37889)
- if the EDID gives a valid 16/10 preferred resolution (even if
duplicated), but no HorizSync/VertRefresh, use a generic flat panel
HorizSync/VertRefresh (needed for edid.lcd.dell-inspiron-6400,
bug #37971)
");
 script_set_attribute(attribute: "risk_factor", value: "High");
script_set_attribute(attribute: "see_also", value: "http://wwwnew.mandriva.com/security/advisories?name=MDVA-2008:059");
script_set_attribute(attribute: "solution", value: "Apply the newest security patches from Mandriva.");
script_end_attributes();

script_summary(english: "Check for the version of the drakx-kbd-mouse-x11 package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 script_family(english: "Mandriva Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Mandrake/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/Mandrake/rpm-list") ) exit(1, "Could not get the list of packages");

if ( rpm_check( reference:"drakx-kbd-mouse-x11-0.37.3-1.1mdv2008.0", release:"MDK2008.0", yank:"mdv") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
exit(0, "Host is not affected");
