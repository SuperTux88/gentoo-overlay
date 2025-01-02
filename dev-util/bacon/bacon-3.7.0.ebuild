# Copyright 2023-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.5.4-r1

EAPI=8

CRATES="
	adler2@2.0.0
	ahash@0.8.11
	aho-corasick@1.1.3
	allocator-api2@0.2.21
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	anstream@0.6.18
	anstyle@1.0.10
	anstyle-parse@0.2.6
	anstyle-query@1.1.2
	anstyle-wincon@3.0.6
	anyhow@1.0.95
	arc-swap@1.7.1
	arrayvec@0.5.2
	autocfg@1.4.0
	bitflags@1.3.2
	bitflags@2.6.0
	bstr@1.11.1
	bumpalo@3.16.0
	camino@1.1.9
	cargo-platform@0.1.9
	cargo_metadata@0.19.1
	cc@1.2.6
	cfg-if@1.0.0
	cfg_aliases@0.2.1
	chrono@0.4.39
	clap@4.5.23
	clap-help@1.3.1
	clap_builder@4.5.23
	clap_derive@4.5.18
	clap_lex@0.7.4
	cli-log@2.1.0
	clru@0.6.2
	colorchoice@1.0.3
	coolor@1.0.0
	core-foundation-sys@0.8.7
	crc32fast@1.4.2
	crokey@1.1.0
	crokey-proc_macros@1.1.0
	crossbeam@0.8.4
	crossbeam-channel@0.5.14
	crossbeam-deque@0.8.6
	crossbeam-epoch@0.9.18
	crossbeam-queue@0.3.12
	crossbeam-utils@0.8.21
	crossterm@0.28.1
	crossterm_winapi@0.9.1
	directories-next@2.0.0
	dirs-sys-next@0.1.2
	displaydoc@0.2.5
	dunce@1.0.5
	equivalent@1.0.1
	errno@0.3.10
	faster-hex@0.9.0
	fastrand@2.3.0
	file-size@1.0.3
	filetime@0.2.25
	flate2@1.0.35
	fnv@1.0.7
	form_urlencoded@1.2.1
	fsevent-sys@4.1.0
	getrandom@0.2.15
	gix@0.67.0
	gix-actor@0.33.1
	gix-bitmap@0.2.13
	gix-chunk@0.4.10
	gix-commitgraph@0.25.1
	gix-config@0.41.0
	gix-config-value@0.14.10
	gix-date@0.9.3
	gix-diff@0.47.0
	gix-discover@0.36.0
	gix-features@0.39.1
	gix-fs@0.12.1
	gix-glob@0.17.1
	gix-hash@0.15.1
	gix-hashtable@0.6.0
	gix-ignore@0.12.1
	gix-index@0.36.0
	gix-lock@15.0.1
	gix-object@0.45.0
	gix-odb@0.64.0
	gix-pack@0.54.0
	gix-path@0.10.13
	gix-quote@0.4.14
	gix-ref@0.48.0
	gix-refspec@0.26.0
	gix-revision@0.30.0
	gix-revwalk@0.16.0
	gix-sec@0.10.10
	gix-tempfile@15.0.0
	gix-trace@0.1.11
	gix-traverse@0.42.0
	gix-url@0.28.2
	gix-utils@0.1.13
	gix-validate@0.9.2
	gix-worktree@0.37.0
	glob@0.3.1
	hashbrown@0.14.5
	hashbrown@0.15.2
	heck@0.5.0
	home@0.5.11
	iana-time-zone@0.1.61
	iana-time-zone-haiku@0.1.2
	icu_collections@1.5.0
	icu_locid@1.5.0
	icu_locid_transform@1.5.0
	icu_locid_transform_data@1.5.0
	icu_normalizer@1.5.0
	icu_normalizer_data@1.5.0
	icu_properties@1.5.1
	icu_properties_data@1.5.0
	icu_provider@1.5.0
	icu_provider_macros@1.5.0
	idna@1.0.3
	idna_adapter@1.2.0
	indexmap@2.7.0
	inotify@0.10.2
	inotify-sys@0.1.5
	instant@0.1.13
	iq@0.2.1
	is_terminal_polyfill@1.70.1
	itoa@1.0.14
	jiff@0.1.16
	jiff-tzdb@0.1.1
	jiff-tzdb-platform@0.1.1
	js-sys@0.3.76
	kqueue@1.0.8
	kqueue-sys@1.0.4
	lazy-regex@3.4.1
	lazy-regex-proc_macros@3.4.1
	libc@0.2.169
	libredox@0.1.3
	linux-raw-sys@0.4.14
	litemap@0.7.4
	lock_api@0.4.12
	log@0.4.22
	memchr@2.7.4
	memmap2@0.9.5
	minimad@0.13.1
	miniz_oxide@0.8.2
	mio@1.0.3
	nix@0.29.0
	notify@7.0.0
	notify-types@1.0.1
	num-traits@0.2.19
	once_cell@1.20.2
	parking_lot@0.12.3
	parking_lot_core@0.9.10
	percent-encoding@2.3.1
	proc-macro2@1.0.92
	proc-status@0.1.1
	prodash@29.0.0
	quote@1.0.38
	redox_syscall@0.5.8
	redox_users@0.4.6
	regex@1.11.1
	regex-automata@0.4.9
	regex-syntax@0.8.5
	rustc-hash@2.1.0
	rustix@0.38.42
	ryu@1.0.18
	same-file@1.0.6
	scopeguard@1.2.0
	semver@1.0.24
	serde@1.0.216
	serde_derive@1.0.216
	serde_json@1.0.134
	serde_spanned@0.6.8
	sha1_smol@1.0.1
	shlex@1.3.0
	signal-hook@0.3.17
	signal-hook-mio@0.2.4
	signal-hook-registry@1.4.2
	smallvec@1.13.2
	stable_deref_trait@1.2.0
	strict@0.2.0
	strsim@0.11.1
	syn@1.0.109
	syn@2.0.92
	synstructure@0.13.1
	tempfile@3.14.0
	termimad@0.31.1
	terminal-light@1.7.0
	thiserror@1.0.69
	thiserror@2.0.9
	thiserror-impl@1.0.69
	thiserror-impl@2.0.9
	tinystr@0.7.6
	tinyvec@1.8.1
	tinyvec_macros@0.1.1
	toml@0.8.19
	toml_datetime@0.6.8
	toml_edit@0.22.22
	unicode-bom@2.0.3
	unicode-ident@1.0.14
	unicode-normalization@0.1.24
	unicode-width@0.1.14
	unicode-width@0.2.0
	url@2.5.4
	utf16_iter@1.0.5
	utf8_iter@1.0.4
	utf8parse@0.2.2
	version_check@0.9.5
	vte@0.8.0
	vte_generate_state_changes@0.1.2
	walkdir@2.5.0
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen@0.2.99
	wasm-bindgen-backend@0.2.99
	wasm-bindgen-macro@0.2.99
	wasm-bindgen-macro-support@0.2.99
	wasm-bindgen-shared@0.2.99
	winapi@0.3.9
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.9
	winapi-x86_64-pc-windows-gnu@0.4.0
	windows-core@0.52.0
	windows-sys@0.52.0
	windows-sys@0.59.0
	windows-targets@0.52.6
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_msvc@0.52.6
	windows_i686_gnu@0.52.6
	windows_i686_gnullvm@0.52.6
	windows_i686_msvc@0.52.6
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_msvc@0.52.6
	winnow@0.6.20
	write16@1.0.0
	writeable@0.5.5
	xterm-query@0.5.0
	yoke@0.7.5
	yoke-derive@0.7.5
	zerocopy@0.7.35
	zerocopy-derive@0.7.35
	zerofrom@0.1.5
	zerofrom-derive@0.1.5
	zerovec@0.10.4
	zerovec-derive@0.10.3
"

inherit cargo

DESCRIPTION="background rust compiler"
HOMEPAGE="https://dystroy.org/bacon https://github.com/Canop/bacon"
SRC_URI="
	https://github.com/Canop/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="AGPL-3"
# Dependent crate licenses
LICENSE+=" Apache-2.0 BSD CC0-1.0 ISC MIT Unicode-3.0"
SLOT="0"
KEYWORDS="~amd64"

RUST_MIN_VER="1.76.0"

# rust does not use *FLAGS from make.conf, silence portage warning
# update with proper path to binaries this crate installs, omit leading /
QA_FLAGS_IGNORED="usr/bin/${PN}"
QA_PRESTRIPPED="${QA_FLAGS_IGNORED}"