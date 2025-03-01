# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# fnm
FNM_PATH="/home/samerickson/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "$(fnm env)"
fi

[ -f "$HOME/.zshenv" ] && source "$HOME/.zshenv"
[ -f "$HOME/.config/shell/aliases" ] && source "$HOME/.config/shell/aliases"

eval "$(starship init bash)"
eval "$(fnm env --use-on-cd)"
eval "$(zoxide init bash)"
. "$HOME/.cargo/env"
