# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit desktop unpacker xdg

VER=${PV%.*}
BUILD=${PV##*.}

DESCRIPTION="Desktop utility of the DSM add-on package Synology Drive Server"
HOMEPAGE="https://www.synology.com/en-global/releaseNote/SynologyDriveClient"
SRC_URI="https://global.synologydownload.com/download/Utility/SynologyDriveClient/${VER}-${BUILD}/Ubuntu/Installer/${PN}-${BUILD}.x86_64.deb"

S="${WORKDIR}"

LICENSE="Synology"
SLOT="0"
KEYWORDS="~amd64"
IUSE="nautilus"

DEPEND="
	>=dev-libs/glib-2.16.0:2
	>=x11-libs/gtk+-2.12.0:2

	nautilus? ( gnome-base/nautilus )
"
RDEPEND="${DEPEND}"

RESTRICT="bindist mirror strip"
QA_PREBUILT="*"
REQUIRES_EXCLUDE="/opt/Synology/SynologyDrive/package/cloudstation/icon-overlay/14/lib/plugin-cb.so"

src_unpack() {
	unpack_deb ${A}
}

src_install() {
	insinto /opt
	doins -r opt/Synology

	# Fix permissions
	chmod +x "${ED}"/opt/Synology/SynologyDrive/bin/launcher || die
	chmod +x "${ED}"/opt/Synology/SynologyDrive/package/cloudstation/bin/cloud-drive-* || die
	chmod +x "${ED}"/opt/Synology/SynologyDrive/package/cloudstation/bin/get_system_proxy.sh || die
	chmod +x "${ED}"/opt/Synology/SynologyDrive/package/cloudstation/package/start-stop || die

	exeinto /usr/bin
	doexe usr/bin/synology-drive

	domenu usr/share/applications/synology-drive.desktop

	if use nautilus; then
		insinto /usr/lib64/nautilus/extensions-4
		doins usr/lib/nautilus/extensions-4/libnautilus-drive-extension-4.so
	fi

	insinto /usr/share
	doins -r usr/share/icons

	dodoc usr/share/doc/synology-drive/copyright
}
