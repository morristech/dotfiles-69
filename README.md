# Basic installation

	git clone https://github.com/laurent22/dotfiles ~/dotfiles
	~/dotfiles/_create_symlinks.sh
	~/dotfiles/_apt_install.sh

	echo "" >> ~/.bashrc
	echo "source ~/dotfiles/.bashrc_global" >> ~/.bashrc

# Sublime Text

* Install https://www.sublimetext.com/
* Install https://packagecontrol.io/installation
* Restart Sublime Text 3

# tmux

	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	tmux source ~/.tmux.conf

Then open tmux and run PREFIX + I to fetch the plugins.

# vim

	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall

https://github.com/VundleVim/Vundle.vim
