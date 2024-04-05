# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="wayland event viewer"
HOMEPAGE="https://git.sr.ht/~sircmpwn/wev"
SRC_URI="https://git.sr.ht/~sircmpwn/wev/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/wayland
	dev-libs/wayland-protocols
	x11-libs/libxkbcommon[wayland]
"
RDEPEND="${DEPEND}"
BDEPEND="
	app-text/scdoc
	dev-util/wayland-scanner
	virtual/pkgconfig
"

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
	einstalldocs
}
