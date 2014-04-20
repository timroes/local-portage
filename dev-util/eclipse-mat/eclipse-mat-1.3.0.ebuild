# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils

DESCRIPTION="Eclipse Memory Analyzer can be used to view Heapdumps of Java programs"
HOMEPAGE="http://www.eclipse.org/mat/"
SRC_URI="http://www.eclipse.org/downloads/download.php?file=/mat/1.3.0/rcp/MemoryAnalyzer-1.3.0.20130517-linux.gtk.x86_64.zip&r=1 -> ${P}.zip"

LICENSE="EPL 1.0"
SLOT="0"
KEYWORDS="amd64"

RDEPEND=">=virtual/jre-1.6"

S="${WORKDIR}/mat"

src_install() {
	local dir="/opt/${PN}"

	insinto "${dir}"
	doins -r *

	fperms 755 "${dir}/MemoryAnalyzer"

	make_desktop_entry "${dir}/MemoryAnalyzer" "Memory Analyzer (MAT)" "" "Development"
}
