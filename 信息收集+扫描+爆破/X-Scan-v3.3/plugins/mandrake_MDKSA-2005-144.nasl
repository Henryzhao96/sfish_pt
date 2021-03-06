
#
# (C) Tenable Network Security
#
# This plugin text was extracted from Mandrake Linux Security Advisory ADVISORY
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);
if(description)
{
 script_id(19901);
 script_version ("$Revision: 1.5 $");
 script_name(english: "MDKSA-2005:144: wxPythonGTK");
 script_set_attribute(attribute: "synopsis", value: 
"The remote host is missing the patch for the advisory MDKSA-2005:144 (wxPythonGTK).");
 script_set_attribute(attribute: "description", value: "Wouter Hanegraaff discovered that the TIFF library did not sufficiently
validate the 'YCbCr subsampling' value in TIFF image headers. Decoding
a malicious image with a zero value resulted in an arithmetic exception,
which can cause a program that uses the TIFF library to crash.
wxPythonGTK uses an embedded libtiff source tree, and as such has the
same vulnerability.
The updated packages have been rebuilt using the system libraries and
should now incorporate all the updates to libjpeg, libpng, libtiff and
zlib.
");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:N/I:N/A:P");
script_set_attribute(attribute: "see_also", value: "http://wwwnew.mandriva.com/security/advisories?name=MDKSA-2005:144");
script_set_attribute(attribute: "solution", value: "Apply the newest security patches from Mandriva.");
script_end_attributes();

script_cve_id("CVE-2005-2452");
script_summary(english: "Check for the version of the wxPythonGTK package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 script_family(english: "Mandriva Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Mandrake/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/Mandrake/rpm-list") ) exit(1, "Could not get the list of packages");

if ( rpm_check( reference:"libwxPythonGTK2.5_2-2.5.2.7-3.1.101mdk", release:"MDK10.1", yank:"mdk") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"libwxPythonGTK2.5_2-devel-2.5.2.7-3.1.101mdk", release:"MDK10.1", yank:"mdk") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"wxPythonGTK-2.5.2.7-3.1.101mdk", release:"MDK10.1", yank:"mdk") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"libwxPythonGTK2.5_3-2.5.3.1-3.1.102mdk", release:"MDK10.2", yank:"mdk") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"libwxPythonGTK2.5_3-devel-2.5.3.1-3.1.102mdk", release:"MDK10.2", yank:"mdk") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"wxPythonGTK-2.5.3.1-3.1.102mdk", release:"MDK10.2", yank:"mdk") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if (rpm_exists(rpm:"wxPythonGTK-", release:"MDK10.1")
 || rpm_exists(rpm:"wxPythonGTK-", release:"MDK10.2") )
{
 set_kb_item(name:"CVE-2005-2452", value:TRUE);
}
exit(0, "Host is not affected");
