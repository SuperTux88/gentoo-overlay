# Copyright 2024-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="Systemd integration for Sway session"
HOMEPAGE="https://github.com/alebastr/sway-systemd"
SRC_URI="https://github.com/alebastr/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="autostart locale1"

DEPEND="
	gui-wm/sway
"
RDEPEND="
	${DEPEND}
	dev-python/dbus-next
	dev-python/tenacity
	sys-apps/dbus
"

join_comma() {
	local IFS=','
	echo "${*}"
}

src_configure() {
	local args=(
		$(usev autostart)
		$(usev locale1)
	)
	local emesonargs=(
		-Dautoload-configs=$(join_comma ${args[@]})
	)
	meson_src_configure
}

pkg_postinst(){
	if ! has_version sys-apps/systemd; then
		ewarn "${PN} is not functional without sys-apps/systemd."
	fi
}
