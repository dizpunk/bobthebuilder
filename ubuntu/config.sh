#!/bin/bash

# Cleanup and install essential packages
printf "\n\n#################### Cleanup and Essential Packages\n\n"
sudo apt update
sudo apt upgrade -y
sudo apt install -y vim git gcc python3 btop speedtest-cli virt-manager gnome-tweaks papirus-icon-theme

# Enable fractional scaling and set new icon theme
printf "\n\n#################### Fractional Scaling and Icon Theme\n\n"
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']" &> /dev/null
gsettings set org.gnome.desktop.interface icon-theme 'Papirus'


# Install bashrc configuration
printf "\n\n#################### Custom Bash Configurations\n\n"
wget https://raw.githubusercontent.com/dizpunk/dotfiles/main/bash/bashrc &> /dev/null
mv -f ./bashrc ~/.bashrc