export HISTCONTROL=ignoreboth:erasedups

export BROWSER="wslview"
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Attempting to npm install tree-sitter fails if this is not here
export CXXFLAGS="--std=c++20"


[ -f "$HOME/.zshenv" ] && source "$HOME/.zshenv"

# eval "$(fnm env --use-on-cd)"
. "$HOME/.cargo/env"

# Do not execute past this point if not running interactively
case $- in
*i*) ;;
*) return ;;
esac

eval "$(starship init bash)"
eval "$(zoxide init bash)"

[ -f "$HOME/.config/shell/aliases" ] && source "$HOME/.config/shell/aliases"

# load any xresrouce settings on login:
if [ -e "$HOME/.Xresources" ]; then
  # echo "Not loading xresource file"
  xrdb -load "$HOME/.Xresources"
fi

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
