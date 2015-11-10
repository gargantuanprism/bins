#!/bin/bash

# base
sudo pacman -Sy --noconfirm \
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
       feh \
       vim \
       wpa_supplicant \
       dialog \
       gnome-themes-standard \
       gnome-themes-extra \
       lxappearance \
       dmenu \
       base-devel \
       i3-wm \
       i3status \
       openssh \
       tk \
       python2 \
       python2-pip \
       tmux \
       xdotool \
       xorg-xkill \
       xorg-xrandr
       
# yaourt
cd /tmp

wget https://aur.archlinux.org/cgit/aur.git/snapshot/yaourt.tar.gz
wget https://aur.archlinux.org/cgit/aur.git/snapshot/package-query.tar.gz

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

# etc
cd /etc/fonts/conf.d
ln -s ../conf.avail/70-yes-bitmaps.conf
cd -

