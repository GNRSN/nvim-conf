return {
  -- Tab bar ui
  {
    "nanozuki/tabby.nvim",
    event = "VimEnter",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      -- DOC: At default, neovim only display tabline when there are at least two tab pages.
      -- If you want always display tabline:
      vim.o.showtabline = 2
    end,
  },
}
