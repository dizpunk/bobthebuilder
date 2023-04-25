#!/bin/bash

printf "\n\n\n---------- Installing Spotify ----------\n\n\n"

# Add Flathub repository
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Enable repository
sudo flatpak remote-modify flathub --enable

# Install Spotify client
sudo flatpak install -y flathub com.spotify.Client

printf "\n\n\n---------- Spotify Installed ----------\n\n\n"
