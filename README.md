# My customised kickstart.nvim

## Custom Additions

For usage on windows, the file `run_idle.bat` should exist to launch idle on the current buffer.

## Cloning this repo

### Linux

```sh
git clone https://github.com/s-0fia/nvim_config.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

### Mac

```sh
mkdir ~/.config/nvim && git clone https://github.com/s-0fia/nvim_config.git ~/.config/nvim
```

### Windows

Use this unless your need to clone to a specific directory

If you're using `powershell.exe`

```
git clone https://github.com/s-0fia/nvim_config.git $env:USERPROFILE\AppData\Local\nvim\
```

*Note*: For windows installation of nvim, `clang`/LLVM is the best compiler to make nvim work!
Powershell may need to be reinstalled from the msi from the Microsoft website if `pwsh.exe` is not found.

## If I get lost

[The Only Video You Need to Get Started with Neovim](https://youtu.be/m8C0Cq9Uv9o)
