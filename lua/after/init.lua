require("codex").setup()
local colorscheme = "codex"

local status_ok, _ = pcall(vim.cmd.colorscheme, colorscheme)

if not status_ok then
	print("failed to load colorscheme")
end
