local colorscheme = require("colorscheme")
local configs = colorscheme.configs()
local colors = colorscheme.colors()

local bg = colors.bg or configs.lualine_bg_color or colors.black

local normal = {
	a = { fg = colors.bg, bg = colors.white, gui = "bold" },
	b = { fg = colors.white, bg = bg },
	c = { fg = colors.fg, bg = bg },
}

local command = {
	a = { fg = colors.bg, bg = colors.yellow_sunflower, gui = "bold" },
	b = { fg = colors.yellow_sunflower, bg = bg },
}

local visual = {
	a = { fg = colors.black, bg = colors.green, gui = "bold" },
	b = { fg = colors.green, bg = bg },
}

local inactive = {
	a = { fg = colors.white, bg = colors.visual, gui = "bold" },
	b = { fg = colors.black, bg = colors.white },
}

local replace = {
	a = { fg = colors.black, bg = colors.orange, gui = "bold" },
	b = { fg = colors.orange, bg = bg },
	c = { fg = colors.fg, bg = bg },
}

local insert = {
	a = { fg = colors.black, bg = colors.blue, gui = "bold" },
	b = { fg = colors.blue, bg = bg },
	c = { fg = colors.fg, bg = bg },
}

return {
	normal = normal,
	command = command,
	visual = visual,
	inactive = inactive,
	replace = replace,
	insert = insert,
}
