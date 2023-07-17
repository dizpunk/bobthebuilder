#!/bin/bash

# Enable fractional scaling and set new icon theme
printf "\n\n# Fractional Scaling and Icon Theme\n\n"
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']" &> /dev/null


# Install bashrc configuration
printf "\n\n# Custom Bash Configurations\n\n"
wget https://raw.githubusercontent.com/dizpunk/dotfiles/main/bash/.bashrc &> /dev/null
mv -f ./.bashrc ~/.bashrc


# Install aliases
git clone https://github.com/dizpunk/dotfiles
mv ./dotfiles/aliases/* .
./aliases.sh
rm -rf aliases.sh tools/ dotfiles/
mv .aliases ~/


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
      Apps=(["Bitwarden"]="bitwarden.sh" ["Docker"]="docker.sh" ["VSCode"]="vscode.sh" ["Spotify"]="spotify.sh")
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
