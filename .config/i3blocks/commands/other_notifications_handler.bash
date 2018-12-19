#!/bin/bash

if [[ $full_text == "" && $BLOCK_BUTTON -eq 1 ]]; then
  printf '{ "full_text":"", "color":"#555555" }\n'
  if [[ $color == "#00FFFF" ]]; then
    for run in {1..20}; do xdotool key Ctrl+grave; done
  fi
  # bash -c 'sleep 20; killall dunst; dunst &' &
else
  printf '{ "full_text":"", "color":"#00FFFF" }\n'
fi
exit 0
