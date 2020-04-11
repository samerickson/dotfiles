update:
	cp ~/.tmux.conf .
	cp ~/.bashrc .
	cp ~/.profile .
	cp ~/.zprofile .
	cp ~/.zshrc .
	mkdir .config
	cp -r ~/.config/nvim .config/
	cp ~/.config/alias.sh .config/
