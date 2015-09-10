# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21"

RUBY_FAKEGEM_RECIPE_TEST="rspec"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

inherit ruby-fakegem

SRC_URI="https://github.com/berkshelf/berkshelf-api-client/archive/v${PV}.tar.gz -> ${P}.tar.gz"
DESCRIPTION="API Client for communicating with a Berkshelf API server"
HOMEPAGE="https://github.com/berkshelf/berkshelf-api-client"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/faraday-0.9.0
	>=dev-ruby/httpclient-2.6.0
"
