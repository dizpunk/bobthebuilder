#!/usr/bin/env bash

# Set display preferences
org.gnome.mutter dynamic-workspaces false
org.gnome.mutter workspaces-only-on-primary true
gsettings set org.gnome.mutter center-new-windows true
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']" &> /dev/null

# Enable UFW with default deny policy
sudo ufw default deny &> /dev/null
sudo ufw enable

# Update the system
sudo apt update
sudo apt full-upgrade -y
