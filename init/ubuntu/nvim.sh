#!/usr/bin/env sh

# Install neoivm
apt install nvim

# Install package manager
git clone --depth=1 https://github.com/savq/paq-nvim.git \
    "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/paqs/start/paq-nvim
