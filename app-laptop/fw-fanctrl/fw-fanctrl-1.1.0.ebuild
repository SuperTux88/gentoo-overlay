# Copyright 2024-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..15} python3_13t )
inherit distutils-r1

inherit systemd

DESCRIPTION="A simple systemd service to better control Framework Laptop's fan(s)"
HOMEPAGE="https://github.com/TamtamHero/fw-fanctrl"
SRC_URI="https://github.com/TamtamHero/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="no-battery-sensors systemd"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="
	app-laptop/framework_tool
	dev-python/jsonschema
	systemd? ( sys-apps/systemd )
"
RDEPEND="
	${DEPEND}
	${PYTHON_DEPS}
"

python_compile() {
	distutils-r1_python_compile

	for file in services/${PN}.service services/${PN}-suspend.service; do
		echo "Templating ${file}"
		sed -i -e "s#%DEFAULT_PYTHON_PATH%#/usr/bin/python3#" ${file} || die
		sed -i -e "s#%PYTHON_SCRIPT_INSTALLATION_PATH%#/usr/bin/fw-fanctrl#" ${file} || die
		sed -i -e "s#%SYSCONF_DIRECTORY%#/etc#" ${file} || die
		sed -i -e "s#%NO_BATTERY_SENSOR_OPTION%#$(usex no-battery-sensors --no-battery-sensors)#" ${file} || die
	done
}

python_install_all() {
	distutils-r1_python_install_all

	if use systemd; then
		systemd_dounit "services/${PN}.service"
		systemd_dounit "services/${PN}-suspend.service"
	fi

	insinto /etc/${PN}
	doins src/fw_fanctrl/_resources/config.json
	doins src/fw_fanctrl/_resources/config.schema.json
}
