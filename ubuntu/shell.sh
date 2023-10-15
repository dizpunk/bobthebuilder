#!/usr/bin/env bash

# Shell configuration
PS3="Select default shell => "

select shell in bash zsh; do
  case $shell in
    bash)
      wget https://raw.githubusercontent.com/dizpunk/dotfiles/main/bash/.bashrc &> /dev/null
      mv -f ./.bashrc ~/.bashrc
      break
      ;;
    zsh)
      sudo apt install -y zsh
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
git clone https://github.com/dizpunk/dotfiles
mv ./dotfiles/aliases/* .
./aliases.sh
rm -rf aliases.sh tools/ dotfiles/
mv .aliases ~/
