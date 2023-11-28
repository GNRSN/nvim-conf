return {
  -- TODO:
  -- Doesn't show highlights in cmp, maybe I need a better cmp ui for it to?
  -- Doesn't highlight tw classnames until after one is edited
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("tailwindcss-colorizer-cmp").setup({
        color_square_width = 2,
      })

      require("cmp").config.formatting = {
        format = require("tailwindcss-colorizer-cmp").formatter,
      }
    end,
  },
}
