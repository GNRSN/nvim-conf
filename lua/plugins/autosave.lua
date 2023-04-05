return {
	{
		"pocco81/auto-save.nvim",
		opts = {
			enabled = false,
			condition = function(buf)
				local fn = vim.fn
				local utils = require("auto-save.utils.data")

				if
					fn.getbufvar(buf, "&modifiable") == 1
					and fn.isdirectory(".git") ~= 0 -- Is in a git directory
					and utils.not_in(fn.getbufvar(buf, "&filetype"), {})
				then
					return true -- met condition(s), can save
				end
				return false -- can't save
			end,
		},
	},
}
