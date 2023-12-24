return {
  {
    "uga-rosa/ccc.nvim",
    config = function()
      -- Enable true color
      vim.opt.termguicolors = true

      local ccc = require("ccc")

      ccc.setup({
        highlighter = {
          auto_enable = true,
          lsp = true,
        },
        mapping = {
          -- TODO: This doesn't apply
          ["<esc>"] = function()
            ccc.mapping.quit()
          end,
        },
        inputs = {
          ccc.input.hsl,
          ccc.input.rgb,
        },
      })
    end,
    event = { "BufReadPre", "BufNewFile" },
    keys = {
      { "<leader>cp", "<cmd>CccPick<cr>", desc = "Open color picker" },
    },
  },
}
