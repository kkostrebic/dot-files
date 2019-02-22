#! /bin/bash

# Install zsh
apt install zsh -y

# Use ZSH variable to set destination directory for oh-my-zsh - default $HOME/.oh-my-zsh
ZSH=$HOME/.oh-my-zsh

if [ ! -d $ZSH ]; then
  # Install oh-my-zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi
