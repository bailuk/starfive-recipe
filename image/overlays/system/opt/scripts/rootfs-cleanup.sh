#!/bin/sh

# Remove apt packages which are no longer unnecessary and delete
# downloaded packages
apt -y autoremove --purge
apt clean

# Remove machine ID so it gets generated on first boot
rm -f /var/lib/dbus/machine-id
truncate -s0 /etc/machine-id

rm -f /.gitkeep

