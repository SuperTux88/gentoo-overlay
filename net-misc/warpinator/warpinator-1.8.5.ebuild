# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Share files across the LAN"
HOMEPAGE="https://github.com/linuxmint/warpinator"
SRC_URI="https://github.com/linuxmint/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

inherit meson gnome2-utils xdg optfeature linux-info

DEPEND="
	dev-libs/gobject-introspection
	dev-python/cryptography
	>=dev-python/grpcio-1.16.0
	dev-python/ifaddr
	dev-python/netaddr
	dev-python/netifaces
	dev-python/protobuf-python
	dev-python/pygobject
	dev-python/pynacl
	>=dev-python/python3-xapp-1.6.0
	dev-python/qrcode
	dev-python/setproctitle
	>=dev-python/zeroconf-0.27.0
	x11-libs/gtk+:3
"
RDEPEND="${DEPEND}"
BDEPEND="
	>=dev-build/meson-0.45.0
	>=dev-python/protobuf-python-3.6.1
"

CONFIG_CHECK="~SECURITY_LANDLOCK"
WARNING_SECURITY_LANDLOCK="SECURITY_LANDLOCK: enable to use landlock for incoming file isolation"

src_configure() {
	local emesonargs=(
		-Dbundle-zeroconf=false
		-Dbundle-grpc=false
	)
	meson_src_configure
}

pkg_postinst() {
	xdg_pkg_postinst
	gnome2_schemas_update

	optfeature "use bubblewrap for incoming file isolation" sys-apps/bubblewrap
}

pkg_postrm() {
	xdg_pkg_postinst
	gnome2_schemas_update
}
