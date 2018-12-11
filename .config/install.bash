#! /bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null && pwd)"

$DIR/zsh/configure.bash
$DIR/vim/configure.bash
$DIR/tmux/configure.bash
$DIR/i3/configure.bash
$DIR/i3blocks/configure.bash
$DIR/rofi/configure.bash
$DIR/dunst/configure.bash
