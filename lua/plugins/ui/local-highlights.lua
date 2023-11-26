return {
  -- Regext based highlighting of only what is in view,
  -- claims to be faster than treesitter in large files
  -- REVIEW: Is it really as good as treesiter based though? e.g. highlighting doesn't work for words with hyphen
  -- maybe treesitter version could be more intelligent? I guess it's pretty good that it follows the same logic as w/e/b motions
  -- I think [https://github.com/RRethy/vim-illuminate] is the alternative, which uses ts textobjects, but is maybe less performant
  -- Actually, there's a bunch of them
  -- - https://github.com/yamatsum/nvim-cursorline
  -- - https://github.com/xiyaowong/nvim-cursorword
  -- - https://github.com/sontungexpt/stcursorword
  -- -
  {
    "tzachar/local-highlight.nvim",
    config = function()
      require("local-highlight").setup({
        hlgroup = "LocalHighlight",
        cw_hlgroup = "LocalHighlightCursorWord",
      })
    end,
  },
}
