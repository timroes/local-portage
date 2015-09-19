# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 )
inherit fdo-mime python-single-r1 qt5-build qmake-utils

DESCRIPTION="A general purpose tile map editor"
HOMEPAGE="http://www.mapeditor.org/"
SRC_URI="https://github.com/bjorn/tiled/archive/v${PV}/${P}.tar.gz"

LICENSE="BSD-2 GPL-2+"
SLOT="0"
KEYWORDS="~amd64"
IUSE="examples python"

REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

DEPEND=">=dev-qt/qtcore-5.1:5
	>=dev-qt/qtgui-5.1:5
	>=dev-qt/linguist-tools-5.1:5
	>=dev-qt/qtopengl-5.1:5
	sys-libs/zlib
	python? ( ${PYTHON_DEPS} )"
RDEPEND="${DEPEND}"

DOCS=( AUTHORS COPYING NEWS README.md )

# We need this here, something seems to overwrite it
S="${WORKDIR}/${P}"

pkg_setup() {
	use python && python-single-r1_pkg_setup
}

src_configure() {
	eqmake5 LIBDIR="/usr/$(get_libdir)" PREFIX="/usr" DISABLE_PYTHON_PLUGIN="$(usex !python)"
}

src_compile() {
	emake
}

src_install() {
	emake install INSTALL_ROOT=${D}

	if use examples ; then
		docompress -x /usr/share/doc/${PF}/examples
		dodoc -r examples
	fi
}

pkg_postinst() {
	fdo-mime_desktop_database_update
	fdo-mime_mime_database_update
}

pkg_postrm() {
	fdo-mime_desktop_database_update
	fdo-mime_mime_database_update
}
