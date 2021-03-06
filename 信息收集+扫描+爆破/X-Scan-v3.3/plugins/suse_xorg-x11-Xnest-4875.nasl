
#
# (C) Tenable Network Security
#
# The text description of this plugin is (C) Novell, Inc.
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);

if(description)
{
 script_id(30040);
 script_version ("$Revision: 1.9 $");
 script_name(english: "SuSE Security Update:  Security update for xorg-x11-Xnest (xorg-x11-Xnest-4875)");
 script_set_attribute(attribute: "synopsis", value: 
"The remote SuSE system is missing the security patch xorg-x11-Xnest-4875");
 script_set_attribute(attribute: "description", value: "This update fixes various Xserver security issues. File
existence disclosure vulnerability (CVE-2007-5958).

XInput Extension Memory Corruption Vulnerability [IDEF2888
CVE-2007-6427].

TOG-CUP Extension Memory Corruption Vulnerability [IDEF2901
CVE-2007-6428].

EVI Extension Integer Overflow Vulnerability [IDEF2902
CVE-2007-6429].

MIT-SHM Extension Integer Overflow Vulnerability [IDEF2904
CVE-2007-6429]. 

XFree86-MISC Extension Invalid Array Index Vulnerability
[IDEF2903 CVE-2007-5760]. 

PCF font parser vulnerability.
");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:M/Au:N/C:C/I:C/A:C");
script_set_attribute(attribute: "solution", value: "Install the security patch xorg-x11-Xnest-4875");
script_end_attributes();

script_cve_id("CVE-2007-5760", "CVE-2007-5958", "CVE-2007-6427", "CVE-2007-6428", "CVE-2007-6429");
script_summary(english: "Check for the xorg-x11-Xnest-4875 package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 script_family(english: "SuSE Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/SuSE/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/SuSE/rpm-list") ) exit(1, "Could not gather the list of packages");

if ( rpm_check( reference:"xorg-x11-Xnest-6.9.0-50.54.5", release:"SLES10") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
if ( rpm_check( reference:"xorg-x11-Xvfb-6.9.0-50.54.5", release:"SLES10") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
if ( rpm_check( reference:"xorg-x11-Xnest-6.9.0-50.54.5", release:"SLED10") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
if ( rpm_check( reference:"xorg-x11-Xvfb-6.9.0-50.54.5", release:"SLED10") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
# END OF TEST
exit(0,"Host is not affected");
