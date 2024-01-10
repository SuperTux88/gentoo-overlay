# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ARGOAT_COMMIT="e1844c4c94b70bb351ec2bd2ac6bb320ee793d8f"
CONFIGATOR_COMMIT="8cec1786196ae6f6a8b35e66181277457f2a2bb2"
DRAGONFAIL_COMMIT="15bd3299bf3e49bd6734bff385cb0392cd2fa502"
TERMBOX_NEXT_COMMIT="d961a8122210010e7c2c8f201e61170c13d319b4"

DESCRIPTION="a TUI display manager"
HOMEPAGE="https://github.com/fairyglade/ly"
SRC_URI="
	https://github.com/fairyglade/ly/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/nullgemm/argoat/archive/${ARGOAT_COMMIT}.tar.gz -> argoat-${ARGOAT_COMMIT}.tar.gz
	https://github.com/nullgemm/configator/archive/${CONFIGATOR_COMMIT}.tar.gz -> configator-${CONFIGATOR_COMMIT}.tar.gz
	https://github.com/nullgemm/dragonfail/archive/${DRAGONFAIL_COMMIT}.tar.gz -> dragonfail-${DRAGONFAIL_COMMIT}.tar.gz
	https://github.com/nullgemm/termbox_next/archive/${TERMBOX_NEXT_COMMIT}.tar.gz ->
		termbox_next-${TERMBOX_NEXT_COMMIT}.tar.gz
"

LICENSE="WTFPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="openrc runit systemd"

DEPEND="sys-libs/pam
		x11-libs/libxcb
		x11-base/xorg-server
		x11-apps/xauth"
RDEPEND="${DEPEND}
		openrc? ( sys-apps/openrc )
		runit? ( sys-process/runit )
		systemd? ( sys-apps/systemd )"

src_unpack() {
	default

	rm -d "${P}/sub/argoat" || die
	mv "argoat-${ARGOAT_COMMIT}" "${P}/sub/argoat" || die

	rm -d "${P}/sub/configator" || die
	mv "configator-${CONFIGATOR_COMMIT}" "${P}/sub/configator" || die

	rm -d "${P}/sub/dragonfail" || die
	mv "dragonfail-${DRAGONFAIL_COMMIT}" "${P}/sub/dragonfail" || die

	rm -d "${P}/sub/termbox_next" || die
	mv "termbox_next-${TERMBOX_NEXT_COMMIT}" "${P}/sub/termbox_next" || die
}

src_install(){
	default

	use openrc && emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install installopenrc
	use runit && emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install installrunit
	use systemd && emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install installsystemd
}
