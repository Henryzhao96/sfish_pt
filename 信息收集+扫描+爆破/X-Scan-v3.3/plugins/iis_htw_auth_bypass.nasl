#
# (C) Tenable Network Security, Inc.
#

include("compat.inc");

if(description)
{
 script_id(31648);
 script_bugtraq_id(24105);
 script_xref(name:"OSVDB", value:"41091");
 script_cve_id("CVE-2007-2815");
 script_version ("$Revision: 1.7 $");

 script_name(english: "Microsoft IIS webhits.dll Hit-Highlighting Authentication Bypass");
 
 script_set_attribute(attribute:"synopsis", value:
"The remote web server contains a module which may allow an attacker to
bypass authentication." );
 script_set_attribute(attribute:"description", value:
"The remote IIS web server contains a vulnerability in the Server Hit
Hilight Module which may allow an attacker to view the contents of a
page otherwise requiring authentififcation. 

An attacker may exploit this flaw to bypass authentication on certain
pages." );
 script_set_attribute(attribute:"solution", value:
"Upgrade to IIS 6" );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:M/Au:N/C:N/I:P/A:N" );
script_end_attributes();


 script_summary(english: "Uses the results of webmirror.nasl");
 script_category(ACT_GATHER_INFO); 
 
 script_copyright(english:"This script is Copyright (C) 2008-2009 Tenable Network Security, Inc.");
 script_family(english: "Web Servers");
 script_dependencie("webmirror.nasl");
 script_require_ports("Services/www",80);
 exit(0);
}

include("global_settings.inc");
include("misc_func.inc");
include("http.inc");

port = get_http_port(default:80);
banner = get_http_banner(port:port);
if ( "IIS/5" >!< banner && "IIS/4" >!< banner ) exit(0);
list = get_kb_list("www/" + port + "/content/extensions/htw");
if ( isnull(list) ) exit(0);
list = make_list(list);
auth = get_kb_list("www/" + port + "/content/auth_required");
if ( isnull(auth) ) exit(0);
auth = make_list(auth);

list = make_list(list);
foreach item ( list )
{
  file = item + "?CiWebhitsfile=" + auth[0] + "&CiRestriction=e&CiHiliteType=full";
  w = http_send_recv3(method:"GET", item:file, port:80);
  if (isnull(w)) exit(1, "the web server did not answer");
  res = strcat(w[0], w[1], '\r\n', w[2]);
  if (  "<!-- The highlighted summaries are printed here -->" >< res )
	{
		security_warning(port:port,extra:'\nIt is possible to read ' + auth[0] + ' by requesting :\n\n' + file );
		exit(0);
	}
}
