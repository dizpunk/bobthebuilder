#!/usr/bin/env bash

# Add Flathub repository
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Enable repository
sudo flatpak remote-modify flathub --enable

# Install Spotify client
sudo flatpak install -y flathub com.spotify.Client
