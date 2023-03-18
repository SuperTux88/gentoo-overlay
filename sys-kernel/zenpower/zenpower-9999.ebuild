# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit linux-mod git-r3
EGIT_REPO_URI="https://github.com/Ta180m/zenpower3.git"
EGIT_BRANCH="master"

DESCRIPTION="Linux kernel driver for reading sensors of AMD Zen family CPUs"
HOMEPAGE="https://github.com/Ta180m/zenpower3"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
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
