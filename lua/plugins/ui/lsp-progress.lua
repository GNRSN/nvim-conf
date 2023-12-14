return {
  -- Progressbar for LSP status, works with lualine
  {
    "linrongbin16/lsp-progress.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lsp-progress").setup({})
    end,
  },
}
