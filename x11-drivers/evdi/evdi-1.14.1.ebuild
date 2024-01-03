# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit linux-mod-r1

DESCRIPTION="Extensible Virtual Display Interface"
HOMEPAGE="https://github.com/DisplayLink/evdi"
SRC_URI="https://github.com/DisplayLink/evdi/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2 LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="x11-libs/libdrm"
RDEPEND="${DEPEND}"
BDEPEND=""

CONFIG_CHECK="~FB_VIRTUAL ~I2C DRM ~USB_SUPPORT USB_ARCH_HAS_HCD"

PATCHES=(
	"${FILESDIR}"/${P}-fix-kernel-6-6.patch
)

src_compile() {
	local modlist=( evdi=video:"${S}/module" )
	linux-mod-r1_src_compile

	cd "${S}/library"
	default
}

src_install() {
	linux-mod-r1_src_install

	dolib.so library/libevdi.so.${PV}
	dosym libevdi.so.${PV} "/usr/$(get_libdir)/libevdi.so.1"
	dosym libevdi.so.1 "/usr/$(get_libdir)/libevdi.so"
}
