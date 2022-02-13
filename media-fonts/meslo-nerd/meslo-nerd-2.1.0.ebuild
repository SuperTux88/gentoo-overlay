# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit font

DESCRIPTION="Nerd Font build of Apple's Menlo font, patched by ryanoasis"
HOMEPAGE="https://github.com/ryanoasis/nerd-fonts"
SRC_URI="https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Meslo.zip"

LICENSE="Apache-2.0 MIT OFL-1.1"
SLOT="0"
KEYWORDS="~amd64"

IUSE="+lgs lgm lgl +wide mono"
REQUIRED_USE="|| ( lgs lgm lgl ) || ( wide mono )"

BDEPEND="app-arch/unzip"

FONT_SUFFIX="ttf"

S="${WORKDIR}"

src_prepare() {
	default_src_prepare

	rm "${S}/"*"Windows Compatible.ttf"
	rm "${S}/"*" DZ "*.ttf
	if ! use lgs; then
		rm "${S}/Meslo LG S "*.ttf
	fi
	if ! use lgm; then
		rm "${S}/Meslo LG M "*.ttf
	fi
	if ! use lgl; then
		rm "${S}/Meslo LG L "*.ttf
	fi
	if ! use wide; then
		rm "${S}/"*"Complete.ttf"
	fi
	if ! use mono; then
		rm "${S}/"*"Complete Mono.ttf"
	fi
}
