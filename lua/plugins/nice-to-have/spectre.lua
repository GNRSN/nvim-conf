return {
  -- Search and replace panel
  -- NOTE: Default requires ripgrep and sed installed
  {
    "nvim-pack/nvim-spectre",
    keys = {
      {
        "<leader>r",
        function()
          require("spectre").toggle()
        end,
        desc = "Spectre",
      },
      -- REVIEW: Can add more keymaps for eg search for current selection in visual mode
    },
    config = true,
  },
}
