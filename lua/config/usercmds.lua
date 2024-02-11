local add_cmd = function(name, command, opts)
  vim.api.nvim_create_user_command(name, command, opts or {})
end

-- Scandi keyboard layout compensation

-- Because : requires pressing shift on nordic keyboard layout
add_cmd("Wa", function()
  vim.cmd.wa()
end)

add_cmd("W", function()
  vim.cmd.W()
end)

add_cmd("Qa", function()
  vim.cmd.qa()
end)

add_cmd("Q", function()
  vim.cmd.q()
end)

-- Reload

-- Suggested in https://www.reddit.com/r/neovim/comments/16e0l4o/how_to_hot_reload_highlightsscm_in_nvimtreesitter/
add_cmd("TSReload", function()
  local bufnr = vim.api.nvim_get_current_buf()
  require("vim.treesitter.highlighter").active[bufnr]:destroy()
end)
