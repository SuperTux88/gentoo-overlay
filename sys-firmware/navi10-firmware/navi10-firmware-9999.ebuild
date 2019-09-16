# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="AMD Radeon Navi10 firmware files"
HOMEPAGE="https://people.freedesktop.org/~agd5f/radeon_ucode/navi10/"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	wget -P "${S}" --recursive -l 1 -N --no-parent --no-directories --accept "*.bin" -q --show-progress https://people.freedesktop.org/\~agd5f/radeon_ucode/navi10/
	wget -P "${S}" -q --show-progress https://people.freedesktop.org/~agd5f/radeon_ucode/LICENSE.radeon
}

src_install() {
	dodoc LICENSE.radeon

	dodir /lib/firmware/amdgpu/
	insinto /lib/firmware/amdgpu/
	doins navi10_*.bin
}
