# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Unofficial client for Microsoft Teams for Linux"
HOMEPAGE="https://github.com/IsmaelMartinez/teams-for-linux"
SRC_URI="https://github.com/IsmaelMartinez/teams-for-linux/releases/download/v${PV}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dodir /opt/teams-for-linux
	cp -R "${WORKDIR}/teams-for-linux-${PV}/." "${D}/opt/teams-for-linux/" || die "Install failed!"
	dosym "../../opt/teams-for-linux/teams-for-linux" /usr/bin/teams-for-linux
}
