# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..13} )
inherit python-single-r1

inherit systemd

DESCRIPTION="A simple systemd service to better control Framework Laptop's fan(s)"
HOMEPAGE="https://github.com/TamtamHero/fw-fanctrl"

inherit git-r3
EGIT_REPO_URI="${HOMEPAGE}.git"

LICENSE="BSD"
SLOT="0"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="
	app-laptop/fw-ectool
	sys-apps/systemd
"
RDEPEND="
	${DEPEND}
	${PYTHON_DEPS}
"

src_compile() {
	for file in services/${PN}.service services/system-sleep/${PN}-suspend; do
		echo "Templating ${file}"
		sed -i -e "s#%PREFIX_DIRECTORY%#/usr#" ${file} || die
		sed -i -e "s#%SYSCONF_DIRECTORY%#/etc#" ${file} || die
	done
}

src_install() {
	exeinto /usr/bin
	newexe fanctrl.py ${PN}

	systemd_dounit "services/${PN}.service"

	exeinto "$(systemd_get_sleepdir)"
	doexe services/system-sleep/${PN}-suspend

	insinto /etc/${PN}
	doins config.json

	einstalldocs
}
