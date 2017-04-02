# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="Omnibus installation of ChefDK"
HOMEPAGE="https://downloads.chef.io/chef-dk/"
SRC_URI="https://opscode-omnibus-packages.s3.amazonaws.com/debian/6/x86_64/chefdk_0.7.0-1_amd64.deb"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	!app-admin/test-kitchen
	!app-admin/berkshelf
"

S="${WORKDIR}"

src_unpack() {
	unpack ${A} ./data.tar.gz
}

src_install() {
	local dest="${D}/opt"
	mkdir -p "$dest"

	cp -pR ./opt/* "$dest"

	dosym "$dest/chefdk/bin/chef-client" /usr/bin/chef-client || die
	dosym "$dest/chefdk/bin/chef-solo" /usr/bin/chef-solo     || die
	dosym "$dest/chefdk/bin/chef-apply" /usr/bin/chef-apply   || die
	dosym "$dest/chefdk/bin/chef-shell" /usr/bin/chef-shell   || die
	dosym "$dest/chefdk/bin/chef-vault" /usr/bin/chef-vault   || die
	dosym "$dest/chefdk/bin/chef" /usr/bin/chef               || die
	dosym "$dest/chefdk/bin/knife" /usr/bin/knife             || die
	dosym "$dest/chefdk/bin/shef" /usr/bin/shef               || die
	dosym "$dest/chefdk/bin/ohai" /usr/bin/ohai               || die
	dosym "$dest/chefdk/bin/kitchen" /usr/bin/kitchen         || die
	dosym "$dest/chefdk/bin/berks" /usr/bin/berks             || die
	dosym "$dest/chefdk/bin/foodcritic" /usr/bin/foodcritic   || die
}
