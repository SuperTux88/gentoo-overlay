# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module shell-completion

DESCRIPTION="Not FPM - a simple deb, rpm, apk, ipk, and arch linux packager written in Go"
HOMEPAGE="https://nfpm.goreleaser.com"
SRC_URI="
	https://github.com/goreleaser/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://raw.githubusercontent.com/SuperTux88/gentoo-overlay-deps/main/${CATEGORY}/${PN}/${P}-vendor.tar.xz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

src_compile() {
	cd cmd/${PN}
	ego build

	./${PN} man > ${PN}.1

	./${PN} completion bash > ${PN}.bash
	./${PN} completion zsh > ${PN}.zsh
	./${PN} completion fish > ${PN}.fish
}

src_install() {
	dobin cmd/${PN}/${PN}

	doman cmd/${PN}/${PN}.1

	newbashcomp cmd/${PN}/${PN}.bash ${PN}
	newzshcomp cmd/${PN}/${PN}.zsh _${PN}
	dofishcomp cmd/${PN}/${PN}.fish
}
