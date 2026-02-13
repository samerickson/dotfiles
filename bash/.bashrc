# Do not execute past this point if not running interactively
case $- in
*i*) ;;
*) return ;;
esac

eval "$(starship init bash)"
eval "$(zoxide init bash)"
eval "$(fzf --bash)"

[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"

[ -s "$HOME/.config/shell/aliases" ] && source "$HOME/.config/shell/aliases"
. "$HOME/.cargo/env"
