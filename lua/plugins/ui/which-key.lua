return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")
    wk.setup({
      triggers_blacklist = {
        -- n = { "v" },
        i = { "j", "k" },
        v = { "j", "k" },
      },
      window = {
        -- border = "shadow",
        winblend = vim.o.winblend,
      },
    })
    local keymaps = {
      mode = { "n", "v" },
      -- ["g"] = { name = "Goto" },
      -- ["]"] = { name = "Next" },
      -- ["["] = { name = "Prev" },
      ["<leader>"] = { name = "Leader" },
      ["<leader>a"] = { name = "Ai" },
      ["<leader>c"] = { name = "Code" },
      ["<leader>d"] = { name = "Debugger" },
      ["<leader>f"] = { name = "File/find" },
      ["<leader>g"] = { name = "Git" },
      ["<leader>h"] = { name = "Harpoon" },
      ["<leader>s"] = { name = "Search" },
      ["<leader>t"] = { name = "Testing" },
      ["<leader>u"] = { name = "Ui" },
      ["<leader>w"] = { name = "Windows" },
      ["<leader>x"] = { name = "Diagnostics/quickfix/todos" },
    }

    wk.register(keymaps)
  end,
}
