#! /bin/bash

I3V=~/.i3vars
VAR=DUNST_CONFIG_DIR
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null && pwd)"

# TODO: - copy (make original backup) instead of removing
#       - avoid using sudo 
#
# Remove old configuration 
sudo rm -f /etc/xdg/dunst/dunstrc

# Make to desired config file
sudo ln -s $DIR/config /etc/xdg/dunst/dunstrc

# If custom profile file does not exist or does not contain DUNST_CONFIG_DIR
if [ ! -e $I3V ] || ! grep -q -F "$VAR=$DIR" $I3V; then
  echo $VAR=$DIR >> $I3V
fi
