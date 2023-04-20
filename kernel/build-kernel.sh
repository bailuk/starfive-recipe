#!/bin/sh

# Clone or update JH7110_VisionFive2_devel development kernel source 
# Build kernel from source

if [ ! -d linux ]; then
    echo "Clone starfive kernel repositroy. This can take a while..."
    git clone https://github.com/starfive-tech/linux.git --depth 5 -b JH7110_VisionFive2_devel || exit 1
fi

if [ -d linux ]; then
    echo "Update git repo"
    cd linux || exit 1
    git pull || exit 1
    
    echo "Build kernel. This will take a while..."
    make ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- starfive_jh7110_defconfig || exit 1
    make -j8 ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- LOCALVERSION=-custom bindeb-pkg || exit 1
fi
