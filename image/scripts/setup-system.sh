#!/bin/sh

# Setup hostname
echo "$1" > /etc/hostname

# systemd-firstboot requires user input
systemctl disable systemd-firstboot.service
systemctl mask systemd-firstboot.service


