# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="UPower-powered power alerter"
HOMEPAGE="https://sr.ht/~kennylevinsen/poweralertd"
SRC_URI="https://git.sr.ht/~kennylevinsen/poweralertd/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

IUSE="elogind systemd man"
REQUIRED_USE="?? ( elogind systemd )"

DEPEND="
	sys-power/upower

	elogind? ( sys-auth/elogind )
	systemd? ( sys-apps/systemd )
	!elogind? ( !systemd? ( sys-libs/basu ) )
"
RDEPEND="${DEPEND}"
BDEPEND="man? ( app-text/scdoc )"

src_configure() {
	local emesonargs=(
		$(meson_feature man man-pages)
	)
	meson_src_configure
}
