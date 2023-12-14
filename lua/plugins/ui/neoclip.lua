return {
  -- Clipboard manager, seems cool @see https://github.com/AckslD/nvim-neoclip.lua
  -- REVIEW: Do I want to keep/use this?
  -- TODO: Didn't work? Maybe because of yanky?
  -- {
  --   "AckslD/nvim-neoclip.lua",
  --   dependencies = {
  --     { "nvim-telescope/telescope.nvim" },
  --     { "kkharji/sqlite.lua", module = "sqlite" },
  --   },
  --   config = function()
  --     require("neoclip").setup({})
  --
  --     require("telescope").load_extension("neoclip")
  --   end,
  --   keys = {
  --     { "<leader>sp", "<cmd>Telescope neoclip<cr>", desc = "Neoclip" },
  --   },
  -- },
}
