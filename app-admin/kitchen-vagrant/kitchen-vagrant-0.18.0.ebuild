# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21"

RUBY_FAKEGEM_RECIPE_TEST="rspec"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRAINSTALL="templates"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

inherit ruby-fakegem

SRC_URI="https://github.com/opscode/kitchen-vagrant/archive/v${PV}.tar.gz -> ${P}.tar.gz"
DESCRIPTION="Kitchen::Driver::Vagrant - A Vagrant Driver for Test Kitchen."
HOMEPAGE="https://github.com/opscode/kitchen-vagrant"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="${RDEPEND} app-emulation/vagrant"

ruby_add_rdepend ">=app-admin/test-kitchen-1.4"
