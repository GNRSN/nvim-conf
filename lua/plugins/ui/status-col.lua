return {
  -- Status column
  -- TODO: Custom icon for spellcheck (cspell)
  {
    "luukvbaal/statuscol.nvim",
    config = function()
      require("statuscol").setup({
        setopt = true,
      })
    end,
  },
}
