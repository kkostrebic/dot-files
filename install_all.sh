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
# qutebrowser - keyboard-focused (vi) browser (webkit) with a minimal GUI
# entr - run arbitrary commands when files change  
# cups - Common UNIX Printing System
# sane - Scanner graphical frontends
# tidy - HTML/XML syntax checker and reformatter
# mdadm - tool to administer Linux MD arrays (software RAID)
# smartmontools - control and monitor storage systems using S.M.A.R.T.
# texlive-latex-base - A document preparation system
# tig - text-mode interface for Git
# samba - SMB/CIFS file, print, and login server for Unix
# cifs-utils - utilities for managing mounts of CIFS network file systems
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
  libmagickwand-dev \
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
  maim \
  tree \
  universal-ctags \
  entr \
  cups \
  sane \
  tidy \
  libxml2-utils \
  shellcheck \
  mdadm \
  smartmontools \
  texlive-latex-base \
  tig \
  samba \
  cifs-utils \
  apache2-utils \
  asciidoc 

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

# -------------------------------------------------------------------------------------------------------- #
# NOTE: i3 should be installed using their own debian repository (https://i3wm.org/docs/repositories.html) #
# -------------------------------------------------------------------------------------------------------- #

# Install AMD graphic card drivers (https://wiki.debian.org/AtiHowTo):
# - Add "contrib" and "non-free" components to /etc/apt/sources.list: 
# deb http://deb.debian.org/debian buster main contrib non-free
# - Update the list of available packages: 
# apt-get update
# - Install the firmware-linux-nonfree, libgl1-mesa-dri and xserver-xorg-video-ati:
# apt-get install firmware-linux-nonfree libgl1-mesa-dri xserver-xorg-video-ati

# Create ssh key
# ssh-keygen -t rsa -b 4096

# Install docker manually 
# TODO: Docker installation and setting up some base/standard containers should be in seperate bash script
# https://docs.docker.com/install/linux/docker-ce/debian/

# Install VirtualBox
# https://www.virtualbox.org/wiki/Downloads

# Build from source ruby:
# 1. Remove all ruby packages already installed:
# $ dpkg -l | grep ruby
# 2. Install ruby dependencies:
# $ sudo apt build-dep ruby2.5
# 3. Download ruby sources (https://www.ruby-lang.org/en/downloads/)
# 4. Build from sources:
# $ ./configure --prefix=/usr/local/stow/ruby-2.6.4
# $ make && make install
# 5. Switch the ruby versions (in case of several ones) using stow:
# $ sudo stow -D ruby-2.5.0 # unstow the current version
# $ sudo stow -R ruby-2.6.4 # stow the new one

# Install yarn
# https://yarnpkg.com/lang/en/docs/install/#debian-stable

# Install parcel globally
# yarn global add parcel-bundler
# add local packages autoprefixer, cssnano, sanitize.css, sass

# Install OpenResty from source (https://openresty.org/en/installation.html)
# Really useful link https://www.digitalocean.com/community/tutorials/how-to-use-the-openresty-web-framework-for-nginx-on-ubuntu-16-04
# Download source code tarball 
# Unpack tarball (i.e. tar xzvf openresty-VERSION.tar.gz)
# Configure with prefix to stow directory (i.e. ./configure -j2 --prefix=/usr/local/stow/openresty-VERSION)
# Make (i.e. make -j2)
# Install (i.e. sudo make install)
# Stow openresty (i.e. cd /usr/local/stow; sudo stow openresty-VERSION)
# Create systemd service file (from nginx example https://www.nginx.com/resources/wiki/start/topics/examples/systemd/)
# Enable new systemd service (i.e. sudo systemctl enable openresty.service) 
# Start systemd service (i.e. sudo systemctl start openresty.service)
# NOTE: initial configuration files are placed within nginx directory under openresty-VERSION stow directory
# NOTE: make sure pid file name and location from systemd service file is matched the one in nginx.conf (default logs/nginx.pid) - link to correct location also works
# NOTE: create sites-available and sites-enabled directories and include sites-enabled at the end of http block in nginx.conf (i.e. include /etc/nginx/sites-enabled/*)

# Install RVM for multiple users (production for supporting several projects running different ruby versions and gemsets on the same server)
# https://rvm.io/rvm/install
# sudo gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
# \curl -sSL https://get.rvm.io | sudo bash -s stable
# If the install script is run prefixed with sudo, RVM will automatically install into /usr/local/rvm

# Install python3 related stuff
# sudo apt install python python3
# sudo apt install python3-venv - virtual environments 
# Install pip (oackage manager for python):
# curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
# python get-pip.py
# put the scripts to the PATH (usually pip, wheel are install under /home/helmut/.local/bin)

# Install qutebrowser from source (with virtualenv)
# 1. https://qutebrowser.org/doc/install.html#tox
# 2. create wrapper executable script (also explained in step 1.)
# 3. link the script from step 2. to stow qutebrowser/bin folder

# Install rust lang
# https://www.rust-lang.org/tools/install

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
