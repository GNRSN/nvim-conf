return {
  -- Status column
  -- TODO: Custom icon for spellcheck (cspell)
  {
    "luukvbaal/statuscol.nvim",
    config = function()
      local builtin = require("statuscol.builtin")
      require("statuscol").setup({
        setopt = true,
        relculright = true,
        segments = {
          {
            sign = {
              name = { "Diagnostic" },
              condition = { true },
              maxwidth = 2,
              auto = true,
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
              auto = true,
            },
            click = "v:lua.ScSa",
          },
        },
      })
    end,
  },
}
