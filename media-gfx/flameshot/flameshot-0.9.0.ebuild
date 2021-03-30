# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake xdg-utils

DESCRIPTION="Powerful yet simple to use screenshot software"
HOMEPAGE="https://flameshot.org"

if [[ ${PV} == 9999 ]];then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/flameshot-org/${PN}"
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/flameshot-org/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="FreeArt GPL-3+ Apache-2.0"
SLOT="0"
IUSE=""

RDEPEND="
	dev-qt/qtcore:5
	dev-qt/qtsvg:5
	dev-qt/qtnetwork:5
	dev-qt/qtdbus:5
"
DEPEND="${RDEPEND}
	dev-qt/linguist-tools:5
"

pkg_postinst() {
	xdg_desktop_database_update
	xdg_icon_cache_update
	xdg_mimeinfo_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_icon_cache_update
	xdg_mimeinfo_database_update
}
