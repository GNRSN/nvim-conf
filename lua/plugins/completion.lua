return {
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-nvim-lua" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "onsails/lspkind-nvim" },
	{ "tjdevries/complextras.nvim" },
	{ "saadparwaiz1/cmp_luasnip", dependencies = { "L3MON4D3/LuaSnip" } },
	{
		"David-Kunz/cmp-npm",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"hrsh7th/nvim-cmp",
		-- config from TJ
		config = function()
			vim.opt.completeopt = { "menu", "menuone", "noselect" }

			-- Complextras.nvim configuration
			vim.api.nvim_set_keymap(
				"i",
				"<C-x><C-m>",
				[[<c-r>=luaeval("require('complextras').complete_matching_line()")<CR>]],
				{ noremap = true }
			)

			-- REVIEW: What does this do?
			-- Don't show the dumb matching stuff.
			vim.opt.shortmess:append("c")

			vim.api.nvim_set_keymap(
				"i",
				"<C-x><C-d>",
				[[<c-r>=luaeval("require('complextras').complete_line_from_cwd()")<CR>]],
				{ noremap = true }
			)

			local ok, lspkind = pcall(require, "lspkind")
			if not ok then
				return
			end

			lspkind.init({
				symbol_map = {
					Copilot = "",
				},
			})

			local cmp = require("cmp")

			cmp.setup({
				mapping = {
					["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-e>"] = cmp.mapping.abort(),
					["<c-i>"] = cmp.mapping(
						cmp.mapping.confirm({
							behavior = cmp.ConfirmBehavior.Insert,
							select = true,
						}),
						{ "i", "c" }
					),
					["<M-y>"] = cmp.mapping(
						cmp.mapping.confirm({
							behavior = cmp.ConfirmBehavior.Replace,
							select = false,
						}),
						{ "i", "c" }
					),

					["<c-space>"] = cmp.mapping({
						i = cmp.mapping.complete(),
						c = function(
							_ --[[fallback]]
						)
							if cmp.visible() then
								if not cmp.confirm({ select = true }) then
									return
								end
							else
								cmp.complete()
							end
						end,
					}),
					["<tab>"] = cmp.config.disable,
					["<c-q>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = false,
					}),
				},
				--    the order of your sources matter (by default). That gives them priority
				--    you can configure:
				--        keyword_length
				--        priority
				--        max_item_count
				--        (more?)
				sources = cmp.config.sources({
					{ name = "nvim_lua" },
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "npm", keyword_length = 3 },
				}, {
					{ name = "path" },
					{ name = "buffer", keyword_length = 5 },
				}, {}),

				sorting = {
					-- TODO: Would be cool to add stuff like "See variable names before method names" in rust, or something like that.
					comparators = {
						cmp.config.compare.offset,
						cmp.config.compare.exact,
						cmp.config.compare.score,

						-- copied from cmp-under, but I don't think I need the plugin for this.
						-- I might add some more of my own.
						function(entry1, entry2)
							local _, entry1_under = entry1.completion_item.label:find("^_+")
							local _, entry2_under = entry2.completion_item.label:find("^_+")
							entry1_under = entry1_under or 0
							entry2_under = entry2_under or 0
							if entry1_under > entry2_under then
								return false
							elseif entry1_under < entry2_under then
								return true
							end
						end,

						cmp.config.compare.kind,
						cmp.config.compare.sort_text,
						cmp.config.compare.length,
						cmp.config.compare.order,
					},
				},

				-- Youtube: mention that you need a separate snippets plugin
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},

				formatting = {
					-- Youtube: How to set up nice formatting for your sources.
					format = lspkind.cmp_format({
						with_text = true,
						menu = {
							buffer = "[buf]",
							nvim_lsp = "[LSP]",
							nvim_lua = "[api]",
							path = "[path]",
							luasnip = "[snip]",
							gh_issues = "[issues]",
							tn = "[TabNine]",
							eruby = "[erb]",
						},
					}),
				},

				experimental = {
					-- I like the new menu better! Nice work hrsh7th
					native_menu = false,

					-- Let's play with this for a day or two
					ghost_text = false,
				},
			})
		end,
	},
}
