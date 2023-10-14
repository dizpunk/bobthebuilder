#!/usr/bin/env bash


# Enable fractional scaling
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']" &> /dev/null


# Switch firewalld default profile to drop
sudo firewall-cmd --set-default-zone=drop


# Update the system
sudo dnf upgrade -y --refresh
