#
# (C) Tenable Network Security, Inc.
#



include("compat.inc");

if (description)
{
  script_id(25999);
  script_version("$Revision: 1.7 $");

  script_cve_id("CVE-2007-3752");
  script_bugtraq_id(25567);
  script_xref(name:"OSVDB", value:"38528");

  script_name(english:"iTunes < 7.4 Malformed Music File Heap Overflow (Mac OS X)");
  script_summary(english:"Check the version of iTunes"); 
 
 script_set_attribute(attribute:"synopsis", value:
"The remote Mac OS X host contains an application that is affected by a
remote code execution flaw." );
 script_set_attribute(attribute:"description", value:
"The remote host is running iTunes, a popular jukebox program. 

The remote version of iTunes is vulnerable to a heap overflow when it
parses a specially crafted MP4/AAC file.  By tricking a user into
opening such a file, a remote attacker may be able to leverage this
issue to execute arbitrary code on the affected host, subject to the
privileges of the user running the application." );
 script_set_attribute(attribute:"see_also", value:"http://docs.info.apple.com/article.html?artnum=306404" );
 script_set_attribute(attribute:"solution", value:
"Upgrade to iTunes 7.4 or later." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:M/Au:N/C:C/I:C/A:C" );
script_end_attributes();

 
  script_category(ACT_GATHER_INFO);
  script_family(english:"MacOS X Local Security Checks");

  script_copyright(english:"This script is Copyright (C) 2007-2009 Tenable Network Security, Inc.");

  script_dependencies("macosx_itunes_detect.nasl");
  script_require_keys("MacOSX/iTunes/Version");

  exit(0);
}


vers = get_kb_item("MacOSX/iTunes/Version");
if ( isnull(vers) ) exit(0);
vers = split(vers, sep:'.', keep:FALSE);
if ( int(vers[0]) > 0 && (
     int(vers[0]) < 7 ||
     (int(vers[0]) == 7 && int(vers[1]) < 4 ) ) )
	security_hole(0);
