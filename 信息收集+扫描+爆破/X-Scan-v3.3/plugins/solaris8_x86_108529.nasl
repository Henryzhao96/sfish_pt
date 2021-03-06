#
# (C) Tenable Network Security
#
#

if ( ! defined_func("bn_random") ) exit(0);
include("compat.inc");

if(description)
{
 script_id(13407);
 script_version("$Revision: 1.18 $");

 script_name(english: "Solaris 8 (x86) : 108529-29");
 script_set_attribute(attribute: "synopsis", value:
"The remote host is missing Sun Security Patch number 108529-29");
 script_set_attribute(attribute: "description", value:
'SunOS 5.8_x86: kernel update and Apache patch.
Date this patch was last updated by Sun : Feb/04/04');
 script_set_attribute(attribute: "solution", value:
"You should install this patch for your system to be up-to-date.");
 script_set_attribute(attribute: "see_also", value:
"http://sunsolve.sun.com/search/document.do?assetkey=1-21-108529-29-1");
 script_set_attribute(attribute: "risk_factor", value: "High");
 script_end_attributes();

 script_summary(english: "Check for patch 108529-29");
 script_category(ACT_GATHER_INFO);
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 family["english"] = "Solaris Local Security Checks";
 script_family(english:family["english"]);
 
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Solaris/showrev");
 exit(0);
}



include("solaris.inc");

e +=  solaris_check_patch(release:"5.8_x86", arch:"i386", patch:"108529-29", obsoleted_by:"", package:"SUNWapchS", version:"11.8.0,REV=2000.01.08.18.17");
e +=  solaris_check_patch(release:"5.8_x86", arch:"i386", patch:"108529-29", obsoleted_by:"", package:"SUNWapchd", version:"11.8.0,REV=2000.01.08.18.17");
e +=  solaris_check_patch(release:"5.8_x86", arch:"i386", patch:"108529-29", obsoleted_by:"", package:"SUNWapchr", version:"11.8.0,REV=2000.01.08.18.17");
e +=  solaris_check_patch(release:"5.8_x86", arch:"i386", patch:"108529-29", obsoleted_by:"", package:"SUNWapchu", version:"11.8.0,REV=2000.01.08.18.17");
e +=  solaris_check_patch(release:"5.8_x86", arch:"i386", patch:"108529-29", obsoleted_by:"", package:"SUNWarc", version:"11.8.0,REV=2000.01.08.18.17");
e +=  solaris_check_patch(release:"5.8_x86", arch:"i386", patch:"108529-29", obsoleted_by:"", package:"SUNWcar", version:"11.8.0,REV=2000.01.08.18.17");
e +=  solaris_check_patch(release:"5.8_x86", arch:"i386", patch:"108529-29", obsoleted_by:"", package:"SUNWcpc", version:"11.8.0,REV=2000.01.08.18.17");
e +=  solaris_check_patch(release:"5.8_x86", arch:"i386", patch:"108529-29", obsoleted_by:"", package:"SUNWcsl", version:"11.8.0,REV=2000.01.08.18.17");
e +=  solaris_check_patch(release:"5.8_x86", arch:"i386", patch:"108529-29", obsoleted_by:"", package:"SUNWcsr", version:"11.8.0,REV=2000.01.08.18.17");
e +=  solaris_check_patch(release:"5.8_x86", arch:"i386", patch:"108529-29", obsoleted_by:"", package:"SUNWcstl", version:"11.8.0,REV=2000.01.08.18.17");
e +=  solaris_check_patch(release:"5.8_x86", arch:"i386", patch:"108529-29", obsoleted_by:"", package:"SUNWcsu", version:"11.8.0,REV=2000.01.08.18.17");
e +=  solaris_check_patch(release:"5.8_x86", arch:"i386", patch:"108529-29", obsoleted_by:"", package:"SUNWhea", version:"11.8.0,REV=2000.01.08.18.17");
e +=  solaris_check_patch(release:"5.8_x86", arch:"i386", patch:"108529-29", obsoleted_by:"", package:"SUNWmdb", version:"11.8.0,REV=2000.01.08.18.17");
e +=  solaris_check_patch(release:"5.8_x86", arch:"i386", patch:"108529-29", obsoleted_by:"", package:"SUNWncar", version:"11.8.0,REV=2000.01.08.18.17");
e +=  solaris_check_patch(release:"5.8_x86", arch:"i386", patch:"108529-29", obsoleted_by:"", package:"SUNWncau", version:"11.8.0,REV=2000.01.08.18.17");
e +=  solaris_check_patch(release:"5.8_x86", arch:"i386", patch:"108529-29", obsoleted_by:"", package:"SUNWos86r", version:"1.1.0,REV=2000.01.08.18.17");
e +=  solaris_check_patch(release:"5.8_x86", arch:"i386", patch:"108529-29", obsoleted_by:"", package:"SUNWpmr", version:"11.8.0,REV=2000.01.08.18.17");
e +=  solaris_check_patch(release:"5.8_x86", arch:"i386", patch:"108529-29", obsoleted_by:"", package:"SUNWpmu", version:"11.8.0,REV=2000.01.08.18.17");
e +=  solaris_check_patch(release:"5.8_x86", arch:"i386", patch:"108529-29", obsoleted_by:"", package:"SUNWscpu", version:"11.8.0,REV=2000.01.08.18.17");
e +=  solaris_check_patch(release:"5.8_x86", arch:"i386", patch:"108529-29", obsoleted_by:"", package:"SUNWsrh", version:"11.8.0,REV=2000.01.08.18.17");
e +=  solaris_check_patch(release:"5.8_x86", arch:"i386", patch:"108529-29", obsoleted_by:"", package:"SUNWtnfc", version:"11.8.0,REV=2000.01.08.18.17");
if ( e < 0 ) { 
	if ( NASL_LEVEL < 3000 ) 
	   security_hole(0);
	else  
	   security_hole(port:0, extra:solaris_get_report());
	exit(0); 
} 
exit(0, "Host is not affected");
