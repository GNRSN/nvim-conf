-- oh-lucy config
vim.g.oh_lucy_italic_functions = true
vim.g.oh_lucy_italic_comments = false

vim.cmd([[colorscheme oh-lucy]]) -- for oh-lucy
-- Night version:
-- vim.cmd[[colorscheme oh-lucy-evening]] -- for oh-lucy-evening

local status, _ = pcall(vim.cmd, "colorschme oh-lucy")
if not status then
	print("Colorscheme not found")
	return
end
