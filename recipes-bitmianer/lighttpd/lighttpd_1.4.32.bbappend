FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-1.0:"

PRINC := "${@int(PRINC) + 1}"

RDEPENDS_${PN} += " \
               lighttpd-module-auth \
               lighttpd-module-cgi \
               lighttpd-module-expire \
"

do_install_append() {
    update-rc.d -r ${D} lighttpd start 60 S .
    install -m 0755 ${WORKDIR}/lighttpd.conf ${D}${sysconfdir}
    install -m 0755 ${WORKDIR}/lighttpd-htdigest.user ${D}${sysconfdir}
    if [ x"L3" == x"${Miner_TYPE}" ]; then
        cp -pr ${WORKDIR}/www-ltc/* ${D}/www/pages
    elif [ x"L3+" == x"${Miner_TYPE}" ]; then
        cp -pr ${WORKDIR}/www-ltc-p/* ${D}/www/pages
    else
        cp -pr ${WORKDIR}/www/* ${D}/www/pages
    fi

	if [ x"C1" == x"${Miner_TYPE}" ]; then
		rm ${D}/www/pages/cgi-bin/minerAdvanced.cgi
		mv ${D}/www/pages/cgi-bin/minerAdvanced_c1.cgi ${D}/www/pages/cgi-bin/minerAdvanced.cgi
	elif [ x"C2" == x"${Miner_TYPE}" ]; then
        	rm ${D}/www/pages/cgi-bin/minerAdvanced.cgi
        	mv ${D}/www/pages/cgi-bin/minerAdvanced_c2.cgi ${D}/www/pages/cgi-bin/minerAdvanced.cgi
	elif [ x"S5" == x"${Miner_TYPE}" ]; then
        	rm ${D}/www/pages/cgi-bin/minerAdvanced.cgi
        	mv ${D}/www/pages/cgi-bin/minerAdvanced_s5.cgi ${D}/www/pages/cgi-bin/minerAdvanced.cgi
	elif [ x"S4+" == x"${Miner_TYPE}" ]; then
        	rm ${D}/www/pages/cgi-bin/minerAdvanced.cgi
        	mv ${D}/www/pages/cgi-bin/minerAdvanced_s4_p.cgi ${D}/www/pages/cgi-bin/minerAdvanced.cgi
	elif [ x"S5+" == x"${Miner_TYPE}" ]; then
        	rm ${D}/www/pages/cgi-bin/minerAdvanced.cgi
        	mv ${D}/www/pages/cgi-bin/minerAdvanced_s5_p.cgi ${D}/www/pages/cgi-bin/minerAdvanced.cgi
	fi
	rm ${D}/www/pages/cgi-bin/minerAdvanced_*.cgi
}

SRC_URI_append = " file://lighttpd.conf"
SRC_URI_append = " file://lighttpd-htdigest.user"
SRC_URI_append = " file://www"
SRC_URI_append = " file://www_miner"
SRC_URI_append = " file://www-ltc"
SRC_URI_append = " file://www-ltc-p"
