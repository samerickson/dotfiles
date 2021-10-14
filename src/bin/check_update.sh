#!/usr/bin/env bash

# Check dotfiles repository for updates

cd "${DOTFILESDIR:-$HOME/.dotfiles}"
git pull
