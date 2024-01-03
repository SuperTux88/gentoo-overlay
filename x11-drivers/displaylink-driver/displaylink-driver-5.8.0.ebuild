# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit systemd udev

PV_MINOR=${PV%.*}
PV_EXTRA="63.33"
UBUNTU_VERSION=1604

DESCRIPTION="DisplayLink USB Graphics Software"
HOMEPAGE="https://www.synaptics.com/products/displaylink-graphics"
SRC_URI="https://www.synaptics.com/sites/default/files/exe_files/2023-08/DisplayLink%20USB%20Graphics%20Software%20for%20Ubuntu${PV_MINOR}-EXE.zip -> ${P}.zip"

LICENSE="DisplayLink-EULA"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	app-admin/chrpath
	app-arch/unzip
"
RDEPEND="
	${DEPEND}
	~x11-drivers/evdi-1.14.1
	virtual/libusb:1
"
BDEPEND="sys-apps/grep[pcre]"

RESTRICT="mirror bindist"
QA_PRESTRIPPED="/opt/displaylink/DisplayLinkManager"

src_unpack() {
	default
	sh ./"${P}-${PV_EXTRA}".run --noexec --target "${P}"
}

src_compile() {
	grep -ozP '(?s)cat > "\$DISPLAYLINK_RULES_FILE"[^\n]*\n\K.*?(?=\nEOF)' \
		"${WORKDIR}/${P}"/udev-installer.sh | tr -d '\000' >  99-displaylink.rules || die
	grep -ozP '(?s)displaylink_bootstrapper_code\(\)\n{\n  cat[^\n]*\n\K.*?(?=EOF)' \
		"${WORKDIR}/${P}"/udev-installer.sh | tr -d '\000' >  udev.sh || die
	grep -ozP '(?s)systemd_start_stop_functions\(\)\n{\n  cat[^\n]*\n\K.*?(?=EOF)' \
		"${WORKDIR}/${P}"/udev-installer.sh | tr -d '\000' >> udev.sh || die
	grep -ozP '(?s)create_main_function\(\)\n{\n  cat[^\n]*\n\K.*?(?=EOF)' \
		"${WORKDIR}/${P}"/udev-installer.sh | tr -d '\000' >> udev.sh || die

	grep -ozP '(?s)cat > "\$service_path" <<EOF\n\K.*?(?=\nEOF)' "${WORKDIR}/${P}"/service-installer.sh |\
		tr -d '\000' | sed 's#ExecStartPre=.*#ExecStartPre=/sbin/modprobe evdi#' > ${PN}.service
	grep -ozP '(?s)cat > "\$suspend" << EOF\n\K.*?(?=EOF)' \
		"${WORKDIR}/${P}"/service-installer.sh | tr -d '\000' >  suspend.sh
	grep -ozP '(?s)systemd\)\n +cat >> "\$suspend"[^\n]*\n\K.*?(?=\nEOF)' \
		"${WORKDIR}/${P}"/service-installer.sh | tr -d '\000' >> suspend.sh
}

src_install() {
	case "${ARCH}" in
		amd64)	MY_ARCH="x64" ;;
		*)		MY_ARCH="${ARCH}" ;;
	esac

	DLM="${S}/${MY_ARCH}-ubuntu-${UBUNTU_VERSION}/DisplayLinkManager"

	dodir /opt/displaylink
	keepdir /var/log/displaylink

	exeinto /opt/displaylink
	chrpath -d "${DLM}"
	doexe "${DLM}"

	insinto /opt/displaylink
	doins *.spkg

	doexe udev.sh
	udev_dorules 99-displaylink.rules

	doexe suspend.sh
	dosym ../../../../opt/displaylink/suspend.sh /usr/lib/systemd/system-sleep/displaylink.sh
	systemd_dounit ${PN}.service

	dodoc LICENSE
	dodoc 3rd_party_licences.txt
}

pkg_postinst() {
	udev_reload
}

pkg_postrm() {
	udev_reload
}
