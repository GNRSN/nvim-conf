-- Still need to figure out how to add these
vim.icons = {
	diagnostics = {
		Error = " ",
		Warn = " ",
		Hint = " ",
		Info = " ",
	},
	kinds = {
		Array = " ",
		Boolean = " ",
		Class = " ",
		Color = " ",
		Constant = " ",
		Constructor = " ",
		Copilot = " ",
		Enum = " ",
		EnumMember = " ",
		Event = " ",
		Field = " ",
		File = " ",
		Folder = " ",
		Function = " ",
		Interface = " ",
		Key = " ",
		Keyword = " ",
		Method = " ",
		Module = " ",
		Namespace = " ",
		Null = "ﳠ ",
		Number = " ",
		Object = " ",
		Operator = " ",
		Package = " ",
		Property = " ",
		Reference = " ",
		Snippet = " ",
		String = " ",
		Struct = " ",
		Text = " ",
		TypeParameter = " ",
		Unit = " ",
		Value = " ",
		Variable = " ",
	},
}

return {
	{
		"tjdevries/colorbuddy.nvim",
	},
	{
		"catppuccin/nvim",
		lazy = true,
		name = "catppuccin",
		flavour = "macchiato",

		opts = {
			color_overrides = {
				all = {
					-- 			text = "#cccccc",
					base = "#282a36", -- Default bg
					mantle = "#282a36", -- Darker bg
					crust = "#282a36", -- Darkest bg
					-- 			surface0 = "#3d3244", -- Darkest comment
					-- 			surface1 = "#3b4055", -- Darker comment
					-- 			surface2 = "#3c6047", -- Default comment
					-- 			rosewater = "#343647", --	Winbar
					-- 			flamingo = "#6801c2", -- Target word
					-- 			pink = "#ff79c6", --	Just pink
					-- 			mauve = "#579cd6", --	Tag const, import, etc
					-- 			red = "#d44c50", --	Error
					-- 			maroon = "#fa6982", --	Lighter red
					-- 			peach = "#9cdcfe", --	Number / variables names, etc
					-- 			yellow = "#45aa96", --	Warning / Classes
					-- 			green = "#e68567", --	Diff add / strings
					-- 			teal = "#aa0066", --	Hint
					-- 			sky = "#ffffff", --	Operator
					-- 			sapphire = "#f1f98c", --	Constructor
					-- 			blue = "#DCDCAA", --	Diff changed & JS functions & flolder names in neotree
					-- 			lavender = "#0451A5", --	CursorLine Nr & keys in lua map
					-- 			subtext1 = "#ffffff", --	Indicator
					-- 			subtext0 = "#12aa00", --	Float title
					-- 			overlay2 = "#aaa0f1", --	Popup fg
					-- 			overlay1 = "#0f6760", --	Conceal color
					-- 			overlay0 = "#6A9955", --	Foldcolor & comments
				},
				-- 		latte = {},
				-- 		frappe = {},
				-- 		macchiato = {},
				-- 		mocha = {},
			},
		},
		custom_highlights = function(colors)
			return {
				Comment = { fg = colors.teal },
				["@comment"] = { fg = colors.sapphire, style = { "italic" } },
			}
		end,
	},
}
