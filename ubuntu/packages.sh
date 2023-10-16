#!/usr/bin/env bash

# Install essential packages
essentialPackages="vim git exa btop lshw inxi lm_sensors speedtest-cli seahorse gufw virt-manager gnome-tweaks"

sudo apt update
sudo apt install -y $essentialPackages
