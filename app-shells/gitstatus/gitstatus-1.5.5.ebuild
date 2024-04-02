# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

VERIFY_SIG_OPENPGP_KEY_PATH=/usr/share/openpgp-keys/romkatv.asc
inherit cmake flag-o-matic verify-sig

# from build.info
LIBGIT_TAG=tag-2ecf33948a4df9ef45a66c68b8ef24a5e60eaac6
LIBGIT_P="libgit2-romkatv-${LIBGIT_TAG}"
LIBGIT_DIR="${LIBGIT_P/-romkatv/}"

CMAKE_USE_DIR="${WORKDIR}/${LIBGIT_DIR}"
BUILD_DIR="${CMAKE_USE_DIR}_build"

DESCRIPTION="Git status for Bash and Zsh prompt"
HOMEPAGE="https://github.com/romkatv/gitstatus"
SRC_URI="
	https://github.com/romkatv/gitstatus/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/romkatv/libgit2/archive/${LIBGIT_TAG}.tar.gz -> ${LIBGIT_P}.tar.gz
	verify-sig? (
		https://github.com/romkatv/${PN}/releases/download/v${PV}/${P}.tar.gz.asc
	)
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

IUSE="zsh-completion"

DEPEND="zsh-completion? ( app-shells/zsh )"
RDEPEND="${DEPEND}"
BDEPEND="verify-sig? ( sec-keys/openpgp-keys-romkatv )"

DOCS=( {README,docs/listdir}.md )

src_unpack() {
	if use verify-sig; then
		verify-sig_verify_detached "${DISTDIR}"/${P}.tar.gz{,.asc}
	fi
	default
}

src_configure() {
	mycmakeargs=(
		-DCMAKE_BUILD_TYPE=Release
		-DZERO_NSEC=ON
		-DTHREADSAFE=ON
		-DUSE_BUNDLED_ZLIB=ON
		-DREGEX_BACKEND=builtin
		-DUSE_HTTP_PARSER=builtin
		-DUSE_SSH=OFF
		-DUSE_HTTPS=OFF
		-DBUILD_CLAR=OFF
		-DUSE_GSSAPI=OFF
		-DUSE_NTLMCLIENT=OFF
		-DBUILD_SHARED_LIBS=OFF
		-DENABLE_REPRODUCIBLE_BUILDS=ON
	)
	cmake_src_configure
}

src_compile() {
	append-cflags $(test-flags-CC -fno-plt)

	cmake_src_compile

	local cxxflags=(
		"-I${CMAKE_USE_DIR}/include"
		-DGITSTATUS_ZERO_NSEC
		-D_GNU_SOURCE
	)
	local ldflags=(
		"-L${BUILD_DIR}"
		-static
	)

	append-cxxflags "${cxxflags[@]}"
	append-ldflags "${ldflags[@]}"
	emake all

	GITSTATUS_DAEMON= GITSTATUS_CACHE_DIR=${S}/usrbin ./install
	if use zsh-completion; then
		for file in *.zsh install; do
			zsh -fc "emulate zsh -o no_aliases && zcompile -R -- $file.zwc $file" || die "Couldn't zcompile"
		done
	fi
}

src_install() {
	insinto "/usr/share/${PN}"
	exeinto "${_}"

	doins gitstatus.*.sh *.info

	if use zsh-completion; then
		doins gitstatus.*.zsh{,.zwc}
	fi

	doexe install

	exeinto "/usr/libexec/${PN}"
	doexe usrbin/gitstatusd

	dosym "../../../libexec/${PN}/gitstatusd" \
		"/usr/share/${PN}/usrbin/gitstatusd"

	einstalldocs
}
