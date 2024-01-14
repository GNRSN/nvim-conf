return {
  -- Nvim integration with test runner
  -- TODO: Support mocha through https://github.com/nvim-neotest/neotest-vim-test
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
        status = {
          enabled = true,
          signs = true,
          virtual_text = true,
        },
        output_panel = {
          enabled = true,
          open = "botright vsplit | vertical resize 50",
        },
      })
    end,
    keys = {
      {
        "<leader>tr",
        function()
          require("neotest").run.run()
        end,
        desc = "Run nearest test",
      },
      {
        "<leader>tw",
        function()
          require("neotest").watch.toggle(vim.fn.expand("%"))
        end,
        desc = "Watch nearest position",
      },
      {
        "<leader>tW",
        function()
          require("neotest").watch.toggle(vim.fn.expand("%"))
        end,
        desc = "Watch file",
      },
      {
        "<leader>tf",
        function()
          require("neotest").run.run(vim.fn.expand("%"))
        end,
        desc = "Run current file",
      },
      {
        "<leader>td",
        function()
          ---@diagnostic disable-next-line: missing-fields
          require("neotest").run.run({ strategy = "dap" })
        end,
        desc = "Run nearest test (DAP)",
      },
      {
        "<leader>tx",
        function()
          require("neotest").run.stop()
        end,
        desc = "Stop current test",
      },
      {
        "<leader>ta",
        function()
          require("neotest").run.attach()
        end,
        desc = "Attach to nearest test",
      },
      {
        "<leader>to",
        function()
          require("neotest").output_panel.toggle()
        end,
        desc = "Output panel (toggle)",
      },
      {
        "<leader>ts",
        function()
          require("neotest").summary.toggle()
        end,
        desc = "Summary panel (toggle)",
      },
      {
        "<leader>tc",
        function()
          require("neotest").output_panel.clear()
        end,
        desc = "Clear output",
      },
    },
  },
}
