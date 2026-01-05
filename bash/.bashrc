export HISTCONTROL=ignoreboth:erasedups

export BROWSER="wslview"
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

export PATH="$PATH:/dev/go/bin$NVM_DIR"

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
