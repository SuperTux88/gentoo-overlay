# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3
EGIT_REPO_URI="https://github.com/anyc/skiller-ctl.git"
EGIT_BRANCH="master"

DESCRIPTION="Control the additional features of Sharkoon Skiller (Pro/Pro+) keyboards"
HOMEPAGE="https://github.com/anyc/skiller-ctl"
SRC_URI=""

LICENSE="GPL-2 GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="virtual/libusb:1"
DEPEND="${RDEPEND}"
