# Sam Erickson's Dotfiles

This repository is all of my configuration files.
I make use of stow to manage the symbolic links, and I try to create
scripts that can be used to install and configure things when a simple
symbolic link to a config file is not sufficient.

## Windows Installation Notes

### Adding Symbolic links

To add a symbolic link to a file you can use the following command:

```pwsh
New-Item -ItemType SymbolicLink -Path "C:\LINK" -Target "C:\SOURCE"
```

To add a symbolic link to a directory, you can use the following command:

```pwsh
New-Item -ItemType Junction -Path "C:\LINK" -Target "C:\SOURCE"
```

### Dependencies

#### Paq

[Paq](https://github.com/savq/paq-nvim) can be installed using the following command:

```bash
git clone https://github.com/savq/paq-nvim.git "$env:LOCALAPPDATA\nvim-data\site\pack\paqs\start\paq-nvim"
```

#### Tree Sitter

[Tree Sitter](https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support)
requires a C compiler. You can install one by using the following command (provided
[Chocolatey](https://chocolatey.org/install) is installed):

```bash
choco install mingw
```
