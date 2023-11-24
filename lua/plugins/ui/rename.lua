return {
  -- Realtime preview during lsp rename
  -- TODO: Can integrate with UI, e.g. dressing.nvim, see github https://github.com/smjonas/inc-rename.nvim
  {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup()
    end,
    keys = {
      {
        "<leader>cr",
        function()
          return ":IncRename " .. vim.fn.expand("<cword>")
        end,
        expr = true,
        desc = "Rename variable",
      },
    },
  },
}
