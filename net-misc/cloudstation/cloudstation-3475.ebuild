# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit multilib unpacker eutils

DESCRIPTION="Synology Cloudstation is the syncservice for Synology NAS."
HOMEPAGE="https://www.synology.com/de-de/dsm/cloud_services"
SRC_URI_BASE="http://global.download.synology.com/download/Tools/CloudStation/${PV}/Ubuntu"
SRC_URI="x86? ( ${SRC_URI_BASE}/x32/synology-cloud-station-${PV}.deb -> synology-cloud-station-x32.deb )
		amd64? ( ${SRC_URI_BASE}/x64/synology-cloud-station-${PV}.deb -> synology-cloud-station-x86.deb )"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

QA_PREBUILT="*"
RESTRICT="strip"

S="${WORKDIR}"

src_install() {
	insinto "/"
	doins -r *

	fperms 755 /opt/Synology/CloudStation/bin/launcher
	fperms 755 /usr/bin/synology-cloud-station
}