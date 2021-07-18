# ~/.zshrc

source ~/.aliases

# oh-my-zsh Settings:
# ===================

# Path to your oh-my-zsh installation.
export ZSH="/home/erickssb/.oh-my-zsh"

ZSH_THEME="robbyrussell"
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(git tmux)

source $ZSH/oh-my-zsh.sh
