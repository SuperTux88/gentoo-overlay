# Copyright 2019-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )

inherit python-single-r1

DESCRIPTION="Google Cloud CLI"
HOMEPAGE="https://cloud.google.com/sdk/"
SRC_URI="https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/${P}-linux-x86_64.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="anthoscli"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="${PYTHON_DEPS}"
RDEPEND="${DEPEND}"

S="${WORKDIR}/google-cloud-sdk"

src_prepare() {
	default

	rm -rf deb rpm install.*
	rm -rf "platform/gsutil/third_party/crcmod_osx"
	rm -rf "platform/bundledpythonunix"
	find -type d -name "python2" -prune -exec rm -rf "{}" \;

	use anthoscli || rm bin/anthoscli

	python_fix_shebang --force .
}

src_install() {
	dodir /usr/share/google-cloud-sdk
	cp -R "${S}/" "${ED}/usr/share/" || die "Install failed!"

	dosym "../share/google-cloud-sdk/bin/gcloud" /usr/bin/gcloud
	dosym "../share/google-cloud-sdk/bin/gcloud-crc32c" /usr/bin/gcloud-crc32c
	dosym "../share/google-cloud-sdk/bin/gsutil" /usr/bin/gsutil
	dosym "../share/google-cloud-sdk/bin/bq" /usr/bin/bq
	dosym "../share/google-cloud-sdk/bin/docker-credential-gcloud" /usr/bin/docker-credential-gcloud
	dosym "../share/google-cloud-sdk/bin/git-credential-gcloud.sh" /usr/bin/git-credential-gcloud.sh

	use anthoscli && dosym "../share/google-cloud-sdk/bin/anthoscli" /usr/bin/anthoscli

	python_optimize "${ED}/usr/share/google-cloud-sdk"
}
