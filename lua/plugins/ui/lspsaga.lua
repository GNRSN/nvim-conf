-- TODO: See if I stil want this or if some other UI is good enough
return {
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
          extend_gitsigns = true,
        },
        rename = {
          quit = "q",
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
      { "K", "<cmd>Lspsaga hover_doc<cr>" },
    },
  },
}
