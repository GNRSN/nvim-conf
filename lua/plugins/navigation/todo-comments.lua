local palette = require("colorscheme.palette")

return {
  -- todo comments as "bookmarks" + jump between them
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      keywords = {
        -- TODO: Set colors
        REVIEW = { icon = " ", color = "review" },
        PERF = { icon = " ", color = "perf" },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        TODO = { icon = " ", color = "info" },
      },
      merge_keywords = false,
      colors = {
        review = { palette.comment },
        perf = { palette.yellow },
        hint = { palette.blue },
        info = { palette.white },
      },
    },
    -- stylua: ignore
    keys = {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
      { "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
      { "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
      { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
    },
  },
}
