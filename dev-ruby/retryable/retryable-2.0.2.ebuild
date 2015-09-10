# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_TEST=""
RUBY_FAKEGEM_TASK_DOC=""

RUBY_FAKEGEM_EXTRADOC="README.md"

# We don't use RUBY_FAKEGEM_NAME here since for now we want to keep the
# same gem name.

inherit ruby-fakegem

DESCRIPTION="Kernel#retryable, slightly enhanced and rebuilt as gem as a little Munich Hackday project."
HOMEPAGE="https://github.com/carlo/retryable"
SRC_URI="mirror://rubygems/retryable-${PV}.gem"

LICENSE="|| ( GPL-2 Ruby )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
