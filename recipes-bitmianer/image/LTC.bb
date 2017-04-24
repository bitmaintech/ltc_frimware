require recipes-bitmianer/image/S3.bb

IMAGE_INSTALL += "minermonitor"
IMAGE_INSTALL += "monitor-ipsig"
IMAGE_INSTALL += "monitor-recobtn"

export IMAGE_BASENAME = "antminer_m"

