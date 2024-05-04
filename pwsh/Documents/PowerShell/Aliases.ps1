$nvimconfig="$HOME\AppData\Local\nvim"

$env:NVIM_CONFIG=$nvimconfig

# Overrides
Set-Alias ls -Value _ls

function _ls {
  eza --icons --group-directories-first $args
}

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
function ga { git add $args }
function gco { git commit --verbose $args }
function gcm { git commit --verbose -m $args }
function gcoa { git commit --verbose --amend $args }

# Quickly edit common configuration files
function cfs { nvim "$HOME\.starship\starship.toml" }
function cfa { nvim "$([Environment]::GetFolderPath("MyDocuments"))\PowerShell\Aliases.ps1" }
function cfp { nvim "$([Environment]::GetFolderPath("MyDocuments"))\PowerShell\Private.ps1" }

function cdn { Set-Location $nvimconfig }
