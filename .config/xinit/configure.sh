#!/usr/bin/env bash

SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null && pwd)"

# TODO: - think of incremental backup...
mv -u $HOME/.xinitrc $HOME/.xinitrc.old 2>/dev/null
# mv -u $HOME/.zprofile $HOME/.zprofile.old 2>/dev/null

# make links to source configuration file
ln -s $SOURCE_DIR/config $HOME/.xinitrc

# cat >>~/.zprofile <<EOL
# if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
#   exec startx
# fi
# EOL
