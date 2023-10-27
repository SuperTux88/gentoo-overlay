# Copyright 2022-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.5.4-r1

EAPI=8

CRATES="
	addr2line@0.20.0
	addr2line@0.21.0
	adler@1.0.2
	ahash@0.8.3
	aho-corasick@1.0.5
	aliasable@0.1.3
	allocator-api2@0.2.16
	ambient-authority@0.0.2
	anyhow@1.0.75
	arbitrary@1.3.0
	arrayref@0.3.7
	arrayvec@0.7.4
	async-trait@0.1.73
	autocfg@1.1.0
	backtrace@0.3.69
	base64@0.21.4
	base64-simd@0.8.0
	bincode@1.3.3
	bindgen@0.59.2
	bitflags@1.3.2
	bitflags@2.4.0
	bitvec@1.0.1
	bumpalo@3.13.0
	bytemuck@1.14.0
	bytemuck_derive@1.5.0
	byteorder@1.4.3
	bytes@1.5.0
	cap-fs-ext@2.0.0
	cap-primitives@2.0.0
	cap-rand@2.0.0
	cap-std@2.0.0
	cap-time-ext@2.0.0
	cc@1.0.83
	cexpr@0.6.0
	cfg-if@1.0.0
	clang-sys@1.6.1
	color_quant@1.1.0
	core-foundation@0.9.3
	core-foundation-sys@0.8.4
	cosmic-text@0.9.0
	cpp_demangle@0.3.5
	cranelift-bforest@0.99.1
	cranelift-codegen@0.99.1
	cranelift-codegen-meta@0.99.1
	cranelift-codegen-shared@0.99.1
	cranelift-control@0.99.1
	cranelift-entity@0.99.1
	cranelift-frontend@0.99.1
	cranelift-isle@0.99.1
	cranelift-native@0.99.1
	cranelift-wasm@0.99.1
	crc32fast@1.3.2
	crossbeam-channel@0.5.8
	crossbeam-deque@0.8.3
	crossbeam-epoch@0.9.15
	crossbeam-utils@0.8.16
	debugid@0.8.0
	deranged@0.3.8
	dirs@4.0.0
	dirs-sys@0.3.7
	doc-comment@0.3.3
	either@1.9.0
	encoding_rs@0.8.33
	equivalent@1.0.1
	errno@0.2.8
	errno@0.3.3
	errno-dragonfly@0.1.2
	evdev@0.12.1
	fallible-iterator@0.2.0
	fd-lock@4.0.0
	fdeflate@0.3.0
	flate2@1.0.27
	fnv@1.0.7
	fontdb@0.14.1
	form_urlencoded@1.2.0
	fs-set-times@0.20.0
	funty@2.0.0
	futures@0.3.28
	futures-channel@0.3.28
	futures-core@0.3.28
	futures-io@0.3.28
	futures-macro@0.3.28
	futures-sink@0.3.28
	futures-task@0.3.28
	futures-util@0.3.28
	fxhash@0.2.1
	fxprof-processed-profile@0.6.0
	getrandom@0.2.10
	gif@0.12.0
	gimli@0.27.3
	gimli@0.28.0
	glob@0.3.1
	h2@0.3.21
	hashbrown@0.12.3
	hashbrown@0.13.2
	hashbrown@0.14.0
	heck@0.4.1
	hermit-abi@0.3.2
	http@0.2.9
	http-body@0.4.5
	httparse@1.8.0
	httpdate@1.0.3
	hyper@0.14.27
	hyper-rustls@0.24.1
	id-arena@2.2.1
	idna@0.4.0
	image@0.24.7
	indexmap@1.9.3
	indexmap@2.0.0
	io-extras@0.18.0
	io-lifetimes@1.0.11
	io-lifetimes@2.0.2
	ipnet@2.8.0
	is-docker@0.2.0
	is-terminal@0.4.9
	is-wsl@0.4.0
	itertools@0.10.5
	itoa@1.0.9
	jpeg-decoder@0.3.0
	js-sys@0.3.64
	lazy_static@1.4.0
	lazycell@1.3.0
	leb128@0.2.5
	libc@0.2.147
	libloading@0.7.4
	libm@0.2.7
	libproc@0.12.0
	linux-raw-sys@0.3.8
	linux-raw-sys@0.4.7
	log@0.4.20
	mach@0.3.2
	mach2@0.4.1
	maybe-owned@0.3.4
	memchr@2.6.3
	memfd@0.6.3
	memmap2@0.6.2
	memoffset@0.6.5
	memoffset@0.9.0
	mime@0.3.17
	minimal-lexical@0.2.1
	miniz_oxide@0.7.1
	mio@0.8.8
	nix@0.23.2
	nix@0.27.1
	nom@7.1.3
	ntapi@0.4.1
	num-integer@0.1.45
	num-rational@0.4.1
	num-traits@0.2.16
	num_cpus@1.16.0
	num_threads@0.1.6
	object@0.31.1
	object@0.32.1
	once_cell@1.18.0
	open@5.0.0
	openssl-probe@0.1.5
	outref@0.5.1
	paste@1.0.14
	pathdiff@0.2.1
	peeking_take_while@0.1.2
	percent-encoding@2.3.0
	pin-project-lite@0.2.13
	pin-utils@0.1.0
	pkg-config@0.3.27
	png@0.17.10
	ppv-lite86@0.2.17
	proc-macro2@1.0.66
	proc-maps@0.3.1
	promising-future@0.2.4
	psm@0.1.21
	pulldown-cmark@0.9.3
	quick-xml@0.30.0
	quote@1.0.33
	radium@0.7.0
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	rangemap@1.3.0
	rayon@1.7.0
	rayon-core@1.11.0
	read-process-memory@0.1.6
	redox_syscall@0.2.16
	redox_users@0.4.3
	regalloc2@0.9.2
	regex@1.9.5
	regex-automata@0.3.8
	regex-syntax@0.7.5
	reqwest@0.11.20
	ring@0.16.20
	rustc-demangle@0.1.23
	rustc-hash@1.1.0
	rustix@0.37.23
	rustix@0.38.12
	rustls@0.21.7
	rustls-native-certs@0.6.3
	rustls-pemfile@1.0.3
	rustls-webpki@0.101.4
	rustybuzz@0.8.0
	ryu@1.0.15
	schannel@0.1.22
	scopeguard@1.2.0
	sct@0.7.0
	security-framework@2.9.2
	security-framework-sys@2.9.1
	semver@1.0.18
	serde@1.0.188
	serde_derive@1.0.188
	serde_json@1.0.106
	serde_urlencoded@0.7.1
	shellexpand@2.1.2
	shlex@1.2.0
	simd-adler32@0.3.7
	simdutf8@0.1.4
	slab@0.4.9
	slice-group-by@0.3.1
	slotmap@1.0.6
	smallstr@0.3.0
	smallvec@1.11.0
	snafu@0.7.5
	snafu-derive@0.7.5
	socket2@0.4.9
	socket2@0.5.3
	spin@0.5.2
	sptr@0.3.2
	stable_deref_trait@1.2.0
	strict-num@0.1.1
	syn@1.0.109
	syn@2.0.31
	sys-locale@0.3.1
	sysinfo@0.29.10
	system-interface@0.26.0
	tap@1.0.1
	target-lexicon@0.12.11
	thiserror@1.0.48
	thiserror-impl@1.0.48
	threadpool@1.8.1
	tiff@0.9.0
	time@0.3.28
	time-core@0.1.1
	tiny-skia@0.11.1
	tiny-skia-path@0.11.1
	tinyvec@1.6.0
	tinyvec_macros@0.1.1
	tokio@1.32.0
	tokio-rustls@0.24.1
	tokio-util@0.7.8
	tower-service@0.3.2
	tracing@0.1.37
	tracing-attributes@0.1.26
	tracing-core@0.1.31
	try-lock@0.2.4
	ttf-parser@0.19.1
	unicase@2.7.0
	unicode-bidi@0.3.13
	unicode-bidi-mirroring@0.1.0
	unicode-ccc@0.1.2
	unicode-general-category@0.6.0
	unicode-ident@1.0.11
	unicode-linebreak@0.1.5
	unicode-normalization@0.1.22
	unicode-script@0.5.5
	unicode-segmentation@1.10.1
	unicode-xid@0.2.4
	untrusted@0.7.1
	url@2.4.1
	uuid@1.4.1
	version_check@0.9.4
	vsimd@0.8.0
	want@0.3.1
	wasi@0.11.0+wasi-snapshot-preview1
	wasi-cap-std-sync@12.0.1
	wasi-common@12.0.1
	wasm-bindgen@0.2.87
	wasm-bindgen-backend@0.2.87
	wasm-bindgen-futures@0.4.37
	wasm-bindgen-macro@0.2.87
	wasm-bindgen-macro-support@0.2.87
	wasm-bindgen-shared@0.2.87
	wasm-encoder@0.31.1
	wasmparser@0.110.0
	wasmparser@0.112.0
	wasmprinter@0.2.64
	wasmtime@12.0.1
	wasmtime-asm-macros@12.0.1
	wasmtime-component-macro@12.0.1
	wasmtime-component-util@12.0.1
	wasmtime-cranelift@12.0.1
	wasmtime-cranelift-shared@12.0.1
	wasmtime-environ@12.0.1
	wasmtime-fiber@12.0.1
	wasmtime-jit@12.0.1
	wasmtime-jit-debug@12.0.1
	wasmtime-jit-icache-coherence@12.0.1
	wasmtime-runtime@12.0.1
	wasmtime-types@12.0.1
	wasmtime-versioned-export-macros@12.0.1
	wasmtime-wasi@12.0.1
	wasmtime-winch@12.0.1
	wasmtime-wit-bindgen@12.0.1
	wast@35.0.2
	web-sys@0.3.64
	weezl@0.1.7
	wiggle@12.0.1
	wiggle-generate@12.0.1
	wiggle-macro@12.0.1
	winapi@0.3.9
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-x86_64-pc-windows-gnu@0.4.0
	winch-codegen@0.10.1
	windows-sys@0.48.0
	windows-targets@0.48.5
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_msvc@0.48.5
	windows_i686_gnu@0.48.5
	windows_i686_msvc@0.48.5
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_msvc@0.48.5
	winreg@0.50.0
	winx@0.36.2
	wit-parser@0.9.2
	witx@0.9.1
	wyz@0.5.1
	x11-dl@2.21.0
