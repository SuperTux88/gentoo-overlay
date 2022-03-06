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
IUSE=""

DEPEND="
	media-video/obs-studio
	gui-libs/wlroots"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"

src_install() {
	insinto /usr/lib64/obs-plugins
	doins "${BUILD_DIR}/libwlrobs.so"
}
