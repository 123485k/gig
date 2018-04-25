# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

MY_PV="v${PV}"

DESCRIPTION="An unidentifiable mechanism that helps you bypass GFW."
HOMEPAGE="https://trojan-gfw.github.io/trojan/"
SRC_URI="https://github.com/trojan-gfw/${PN}/archive/${MY_PV}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=dev-util/cmake-2.8.12
	>=dev-libs/boost-1.54.0
	>=dev-libs/openssl-1.0.2
"
RDEPEND="${DEPEND}"

src_configure() {
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ${S}
	emake
}

src_test() {
	ctest
}

src_install() {
	emake DESTDIR="${D}" install
}

pkg_postinst(){
	elog "You need to choose the mod"
	elog "  server: rc-update add trojan.server default"
	elog "  client: rc-update add trojan.client default"
}
