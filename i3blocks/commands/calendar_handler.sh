#!/usr/bin/env bash

left_click=1
format="+%H:%M"

if [[ $BLOCK_BUTTON -eq $left_click ]]; then
  i3-msg --quiet exec gsimplecal
fi

date "$format"

exit 0
