# Do not execute past this point if not running interactively
case $- in
*i*) ;;
*) return ;;
esac

eval "$(starship init bash)"
eval "$(zoxide init bash)"
eval "$(fzf --bash)"

[ -s "$HOME/.config/shell/aliases" ] && source "$HOME/.config/shell/aliases"
. "$HOME/.cargo/env"

# load any xresrouce settings on login:
if [ -e "$HOME/.Xresources" ]; then
    # echo "Not loading xresource file"
    xrdb -load "$HOME/.Xresources"
fi

# fnm
FNM_PATH="/home/samerickson/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
    export PATH="$FNM_PATH:$PATH"
    eval "$(fnm env)"
fi
