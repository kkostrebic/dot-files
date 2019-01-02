#! /bin/bash

SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null && pwd)"
CONFIG_DIR=$HOME/.config/i3blocks

# TODO: - think of incremental backup...
rm -f $CONFIG_DIR/config.old $CONFIG_DIR/commands.old

mv -u $CONFIG_DIR/config $CONFIG_DIR/config.old 2>/dev/null
mv -u $CONFIG_DIR/commands $CONFIG_DIR/commands.old 2>/dev/null

# create configuration directory if it's not there
if [ ! -e $CONFIG_DIR ]; then
  mkdir -p $CONFIG_DIR
fi

# make links to source configuration file
ln -s $SOURCE_DIR/config $CONFIG_DIR/config
ln -s $SOURCE_DIR/commands $CONFIG_DIR/

# set environment variables for i3blocks
ENV_FILE=~/.i3env
VAR_NAME=I3BLOCKS_CONFIG_DIR

# https://shreevatsa.wordpress.com/2008/03/30/zshbash-startup-files-loading-order-bashrc-zshrc-etc/
# If custom profile file does not exist or does not contain I3BLOCKS_CONFIG_DIR
if [ ! -e $ENV_FILE ] || ! grep -q -F "$VAR_NAME=$CONFIG_DIR" $ENV_FILE; then
  echo $VAR_NAME=$CONFIG_DIR >> $ENV_FILE
fi
