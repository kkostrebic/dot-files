#!/usr/bin/env bash

sudo apt update

# i3lock - screen locker
# xdotool - fake keyboard/mouse input, window management, etc.
# mupdf - micro pdf reader
# wkhtmltopdf - html to pdf
# feh - image viewer
# pavucontrol - pulse audio volume control
# blueman - bluetooth gui manager
# mc - midnight commander - tui file manager
# thunar - gui file manager from xfce
# stow - tool for managing the installation of multiple software packages in the same run-time directory tree
# orage - calendar app
# slop - slop (Select Operation) is an application that queries for a selection from the user and prints the region to stdout
# maim - maim (make image) takes screenshots of your desktop. It has options to take only a region, and relies on slop to query for regions
sudo apt install -y \
  build-essential \
  module-assistant \
  net-tools \
  golang \
  xinit \
  iw \
  wireless-tools \
  bluetooth \
  bluez \
  bluez-tools \
  rfkill \
  imagemagick \
  subversion \
  git \
  curl \
  wget \
  gnupg2 \
  rename \
  dh-autoreconf \
  default-jdk \
  ffmpeg \
  i3 \
  xterm \
  libnotify-bin \
  dunst \
  rofi \
  tmux \
  vim-gtk3 \
  i3lock \
  stow \
  ripgrep \
  xserver-xorg \
  x11-xserver-utils \
  pavucontrol \
  network-manager \
  blueman \
  xdotool \
  feh \
  mupdf \
  xfonts-base \
  fonts-dejavu-core \
  fonts-font-awesome \
  autoconf \
  notify-osd \
  thunderbird \
  libreoffice \
  gimp \
  vlc \
  wkhtmltopdf \
  mc \
  thunar \
  orage \
  slop \
  maim

sudo m-a prepare

# ripgrep (NOTE: from 18.10 or debian/buster available through standard packaging)
# curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep_0.10.0_amd64.deb
# sudo dpkg -i ripgrep_0.10.0_amd64.deb

# RVM
gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable

# NVM
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

./i3blocks/install.sh
./zsh/install.sh


# -------
# libvips - fast and less memory hungry library (than imagemagick) for image processing (https://jcupitt.github.io/libvips/install.html)
# -------

# slack
# wireshark
# clipit - clipboard manager
# network-manager-gnome 
# wicd - network gui manager

# Online tools:
# draw.io
# gitignore.io
