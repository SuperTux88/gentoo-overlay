# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit font

DESCRIPTION="Nerd Font build of Apple's Menlo font, patched by ryanoasis"
HOMEPAGE="https://github.com/ryanoasis/nerd-fonts"
SRC_URI="https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Meslo.tar.xz -> ${P}.tar.xz"

S="${WORKDIR}"

LICENSE="Apache-2.0 MIT OFL-1.1"
SLOT="0"
KEYWORDS="~amd64"

IUSE="+lgs lgm lgl +wide mono"
REQUIRED_USE="|| ( lgs lgm lgl ) || ( wide mono )"

FONT_SUFFIX="ttf"

src_prepare() {
	default_src_prepare

	rm "${S}/"*"DZNerdFont"*.ttf
	if ! use lgs; then
		rm "${S}/MesloLGSNerdFont"*.ttf
	fi
	if ! use lgm; then
		rm "${S}/MesloLGMNerdFont"*.ttf
	fi
	if ! use lgl; then
		rm "${S}/MesloLGLNerdFont"*.ttf
	fi
	rm "${S}/"*"NerdFontPropo-"*.ttf
	if ! use wide; then
		rm "${S}/"*"NerdFont-"*.ttf
	fi
	if ! use mono; then
		rm "${S}/"*"NerdFontMono-"*.ttf
	fi
}
