# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 udev

DESCRIPTION="Cross-platform CLI and Python drivers for AIO liquid coolers and other devices"
HOMEPAGE="https://pypi.org/project/liquidctl/ https://github.com/liquidctl/liquidctl"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-python/colorlog[${PYTHON_USEDEP}]
	dev-python/docopt[${PYTHON_USEDEP}]
	dev-python/hidapi[${PYTHON_USEDEP}]
	dev-python/pyusb[${PYTHON_USEDEP}]
	sys-apps/i2c-tools[python,${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

python_install_all() {
	distutils-r1_python_install_all
	dodoc docs/*.md || die
	dodoc -r docs/linux/
	udev_dorules extra/linux/71-liquidctl.rules
}