"

declare -A GIT_CRATES=(
	[livesplit-auto-splitting]='https://github.com/LiveSplit/livesplit-core;c487b50359835dbd35aead866c12e91e96ecc303;livesplit-core-%commit%/crates/livesplit-auto-splitting'
	[livesplit-core]='https://github.com/LiveSplit/livesplit-core;c487b50359835dbd35aead866c12e91e96ecc303;livesplit-core-%commit%'
	[livesplit-hotkey]='https://github.com/LiveSplit/livesplit-core;c487b50359835dbd35aead866c12e91e96ecc303;livesplit-core-%commit%/crates/livesplit-hotkey'
	[livesplit-title-abbreviations]='https://github.com/LiveSplit/livesplit-core;c487b50359835dbd35aead866c12e91e96ecc303;livesplit-core-%commit%/crates/livesplit-title-abbreviations'
)

inherit cargo

DESCRIPTION="A plugin for OBS Studio that allows adding LiveSplit One as a source"
HOMEPAGE="https://github.com/LiveSplit/obs-livesplit-one"
SRC_URI="
	https://github.com/LiveSplit/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="|| ( Apache-2.0 MIT )"
# Dependent crate licenses
LICENSE+="
	Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD-2 BSD ISC MIT
	Unicode-DFS-2016 ZLIB
"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+auto-splitting"

DEPEND="media-video/obs-studio"
RDEPEND="${DEPEND}"
BDEPEND="dev-util/patchelf"

src_configure() {
	local myfeatures=(
		$(usev auto-splitting)
	)
	cargo_src_configure --no-default-features
}

src_compile() {
	cargo_src_compile

	# obs-livesplit-one uses libobs.so, but the metadata of media-video/obs-studio only provide libobs.so.0
	# (but libobs.so is available too, but not in metadata)
	# This prevents the "QA Notice: Unresolved soname dependencies" warning
	patchelf --replace-needed libobs.so libobs.so.0 "${S}/target/release/libobs_livesplit_one.so"
}

src_install() {
	insinto /usr/lib64/obs-plugins
	doins "${S}/target/release/libobs_livesplit_one.so"
}