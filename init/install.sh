#! /usr/bin/env bash

# TODO: unpack dotfiles as symbolic links in the home directory
ln -sfv "${DOTFILES:-$HOME/.dotfiles}/src/profile" "${HOME}/.profile"
ln -sfv "${DOTFILES:-$HOME/.dotfiles}/src/profile" "${HOME}/.zprofile"
ln -sfv "${DOTFILES:-$HOME/.dotfiles}/src/bashrc" "${HOME}/.bashrc"
ln -sfv "${DOTFILES:-$HOME/.dotfiles}/src/vimrc" "${HOME}/.vim/vimrc"
ln -sfv "${DOTFILES:-$HOME/.dotfiles}/src/tmux.conf" "${HOME}/.tmux.conf"

mkdir -p "${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
mkdir -p "${XDG_CONFIG_HOME:-$HOME/.config}/wget"
ln -sfv "${DOTFILES:-$HOME/.dotfiles}/src/zshrc" "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/.profile"
ln -sfv "${DOTFILES:-$HOME/.dotfiles}/src/wgetrc" "${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
