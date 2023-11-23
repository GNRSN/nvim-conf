return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    plugins = { spelling = true },
    triggers_blacklist = {
      n = { "v" },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    local keymaps = {
      mode = { "n", "v" },
      ["g"] = { name = "+goto" },
      ["]"] = { name = "+next" },
      ["["] = { name = "+prev" },
      ["<leader>"] = { name = "+Leader" },
      ["<leader>b"] = { name = "+Buffer" },
      ["<leader>c"] = { name = "+Code" },
      ["<leader>f"] = { name = "+File/find" },
      ["<leader>g"] = { name = "+Git" },
      ["<leader>h"] = { name = "+Harpoon" },
      ["<leader>s"] = { name = "+Search" },
      ["<leader>u"] = { name = "+Ui" },
      ["<leader>w"] = { name = "+Windows" },
      ["<leader>x"] = { name = "+Diagnostics/quickfix/todos" },
    }

    wk.register(keymaps)
  end,
}
