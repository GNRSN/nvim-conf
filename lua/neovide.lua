local config = {
  transparency = false,
}

local palette = require("colorscheme.palette")

if not vim.g.neovide then
  error("Neovide customization initilized but neovide env is not present")
end

-- set font
vim.o.guifont = "Hack_Nerd_Font:h13"
vim.o.pumblend = 30
vim.o.winblend = 15

-- set animations
vim.g.neovide_cursor_animate_in_insert_mode = false
vim.g.neovide_cursor_vfx_mode = "pixiedust"

-- set styling
-- Helper function for transparency formatting
local get_alpha = function()
  return string.format("%x", math.floor((255 * vim.g.transparency) or 0.8))
end
-- DOCS: g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
if config.transparency then
  vim.g.neovide_transparency = 0.0
  vim.g.transparency = 0.8
  vim.g.neovide_background_color = "#000000" .. get_alpha() -- colors.bg .. get_alpha()
  vim.g.neovide_floating_blur_amount_x = 4.0
  vim.g.neovide_floating_blur_amount_y = 4.0
else
  vim.g.neovide_background_color = palette.bg
  -- set bg for "normal"
  vim.api.nvim_set_hl(0, "Normal", { bg = palette.bg })
end

-- set scaling and add keymaps for updating
vim.g.neovide_scale_factor = 0.9
local change_scale_factor = function(delta)
  local resulting_scale = vim.g.neovide_scale_factor * delta
  vim.g.neovide_scale_factor = resulting_scale
  vim.notify("UI Scaling: " .. resulting_scale * 100 .. "%")
end
vim.keymap.set("n", "<D-+>", function()
  change_scale_factor(1.05)
end)
vim.keymap.set("n", "<D-->", function()
  change_scale_factor(1 / 1.05)
end)

-- setup copy paste to clipboard with cmd+c
vim.g.neovide_input_use_logo = 1 -- enable use of the logo (cmd) key
-- vim.keymap.set("n", "<D-s>", ":w<CR>") -- Save
vim.keymap.set("v", "<D-c>", "\"+y") -- Copy
vim.keymap.set("n", "<D-v>", "\"+P") -- Paste normal mode
vim.keymap.set("v", "<D-v>", "\"+P") -- Paste visual mode
vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
vim.keymap.set("i", "<D-v>", "<ESC>l\"+Pli") -- Paste insert mode

-- Allow clipboard copy paste in neovim
vim.g.neovide_input_use_logo = 1
vim.api.nvim_set_keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })
