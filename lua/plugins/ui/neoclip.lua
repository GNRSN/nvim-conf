return {
  -- Clipboard manager, seems cool @see https://github.com/AckslD/nvim-neoclip.lua
  -- REVIEW: Do I want to keep/use this?
  {
    "AckslD/nvim-neoclip.lua",
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
    },
    config = function()
      require("neoclip").setup()
    end,
  },
}
