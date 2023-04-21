#!/bin/sh

# install kernel package
apt-get install /opt/kernel/linux-image-5.15.0-custom_5.15.0-custom-1_riscv64.deb

# dtbs file for visionfive2 board (https://linux-sunxi.org/Device_Tree)
mkdir -p /boot/dtbs
cp /usr/lib/linux-image-5.15.0-custom/starfive/jh7110-visionfive-v2.dtb /boot/dtbs

# install bootloader as configured in /etc/default/u-boot
u-boot-update

