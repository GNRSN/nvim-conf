return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      -- Adapters
      "marilari88/neotest-vitest",
    },
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("neotest").setup({

        adapters = {
          require("neotest-vitest"),
          -- require("neotest-python")({
          --   dap = { justMyCode = false },
          -- }),
          -- require("neotest-plenary"),
          -- require("neotest-vim-test")({
          --   ignore_file_types = { "python", "vim", "lua" },
          -- }),
        },
      })
    end,
  },
}
