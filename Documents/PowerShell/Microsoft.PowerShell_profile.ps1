$ENV:STARSHIP_CONFIG = "$HOME\.starship\starship.toml"

Invoke-Expression (&starship init powershell)

function pv() {
    explorer.exe .
}

function cfp() {
  nvim "C:\Users\erick\OneDrive\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
}

function cdd() {
  Set-Location C:\Dev
}

function cdr() {
  Set-Location C:\Dev\Repos
}

function cdc() {
    Set-Location C:\Dev\Repos\dotfiles
}

function cfn() {
  nvim "C:\Users\erick\AppData\Local\nvim\init.lua"
}

function cdn() {
  Set-Location "C:\Users\erick\AppData\Local\nvim"
}

# Git aliases
function gs() { git status -s }
function ga() { git add }
