#!/usr/bin/env bash

# font-awesome 4 unicodes:
# f0e0 - envelope
envelope=
gray="#555555"
turquoise="#00FFFF"
left_click=1
no_click=0

function response {
  message='{ "full_text":"%s", "color":"%s" }\n'
  printf "$message" "$1" "$2"
}

# TODO: Should be modular and with logic to run a default email client 
# and focus if it's already running
function show_email_client {
  i3-msg "[class=Thunderbird] focus"
}

if [[ $BLOCK_BUTTON -eq $left_click ]]; then
  show_email_client
  response $envelope $gray
elif [[ $BLOCK_BUTTON -eq $no_click ]]; then
  # if script is triggered with signal (instead of click) show new email indicator
  response $envelope $turquoise
fi

exit 0
