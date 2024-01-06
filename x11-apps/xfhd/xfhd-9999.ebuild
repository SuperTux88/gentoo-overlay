# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit xorg-3 git-r3

EGIT_REPO_URI="https://github.com/r41d/xfhd.git"

DESCRIPTION="xfhd is a utility for resizing an X window to Full HD"
HOMEPAGE="https://github.com/r41d/xfhd"

DEPEND="
	x11-libs/libX11
	x11-libs/libXmu
"
RDEPEND="${DEPEND}"
