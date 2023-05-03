#!/bin/bash

# Install dependencies
sudo apt install -y wget gpg apt-transport-https

# Import and install Microsoft keys
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
rm -f packages.microsoft.gpg

# Add VS Code repository (amd64)
cat << EOF | sudo tee /etc/apt/sources.list.d/vscode.list &> /dev/null
deb [arch=amd64 signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main
EOF

# Install VS Code
sudo apt update
sudo apt install -y code
