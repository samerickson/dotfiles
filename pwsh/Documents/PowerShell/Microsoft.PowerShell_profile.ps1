$ENV:STARSHIP_CONFIG = "$HOME\.starship\starship.toml"

Invoke-Expression (&starship init powershell)

. "$([Environment]::GetFolderPath("MyDocuments"))\PowerShell\Aliases.ps1"
. "$([Environment]::GetFolderPath("MyDocuments"))\PowerShell\Private.ps1"
