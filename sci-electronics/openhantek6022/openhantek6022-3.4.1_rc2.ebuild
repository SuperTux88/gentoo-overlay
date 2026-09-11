# Copyright 2022-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit xdg cmake toolchain-funcs

DESCRIPTION="DSO software for Hantek USB digital signal oscilloscopes 6022BE / BL"
HOMEPAGE="https://github.com/OpenHantek/OpenHantek6022"
MY_PV=${PV/_/-}
SRC_URI="https://github.com/OpenHantek/OpenHantek6022/archive/${MY_PV}.tar.gz -> ${P}.tar.gz"

S=${WORKDIR}/OpenHantek6022-${MY_PV}

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=dev-qt/qtbase-6.2.0:6[gui,opengl,widgets]
	>=sci-libs/fftw-3
	virtual/libusb:1"
RDEPEND="${DEPEND}"
BDEPEND="
	>=dev-build/cmake-3.12
	dev-qt/qttools:6[linguist]"

src_configure() {
	local CXX=/usr/bin/$(tc-getCXX)
	cmake_src_configure
}

src_install () {
	cmake_src_install
	mv "${ED}/usr/share/doc/openhantek" "${ED}/usr/share/doc/${P}" || die
}
