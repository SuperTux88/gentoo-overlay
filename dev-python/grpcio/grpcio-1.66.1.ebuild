# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1 flag-o-matic multiprocessing prefix pypi

DESCRIPTION="High-performance RPC framework (python libraries)"
HOMEPAGE="https://grpc.io"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-libs/openssl:=[-bindist(-)]
	dev-libs/re2:=
	<dev-python/protobuf-python-6[${PYTHON_USEDEP}]
	>=dev-python/protobuf-python-5.26.1[${PYTHON_USEDEP}]
	net-dns/c-ares:=
	sys-libs/zlib:=
"
DEPEND="${RDEPEND}"
BDEPEND="dev-python/cython[${PYTHON_USEDEP}]"

python_prepare_all() {
	distutils-r1_python_prepare_all
	hprefixify setup.py
}

python_configure_all() {
	# -Werror=odr -Werror=lto-type-mismatch
	# https://bugs.gentoo.org/856775
	# https://github.com/grpc/grpc/issues/36158
	filter-lto

	# os.environ.get('GRPC_BUILD_WITH_BORING_SSL_ASM', True)
	export GRPC_BUILD_WITH_BORING_SSL_ASM=
	export GRPC_PYTHON_DISABLE_LIBC_COMPATIBILITY=1
	export GRPC_PYTHON_BUILD_SYSTEM_CARES=1
	export GRPC_PYTHON_BUILD_SYSTEM_OPENSSL=1
	export GRPC_PYTHON_BUILD_WITH_SYSTEM_RE2=1
	export GRPC_PYTHON_BUILD_SYSTEM_ZLIB=1
	export GRPC_PYTHON_BUILD_WITH_CYTHON=1
	export GRPC_PYTHON_BUILD_EXT_COMPILER_JOBS="$(makeopts_jobs)"
}
