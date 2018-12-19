#!/bin/bash

if [[ $BLOCK_BUTTON -eq 1 ]]; then
  i3-msg "[class=Thunderbird] focus"
  printf '{"full_text":"", "color":"#555555"}\n'
else
  printf '{"full_text":"", "color":"#00FFFF"}\n'
fi

exit 0
