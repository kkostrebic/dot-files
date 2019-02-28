#!/usr/bin/env bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null && pwd)"

$DIR/zsh/configure.sh
$DIR/vim/configure.sh
$DIR/tmux/configure.sh
$DIR/i3/configure.sh
$DIR/i3blocks/configure.sh
$DIR/rofi/configure.sh
$DIR/dunst/configure.sh
$DIR/xterm/configure.sh
$DIR/ctags/configure.sh
