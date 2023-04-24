#!/bin/bash

printf "\n\n\n---------- Installing Essential Packages ----------\n\n\n"

# Cleanup and install essential packages
sudo dnf check-update
sudo dnf upgrade -y
sudo dnf remove -y libreoffice-* rhythmbox
sudo dnf install -y vim git gcc python3 btop speedtest-cli gnome-tweaks papirus-icon-theme

printf "\n\n\n---------- Essential Packages Installed ----------\n\n\n"

# Enable fractional scaling and set new icon theme
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"
gsettings set org.gnome.desktop.interface icon-theme 'Papirus'


# Install chosen apps

PS3="Select apps to install: "

select apps in all some none; do
  case $apps in
    all)
    #   for script in ./apps/*.sh; do
    #     bash "$script"
    #   done
      break
      ;;
    some)
      # TODO
      break
      ;;
    none)
      break
      ;;
    *)
      printf "Invalid option: $REPLY. Selection must be a number...\n\n"
      break
      ;;
  esac
done