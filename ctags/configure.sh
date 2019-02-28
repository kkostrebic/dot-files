#!/usr/bin/env bash

SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null && pwd)"
CONFIG_DIR=$HOME/.config/ctags
CTAGS_PATH=$HOME/.ctags

# TODO: - think of incremental backup...
mv -u $CONFIG_DIR/config $CONFIG_DIR/config.old 2>/dev/null
mv -u $CTAGS_PATH $CTAGS_PATH.old 2>/dev/null

# create configuration directory if it's not there
if [ ! -e $CONFIG_DIR ]; then
  mkdir -p $CONFIG_DIR
fi

# copy ctags configuration file
cp $SOURCE_DIR/config $CONFIG_DIR
# make a link to ctags configuration file from $HOME
ln -s $CONFIG_DIR/config $CTAGS_PATH
