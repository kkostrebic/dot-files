#!/usr/bin/env bash

FILE_NAME="frontend-snippets.json"
FULL_PATH="$(cd "$(dirname "$0")"; pwd -P)"
LAYOUT="$FULL_PATH/$FILE_NAME"
WORKSPACE="workspace $1"

# if [ -z $2 ]; then
#   WORKING_DIR=~
# else
#   WORKING_DIR=$2
# fi

WORKING_DIR=${2:-~}
COMMAND="cd $WORKING_DIR && $SHELL"

if !(-e $WORKING_DIR); then
  mkdir -p $WORKING_DIR
fi

APPS="exec xterm -e '$COMMAND'; \
      exec xterm -e '$COMMAND'; \
      exec xterm -e '$COMMAND'; \
      exec gvim '$WORKING_DIR/index.html'; \
      exec gvim '$WORKING_DIR/index.css'; \
      exec gvim '$WORKING_DIR/index.js'; \
      exec google-chrome --new-window 'file://$WORKING_DIR'; \
      exec google-chrome --new-window 'file://$WORKING_DIR';"

i3-msg "$WORKSPACE; append_layout $LAYOUT; $APPS"
