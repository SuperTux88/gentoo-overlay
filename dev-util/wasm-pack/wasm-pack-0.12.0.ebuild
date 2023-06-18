# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.5.4

EAPI=8

CRATES="
	addr2line-0.19.0
	adler-1.0.2
	aes-0.8.2
	aho-corasick-1.0.2
	android-tzdata-0.1.1
	android_system_properties-0.1.5
	anstream-0.3.2
	anstyle-1.0.0
	anstyle-parse-0.2.0
	anstyle-query-1.0.0
	anstyle-wincon-1.0.1
	anyhow-1.0.71
	assert_cmd-2.0.11
	atty-0.2.14
	autocfg-1.1.0
	backtrace-0.3.67
	base64-0.21.2
	base64ct-1.6.0
	binary-install-0.2.0
	bitflags-1.3.2
	block-buffer-0.10.4
	bstr-1.5.0
	bumpalo-3.13.0
	byteorder-1.4.3
	bzip2-0.4.4
	bzip2-sys-0.1.11+1.0.8
	camino-1.1.4
	cargo-platform-0.1.2
	cargo_metadata-0.15.4
	cc-1.0.79
	cfg-if-1.0.0
	chrono-0.4.26
	cipher-0.4.4
	clap-4.3.4
	clap_builder-4.3.4
	clap_derive-4.3.2
	clap_lex-0.5.0
	colorchoice-1.0.0
	console-0.15.7
	constant_time_eq-0.1.5
	core-foundation-sys-0.8.4
	cpufeatures-0.2.8
	crc32fast-1.3.2
	crossbeam-utils-0.8.16
	crypto-common-0.1.6
	dashmap-5.4.0
	dialoguer-0.10.4
	difflib-0.4.0
	digest-0.10.7
	dirs-next-2.0.0
	dirs-sys-next-0.1.2
	doc-comment-0.3.3
	either-1.8.1
	encode_unicode-0.3.6
	env_logger-0.10.0
	errno-0.3.1
	errno-dragonfly-0.1.2
	fastrand-1.9.0
	filetime-0.2.21
	flate2-1.0.26
	float-cmp-0.9.0
	form_urlencoded-1.2.0
	fs2-0.4.3
	futures-0.3.28
	futures-channel-0.3.28
	futures-core-0.3.28
	futures-executor-0.3.28
	futures-io-0.3.28
	futures-sink-0.3.28
	futures-task-0.3.28
	futures-util-0.3.28
	generic-array-0.14.7
	getrandom-0.2.10
	gimli-0.27.3
	glob-0.3.1
	hashbrown-0.12.3
	heck-0.4.1
	hermit-abi-0.1.19
	hermit-abi-0.3.1
	hex-0.4.3
	hmac-0.12.1
	human-panic-1.1.5
	iana-time-zone-0.1.57
	iana-time-zone-haiku-0.1.2
	idna-0.4.0
	indexmap-1.9.3
	inout-0.1.3
	instant-0.1.12
	io-lifetimes-1.0.11
	is-terminal-0.4.7
	is_executable-0.1.2
	itertools-0.10.5
	itoa-1.0.6
	jobserver-0.1.26
	js-sys-0.3.64
	lazy_static-1.4.0
	libc-0.2.146
	linux-raw-sys-0.3.8
	lock_api-0.4.10
	log-0.4.19
	memchr-2.5.0
	miniz_oxide-0.6.2
	miniz_oxide-0.7.1
	normalize-line-endings-0.3.0
	num-traits-0.2.15
	object-0.30.4
	once_cell-1.18.0
	os_info-3.7.0
	parking_lot-0.12.1
	parking_lot_core-0.9.8
	password-hash-0.4.2
	pbkdf2-0.11.0
	percent-encoding-2.3.0
	pin-project-lite-0.2.9
	pin-utils-0.1.0
	pkg-config-0.3.27
	predicates-3.0.3
	predicates-core-1.0.6
	predicates-tree-1.0.9
	proc-macro2-1.0.60
	quote-1.0.28
	rand_core-0.6.4
	redox_syscall-0.2.16
	redox_syscall-0.3.5
	redox_users-0.4.3
	regex-1.8.4
	regex-automata-0.1.10
	regex-syntax-0.7.2
	ring-0.16.20
	rustc-demangle-0.1.23
	rustix-0.37.20
	rustls-0.21.2
	rustls-webpki-0.100.1
	ryu-1.0.13
	same-file-1.0.6
	scopeguard-1.1.0
	sct-0.7.0
	semver-1.0.17
	serde-1.0.164
	serde_derive-1.0.164
	serde_ignored-0.1.7
	serde_json-1.0.93
	serde_spanned-0.6.2
	serial_test-2.0.0
	serial_test_derive-2.0.0
	sha1-0.10.5
	sha2-0.10.7
	shell-words-1.1.0
	siphasher-0.3.10
	slab-0.4.8
	smallvec-1.10.0
	spin-0.5.2
	strsim-0.10.0
	subtle-2.5.0
	syn-2.0.18
	tar-0.4.38
	tempfile-3.6.0
	termtree-0.4.1
	thiserror-1.0.40
	thiserror-impl-1.0.40
	time-0.1.45
	time-0.3.22
	time-core-0.1.1
	tinyvec-1.6.0
	tinyvec_macros-0.1.1
	toml-0.7.4
	toml_datetime-0.6.2
	toml_edit-0.19.10
	typenum-1.16.0
	unicode-bidi-0.3.13
	unicode-ident-1.0.9
	unicode-normalization-0.1.22
	unicode-width-0.1.10
	untrusted-0.7.1
	ureq-2.7.0
	url-2.4.0
	utf8parse-0.2.1
	uuid-1.3.4
	version_check-0.9.4
	wait-timeout-0.2.0
	walkdir-2.3.3
	wasi-0.10.0+wasi-snapshot-preview1
	wasi-0.11.0+wasi-snapshot-preview1
	wasm-bindgen-0.2.87
	wasm-bindgen-backend-0.2.87
	wasm-bindgen-macro-0.2.87
	wasm-bindgen-macro-support-0.2.87
	wasm-bindgen-shared-0.2.87
	web-sys-0.3.64
	webpki-roots-0.23.1
	which-4.4.0
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
	windows-0.48.0
	windows-sys-0.45.0
	windows-sys-0.48.0
	windows-targets-0.42.2
	windows-targets-0.48.0
	windows_aarch64_gnullvm-0.42.2
	windows_aarch64_gnullvm-0.48.0
	windows_aarch64_msvc-0.42.2
	windows_aarch64_msvc-0.48.0
	windows_i686_gnu-0.42.2
	windows_i686_gnu-0.48.0
	windows_i686_msvc-0.42.2
	windows_i686_msvc-0.48.0
	windows_x86_64_gnu-0.42.2
	windows_x86_64_gnu-0.48.0
	windows_x86_64_gnullvm-0.42.2
	windows_x86_64_gnullvm-0.48.0
	windows_x86_64_msvc-0.42.2
	windows_x86_64_msvc-0.48.0
	winnow-0.4.7
	xattr-0.2.3
	zeroize-1.6.0
	zip-0.6.6
	zstd-0.11.2+zstd.1.5.2
	zstd-safe-5.0.2+zstd.1.5.2
	zstd-sys-2.0.8+zstd.1.5.5
"

inherit cargo

DESCRIPTION="📦✨ your favorite rust -> wasm workflow tool!"
HOMEPAGE="https://rustwasm.github.io/wasm-pack/"
SRC_URI="
	https://github.com/rustwasm/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	$(cargo_crate_uris)
"

LICENSE="Apache-2.0 BSD CC0-1.0 ISC MIT MPL-2.0 Unicode-DFS-2016 Unlicense"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

# rust does not use *FLAGS from make.conf, silence portage warning
# update with proper path to binaries this crate installs, omit leading /
QA_FLAGS_IGNORED="usr/bin/${PN}"
