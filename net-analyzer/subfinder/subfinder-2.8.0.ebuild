# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="Fast passive subdomain enumeration tool"
HOMEPAGE="https://github.com/projectdiscovery/subfinder"
SRC_URI="
	https://github.com/projectdiscovery/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://raw.githubusercontent.com/SuperTux88/gentoo-overlay-deps/main/${CATEGORY}/${PN}/${P}-vendor.tar.xz
"

S="${WORKDIR}/${P}/v2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

src_install() {
	dobin ${PN}
}
