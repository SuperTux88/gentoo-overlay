# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.5.4-r1

EAPI=8

CRATES="
	addr2line@0.21.0
	adler@1.0.2
	aes@0.8.4
	ahash@0.7.8
	ahash@0.8.11
	aho-corasick@0.7.20
	aho-corasick@1.1.2
	aligned@0.4.1
	ansi_term@0.12.1
	anstream@0.6.13
	anstyle@1.0.6
	anstyle-parse@0.2.3
	anstyle-query@1.0.2
	anstyle-wincon@3.0.2
	anyhow@1.0.80
	arc-swap@1.7.0
	as-slice@0.2.1
	async-recursion@1.0.5
	async-trait@0.1.77
	autocfg@1.1.0
	axum@0.6.20
	axum-core@0.3.4
	axum-server@0.5.1
	backtrace@0.3.69
	base64@0.21.7
	base64-simd@0.7.0
	base64ct@1.6.0
	bitflags@1.3.2
	bitflags@2.4.2
	bitvec@1.0.1
	block-buffer@0.10.4
	bumpalo@3.15.4
	bytecheck@0.6.12
	bytecheck_derive@0.6.12
	bytemuck@1.14.3
	byteorder@1.5.0
	bytes@1.5.0
	bzip2@0.4.4
	bzip2-sys@0.1.11+1.0.8
	camino@1.1.6
	cargo-lock@9.0.0
	cargo-platform@0.1.7
	cargo_metadata@0.18.1
	cc@1.0.90
	cfg-if@1.0.0
	chrono@0.4.35
	cipher@0.4.4
	clap@4.5.2
	clap_builder@4.5.2
	clap_derive@4.5.0
	clap_lex@0.7.0
	colorchoice@1.0.0
	console@0.15.8
	const-str@0.3.2
	const-str-proc-macro@0.3.2
	constant_time_eq@0.1.5
	convert_case@0.4.0
	core-foundation@0.9.4
	core-foundation-sys@0.8.6
	cpufeatures@0.2.12
	crates_io_api@0.9.0
	crc32fast@1.4.0
	crossbeam-channel@0.5.12
	crossbeam-deque@0.8.5
	crossbeam-epoch@0.9.18
	crossbeam-utils@0.8.19
	crypto-common@0.1.6
	cssparser@0.27.2
	cssparser@0.33.0
	cssparser-color@0.1.0
	cssparser-macros@0.6.1
	cvt@0.1.2
	dashmap@5.5.3
	data-encoding@2.5.0
	data-url@0.1.1
	deranged@0.3.11
	derive_more@0.99.17
	digest@0.10.7
	directories@5.0.1
	dirs-sys@0.4.1
	dtoa@1.0.9
	dtoa-short@0.3.4
	dunce@1.0.4
	either@1.10.0
	encode_unicode@0.3.6
	encoding_rs@0.8.33
	enum-as-inner@0.6.0
	env_logger@0.10.2
	envy@0.4.2
	equivalent@1.0.1
	errno@0.3.8
	fastrand@2.0.1
	file-id@0.2.1
	filetime@0.2.23
	flate2@1.0.28
	fnv@1.0.7
	foreign-types@0.3.2
	foreign-types-shared@0.1.1
	form_urlencoded@1.2.1
	fs_at@0.1.10
	fsevent-sys@4.1.0
	funty@2.0.0
	futf@0.1.5
	futures@0.3.30
	futures-channel@0.3.30
	futures-core@0.3.30
	futures-executor@0.3.30
	futures-io@0.3.30
	futures-macro@0.3.30
	futures-sink@0.3.30
	futures-task@0.3.30
	futures-util@0.3.30
	fxhash@0.2.1
	generic-array@0.14.7
	getrandom@0.1.16
	getrandom@0.2.12
	gimli@0.28.1
	glob@0.3.1
	h2@0.3.24
	hashbrown@0.12.3
	hashbrown@0.13.2
	hashbrown@0.14.3
	heck@0.4.1
	hermit-abi@0.3.9
	hmac@0.12.1
	home@0.5.9
	hostname@0.3.1
	html5ever@0.25.2
	htmlescape@0.3.1
	http@0.2.12
	http-body@0.4.6
	http-range-header@0.3.1
	httparse@1.8.0
	httpdate@1.0.3
	humantime@2.1.0
	humantime-serde@1.1.1
	hyper@0.14.28
	hyper-rustls@0.24.2
	hyper-tls@0.5.0
	idna@0.4.0
	idna@0.5.0
	indexmap@2.2.5
	inotify@0.9.6
	inotify-sys@0.1.5
	inout@0.1.3
	ipconfig@0.3.2
	ipnet@2.9.0
	is-docker@0.2.0
	is-terminal@0.4.12
	is-wsl@0.4.0
	itertools@0.10.5
	itertools@0.12.1
	itoa@0.4.8
	itoa@1.0.10
	jobserver@0.1.28
	js-sys@0.3.69
	kqueue@1.0.8
	kqueue-sys@1.0.4
	lazy_static@1.4.0
	libc@0.2.153
	libdeflate-sys@1.19.3
	libdeflater@1.19.3
	libredox@0.0.1
	lightningcss@1.0.0-alpha.54
	linked-hash-map@0.5.6
	linux-raw-sys@0.4.13
	local-ip-address@0.6.1
	lock_api@0.4.11
	log@0.4.21
	lru-cache@0.1.2
	mac@0.1.1
	markup5ever@0.10.1
	match_cfg@0.1.0
	matchers@0.1.0
	matches@0.1.10
	matchit@0.7.3
	memchr@2.7.1
	mime@0.3.17
	mime_guess@2.0.4
	minify-html@0.15.0
	minify-html-common@0.0.2
	minify-js@0.5.6
	miniz_oxide@0.7.2
	mio@0.8.11
	native-tls@0.2.11
	neli@0.6.4
	neli-proc-macros@0.1.3
	new_debug_unreachable@1.0.4
	nipper@0.1.9
	nix@0.26.4
	nodrop@0.1.14
	normpath@1.2.0
	notify@6.1.1
	notify-debouncer-full@0.3.1
	nu-ansi-term@0.46.0
	num-conv@0.1.0
	num-traits@0.2.18
	num_cpus@1.16.0
	object@0.32.2
	once_cell@1.19.0
	open@5.1.2
	openssl@0.10.64
	openssl-macros@0.1.1
	openssl-probe@0.1.5
	openssl-sys@0.9.101
	option-ext@0.2.0
	outref@0.1.0
	overload@0.1.1
	oxipng@9.0.0
	parcel_selectors@0.26.4
	parcel_sourcemap@2.1.1
	parking_lot@0.12.1
	parking_lot_core@0.9.9
	parse-js@0.17.0
	password-hash@0.4.2
	paste@1.0.14
	pathdiff@0.2.1
	pbkdf2@0.11.0
	percent-encoding@2.3.1
	phf@0.8.0
	phf@0.10.1
	phf@0.11.2
	phf_codegen@0.8.0
	phf_codegen@0.10.0
	phf_generator@0.8.0
	phf_generator@0.10.0
	phf_generator@0.11.2
	phf_macros@0.8.0
	phf_macros@0.11.2
	phf_shared@0.8.0
	phf_shared@0.10.0
	phf_shared@0.11.2
	pin-project@1.1.5
	pin-project-internal@1.1.5
	pin-project-lite@0.2.13
	pin-utils@0.1.0
	pkg-config@0.3.30
	powerfmt@0.2.0
	ppv-lite86@0.2.17
	precomputed-hash@0.1.1
	proc-macro-hack@0.5.20+deprecated
	proc-macro2@1.0.78
	ptr_meta@0.1.4
	ptr_meta_derive@0.1.4
	quick-error@1.2.3
	quote@1.0.35
	radium@0.7.0
	rand@0.7.3
	rand@0.8.5
	rand_chacha@0.2.2
	rand_chacha@0.3.1
	rand_core@0.5.1
	rand_core@0.6.4
	rand_hc@0.2.0
	rand_pcg@0.2.1
	rayon@1.9.0
	rayon-core@1.12.1
	redox_syscall@0.4.1
	redox_users@0.4.4
	regex@1.10.3
	regex-automata@0.1.10
	regex-automata@0.4.6
	regex-syntax@0.6.29
	regex-syntax@0.8.2
	remove_dir_all@0.8.2
	rend@0.4.2
	reqwest@0.11.24
	resolv-conf@0.7.0
	rgb@0.8.37
	ring@0.17.8
	rkyv@0.7.44
	rkyv_derive@0.7.44
	rustc-demangle@0.1.23
	rustc-hash@1.1.0
	rustc_version@0.4.0
	rustix@0.38.31
	rustls@0.21.10
	rustls-native-certs@0.6.3
	rustls-pemfile@1.0.4
	rustls-webpki@0.101.7
	rustversion@1.0.14
	ryu@1.0.17
	same-file@1.0.6
	schannel@0.1.23
	scopeguard@1.2.0
	sct@0.7.1
	seahash@4.1.0
	security-framework@2.9.2
	security-framework-sys@2.9.1
	selectors@0.22.0
	semver@1.0.22
	serde@1.0.197
	serde_derive@1.0.197
	serde_json@1.0.114
	serde_path_to_error@0.1.15
	serde_spanned@0.6.5
	serde_urlencoded@0.7.1
	servo_arc@0.1.1
	sha1@0.10.6
	sha2@0.10.8
	sharded-slab@0.1.7
	signal-hook-registry@1.4.1
	simd-abstraction@0.7.1
	simd-adler32@0.3.7
	simdutf8@0.1.4
	siphasher@0.3.11
	slab@0.4.9
	smallvec@1.13.1
	socket2@0.5.6
	spin@0.9.8
	stable_deref_trait@1.2.0
	string_cache@0.8.7
	string_cache_codegen@0.5.2
	strsim@0.11.0
	strum@0.26.1
	strum_macros@0.26.1
	subtle@2.5.0
	syn@1.0.109
	syn@2.0.52
	sync_wrapper@0.1.2
	system-configuration@0.5.1
	system-configuration-sys@0.5.0
	tap@1.0.1
	tar@0.4.40
	tempfile@3.10.1
	tendril@0.4.3
	termcolor@1.4.1
	terminal_size@0.3.0
	thin-slice@0.1.1
	thiserror@1.0.57
	thiserror-impl@1.0.57
	thread_local@1.1.8
	time@0.3.34
	time-core@0.1.2
	time-macros@0.2.17
	tinyvec@1.6.0
	tinyvec_macros@0.1.1
	tokio@1.36.0
	tokio-macros@2.2.0
	tokio-native-tls@0.3.1
	tokio-openssl@0.6.4
	tokio-rustls@0.24.1
	tokio-stream@0.1.14
	tokio-tungstenite@0.20.1
	tokio-util@0.7.10
	toml@0.7.8
	toml@0.8.10
	toml_datetime@0.6.5
	toml_edit@0.19.15
	toml_edit@0.22.6
	tower@0.4.13
	tower-http@0.4.4
	tower-layer@0.3.2
	tower-service@0.3.2
	tracing@0.1.40
	tracing-attributes@0.1.27
	tracing-core@0.1.32
	tracing-log@0.2.0
	tracing-subscriber@0.3.18
	trust-dns-proto@0.23.2
	trust-dns-resolver@0.23.2
	try-lock@0.2.5
	tungstenite@0.20.1
	typed-arena@2.0.2
	typenum@1.17.0
	unicase@2.7.0
	unicode-bidi@0.3.15
	unicode-ident@1.0.12
	unicode-normalization@0.1.23
	unicode-width@0.1.11
	untrusted@0.9.0
	url@2.5.0
	utf-8@0.7.6
	utf8parse@0.2.1
	uuid@1.7.0
	valuable@0.1.0
	vcpkg@0.2.15
	version_check@0.9.4
	vlq@0.5.1
	walkdir@2.5.0
	want@0.3.1
	wasi@0.9.0+wasi-snapshot-preview1
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen@0.2.92
	wasm-bindgen-backend@0.2.92
	wasm-bindgen-futures@0.4.42
	wasm-bindgen-macro@0.2.92
	wasm-bindgen-macro-support@0.2.92
	wasm-bindgen-shared@0.2.92
	wasm-streams@0.4.0
	web-sys@0.3.69
	webpki-roots@0.25.4
	which@6.0.0
	widestring@1.0.2
	winapi@0.3.9
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.6
	winapi-x86_64-pc-windows-gnu@0.4.0
	windows-sys@0.45.0
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-targets@0.42.2
	windows-targets@0.48.5
	windows-targets@0.52.4
	windows_aarch64_gnullvm@0.42.2
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.4
	windows_aarch64_msvc@0.42.2
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.4
	windows_i686_gnu@0.42.2
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.4
	windows_i686_msvc@0.42.2
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.4
	windows_x86_64_gnu@0.42.2
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.4
	windows_x86_64_gnullvm@0.42.2
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.4
	windows_x86_64_msvc@0.42.2
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.4
	winnow@0.5.40
	winnow@0.6.5
	winreg@0.50.0
	wyz@0.5.1
	xattr@1.3.1
	zerocopy@0.7.32
	zerocopy-derive@0.7.32
	zip@0.6.6
	zopfli@0.8.0
	zstd@0.11.2+zstd.1.5.2
	zstd-safe@5.0.2+zstd.1.5.2
	zstd-sys@2.0.9+zstd.1.5.5
"

inherit cargo

DESCRIPTION="Build, bundle & ship your Rust WASM application to the web."
HOMEPAGE="https://trunkrs.dev"
SRC_URI="
	https://github.com/thedodd/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="|| ( Apache-2.0 MIT )"
# Dependent crate licenses
LICENSE+=" Apache-2.0 BSD CC0-1.0 ISC MIT MPL-2.0 Unicode-DFS-2016"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND=">=virtual/rust-1.74"

# rust does not use *FLAGS from make.conf, silence portage warning
# update with proper path to binaries this crate installs, omit leading /
QA_FLAGS_IGNORED="usr/bin/${PN}"