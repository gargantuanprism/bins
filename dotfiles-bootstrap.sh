#!/bin/zsh -x

DOT=$HOME/.dotfiles

ln -s $DOT/.tmux.conf $HOME/.tmux.conf
ln -s $DOT/.tmuxinator $HOME/.tmuxinator
ln -s $DOT/.xmonad $HOME/.xmonad
ln -s $DOT/.emacs.d $HOME/.emacs.d
ln -s $DOT/.emacs $HOME/.emacs
ln -s $DOT/.fluxbox $HOME/.fluxbox
ln -s $DOT/mc $HOME/.config/mc
ln -s $DOT/.Xdefaults $HOME/.Xdefaults

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
