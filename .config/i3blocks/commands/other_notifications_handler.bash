#!/bin/bash

if [[ $full_text == "" && $BLOCK_BUTTON -eq 1 ]]; then
  # printf '{ "full_text":" " }\n'
  echo ""
  for run in {1..20}; do xdotool key Ctrl+grave; done
  # bash -c 'sleep 20; killall dunst; dunst &' &
else
  # printf '{ "full_text":"" }\n'
  echo ""
fi
exit 0
