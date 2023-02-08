# Mock xargs
filter xargs { & $args[0] ($args[1..$args.length] + $_) }

# Applciations shortcuts
function x {
  Invoke-Expression "$args" &
}

# Git helper functions
function gs { git status }
function ga { git add "$args" }
function gaa { git add --all }
function gco { git commit --verbose "$args" }
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
function cfa { nvim "$([Environment]::GetFolderPath("MyDocuments"))\PowerShell\Aliases.ps1" }
function cfp { nvim "$([Environment]::GetFolderPath("MyDocuments"))\PowerShell\Microsoft.PowerShell_profile.ps1" }

function cdn { Set-Location "$HOME\AppData\Local\nvim" }
