#
# Josh Zlatin-Amishav (josh at ramat dot cc)
# GPLv2
#
# Changes by Tenable:
# - Revised plugin title (12/22/2008)


include("compat.inc");

if (description) {
  script_id(19692);
  script_cve_id("CVE-2005-2392");
  script_bugtraq_id(14346);
  script_xref(name:"OSVDB", value:"18128");
  script_version("$Revision: 1.8 $");

  script_name(english:"CMSimple index.php search Function XSS");
 
 script_set_attribute(attribute:"synopsis", value:
"The remote web server is hosting a PHP application that is affected
by a cross-site scripting vulnerability." );
 script_set_attribute(attribute:"description", value:
"The remote host is running CMSimple, a CMS written in PHP. 

The version of CMSimple installed on the remote host is prone to
cross-site scripting attacks due to its failure to sanitize
user-supplied input to the search field." );
 script_set_attribute(attribute:"see_also", value:"http://lostmon.blogspot.com/2005/07/cmsimple-search-variable-xss.html" );
 script_set_attribute(attribute:"see_also", value:"http://archives.neohapsis.com/archives/bugtraq/2006-08/0059.html" );
 script_set_attribute(attribute:"see_also", value:"http://www.cmsimple.dk/forum/viewtopic.php?t=2470" );
 script_set_attribute(attribute:"solution", value:
"Upgrade to CMSimple 2.5 beta 3 or later." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:M/Au:N/C:N/I:P/A:N" );

script_end_attributes();

 
  summary["english"] = "Checks for XSS in search field in index.php";
  script_summary(english:summary["english"]);
 
  script_category(ACT_ATTACK);
  script_family(english:"CGI abuses : XSS");

  script_copyright(english:"(C) 2005-2009 Josh Zlatin-Amishav");

  script_dependencie("http_version.nasl", "cross_site_scripting.nasl");
  script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("url_func.inc");

port = get_http_port(default:80);
if (!get_port_state(port)) exit(0);
if (!can_host_php(port:port)) exit(0);
if ( get_kb_item("www/"+port+"/generic_xss") ) exit(0);

xss = "<script>alert('" + SCRIPT_NAME + "');</script>";
exss = urlencode(str:xss);

foreach dir ( cgi_dirs() )
{
  req = http_get(
    item:string(
      dir, "/index.php?",
     'search=', exss, "&function=search"
    ),
    port:port
  );
  res = http_keepalive_send_recv(port:port, data:req, bodyonly:TRUE);
  if (res == NULL) exit(0);

  # There's a problem if we see our XSS.
  if (
    xss >< res &&
    (
      egrep(string:res, pattern:'meta name="generator" content="CMSimple .+ cmsimple\\.dk') ||
      egrep(string:res, pattern:'href="http://www\\.cmsimple\\.dk/".+>Powered by CMSimple<') ||
      egrep(string:res, pattern:string('href="', dir, '/\\?&(sitemap|print)">'))
    )
  ) 
  {
    security_warning(port);
    set_kb_item(name: 'www/'+port+'/XSS', value: TRUE);
    exit(0);
  }
}
