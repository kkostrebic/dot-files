#!/usr/bin/env bash

apt update

apt install --no-install-recommends -y \
  xserver-xorg \
  xinit \
  x11-xserver-utils \
  xterm \
  xdotool \
  xfonts-base \
  fonts-dejavu-core \
  fonts-font-awesome \
  i3-wm \
  i3status \
  i3lock \
  gsimplecal \
  dunst \
  rofi \
  maim \
  notify-osd \
  libnotify-bin \
  blueman \
  pavucontrol \
  slop \
  arandr \
  xclip

# xserver-xorg - x.org X server
# xinit - X server initialisation tool (xinit, startx)
# x11-xserver-utils - X server utilities
# xterm - X terminal emulator
# xdotool - fake keyboard/mouse input, window management, etc.
# xfonts-base - standard fonts for X
# fonts-dejavu-core - Vera font family derivate with additional characters
# fonts-font-awesome - iconic font (~249 various icon glyphs)
# i3-wm - dynamic tiling window manager
# i3status - status line for i3bar
# i3lock - screen locker
# gsimplecal - lightweight (GTK+) GUI calendar application
# dunst - configurable and lightweight notification-daemon (colored box with unformatted text)
# rofi - application laucher, window switcher, ssh launcher
# maim - takes screenshots of your desktop
# notify-osd - daemon that displays passive pop-up notifications
# libnotify-bin - library that sends desktop notifications to a notification daemon
# blueman - graphical (GTK+) bluetooth manager
# pavucontrol - PulseAudio volume controle (simple GTK+ based volume control tool)
# slop - application that queries for a selection from the user and prints the region to stdout
# arandr - ARandR is a visual front end for XRandR, which provides full control
#          over the relative positioning and rotation of monitors, as well as
#          saving and loading to/from shell scripts
# xclip - provides an interface to X selections ("the clipboard") from the
#         command line. It can read data from standard in or a file and place
#         it in an X selection for pasting into other X applications.
