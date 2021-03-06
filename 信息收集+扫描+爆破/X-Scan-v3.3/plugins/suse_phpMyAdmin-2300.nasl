
#
# (C) Tenable Network Security
#
# The text description of this plugin is (C) Novell, Inc.
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);

if(description)
{
 script_id(27395);
 script_version ("$Revision: 1.6 $");
 script_name(english: "SuSE Security Update:  phpMyAdmin: Security upgrade to version 2.9.1.1. (phpMyAdmin-2300)");
 script_set_attribute(attribute: "synopsis", value: 
"The remote SuSE system is missing the security patch phpMyAdmin-2300");
 script_set_attribute(attribute: "description", value: "This patch upgrades the phpMyAdmin package to version
2.9.1.1, including fixes for the security problems tracked
by the Mitre CVE IDs CVE-2006-3388, CVE-2006-5116,
CVE-2006-5117, and CVE-2006-5718.
");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:M/Au:N/C:P/I:P/A:N");
script_set_attribute(attribute: "solution", value: "Install the security patch phpMyAdmin-2300");
script_end_attributes();

script_cve_id("CVE-2006-3388", "CVE-2006-5116", "CVE-2006-5117", "CVE-2006-5718");
script_summary(english: "Check for the phpMyAdmin-2300 package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 script_family(english: "SuSE Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/SuSE/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/SuSE/rpm-list") ) exit(1, "Could not gather the list of packages");
if ( rpm_check( reference:"phpMyAdmin-2.9.1.1-2.1", release:"SUSE10.1") )
{
	security_warning(port:0, extra:rpm_report_get());
	exit(0);
}
exit(0,"Host is not affected");
