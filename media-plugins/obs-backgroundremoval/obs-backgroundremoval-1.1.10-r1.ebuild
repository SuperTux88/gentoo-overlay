# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

ONNXRUNTIME_VERSION=1.16.3

DESCRIPTION="OBS plugin for removing background"
HOMEPAGE="https://github.com/occ-ai/obs-backgroundremoval"
SRC_URI="
	https://github.com/occ-ai/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/microsoft/onnxruntime/releases/download/v${ONNXRUNTIME_VERSION}/onnxruntime-linux-x64-gpu-${ONNXRUNTIME_VERSION}.tgz
"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-qt/qtbase:6[widgets]
	>=media-video/obs-studio-29
	>=media-libs/opencv-4.7.0:=
"
RDEPEND="${DEPEND}"
BDEPEND="app-admin/chrpath"

QA_PRESTRIPPED="/usr/lib64/obs-plugins/obs-backgroundremoval/libonnxruntime.so.${ONNXRUNTIME_VERSION} /usr/lib64/obs-plugins/obs-backgroundremoval/libonnxruntime_providers_shared.so"

PATCHES=(
	"${FILESDIR}"/fetch-onnxruntime-from-path.patch
	"${FILESDIR}"/remove-update-check.patch
	"${FILESDIR}"/remove-tensorflow-support.patch
)

src_configure() {
	mycmakeargs=(
		--preset linux-x86_64
		-B "${BUILD_DIR}"
		-DUSE_SYSTEM_OPENCV=ON
	)
	cmake_src_configure
}

src_compile() {
	chrpath -d "${WORKDIR}/onnxruntime-linux-x64-gpu-${ONNXRUNTIME_VERSION}/lib/libonnxruntime.so.${ONNXRUNTIME_VERSION}"

	cmake_src_compile
}
