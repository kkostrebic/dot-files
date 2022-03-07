#!/usr/bin/env bash

apt update

apt install --no-install-recommends -y \
  dialog \
  build-essential \
  autoconf \
  dh-autoreconf \
  module-assistant \
  net-tools \
  network-manager \
  curl \
  wget \
  gnupg2 \
  subversion \
  rename \
  ffmpeg \
  tree \
  tig \
  stow \
  tmux \
  ripgrep \
  mc \
  apache2-utils \
  imagemagick \
  libmagickwand-dev \
  mdadm \
  smartmontools \
  samba \
  cifs-utils \
  cups \
  sane \
  htop \
  acpi

# dialog - displays user-friendly dialog boxes from shell scripts
# build-essential - Debian package development tools, GNU C++ compiler, GNU C compiler, GNU C development libraries and header files, make (utility for directing compilation)
# autoconf - automatic configure script builder
# dh-autoreconf - add-on to call autoreconf and clean up after the build
# module-assistant - Assistant for building kernel modules (important for VM Guest Additions), bzip2, xz-utils (compression utilities), perl 
# net-tools - tools for controlling the network subsystem of the linux kernel, arp, ifconfig, netstat, rarp, nameif, route, plipconfig, slattach, mii-tool, iptinnel, ipmaddr
# curl - cli tool for transferring data with URL syntax
# wget - utility to retrieve files from the web
# gnupg2 - tool to encrypt data to create digital signatures
# subversion - svn, version control system
# rename - tool (perl extension) for simple renaming multiple files
# ffmpeg - tools for transcoding, streaming and playing multimedia files (ffmpeg, ffplay, ffprobe, qt-faststart)
# tree - cli command that displays an indented directory tree
# tig - text-mode interface for Git
# stow - tool for managing the installation of multiple software packages in the same run-time directory tree
# tmux - terminal multiplexer
# ripgrep - recursively searches directories for a regex pattern
# mc - midnight commander - tui file manager
# imagemagick - image manipulation programs
# libmagickwand-dev - image manipulation library
# mdadm - tool to administer linux MD arrays (software RAID)
# smartmontools - control and monitor storage systems using S.M.A.R.T.
# samba - SMB/CIFS file, print, and login server for Unix
# cifs-utils - utilities for managing mounts of CIFS network file systems
# apache2-utils - utility programs for web servers
# network-manager - network management service that manages network devices and connections (ethernet, WiFi, mobile broadband, PPPoE devices, VPN)
# cups - Common UNIX Printing System
# sane - scanner graphical frontends
# htop - interactive processes viewer
# acpi - displays information on ACPI (Advanced Configuration and Power Interface) devices
