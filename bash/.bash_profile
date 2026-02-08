# load any xresrouce settings on login:
if [ -e "$HOME/.Xresources" ]; then
    # echo "Not loading xresource file"
    xrdb -load "$HOME/.Xresources"
fi

export HISTCONTROL=ignoreboth:erasedups
export BROWSER="wslview"
export NVM_DIR="$HOME/.config/nvm"

export PATH="$PATH:$HOME/dev/go/bin:$NVM_DIR:$HOME/.config/emacs/bin"

# Attempting to npm install tree-sitter fails if this is not here
export CXXFLAGS="--std=c++20"
export EDITOR="nvim"
export GOPATH="${HOME}/dev/go"
export DOTFILES="${HOME}/dev/personal/dotfiles"

export NVM_COMPLETION="false"
export NVIM_CONFIG="${DOTFILES}/nvim/.config/nvim"

[ -s "$HOME/.bashrc" ] && source "$HOME/.bashrc"
