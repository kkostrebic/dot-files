#!/usr/bin/env bash

SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null && pwd)"
CONFIG_DIR=$HOME/.config/zsh

# TODO: - think of incremental backup...
mv -u $CONFIG_DIR/config $CONFIG_DIR/config.old 2>/dev/null
mv -u $HOME/.zshrc $HOME/.zshrc.old 2>/dev/null

# create configuration directory if it's not there
if [ ! -e $CONFIG_DIR ]; then
  mkdir -p $CONFIG_DIR
fi

# make a link to referenced theme (referenced in the config file)
ln -s $SOURCE_DIR/kenan-custom.zsh-theme $HOME/.oh-my-zsh/themes/kenan-custom.zsh-theme

# make links to source configuration file
ln -s $SOURCE_DIR/config $CONFIG_DIR/config
ln -s $CONFIG_DIR/config $HOME/.zshrc

# TODO: This should go to different file, but for now it'll be here
# cat >>~/.zprofile <<EOL
# if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
#   exec startx
# fi
# EOL
