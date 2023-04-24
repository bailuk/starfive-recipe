#!/bin/sh

# Get binary graphics driver and firmware for 
# Imagination GPU and extract it to fs root `/`
#
# https://forum.rvspace.org/t/getting-the-builtin-img-gpu-working-from-scratch/2518/3


mkdir -p /opt/gpu
cd /opt/gpu || exit 1
img_archive="IMG_GPU-xorg.tar.gz"

# Can be downloaded in advance and put into `overlays/system/opt/gpu`
if [ ! -f "${img_archive}" ]; then
    # wget looks for `https_proxy` environment variable
    echo "https_proxy=${https_proxy}"
    wget "https://github.com/starfive-tech/Debian/raw/20221225T084846Z/gpu/DDK1.17-binary-xorg/${img_archive}" || exit 1
fi

tar -C / --strip-components=1 --keep-directory-symlink --no-same-owner -xzvf ${img_archive}

# Replace Xorg binary
rm -f /usr/bin/Xorg
rm -f /usr/bin/X
ln -s /usr/local/bin/Xorg /usr/bin/Xorg
ln -s /usr/local/bin/Xorg /usr/bin/X

# libfreetype is incompatible with /usr/lib/riscv64-linux-gnu/libharfbuzz.so
rm -f /usr/local/lib/libfreetype.so*

ldconfig

# Add hook to include firmware into initramfs.img
mkdir -p /etc/initramfs-tools/hooks
cp gpu-firmware /etc/initramfs-tools/hooks
chmod 700 /etc/initramfs-tools/hooks/gpu-firmware

