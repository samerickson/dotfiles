# Sam Erickson's Dotfiles

This repository is all of my configuration files.
I make use of stow to manage the symbolic links, and I try to create
scripts that can be used to install and configure things when a simple
symbolic link to a config file is insufficient.

## Dependencies

- `delta`: Used for git diff: [link](https://github.com/dandavison/delta)
- `bat`: A cat clone that supports syntax highlighting: [link](https://github.com/sharkdp/bat)
- `neovim`: Terminal editor of choice: [link](https://neovim.io/)
- `deluga-mono`: Nerd font of choice: [link](https://github.com/adam7/delugia-code)

## Windows Installation Notes

### Windows Terminal Settings

I typically create multiple profiles that change depending on individual use
cases, so I do not upload Windows terminal configuration files here, but I
always set the following appearance settings:

- **Font:** [Deluga mono](https://github.com/adam7/delugia-code)
    - Can be installed using [Chocolatey](https://chocolatey.org/install):
    `choco install nerd-fonts-delugiamono-complete`
    - Can be installed using [Scoop](https://scoop.sh/):
    `scoop install Deluga-Mono-Nerd-Font-Complete`
- **Color Scheme:** Default Campbell colors.
- **Font Size**: 11
- **Cursor Shape:** Empty box
- **Background Opacity:** 86%
- **Enable acrylic material:** False
- **Padding:** False

I typlically create a dedicated run as administrator profile as the third
profile so that I can use `Ctrl+shift+3` to open a tab as administrator.

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
