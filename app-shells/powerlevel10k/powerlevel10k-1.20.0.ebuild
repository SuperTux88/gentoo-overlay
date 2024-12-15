# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

VERIFY_SIG_OPENPGP_KEY_PATH=/usr/share/openpgp-keys/romkatv.asc
inherit verify-sig

DESCRIPTION="A theme for Zsh. It emphasizes speed, flexibility and out-of-the-box experience."
HOMEPAGE="https://github.com/romkatv/powerlevel10k"
SRC_URI="
	https://github.com/romkatv/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	verify-sig? ( https://github.com/romkatv/${PN}/releases/download/v${PV}/${P}.tar.gz.asc )
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="nerd-fonts"

DEPEND="app-shells/zsh
		app-shells/gitstatus[zsh-completion]
		nerd-fonts? ( || (
			media-fonts/symbols-nerd-font
			media-fonts/meslo-nerd
			media-fonts/terminess-nerd
		) )"
RDEPEND="${DEPEND}"
BDEPEND="verify-sig? ( sec-keys/openpgp-keys-romkatv )"

src_prepare() {
	sed -i Makefile -e '/gitstatus/d'

	default
}

src_compile() {
	emake pkg
}

src_install() {
	dodoc {README,font}.md

	insinto "/usr/share/zsh/themes/${PN}"

	doins -r config/
	doins -r internal/
	doins prompt_*_setup
	doins powerlevel*.zsh-theme{,.zwc}

	dosym ../../../gitstatus "/usr/share/zsh/themes/${PN}/gitstatus"
}

pkg_postinst() {
	elog "To use this theme source /usr/share/zsh/themes/powerlevel10k/powerlevel10k.zsh-theme in your ~/.zshrc"
	if ! use nerd-fonts; then
		elog "The full choice of style options is available only when using Nerd Fonts. For example: media-fonts/meslo-nerd"
	fi
}
