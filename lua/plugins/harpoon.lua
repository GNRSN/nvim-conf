local function nmap(l, r, desc)
	vim.keymap.set("n", l, r, { desc = desc })
end

return {
	{
		"ThePrimeagen/harpoon",
		config = function()
			local harpoon = require("harpoon")

			harpoon.setup({})

			nmap("<leader>hm", require("harpoon.mark").add_file, "Harpoon mark")
			nmap("<leader>hl", require("harpoon.ui").toggle_quick_menu, "Harpoon toggle menu")

			for i = 1, 5 do
				nmap(string.format("g%s", i), function()
					require("harpoon.ui").nav_file(i)
				end, { desc = string.format("Navigate to harpoon (%s)", i) })
			end
		end,
	},
}
