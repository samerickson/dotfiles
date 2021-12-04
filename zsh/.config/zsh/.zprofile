# Set application settings by env variable
export LSCOLORS="EHfxcxdxBxegecabagacad"
export LESSHISTFILE="-"
export TERM="xterm-256color"

# If neovim is installed, use it
[ -z $(command -v nvim) ] && export EDITOR=vim || export EDITOR=nvim
