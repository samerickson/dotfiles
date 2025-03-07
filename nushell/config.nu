# config.nu
#
# Installed by:
# version = "0.101.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.

$env.config.shell_integration.osc133 = false
$env.config.buffer_editor = 'nvim'
$env.config.show_banner = false

alias cdc = cd $env.DOTFILES
alias cdn = cd $'($env.DOTFILES)/nvim/.config/nvim'
alias cdr = cd $env.REPOS
alias cdg = cd $env.GITHUB
alias github = cd $env.GITHUB
alias ls = eza
alias lg = lazygit

source ~/.cache/zoxide/init.nu
# source ~/.cache/starship/init.nu

fnm env --json | from json | load-env
$env.path = $env.path | append $env.FNM_MULTISHELL_PATH
