return {
  -- Adds vim gloabls to lua LSP for ~/.config/nvim
  -- More specifically:
  -- - Neovim config dir
  -- - Neovim runtime dir
  -- - Neovim plugin dir, defined as an LSP root folder with a /lua folder inside
  { "folke/neodev.nvim", opts = {} },
}
