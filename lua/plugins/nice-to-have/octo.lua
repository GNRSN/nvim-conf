return {
  -- UI for github cli, supported by cheatsheets
  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("octo").setup({
        picker = "fzf-lua",
        picker_config = {
          use_emojis = true,
        },
      })
    end,
  },
}
