-- Because : requires pressing shift on nordic keyboard layout
vim.api.nvim_create_user_command("Wa", function()
  vim.cmd.wa()
end, {})

vim.api.nvim_create_user_command("W", function()
  vim.cmd.W()
end, {})

vim.api.nvim_create_user_command("Qa", function()
  vim.cmd.qa()
end, {})

vim.api.nvim_create_user_command("Q", function()
  vim.cmd.q()
end, {})
