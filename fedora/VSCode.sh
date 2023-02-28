# Import Microsoft keys
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

# Add VS Code repository
cat << EOF | sudo tee /etc/yum.repos.d/vscode.repo
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
