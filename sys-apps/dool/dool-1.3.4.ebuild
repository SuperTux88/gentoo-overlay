# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..13} python3_13t )

inherit python-r1

DESCRIPTION="Versatile replacement for vmstat, iostat and ifstat (clone of dstat)"
HOMEPAGE="https://github.com/scottchiefbaker/dool"
SRC_URI="https://github.com/scottchiefbaker/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc examples"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}
	dev-python/six[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}"

PATCHES=(
	"${FILESDIR}/${PN}-bytes-by-default.patch" # https://github.com/scottchiefbaker/dool/issues/13
)

src_install() {
	python_foreach_impl python_doscript "${PN}"

	insinto "/usr/share/${PN}"
	newins "${PN}" "${PN}.py"
	doins "plugins/${PN}_"*.py

	doman "docs/${PN}.1"

	einstalldocs

	if use examples; then
		dodoc examples/{mstat,read}.py
	fi
	if use doc; then
		dodoc docs/*.html
	fi
}

src_test() {
	python_foreach_impl emake test
}
