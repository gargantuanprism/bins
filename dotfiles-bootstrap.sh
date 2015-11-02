#!/bin/zsh -x

SRCS=(.tmux.conf .tmuxinator .xmonad .emacs.d .emacs .fluxbox .Xdefaults \
  .vimrc)

cd $HOME

for src in $SRCS; do
  ln -s $src &> /dev/null
done

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}" &> /dev/null
done
