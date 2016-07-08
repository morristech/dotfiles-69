#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir -p ~/.config

ln -s "$SCRIPT_DIR/.vim" ~/.vim 
ln -s ~/.vim/vimrc ~/.vimrc

ln -s "$SCRIPT_DIR/.gitconfig" ~/.gitconfig 
ln -s "$SCRIPT_DIR/.config/terminator" ~/.config/terminator