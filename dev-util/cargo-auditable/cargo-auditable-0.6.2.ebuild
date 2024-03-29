# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.5.4-r1

EAPI=8

CRATES="
	adler@1.0.2
	ahash@0.8.3
	autocfg@1.1.0
	binfarce@0.2.1
	camino@1.1.1
	cargo-lock@9.0.0
	cargo-platform@0.1.2
	cargo_metadata@0.15.0
	cfg-if@1.0.0
	crc32fast@1.3.2
	dyn-clone@1.0.9
	either@1.8.0
	form_urlencoded@1.1.0
	hashbrown@0.12.3
	hashbrown@0.13.2
	idna@0.3.0
	indexmap@1.9.1
	itoa@1.0.3
	libc@0.2.132
	memchr@2.5.0
	miniz_oxide@0.6.2
	object@0.30.3
	once_cell@1.14.0
	percent-encoding@2.2.0
	pico-args@0.5.0
	proc-macro2@1.0.43
	quote@1.0.21
	ryu@1.0.11
	schemars@0.8.10
	schemars_derive@0.8.10
	semver@1.0.14
	serde@1.0.147
	serde_derive@1.0.147
	serde_derive_internals@0.26.0
	serde_json@1.0.85
	serde_spanned@0.6.1
	syn@1.0.99
	tinyvec@1.6.0
	tinyvec_macros@0.1.0
	toml@0.7.3
	toml_datetime@0.6.1
	toml_edit@0.19.8
	topological-sort@0.2.2
	unicode-bidi@0.3.8
	unicode-ident@1.0.4
	unicode-normalization@0.1.22
	url@2.3.1
	version_check@0.9.4
	which@4.3.0
	winnow@0.4.1
"

inherit cargo

DESCRIPTION="Make production Rust binaries auditable"
HOMEPAGE="https://github.com/rust-secure-code/cargo-auditable"
SRC_URI="
	https://github.com/rust-secure-code/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="|| ( Apache-2.0 MIT )"
# Dependent crate licenses
LICENSE+="
	MIT Unicode-DFS-2016
	|| ( Apache-2.0 Boost-1.0 )
"
SLOT="0"
KEYWORDS="~amd64"

# rust does not use *FLAGS from make.conf, silence portage warning
# update with proper path to binaries this crate installs, omit leading /
QA_FLAGS_IGNORED="usr/bin/${PN}"

src_compile() {
	cargo_src_compile --bin ${PN}
}

src_install() {
	cargo_src_install --path ${PN}

	einstalldocs
	doman "${PN}/${PN}.1"
}
