#
# (C) Tenable Network Security
#


include("compat.inc");

if(description)
{
 script_id(16329);
 script_version("$Revision: 1.12 $");

 script_cve_id("CVE-2004-1319");
 script_bugtraq_id(11950);
 script_xref(name:"IAVA", value:"2005-t-0004");
 script_xref(name:"OSVDB", value:"12424");

 name["english"] = "MS05-013: Vulnerability in the DHTML Editing Component may allow code execution (891781)";

 script_name(english:name["english"]);

 script_set_attribute(attribute:"synopsis", value:
"Arbitrary code can be executed on the remote host through the web client." );
 script_set_attribute(attribute:"description", value:
"The remote host is running a version of Windows which contains a flaw in
the DHTML Editing Component ActiveX Control.

An attacker may exploit this flaw to execute arbitrary code on the remote host.

To exploit this flaw, an attacker would need to construct a malicious web page
and lure a victim into visiting it." );
 script_set_attribute(attribute:"solution", value:
"Microsoft has released a set of patches for Windows 2000, XP and 2003 :

http://www.microsoft.com/technet/security/bulletin/ms05-013.mspx" );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:M/Au:N/C:C/I:C/A:C" );

script_end_attributes();

 
 summary["english"] = "Checks for KB 891781 via the registry";

 script_summary(english:summary["english"]);
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2005-2009 Tenable Network Security, Inc.");
 family["english"] = "Windows : Microsoft Bulletins";
 script_family(english:family["english"]);

 script_dependencies("smb_hotfixes.nasl" );
 script_require_keys("SMB/Registry/Enumerated");
 script_require_ports(139, 445);
 exit(0);
}

include("smb_hotfixes_fcheck.inc");
include("smb_hotfixes.inc");
include("smb_func.inc");

if ( hotfix_check_sp(xp:3, win2k:5, win2003:1) <= 0 ) exit(0);

if (is_accessible_share())
{
 if ( hotfix_is_vulnerable (os:"5.2", sp:0, file:"Dhtmled.ocx", version:"6.1.0.9231", path:hotfix_get_commonfilesdir(), dir:"\Microsoft Shared\Triedit") ||
      hotfix_is_vulnerable (os:"5.1", file:"Dhtmled.ocx", version:"6.1.0.9232", path:hotfix_get_commonfilesdir(), dir:"\Microsoft Shared\Triedit") ||
      hotfix_is_vulnerable (os:"5.0", file:"Dhtmled.ocx", version:"6.1.0.9232", path:hotfix_get_commonfilesdir(), dir:"\Microsoft Shared\Triedit") )
 {
 set_kb_item(name:"SMB/Missing/MS05-013", value:TRUE);
 security_hole(get_kb_item("SMB/transport"));
 }
 
 hotfix_check_fversion_end(); 
 exit (0);
}
else
{
 if ( hotfix_missing(name:"891781") > 0  )
 {
 set_kb_item(name:"SMB/Missing/MS05-013", value:TRUE);
 hotfix_security_hole();
 }
}
