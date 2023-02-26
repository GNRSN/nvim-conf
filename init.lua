-- Import :plugins, should be at top
require("gnrsn.plugins-setup")

require("gnrsn.core.options")
require("gnrsn.core.keymaps")
require("gnrsn.core.colorscheme")

require("gnrsn.plugins.comment")
require("gnrsn.plugins.nvim-tree")
require("gnrsn.plugins.telescope")
require("gnrsn.plugins.nvim-cmp")
require("gnrsn.plugins.lsp.mason")
require("gnrsn.plugins.lsp.lspsaga")
require("gnrsn.plugins.lsp.lspconfig")
require("gnrsn.plugins.lsp.null-ls")
require("gnrsn.plugins.autopairs")

-- Highlighting and formatting for different languages
require("gnrsn.plugins.treesitter")

-- Git
require("gnrsn.plugins.gitsigns")
