DESCRIPTION = "Cgminer bitcoin miner SW"
#LICENSE = "GPLv3 & bzip2"
LICENSE = "CLOSED"
#LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
#LIC_FILES_CHKSUM = "file://COPYING"

DEPENDS = "ncurses curl"

#SRCREV = "v3.8.3-knc"
#PV = "${SRCREV}+git${SRCPV}"
SRCREV = "3.8.5"
#PV = "${SRCREV}+${SRCPV}"
PR = "r1"

SRC_URI = "file://cgminer-ltc.tar.bz2"
S = "${WORKDIR}/cgminer-ltc"


#CFLAGS_prepend = "-I ${S}/compat/jansson-2.5/src -I ${S}/compat/libusb-1.0/libusb"
CFLAGS_prepend = "-I ${S}/compat/jansson-2.6/src -I ${S}/compat/libusb-1.0/libusb"


EXTRA_OECONF = " \
	     --enable-bitmain-L3 \
	     --disable-adl \
	     --disable-opencl \
	     --disable-libcurl \
	     "
		 
do_configure_prepend() {
	autoreconf -fiv
}

do_compile_append() {
	make api-example
}

do_install_append() {
        install -d ${D}${bindir}
        install -m 0755 ${S}/api-example ${D}${bindir}/cgminer-api
}
 
inherit autotools pkgconfig
