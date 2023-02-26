#!/bin/bash
set -e

# Install Docker repository
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

# Install Docker
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Create and add user to Docker group
sudo groupadd docker
sudo usermod -aG docker $USER
echo "Log out and back in for changes to take effect"

# Enable Docker at startup
echo -n "Enable Docker at startup [y/n]? "
read RESPONSE
if [[ "$RESPONSE" == "y" ]]; then
  sudo systemctl enable docker.service
  sudo systemctl enable containerd.service
fi
