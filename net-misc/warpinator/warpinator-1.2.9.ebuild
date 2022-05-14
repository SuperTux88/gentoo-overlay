# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Share files across the LAN"
HOMEPAGE="https://github.com/linuxmint/warpinator"
SRC_URI="https://github.com/linuxmint/${PN}/archive/${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

inherit meson gnome2-utils xdg

DEPEND="
	dev-libs/gobject-introspection
	dev-python/cryptography
	dev-python/grpcio
	dev-python/netifaces
	dev-python/pynacl
	dev-python/python3-xapp
	dev-python/setproctitle
	dev-python/zeroconf
"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-util/meson
	dev-python/grpcio-tools
	dev-python/protobuf-python
"

src_configure() {
	local emesonargs=(
		-Dbundle-zeroconf=false
	)
	meson_src_configure
}

pkg_postinst() {
	xdg_pkg_postinst
	gnome2_schemas_update
}

pkg_postrm() {
	xdg_pkg_postinst
	gnome2_schemas_update
}
