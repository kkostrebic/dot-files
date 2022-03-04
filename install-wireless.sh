#!/usr/bin/env bash

sudo apt update

sudo apt install --no-install-recommends -y \
  iw \
  bluez \
  bluez-tools \
  bluetooth \
  rfkill

# iw - cli tool for configuration and information about wireless devices (should be installed by default)
# bluez - bluetooth tools and daemons
# bluez-tools - cli tools to manage bluetooth devices
# bluetooth - additional plugins for bluez bluetooth stack
# rfkill - tool for enabling and disabling wireless devices (wlan, bluetooth, mobile broadband)

