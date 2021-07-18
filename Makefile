update:
	cp ~/.tmux.conf .
	cp ~/.bashrc .
	cp ~/.profile .
	[ -d ~/.config ] || mkdir .config
	cp ~/.vim/vimrc .
	cp ~/.aliases .
	cp ~/.zshrc .
	cp ~/.zprofile .
