# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop unpacker xdg

VER=${PV%.*}
BUILD=${PV##*.}

DESCRIPTION="Open Source IDE for Kubernetes"
HOMEPAGE="https://github.com/MuhammedKalkan/OpenLens https://github.com/lensapp/lens"
SRC_URI="https://github.com/MuhammedKalkan/OpenLens/releases/download/v${VER}-${BUILD}/OpenLens-${VER}-${BUILD}.amd64.deb"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	app-accessibility/at-spi2-core
	app-crypt/libsecret
	dev-libs/nss
	sys-apps/util-linux
	x11-libs/gtk+:3
	x11-libs/libnotify
	x11-libs/libXScrnSaver
	x11-libs/libXtst
	x11-misc/xdg-utils
"
RDEPEND="${DEPEND}"

RESTRICT="bindist mirror"
QA_PRESTRIPPED="/opt/OpenLens/resources/x64/helm /opt/OpenLens/resources/x64/kubectl"

S="${WORKDIR}"

src_unpack() {
	unpack_deb ${A}
}

src_install() {
	insinto /opt
	doins -r opt/OpenLens

	# Fix permissions
	chmod +x "${ED}"/opt/OpenLens/open-lens || die
	chmod +x "${ED}"/opt/OpenLens/chrome_crashpad_handler || die
	chmod +x "${ED}"/opt/OpenLens/resources/x64/* || die

	# SUID chrome-sandbox for Electron 5+
	chmod 4755 "${ED}"/opt/OpenLens/chrome-sandbox || die

	dosym "../../opt/OpenLens/open-lens" /usr/bin/open-lens
	domenu usr/share/applications/open-lens.desktop

	insinto /usr/share
	doins -r usr/share/icons

	gunzip usr/share/doc/open-lens/changelog.gz
	dodoc usr/share/doc/open-lens/changelog
}
