#!/usr/bin/env bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null && pwd)"
cd $DIR

git clone https://github.com/vivien/i3blocks
cd i3blocks
./autogen.sh
./configure --prefix=/usr/local/stow/i3blocks
make
sudo make install

cd $DIR
rm -rf i3blocks
cd /usr/local/stow
sudo stow i3blocks
