# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.5.4-r1

EAPI=8

CRATES="
	addr2line@0.22.0
	adler@1.0.2
	ahash@0.8.11
	aho-corasick@1.1.3
	allocator-api2@0.2.18
	anstream@0.6.15
	anstyle@1.0.8
	anstyle-parse@0.2.5
	anstyle-query@1.1.1
	anstyle-wincon@3.0.4
	anyhow@1.0.86
	arc-swap@1.7.1
	askalono@0.4.6
	async-compression@0.4.12
	atomic-waker@1.1.2
	autocfg@1.3.0
	backtrace@0.3.73
	base64@0.22.1
	bitflags@1.3.2
	bitflags@2.6.0
	bitvec@1.0.1
	block-buffer@0.10.4
	bstr@1.10.0
	bumpalo@3.16.0
	byteorder@1.5.0
	bytes@1.7.1
	camino@1.1.7
	cargo-lock@9.0.0
	cc@1.1.7
	cfg-expr@0.16.0
	cfg-if@1.0.0
	clap@4.5.13
	clap_builder@4.5.13
	clap_derive@4.5.13
	clap_lex@0.7.2
	clru@0.6.2
	codespan@0.11.1
	codespan-reporting@0.11.1
	colorchoice@1.0.2
	console@0.15.8
	core-foundation@0.9.4
	core-foundation-sys@0.8.6
	cpufeatures@0.2.12
	crc32fast@1.4.2
	crossbeam@0.8.4
	crossbeam-channel@0.5.13
	crossbeam-deque@0.8.5
	crossbeam-epoch@0.9.18
	crossbeam-queue@0.3.11
	crossbeam-utils@0.8.20
	crypto-common@0.1.6
	cvss@2.0.0
	deranged@0.3.11
	digest@0.10.7
	dunce@1.0.4
	either@1.13.0
	encode_unicode@0.3.6
	encoding_rs@0.8.34
	equivalent@1.0.1
	errno@0.3.9
	faster-hex@0.9.0
	fastrand@2.1.0
	fern@0.6.2
	filetime@0.2.23
	fixedbitset@0.4.2
	flate2@1.0.30
	fnv@1.0.7
	form_urlencoded@1.2.1
	fs-err@2.11.0
	fs_extra@1.3.0
	funty@2.0.0
	futures-channel@0.3.30
	futures-core@0.3.30
	futures-io@0.3.30
	futures-sink@0.3.30
	futures-task@0.3.30
	futures-util@0.3.30
	generic-array@0.14.7
	getrandom@0.2.15
	gimli@0.29.0
	gix@0.64.0
	gix-actor@0.31.5
	gix-attributes@0.22.3
	gix-bitmap@0.2.11
	gix-chunk@0.4.8
	gix-command@0.3.8
	gix-commitgraph@0.24.3
	gix-config@0.38.0
	gix-config-value@0.14.7
	gix-credentials@0.24.4
	gix-date@0.8.7
	gix-diff@0.44.1
	gix-discover@0.33.0
	gix-features@0.38.2
	gix-filter@0.11.3
	gix-fs@0.11.2
	gix-glob@0.16.4
	gix-hash@0.14.2
	gix-hashtable@0.5.2
	gix-ignore@0.11.3
	gix-index@0.33.1
	gix-lock@14.0.0
	gix-macros@0.1.5
	gix-negotiate@0.13.2
	gix-object@0.42.3
	gix-odb@0.61.1
	gix-pack@0.51.1
	gix-packetline@0.17.5
	gix-packetline-blocking@0.17.4
	gix-path@0.10.9
	gix-pathspec@0.7.6
	gix-prompt@0.8.6
	gix-protocol@0.45.2
	gix-quote@0.4.12
	gix-ref@0.45.0
	gix-refspec@0.23.1
	gix-revision@0.27.2
	gix-revwalk@0.13.2
	gix-sec@0.10.7
	gix-submodule@0.12.0
	gix-tempfile@14.0.1
	gix-trace@0.1.9
	gix-transport@0.42.2
	gix-traverse@0.39.2
	gix-url@0.27.4
	gix-utils@0.1.12
	gix-validate@0.8.5
	gix-worktree@0.34.1
	gix-worktree-state@0.11.1
	globset@0.4.14
	goblin@0.8.2
	h2@0.4.5
	hashbrown@0.14.5
	heck@0.5.0
	hermit-abi@0.3.9
	home@0.5.9
	http@1.1.0
	http-body@1.0.1
	http-body-util@0.1.2
	httparse@1.9.4
	hyper@1.4.1
	hyper-rustls@0.27.2
	hyper-util@0.1.6
	idna@0.5.0
	indexmap@2.3.0
	insta@1.39.0
	io-close@0.3.7
	ipnet@2.9.0
	is_terminal_polyfill@1.70.1
	itoa@1.0.11
	jobserver@0.1.32
	js-sys@0.3.69
	krates@0.17.1
	kstring@2.0.2
	lazy_static@1.5.0
	libc@0.2.155
	linked-hash-map@0.5.6
	linux-raw-sys@0.4.14
	lock_api@0.4.12
	log@0.4.22
	maybe-async@0.2.10
	memchr@2.7.4
	memmap2@0.9.4
	mime@0.3.17
	miniz_oxide@0.7.4
	mio@1.0.1
	nu-ansi-term@0.50.1
	num-conv@0.1.0
	num-traits@0.2.19
	num_threads@0.1.7
	object@0.36.2
	once_cell@1.19.0
	openssl-probe@0.1.5
	parking_lot@0.12.3
	parking_lot_core@0.9.10
	paste@1.0.15
	percent-encoding@2.3.1
	petgraph@0.6.5
	pin-project@1.1.5
	pin-project-internal@1.1.5
	pin-project-lite@0.2.14
	pin-utils@0.1.0
	pkg-config@0.3.30
	plain@0.2.3
	platforms@3.4.1
	powerfmt@0.2.0
	ppv-lite86@0.2.18
	proc-macro2@1.0.86
	prodash@28.0.0
	quinn@0.11.2
	quinn-proto@0.11.3
	quinn-udp@0.5.4
	quote@1.0.36
	radium@0.7.0
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	rayon@1.10.0
	rayon-core@1.12.1
	redox_syscall@0.4.1
	redox_syscall@0.5.3
	regex@1.10.5
	regex-automata@0.4.7
	regex-syntax@0.8.4
	reqwest@0.12.5
	ring@0.17.8
	rmp@0.8.14
	rmp-serde@0.14.4
	rustc-demangle@0.1.24
	rustc-hash@1.1.0
	rustix@0.38.34
	rustls@0.23.12
	rustls-native-certs@0.7.1
	rustls-pemfile@2.1.2
	rustls-pki-types@1.7.0
	rustls-webpki@0.102.6
	rustsec@0.29.3
	rustversion@1.0.17
	ryu@1.0.18
	same-file@1.0.6
	schannel@0.1.23
	scopeguard@1.2.0
	scroll@0.12.0
	scroll_derive@0.12.0
	security-framework@2.11.1
	security-framework-sys@2.11.1
	semver@1.0.23
	serde@1.0.204
	serde_derive@1.0.204
	serde_json@1.0.122
	serde_spanned@0.6.7
	serde_urlencoded@0.7.1
	sha1_smol@1.0.1
	sha2@0.10.8
	shell-words@1.1.0
	signal-hook@0.3.17
	signal-hook-registry@1.4.2
	similar@2.6.0
	slab@0.4.9
	smallvec@1.13.2
	smol_str@0.2.2
	socket2@0.5.7
	spdx@0.10.6
	spin@0.9.8
	static_assertions@1.1.0
	strsim@0.11.1
	strum@0.26.3
	strum_macros@0.26.4
	subtle@2.6.1
	syn@2.0.72
	sync_wrapper@1.0.1
	system-configuration@0.5.1
	system-configuration-sys@0.5.0
	tame-index@0.13.1
	tap@1.0.1
	target-lexicon@0.12.16
	tempfile@3.10.1
	termcolor@1.4.1
	thiserror@1.0.63
	thiserror-impl@1.0.63
	time@0.3.36
	time-core@0.1.2
	time-macros@0.2.18
	tinyvec@1.8.0
	tinyvec_macros@0.1.1
	tokio@1.39.2
	tokio-rustls@0.26.0
	tokio-util@0.7.11
	toml@0.7.8
	toml-span@0.3.0
	toml_datetime@0.6.8
	toml_edit@0.19.15
	tower@0.4.13
	tower-layer@0.3.2
	tower-service@0.3.2
	tracing@0.1.40
	tracing-attributes@0.1.27
	tracing-core@0.1.32
	try-lock@0.2.5
	twox-hash@1.6.3
	typenum@1.17.0
	unicode-bidi@0.3.15
	unicode-bom@2.0.3
	unicode-ident@1.0.12
	unicode-normalization@0.1.23
	unicode-width@0.1.13
	untrusted@0.9.0
	url@2.5.2
	utf8parse@0.2.2
	version_check@0.9.5
	walkdir@2.5.0
	want@0.3.1
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen@0.2.92
	wasm-bindgen-backend@0.2.92
	wasm-bindgen-futures@0.4.42
	wasm-bindgen-macro@0.2.92
	wasm-bindgen-macro-support@0.2.92
	wasm-bindgen-shared@0.2.92
	web-sys@0.3.69
	webpki-roots@0.26.3
	winapi@0.3.9
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.8
	winapi-x86_64-pc-windows-gnu@0.4.0
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-targets@0.48.5
	windows-targets@0.52.6
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.6
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.6
	windows_i686_gnullvm@0.52.6
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.6
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.6
	winnow@0.5.40
	winnow@0.6.18
	winreg@0.52.0
	wyz@0.5.1
	zerocopy@0.6.6
	zerocopy@0.7.35
	zerocopy-derive@0.6.6
	zerocopy-derive@0.7.35
	zeroize@1.8.1
	zstd@0.11.2+zstd.1.5.2
	zstd-safe@5.0.2+zstd.1.5.2
	zstd-sys@2.0.12+zstd.1.5.6
"

inherit cargo

DESCRIPTION="Cargo plugin to help you manage large dependency graphs"
HOMEPAGE="https://github.com/EmbarkStudios/cargo-deny"
SRC_URI="
	https://github.com/EmbarkStudios/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="|| ( Apache-2.0 MIT )"
# Dependent crate licenses
LICENSE+="
	Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD-2 BSD ISC MIT MPL-2.0
	Unicode-DFS-2016
"
SLOT="0"
KEYWORDS="~amd64"

RUST_MIN_VER="1.70.0"

# rust does not use *FLAGS from make.conf, silence portage warning
# update with proper path to binaries this crate installs, omit leading /
QA_FLAGS_IGNORED="usr/bin/${PN}"
