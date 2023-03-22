-- require("lua.config.keymaps")
-- require("lua.config.options")

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
	-- use lazy-loader
    require("lazy").setup("plugins")
		require("config").setup()
	require("after")
end

if vim.g.neovide then
	vim.o.guifont = "Hack_Nerd_Font"
	vim.g.neovide_cursor_animate_in_insert_mode = false
	vim.g.neovide_cursor_vfx_mode = "pixiedust"
end