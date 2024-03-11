# Copyright 2019-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )

inherit python-single-r1

DESCRIPTION="Google Cloud SDK"
HOMEPAGE="https://cloud.google.com/sdk/"
SRC_URI="https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/${P}-linux-x86_64.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="${PYTHON_DEPS}"
RDEPEND="${DEPEND}"

S="${WORKDIR}/google-cloud-sdk"

src_prepare() {
	default

	rm -rf "platform/gsutil/third_party/crcmod_osx"

	rm -rf "platform/gsutil_py2"
	find -type d -name "python2" -prune -exec rm -rf "{}" \;

	rm -rf "platform/bundledpythonunix"

	python_fix_shebang --force .
}

src_install() {
	dodir /usr/share/google-cloud-sdk
	cp -R "${S}/" "${ED}/usr/share/" || die "Install failed!"
	dosym "../share/google-cloud-sdk/bin/gcloud" /usr/bin/gcloud
	dosym "../share/google-cloud-sdk/bin/gsutil" /usr/bin/gsutil
	dosym "../share/google-cloud-sdk/bin/docker-credential-gcloud" /usr/bin/docker-credential-gcloud
	python_optimize "${ED}/usr/share/google-cloud-sdk"
}
