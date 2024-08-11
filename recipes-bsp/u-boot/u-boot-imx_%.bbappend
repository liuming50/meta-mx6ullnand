FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = " \
    file://custom.cfg \
    file://0001-mx6ullevk.h-add-mem-parameters.patch \
"
