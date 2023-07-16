#!/bin/bash

# Enable fractional scaling
printf "\n\n\n#---------- Fractional Scaling Enabled ----------#\n\n\n"
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']" &> /dev/null


# Shell configuration
printf "\n\n\n#---------- Shell Configurations ----------#\n\n\n"
read -p "Which shell would you like to use by default? (bash/zsh) " chosenShell

if [[ "$chosenShell" == "zsh" ]]; then
  wget https://raw.githubusercontent.com/dizpunk/dotfiles/main/zsh/.zshrc &> /dev/null
  mv -f ./.zshrc ~/.zshrc
else
  wget https://raw.githubusercontent.com/dizpunk/dotfiles/main/bash/.bashrc &> /dev/null
  mv -f ./.bashrc ~/.bashrc
fi


# Install aliases
printf "\n\n\n#---------- Aliases ----------#\n\n\n"
git clone https://github.com/dizpunk/dotfiles
mv ./dotfiles/aliases/* .
./aliases.sh
rm -rf aliases.sh tools/ dotfiles/
mv .aliases ~/


# Install chosen apps
printf "\n\n\n#---------- Third-party Apps ----------#\n\n\n"

PS3="Select third-party apps: "

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

printf "\n\n\n#---------- Third-party Apps Installed ----------#\n\n\n"
