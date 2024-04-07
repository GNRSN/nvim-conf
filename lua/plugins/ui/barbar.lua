return {
  -- nice looking tab-bar ui
  -- NOTE: I don't really like tabs but some situations require them, e.g. toggle between a diff-view and working view
  {
    {
      "romgrk/barbar.nvim",
      dependencies = {
        "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
        "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
      },
      init = function()
        vim.g.barbar_auto_setup = false
      end,
      config = function()
        require("barbar").setup({
          animation = true,
        })
      end,
    },
  },
}
