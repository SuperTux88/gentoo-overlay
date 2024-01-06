# Copyright 1999-2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3
EGIT_REPO_URI="https://github.com/anyc/skiller-ctl.git"
EGIT_BRANCH="master"

DESCRIPTION="Control the additional features of Sharkoon Skiller (Pro/Pro+) keyboards"
HOMEPAGE="https://github.com/anyc/skiller-ctl"

LICENSE="GPL-2 GPL-3"
SLOT="0"

DEPEND="virtual/libusb:1"
RDEPEND="${DEPEND}"
