#!/usr/bin/env bash

FOCUSED_WINDOW_ID=$(xdotool getwindowfocus)

WIDS=$(xdotool search --onlyvisible --class "Chrome")
for id in $WIDS; do
  xdotool windowfocus --sync $id && xdotool key F5
done

xdotool windowactivate --sync $FOCUSED_WINDOW_ID
