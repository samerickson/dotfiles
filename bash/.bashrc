# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

test -s "$HOME/.zshenv" && \. "$HOME/.zshenv" || true

test -s ~/.config/shell/aliases && \. "$HOME/.config/shell/aliases" || true

eval "$(starship init bash)"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

