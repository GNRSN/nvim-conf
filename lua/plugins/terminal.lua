return {
    {
      'akinsho/toggleterm.nvim',
      version = "*",
      opts = {
        open_mapping = [[<leader>tc]],
        hide_numbers = true,
        size = function(term)
          if term.direction == "horizontal" then
            return 15
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
          end
        end,
      },
  }
}