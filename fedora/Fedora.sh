#!/bin/bash
set -e

# Cleanup and install essential packages
sudo dnf check-update
sudo dnf upgrade -y
sudo dnf remove -y libreoffice-* rhythmbox
sudo dnf install -y vim git gcc python3 btop speedtest-cli gnome-tweaks
