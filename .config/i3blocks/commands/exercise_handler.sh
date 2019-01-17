#!/usr/bin/env bash

# font-awesome 4 unicodes:
# f1ae - child
# f183 - man
hands_up=
hands_down=
no=0
yes=1
gray="#555555"
turquoise="#00FFFF"
no_click=0
left_click=1
right_click=3
notification_message="Take a walk; Locking in 5 seconds..."

function response {
  message='{ "full_text":"%s", "color":"%s", "_enabled":%d, "_skip_initial":%d}\n'
  printf "$message" "$1" "$2" "$3" "$4"
}

function show_notification {
  # show notification message for 5 seconds
  # category 'silent' is used in filtering these messages
  # and not saving those to notification history
  notify-send -t 5000 -c "silent" "$notification_message"
  response $hands_up $turquoise $yes $no
}

function lock_screen {
  # lock screen in 5 seconds (use black background color)
  i3-msg exec "sleep 5 && i3lock -c 000000" 
}

function skip_initial {
  if [[ $_skip_initial -eq $yes ]]; then
    case $_enabled in
      $yes)
        response $hands_up $gray $yes $no
        ;;
      $no)
        response $hands_down $gray $no $no
        ;;
    esac

    exit 0 
  fi
}

function handle_enabled_state {
  if [[ -z "$BLOCK_BUTTON" ]]; then
    show_notification
    lock_screen
    return
  fi

  case $BLOCK_BUTTON in 
    $no_click)
      # show notification if script is triggered using signal
      show_notification
      lock_screen
      ;;
    $left_click)
      # clear notification on left click
      response $hands_up $gray $yes $no
      ;;
    $right_click)
      # disable on right click
      response $hands_down $gray $no $no
      ;;
  esac
}

function handle_disabled_state {
  case $BLOCK_BUTTON in 
    $right_click)
      # enable on right click
      response $hands_up $gray $yes $no
      ;;
    *)
      # stay disabled for any other value
      response $hands_down $gray $no $no
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
