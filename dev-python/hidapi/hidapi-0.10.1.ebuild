# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
DISTUTILS_USE_SETUPTOOLS="rdepend"
inherit distutils-r1

DESCRIPTION="Python wrapper for the HIDAPI"
HOMEPAGE="https://pypi.org/project/hidapi/ https://github.com/trezor/cython-hidapi"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="|| ( BSD GPL-3 )"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-python/cython[${PYTHON_USEDEP}]
	dev-libs/hidapi
"
RDEPEND="${DEPEND}"

distutils_enable_tests pytest
