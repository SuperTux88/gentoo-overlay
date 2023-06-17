# Copyright 2022-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="OBS Linux Vulkan/OpenGL game capture "
HOMEPAGE="https://github.com/nowrep/obs-vkcapture"
SRC_URI="https://github.com/nowrep/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=media-video/obs-studio-27[wayland]
	media-libs/libglvnd
	x11-libs/libdrm
	x11-libs/libxcb:=
"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-util/vulkan-headers
	media-libs/shaderc
	media-libs/vulkan-loader
"

src_configure() {
	cmake_src_configure
}
