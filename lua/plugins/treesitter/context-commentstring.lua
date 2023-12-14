return {
  -- Uses treesitter to determine comment type, useful for distingusihing between JS and JSX
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("ts_context_commentstring").setup({
        -- Disable default functionality,
        -- our commenting plugin has a pre-comment hook which will trigger the determination
        enable_autocmd = false,
      })
    end,
  },
}
