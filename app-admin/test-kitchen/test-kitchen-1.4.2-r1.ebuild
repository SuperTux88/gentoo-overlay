# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21"

RUBY_FAKEGEM_RECIPE_TEST="rspec"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"
RUBY_FAKEGEM_EXTRAINSTALL="support templates"

RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

inherit ruby-fakegem

SRC_URI="https://github.com/test-kitchen/test-kitchen/archive/v${PV}.tar.gz -> ${P}.tar.gz"
DESCRIPTION="An integration tool for developing and testing infrastructure code on isolated target platforms."
HOMEPAGE="https://github.com/test-kitchen/test-kitchen"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/mixlib-shellout-1.2
	>=dev-ruby/net-ssh-2.7
	>=dev-ruby/net-scp-1.1.0
	>=dev-ruby/safe_yaml-1.0
	>=dev-ruby/thor-0.19
"
