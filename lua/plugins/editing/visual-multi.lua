-- NOTE: Since this is a vim plugin, these has to be defined before the plugin loads

-- Mappings https://github.com/mg979/vim-visual-multi/wiki/Mappings#full-mappings-list
vim.g.VM_default_mappings = 0

vim.g.VM_maps = {
  ["Find Under"] = "<C-s>",
  ["Find Subword Under"] = "<C-s>",
  ["Undo"] = "u",
  ["Redo"] = "<C-r>",
}

-- Highlights
vim.g.VM_Mono_hl = "VMMono" --highlight in cursor mode
vim.g.VM_Extend_hl = "VMExtend" --highlight in extend mode (the selections)
vim.g.VM_Cursor_hl = "VMCursor" --highlight in extend mode (the cursors)
vim.g.VM_Insert_hl = "VMInsert" --highlight in insert mode (the virtual cursors)

vim.g.VM_highlight_matches = "red"

-- Disable statusline since it interferes with lualine
vim.g.VM_set_statusline = 0

return {
  -- Multi cursor
  {
    "mg979/vim-visual-multi",
    keys = {
      { "<C-s>", "<Plug>(VM-Find-Subword-Under)", mode = "v" },
    },
  },
}
