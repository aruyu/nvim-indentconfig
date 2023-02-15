## nvim-indentconfig

[![Lua](https://img.shields.io/badge/Lua-blue.svg?style=for-the-badge&logo=lua)](http://www.lua.org)
[![Neovim](https://img.shields.io/badge/Neovim-green.svg?style=for-the-badge&logo=neovim)](https://neovim.io)

### A simple config plugin for indent written by Lua Script

![ftplugin](https://user-images.githubusercontent.com/75081360/201606692-648c8dae-913e-4dcc-b1dd-fa7b0c0d4e10.png)

## Features

- Fix **set expandtab** that is caused by nvim's runtime ftplugin.
- Set 'expandtab' or 'noexpandtab' and also 'shiftwidth' to what you want in several ways.
  - Set the global indent settings and exclude the filetypes as much as you want.
  - The excluded filetypes could also change the config of 'shiftwidth'.
- Re-set the filetype by specific filename, e.g. *'\*.c'*, *'\*.js'* and so on.

## Required setting

**Lua:**

```lua
vim.cmd(' filetype plugin indent off ')
```

**Vim:**

```vim
filetype plugin indent off
```

or just DO NOT configure **filetype plugin indent** option.

## Installation

### [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  'astaos/nvim-indentconfig',
  config = function() require("nvim-indentconfig").setup() end,
}
```

### [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'astaos/nvim-indentconfig'
lua << EOF
  require("nvim-indentconfig").setup()
EOF
```

## Configuration

You can config the indent settings by the following options.

```lua
-- Default options.
require("nvim-indentconfig").setup({
  -- The global indent settings here.
  -- This option would set all the filetypes.
  default = {
    expandtab = true,
    size = 2
  },

  -- The exclusion indent settings here.
  -- This option would necessary specific filetypes.
  exclusions = {
    {
      expandtab = false,
      size = 8,
      filetype = { 'make','c','cpp' }
    },

    {
      expandtab = true,
      size = 4,
      filetype = { 'verilog' }
    },
  },

  -- The filetype settings by filename here.
  -- This option would re-set specific filetype by specific filename.
  ft_preset = {
    { filename = '*.h', filetype = 'c' },
  },
})
```
