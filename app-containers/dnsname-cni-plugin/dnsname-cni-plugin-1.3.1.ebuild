# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
MY_PN=${PN//-cni-plugin}

inherit go-module

DESCRIPTION="name resolution for containers"
HOMEPAGE="https://github.com/containers/dnsname"
SRC_URI="https://github.com/containers/${MY_PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	app-containers/podman
	app-containers/cni-plugins
	net-dns/dnsmasq
"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_PN}-${PV}"

src_install() {
	exeinto /opt/cni/bin
	doexe bin/*
	dodoc README.md README_PODMAN.md SECURITY.md
}
