return {
  -- I still think lsp saga provides better UI for code-actions and rename
  {
    "nvimdev/lspsaga.nvim",
    event = "BufRead",
    config = function()
      require("lspsaga").setup({
        lightbulb = {
          enable = false,
        },
        code_action = {
          show_server_name = true,
          extend_gitsigns = false,
          keys = {
            quit = { "q", "<esc>" },
            exec = { "<cr>", "<C-y>" },
          },
        },
        rename = {
          in_select = false,
          keys = {
            -- REVIEW: Can't map keybinds to modes, meaning esc to leave visual mode will close as well unless double mapped
            quit = { "q", "<esc><esc>" },
          },
        },
        ui = {
          title = false,
        },
        symbol_in_winbar = {
          enable = false,
        },
      })
    end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" },
    },
    keys = {
      -- { "K", "<cmd>Lspsaga hover_doc<cr>", desc = "Hover documentation" },
      { "<leader>ca", "<cmd>Lspsaga code_action<cr>", desc = "Code actions", mode = { "n", "v" } },
      -- { "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<cr>", desc = "Line diagnostics" },
      { "<leader>cr", "<cmd>Lspsaga rename<cr>", desc = "Rename variable" },
      -- { "<leader>ci", "<cmd>Lspsaga incomming_calls<cr>", desc = "Incomming calls" },
      -- { "<leader>co", "<cmd>Lspsaga outgoing_calls<cr>", desc = "Outgoing calls" },
    },
  },
}
