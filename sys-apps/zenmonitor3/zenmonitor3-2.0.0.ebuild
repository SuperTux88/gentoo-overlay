# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit linux-info

DESCRIPTION="Monitoring software for AMD Zen-based CPUs with Zen 3 support"
HOMEPAGE="https://github.com/Ta180m/zenmonitor3"
SRC_URI="https://github.com/Ta180m/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cli"

CONFIG_CHECK="X86_MSR"

DEPEND="
	!!sys-apps/zenmonitor
	sys-kernel/zenpower
"
RDEPEND="${DEPEND}"

src_prepare() {
	default_src_prepare

	use cli && eapply "${FILESDIR}"/${PN}-cli-tinfo-fix.patch
}

src_compile() {
	default_src_compile

	use cli && emake build-cli
}

src_install() {
	dosbin zenmonitor

	use cli && dosbin zenmonitor-cli
}
