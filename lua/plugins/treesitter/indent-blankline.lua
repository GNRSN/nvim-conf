return {
  -- Draw indentation lines
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      -- TODO: I'm not super happy with the colors, they´re too much
      local highlight = {
        -- This order mimics vs-code
        "RainbowDelimiterYellowMuted",
        "RainbowDelimiterVioletMuted",
        "RainbowDelimiterBlueMuted",
      }

      require("ibl").setup({
        indent = {
          highlight = highlight,
        },
      })
    end,
  },
}
