#!/usr/bin/env bash

# Set display preferences
org.gnome.mutter dynamic-workspaces false
org.gnome.mutter workspaces-only-on-primary true
gsettings set org.gnome.mutter center-new-windows true
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']" &> /dev/null


# Switch firewalld default profile to drop
sudo firewall-cmd --set-default-zone=drop


# Update the system
sudo dnf upgrade -y --refresh
