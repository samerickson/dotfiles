# Set application settings by env variable
export LSCOLORS="EHfxcxdxBxegecabagacad"
export LESSHISTFILE="-"
export TERM="xterm-256color"
export PATH="$PATH:/usr/local/bin/:$HOME/.dotfiles/bin:$HOME/.local/share/bin"

# If neovim is installed, use it
[ -z $(command -v nvim) ] && export EDITOR=vim || export EDITOR=nvim

# Check if reboot is required
check_restart.sh
