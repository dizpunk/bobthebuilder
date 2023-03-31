#!/bin/bash

echo "---------- Installing VSCode ----------"

# Import Microsoft keys
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

# Add VS Code repository
cat << EOF | sudo tee /etc/yum.repos.d/vscode.repo &> /dev/null
[code]
enabled=1
gpgcheck=1
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
EOF

# Install VS Code
dnf check-update
sudo dnf install -y code

# Run natively on Wayland (not XWayland)
sudo sed --i 's/Exec=.*/Exec=\/usr\/share\/code\/code --enable-features=UseOzonePlatform --ozone-platform=wayland --enable-features=WaylandWindowDecorations --unity-launch %F/g' /usr/share/applications/code.desktop

echo "---------- VSCode Installed ----------"
