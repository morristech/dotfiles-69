	git clone https://github.com/laurent22/dotfiles ~/dotfiles
	~/dotfiles/_create_symlinks.sh
	~/dotfiles/_apt_install.sh

	echo "" >> ~/.bashrc
	echo "source ~/dotfiles/.bashrc_global" >> ~/.bashrc
