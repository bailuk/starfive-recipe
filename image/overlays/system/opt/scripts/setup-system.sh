#!/bin/sh

hostname="$1"
timezone="$2"
locale="$3"


# Setup hostname
if [ -n "${hostname}" ]; then
    echo "Set hostname to '${hostname}'"
    echo "$hostname" > /etc/hostname
fi

# systemd-firstboot requires user input
systemctl disable systemd-firstboot.service
systemctl mask systemd-firstboot.service


# Set timezone and language
if [ -n "${timezone}" ]; then
    echo "Set timezone to '${timezone}'"
    timedatectl set-timezone "${timezone}"
fi

if [ -n "${locale}" ]; then
    echo "Set locale to '${locale}'"
    sed -i "s/^# *\(${locale}\)/\1/" /etc/locale.gen && locale-gen
fi

