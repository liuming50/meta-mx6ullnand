
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://defconfig"

do_configure:prepend() {
    cat ${WORKDIR}/defconfig >> ${B}/.config
}

COMPATIBLE_MACHINE = "(mx6ull|mx6ull-c-q|mx6-generic-bsp)"
