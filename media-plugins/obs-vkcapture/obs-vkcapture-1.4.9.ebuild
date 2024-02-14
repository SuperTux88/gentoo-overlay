# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake-multilib

DESCRIPTION="OBS Linux Vulkan/OpenGL game capture "
HOMEPAGE="https://github.com/nowrep/obs-vkcapture"
SRC_URI="https://github.com/nowrep/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=media-video/obs-studio-27[wayland]
	media-libs/libglvnd[${MULTILIB_USEDEP}]
	x11-libs/libdrm[${MULTILIB_USEDEP}]
	x11-libs/libxcb:=[${MULTILIB_USEDEP}]
"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-util/vulkan-headers
	media-libs/shaderc
	media-libs/vulkan-loader[${MULTILIB_USEDEP}]
"

QA_SONAME="
	/usr/lib64/libVkLayer_obs_vkcapture.so
	/usr/lib64/libobs_glcapture.so
	/usr/lib/libVkLayer_obs_vkcapture.so
	/usr/lib/libobs_glcapture.so
"

multilib_src_configure() {
	if ! multilib_is_native_abi; then
		local mycmakeargs+=(
			-DBUILD_PLUGIN=OFF
		)
	fi

	cmake_src_configure
}
