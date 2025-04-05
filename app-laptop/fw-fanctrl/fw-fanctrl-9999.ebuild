# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..13} python3_13t )
inherit distutils-r1

inherit systemd

DESCRIPTION="A simple systemd service to better control Framework Laptop's fan(s)"
HOMEPAGE="https://github.com/TamtamHero/fw-fanctrl"

inherit git-r3
EGIT_REPO_URI="${HOMEPAGE}.git"

LICENSE="BSD"
SLOT="0"
IUSE="no-battery-sensors"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="
	app-laptop/fw-ectool
	dev-python/jsonschema
	sys-apps/systemd
"
RDEPEND="
	${DEPEND}
	${PYTHON_DEPS}
"

python_compile() {
	distutils-r1_python_compile

	for file in services/${PN}.service services/system-sleep/${PN}-suspend; do
		echo "Templating ${file}"
		sed -i -e "s#%DEFAULT_PYTHON_PATH%#/usr/bin/python3#" ${file} || die
		sed -i -e "s#%PYTHON_SCRIPT_INSTALLATION_PATH%#/usr/bin/fw-fanctrl#" ${file} || die
		sed -i -e "s#%SYSCONF_DIRECTORY%#/etc#" ${file} || die
		sed -i -e "s#%NO_BATTERY_SENSOR_OPTION%#$(usex no-battery-sensors --no-battery-sensors)#" ${file} || die
	done
}

python_install_all() {
	distutils-r1_python_install_all

	systemd_dounit "services/${PN}.service"

	exeinto "$(systemd_get_sleepdir)"
	doexe services/system-sleep/${PN}-suspend

	insinto /etc/${PN}
	doins src/fw_fanctrl/_resources/config.json
	doins src/fw_fanctrl/_resources/config.schema.json
}
