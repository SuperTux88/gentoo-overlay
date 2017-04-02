# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit xorg-2 git-r3

EGIT_REPO_URI="https://github.com/r41d/xfhd.git"

DESCRIPTION="xfhd is a utility for resizing an X window to Full HD"
HOMEPAGE="https://github.com/r41d/xfhd"
SRC_URI=""

KEYWORDS=""
IUSE=""

RDEPEND="x11-libs/libX11
	x11-libs/libXmu"
DEPEND="${RDEPEND}"
