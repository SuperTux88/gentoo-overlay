# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="OpenPGP keys used by Roman Perepelitsa"
HOMEPAGE="https://github.com/romkatv"
SRC_URI="https://keys.openpgp.org/vks/v1/by-fingerprint/8B060F8B9EB395614A669F2A90ACE942EB90C3DD -> ${P}.asc"
S="${WORKDIR}"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64"

src_install() {
	local files=( ${A} )

	insinto /usr/share/openpgp-keys
	newins - romkatv.asc < <(cat "${files[@]/#/${DISTDIR}/}" || die)
}
