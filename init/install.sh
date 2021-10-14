#! /usr/bin/env bash

# Backup files that will get over written
# TODO: These files could be in a variety of places can be, I may want to try and detect this
# Should also verify that backp worked before overwriting files
mkdir -p "${HOME}/.backup-dotfiles"
[ -f "${HOME}/.profile" ] && cp "${HOME}/.profile" "${HOME}/backup-dotfiles/profile"
[ -f "${HOME}/.zprofile" ] && cp "${HOME}/.zprofile" "${HOME}/backup-dotfiles/zprofile"
[ -f "${HOME}/.bashrc" ] && cp "${HOME}/.bashrc" "${HOME}/backup-dotfiles/bashrc"
[ -f "${HOME}/.vim/vimrc" ] && cp "${HOME}/.vim/vimrc" "${HOME}/backup-dotfiles/vimrc"
[ -f "${HOME}/.tmux.conf" ] && cp "${HOME}/.tmux.conf" "${HOME}/backup-dotfiles/tmux.conf"
[ -f "${XDG_CONFIG_HOME:-$HOME/config}/zsh/.zshrc" ] && cp "${XDG_CONFIG_HOME:-$HOME/config}/zsh/.zshrc" "${HOME}/backup-dotfiles"
[ -f "${XDG_CONFIG_HOME:-$HOME/config}/wget/wgetrc" ] && cp "${XDG_CONFIG_HOME:-$HOME/config}/zsh/wgetrc" "${HOME}/backup-dotfiles"

# TODO: unpack dotfiles as symbolic links in the home directory
ln -sfv "${DOTFILES:-$HOME/.dotfiles}/src/profile" "${HOME}/.profile"
ln -sfv "${DOTFILES:-$HOME/.dotfiles}/src/profile" "${HOME}/.zprofile"
ln -sfv "${DOTFILES:-$HOME/.dotfiles}/src/bashrc" "${HOME}/.bashrc"
ln -sfv "${DOTFILES:-$HOME/.dotfiles}/src/vimrc" "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/init.vim"
ln -sfv "${DOTFILES:-$HOME/.dotfiles}/src/tmux.conf" "${HOME}/.tmux.conf"

mkdir -p "${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
mkdir -p "${XDG_CONFIG_HOME:-$HOME/.config}/wget"
mkdir -p "${XDG_CONFIG_HOME:-$HOME/.config}/shell"
mkdir -p "${HOME}/.local/bin"
ln -sfv "${DOTFILES:-$HOME/.dotfiles}/src/zshrc" "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/.zshrc"
ln -sfv "${DOTFILES:-$HOME/.dotfiles}/src/wgetrc" "${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
ln -sfv "${DOTFILES:-$HOME/.dotfiles}/src/aliases.sh" "${XDG_CONFIG_HOME:-$HOME/.config}/wget/aliases.sh"
