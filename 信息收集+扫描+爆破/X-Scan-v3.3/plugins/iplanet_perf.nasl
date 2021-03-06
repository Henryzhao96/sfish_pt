#
# This script was written by Sullo (sullo@cirt.net)
#

# Changes by Tenable:
# - OSVDB ref, changed family, output formatting (9/2/09)
# - Revised plugin title (9/18/09)


include("compat.inc");

if(description)
{
 script_id(11220);
 script_version ("$Revision: 1.7 $");
 script_xref(name:"OSVDB", value:"57612");

 script_name(english:"Netscape / iPlanet .perf Remote Information Disclosure");
 
 script_set_attribute(attribute:"synopsis", value:
"The remote web server is affected by an information disclosure
vulnerability." );
 script_set_attribute(attribute:"description", value:
"Requesting the URI /.perf gives information about
the currently running Netscape/iPlanet web server." );
 script_set_attribute(attribute:"see_also", value:"http://mon15ny450.doubleclick.net/SiteScope/docs/iPlanetServerMon.htm" );
 script_set_attribute(attribute:"solution", value:
"If you don't use this feature, server monitoring should be
disabled in the magnus.conf file or web server admin." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:P/I:N/A:N" );

script_end_attributes();

 script_summary(english:"Makes a request like http://www.example.com/.perf");
 script_category(ACT_GATHER_INFO);
 script_copyright(english:"This script is Copyright (C) 2003-2009 Sullo");
 script_family(english:"Web Servers");
 script_dependencie("find_service1.nasl", "http_version.nasl");
 script_require_ports("Services/www", 80);
 script_require_keys("www/netscape-commerce", "www/netscape-fasttrack", "www/iplanet");
 exit(0);
}

#
# The script code starts here
#

include("http_func.inc");

port = get_http_port(default:80);
str = "ListenSocket";

if(get_port_state(port))
{
 soc = http_open_socket(port);
 if(soc)
 {
  buffer = http_get(item:"/.perf", port:port);
  send(socket:soc, data:buffer);
  data = http_recv(socket:soc);
  if( str >< data )
  {
   security_warning(port);
  }
  http_close_socket(soc);
 }
}
