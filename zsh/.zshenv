# Set config variables that should be set any time zsh is being used

export EDITOR="nvim"

export GOPATH="${HOME}/dev/go"
export DOTFILES="${HOME}/dev/personal/dotfiles"
export NVIM_CONFIG="${DOTFILES}/nvim/.config/nvim"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export ZSH_PLUGINS="${ZDOTDIR:-$HOME/.config/zsh}/plugins"
export ZSH_CACHE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/history"
export NVM_DIR="$HOME/.config/nvm"

export PATH="$PATH:${HOME}/.cargo/bin:${HOME}/dev/go/bin:/usr/local/go/bin:${HOME}/.local/bin:/snap/bin"
source "$HOME/.cargo/env"
. "$HOME/.cargo/env"
