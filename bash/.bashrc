# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

[ -f "$HOME/.zshenv" ] && source "$HOME/.zshenv"
[ -f "$HOME/.config/shell/aliases" ] && source "$HOME/.config/shell/aliases"

eval "$(starship init bash)"

