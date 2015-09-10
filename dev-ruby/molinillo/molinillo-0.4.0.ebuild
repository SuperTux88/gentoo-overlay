# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_RECIPE_TEST="rspec"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

inherit ruby-fakegem

SRC_URI="https://github.com/CocoaPods/Molinillo/archive/${PV}.tar.gz -> ${P}.tar.gz"
DESCRIPTION="CocoaPods/Molinillo"
HOMEPAGE="https://github.com/CocoaPods/Molinillo"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

all_ruby_unpack() {
	unpack ${A}
	mv Molinillo-${PV} ${P}
}
