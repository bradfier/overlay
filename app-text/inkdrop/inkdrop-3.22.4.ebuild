# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A Markdown note-taking app"
HOMEPAGE="https://www.inkdrop.info"
SRC_URI="https://d3ip0rje8grhnl.cloudfront.net/v${PV}/Inkdrop-${PV}-Linux.zip"

LICENSE="Proprietary"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="bindist mirror strip"

DEPEND="
		gnome-base/gnome-keyring
		gnome-base/gconf
"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

src_install() {
	into /opt
	insinto /opt/${PN}

	doins -r locales resources
	doins libffmpeg.so
	doins libnode.so
	doins *.pak
	doins *.dat
	doins *.bin
	doins LICENSE*

	doins inkdrop
	dosym ${EPREFIX}/opt/inkdrop/inkdrop /opt/bin/inkdrop
	fperms +x /opt/${PN}/inkdrop
}
