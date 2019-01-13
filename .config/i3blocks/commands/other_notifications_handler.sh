#!/usr/bin/env bash

# font-awesome 4 unicodes:
# f0f3 - bell
# f1f6 - bell-slash
bell=
bell_slash=
no=0
yes=1
gray="#555555"
turquoise="#00FFFF"
no_click=0
left_click=1
right_click=3

function response {
  message='{ "full_text":"%s", "color":"%s", "_new_notifications":%d, "_enabled":%d}\n'
  printf "$message" "$1" "$2" "$3" "$4"
}

function enable_notification_daemon {
  exec -c dunst
}

function disable_notification_daemon {
  killall dunst
}

function show_new_notifications {
  start=1
  while [[ $start -le $_new_notifications ]]; do 
    # Use dunst shortcut (ctrl+grave) to get latest notification messages
    xdotool key Ctrl+grave
    ((start = start + 1)) 
  done
}

if [[ $BLOCK_BUTTON -eq $left_click ]] && [[ $_new_notifications -gt 0 ]]; then
  show_new_notifications
  response "$bell" "$gray" 0 $yes
elif [[ $BLOCK_BUTTON -eq $right_click ]]; then
  case $_enabled in
    $yes)
      disable_notification_daemon
      response "$bell_slash" "$gray" 0 $no
      ;;
    $no)
      enable_notification_daemon
      response "$bell" "$gray" 0 $yes
      ;;
  esac
elif [[ $BLOCK_BUTTON -eq $no_click ]]; then
  # if script is triggered with signal (instead of click) 
  # increment number of new notifications and show new notification indicator
  ((_new_notifications = _new_notifications + 1))
  response "$bell" "$turquoise" $_new_notifications $yes
fi

exit 0
