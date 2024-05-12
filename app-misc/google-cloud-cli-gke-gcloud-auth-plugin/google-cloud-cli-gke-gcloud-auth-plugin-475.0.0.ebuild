# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker

DEB_SHA="c6e38b96c1c5fa9934817fc1787648a3fc802e3f3cc6344099e41cbae4a0d307"

DESCRIPTION="A kubectl authentication plugin for GKE"
HOMEPAGE="https://cloud.google.com/blog/products/containers-kubernetes/kubectl-auth-changes-in-gke"
SRC_URI="https://packages.cloud.google.com/apt/pool/${PN}_${PV}-0_amd64_${DEB_SHA}.deb"

S="${WORKDIR}/usr/lib/google-cloud-sdk"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="~app-misc/google-cloud-cli-${PV}"
RDEPEND="${DEPEND}"

QA_PRESTRIPPED="usr/share/google-cloud-sdk/bin/gke-gcloud-auth-plugin"

src_unpack() {
	unpack_deb ${A}
}

src_install() {
	dodir /usr/share/google-cloud-sdk
	cp -R "${S}/" "${ED}/usr/share/" || die "Install failed!"
	dosym "../share/google-cloud-sdk/bin/gke-gcloud-auth-plugin" /usr/bin/gke-gcloud-auth-plugin
}
