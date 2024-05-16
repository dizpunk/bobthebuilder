#!/usr/bin/env bash

# Remove unwanted software and install essential packages
garbage="libreoffice-* rhythmbox mediawriter gnome-contacts gnome-photos gnome-maps gnome-weather gnome-clocks gnome-tour cheese fedora-chromium-config*"

essentialPackages="vim git eza btop lshw inxi lm_sensors speedtest-cli seahorse firewall-config gnome-tweaks"

sudo dnf remove -y $garbage
sudo dnf install -y $essentialPackages
