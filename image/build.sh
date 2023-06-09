#!/bin/sh



mkdir -p overlays/system/opt/kernel || exit 1
cp ../kernel/*.deb overlays/system/opt/kernel || exit 1

image_name="starfive"
timezone="$(timedatectl show --property=Timezone | cut -d "=" -f2)"

# Configure image here. See `starfive.yaml` for all options
args="-t image:${image_name} -t locale:${LANG} -t timezone:${timezone}"

# More examples: 
#    -t ssh:true -t contrib:true -t non-free:true -t image:${image_name} -t xfce:true


if [ -f ${image_name}.img ]; then
    echo "Image '${image_name}.img' allready exists"
else
    ./debos.sh $args starfive.yaml
fi

