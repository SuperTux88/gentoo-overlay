# Copyright 2024-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
inherit linux-mod-r1 python-single-r1 flag-o-matic

DESCRIPTION="Extensible Virtual Display Interface"
HOMEPAGE="https://github.com/DisplayLink/evdi"
SRC_URI="https://github.com/DisplayLink/evdi/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2 LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"

IUSE="python"
REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

RDEPEND="
	x11-libs/libdrm
	python? (
		${PYTHON_DEPS}
		$(python_gen_cond_dep '
			dev-python/pybind11[${PYTHON_USEDEP}]
		')
	)
"

DEPEND="
	${RDEPEND}
	sys-kernel/linux-headers
"

CONFIG_CHECK="~FB_VIRTUAL ~I2C DRM ~USB_SUPPORT USB_ARCH_HAS_HCD"

pkg_setup() {
	linux-mod-r1_pkg_setup
	use python && python-single-r1_pkg_setup
}

src_compile() {
	# The kernel module doesn't build with lto
	# See: https://github.com/SuperTux88/gentoo-overlay/issues/8
	filter-lto

	local modlist=( "evdi=video:module" )
	local modargs=(
		CONFIG_DRM_EVDI="m" # https://github.com/DisplayLink/evdi/issues/476
		KVER="${KV_FULL}"
		KDIR="${KV_OUT_DIR}"
	)
	linux-mod-r1_src_compile

	emake -C library

	use python && emake -C pyevdi
}

src_install() {
	linux-mod-r1_src_install

	local -x DESTDIR="${ED}" PREFIX="${EPREFIX}"

	LIBDIR="/usr/$(get_libdir)" emake -C library install

	use python && emake -C pyevdi install
}
