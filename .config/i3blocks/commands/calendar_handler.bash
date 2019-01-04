#!/bin/bash

if [[ $BLOCK_BUTTON -eq 1 ]]; then
  orage 1>/dev/null 2>&1 & 
fi

date '+%Y-%m-%d %H:%M:%S'
exit 0
