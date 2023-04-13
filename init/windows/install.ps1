
# Install chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iwr https://community.chocolatey.org/install.ps1 -UseBasicParsing | iex

# Install fonts
choco install nerd-fonts-delugiamono-complete -y
choco install neovim --pre -y
choco install llvm

# Install software
winget install Mozilla.Firefox.DeveloperEdition
winget install Mozilla.Firefox.Beta

winget install Microsoft.PowerShell.Preview
winget install Microsoft.WindowsTerminal.Preview
winget install Starship.Starship
winget install Git.Git

mkdir C:\Dev\Repos
cd C:\Dev\Repos

New-Item -ItemType Junction -Path "$([Environment]::GetFolderPath("MyDocuments"))\PowerShell" -Target "C:\Dev\Repos\dotfiles\pwsh\Documents\PowerShell"
New-Item -ItemType Junction -Path "$HOME\AppData\Local\nvim" -Target "C:\Dev\Repos\dotfiles\nvim\.config\nvim"