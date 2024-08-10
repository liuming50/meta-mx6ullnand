FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://busybox.config"

do_configure:append() {
    install -m 0644 ${WORKDIR}/busybox.config ${B}/.config
}
