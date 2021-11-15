# ~/.aliases.sh

# System management
# =================
    # TODO: change source file depending on which shell is being used
    alias   mx="chmod +x" \
            src="source ${ZDOTDIR:-$HOME}/.zshrc" \
            delswap="trash ~/.local/share/nvim/swap/*; echo 'Cleaned up nvim swap files'" \
            cu="check_update.sh"

# Adding colors
# =============
    alias   grep="grep --color=auto" \
            fgrep="fgrep --color=auto" \
            egrep="egrep --color=auto" \
            ls="ls --color=auto"

# Directory Navigation
# ====================
    alias   cdb="cd ~/.local/bin" \
            cdv="cd ~/.config/vim" \
            cfh="cd ~" \
            cdd="cd ~/.dotfiles"

# Frequent Files
# ==============
    alias   cfb="${EDITOR:-vim} ~/.bashrc" \
            cfa="${EDITOR:-vim} ~/.dotfiles/src/aliases.sh" \
            cfz="${EDITOR:-vim} ~/.config/zsh/.zshrc" \
            cfp="${EDITOR:-vim} ~/.profile" \
            cfv="${EDITOR:-vim} ~/.vim/vimrc" \
            cfs="${EDITOR:-vim} ~/.ssh/config"

# Misc
# ====
    alias   gs="gss"

# Functions
# =========

# Show most frequently used commands
#   Taken from:
#       https://github.com/trimstray/the-book-of-secret-knowledge#tool-terminal
histdata() {
    history | \
    awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | \
    grep -v "./" | \
    column -c3 -s " " -t | \
    sort -nr | nl |  head -n 20
}

# Backup file
back() { cp $1{,.backup}; }

# Cd into a directory then list its contents
cs() { cd "$1" && ls; }

# Create a directory and cd into it
mds() { mkdir "$1" && cd "$1"; }
