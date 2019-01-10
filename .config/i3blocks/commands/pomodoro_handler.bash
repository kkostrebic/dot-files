#!/bin/bash

if [[ $BLOCK_BUTTON -eq 1 ]]; then
  printf '{"full_text":"", "color":"#555555"}\n'
else
  notify-send -t 5000 -c "silent" "Take look away from your monitor"
  printf '{"full_text":"", "color":"#00FFFF"}\n'
fi

exit 0

