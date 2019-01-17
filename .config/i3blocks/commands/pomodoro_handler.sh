#!/usr/bin/env bash

# font-awesome 4 unicodes:
# f06e - eye
# f070 - eye-slash
eye=
eye_slash=
no=0
yes=1
gray="#555555"
turquoise="#00FFFF"
no_click=0
left_click=1
right_click=3
notification_message="Health alert: Take your eyes off the screen"

function response {
  message='{ "full_text":"%s", "color":"%s", "_enabled":%d, "_skip_initial":%d }\n'
  printf "$message" "$1" "$2" "$3" "$4"
}

function show_notification {
  # show notification message for 5 seconds
  # category 'silent' is used in filtering these messages
  # and not saving those to notification history
  notify-send -t 5000 -c "silent" "$notification_message"
  response $eye $turquoise $yes $no
}

function skip_initial {
  if [[ $_skip_initial -eq $yes ]]; then
    case $_enabled in
      $yes)
        response $eye $gray $yes $no
        ;;
      $no)
        response $eye_slash $gray $no $no
        ;;
    esac

    exit 0 
  fi
}

function handle_disabled_state {
  case $BLOCK_BUTTON in 
    $right_click)
      # enable pomodoro on right click
      response $eye $gray $yes $no
      ;;
    *)
      # stay disabled for any other value
      response $eye_slash $gray $no $no
      ;;
  esac
}

function handle_enabled_state {
  if [[ -z "$BLOCK_BUTTON" ]]; then
    show_notification
    return
  fi

  case $BLOCK_BUTTON in 
    $no_click)
      # show notification if script is triggered using signal
      show_notification
      ;;
    $left_click)
      # clear notification on left click
      response $eye $gray $yes $no
      ;;
    $right_click)
      # disable pomodoro on right click
      response $eye_slash $gray $no $no
      ;;
  esac
}


skip_initial

case $_enabled in 
  $yes)
    handle_enabled_state
    ;;
  $no)
    handle_disabled_state
    ;;
esac

exit 0
