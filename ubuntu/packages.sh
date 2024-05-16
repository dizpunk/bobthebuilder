#!/usr/bin/env bash

# Install essential packages
essentialPackages="vim git eza btop lshw inxi lm_sensors speedtest-cli seahorse gufw gnome-tweaks"

sudo apt update
sudo apt install -y $essentialPackages
