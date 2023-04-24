#!/bin/bash

printf "\n\n\n---------- Installing Brave Browser ----------\n\n\n"

# Enable DNF plugins
sudo dnf install dnf-plugins-core

# Add Brave repository
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo

# Import Brave Keys
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

# Install Brave
sudo dnf install -y brave-browser

# Fix Blurry Window
# brave://flags/ -> Ozone Platform = Auto

printf "\n\n\n---------- Brave Browser Installed ----------\n\n\n"
