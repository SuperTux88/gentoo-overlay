# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.5.4-r1

EAPI=8

CRATES="
	aho-corasick@1.1.2
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	anstream@0.6.11
	anstyle@1.0.5
	anstyle-parse@0.2.3
	anstyle-query@1.0.2
	anstyle-wincon@3.0.2
	argon2@0.5.3
	assert_matches@1.5.0
	autocfg@1.1.0
	base64ct@1.6.0
	bigdecimal@0.4.2
	bitflags@1.3.2
	bitflags@2.4.2
	blake2@0.10.6
	block-buffer@0.10.4
	bumpalo@3.14.0
	byteorder@1.5.0
	cc@1.0.83
	cfg-if@1.0.0
	chrono@0.4.33
	clap@4.4.18
	clap_builder@4.4.18
	clap_complete@4.4.10
	clap_derive@4.4.7
	clap_lex@0.6.0
	colorchoice@1.0.0
	console@0.15.8
	core-foundation-sys@0.8.6
	cpufeatures@0.2.12
	crypto-common@0.1.6
	deranged@0.3.11
	diffy@0.3.0
	digest@0.10.7
	dotenvy@0.15.7
	encode_unicode@0.3.6
	env_logger@0.8.4
	equivalent@1.0.1
	errno@0.3.8
	fastrand@2.0.1
	form_urlencoded@1.2.1
	generic-array@0.14.7
	getrandom@0.2.12
	hashbrown@0.14.3
	heck@0.4.1
	iana-time-zone@0.1.60
	iana-time-zone-haiku@0.1.2
	idna@0.5.0
	indexmap@2.2.2
	insta@1.34.0
	ipnet@2.9.0
	ipnetwork@0.20.0
	itoa@1.0.10
	js-sys@0.3.67
	lazy_static@1.4.0
	libc@0.2.153
	libm@0.2.8
	libsqlite3-sys@0.27.0
	linked-hash-map@0.5.6
	linux-raw-sys@0.4.13
	lock_api@0.4.11
	log@0.4.20
	memchr@2.7.1
	mysqlclient-sys@0.2.5
	nu-ansi-term@0.46.0
	num-bigint@0.4.4
	num-conv@0.1.0
	num-integer@0.1.45
	num-traits@0.2.17
	once_cell@1.19.0
	overload@0.1.1
	parking_lot@0.12.1
	parking_lot_core@0.9.9
	password-hash@0.5.0
	percent-encoding@2.3.1
	pkg-config@0.3.29
	powerfmt@0.2.0
	ppv-lite86@0.2.17
	pq-sys@0.4.8
	proc-macro2@1.0.78
	quickcheck@1.0.3
	quote@1.0.35
	r2d2@0.8.10
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	redox_syscall@0.4.1
	regex@1.10.3
	regex-automata@0.4.5
	regex-syntax@0.8.2
	rustix@0.38.31
	ryu@1.0.16
	scheduled-thread-pool@0.2.7
	scopeguard@1.2.0
	serde@1.0.196
	serde_derive@1.0.196
	serde_json@1.0.113
	serde_regex@1.1.0
	serde_spanned@0.6.5
	similar@2.4.0
	smallvec@1.13.1
	strsim@0.10.0
	subtle@2.5.0
	syn@2.0.48
	tempfile@3.9.0
	time@0.3.34
	time-core@0.1.2
	time-macros@0.2.17
	tinyvec@1.6.0
	tinyvec_macros@0.1.1
	toml@0.7.8
	toml_datetime@0.6.5
	toml_edit@0.19.15
	typenum@1.17.0
	unicode-bidi@0.3.15
	unicode-ident@1.0.12
	unicode-normalization@0.1.22
	url@2.5.0
	utf8parse@0.2.1
	uuid@1.7.0
	vcpkg@0.2.15
	version_check@0.9.4
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen@0.2.90
	wasm-bindgen-backend@0.2.90
	wasm-bindgen-macro@0.2.90
	wasm-bindgen-macro-support@0.2.90
	wasm-bindgen-shared@0.2.90
	winapi@0.3.9
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-x86_64-pc-windows-gnu@0.4.0
	windows-core@0.52.0
	windows-sys@0.52.0
	windows-targets@0.48.5
	windows-targets@0.52.0
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.0
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.0
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.0
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.0
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.0
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.0
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.0
	winnow@0.5.37
	yaml-rust@0.4.5
"

inherit cargo shell-completion

MY_PN="diesel"
MY_PV="2.1.4"
MY_P="${MY_PN}-${MY_PV}"

DESCRIPTION="Provides the CLI for the Diesel crate"
HOMEPAGE="https://github.com/diesel-rs/diesel"
SRC_URI="
	https://github.com/diesel-rs/${MY_PN}/archive/v${MY_PV}.tar.gz -> ${MY_P}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="|| ( Apache-2.0 MIT )"
# Dependent crate licenses
LICENSE+=" Apache-2.0 BSD MIT Unicode-DFS-2016"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+mysql +postgres +sqlite"

DEPEND="
	mysql? (
		dev-db/mysql-connector-c
		dev-libs/openssl:=
		app-arch/zstd:=
		sys-devel/gcc
	)
	postgres? (
		dev-db/postgresql
		dev-libs/openssl:=
	)
	sqlite? (
		dev-db/sqlite
		dev-libs/icu:=
		sys-devel/gcc
	)
"
RDEPEND="${DEPEND}"
BDEPEND=">=virtual/rust-1.65"

S="${WORKDIR}/${MY_P}"

# rust does not use *FLAGS from make.conf, silence portage warning
# update with proper path to binaries this crate installs, omit leading /
QA_FLAGS_IGNORED="usr/bin/${MY_PN}"

src_configure() {
	local myfeatures=(
		$(usev mysql)
		$(usev postgres)
		$(usev sqlite)
	)
	cargo_src_configure --no-default-features
}

src_compile() {
	cargo_src_compile --bin ${MY_PN}

	target/release/${MY_PN} completions bash > bash-completion.sh
	target/release/${MY_PN} completions zsh > zsh-completion.zsh
}

src_install() {
	cargo_src_install --path ${PN/-/_}

	dodoc ${PN/-/_}/README.md

	newbashcomp bash-completion.sh ${MY_PN}
	newzshcomp zsh-completion.zsh _${MY_PN}
}
