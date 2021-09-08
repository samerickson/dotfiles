#! /bin/bash

# Username for sudo enabled user
USERNAME=samerick
SSH_PORT=1086

adduser "${USERNAME}" -G sudo

# Setup SSH for sudo user
mkdir "/home/${USERNAME}/.ssh"
cp "/root/.ssh/authorized_keys" "/home/${USERNAME}/.ssh/"
chown -R "${USERNAME}:${USERNAME}" "/home/${USERNAME}/.ssh"
chmod 0700 "/home/${USERNAME}/.ssh"
chmod 0600 "/home/${USERNAME}/.ssh/*"

# Update System and install essential packages
#   updated to deal with pending kernal upgrade message:
#   https://askubuntu.com/questions/1349884/how-to-disable-pending-kernel-upgrade-message
apt update && apt full-upgrade -y --auto-remove
apt install -y \
    unzip \
    zsh \
    whois \
    shellcheck \
    mosh

# Create new ssh key
cd "/home/${USERNAME}/.ssh"
ssh-keygen -t rsa -b 4096 -f id_rsa -C '' -N ''

chown "${USERNAME}:${USERNAME}" id_rsa*
chmod 0600 id_rsa*

# Secure SSH
sed -i "s/^#Port 22/Port ${SSH_PORT}/" /etc/ssh/sshd_config
sed -i "s/PermitRootLogin yes/PermitRootLogin no/"

# Configure firewall
ufw allow "${SSH_PORT}/tcp"
ufw allow mosh
ufw allow https
ufw allow http
ufw enable

# Configure zsh
su "${USERNAME}"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Change default shell for new user
chsh "${USERNAME}" -s /usr/bin/zsh

# Get dotfiles
git clone https://github.com/samerickson/dotfiles.git "/home/${USERNAME}/.dotfiles"

# Install dotfiles
cd "/home/${USERNAME}/.dotfiles/src/home"
for FILE in .*; do
    if [ -f "${FILE}"]; then
        ln -sfv "${FILE}" "/home/${USERNAME}/${FILE}"
    fi
done

# Alert user if machine requires reboot
if [ -f /var/run/reboot-required ]; then
    cat /var/run/reboot-required
fi
