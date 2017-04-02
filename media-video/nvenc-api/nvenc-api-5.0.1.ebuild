# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="The NVENC Video Encoding API provides an interface to video encoder hardware on supported NVIDIA GPU"
HOMEPAGE="https://developer.nvidia.com/nvidia-video-codec-sdk"
SRC_URI="http://developer.download.nvidia.com/compute/nvenc/v5.0/nvenc_${PV}_sdk.zip"

LICENSE="NVIDIA-r2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT="mirror"

DEPEND=""
RDEPEND="${DEPEND}
	x11-drivers/nvidia-drivers
	dev-util/nvidia-cuda-toolkit
"

S="${WORKDIR}/nvenc_${PV}_sdk"

src_install() {
	doheader Samples/common/inc/*
}
