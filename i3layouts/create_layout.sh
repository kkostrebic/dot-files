#!/usr/bin/env bash

WORKSPACE="workspace $1"
FULL_PATH="$(cd "$(dirname "$0")"; pwd -P)"
LAYOUT="$FULL_PATH/$2"
APPS="exec xterm; exec xterm; exec xterm; exec gvim; exec gvim; exec gvim; exec google-chrome; exec google-chrome;"

i3-msg "$WORKSPACE; append_layout $LAYOUT; $APPS"
