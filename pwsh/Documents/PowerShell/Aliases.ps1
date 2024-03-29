$nvimconfig="$HOME\AppData\Local\nvim"

$env:NVIM_CONFIG=$nvimconfig

# Overrides
Set-Alias ls -Value lsd

# Mock xargs
filter xargs { & $args[0] ($args[1..$args.length] + $_) }

# Applciations shortcuts
function x {
  Invoke-Expression "$args" &
}

function sln {
  Start-Process $(Get-Item *.sln | Select-Object -ExpandProperty Name)
}

# Git helper functions
function gs { git status }
function ga { git add "$args" }
function gap { git add -p }
function gaa { git add --all }
function gco { git commit --verbose }
function gcm { git commit --verbose -m "$args" }
function gcall { git commit --verbose --all }
function gcoa { git commit --verbose --ammend "$args" }
function gcb { git checkout -b "$args" }
function gch { git checkout "$args[0]"; git pull }
function gf { git fetch }
function gpsh { git push }
function gpl { git pull }
function gssa { git stash save --all }
function gss { git stash save "$args" }
function gsl { git stash list }
function gsps { git stash push }
function gspo { git stash pop }

# Quickly edit common configuration files
function cfs { nvim "$HOME\.starship\starship.toml" }
function cfa { nvim "$([Environment]::GetFolderPath("MyDocuments"))\PowerShell\Aliases.ps1" }
function cfp { nvim "$([Environment]::GetFolderPath("MyDocuments"))\PowerShell\Private.ps1" }

function cdn { Set-Location $nvimconfig }
