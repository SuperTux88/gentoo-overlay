# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1
distutils_enable_tests pytest

DESCRIPTION="A script to run docker-compose.yml using podman"
HOMEPAGE="https://github.com/containers/podman-compose"
SRC_URI="https://github.com/containers/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/python-dotenv[${PYTHON_USEDEP}]
"
RDEPEND="
	${DEPEND}
	app-containers/podman
	app-containers/netavark
	app-containers/aardvark-dns
"
