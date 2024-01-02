# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson xdg

DESCRIPTION="A graphical application for configuring displays in Wayland compositors"
HOMEPAGE="https://github.com/artizirk/wdisplays"
SRC_URI="https://github.com/artizirk/wdisplays/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	media-libs/libepoxy
	x11-libs/gtk+:3[wayland]
"
RDEPEND="${DEPEND}"
BDEPEND="dev-libs/wayland-protocols"
