#
# (C) Tenable Network Security
#
#

if ( ! defined_func("bn_random") ) exit(0);
include("compat.inc");

if(description)
{
 script_id(22984);
 script_version("$Revision: 1.8 $");

 script_name(english: "Solaris 10 (x86) : 118966-25");
 script_set_attribute(attribute: "synopsis", value:
"The remote host is missing Sun Security Patch number 118966-25");
 script_set_attribute(attribute: "description", value:
'X11 6.8.0_x86: Xorg patch.
Date this patch was last updated by Sun : Feb/23/07');
 script_set_attribute(attribute: "solution", value:
"You should install this patch for your system to be up-to-date.");
 script_set_attribute(attribute: "see_also", value:
"http://sunsolve.sun.com/search/document.do?assetkey=1-21-118966-25-1");
 script_set_attribute(attribute: "risk_factor", value: "Medium");
 script_end_attributes();

 script_summary(english: "Check for patch 118966-25");
 script_category(ACT_GATHER_INFO);
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 family["english"] = "Solaris Local Security Checks";
 script_family(english:family["english"]);
 
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Solaris/showrev");
 exit(0);
}



include("solaris.inc");

e +=  solaris_check_patch(release:"5.10_x86", arch:"i386", patch:"118966-25", obsoleted_by:"125720-03 ", package:"SUNWxorg-cfg", version:"6.8.2.5.10.0110,REV=0.2005.06.29");
e +=  solaris_check_patch(release:"5.10_x86", arch:"i386", patch:"118966-25", obsoleted_by:"125720-03 ", package:"SUNWxorg-client-programs", version:"6.8.2.5.10.0110,REV=0.2005.06.21");
e +=  solaris_check_patch(release:"5.10_x86", arch:"i386", patch:"118966-25", obsoleted_by:"125720-03 ", package:"SUNWxorg-doc", version:"6.8.0.5.10.7400,REV=0.2004.12.15");
e +=  solaris_check_patch(release:"5.10_x86", arch:"i386", patch:"118966-25", obsoleted_by:"125720-03 ", package:"SUNWxorg-graphics-ddx", version:"6.8.0.5.10.7400,REV=0.2004.12.15");
e +=  solaris_check_patch(release:"5.10_x86", arch:"i386", patch:"118966-25", obsoleted_by:"125720-03 ", package:"SUNWxorg-server", version:"6.8.0.5.10.7400,REV=0.2004.12.15");
e +=  solaris_check_patch(release:"5.10_x86", arch:"i386", patch:"118966-25", obsoleted_by:"125720-03 ", package:"SUNWxorg-xkb", version:"6.8.0.5.10.7400,REV=0.2004.12.15");
if ( e < 0 ) { 
	if ( NASL_LEVEL < 3000 ) 
	   security_warning(0);
	else  
	   security_warning(port:0, extra:solaris_get_report());
	exit(0); 
} 
exit(0, "Host is not affected");
