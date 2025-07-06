# Copyright 2024-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..14} python3_13t )
inherit python-single-r1

COMMIT_HASH="5ad0395be1aa457aa9a4128b358a4b005ffde3bf"

DESCRIPTION="S0i3/s2idle analysis script for AMD systems"
HOMEPAGE="https://gitlab.freedesktop.org/drm/amd/-/blob/master/scripts/amd_s2idle.py"
SRC_URI="https://gitlab.freedesktop.org/drm/amd/-/raw/${COMMIT_HASH}/scripts/amd_s2idle.py?inline=false -> ${P}.py"

S="${DISTDIR}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="systemd"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="
	dev-python/pyudev
	sys-apps/ethtool
	sys-power/iasl
	systemd? ( dev-python/python-systemd )
"
RDEPEND="
	${DEPEND}
	${PYTHON_DEPS}
"

src_install() {
	exeinto /usr/bin
	newexe ${P}.py ${PN}.py
}
