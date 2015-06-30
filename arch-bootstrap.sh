#!/bin/bash

# base
pacman -Sy --noconfirm \
       zsh \
       git \
       emacs \
       gnome-keyring \
       networkmanager \
       network-manager-applet \
       parcellite \
       binutils \
       make \
       patch \
       fakeroot \
       chromium \
       rxvt-unicode \
       dmenu \
       fluxbox \
       xterm \
       yajl \
       wget \
       firefox \
       vim \
       lxdm \
       clementine \
       gcc \
       deluge \
       python2 \
       python \
       gnucash \
       feh
       
# yaourt
cd /tmp

wget https://aur.archlinux.org/packages/pa/package-query/package-query.tar.gz
wget https://aur.archlinux.org/packages/ya/yaourt/yaourt.tar.gz

tar xzf package-query.tar.gz
tar xzf yaourt.tar.gz

cd package-query
makepkg -i

cd ../yaourt
makepkg -i

# aur
yaourt -S --noconfirm \
       kupfer \
       spotify \
       google-chrome \
       dropbox \
       btsync

# services
systemctl enable NetworkManager
systemctl start NetworkManager

# etc
cd /etc/fonts/conf.d
ln -s ../conf.avail/70-yes-bitmaps.conf
cd -
