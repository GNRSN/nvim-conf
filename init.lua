if vim.g.vscode then
  -- VSCode extension
  require("vscode")
else
  -- ordinary Neovim
  -- bootstrap lazy-loader
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)

  -- Hide virtual text
  vim.diagnostic.config({
    virtual_text = false,
  })

  require("colorscheme").setup({
    transparent_bg = true,
  })
  require("colorscheme").load()

  -- use lazy-loader
  require("lazy").setup({
    {
      import = "plugins",
    },
    {
      import = "plugins.lsp",
    },
    {
      import = "plugins.treesitter",
    },
    {
      import = "plugins.ui",
    },
    {
      import = "plugins.navigation",
    },
    {
      import = "plugins.editing",
    },
    {
      import = "plugins.ai",
    },
    {
      -- options for lazy can go here, check out what's available later
    },
  })
  require("config").setup()

  if vim.g.neovide then
    require("neovide")
  end
end
