# ~/.aliases.sh

# Windows machine aliases
# =======================
    # Go to Windows directories
    alias   win="cd /mnt/c/Users/erick" \
            wind="cd /mnt/f/Downloads" \
            winf="cd /mnt/f" \
            wind="cd /mnt/d" \
            winc="cd /mnt/c" \
            open="wslview" \
            chrome="/mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe" \
            ic="/mnt/c/Users/erick/iCloudDrive" \
            ob="/mnt/c/Users/erick/iCloudDrive/iCloud~md~obsidian/Obsidian"

# System management
# =================
    # TODO: change source file depending on which shell is being used
    alias   mx="chmod +x" \
            src="source ~/.zshrc" \
            delswap="trash ~/.local/share/nvim/swap/*; echo 'Cleaned up nvim swap files'"

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
    alias   cfb="vim ~/.bashrc" \
            cfa="vim ~/.dotfiles/aliases.sh" \
            cfz="vim ~/.zshrc" \
            cfp="vim ~/.profile" \
            cfv="vim ~/.vimrc" \
            cfs="vim ~/.ssh/config"

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
