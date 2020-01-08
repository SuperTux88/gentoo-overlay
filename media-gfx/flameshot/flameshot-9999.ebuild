# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit qmake-utils toolchain-funcs

DESCRIPTION="Powerful yet simple to use screenshot software for GNU/Linux"
HOMEPAGE="https://github.com/lupoDharkael/flameshot"

if [[ ${PV} == 9999 ]];then
	inherit git-r3
	EGIT_REPO_URI="${HOMEPAGE}"
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="${HOMEPAGE}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm ~x86"
fi

LICENSE="FreeArt GPL-3+ Apache-2.0"
SLOT="0"
IUSE=""

RDEPEND="
	>=dev-qt/qtcore-5.3.0:5
	>=dev-qt/qtdbus-5.3.0:5
	>=dev-qt/qtnetwork-5.3.0:5
	>=dev-qt/qtwidgets-5.3.0:5
"
DEPEND="${RDEPEND}
	>=dev-qt/linguist-tools-5.3.0:5
"

src_prepare(){
	[[ ${PV} != 9999 ]] && sed -i "s#\(VERSION = \).*#\1${PV}#" ${PN}.pro
	sed -i "s#icons#pixmaps#" ${PN}.pro
	sed -i "s#^Icon=.*#Icon=${PN}#" "docs/desktopEntry/package/${PN}.desktop" \
		"snap/gui/${PN}.desktop" \
		"snap/gui/${PN}-init.desktop"
	eapply_user
}

src_configure(){
	if tc-is-gcc && ver_test "$(gcc-version)" -lt 4.9.2 ;then
		die "You need at least GCC 4.9.2 to build this package"
	fi
	eqmake5 "CONFIG+=packaging" ${PN}.pro
}

src_install(){
	emake INSTALL_ROOT="${D}" install
}
