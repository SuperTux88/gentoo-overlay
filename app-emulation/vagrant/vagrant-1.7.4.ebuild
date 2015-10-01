# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"
USE_RUBY="ruby20 ruby21"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"
RUBY_FAKEGEM_GEMSPEC="vagrant.gemspec"
RUBY_FAKEGEM_EXTRAINSTALL="keys plugins templates version.txt"
RUBY_FAKEGEM_TASK_DOC=""

inherit ruby-fakegem eutils

DESCRIPTION="A tool for building and distributing virtual machines using VirtualBox"
HOMEPAGE="http://vagrantup.com/"
SRC_URI="https://github.com/mitchellh/vagrant/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

# Missing ebuild for contest
RESTRICT="test"

RDEPEND="${RDEPEND}
	app-arch/libarchive
	net-misc/curl
	|| ( app-emulation/virtualbox app-emulation/virtualbox-bin )"

ruby_add_rdepend "
	dev-ruby/bundler
	>=dev-ruby/childprocess-0.5.0
	>=dev-ruby/erubis-2.7.0
	>=dev-ruby/i18n-0.6.0:0.6
	>=dev-ruby/listen-3.0.2
	>=dev-ruby/hashicorp-checkpoint-0.1.1
	>=dev-ruby/log4r-1.1.9
	>=dev-ruby/net-ssh-2.6.6:2.6
	>=dev-ruby/net-sftp-2.1.0
	>=dev-ruby/net-scp-1.1.0
	>=dev-ruby/rest-client-1.6.0
	>=dev-ruby/nokogiri-1.6.3.1
"

ruby_add_bdepend "
	dev-ruby/rake
	test? ( dev-ruby/mocha virtual/ruby-minitest )
"

all_ruby_prepare() {
	# remove bundler support
	sed -i '/[Bb]undler/d' Rakefile || die
	rm Gemfile || die

	sed -i \
		-e "/rb-kqueue\|wdm\|winrm/d" \
		-e "/nokogiri/s/=/>=/" \
		-e "/net-scp/s/~>/>=/" \
		-e "/bundler/s/, \"<= .*\"//" \
		${PN}.gemspec || die

	epatch "${FILESDIR}"/${PN}-1.7.4-rvm.patch
}
