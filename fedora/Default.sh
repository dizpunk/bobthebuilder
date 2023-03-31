#!/bin/bash

# Enable fractional scaling
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"

# Switch firewalld profile to drop
sudo firewall-cmd --set-default-zone=drop

# Update and reboot
sudo dnf check-update
sudo dnf upgrade -y
reboot
