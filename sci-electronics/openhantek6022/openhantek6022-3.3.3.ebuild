# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit xdg cmake toolchain-funcs

DESCRIPTION="DSO software for Hantek USB digital signal oscilloscopes 6022BE / BL"
HOMEPAGE="https://github.com/OpenHantek/OpenHantek6022"
SRC_URI="https://github.com/OpenHantek/OpenHantek6022/archive/${PV}.tar.gz -> ${P}.tar.gz"

S=${WORKDIR}/OpenHantek6022-${PV}

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=dev-qt/qtwidgets-5.4
	>=dev-qt/qtprintsupport-5.4
	>=dev-qt/qtopengl-5.4
	>=sci-libs/fftw-3
	virtual/libusb:1"
RDEPEND="${DEPEND}"
BDEPEND=">=dev-build/cmake-3.5"

src_configure() {
	local CXX=/usr/bin/$(tc-getCXX)
	cmake_src_configure
}

src_install () {
	cmake_src_install
	mv "${ED}/usr/share/doc/openhantek" "${ED}/usr/share/doc/${P}" || die
}
