export EDITOR="nvim"
export DOTFILES="$HOME/dev/personal/dotfiles/"
export PATH=$PATH:/usr/local/go/bin
export NVM_DIR="$HOME/.nvm"

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

test -s ~/.config/shell/aliases && . ~/.config/shell/aliases || true

eval "$(starship init bash)"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

