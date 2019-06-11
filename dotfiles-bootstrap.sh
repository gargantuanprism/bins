#!/bin/zsh

cd $HOME

# Dotfiles
git clone https://github.com/0xANDREW/dotfiles.git .dotfiles

DOT=$HOME/.dotfiles

#ln -sf $DOT/fluxbox .fluxbox
ln -sf $DOT/i3 .config/i3
ln -sf $DOT/polybar .config/polybar
ln -sf $DOT/tmuxinator .tmuxinator
#ln -sf $DOT/xmonad .xmonad
#ln -sf $DOT/emacs .emacs
#ln -sf $DOT/i3blocks.conf .i3blocks.conf
#ln -sf $DOT/i3status.conf .i3status.conf
ln -sf $DOT/profile .profile
ln -sf $DOT/tmux.conf .tmux.conf
ln -sf $DOT/vimrc .vimrc
ln -sf $DOT/Xresources .Xresources

# Need this for Arch?!
#ln -sf $DOT/Xresources .Xdefaults

# Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# Base16
git clone https://github.com/chriskempson/base16-shell.git \
  ~/.config/base16-shell

# Prezto
#git clone --recursive https://github.com/0xandrew/prezto.git \
#  "${ZDOTDIR:-$HOME}/.zprezto"
#
#setopt EXTENDED_GLOB
#for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
#  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
#done

