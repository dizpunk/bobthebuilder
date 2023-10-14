#!/usr/bin/env bash

# Install Brave repository
sudo dnf install dnf-plugins-core
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo

# Import Brave key
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

# Install Brave
sudo dnf install -y brave-browser