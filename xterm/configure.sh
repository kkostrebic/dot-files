#!/usr/bin/env bash

SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null && pwd)"
CONFIG_DIR=$HOME/.config/xterm

# TODO: - think of incremental backup...
mv -u $CONFIG_DIR/config $CONFIG_DIR/config.old 2>/dev/null
mv -u $HOME/.Xdefaults $HOME/.Xdefaults.old 2>/dev/null
mv -u $HOME/.Xresources $HOME/.Xresources.old 2>/dev/null

# create configuration directory if it's not there
if [ ! -e $CONFIG_DIR ]; then
  mkdir -p $CONFIG_DIR
fi

# make links to source configuration file
ln -s $SOURCE_DIR/config $CONFIG_DIR/config
ln -s $CONFIG_DIR/config $HOME/.Xdefaults
ln -s $CONFIG_DIR/config $HOME/.Xresources
