# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit linux-mod

DESCRIPTION="TUXEDO WMI Treiber - Flugmodus-Taste und Tastaturbeleuchtung"
HOMEPAGE="https://www.linux-onlineshop.de/forum/index.php?page=Thread&threadID=26"
SRC_URI="https://www.linux-onlineshop.de/forum/index.php?page=Attachment&attachmentID=424 -> tuxedo-wmi-1.5.1.src.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="virtual/linux-sources"
RDEPEND=""

S="${S}/src"

MODULE_NAMES="tuxedo-wmi(extra)"

pkg_setup() {
	if kernel_is lt 3 11 0; then
		echo
		ewarn "Your kernel version is ${KV_MAJOR}.${KV_MINOR}.${KV_PATCH}"
		ewarn "This module works with a kernel version >= 3.11.0"
		echo
		ewarn "DO NOT file bug reports for lesser kernel versions as they will be ignored."
	fi

	CONFIG_CHECK="ACPI_WMI LEDS_CLASS"

	linux-mod_pkg_setup

	BUILD_PARAMS="-C ${KV_DIR} M=${S}"
	BUILD_TARGETS=" " # empty target
}

src_prepare() {
	cp "${FILESDIR}/Makefile" Makefile
}
