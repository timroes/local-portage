# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit cmake-utils

DESCRIPTION="A simple tool to set axis and button maps of joysticks"
HOMEPAGE="http://www.cosy.sbg.ac.at/~shuber/funcode/joydevmap.html"
SRC_URI="http://www.cosy.sbg.ac.at/~shuber/funcode/files/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
RESTRICT="mirror"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

