#! /usr/bin/env bash

CAPS=$(xset -q | grep Caps | awk '{ print $4 }')

if [[ $CAPS == 'on' ]]; then
  printf '{ "full_text":"CAPS", "color":"#00FF00" }\n'
else
  printf '{ "color":"#555555" }\n'
fi

exit 0
