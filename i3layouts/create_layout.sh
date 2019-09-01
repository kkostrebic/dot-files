#!/usr/bin/env bash

WORKSPACE="workspace $1"
LAYOUT="/home/helmut/projects/dot-files/i3layouts/$2"
APPS="exec xterm; exec xterm; exec xterm; exec gvim; exec gvim; exec gvim; exec google-chrome; exec google-chrome;"

i3-msg "$WORKSPACE; append_layout $LAYOUT; $APPS"
