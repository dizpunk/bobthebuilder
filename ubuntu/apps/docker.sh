#!/usr/bin/env bash

# Install dependencies
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg

# Add Docker repository
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Create and add user to Docker group
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
