
-- bootstrap lazy-loader
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

if vim.g.vscode then
	-- VSCode extension
	print("vim.g.vscode env present, avoids loading plugins")
else
	-- ordinary Neovim

	require("codex").setup({
		transparent_bg = true,
  })

	local colorscheme = "codex"

	local status_ok, _ = pcall(vim.cmd.colorscheme, colorscheme)

	if not status_ok then
		print("failed to load colorscheme")
	end

	-- use lazy-loader
  require("lazy").setup("plugins")
	require("config").setup()
	require("after")
end

if vim.g.neovide then
	vim.o.guifont = "Hack_Nerd_Font"
	vim.g.neovide_cursor_animate_in_insert_mode = false
  vim.g.neovide_cursor_vfx_mode = "pixiedust"
	
		-- Helper function for transparency formatting
	local get_alpha = function()
		return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
	end
	-- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
	vim.g.neovide_transparency = 0.0
	vim.g.transparency = 0.8
	vim.g.neovide_background_color = "#282A36" .. get_alpha()
	vim.g.neovide_floating_blur_amount_x = 4.0
	vim.g.neovide_floating_blur_amount_y = 4.0
	
end