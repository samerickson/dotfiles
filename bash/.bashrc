FNM_PATH="/home/samerickson/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "$(fnm env)"
fi

export BROWSER="wslview"

[ -f "$HOME/.zshenv" ] && source "$HOME/.zshenv"

eval "$(fnm env --use-on-cd)"
. "$HOME/.cargo/env"

# Do not go past this point if not running interactively
case $- in
*i*) ;;
*) return ;;
esac

eval "$(zoxide init bash)"
eval "$(starship init bash)"

[ -f "$HOME/.config/shell/aliases" ] && source "$HOME/.config/shell/aliases"

# load any xresrouce settings on login:
if [ -e "$HOME/.Xresources" ]; then
  # echo "Not loading xresource file"
  xrdb -load "$HOME/.Xresources"
fi
