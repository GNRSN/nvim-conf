return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local harpoon = require("harpoon")

    harpoon.setup({
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
    })

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>hm", require("harpoon.mark").add_file, { desc = "Harpoon mark" })
    keymap.set("n", "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", { desc = "Go to next harpoon mark" })
    keymap.set(
      "n",
      "<leader>hp",
      "<cmd>lua require('harpoon.ui').nav_prev()<cr>",
      { desc = "Go to previous harpoon mark" }
    )

    keymap.set("n", "<leader>hl", require("harpoon.ui").toggle_quick_menu, { desc = "Harpoon toggle list" })

    for i = 1, 9 do
      keymap.set("n", string.format("<leader>%s", i), function()
        require("harpoon.ui").nav_file(i)
      end, { desc = string.format("Navigate to harpoon (%s)", i) })
    end
  end,
}
