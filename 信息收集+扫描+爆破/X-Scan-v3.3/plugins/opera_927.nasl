#
# (C) Tenable Network Security, Inc.
#



include("compat.inc");

if (description)
{
  script_id(31734);
  script_version("$Revision: 1.5 $");

  script_cve_id("CVE-2008-1761", "CVE-2008-1762");
  script_bugtraq_id(28585);
  script_xref(name:"OSVDB", value:"44030");
  script_xref(name:"OSVDB", value:"44031");
  script_xref(name:"Secunia", value:"29662");

  script_name(english:"Opera < 9.27 Multiple Vulnerabilities");
  script_summary(english:"Checks version number of Opera");

 script_set_attribute(attribute:"synopsis", value:
"The remote host contains a web browser that is affected by several
issues." );
 script_set_attribute(attribute:"description", value:
"The version of Opera installed on the remote host reportedly is
affected by several issues :

  - Resized canvas patterns can lead to a program crash with
    possible memory corruption.

  - A newsfeed prompt can cause Opera to execute arbitrary 
    code.

  - Improved keyboard handling of password inputs." );
 script_set_attribute(attribute:"see_also", value:"http://www.opera.com/support/search/view/881/" );
 script_set_attribute(attribute:"see_also", value:"http://www.opera.com/support/search/view/882/" );
 script_set_attribute(attribute:"see_also", value:"http://www.opera.com/docs/changelogs/windows/927/" );
 script_set_attribute(attribute:"solution", value:
"Upgrade to Opera version 9.27 or later." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:M/Au:N/C:C/I:C/A:C" );
script_end_attributes();


  script_category(ACT_GATHER_INFO);
  script_family(english:"Windows");

  script_copyright(english:"This script is Copyright (C) 2008-2009 Tenable Network Security, Inc.");

  script_dependencies("opera_installed.nasl");
  script_require_keys("SMB/Opera/Version_UI");

  exit(0);
}


include("global_settings.inc");


version_ui = get_kb_item("SMB/Opera/Version_UI");
if (isnull(version_ui)) exit(0);

if (version_ui =~ "^([0-8]\.|9\.([01][0-9]|2[0-6])($|[^0-9]))")
{
  if (report_verbosity)
  {
    report = string(
      "\n",
      "Opera version ", version_ui, " is currently installed on the remote host.\n"
    );
    security_hole(port:get_kb_item("SMB/transport"), extra:report);
  }
  else security_hole(get_kb_item("SMB/transport"));
}
