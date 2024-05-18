#!/usr/bin/env bash

# Set display preferences
org.gnome.mutter dynamic-workspaces false
org.gnome.mutter workspaces-only-on-primary true
gsettings set org.gnome.mutter center-new-windows true
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']" &> /dev/null

# Switch firewalld default profile to drop
sudo firewall-cmd --set-default-zone=drop

# Set up terminal profiles
wget https://raw.githubusercontent.com/dizpunk/dotfiles/main/gnome-terminal/gnome-terminal.dconf &> /dev/null
dconf load /org/gnome/terminal/legacy/profiles:/ < ./gnome-terminal-profiles.dconf
rm gnome-terminal-profiles.dconf

# Update the system
sudo dnf upgrade -y --refresh
