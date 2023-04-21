#!/bin/sh

USERNAME=$1
[ "${USERNAME}" ] || exit 1

# Setup permission
chown -R "${USERNAME}:${USERNAME}" /home/"${USERNAME}"/

# Setup ssh
if [ -f "/home/${USERNAME}/.ssh/authorized_keys" ]; then
    # Disable password login
    echo "PasswordAuthentication no" > /etc/ssh/sshd_config.d/no_password_authentication.conf
fi

# Clean up
rm "/home/${USERNAME}/.gitkeep"
