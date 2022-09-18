# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit linux-info linux-mod

DESCRIPTION="Linux kernel driver for reading sensors of AMD Zen family CPUs"
HOMEPAGE="https://github.com/ocerman/zenpower"
SRC_URI="https://github.com/ocerman/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

CONFIG_CHECK="HWMON PCI AMD_NB ~!SENSORS_K10TEMP"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

MODULE_NAMES="zenpower(misc:${S})"
BUILD_TARGETS="modules"

src_prepare() {
	# Set kernel build dir
	sed -i "s@^KERNEL_BUILD.*@KERNEL_BUILD := ${KV_DIR}@" "${S}/Makefile" || die "Could not fix build path"

	default
}
