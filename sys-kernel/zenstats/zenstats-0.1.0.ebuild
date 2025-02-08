# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit linux-mod-r1

DESCRIPTION="Linux kernel driver for reading sensors for AMD Zen family CPUs"
HOMEPAGE="https://github.com/Sid127/zenstats"
SRC_URI="https://github.com/Sid127/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	!sys-kernel/zenpower
	!sys-kernel/zenpower3
"

CONFIG_CHECK="HWMON PCI AMD_NB ~!SENSORS_K10TEMP"

src_prepare() {
	# Set kernel build dir
	#sed -i "s@^KERNEL_BUILD.*@KERNEL_BUILD := ${KV_DIR}@" "${S}/Makefile" || die "Could not fix build path"

	default
}

src_compile() {
	local modlist=( ${PN}=misc:"${S}" )

	linux-mod-r1_src_compile
}
