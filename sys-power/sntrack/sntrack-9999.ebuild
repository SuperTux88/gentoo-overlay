# Copyright 2024-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..14} python3_13t )
inherit python-single-r1

DESCRIPTION="Tracks the battery discharge rate during sleep"
HOMEPAGE="https://github.com/xsmile/sntrack"

inherit git-r3
EGIT_REPO_URI="${HOMEPAGE}.git"

LICENSE="GPL-3"
SLOT="0"
IUSE="systemd"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="
	>=dev-python/matplotlib-3.5.0

	systemd? ( sys-apps/systemd )
"
RDEPEND="
	${DEPEND}
	${PYTHON_DEPS}
"

PATCHES=( "${FILESDIR}"/history-db-path.patch )

src_install() {
	exeinto /usr/bin
	newexe main.py ${PN}

	keepdir /var/lib/${PN}

	use systemd && dosym "/usr/bin/${PN}" /usr/lib/systemd/system-sleep/${PN}

	dodoc README.md
}
