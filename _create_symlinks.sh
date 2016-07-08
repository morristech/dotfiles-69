#!/bin/bash
set -e
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

fn_symlink() {
	local SOURCE="$1"
	local TARGET="$2"

	# Move target out of the way if it exists.
	# A bit messy but avoids having to manually
	# confirm everything, and safer than deleting.
	if [[ -f "$TARGET" || -d "$TARGET" ]]; then
		mv -f "$TARGET" "$TARGET.dotfile_bak"
	fi

	ln -fs "$SOURCE" "$TARGET" 
}

mkdir -p ~/.config

fn_symlink "$SCRIPT_DIR/.vim" ~/.vim
fn_symlink ~/.vim/vimrc ~/.vimrc
fn_symlink "$SCRIPT_DIR/.gitconfig" ~/.gitconfig 
fn_symlink "$SCRIPT_DIR/.config/terminator" ~/.config/terminator
