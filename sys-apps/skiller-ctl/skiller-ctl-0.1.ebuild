# Copyright 1999-2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Control the additional features of Sharkoon Skiller (Pro/Pro+) keyboards"
HOMEPAGE="https://github.com/anyc/skiller-ctl"
SRC_URI="https://github.com/anyc/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2 GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="virtual/libusb:1"
RDEPEND="${DEPEND}"
