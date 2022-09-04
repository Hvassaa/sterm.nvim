# sterm 

(s)tupid (term)inal. Toggle between showing and hiding a neovim terminal buffer.

## Installation

Using [packer.nvim](https://github.com/wbthomason/packer.nvim), add this to
your `use` section:

```lua
use 'Hvassaa/sterm.nvim'
```

## Quick start

Add a keymap to toggle the terminal, customize as needed:

```lua
vim.keymap.set({'t', 'n'}, "<F5>", require('sterm').toggle, { silent=true })
```

By default, sterm will make a vertical split to show the terminal. You can change
this by

```lua
require('sterm').setup({
	split_direction = "horizontal" -- vertical is default
})
```

## Showcase

![Sterm showcase](https://user-images.githubusercontent.com/19644160/188335145-f2afeadf-02e6-45ef-9a7c-511752c9c4d3.gif)
