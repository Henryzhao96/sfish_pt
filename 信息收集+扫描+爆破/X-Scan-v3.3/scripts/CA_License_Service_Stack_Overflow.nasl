#
# Copyright (C) 2005 KK Liu
#
# Modifications by Tenable Network Security:
#  - Fixed the request
#  - Shorter description
#  - Fixed the version number check 
#  - Added a check on port 10203
#
#

if(description)
{
 script_id(17307);
 script_bugtraq_id(12705);
 script_cve_id("CAN-2005-0581, CAN-2005-0582, CAN-2005-0583");

 script_version ("$Revision: 1.6 $");
 name["english"] = "CA License Service Multiple Vulnerabilities";

 script_name(english:name["english"]);
 
 desc["english"] = "
The remote host is running the Computer Associate License Application.

The remote version of this software is vulnerable to several flaws which
may allow a remote attacker to execute arbitrary code on the remote host
with the SYSTEM privileges.

See also :  http://www.eeye.com/html/research/advisories/AD20050302.html
Solution : http://supportconnectw.ca.com/public/ca_common_docs/security_notice.asp 
Risk factor : High";


 script_description(english:desc["english"]);
 
 summary["english"] = "CA License Service Stack Overflow";
 script_summary(english:summary["english"]);
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2005 KK Liu");
 script_family(english: "Gain root remotely");
 script_require_ports(10203, 10204);
 exit(0);
}

include('misc_func.inc');

req = 'A0 GETCONFIG SELF 0 <EOM>\r\n';
ports = make_list(10203, 10204);
foreach port ( ports )
{
 if ( get_port_state(port) ) 
  {
	soc = open_sock_tcp(port);
	if ( soc ) 
	{
	send(socket:soc, data:req);
	r = recv(socket:soc, length:620);
	close(soc);
	if ( strlen(r) > 0 )
	{
     	chkstr = strstr(r, "VERSION<");
	if (chkstr ) 
 	{
	 register_service(port:port, proto:"CA_License_Service");
         if (egrep (pattern:"VERSION<[0-9] 1\.(5[3-9].*|60.*|61(\.[0-8])?)>", string:chkstr)) 
	 {
          security_hole(port);
          exit(0);
	 }
	}
       } 
    }
  }
}
