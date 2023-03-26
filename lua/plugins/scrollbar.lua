return {
  {
    "petertriho/nvim-scrollbar",
    opts = {
      hide_if_all_visible = true,
      set_highlights = false,
      excluded_buftypes = {
        "terminal",
      },
      excluded_filetypes = {
        "prompt",
        "TelescopePrompt",
        "noice",
      },
      handlers = {
        cursor = true,
        diagnostic = true,
        gitsigns = true, -- Requires gitsigns
        handle = true,
        search = false, -- Requires hlslens
        ale = false,   -- Requires ALE
      },
    },
  }
}
