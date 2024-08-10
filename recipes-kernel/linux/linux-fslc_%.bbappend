FILESEXTRAPATHS:prepend := "${THISDIR}/linux-fslc/files:"

SRC_URI += "file://custom-defconfig"

SRC_URI[sha256sum] = "8f0a1f7dfc2e9a533afd1ef4e4870100565bb8730a01392e329e8d57d3d4a516"

do_configure:append() {
    cat ${WORKDIR}/custom-defconfig >> ${B}/.config
    yes "" | make oldconfig
}

