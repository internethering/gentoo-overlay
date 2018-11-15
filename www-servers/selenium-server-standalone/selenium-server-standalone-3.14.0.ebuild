# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eapi7-ver java-utils-2 systemd

DESCRIPTION="Selenium Serer Standalone"
HOMEPAGE="http://www.seleniumhq.org/"
SRC_URI="http://selenium-release.storage.googleapis.com/$(ver_cut 1-2)/${PN}-${PV}.jar"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="virtual/jre:*"
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_unpack() {
	cp "${DISTDIR}/${A}" "${WORKDIR}"
	mv ${PN}-${PV}.jar ${PN}.jar
}

src_install() {
	java-pkg_dojar ${PN}.jar
	systemd_dounit "${FILESDIR}/selenium-server-standalone.service"
	systemd_install_serviced "${FILESDIR}/selenium-server-standalone.service.conf" selenium-server-standalone.service
}
