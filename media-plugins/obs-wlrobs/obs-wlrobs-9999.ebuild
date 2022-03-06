# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit mercurial
EHG_REPO_URI="https://hg.sr.ht/~scoopta/wlrobs"

inherit meson

DESCRIPTION="An obs-studio plugin for screen capture on wlroots based wayland compositors"
HOMEPAGE="https://hg.sr.ht/~scoopta/wlrobs"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="+dmabuf +scpy"

DEPEND="
	dev-libs/wayland
	media-video/obs-studio
	dmabuf? ( x11-libs/libdrm )
"
RDEPEND="${DEPEND}"
BDEPEND="
	virtual/pkgconfig
	dev-util/meson
"

src_configure() {
	local emesonargs=(
		$(meson_use dmabuf use_dmabuf)
		$(meson_use scpy use_scpy)
	)
	meson_src_configure
}
