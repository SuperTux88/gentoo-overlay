# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CHROMIUM_LANGS="
	af am ar bg bn ca cs da de el en-GB en-US es es-419 et fa fi fil fr gu he
	hi hr hu id it ja kn ko lt lv ml mr ms nb nl pl pt-BR pt-PT ro ru sk sl sr
	sv sw ta te th tr uk ur vi zh-CN zh-TW
"

inherit chromium-2 desktop unpacker xdg

PN_CASE="OpenLens"
VER=${PV%.*}
BUILD=${PV##*.}

DESCRIPTION="Open Source IDE for Kubernetes"
HOMEPAGE="https://github.com/MuhammedKalkan/OpenLens https://github.com/lensapp/lens"
SRC_URI="https://github.com/MuhammedKalkan/${PN_CASE}/releases/download/v${VER}-${BUILD}/${PN_CASE}-${VER}-${BUILD}.amd64.deb"

LICENSE="MIT"
# Electron bundles a bunch of things
LICENSE+="
	MIT BSD BSD-2 BSD-4 AFL-2.1 Apache-2.0 Ms-PL GPL-2 LGPL-2.1 APSL-2
	unRAR OFL CC-BY-SA-3.0 MPL-2.0 android public-domain all-rights-reserved
"

SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	app-accessibility/at-spi2-core:2
	app-crypt/libsecret
	dev-libs/expat
	dev-libs/glib
	dev-libs/nspr
	dev-libs/nss
	media-libs/mesa
	sys-apps/dbus
	sys-apps/util-linux
	x11-libs/cairo
	x11-libs/gtk+:3
	x11-libs/libnotify
	x11-libs/libX11
	x11-libs/libXScrnSaver
	x11-libs/libXtst
	x11-libs/pango
	x11-misc/xdg-utils
"
RDEPEND="${DEPEND}"

RESTRICT="bindist mirror"
QA_PREBUILT="opt/${PN_CASE}/*"
QA_PRESTRIPPED="/opt/OpenLens/resources/x64/helm /opt/OpenLens/resources/x64/kubectl"

S="${WORKDIR}"

src_unpack() {
	unpack_deb ${A}
}

pkg_pretend() {
	chromium_suid_sandbox_check_kernel_config
}

src_prepare() {
	default
	# cleanup languages
	pushd "opt/${PN_CASE}/locales" || die
	chromium_remove_language_paks
	popd || die
}

src_configure() {
	chromium_suid_sandbox_check_kernel_config
	default
}

src_install() {
	pushd "opt/${PN_CASE}" || die
	local DESTDIR="/opt/${PN_CASE}"

	exeinto "${DESTDIR}"
	doexe chrome-sandbox chrome_crashpad_handler ${PN} *.so*

	insinto "${DESTDIR}"
	doins *.pak *.bin *.json *.dat
	doins -r locales resources

	popd

	# Fix permissions
	chmod +x "${ED}"/opt/${PN_CASE}/resources/x64/* || die

	# SUID chrome-sandbox for Electron 5+
	# see https://github.com/electron/electron/issues/17972
	fperms 4755 "${DESTDIR}"/chrome-sandbox

	dosym "${DESTDIR}/${PN}" /usr/bin/${PN}
	domenu usr/share/applications/${PN}.desktop

	for size in 512; do
		doicon -s ${size} "usr/share/icons/hicolor/${size}x${size}/apps/${PN}.png"
	done

	gunzip usr/share/doc/${PN}/changelog.gz
	dodoc usr/share/doc/${PN}/changelog
	dodoc opt/${PN_CASE}/LICENSE.electron.txt
	dodoc opt/${PN_CASE}/LICENSES.chromium.html
}
