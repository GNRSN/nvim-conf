-- start screen
return {
	-- REVIEW: I don't understand why this would be needed, remove later
	-- -- disable alpha
	-- { "goolord/alpha-nvim", enabled = false },

	-- ascii for dashboard
	{
		"MaximilianLloyd/ascii.nvim",
		requires = {
			"MunifTanjim/nui.nvim",
		},
	},
	-- enable dashboard
	{
		"glepnir/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				-- config
				-- theme = 'doom',
				-- config = {
				--   --your header
				--   header = {

				--   },
				--   center = {
				--     {
				--       icon = ' ',
				--       icon_hl = 'Title',
				--       desc = 'Find File           ',
				--       desc_hl = 'String',
				--       key = 'b',
				--       keymap = 'SPC f f',
				--       key_hl = 'Number',
				--       action = 'lua print(2)'
				--     },
				--     {
				--       icon = ' ',
				--       desc = 'Find Dotfiles',
				--       key = 'f',
				--       keymap = 'SPC f d',
				--       action = 'lua print(3)'
				--     },
				--   },
				--   footer = {}  --your footer
				-- }

				theme = "hyper",
				config = {
					-- week_header = {
					--   enable = true,
					-- },
					header = require("ascii.").art.text.neovim.sharp,
					shortcut = {
						{ desc = " Update", group = "@property", action = "Lazy update", key = "u" },
						{
							desc = " Files",
							group = "Label",
							action = "Telescope find_files",
							key = "f",
						},
						{
							desc = " Apps",
							group = "DiagnosticHint",
							action = "Telescope app",
							key = "a",
						},
						{
							desc = " dotfiles",
							group = "Number",
							action = "Telescope dotfiles",
							key = "d",
						},
					},
				},
			})
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
}
