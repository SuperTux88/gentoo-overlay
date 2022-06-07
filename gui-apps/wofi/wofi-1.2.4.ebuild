# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="Launcher/menu program for wlroots based wayland compositors such as sway"
HOMEPAGE="https://hg.sr.ht/~scoopta/wofi"
SRC_URI="https://hg.sr.ht/~scoopta/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+run +drun +dmenu"

DEPEND="
	dev-libs/wayland
	x11-libs/gtk+[wayland(-)]
"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"

S="${WORKDIR}/${PN}-v${PV}"

src_configure() {
	local emesonargs=(
		$(meson_use run enable_run)
		$(meson_use drun enable_drun)
		$(meson_use dmenu enable_dmenu)
	)
	meson_src_configure
}
