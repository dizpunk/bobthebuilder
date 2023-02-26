#!/bin/bash
set -e

# Enable fractional scaling
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"

# Switch firewalld profile to drop
sudo firewall-cmd --set-default-zone=drop

# Install essential packages
sudo dnf check-update
sudo dnf upgrade -y
sudo dnf remove -y libreoffice-* rhythmbox
sudo dnf install -y vim git gcc python3 btop speedtest-cli gnome-tweaks
