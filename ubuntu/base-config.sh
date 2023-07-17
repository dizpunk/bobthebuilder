#!/bin/bash

# Enable UFW with default deny policy
sudo ufw default deny &> /dev/null
sudo ufw enable

# System update
sudo apt update
sudo apt full-upgrade -y

# Install essential packages
printf "\n\n\n#---------- Installing Essential Packages ----------#\n\n\n"

essentialPackages="vim git exa btop speedtest-cli seahorse gufw virt-manager gnome-tweaks"

sudo apt update
sudo apt install -y $essentialPackages

# System reboot
printf "\n\n\n#---------- System Reboot ----------#\n\n\n"
sleep 3
reboot
