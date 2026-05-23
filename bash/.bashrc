. "$HOME/.cargo/env"
eval "$(fnm env)"

# Do not execute past this point if not running interactively
case $- in
*i*) ;;
*) return ;;
esac

eval "$(starship init bash)"
eval "$(zoxide init bash)"
eval "$(fzf --bash)"

[ -s "$HOME/.config/shell/aliases" ] && source "$HOME/.config/shell/aliases"

# load any xresrouce settings on login:
if [ -e "$HOME/.Xresources" ]; then
    # echo "Not loading xresource file"
    xrdb -load "$HOME/.Xresources"
fi
