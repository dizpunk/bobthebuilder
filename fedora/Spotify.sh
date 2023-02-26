#!/bin/bash
set -e

# Add Flathub repository
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Enable repository
sudo flatpak remote-modify --enable

# Install Spotify client
flatpak install -y flathub com.spotify.Client
