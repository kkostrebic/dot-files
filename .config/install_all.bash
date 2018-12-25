#! /bin/bash

apt update

apt install -y build-essential \
               net-tools \
               wireless-tools \
               imagemagick \
               subversion \
               git \

# ripgrep (NOTE: from 18.10 available through standard packaging)
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep_0.10.0_amd64.deb
sudo dpkg -i ripgrep_0.10.0_amd64.deb

# RVM
gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable

./i3/install.bash

# i3lock - screen locker
# xdotool - fake keyboard/mouse input, window management, etc.
# clipit - clipboard manager
# mupdf - micro pdf reader
# wkhtmltopdf - html to pdf
apt install -y i3lock \
               x11-xserver-utils \
               network-manager \
               network-manager-gnome \
               xdotool \
               clipit \
               mupdf \
               xfonts-base \
               fonts-dejavu-core \
               fonts-font-awesome \
               autoconf \
               notify-osd \
               firefox \
               thunderbird \
               libreoffice \
               virtualbox \
               gimp \
               vlc \
               wkhtmltopdf \


# slack
# wireshark

# Online tools:
# draw.io
# gitignore.io
