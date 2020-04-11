# ~/.profile

# SHELL
# =====
	export LSCOLORS="EHfxcxdxBxegecabagacad"
	umask 022

# APPLICATIONS
# ============
	export EDITOR="nvim"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
	PATH="$HOME/.local/bin:$PATH"
fi
