# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit font

DESCRIPTION="A TrueType version of Terminus Font"
HOMEPAGE="https://files.ax86.net/terminus-ttf/"
SRC_URI="https://files.ax86.net/terminus-ttf/files/${PV}/${P}.zip"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="app-arch/unzip"

FONT_SUFFIX="ttf"