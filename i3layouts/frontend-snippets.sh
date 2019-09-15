#!/usr/bin/env bash

FILE_NAME="frontend-snippets.json"
FULL_PATH="$(dirname "$(readlink -f "$0")")"
LAYOUT="$FULL_PATH/$FILE_NAME"
WORKSPACE="workspace $1"

# if [ -z $2 ]; then
#   WORKING_DIR=~
# else
#   WORKING_DIR=$2
# fi
WORKING_DIR=${2:-/tmp/codeplay}

if [ ! -d $WORKING_DIR ]; then
  mkdir -p $WORKING_DIR
fi

APPS="exec xterm -e 'cd $WORKING_DIR && $SHELL'; \
      exec xterm -e 'cd $WORKING_DIR && $SHELL'; \
      exec xterm -e 'cd $WORKING_DIR && $SHELL'; \
      exec cd '$WORKING_DIR' && gvim; \
      exec qutebrowser; \
      exec google-chrome --new-window 'file://$WORKING_DIR'; \
      exec google-chrome --new-window 'file://$WORKING_DIR';"

i3-msg "$WORKSPACE; append_layout $LAYOUT; $APPS"
sleep 0.5
xdotool search --onlyvisible --class "Chrome" windowfocus key F12
