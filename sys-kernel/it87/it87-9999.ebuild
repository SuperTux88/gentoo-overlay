# Copyright 2019-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit linux-mod-r1

DESCRIPTION="IT87 sensors module"
HOMEPAGE="https://github.com/frankcrawford/it87"

inherit git-r3
EGIT_REPO_URI="${HOMEPAGE}.git"

LICENSE="GPL-2+"
SLOT="0"

CONFIG_CHECK="HWMON ~!CONFIG_SENSORS_IT87"

src_prepare() {
	# Set kernel build dir
	sed -i "s@^KERNEL_BUILD.*@KERNEL_BUILD := ${KV_DIR}@" "${S}/Makefile" || die "Could not fix build path"

	default
}

src_compile() {
	local modlist=( it87=misc:"${S}" )

	linux-mod-r1_src_compile
}
