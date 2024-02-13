return {
  -- "Structural search and replace"
  -- Treesitter based S&R
  {
    "cshuaimin/ssr.nvim",
    keys = {
      {
        "<leader>S",
        function()
          require("ssr").open()
        end,
        desc = "(SSR) Structural search and replace",
        mode = { "n", "x" },
      },
    },
  },
}
