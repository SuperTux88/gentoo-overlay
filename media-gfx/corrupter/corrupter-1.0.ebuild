# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="Simple image glitcher suitable for producing nice looking lockscreens"
HOMEPAGE="https://github.com/r00tman/corrupter"
SRC_URI="
	https://github.com/r00tman/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://raw.githubusercontent.com/r00tman/corrupter/6876699cdcdbbfc16d4c88a7edba01a5efb2c229/go.mod -> ${P}-go.mod
"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

src_unpack() {
	default_src_unpack

	cp "${DISTDIR}/${P}-go.mod" "${S}/go.mod"
}

src_compile() {
	default_src_compile

	ego build
}

src_install() {
	default_src_install

	dobin corrupter
}
