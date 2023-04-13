$ENV:STARSHIP_CONFIG = "$HOME\.starship\starship.toml"

Invoke-Expression (&starship init powershell)

$aliases="$([Environment]::GetFolderPath("MyDocuments"))\PowerShell\Aliases.ps1"
$private="$([Environment]::GetFolderPath("MyDocuments"))\PowerShell\Private.ps1"

if (Test-Path -Path $aliases) {
  . $aliases
}

if (Test-Path -Path $private) {
  . $private
}
