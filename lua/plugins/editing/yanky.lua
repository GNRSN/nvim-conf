return {
  -- Better yanking with history, ctrl p/n to replace with previous yank after putting
  {
    "gbprod/yanky.nvim",
    opts = {
      -- TODO: Make yank/put colors a bit more subtle?
      -- Also, does cut work?
    },
    keys = {
      -- Basic usage
      { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Yanky put (after)" },
      { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Yanky put (before)" },
      { "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" }, desc = "Yanky G-put (after)" },
      { "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" }, desc = "Yanky G-put (before)" },
      { "<c-p>", "<Plug>(YankyPreviousEntry)", desc = "Yanky previous entry" },
      { "<c-n>", "<Plug>(YankyNextEntry)", desc = "Yanky next entry" },
      -- Tpope/vim-unimpaired 'esque usage
      { "]p", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Yanky put indent after linewise" },
      { "[p", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Yanky put indent before linewise" },
      { "]P", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Yanky put indent after linewise" },
      { "[P", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Yanky put indent before linewise" },

      { ">p", "<Plug>(YankyPutIndentAfterShiftRight)", desc = "Yanky put indent after linewise" },
      { "<p", "<Plug>(YankyPutIndentAfterShiftLeft)", desc = "Yanky put indent after linewise" },
      { ">P", "<Plug>(YankyPutIndentBeforeShiftRight)", desc = "Yanky put indent after linewise" },
      { "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)", desc = "Yanky put indent after linewise" },

      { "=p", "<Plug>(YankyPutAfterFilter)", desc = "Yanky put indent after linewise" },
      { "=P", "<Plug>(YankyPutBeforeFilter)", desc = "Yanky put indent after linewise" },
    },
  },
}
