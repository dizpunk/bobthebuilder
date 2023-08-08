#!/usr/bin/env bash


# Switch firewalld default profile to drop
sudo firewall-cmd --set-default-zone=drop


# System update
sudo dnf upgrade -y --refresh


# Clean up and install essential packages
printf "\n\n\n#---------- Installing Essential Packages ----------#\n\n\n"

garbage="libreoffice-* rhythmbox gnome-contacts gnome-photos gnome-maps gnome-weather gnome-clocks gnome-tour cheese fedora-chromium-config*"
essentialPackages="vim git exa btop lshw inxi lm_sensors speedtest-cli virt-manager seahorse firewall-config gnome-tweaks"

sudo dnf remove -y $garbage
sudo dnf install -y $essentialPackages


# Enable fractional scaling
printf "\n\n\n#---------- Enable Fractional Scaling ----------#\n\n\n"
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']" &> /dev/null


# Shell configuration
printf "\n\n\n#---------- Shell Configuration ----------#\n\n\n"
PS3="Select default shell => "

select shell in bash zsh; do
  case $shell in
    bash)
      wget https://raw.githubusercontent.com/dizpunk/dotfiles/main/bash/.bashrc &> /dev/null
      mv -f ./.bashrc ~/.bashrc
      break
      ;;
    zsh)
      sudo dnf install -y zsh util-linux-user
      wget https://raw.githubusercontent.com/dizpunk/dotfiles/main/zsh/.zshrc &> /dev/null
      mv -f ./.zshrc ~/.zshrc
      chsh -s /bin/zsh
      break
      ;;
    *)
      printf "Invalid option: $REPLY. Selection must be a number (1=bash, 2=zsh).\n\n"
      ;;
  esac
done


# Install aliases
printf "\n\n\n#---------- Aliases ----------#\n\n\n"
git clone https://github.com/dizpunk/dotfiles
mv ./dotfiles/aliases/* .
./aliases.sh
rm -rf aliases.sh tools/ dotfiles/
mv .aliases ~/


# Install third-party apps
printf "\n\n\n#---------- Third-party Apps ----------#\n\n\n"

PS3="Select third-party apps => "

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


# System reboot
printf "\n\n\n#---------- System Reboot ----------#\n\n\n"
sleep 3
reboot
