# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit linux-info

DESCRIPTION="Monitoring software for AMD Zen-based CPUs"
HOMEPAGE="https://github.com/ocerman/zenmonitor"
SRC_URI="https://github.com/ocerman/${PN}/archive/v${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

CONFIG_CHECK="X86_MSR"

DEPEND="sys-kernel/zenpower"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dosbin zenmonitor
}
