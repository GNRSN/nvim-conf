@GNRSN Neovim config

VScode compatible,
when using with vscode nvim extension, only loads
- Subset options
- Keybinds
- vim.surround plugin

Plugins:
- Package manager is [lazy](https://github.com/folke/lazy.nvim)

Core: 
- 

Search:
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)

File management:
- [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)
- [windwp/nvim-spectre](): Search/replace in multiple files
  
Syntax highlighting
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

LSP:
- Mason

Git:
- [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim): Diff per line indicators + blame

Fluff:
- Dashboard: [dashboard-nvim](https://github.com/glepnir/dashboard-nvim)



[folke/neoconf.nvim](https://github.com/folke/neoconf.nvim): manage global and project-local settings.

[folke/neodev.nvim](https://github.com/folke/neodev.nvim)Neovim setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API.

[mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim): bridges mason.nvim with the lspconfig plugin - making it easier to use both plugins together.