#!/usr/bin/env bash

# Add Docker repository
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

# Install Docker
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Add user to docker group
sudo groupadd docker
sudo usermod -aG docker $USER

# Enable Docker at startup
echo -en "\nEnable Docker at startup [y/n]? "
read RESPONSE
if [[ "$RESPONSE" == "y" ]]; then
  sudo systemctl enable docker.service
  sudo systemctl enable containerd.service
  printf "\n\n## Docker enabled at startup ##\n\n"
fi
