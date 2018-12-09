#! /bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null && pwd)"

# TODO: - copy (make original backup) instead of removing
rm -f ~/.tmux.conf
ln -s $DIR/config ~/.tmux.conf
