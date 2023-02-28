#!/bin/bash
set -e

# Get filename
echo -n "Bitwarden executable: "
read BITWARDEN

# Make executable
chmod 755 $BITWARDEN

# Move to new folder
mkdir $HOME/Apps
mv $BITWARDEN $HOME/Apps

# Create .desktop entry 
cat << EOF | tee Bitwarden.desktop
[Desktop Entry]
Type=Application
Version=1.0
Name=Bitwarden
Icon=/usr/share/icons/Papirus/48x48/apps/bitwarden.svg
Exec=/home/lazyhatter/Apps/$BITWARDEN
Terminal=false
MimeType=x-scheme-handler/bitwarden;text/html;
EOF

# Move entry
mv Bitwarden.desktop $HOME/.local/share/applications/
