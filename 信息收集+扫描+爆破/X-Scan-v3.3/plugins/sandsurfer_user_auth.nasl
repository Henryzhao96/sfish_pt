#
# (C) Tenable Network Security
#


include("compat.inc");

if(description)
{
 script_id(12059);
 script_version ("$Revision: 1.9 $");
 script_cve_id("CVE-2004-2087");
 script_bugtraq_id(9647);
 script_xref(name:"OSVDB", value:"3922");
 
 script_name(english:"SandSurfer < 1.7.0 User Authentication Bypass");

 script_set_attribute(attribute:"synopsis", value:
"Access control to a web application can be circumvented." );
 script_set_attribute(attribute:"description", value:
"The remote host is running SandSurfer, a web-based time keeping 
application.

A vulnerability has been disclosed in all versions of this software, 
up to version 1.6.5 (included) which may allow an attacker to access 
the application without authenticating." );
 script_set_attribute(attribute:"solution", value:
"Upgrade to SandSurfer 1.7.0." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P" );

script_end_attributes();

 script_summary(english:"Checks for SandSurfer");
 script_category(ACT_ATTACK);
 script_copyright(english:"This script is Copyright (C) 2004-2009 Tenable Network Security, Inc."); 
 script_family(english:"CGI abuses");
 script_dependencie("find_service1.nasl", "http_version.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 exit(0);
}

# The script code starts here
include("global_settings.inc");
include("misc_func.inc");
include("http.inc");

port = get_http_port(default:80);

if(!can_host_php(port:port))exit(0);

foreach d ( cgi_dirs() )
{
 # SandSurfer installs under $prefix/cgi-bin/login.cgi
 r = http_send_recv3(method: "GET", item:string(d, "/cgi-bin/login.cgi"), port:port);
 if (isnull(r)) exit(0);
 if( egrep(pattern:"SandSurfer (0\.|1\.[0-5]\.)", string: r[1]+r[2])){
 	security_hole(port);
	exit(0);
 }
 r = http_send_recv3(method: "GET", item:string(d, "/login.cgi"), port:port);
 if (isnull(r)) exit(0);
 if( egrep(pattern:"SandSurfer (0\.|1\.[0-5]\.)", string: r[1]+r[2]))
 {
 	security_hole(port);
	exit(0);
 }
}
