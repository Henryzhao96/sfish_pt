# This script was automatically generated from the dsa-1778
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(36843);
 script_version("$Revision: 1.2 $");
 script_xref(name: "DSA", value: "1778");
 script_cve_id("CVE-2009-0664");

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-1778 security update');
 script_set_attribute(attribute: 'description', value:
'It was discovered that mahara, an electronic portfolio, weblog, and
resume builder, is prone to cross-site scripting (XSS) attacks because
of missing input sanitization of the introduction text field in user
profiles and any text field in a user view.
The oldstable distribution (etch) does not contain mahara.
For the stable distribution (lenny), this problem has been fixed in
version 1.0.4-4+lenny2.
');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2009/dsa-1778');
 script_set_attribute(attribute: 'solution', value: 
'The Debian project recommends that you upgrade your mahara packages.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:M/Au:N/C:N/I:P/A:N');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA1778] DSA-1778-1 mahara");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-1778-1 mahara");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'mahara', release: '5.0', reference: '1.0.4-4+lenny2');
deb_check(prefix: 'mahara-apache2', release: '5.0', reference: '1.0.4-4+lenny2');
if (deb_report_get()) security_warning(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");
