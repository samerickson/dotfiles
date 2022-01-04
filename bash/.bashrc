# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
#   i.e. if you are using bash to run a script, do not load this file
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Source alias file if it exists
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliases" ] || \
    source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliases}"

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# TODO: Add information on this code block
RESET="$(tput sgr0)"
CYAN="$(tput setaf 6)"
BLUE="$(tput setaf 4)"
GREEN="$(tput setaf 2)"
GREY="$(tput setaf 244)"
RED="$(tput setaf 1)"
MAGENTA="$(tput setaf 5)"
YELLOW="$(tput setaf 3)"
BOLD="$(tput bold)"

# Display git branch and status in bash PS1
git_prompt() {
  BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/*\(.*\)/\1/')

  if [ -n "$BRANCH" ]; then
    echo -n "$YELLOW$BRANCH"

    STATUS=$(git status --short 2> /dev/null)

    if [ -n "$STATUS" ]; then
      echo " ${RED}✗"
    fi
  fi
}

# Set BASH prompt
PS1='\[$WHITE\]\h \[$BOLD$MAGENTA\]:: \[$RESET$CYAN\w`git_prompt`\] \[$GREEN\]$ \[$RESET\]'

# Work around for switching default shell on schools development server
exec zsh

# If cargo is installed source it
if [ -x $(command -v cargo) ]; then
    . "$HOME/.cargo/env"
fi

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
