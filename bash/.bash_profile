export HISTCONTROL=ignoreboth:erasedups

if [ -n "$WSL_DISTRO_NAME" ]; then
    export BROWSER='/mnt/c/Windows/firefox.exe'
else
    export BROWSER='firefox'
fi


export GOPATH="${HOME}/dev/go"
export BUN_INSTALL="$HOME/.bun"

# Attempting to npm install tree-sitter fails if this is not here
export CXXFLAGS="--std=c++20"
export EDITOR="nvim"
export DOTFILES="${HOME}/.dotfiles"
export COLORTERM=truecolor

export PATH="$PATH:/usr/local/bin:$HOME/dev/go/bin:$HOME/.config/emacs/bin:$BUN_INSTALL/bin:/home/samerickson/.local/share/fnm:$HOME/.local/bin"

[ -s "$HOME/.bashrc" ] && source "$HOME/.bashrc"
