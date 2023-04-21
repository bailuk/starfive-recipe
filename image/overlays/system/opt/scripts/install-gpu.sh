#!/bin/sh

# Get binary graphics driver and firmware for 
# Imagination GPU and extract it to fs root `/`
#
# https://forum.rvspace.org/t/getting-the-builtin-img-gpu-working-from-scratch/2518/3


mkdir -p /opt/gpu
cd /opt/gpu || exit 1
img_archive="img-gpu-powervr-bin-1.17.6210866.tar.gz"

# Can be downloaded before hand and put into `overlays/system/opt/gpu`
if [ ! -f "${img_archive}" ]; then
    # wget looks for `https_proxy` environment variable
    echo "https_proxy=${https_proxy}"
    wget "https://github.com/starfive-tech/soft_3rdpart/raw/JH7110_VisionFive2_devel/IMG_GPU/out/${img_archive}" || exit 1
fi

tar --strip-components=2 --keep-directory-symlink --no-same-owner -xzvf ${img_archive} -C /

