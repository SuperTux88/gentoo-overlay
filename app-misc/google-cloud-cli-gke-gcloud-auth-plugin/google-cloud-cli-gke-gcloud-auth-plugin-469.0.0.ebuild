# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker

DEB_SHA="aac162ffb67104c2c0a78d1cf48f579e8afcf43aef6cb8cf250980ef58aed612"

DESCRIPTION="A kubectl authentication plugin for GKE"
HOMEPAGE="https://cloud.google.com/blog/products/containers-kubernetes/kubectl-auth-changes-in-gke"
SRC_URI="https://packages.cloud.google.com/apt/pool/${PN}_${PV}-0_amd64_${DEB_SHA}.deb"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="~app-misc/google-cloud-cli-${PV}"
RDEPEND="${DEPEND}"

S="${WORKDIR}/usr/lib/google-cloud-sdk"

QA_PRESTRIPPED="usr/share/google-cloud-sdk/bin/gke-gcloud-auth-plugin"

src_unpack() {
	unpack_deb ${A}
}

src_install() {
	dodir /usr/share/google-cloud-sdk
	cp -R "${S}/" "${ED}/usr/share/" || die "Install failed!"
	dosym "../share/google-cloud-sdk/bin/gke-gcloud-auth-plugin" /usr/bin/gke-gcloud-auth-plugin
}
