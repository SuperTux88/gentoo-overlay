# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="Directory/File, DNS and VHost busting tool written in Go"
HOMEPAGE="https://github.com/OJ/gobuster"
SRC_URI="
	https://github.com/OJ/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://raw.githubusercontent.com/SuperTux88/gentoo-overlay-deps/main/${CATEGORY}/${PN}/${P}-vendor.tar.xz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

src_install() {
	dobin ${PN}
}
