# Set config variables that should be set any time zsh is being used
export GOPATH="${HOME}/dev/go"
export DOTFILES=${HOME}/.dotfiles
export GITHUB="${HOME}/dev/github"
export PATH="$PATH:/usr/local/bin/:$DOTFILES/bin:$GOPATH/bin"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export ZSH_PLUGINS="${ZDOTDIR:-$HOME/.config/zsh}/plugins"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/history"
export NVM_DIR="$HOME/.config/nvm"
