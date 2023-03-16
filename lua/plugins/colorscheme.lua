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
		"catppuccin/nvim",
		lazy = true,
		name = "catppuccin",
		opts = {
			color_overrides = {
				all = {
					text = "#cccccc",
					base = "#282a36", -- Default bg
					mantle = "#282a36", -- Darker bg
					crust = "#282a36", -- Darkest bg
					surface0 = "#3d3244", -- Darkest comment
					surface1 = "#3b4055", -- Darker comment
					surface2 = "#3c6047", -- Default comment
					rosewater = "#343647", --	Winbar
					flamingo = "#6801c2", -- Target word
					pink = "#ff79c6", --	Just pink
					mauve = "#579cd6", --	Tag const, import, etc
					red = "#d44c50", --	Error
					maroon = "#fa6982", --	Lighter red
					peach = "#9cdcfe", --	Number / variables names, etc
					yellow = "#45aa96", --	Warning / Classes
					green = "#e68567", --	Diff add / strings
					teal = "#808080", --	Hint
					sky = "#808080", --	Operator
					sapphire = "#f1f98c", --	Constructor
					blue = "#808080", --	Diff changed
					lavender = "#808080", --	CursorLine Nr
					subtext1 = "#808080", --	Indicator
					subtext0 = "#808080", --	Float title
					overlay2 = "#808080", --	Popup fg
					overlay1 = "#808080", --	Conceal color
					overlay0 = "#808080", --	Fold color
				},
				latte = {},
				frappe = {},
				macchiato = {},
				mocha = {},
			},
		},
	},
	{
		"askfiy/visual_studio_code",
		priority = 1000,
		config = function()
			require("visual_studio_code").setup({
				mode = "dark",
			})

			require("visual_studio_code.utils").hl.bulk_set({
				Normal = {
					--fg = "#cccccc", -- Normal text color
					bg = "#282a36", -- Background
				},
				NormalFloat = { link = "Normal" },
				Cursor = { bg = "#0FE1EE", bold = true },
			})
		end,
	},
	{
		'Yazeed1s/oh-lucy.nvim',
		name = 'oh-lucy',
	},
	{
		'tomasiser/vim-code-dark',
		name = 'codedark',
	},
	{
		'Mofiqul/dracula.nvim',
		name = 'dracula'
	}
}
