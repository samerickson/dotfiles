 # ~/.bashrc

HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s checkwinsize

# WSL settings to allow for X11 forwarding to windows
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
export LIBGL_ALWAYS_INDIRECT=1

export PS1="\[\e[0;33m\]\t \[\e[0;32m\]\h \[\e[0;36m\]\w \[\033[00m\]$ "

# Load system aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

PATH="$HOME/.local/bin:$PATH"

export MOVIES_DIR=/mnt/d/movies
export PUBLIC_DIR=/home/erickssb/github/movies-project/client/public
