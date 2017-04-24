export IMAGE_BASENAME = "antminer"
IMAGE_INSTALL = " \
	busybox \
	base-files \
	base-passwd \
	initscripts \
	sysvinit \
	sysvinit-pidof \
	angstrom-version \
	tinylogin \
	i2c-tools \
	screen \
	dropbear \
	libcurl \
	lighttpd \
	dtc \
	stunnel \
	openssl \
	mtd-utils \
	curl \
	udev \
	ntp \
	ntpdate \
	netbase \
	avahi \
	led-blink \
	cgminer \
"
#omap3-mkcard 			   
#cgminer 

inherit image

do_rootfs_append() {
	echo "do_build_append"
	#cp -rf /home/xxl/AM335x/knc/setup-s3/deploy/eglibc/images/beaglebone/Angstrom-S3-eglibc-ipk-v2013.06-beaglebone.rootfs.cpio.gz.u-boot /tftpboot/initramfs.bin
	#cp -rf /home/xxl/AM335x/knc/setup-s3/deploy/eglibc/images/beaglebone/Angstrom-S3-eglibc-ipk-v2013.06-beaglebone.rootfs.cpio.gz.u-boot /tftpboot/initramfs.bin.SD
}

