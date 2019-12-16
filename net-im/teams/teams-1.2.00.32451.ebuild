# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit unpacker xdg-utils

DESCRIPTION="Microsoft Teams for Linux is your chat-centered workspace in Office 365"
HOMEPAGE="https://aka.ms/microsoftteams"
SRC_URI="https://packages.microsoft.com/repos/ms-teams/pool/main/${PN:0:1}/${PN}/${PN}_${PV}_amd64.deb"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="
	${DEPEND}
	media-libs/alsa-lib
	dev-libs/atk
	x11-libs/cairo
	net-print/cups
	dev-libs/expat
	x11-libs/gdk-pixbuf
	dev-libs/glib
	x11-libs/gtk+:3
	dev-libs/nspr
	dev-libs/nss
	x11-libs/pango
	app-crypt/libsecret
	sys-apps/util-linux
	x11-libs/libX11
	x11-libs/libxcb
	x11-libs/libXcomposite
	x11-libs/libXcursor
	x11-libs/libXdamage
	x11-libs/libXfixes
	x11-libs/libXi
	x11-libs/libxkbfile
	x11-libs/libXrandr
	x11-libs/libXrender
	x11-libs/libXScrnSaver
	x11-libs/libXtst
	media-libs/fontconfig
	sys-apps/dbus"
BDEPEND=""

S=${WORKDIR}

src_install() {
	insinto /usr/share/teams
	doins -r usr/share/teams/*
	fperms +x /usr/share/teams/teams

	insinto /usr/share/pixmaps
	doins usr/share/pixmaps/teams.png

	insinto /usr/share/applications
	doins usr/share/applications/teams.desktop

	into /usr
	dobin usr/bin/teams
}

pkg_postinst() {
	xdg_mimeinfo_database_update
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_mimeinfo_database_update
	xdg_desktop_database_update
}
