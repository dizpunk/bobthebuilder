#!/usr/bin/env bash

# Enable fractional scaling
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']" &> /dev/null

# Enable UFW with default deny policy
sudo ufw default deny &> /dev/null
sudo ufw enable

# Update the system
sudo apt update
sudo apt full-upgrade -y
