# ~/.bash_aliases

# Windows machine aliases
# =======================
    # Go to Windows directories
    alias   win="cd /mnt/c/Users/erick" \
            wind="cd /mnt/f/Downloads" \
            winf="cd /mnt/f" \
            wind="cd /mnt/d" \
            winc="cd /mnt/c" \
            open="wslview" \
            chrome="/mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe"

# System management
# =================
    alias   mx="chmod +x" \
            src="source ~/.bashrc" \
            delswap="trash ~/.local/share/nvim/swap/*; echo 'Cleaned up nvim swap files'"

# Adding colors
# =============
    alias   grep="grep --color=auto" \
            fgrep="fgrep --color=auto" \
            egrep="egrep --color=auto" \
            ls="ls --color=auto"

# Directory Navigation
# ====================
    alias   cdb="cd ~/.local/bin"\
            cdv="cd ~/.config/vim"

# Application modifications
# ==========================

    # Alias for modifying application launches
    alias   vi="nvim" \
            vim="nvim" \
            e="nvim"

    # Aliases for saving a few key presses off ls commands
    alias   ls="ls --color=auto" \
            ll="ls -l" \
            la="ls -a" \
            llh="ls -lh" \
            lla="ls -la" \
            lah="ls -lah"

    # Aliases for easy dotfile modification
    alias   cfb="vim ~/.bashrc" \
            cfa="vim ~/.bash_aliases" \
            cfp="vim ~/.profile" \
            cfv="vim ~/.vim/vimrc" \
            cfs="vim ~/.ssh/config"

# Git aliases
# ===========
    alias   gs="git status" \
            ga="git add" \
            gc="git commit -m" \
            gp="git push"
