RTL8188FTV Driver for Allwinner Sunxi ARM SoCs.
For Kernel 4.15.x ~ 5.15.x on Linux Debian & Armbian (including derivatives).

Compatible with both USB Type-A dongles/adapters, and embedded 2.4ghz wireless radio modules, using the Realtek RTL8188FTV chip. Modified from Kelebek333's rtl8188fu driver.

------------------

## Installation

Begin by installing kernel headers for your operating system. For example, in Armbian, we'll run armbian-config and go to Software > Headers_install. Once that is complete, reboot your system.

Now, run `uname -a`, note your version number (not kernel version), and add it to the first command:
1) `apt install -y dkms make git linux-headers-current-sunxi=xx.yy.z` (replace xx.yy.z with your version number)

2) `cd /usr/src/linux-headers-$(uname -r) && make scripts`

3) `cd /tmp && git clone https://github.com/julianwhitehm/rtl8188ftv_Allwinner`

4) `ln -s /lib/modules/$(uname -r)/build/arch/arm /lib/modules/$(uname -r)/build/arch/armv7l`

5) `dkms add ./rtl8188ftv_Allwinner`

6) `dkms build rtl8188fu/1.0`

7) `dkms install rtl8188fu/1.0`

8) `cp -r ./rtl8188ftv_Allwinner/firmware/rtl8188fufw.bin /lib/firmware/rtlwifi/ && modprobe rtl8188fu`

9) `rm -rf /tmp/rtl8188ftv_Allwinner`

------------------

## Configuration

#### Disable Power Management

Run following commands for disable power management and plugging/replugging issues.

`sudo mkdir -p /etc/modprobe.d/`

`sudo touch /etc/modprobe.d/rtl8188fu.conf`

`echo "options rtl8188fu rtw_power_mgnt=0 rtw_enusbss=0" | sudo tee /etc/modprobe.d/rtl8188fu.conf`

#### Disable MAC Address Spoofing

Run following commands for disabling MAC Address Spoofing (Note: This is not needed on Ubuntu based distributions. MAC Address Spoofing is already disabled on Ubuntu base).

`sudo mkdir -p /etc/NetworkManager/conf.d/`

`sudo touch /etc/NetworkManager/conf.d/disable-random-mac.conf`

`echo -e "[device]\nwifi.scan-rand-mac-address=no" | sudo tee /etc/NetworkManager/conf.d/disable-random-mac.conf`

#### Blacklist for kernel 5.15 and newer

If you are using kernel 5.15 and newer, you must create a configuration file with following commands for preventing to conflict rtl8188fu module with built-in r8188eu module.

`echo 'alias usb:v0BDApF179d*dc*dsc*dp*icFFiscFFipFFin* rtl8188fu' | sudo tee /etc/modprobe.d/r8188eu-blacklist.conf`

------------------

## Uninstalling

`sudo dkms remove rtl8188fu/1.0 --all`

`sudo rm -f /lib/firmware/rtlwifi/rtl8188fufw.bin`

`sudo rm -f /etc/modprobe.d/rtl8188fu.conf`

------------------

## Platform Testing

Currently known working with Orange Pi Zero Plus 2 (Allwinner H3).
I will expand this section as more platforms are tested.
