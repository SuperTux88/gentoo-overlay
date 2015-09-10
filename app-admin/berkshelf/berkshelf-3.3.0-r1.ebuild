# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21"

RUBY_FAKEGEM_RECIPE_TEST="rspec"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"
RUBY_FAKEGEM_EXTRAINSTALL="generator_files"

RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

inherit ruby-fakegem

SRC_URI="https://github.com/berkshelf/berkshelf/archive/v${PV}.tar.gz -> ${P}.tar.gz"
DESCRIPTION="A Chef Cookbook manager"
HOMEPAGE="https://github.com/berkshelf/berkshelf"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

ruby_add_rdepend "
	>=app-admin/berkshelf-api-client-1.2

	>=dev-ruby/addressable-2.3.4
	>=dev-ruby/buff-config-1.0
	>=dev-ruby/buff-extensions-1.0
	>=dev-ruby/buff-shell_out-0.1
	>=dev-ruby/celluloid-0.16.0
	>=dev-ruby/celluloid-io-0.16.1
	>=dev-ruby/cleanroom-1.0
	>=dev-ruby/faraday-0.9.0
	>=dev-ruby/httpclient-2.6.0
	>=dev-ruby/minitar-0.5.4
	=dev-ruby/octokit-3*
	>=dev-ruby/retryable-2.0
	>=dev-ruby/ridley-4.0
	=dev-ruby/solve-1*
	>=dev-ruby/thor-0.19
"
