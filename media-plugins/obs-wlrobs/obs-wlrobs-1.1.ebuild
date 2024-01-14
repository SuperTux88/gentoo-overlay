# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
MY_PN=${PN#obs-}

inherit meson

DESCRIPTION="An obs-studio plugin for screen capture on wlroots based wayland compositors"
HOMEPAGE="https://hg.sr.ht/~scoopta/wlrobs"
SRC_URI="https://hg.sr.ht/~scoopta/${MY_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+dmabuf +scpy"

DEPEND="
	dev-libs/wayland
	media-video/obs-studio
	dmabuf? ( x11-libs/libdrm )
"
RDEPEND="${DEPEND}"
BDEPEND="
	virtual/pkgconfig
"

S="${WORKDIR}/${MY_PN}-v${PV}"

src_configure() {
	local emesonargs=(
		$(meson_use dmabuf use_dmabuf)
		$(meson_use scpy use_scpy)
	)
	meson_src_configure
}
