# Copyright 2023-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake shell-completion

DESCRIPTION="A simple Wayland output mirror client"
HOMEPAGE="https://github.com/Ferdi265/wl-mirror"
SRC_URI="https://github.com/Ferdi265/${PN}/releases/download/v${PV}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

IUSE="+dmabuf man"

DEPEND="
	gui-libs/libdecor
	gui-libs/wlroots
	dev-libs/wayland-protocols
	dev-libs/wayland
	dev-util/wayland-scanner
	media-libs/libglvnd
	dmabuf? (
		media-libs/mesa[opengl]
		x11-libs/libdrm
	)
	man? ( app-text/scdoc )
"
RDEPEND="${DEPEND}"

src_configure() {
	mycmakeargs=(
		-DWITH_LIBDECOR=ON
		-DWITH_GBM=$(usex dmabuf ON OFF)
		-DINSTALL_DOCUMENTATION=$(usex man ON OFF)
		-DFORCE_SYSTEM_WL_PROTOCOLS=ON
		-DFORCE_SYSTEM_WLR_PROTOCOLS=OFF
		-DINSTALL_EXAMPLE_SCRIPTS=ON
	)

	cmake_src_configure
}

src_install() {
	cmake_src_install

	newbashcomp scripts/completions/bash-completions/_${PN} ${PN}
	newbashcomp scripts/completions/bash-completions/_wl-present wl-present
	dozshcomp scripts/completions/zsh-completions/_${PN}
	dozshcomp scripts/completions/zsh-completions/_wl-present
}
