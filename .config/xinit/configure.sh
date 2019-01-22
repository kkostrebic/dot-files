#!/usr/bin/env bash

SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null && pwd)"

# TODO: - think of incremental backup...
mv -u $HOME/.xinitrc $HOME/.xinitrc.old 2>/dev/null

# make links to source configuration file
ln -s $SOURCE_DIR/config $HOME/.xinitrc
