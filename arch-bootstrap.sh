#!/bin/bash -x

PACMAN="sudo pacman -Sy --noconfirm"
YAOURT="yaourt -Sy --noconfirm"
MAKEPKG="makepkg -i --noconfirm"

sudo pacman -Syu

cat $HOME/bin/base-pkgs.txt | xargs $PACMAN

# yaourt
cd /tmp

wget https://aur.archlinux.org/cgit/aur.git/snapshot/yaourt.tar.gz
wget https://aur.archlinux.org/cgit/aur.git/snapshot/package-query.tar.gz

tar xzf package-query.tar.gz
tar xzf yaourt.tar.gz

cd package-query
$MAKEPKG

cd ../yaourt
$MAKEPKG

cat $HOME/bin/aur-pkgs.txt | xargs $YAOURT

# etc
cd /etc/fonts/conf.d
ln -s ../conf.avail/70-yes-bitmaps.conf

