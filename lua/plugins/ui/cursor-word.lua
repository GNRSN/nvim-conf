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
  -- REVIEW: After comparing to vscode, this isn't at all comparable
  -- I cant find settings for whatever vscode is doing but I notice the folowing:
  -- - Different bg color for indicating differnt behavior
  -- - Some LSP integration, e.g. having the cursor on the word "function" i.e. ´fun*ction myFunc ()´
  --   highlights the word myFunc since lsp actions, e.g. rename, will trigger on that word
  -- - Cursor on a div tag in jsx highlights the matching tag, not all div tags
  -- LATER: Disabled for now until a find a better option
  -- {
  --   "tzachar/local-highlight.nvim",
  --   config = function()
  --     require("local-highlight").setup({
  --       hlgroup = "LocalHighlight",
  --       cw_hlgroup = "LocalHighlightCursorWord",
  --     })
  --   end,
  -- },
  {
    "RRethy/vim-illuminate",
    config = function()
      require("illuminate").configure({
        -- providers: provider used to get references in the buffer, ordered by priority
        providers = {
          "lsp",
          "treesitter",
          "regex",
        },
        -- delay: delay in milliseconds
        delay = 200,
        -- filetype_overrides: filetype specific overrides.
        -- The keys are strings to represent the filetype while the values are tables that
        -- supports the same keys passed to .configure except for filetypes_denylist and filetypes_allowlist
        filetype_overrides = {},
        -- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
        filetypes_denylist = {
          "dirbuf",
          "dirvish",
          "fugitive",
          "prompt",
          "Prompt",
          "float",
          "Float",
          "Harpoon",
          "harpoon",
        },
        -- filetypes_allowlist: filetypes to illuminate, this is overridden by filetypes_denylist
        -- You must set filetypes_denylist = {} to override the defaults to allow filetypes_allowlist to take effect
        filetypes_allowlist = {},
        -- modes_denylist: modes to not illuminate, this overrides modes_allowlist
        -- See `:help mode()` for possible values
        modes_denylist = {
          "i",
        },
        -- modes_allowlist: modes to illuminate, this is overridden by modes_denylist
        -- See `:help mode()` for possible values
        modes_allowlist = {},
        -- providers_regex_syntax_denylist: syntax to not illuminate, this overrides providers_regex_syntax_allowlist
        -- Only applies to the 'regex' provider
        -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
        providers_regex_syntax_denylist = {},
        -- providers_regex_syntax_allowlist: syntax to illuminate, this is overridden by providers_regex_syntax_denylist
        -- Only applies to the 'regex' provider
        -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
        providers_regex_syntax_allowlist = {},
        -- under_cursor: whether or not to illuminate under the cursor
        under_cursor = true,
        -- large_file_cutoff: number of lines at which to use large_file_config
        -- The `under_cursor` option is disabled when this cutoff is hit
        large_file_cutoff = nil,
        -- large_file_config: config to use for large files (based on large_file_cutoff).
        -- Supports the same keys passed to .configure
        -- If nil, vim-illuminate will be disabled for large files.
        large_file_overrides = nil,
        -- min_count_to_highlight: minimum number of matches required to perform highlighting
        min_count_to_highlight = 1,
        -- should_enable: a callback that overrides all other settings to
        -- enable/disable illumination. This will be called a lot so don't do
        -- anything expensive in it.
        should_enable = function(bufnr)
          return true
        end,
        -- case_insensitive_regex: sets regex case sensitivity
        case_insensitive_regex = false,
      })
    end,
  },
}
