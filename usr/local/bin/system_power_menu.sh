#!/bin/env bash

options="restart\npower off"
choice=$(echo -e "$options" | rofi -dmenu -p "Select an action")

case $choice in
    "restart")
        systemctl reboot
        ;;
    "power off")
        systemctl poweroff
        ;;
    *)
        exit 1
        ;;
esac
