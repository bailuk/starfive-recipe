#!/bin/sh


export http_proxy=http://starfive:8080

mkdir -p overlays/system/opt/kernel || exit 1
cp ../kernel/*.deb overlays/opt/kernel || exit 1

image_name="starfive"
args="-t ssh:true -t image:${image_name}"

if [ -f ${image_name}.img ]; then
    echo "Image '${image_name}.img' allready exists"
else
    ./debos.sh $args rootfs.yaml
fi

