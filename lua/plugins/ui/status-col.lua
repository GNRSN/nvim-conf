return {
  -- Status column
  -- TODO: Icons are not prioritized, hint may hide error
  -- LATER: Custom icon for spellcheck (cspell)
  {
    "luukvbaal/statuscol.nvim",
    config = function()
      local builtin = require("statuscol.builtin")
      require("statuscol").setup({
        setopt = true,
        -- Prevent cursor line number being left adjusted (default behavior with relative line numbers)
        relculright = true,
        ft_ignore = {
          "neo-tree",
        },
        segments = {
          {
            sign = {
              name = {
                "DiagnosticSignError",
                "DiagnosticSignWarn",
                "DiagnosticSignInfo",
                -- REVIEW: I've had cases where errors are covered by typos, can't find how to ensure correct prioritization
                -- this is a workaround for now
                --
                -- "DiagnosticSignHint",
              },
              condition = { true },
              maxwidth = 1,
              auto = false,
              fillchar = " ",
            },
            click = "v:lua.ScSa",
          },
          {
            -- line number
            text = { builtin.lnumfunc, " " },
            condition = { true, builtin.not_empty },
            click = "v:lua.ScLa",
          },
          {
            -- REVIEW: Do not know what this does, folds?
            text = { "%C" },
            click = "v:lua.ScFa",
          },
          {
            -- git sign + diagnostic
            -- text = { "%s" },
            sign = {
              namespace = { "gitsign*" },
              condition = { true },
              auto = false,
            },
            click = "v:lua.ScSa",
          },
        },
      })
    end,
  },
}
