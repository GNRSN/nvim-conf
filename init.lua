if vim.g.vscode then
	-- VSCode extension
	require("vscode")
else
	-- ordinary Neovim
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

	if vim.g.neovide then
		require("neovide")
	end
end
