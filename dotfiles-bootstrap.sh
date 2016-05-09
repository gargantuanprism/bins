#!/bin/zsh

SRCS=(.tmux.conf \
  .tmuxinator \
  .fluxbox \
  .Xdefaults \
  .vimrc \
  .vim \
  .config/i3/.config \
  .i3blocks.conf \
  )
DOT=$HOME/.dotfiles

cd $HOME

for src in $SRCS; do
  ln -sf $DOT/$src $HOME/$src
done

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
