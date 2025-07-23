# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2022 The Android Open Source Project

"""
This module contains a full list of kernel modules
 compiled by GKI.
"""

_COMMON_GKI_MODULES_LIST = [
    # keep sorted
    "crypto/michael_mic.ko",
    "drivers/block/zram/zram.ko",
    "drivers/bluetooth/bcm203x.ko",
    "drivers/bluetooth/bfusb.ko",
    "drivers/bluetooth/bpa10x.ko",
    "drivers/bluetooth/btbcm.ko",
    "drivers/bluetooth/btqca.ko",
    "drivers/bluetooth/btsdio.ko",
    "drivers/bluetooth/hci_uart.ko",
    "drivers/bluetooth/hci_vhci.ko",
    "drivers/media/dvb-frontends/mxl692.ko",
    "drivers/media/usb/airspy/airspy.ko",
    "drivers/media/usb/hackrf/hackrf.ko",
    "drivers/media/usb/msi2500/msi2500.ko",
    "drivers/media/spi/cxd2880-spi.ko",
    "drivers/net/can/dev/can-dev.ko",
    "drivers/net/can/slcan/slcan.ko",
    "drivers/net/can/vcan.ko",
    "drivers/net/can/spi/mcp251x.ko",
    "drivers/net/can/ifi_canfd/ifi_canfd.ko",
    "drivers/net/can/usb/usb_8dev.ko",
    "drivers/net/can/c_can/c_can.ko",
    "drivers/net/can/usb/gs_usb.ko",
    "drivers/net/can/cc770/cc770.ko",
    "drivers/net/can/usb/kvaser_usb/kvaser_usb.ko",
    "drivers/net/can/m_can/m_can.ko",
    "drivers/net/can/grcan.ko",
    "drivers/net/can/sja1000/sja1000.ko",
    "drivers/net/can/spi/hi311x.ko",
    "drivers/net/can/xilinx_can.ko",
    "drivers/net/can/spi/mcp251xfd/mcp251xfd.ko",
    "drivers/net/can/usb/esd_usb.ko",
    "drivers/net/can/usb/peak_usb/peak_usb.ko",
    "drivers/net/can/can327.ko",
    "drivers/net/can/softing/softing.ko",
    "drivers/net/can/usb/ems_usb.ko",
    "drivers/net/mii.ko",
    "drivers/net/phy/microchip.ko",
    "drivers/net/ppp/bsd_comp.ko",
    "drivers/net/ppp/ppp_deflate.ko",
    "drivers/net/ppp/ppp_generic.ko",
    "drivers/net/ppp/ppp_mppe.ko",
    "drivers/net/ppp/pppox.ko",
    "drivers/net/ppp/pptp.ko",
    "drivers/net/slip/slhc.ko",
    "drivers/net/usb/aqc111.ko",
    "drivers/net/usb/asix.ko",
    "drivers/net/usb/ax88179_178a.ko",
    "drivers/net/usb/cdc_eem.ko",
    "drivers/net/usb/cdc_ether.ko",
    "drivers/net/usb/cdc_ncm.ko",
    "drivers/net/usb/lan78xx.ko",
    "drivers/net/usb/r8152.ko",
    "drivers/net/usb/r8153_ecm.ko",
    "drivers/net/usb/rtl8150.ko",
    "drivers/net/usb/usbnet.ko",
    "drivers/net/wwan/wwan.ko",
    "drivers/staging/rtl8192u/r8192u_usb.ko",
    "drivers/usb/class/cdc-acm.ko",
    "drivers/usb/serial/ch341.ko",
    "drivers/usb/serial/ftdi_sio.ko",
    "drivers/usb/serial/pl2303.ko",
    "drivers/usb/serial/usbserial.ko",
    "fs/binfmt_misc.ko",
    "kernel/kheaders.ko",
    "lib/crypto/libarc4.ko",
    "mm/zsmalloc.ko",
    "net/6lowpan/6lowpan.ko",
    "net/6lowpan/nhc_dest.ko",
    "net/6lowpan/nhc_fragment.ko",
    "net/6lowpan/nhc_hop.ko",
    "net/6lowpan/nhc_ipv6.ko",
    "net/6lowpan/nhc_mobility.ko",
    "net/6lowpan/nhc_routing.ko",
    "net/6lowpan/nhc_udp.ko",
    "net/8021q/8021q.ko",
    "net/bluetooth/bluetooth.ko",
    "net/bluetooth/hidp/hidp.ko",
    "net/bluetooth/rfcomm/rfcomm.ko",
    "net/can/can.ko",
    "net/can/can-bcm.ko",
    "net/can/can-gw.ko",
    "net/can/can-raw.ko",
    "net/ieee802154/6lowpan/ieee802154_6lowpan.ko",
    "net/ieee802154/ieee802154.ko",
    "net/ieee802154/ieee802154_socket.ko",
    "net/l2tp/l2tp_core.ko",
    "net/l2tp/l2tp_ppp.ko",
    "net/mac802154/mac802154.ko",
    "net/nfc/nfc.ko",
    "net/rfkill/rfkill.ko",
    "net/tipc/diag.ko",
    "net/tipc/tipc.ko",
    "net/wireless/lib80211.ko",
]

# Deprecated - Use `get_gki_modules_list` function instead.
COMMON_GKI_MODULES_LIST = _COMMON_GKI_MODULES_LIST

_ARM_GKI_MODULES_LIST = [
    # keep sorted
]

_ARM64_GKI_MODULES_LIST = [
    # keep sorted
    "arch/arm64/geniezone/gzvm.ko",
]

_RISCV64_GKI_MODULES_LIST = [
    # keep sorted
]

_X86_GKI_MODULES_LIST = [
    # keep sorted
]

_X86_64_GKI_MODULES_LIST = [
    # keep sorted
]

# buildifier: disable=unnamed-macro
def get_gki_modules_list(arch = None):
    """ Provides the list of GKI modules.

    Args:
      arch: One of [arm, arm64, i386, x86_64, riscv64].

    Returns:
      The list of GKI modules for the given |arch|.
    """
    gki_modules_list = [] + _COMMON_GKI_MODULES_LIST
    if arch == "arm":
        gki_modules_list += _ARM_GKI_MODULES_LIST
    elif arch == "arm64":
        gki_modules_list += _ARM64_GKI_MODULES_LIST
    elif arch == "i386":
        gki_modules_list += _X86_GKI_MODULES_LIST
    elif arch == "x86_64":
        gki_modules_list += _X86_64_GKI_MODULES_LIST
    elif arch == "riscv64":
        gki_modules_list += _RISCV64_GKI_MODULES_LIST
    else:
        fail("{}: arch {} not supported. Use one of [arm, arm64, i386, x86_64, riscv64]".format(
            str(native.package_relative_label(":x")).removesuffix(":x"),
            arch,
        ))

    return gki_modules_list
