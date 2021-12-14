#!/usr/bin/env sh

# Instructions from official neovim wiki incase this script becomes outdated
#	https://github.com/neovim/neovim/wiki/Installing-Neovim

# Install Dependencies
#	https://github.com/neovim/neovim/wiki/Building-Neovim#build-prerequisites
apt install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen

# Download repository and install
git clone https://github.com/neovim/neovim "${GITHUB:-$XDG_CACHE_HOME}/neovim"
cd "${GITHUB:-$XDG_CACHE_HOME}/neovim" && make install

# Install minimalistic package manager
git clone --depth=1 https://github.com/savq/paq-nvim.git \
    "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/paqs/start/paq-nvim
