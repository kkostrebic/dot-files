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
left_click=1
right_click=3

function print_json {
  message='{ "full_text":"%s", "color":"%s", "_new_notifications":%d, "_enabled":%d}\n'
  printf "$message" "$1" "$2" "$3" "$4"
}

function start_notification_daemon {
  exec -c dunst
}

function stop_notification_daemon {
  killall dunst
}

function show_new_notifications {
  start=1
  while [[ $start -le $_new_notifications ]]; do 
    xdotool key Ctrl+grave
    ((start = start + 1)) 
  done
}

if [[ $BLOCK_BUTTON -eq $left_click ]] && [[ $_new_notifications -gt 0 ]]; then
  show_new_notifications
  print_json "$bell" "$gray" 0 $yes
elif [[ $BLOCK_BUTTON -eq $right_click ]]; then
  case $_enabled in
    $yes)
      stop_notification_daemon
      print_json "$bell_slash" "$gray" 0 $no
      ;;
    $no)
      print_json "$bell" "$gray" 0 $yes
      start_notification_daemon
      ;;
  esac
elif [[ $BLOCK_BUTTON -eq 0 ]]; then
  ((_new_notifications = _new_notifications + 1))
  print_json "$bell" "$turquoise" $_new_notifications $yes
fi

exit 0
