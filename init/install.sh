#! /usr/bin/env bash

# Backup files that will get over written
# TODO: These files could be in a variety of places can be, I may want to try and detect this
mkdir -p "${HOME}/.backup-dotfiles"
[ -f "${HOME}/.profile" ] && cp "${HOME}/.profile"
[ -f "${HOME}/.zprofile" ] && cp "${HOME}/.zprofile"
[ -f "${HOME}/.bashrc" ] && cp "${HOME}/.bashrc"
[ -f "${HOME}/.vim/vimrc" ] && cp "${HOME}/.vim/vimrc"
[ -f "${HOME}/.tmux.conf" ] && cp "${HOME}/.tmux.conf"
[ -f "${HOME}/." ] && cp "${HOME}/.profile"
[ -f "${XDG_CONFIG_HOME:-$HOME/config}/zsh/.zshrc" ] && cp "${XDG_CONFIG_HOME:-$HOME/config}/zsh/.zshrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/config}/wget/wgetrc" ] && cp "${XDG_CONFIG_HOME:-$HOME/config}/zsh/.zshrc"

# TODO: unpack dotfiles as symbolic links in the home directory
ln -sfv "${DOTFILES:-$HOME/.dotfiles}/src/profile" "${HOME}/.profile"
ln -sfv "${DOTFILES:-$HOME/.dotfiles}/src/profile" "${HOME}/.zprofile"
ln -sfv "${DOTFILES:-$HOME/.dotfiles}/src/bashrc" "${HOME}/.bashrc"
ln -sfv "${DOTFILES:-$HOME/.dotfiles}/src/vimrc" "${HOME}/.vim/vimrc"
ln -sfv "${DOTFILES:-$HOME/.dotfiles}/src/tmux.conf" "${HOME}/.tmux.conf"

mkdir -p "${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
mkdir -p "${XDG_CONFIG_HOME:-$HOME/.config}/wget"
ln -sfv "${DOTFILES:-$HOME/.dotfiles}/src/zshrc" "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/.zshrc"
ln -sfv "${DOTFILES:-$HOME/.dotfiles}/src/wgetrc" "${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
