# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21"

RUBY_FAKEGEM_RECIPE_TEST="rspec"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

inherit ruby-fakegem

SRC_URI="https://github.com/reset/ridley/archive/v${PV}.tar.gz -> ${P}.tar.gz"
DESCRIPTION="A reliable Chef API client with a clean syntax"
HOMEPAGE="https://github.com/reset/ridley"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/addressable-2.3.4
	>=dev-ruby/buff-config-1.0
	>=dev-ruby/buff-extensions-1.0
	>=dev-ruby/buff-ignore-1.1
	>=dev-ruby/buff-shell_out-0.1
	>=dev-ruby/celluloid-0.16.0
	>=dev-ruby/celluloid-io-0.16.1
	dev-ruby/erubis
	>=dev-ruby/faraday-0.9.0
	>=dev-ruby/hashie-2.0.2:0
	>=dev-ruby/json-1.7.7
	>=dev-ruby/mixlib-authentication-1.3.0
	>=dev-ruby/net-http-persistent-2.8
	>=dev-ruby/retryable-2.0
	>=dev-ruby/semverse-1.1
	>=dev-ruby/varia_model-0.4
"
