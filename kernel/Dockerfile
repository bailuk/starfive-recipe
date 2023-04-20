FROM docker.io/library/debian:bullseye-slim

LABEL name="starfive-build"

ARG DEBIAN_FRONTEND=noninteractive

# Update packages
RUN apt-get update && apt-get upgrade -y 

# System dependencies
RUN apt-get -y --no-install-recommends install git ssh ca-certificates unzip wget

# Kernel build dependencies
RUN apt-get -y --no-install-recommends install build-essential bc kmod cpio flex libelf-dev libssl-dev dwarves bison cpp-riscv64-linux-gnu gcc-riscv64-linux-gnu rsync

# Clean cache
RUN apt-get clean

# Build script
COPY build-kernel.sh /
CMD ["/build-kernel.sh"]
