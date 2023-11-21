local o = vim.o
local g = vim.g
local cmd = vim.cmd
local nvim_set_hl = vim.api.nvim_set_hl
local tbl_deep_extend = vim.tbl_deep_extend

---@class DefaultConfig
---@field italic_comment boolean
---@field transparent_bg boolean
---@field show_end_of_buffer boolean
---@field lualine_bg_color string?
---@field colors Palette
---@field overrides table<string, Highlight>
local DEFAULT_CONFIG = {
	italic_comment = false,
	transparent_bg = false,
	show_end_of_buffer = false,
	lualine_bg_color = nil,
	colors = require("codex.palette"),
	overrides = {},
}

-- NeoTreeBufferNumber       The buffer number shown in the buffers source.
-- NeoTreeCursorLine         |hl-CursorLine| override in Neo-tree window.
-- NeoTreeDimText            Greyed out text used in various places.
-- NeoTreeDirectoryIcon      Directory icon.
-- NeoTreeDirectoryName      Directory name.
-- NeoTreeDotfile            Used for icons and names when dotfiles are filtered.
-- NeoTreeFileIcon           File icon, when not overridden by devicons.
-- NeoTreeFileName           File name, when not overwritten by another status.
-- NeoTreeFileNameOpened     File name when the file is open. Not used yet.
-- NeoTreeFilterTerm         The filter term, as displayed in the root node.
-- NeoTreeFloatBorder        The border for pop-up windows.
-- NeoTreeFloatTitle         Used for the title text of pop-ups when the border-style
--                           is set to another style than "NC". This is derived
--                           from NeoTreeFloatBorder.
-- NeoTreeTitleBar           Used for the title bar of pop-ups, when the border-style
--                           is set to "NC". This is derived from NeoTreeFloatBorder.
-- NeoTreeGitAdded           File name when the git status is added.
-- NeoTreeGitConflict        File name when the git status is conflict.
-- NeoTreeGitDeleted         File name when the git status is deleted.
-- NeoTreeGitIgnored         File name when the git status is ignored.
-- NeoTreeGitModified        File name when the git status is modified.
-- NeoTreeGitUnstaged        Used for git unstaged symbol.
-- NeoTreeGitUntracked       File name when the git status is untracked.
-- NeoTreeGitStaged          Used for git staged symbol.
-- NeoTreeHiddenByName       Used for icons and names when `hide_by_name` is used.
-- NeoTreeIndentMarker       The style of indentation markers (guides). By default,
--                           the "Normal" highlight is used.
-- NeoTreeExpander           Used for collapsed/expanded icons.
-- NeoTreeNormal             |hl-Normal| override in Neo-tree window.
-- NeoTreeNormalNC           |hl-NormalNC| override in Neo-tree window.
-- NeoTreeSignColumn         |hl-SignColumn| override in Neo-tree window.
-- NeoTreeStatusLine         |hl-StatusLine| override in Neo-tree window.
-- NeoTreeStatusLineNC       |hl-StatusLineNC| override in Neo-tree window.
-- NeoTreeVertSplit          |hl-VertSplit| override in Neo-tree window.
-- NeoTreeWinSeparator       |hl-WinSeparator| override in Neo-tree window.
-- NeoTreeEndOfBuffer        |hl-EndOfBuffer| override in Neo-tree window.
-- NeoTreeRootName           The name of the root node.
-- NeoTreeSymbolicLinkTarget Symbolic link target.
-- NeoTreeTitleBar           Used for the title bar of pop-ups, when the border-style
--                           is set to "NC". This is derived from NeoTreeFloatBorder.
-- NeoTreeWindowsHidden      Used for icons and names that are hidden on Windows.

local TRANSPARENTS = {
	"Normal",
	"SignColumn",
	"NeoTreeNormal",
	"NeoTreeNormalNC",
}

local function apply_term_colors(colors)
	g.terminal_color_0 = colors.black
	g.terminal_color_1 = colors.red
	g.terminal_color_2 = colors.green
	g.terminal_color_3 = colors.yellow
	g.terminal_color_4 = colors.purple
	g.terminal_color_5 = colors.pink
	g.terminal_color_6 = colors.cyan
	g.terminal_color_7 = colors.white
	g.terminal_color_8 = colors.selection
	g.terminal_color_9 = colors.bright_red
	g.terminal_color_10 = colors.bright_green
	g.terminal_color_11 = colors.bright_yellow
	g.terminal_color_12 = colors.bright_blue
	g.terminal_color_13 = colors.bright_magenta
	g.terminal_color_14 = colors.bright_cyan
	g.terminal_color_15 = colors.bright_white
	g.terminal_color_background = colors.bg
	g.terminal_color_foreground = colors.fg
end

---apply colorscheme
---@param configs DefaultConfig
local function apply(configs)
	local colors = configs.colors
	apply_term_colors(colors)
	local groups = require("codex.groups").setup(configs)

	-- apply transparents
	if configs.transparent_bg then
		for _, group in ipairs(TRANSPARENTS) do
			groups[group].bg = nil
		end
	end

	for group, setting in pairs(configs.overrides) do
		groups[group] = setting
	end

	-- set defined highlights
	for group, setting in pairs(groups) do
		nvim_set_hl(0, group, setting)
	end
end

local local_configs = DEFAULT_CONFIG

---setup colorscheme
---@param configs DefaultConfig?
local function setup(configs)
	if type(configs) == "table" then
		local_configs = tbl_deep_extend("force", DEFAULT_CONFIG, configs) --[[@as DefaultConfig]]
	end
end

---load colorscheme
local function load()
	if vim.version().minor < 7 then
		vim.notify_once("codex.nvim: you must use neovim 0.7 or higher")
		return
	end

	-- reset colors
	if g.colors_name then
		cmd("hi clear")
	end

	if vim.fn.exists("syntax_on") then
		cmd("syntax reset")
	end

	o.background = "dark"
	o.termguicolors = true
	g.colors_name = "codex"

	apply(local_configs)
end

return {
	load = load,
	setup = setup,
	configs = function()
		return local_configs
	end,
	colors = function()
		return local_configs.colors
	end,
}
