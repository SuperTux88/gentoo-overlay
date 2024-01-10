# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="a TUI display manager"
HOMEPAGE="https://github.com/fairyglade/ly"
EGIT_REPO_URI="https://github.com/fairyglade/ly.git"

LICENSE="WTFPL-2"
SLOT="0"
IUSE="openrc runit systemd"

DEPEND="sys-libs/pam
		x11-libs/libxcb
		x11-base/xorg-server
		x11-apps/xauth"
RDEPEND="${DEPEND}
		openrc? ( sys-apps/openrc )
		runit? ( sys-process/runit )
		systemd? ( sys-apps/systemd )"

src_install(){
	default

	use openrc && emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install installopenrc
	use runit && emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install installrunit
	use systemd && emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install installsystemd
}
