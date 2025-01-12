# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs

MY_PN=${PN%-*}
SL_PATCH="sl5-1.patch"

DESCRIPTION="SL (Steam Locomotive); old patched long version"
HOMEPAGE="http://www.tkl.iis.u-tokyo.ac.jp/~toyoda/index_e.html https://github.com/euank/docker-sl"
SRC_URI="
	http://www.tkl.iis.u-tokyo.ac.jp/~toyoda/sl/${MY_PN}.tar -> ${MY_PN}-${PV}.tar
	https://github.com/euank/docker-sl/raw/c605aaacb0078fecc864e5f1726d7bbea2d01623/${SL_PATCH}
	https://gentoo.jss.hu/distfiles/sl.en.1.gz
"

LICENSE="Toyoda"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	sys-libs/ncurses:=
	!app-misc/sl
"
DEPEND="
	${RDEPEND}
	virtual/pkgconfig
"

S="${WORKDIR}/${MY_PN}"

PATCHES=(
	"${DISTDIR}"/${SL_PATCH}
	"${FILESDIR}/fix_compilation.patch"
)

src_compile() {
	emake CC="$(tc-getCC)" CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS} $($(tc-getPKG_CONFIG) --libs ncurses)"
}

src_install() {
	dobin "${MY_PN}"
	newman "${WORKDIR}/sl.en.1" sl.1

	einstalldocs
}

