#
# (C) Tenable Network Security
#
#

if ( ! defined_func("bn_random") ) exit(0);

include("compat.inc");

if(description)
{
 script_id(23077);
 script_version ("$Revision: 1.8 $");
 name["english"] = "Solaris 2.5.1 (i386) : 105936-09";
 
 script_name(english:name["english"]);
 
 script_set_attribute(attribute:"synopsis", value:
"The remote host is missing a vendor-supplied security patch" );
 script_set_attribute(attribute:"description", value:
"The remote host is missing Sun Security Patch number 105936-09
(Solstice Internet Mail Server 3.2_x86: Misc. fixes).

Date this patch was last updated by Sun : Sun Oct 04 18:00:00 MDT 1998

You should install this patch for your system to be up-to-date." );
 script_set_attribute(attribute:"solution", value:
"http://sunsolve.sun.com/search/document.do?assetkey=1-21-105936-09-1" );
 script_set_attribute(attribute:"risk_factor", value:"High" );


 script_end_attributes();

 
 summary["english"] = "Check for patch 105936-09"; 
 script_summary(english:summary["english"]);
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2008 Tenable Network Security");
 family["english"] = "Solaris Local Security Checks";
 script_family(english:family["english"]);
 
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Solaris/showrev");
 exit(0);
}



include("solaris.inc");

e +=  solaris_check_patch(release:"5.5.1_x86", arch:"i386", patch:"105936-09", obsoleted_by:"", package:"SUNWbbmta", version:"3.2,REV=1998.02.02.17.01");
e +=  solaris_check_patch(release:"5.5.1_x86", arch:"i386", patch:"105936-09", obsoleted_by:"", package:"SUNWimadm", version:"3.2,REV=1998.02.02.17.01");
e +=  solaris_check_patch(release:"5.5.1_x86", arch:"i386", patch:"105936-09", obsoleted_by:"", package:"SUNWimims", version:"3.2,REV=1998.02.02.17.01");
e +=  solaris_check_patch(release:"5.5.1_x86", arch:"i386", patch:"105936-09", obsoleted_by:"", package:"SUNWimimu", version:"3.2,REV=1998.02.02.17.01");
e +=  solaris_check_patch(release:"5.5.1_x86", arch:"i386", patch:"105936-09", obsoleted_by:"", package:"SUNWimmta", version:"3.2,REV=1998.02.02.17.01");
if ( e < 0 ) { 
	if ( NASL_LEVEL < 3000 ) 
	   security_hole(0);
	else  
	   security_hole(port:0, extra:solaris_get_report());
	exit(0); 
} 
