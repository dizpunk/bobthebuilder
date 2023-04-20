#!/bin/bash

echo "---------- Installing Essential Packages ----------"

# Cleanup and install essential packages
sudo dnf check-update
sudo dnf upgrade -y
sudo dnf remove -y libreoffice-* rhythmbox
sudo dnf install -y vim git gcc python3 btop speedtest-cli gnome-tweaks papirus-icon-theme

echo "---------- Essential Packages Installed ----------"

# Enable fractional scaling and set new icon theme
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"
gsettings set org.gnome.desktop.interface icon-theme 'Papirus'