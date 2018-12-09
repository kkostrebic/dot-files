#! /bin/bash

I3V=~/.i3vars
VAR=I3BLOCKS_CONFIG_DIR
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null && pwd)"

# https://shreevatsa.wordpress.com/2008/03/30/zshbash-startup-files-loading-order-bashrc-zshrc-etc/
# If custom profile file does not exist or does not contain I3BLOCKS_CONFIG_DIR
if [ ! -e $I3V ] || ! grep -q -F "$VAR=$DIR" $I3V; then
  echo $VAR=$DIR >> $I3V
fi
