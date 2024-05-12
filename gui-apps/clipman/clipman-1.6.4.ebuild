# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="A simple clipboard manager for Wayland"
HOMEPAGE="https://github.com/chmouel/clipman"
SRC_URI="
	https://github.com/chmouel/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://raw.githubusercontent.com/SuperTux88/gentoo-overlay-deps/main/gui-apps/clipman/${P}-deps.tar.xz
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

src_compile() {
	ego build
}

src_install() {
	dobin ${PN}

	doman docs/${PN}.1
}
