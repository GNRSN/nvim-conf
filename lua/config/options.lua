vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt -- for conciseness

opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 3 -- Hide * markup for bold and italic
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.cursorline = true -- Enable highlighting of the current line
opt.expandtab = true -- Use spaces instead of tabs
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true -- Ignore case
opt.inccommand = "nosplit" -- preview incremental substitute
opt.laststatus = 0
opt.list = true -- Show some invisible characters (tabs...
opt.mouse = "a" -- Enable mouse mode
opt.number = true -- Print line number
opt.pumblend = 0 -- Popup blend
opt.pumheight = 11 -- Maximum number of entries in a popup
opt.relativenumber = true -- Relative line numbers
opt.ruler = false -- Hides the row+col coordinates to the bottom right
opt.scrolloff = 4 -- Lines of context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Size of an indent
opt.showcmd = false -- Dont show command being written out in bottom right
opt.showmode = false -- Dont show mode since we have a statusline doing that
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.spelllang = { "en" }
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
opt.tabstop = 2 -- Number of spaces tabs count for
opt.termguicolors = true -- True color support
opt.timeoutlen = 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.wildmode = "longest:full,full" -- Command-line completion mode
---@diagnostic disable-next-line: assign-type-mismatch
opt.wildcharm = ("<Tab>"):byte() -- Set wildcharm, see https://github.com/neovim/neovim/issues/18000 for why :byte
opt.winminwidth = 5 -- Minimum window width
opt.wrap = false -- Disable line wrap
opt.splitkeep = "screen"
vim.g.incsearch = true
vim.g.hlsearch = true
-- Hide messages
opt.shortmess:append({
  I = true,
  c = true,
  C = true,
  s = true,
})

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
