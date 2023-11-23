local palette = require("colorscheme.palette")

return {
  -- todo comments as "bookmarks" + jump between them
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      keywords = {
        REVIEW = { icon = " ", color = "review" },
        PERF = { icon = " ", color = "perf" },
        NOTE = { icon = " ", color = "note", alt = { "INFO" } },
        TODO = { icon = "  ", color = "todo" },
      },
      merge_keywords = false,
      colors = {
        review = { palette.comment },
        perf = { palette.purple },
        note = { palette.white },
        todo = { palette.yellow_sunflower },
      },
    },
    -- stylua: ignore
    keys = {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
      { "<leader>xt", "<cmd>TodoTrouble keywords=TODO<cr>", desc = "Todo(s) (Trouble)" },
      { "<leader>xr", "<cmd>TodoTrouble keywords=REVIEW,PERF<cr>", desc = "Review & Perf (Trouble)" },
      { "<leader>ft", "<cmd>TodoTelescope keywords=TODO<cr>", desc = "Todo" },
    },
  },
}
