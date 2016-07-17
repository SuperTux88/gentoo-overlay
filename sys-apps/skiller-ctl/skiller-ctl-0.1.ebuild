# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

DESCRIPTION="Control the additional features (e.g., LEDs) of Sharkoon Skiller (Pro/Pro+) keyboards"
HOMEPAGE="https://github.com/anyc/skiller-ctl"
SRC_URI="https://github.com/anyc/${PN}/archive/v${PV}.tar.gz"

LICENSE="GPL-2 GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="virtual/libusb:1"
DEPEND="${RDEPEND}"

