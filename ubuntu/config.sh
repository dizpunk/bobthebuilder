#!/bin/bash

# Cleanup and install essential packages
printf "\n\n# Cleanup and Essential Packages\n\n"
sudo apt update
sudo apt upgrade -y
sudo apt install -y vim git gcc python3 btop speedtest-cli virt-manager gnome-tweaks papirus-icon-theme

# Enable fractional scaling and set new icon theme
printf "\n\n# Fractional Scaling and Icon Theme\n\n"
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']" &> /dev/null
gsettings set org.gnome.desktop.interface icon-theme 'Papirus'
git clone https://github.com/PapirusDevelopmentTeam/papirus-folders
sudo ./papirus-folders/papirus-folders -C yaru
rm -fr ./papirus-folders

# Install bashrc configuration
printf "\n\n# Custom Bash Configurations\n\n"
wget https://raw.githubusercontent.com/dizpunk/dotfiles/main/bash/.bashrc &> /dev/null
mv -f ./.bashrc ~/.bashrc

# Install chosen apps
printf "\n\n# Third-party Apps\n\n"
PS3="Select apps to install: "

select apps in all choose none; do
  case $apps in
    all)
      for script in ./apps/*.sh; do
        bash "$script"
      done
      break
      ;;
    choose)
      declare -A Apps
      Apps=(["Bitwarden"]="bitwarden.sh" ["Brave Browser"]="bravebrowser.sh" ["VSCode"]="vscode.sh" ["Spotify"]="spotify.sh")
      toInstall=()
      for app in "${!Apps[@]}"; do
        read -p "Do you want to install $app? (y/n) " answer
        if [[ $answer == "y" ]]; then
          toInstall+=("${Apps[$app]}")
        fi
      done
      for script in "${toInstall[@]}"; do
          bash "./apps/$script"
      done
      break
      ;;
    none)
      break
      ;;
    *)
      printf "Invalid option: $REPLY. Selection must be a number (1=all, 2=some, 3=none).\n\n"
      ;;
  esac
done