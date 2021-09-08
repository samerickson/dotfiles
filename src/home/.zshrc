# ~/.zshrc

source ~/.aliases

# oh-my-zsh Settings:
# ===================

# Path to your oh-my-zsh installation.
export ZSH="/home/$USER/.oh-my-zsh"

# Load in custom plugins if there are not present already
[ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ] && \
    git clone \
        https://github.com/zsh-users/zsh-autosuggestions \
        ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

[ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ] && \
    git clone \
    https://github.com/zsh-users/zsh-syntax-highlighting.git \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

#ZSH_THEME="aussiegeek"
ZSH_THEME="flazz"

# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(git tmux zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
