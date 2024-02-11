return {
  -- UI for listing options for e.g. lsp find references
  {
    "dnlhc/glance.nvim",
    config = function()
      local glance = require("glance")
      local actions = glance.actions

      ---@diagnostic disable-next-line: missing-fields
      require("glance").setup({
        border = {
          enable = true,
        },
        ---@diagnostic disable-next-line: missing-fields
        mappings = {
          list = {
            -- ["j"] = false,
            -- ["k"] = false,
            ["<C-n>"] = actions.next_location,
            ["<C-p>"] = actions.previous_location,
          },
        },
      })
    end,
  },
}
