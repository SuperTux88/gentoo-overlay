# Copyright 2022-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

ONNXRUNTIME_VERSION=1.15.1

DESCRIPTION="OBS plugin for removing background"
HOMEPAGE="https://github.com/royshil/obs-backgroundremoval"
SRC_URI="
	https://github.com/royshil/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/microsoft/onnxruntime/releases/download/v${ONNXRUNTIME_VERSION}/onnxruntime-linux-x64-gpu-${ONNXRUNTIME_VERSION}.tgz
"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="qt6 video_cards_nvidia"

DEPEND="
	qt6? (
		dev-qt/qtbase:6[widgets]
	)
	!qt6? (
		dev-qt/qtwidgets:5
	)
	>=media-video/obs-studio-29
	>=media-libs/opencv-4.7.0
	video_cards_nvidia? (
		dev-libs/cudnn
		sci-libs/tensorflow
	)
"
RDEPEND="${DEPEND}"
BDEPEND=""

QA_PRESTRIPPED="/usr/lib64/obs-plugins/obs-backgroundremoval/libonnxruntime.so.${ONNXRUNTIME_VERSION} /usr/lib64/obs-plugins/obs-backgroundremoval/libonnxruntime_providers_shared.so"

PATCHES=(
	"${FILESDIR}"/${P}-fetch-onnxruntime-from-path.patch
	"${FILESDIR}"/remove-update-check.patch
)

src_configure() {
	if ! use video_cards_nvidia; then
		eapply "${FILESDIR}"/${P}-remove-nvidia-gpu-support.patch
	fi

	mycmakeargs=(
		--preset linux-x86_64
		-B "${BUILD_DIR}"
		-DQT_VERSION=$(usex qt6 6 5)
		-DUSE_SYSTEM_OPENCV=ON
	)
	cmake_src_configure
}
