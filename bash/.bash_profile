export HISTCONTROL=ignoreboth:erasedups
export BROWSER="wslview"

export GOPATH="${HOME}/dev/go"
export BUN_INSTALL="$HOME/.bun"

# Attempting to npm install tree-sitter fails if this is not here
export CXXFLAGS="--std=c++20"
export EDITOR="nvim"
export DOTFILES="${HOME}/dev/personal/dotfiles"
export COLORTERM=truecolor

export PATH="$PATH:$HOME/dev/go/bin:$HOME/.config/emacs/bin:$BUN_INSTALL/bin"

[ -s "$HOME/.bashrc" ] && source "$HOME/.bashrc"
