# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="ectool for the Framework laptop"
HOMEPAGE="https://gitlab.howett.net/DHowett/ectool"

inherit git-r3
EGIT_REPO_URI="${HOMEPAGE}.git"

LICENSE="BSD"
SLOT="0"

DEPEND="dev-embedded/libftdi"
RDEPEND="${DEPEND}"

src_install() {
	dosbin "${BUILD_DIR}/src/ectool"
}
