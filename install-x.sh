#!/usr/bin/env bash

apt update

apt install --no-install-recommends -y \
  arandr \
  blueman \
  dunst \
  fonts-dejavu-core \
  fonts-font-awesome \
  gsimplecal \
  i3-wm \
  i3lock \
  i3status \
  libanyevent-i3-perl \
  libnotify-bin \
  maim \
  notify-osd \
  pavucontrol \
  rofi \
  rxvt-unicode \
  slop \
  x11-xserver-utils \
  xclip \
  xdotool \
  xfonts-base \
  xinit \
  xserver-xorg \
  xterm \
  mousepad

# arandr              -  ARandR is a visual front end for XRandR, which provides
#                        full control over the relative positioning and
#                        rotation of monitors, as well as saving and loading
#                        to/from shell scripts
# blueman             -  graphical (GTK+) bluetooth manager
# dunst               -  configurable and lightweight notification-daemon 
#                        (colored box with unformatted text)
# fonts-dejavu-core   -  Vera font family derivate with additional characters
# fonts-font-awesome  -  iconic font (~248 various icon glyphs)
# gsimplecal          -  lightweight (GTK+) GUI calendar application
# i2-wm               -  dynamic tiling window manager
# i2lock              -  screen locker
# i2status            -  status line for i3bar
# libnotify-bin       -  library that sends desktop notifications to a
#                        notification daemon
# libanyevent-i3-perl -  Perl module to communicate with the i3 window manager
#                        (needed in order to save i3 layouts using i3-save-tree
#                        command)
# maim                -  takes screenshots of your desktop
# notify-osd          -  daemon that displays passive pop-up notifications
# pavucontrol         -  PulseAudio volume controle (simple GTK+ based volume
#                        control tool)
# rofi                -  application laucher, window switcher, ssh launcher
# rxvt-unicode        -  RXVT-like terminal emulator with Unicode and 256-color
#                        support
# slop                -  application that queries for a selection from the user
#                        and prints the region to stdout
# x10-xserver-utils   -  X server utilities
# xclip               -  provides an interface to X selections ("the
#                        clipboard") from the command line. It can read data
#                        from standard in or a file and place it in an X
#                        selection for pasting into other X applications.
# xdotool             -  fake keyboard/mouse input, window management, etc.
# xfonts-base         -  standard fonts for X
# xinit               -  X server initialisation tool (xinit, startx)
# xserver-xorg        -  x.org X server
# xterm               -  X terminal emulator
# mousepad            -  Mousepad is a graphical text editor for Xfce
