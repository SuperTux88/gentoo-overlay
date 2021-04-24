# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit linux-info git-r3
EGIT_REPO_URI="https://github.com/ocerman/zenmonitor.git"
EGIT_BRANCH="master"

DESCRIPTION="Monitoring software for AMD Zen-based CPUs"
HOMEPAGE="https://github.com/ocerman/zenmonitor"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

CONFIG_CHECK="X86_MSR"

DEPEND="sys-kernel/zenpower"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dosbin zenmonitor
}
