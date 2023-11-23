return {
  -- Outline UI,
  -- REVIEW: very much not sure if I'm going to keep this, evaluate later
  {
    "SmiteshP/nvim-navbuddy",
    dependencies = {
      -- "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim",
      "numToStr/Comment.nvim", -- Optional
      "nvim-telescope/telescope.nvim", -- Optional
    },
    keys = {
      { "<leader>cn", "<cmd>Navbuddy<cr>", desc = "Open navbuddy outline UI" },
    },
    opts = {
      lsp = {
        auto_attach = true,
      },
      window = {
        border = "single", -- "rounded", "double", "solid", "none"
        -- or an array with eight chars building up the border in a clockwise fashion
        -- starting with the top-left corner. eg: { "╔", "═" ,"╗", "║", "╝", "═", "╚", "║" }.
        size = { height = "95%", width = "75%" }, -- Or table format example: { height = "40%", width = "100%"}
        position = "50%", -- Or table format example: { row = "100%", col = "0%"}
        scrolloff = nil, -- scrolloff value within navbuddy window
        sections = {
          left = {
            size = "20%",
            border = nil, -- You can set border style for each section individually as well.
          },
          mid = {
            size = "40%",
            border = nil,
          },
          right = {
            -- No size option for right most section. It fills to
            -- remaining area.
            border = nil,
            preview = "leaf", -- Right section can show previews too.
            -- Options: "leaf", "always" or "never"
          },
        },
      },
    },
  },
}
