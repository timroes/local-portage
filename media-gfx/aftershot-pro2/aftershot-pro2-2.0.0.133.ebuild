# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils

MAGIC_PV="2.0.0.133"

RESTRICT="strip"
#QA_TEXTRELS="opt/${P}/bin/libbreakgen.so"

DESCRIPTION="A tool to edit and manage images by Corel."
HOMEPAGE="http://www.aftershotpro.com"
SRC_URI="http://dwnld.aftershotpro.com/AfterShot/AfterShotPro2_${PV}_amd64.deb"

LICENSE="eula"
SLOT="0"
IUSE=""
KEYWORDS="amd64"

RDEPEND=""

S="${WORKDIR}"

src_unpack() {
	unpack ${A}
	unpack ./data.tar.gz
	rm -f control.tar.gz data.tar.gz debian-binary
}

src_install() {
	insinto "/"

	doins -r *

	fperms 755 /opt/AfterShotPro2*/bin/*
	fperms 755 /usr/bin/AfterShotPro2X64
}
