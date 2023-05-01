#!/bin/bash

# Enable UFW with default deny policy
sudo ufw default deny &> /dev/null
sudo ufw enable

# Update and reboot
sudo apt update
sudo apt full-upgrade -y
reboot
