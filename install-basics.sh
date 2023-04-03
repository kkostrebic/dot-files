#!/usr/bin/env bash

apt update

apt install --no-install-recommends -y \
  acpi \
  apache2-utils \
  autoconf \
  build-essential \
  cifs-utils \
  cups \
  curl \
  dh-autoreconf \
  dialog \
  ffmpeg \
  gnupg2 \
  gphotofs \
  htop \
  imagemagick \
  libimage-exiftool-perl \
  libmagickwand-dev \
  mc \
  mdadm \
  module-assistant \
  net-tools \
  network-manager \
  pulseaudio \
  rename \
  ripgrep \
  rsync \
  samba \
  sane \
  smartmontools \
  stow \
  subversion \
  tig \
  tmux \
  tree \
  unzip \
  wget \

# acpi - displays information on ACPI (Advanced Configuration and Power Interface) devices
# apache2-utils - utility programs for web servers
# autoconf - automatic configure script builder
# build-essential - Debian package development tools, GNU C++ compiler, GNU C compiler, GNU C development libraries and header files, make (utility for directing compilation)
# cifs-utils - utilities for managing mounts of CIFS network file systems
# cups - Common UNIX Printing System
# curl - cli tool for transferring data with URL syntax
# dh-autoreconf - add-on to call autoreconf and clean up after the build
# dialog - displays user-friendly dialog boxes from shell scripts
# ffmpeg - tools for transcoding, streaming and playing multimedia files (ffmpeg, ffplay, ffprobe, qt-faststart)
# gnupg2 - tool to encrypt data to create digital signatures
# gphotofs - filesystem to mount digital cameras
# htop - interactive processes viewer
# imagemagick - image manipulation programs
# libimage-exiftool-perl - library and program to read and write meta information in multimedia files
# libmagickwand-dev - image manipulation library
# mc - midnight commander - tui file manager
# mdadm - tool to administer linux MD arrays (software RAID)
# module-assistant - Assistant for building kernel modules (important for VM Guest Additions), bzip2, xz-utils (compression utilities), perl 
# net-tools - tools for controlling the network subsystem of the linux kernel, arp, ifconfig, netstat, rarp, nameif, route, plipconfig, slattach, mii-tool, iptinnel, ipmaddr
# network-manager - network management service that manages network devices and connections (ethernet, WiFi, mobile broadband, PPPoE devices, VPN)
# rename - tool (perl extension) for simple renaming multiple files
# ripgrep - recursively searches directories for a regex pattern
# rsync - fast, versatile, remote (and local) file-copying tool
# samba - SMB/CIFS file, print, and login server for Unix
# sane - scanner graphical frontends
# smartmontools - control and monitor storage systems using S.M.A.R.T.
# stow - tool for managing the installation of multiple software packages in the same run-time directory tree
# subversion - svn, version control system
# tig - text-mode interface for Git
# tmux - terminal multiplexer
# tree - cli command that displays an indented directory tree
# unzip - De-archiver for .zip files
# wget - utility to retrieve files from the web
