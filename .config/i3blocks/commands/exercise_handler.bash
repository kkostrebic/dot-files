#!/bin/bash

if [[ $_enabled -eq 0 ]]; then
  if [[ $BLOCK_BUTTON -eq 3 ]]; then
    printf '{"full_text":"", "color":"#555555", "_enabled":1, "_skip_initial":0}\n'
  else
    printf '{"full_text":"", "color":"#555555", "_enabled":0, "_skip_initial":0}\n'
  fi
else
  if [[ $BLOCK_BUTTON -eq 1 ]]; then
    printf '{"full_text":"", "color":"#555555", "_enabled":1, "_skip_initial":0}\n'
  elif [[ $BLOCK_BUTTON -eq 3 ]]; then
    printf '{"full_text":"", "color":"#555555", "_enabled":0, "_skip_initial":0}\n'
  elif [[ $_skip_initial -eq 1 ]]; then
    printf '{"full_text":"", "color":"#555555", "_enabled":1, "_skip_initial":0}\n'
  else
    notify-send -t 5000 -c "silent" "Take a walk; Locking in 5 seconds..."
    (sleep 5 && i3lock -c 000000) &
    printf '{"full_text":"", "color":"#00FFFF", "_enabled":1, "_skip_initial":0}\n'
  fi
fi

exit 0

