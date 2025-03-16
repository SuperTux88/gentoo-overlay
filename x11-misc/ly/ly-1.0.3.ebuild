# Copyright 2022-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit edo

# From: https://github.com/fairyglade/ly/blob/v<ly version>/build.zig.zon
CLAP_REF="refs/tags/0.9.1"
ZIGINI_REF="0bba97a12582928e097f4074cc746c43351ba4c8"
# From: https://github.com/Kawaii-Ash/zigini/blob/<zigini ref>/build.zig.zon
INI_REF="e18d36665905c1e7ba0c1ce3e8780076b33e3002"

DESCRIPTION="a TUI display manager"
HOMEPAGE="https://github.com/fairyglade/ly"
SRC_URI="
	https://github.com/fairyglade/ly/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/Hejsil/zig-clap/archive/${CLAP_REF}.tar.gz -> zig-clap-${CLAP_REF##*/}.gh.tar.gz
	https://github.com/Kawaii-Ash/zigini/archive/${ZIGINI_REF}.tar.gz -> zigini-${ZIGINI_REF##*/}.gh.tar.gz
	https://github.com/ziglibs/ini/archive/${INI_REF}.tar.gz -> ziglibs-ini-${INI_REF##*/}.gh.tar.gz
"

LICENSE="WTFPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="openrc runit systemd"

EZIG_MIN="0.12"
EZIG_MAX_EXCLUSIVE="0.14"

DEPEND="
	sys-libs/ncurses:=
	sys-libs/pam
	x11-libs/libxcb
	x11-base/xorg-server
	x11-apps/xauth
"
RDEPEND="
	${DEPEND}
	openrc? ( sys-apps/openrc )
	runit? ( sys-process/runit )
	systemd? ( sys-apps/systemd )
"
BDEPEND="
	|| (
		>=dev-lang/zig-${EZIG_MIN}
		>=dev-lang/zig-bin-${EZIG_MIN}
	)
	|| (
		<dev-lang/zig-${EZIG_MAX_EXCLUSIVE}
		<dev-lang/zig-bin-${EZIG_MAX_EXCLUSIVE}
	)
"

# Set the EZIG environment variable.
# Copied from:
# https://github.com/gentoo/gentoo/blob/17b280061ae4915912092cb9ea6c7a6b89f6c86b/sys-fs/ncdu/ncdu-2.4.ebuild
zig-set_EZIG() {
	[[ -n ${EZIG} ]] && return

	if [[ -n ${EZIG_OVERWRITE} ]]; then
		export EZIG="${EZIG_OVERWRITE}"
		return
	fi

	local candidate selected selected_ver ver

	for candidate in "${BROOT}"/usr/bin/zig-*; do
		if [[ ! -L ${candidate} || ${candidate} != */zig?(-bin)-+([0-9.]) ]]; then
			continue
		fi

		ver=${candidate##*-}

		if [[ -n ${EZIG_EXACT_VER} ]]; then
			ver_test "${ver}" -ne "${EZIG_EXACT_VER}" && continue

			selected="${candidate}"
			selected_ver="${ver}"
			break
		fi

		if [[ -n ${EZIG_MIN} ]] \
			   && ver_test "${ver}" -lt "${EZIG_MIN}"; then
			# Candidate does not satisfy EZIG_MIN condition.
			continue
		fi

		if [[ -n ${EZIG_MAX_EXCLUSIVE} ]] \
			   && ver_test "${ver}" -ge "${EZIG_MAX_EXCLUSIVE}"; then
			# Candidate does not satisfy EZIG_MAX_EXCLUSIVE condition.
			continue
		fi

		if [[ -n ${selected_ver} ]] \
			   && ver_test "${selected_ver}" -gt "${ver}"; then
			# Candidate is older than the currently selected candidate.
			continue
		fi

		selected="${candidate}"
		selected_ver="${ver}"
	done

	if [[ -z ${selected} ]]; then
		die "Could not find (suitable) zig installation in ${BROOT}/usr/bin"
	fi

	export EZIG="${selected}"
	export EZIG_VER="${selected_ver}"
}

ezig() {
	edo "${EZIG}" "${@}"
}

ezig_build() {
	ezig build -Ddest_directory="${D}" -Doptimize=ReleaseSafe "${@}"
}

pkg_setup() {
	zig-set_EZIG

	mkdir -p "${T}/zig-cache" || die
	export ZIG_GLOBAL_CACHE_DIR="${T}/zig-cache"
}

src_unpack() {
	default

	ezig fetch "${WORKDIR}/zig-clap-${CLAP_REF##*/}"
	ezig fetch "${WORKDIR}/zigini-${ZIGINI_REF##*/}"
	ezig fetch "${WORKDIR}/ini-${INI_REF##*/}"
}

src_compile() {
	ezig_build
}

src_install() {
	use openrc && ezig_build installopenrc
	use runit && ezig_build installrunit
	use systemd && ezig_build installsystemd
}
