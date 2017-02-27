#!/bin/bash

cd $HOME/bin
echo 'bin'
git pull

cd $HOME/.dotfiles
echo 'dotfiles'
git pull

cd $HOME/.zprezto
echo 'prezto'
git pull && git submodule update --init --recursive

