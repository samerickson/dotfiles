. "$HOME/.cargo/env"
eval "$(fnm env)"
#
# Do not execute past this point if not running interactively
case $- in
*i*) ;;
*) return ;;
esac

eval "$(starship init bash)"
eval "$(zoxide init bash)"
# eval "$(fzf --bash)"
[ -s /usr/share/fzf/shell/key-bindings.bash ] && source /usr/share/fzf/shell/key-bindings.bash

[ -s "$HOME/.config/shell/aliases" ] && source "$HOME/.config/shell/aliases"
