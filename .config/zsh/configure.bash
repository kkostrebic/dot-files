#! /bin/bash

TARGET=~/.zshrc
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null && pwd)"

# TODO: - copy (make original backup) instead of removing
rm -f $TARGET
ln -s $DIR/config $TARGET

# TODO: This should go to different file, but for now it'll be here
# cat >>~/.zprofile <<EOL
# if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
#   exec startx
# fi
# EOL
