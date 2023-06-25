# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit linux-mod

DESCRIPTION="IT87 sensors module"
HOMEPAGE="https://github.com/frankcrawford/it87"

inherit git-r3
EGIT_REPO_URI="${HOMEPAGE}.git"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS=""
IUSE=""

CONFIG_CHECK="HWMON ~!CONFIG_SENSORS_IT87"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

MODULE_NAMES="it87(misc:${S})"
BUILD_TARGETS="modules"

src_prepare() {
	# Set kernel build dir
	sed -i "s@^KERNEL_BUILD.*@KERNEL_BUILD := ${KV_DIR}@" "${S}/Makefile" || die "Could not fix build path"

	default
}
