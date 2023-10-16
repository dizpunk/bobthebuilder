#!/usr/bin/env bash

# Install third-party apps
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
      Apps=(["Brave Browser"]="brave.sh" ["Docker"]="docker.sh" ["VSCode"]="vscode.sh" ["Spotify"]="spotify.sh")
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
