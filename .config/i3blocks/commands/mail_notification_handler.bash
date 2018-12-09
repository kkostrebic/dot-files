#!/bin/bash

if [[ $BLOCK_BUTTON -eq 1 ]]; then
  printf '{"full_text":"", "color":"#555555"}\n'
else
  printf '{"full_text":"", "color":"#00FFFF"}\n'
fi

exit 0
