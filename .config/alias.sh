# ~/.config/alias.sh

# System management
# =================
    alias	mx="chmod +x" \
	    	src="source ~/.zprofile"

# Adding colors
# =============
    alias	grep="grep --color=auto" \
			fgrep="fgrep --color=auto" \
			egrep="egrep --color=auto" \
			ls="ls --color=auto"

# Application modifications
# ==========================

    # Aliases for saving a few key presses off ls commands
    alias	ls="ls --color=auto" \
			ll="ls -l" \
			la="ls -a" \
			llh="ls -lh" \
			lla="ls -la" \
			lah="ls -lah"

    # Application remapping
    alias	rename="perl-rename" \
	    	vi="nvim" \
			vim="nvim" \
			e="$EDITOR"

# Managing dotfiles
# =================

    # Funcions for dotfile version control
    dotf() { git --git-dir=$HOME/.dotfiles --work-tree=$HOME $@ }
    dota() { dotf add $@ }
    dots() { dotf status -uno }
    dotc() { dotf commit $@}
    dotb() { dotf  branch $@ }
    dotl() { dotf log --oneline }
    dotd() { dotf diff $@ }
    dotp() { dotf push --set-upstream origin master }

    # Aliases for easy dotfile modification
    alias   cfb="$EDITOR ~/.bashrc" \
            cfz="$EDITOR $ZDOTDIR/zshrc" \
            cfa="$EDITOR ~/.config/alias.sh" \
            cfp="$EDITOR ~/.profile" \
            cfv="$EDITOR ~/.config/nvim/init.vim"


# Lazy git functions [functions to allow for autocomplete support]
# ================================================================
    gc() { git commit -m $@ }
    gs() { git status }
    ga() { git add  $@ }
    gd() { git diff $@ }
    gr() { git remote $@ }
    gl() { git log --oneline }
    gp() { git push $@ }

# Other functions
# ===============
    # Search bash history
    hist() { history | grep $@ }

    # Cd into a directory followed by ls
    cs() { cd $1 && echo "$1" && ls }
