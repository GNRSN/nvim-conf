local get_noice_mode = function()
  local noice = pcall(require, "noice")

  if not noice then
    return nil
  end

  return {
    -- Displays "recording" when recording macro, maybe other modes as well?
    ---@diagnostic disable-next-line: deprecated, undefined-field
    require("noice").api.statusline.mode.get,
    ---@diagnostic disable-next-line: deprecated, undefined-field
    cond = require("noice").api.statusline.mode.has,
    color = { fg = require("colorscheme.palette").bright_magenta },
  }
end

return {
  -- Customizable status line
  {
    "nvim-lualine/lualine.nvim",
    event = "UIEnter",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = require("colorscheme.status-line"),
          component_separators = "|",
          section_separators = "",
          disabled_filetypes = {
            statusline = {
              "neo-tree",
            },
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff" },
          lualine_c = {
            "filename",
            get_noice_mode(),
          },
          lualine_x = {
            "diagnostics",
          },
          lualine_y = { "filetype" },
          lualine_z = {},
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = {
            -- lsp_segment,
            "diagnostics",
          },
          lualine_y = { "filetype" },
          lualine_z = {},
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {},
      })
    end,
  },
}
