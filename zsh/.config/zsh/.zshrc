# ~/.config/zsh/.zshrc || $ZDOTDIR/.zshrc

# Use caching
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path $ZSH_CACHE_DIR

# History settings
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data

# Function loads and sources plugins localed in ~/.config/zsh/plugins
# @param Github username
# #param Github repo name
function loadPlugin {
    local LOCATION="${ZSH_PLUGIN:-$HOME/.config/zsh/plugins}/$2"

    [ ! -d "$LOCATION" ] && \
        git clone --depth=1 "https://github.com/$1/$2.git" "$LOCATION"
    [ -f "$LOCATION"/*.plugin.zsh ] && . $LOCATION/*.plugin.zsh &&
}

# If file exists source it
# @param path to file
function sourceFile {
    [ -f "$1" ] && . "$1"
}

loadPlugin zsh-users zsh-autosuggestions
loadPlugin zsh-users zsh-syntax-highlighting
loadPlugin MichaelAquilina zsh-you-should-use

sourceFile "$XDG_CONFIG_HOME/shell/aliases"
sourceFile "$XDG_CONFIG_HOME/shell/keybr.sh"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

eval "$(starship init zsh)"
