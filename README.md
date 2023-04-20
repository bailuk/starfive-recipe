# starfive-recipe

Scripts and recipe to build a Debian image for a [starfive](https://www.starfivetech.com/en) based devices.

- Build kernel from source (directly or inside container)
- Build image using a [debos](https://github.com/go-debos/debos) recipe
- Tested with VisionFive2 board.

# Build image

## Step 1: Build kernel

Output from this step will be kernel Debian packages in directory `kernel/`

### Variant A: Build kernel using a build container

```bash
cd kernel
./build-image.sh                  # Builds debian based build image with all dependencies to build a riscv64 kernel
./build-kernel-using-container.sh # Clones or updates kernel source repository and builds kernel
```

### Variant B: Build kernel directly

First install dependencies to build a riscv64 kernel. See [kernel/Dockerfile](kernel/Dockerfile)

```bash
cd kernel
./buld.sh # Clones or updates kernel source repository and builds kernel
```

## Step 2: Configure image

Edit [image/build.sh](image/build.sh) to pass arguments to debos recipe (image/starfive.yaml)[image/starfive.yaml].

Add custom files:
- Add files to `image/overlays/user-home` (file system overlay for `/home/default-user/`)
- Add files to `image/overlays/system-custom` (file system overlay for `/`

To enable ssh with private key: pass `-t ssh:true` and
add key to `image/overlays/user-home/.ssh/authorized_keys`.
If `authorized_keys` exists, password login from ssh will be disabled.

## Step 3: Build image

This will build an image by running debos inside the official debos container.

The user running this script needs permission for accessing `/dev/kvm`.
See [debos projekt](https://github.com/go-debos/debos) for more information.

```bash
cd image
./build.sh
```

Output of this step is an image file: `starfive.img`

## Step 4: Install and test image

```bash
# Write image to microSD card
dd if=starfive.img of=/dev/your-microsd-card-device
```

Then boot from microSD card. Preferably with USB to TTL module connected.

▮

# Credits

Based on:
- (Mobian-team/mobian-recipes)[https://salsa.debian.org/Mobian-team/mobian-recipes]
- (thomasdstewart/starfive-visionfive2)[https://github.com/thomasdstewart/starfive-visionfive2]

# Useful resources

- [Waveshare WIKI](https://www.waveshare.com/wiki/VisionFive2)
- [Pratham Patel's Blog -  Review of the VisionFive 2](https://blog.thefossguy.com/posts/visionfive-2-initial-review/)
- [StarFive VisionFive 2 Debian SSD Boot Guide](https://jamesachambers.com/starfive-visionfive-2-debian-ssd-boot-guide/)
- [VisionFive 2 Quick Start Guide](https://doc-en.rvspace.org/VisionFive2/PDF/VisionFive2_QSG.pdf)

