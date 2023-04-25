#!/bin/bash
set -e

# Install dependencies
sudo dnf -y install kernel-headers kernel-devel dkms elfutils-libelf-devel qt5-qtx11extras

# Add VirtualBox repository (replace releasever with last supported version and escape basearch)
cat << EOF | sudo tee /etc/yum.repos.d/virtualbox.repo 
[virtualbox]
enabled=1
gpgcheck=1
repo_gpgcheck=1
name=Fedora $releasever - $basearch - VirtualBox
gpgkey=https://www.virtualbox.org/download/oracle_vbox.asc
baseurl=http://download.virtualbox.org/virtualbox/rpm/fedora/36/\$basearch
EOF

# Show available versions
sudo dnf search virtualbox

# Select version
echo -n "Which version do you want to install: "
read VIRTUALBOX

# Install VirtualBox
sudo dnf install -y $VIRTUALBOX

# Add user to vboxusers 
sudo usermod -a -G vboxusers $USER
